From: Michael Roth <michael.roth@amd.com>
Date: Mon, 18 Sep 2023 11:36:47 -0500
Subject: [RFC PATCH v12 14/33] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl()
 for guest-specific backing memory
In-Reply-To: <20230914015531.1419405-15-seanjc@google.com>
References: <20230914015531.1419405-1-seanjc@google.com>
 <20230914015531.1419405-15-seanjc@google.com>
Message-ID: <20230918163647.m6bjgwusc7ww5tyu@amd.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Sep 13, 2023 at 06:55:12PM -0700, Sean Christopherson wrote:
> TODO
> 
> Cc: Fuad Tabba <tabba@google.com>
> Cc: Vishal Annapurve <vannapurve@google.com>
> Cc: Ackerley Tng <ackerleytng@google.com>
> Cc: Jarkko Sakkinen <jarkko@kernel.org>
> Cc: Maciej Szmigiero <mail@maciej.szmigiero.name>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Quentin Perret <qperret@google.com>
> Cc: Michael Roth <michael.roth@amd.com>
> Cc: Wang <wei.w.wang@intel.com>
> Cc: Liam Merwick <liam.merwick@oracle.com>
> Cc: Isaku Yamahata <isaku.yamahata@gmail.com>
> Co-developed-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Co-developed-by: Yu Zhang <yu.c.zhang@linux.intel.com>
> Signed-off-by: Yu Zhang <yu.c.zhang@linux.intel.com>
> Co-developed-by: Chao Peng <chao.p.peng@linux.intel.com>
> Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
> Co-developed-by: Ackerley Tng <ackerleytng@google.com>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> Co-developed-by: Isaku Yamahata <isaku.yamahata@intel.com>
> Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  include/linux/kvm_host.h   |  48 +++
>  include/uapi/linux/kvm.h   |  15 +-
>  include/uapi/linux/magic.h |   1 +
>  virt/kvm/Kconfig           |   4 +
>  virt/kvm/Makefile.kvm      |   1 +
>  virt/kvm/guest_mem.c       | 593 +++++++++++++++++++++++++++++++++++++
>  virt/kvm/kvm_main.c        |  61 +++-
>  virt/kvm/kvm_mm.h          |  38 +++
>  8 files changed, 756 insertions(+), 5 deletions(-)
>  create mode 100644 virt/kvm/guest_mem.c
> 

<snip>

> +static long kvm_gmem_punch_hole(struct inode *inode, loff_t offset, loff_t len)
> +{
> +	struct list_head *gmem_list = &inode->i_mapping->private_list;
> +	pgoff_t start = offset >> PAGE_SHIFT;
> +	pgoff_t end = (offset + len) >> PAGE_SHIFT;
> +	struct kvm_gmem *gmem;
> +
> +	/*
> +	 * Bindings must stable across invalidation to ensure the start+end
> +	 * are balanced.
> +	 */
> +	filemap_invalidate_lock(inode->i_mapping);
> +
> +	list_for_each_entry(gmem, gmem_list, entry) {
> +		kvm_gmem_invalidate_begin(gmem, start, end);

In v11 we used to call truncate_inode_pages_range() here to drop filemap's
reference on the folio. AFAICT the folios are only getting free'd upon
guest shutdown without this. Was this on purpose?

> +		kvm_gmem_invalidate_end(gmem, start, end);
> +	}
> +
> +	filemap_invalidate_unlock(inode->i_mapping);
> +
> +	return 0;
> +}
> +
> +static long kvm_gmem_allocate(struct inode *inode, loff_t offset, loff_t len)
> +{
> +	struct address_space *mapping = inode->i_mapping;
> +	pgoff_t start, index, end;
> +	int r;
> +
> +	/* Dedicated guest is immutable by default. */
> +	if (offset + len > i_size_read(inode))
> +		return -EINVAL;
> +
> +	filemap_invalidate_lock_shared(mapping);

We take the filemap lock here, but not for
kvm_gmem_get_pfn()->kvm_gmem_get_folio(). Is it needed there as well?

> +
> +	start = offset >> PAGE_SHIFT;
> +	end = (offset + len) >> PAGE_SHIFT;
> +
> +	r = 0;
> +	for (index = start; index < end; ) {
> +		struct folio *folio;
> +
> +		if (signal_pending(current)) {
> +			r = -EINTR;
> +			break;
> +		}
> +
> +		folio = kvm_gmem_get_folio(inode, index);
> +		if (!folio) {
> +			r = -ENOMEM;
> +			break;
> +		}
> +
> +		index = folio_next_index(folio);
> +
> +		folio_unlock(folio);
> +		folio_put(folio);
> +
> +		/* 64-bit only, wrapping the index should be impossible. */
> +		if (WARN_ON_ONCE(!index))
> +			break;
> +
> +		cond_resched();
> +	}
> +
> +	filemap_invalidate_unlock_shared(mapping);
> +
> +	return r;
> +}
> +

<snip>

> +static int __kvm_gmem_create(struct kvm *kvm, loff_t size, struct vfsmount *mnt)
> +{
> +	const char *anon_name = "[kvm-gmem]";
> +	const struct qstr qname = QSTR_INIT(anon_name, strlen(anon_name));
> +	struct kvm_gmem *gmem;
> +	struct inode *inode;
> +	struct file *file;
> +	int fd, err;
> +
> +	inode = alloc_anon_inode(mnt->mnt_sb);
> +	if (IS_ERR(inode))
> +		return PTR_ERR(inode);
> +
> +	err = security_inode_init_security_anon(inode, &qname, NULL);
> +	if (err)
> +		goto err_inode;
> +
> +	inode->i_private = (void *)(unsigned long)flags;

The 'flags' argument isn't added until the subsequent patch that adds THP
support.

<snip>

> +static bool kvm_gmem_is_valid_size(loff_t size, u64 flags)
> +{
> +	if (size < 0 || !PAGE_ALIGNED(size))
> +		return false;
> +
> +	return true;
> +}
> +
> +int kvm_gmem_create(struct kvm *kvm, struct kvm_create_guest_memfd *args)
> +{
> +	loff_t size = args->size;
> +	u64 flags = args->flags;
> +	u64 valid_flags = 0;
> +
> +	if (flags & ~valid_flags)
> +		return -EINVAL;
> +
> +	if (!kvm_gmem_is_valid_size(size, flags))
> +		return -EINVAL;
> +
> +	return __kvm_gmem_create(kvm, size, flags, kvm_gmem_mnt);
> +}
> +
> +int kvm_gmem_bind(struct kvm *kvm, struct kvm_memory_slot *slot,
> +		  unsigned int fd, loff_t offset)
> +{
> +	loff_t size = slot->npages << PAGE_SHIFT;
> +	unsigned long start, end, flags;
> +	struct kvm_gmem *gmem;
> +	struct inode *inode;
> +	struct file *file;
> +
> +	BUILD_BUG_ON(sizeof(gfn_t) != sizeof(slot->gmem.pgoff));
> +
> +	file = fget(fd);
> +	if (!file)
> +		return -EBADF;
> +
> +	if (file->f_op != &kvm_gmem_fops)
> +		goto err;
> +
> +	gmem = file->private_data;
> +	if (gmem->kvm != kvm)
> +		goto err;
> +
> +	inode = file_inode(file);
> +	flags = (unsigned long)inode->i_private;
> +
> +	/*
> +	 * For simplicity, require the offset into the file and the size of the
> +	 * memslot to be aligned to the largest possible page size used to back
> +	 * the file (same as the size of the file itself).
> +	 */
> +	if (!kvm_gmem_is_valid_size(offset, flags) ||
> +	    !kvm_gmem_is_valid_size(size, flags))
> +		goto err;

I needed to relax this check for SNP. KVM_GUEST_MEMFD_ALLOW_HUGEPAGE
applies to entire gmem inode, so it makes sense for userspace to enable
hugepages if start/end are hugepage-aligned, but QEMU will do things
like map overlapping regions for ROMs and other things on top of the
GPA range that the gmem inode was originally allocated for. For
instance:

  692500 at 1689108688.696338:kvm_set_user_memory AddrSpace#0 Slot#0 flags=0x4 gpa=0x0 size=0x80000000 ua=0x7fbf5be00000 ret=0 restricted_fd=19 restricted_offset=0x0
  692500 at 1689108688.699802:kvm_set_user_memory AddrSpace#0 Slot#1 flags=0x4 gpa=0x100000000 size=0x380000000 ua=0x7fbfdbe00000 ret=0 restricted_fd=19 restricted_offset=0x80000000
  692500 at 1689108688.795412:kvm_set_user_memory AddrSpace#0 Slot#0 flags=0x0 gpa=0x0 size=0x0 ua=0x7fbf5be00000 ret=0 restricted_fd=19 restricted_offset=0x0
  692500 at 1689108688.795550:kvm_set_user_memory AddrSpace#0 Slot#0 flags=0x4 gpa=0x0 size=0xc0000 ua=0x7fbf5be00000 ret=0 restricted_fd=19 restricted_offset=0x0
  692500 at 1689108688.796227:kvm_set_user_memory AddrSpace#0 Slot#6 flags=0x4 gpa=0x100000 size=0x7ff00000 ua=0x7fbf5bf00000 ret=0 restricted_fd=19 restricted_offset=0x100000

Because of that the KVM_SET_USER_MEMORY_REGIONs for non-THP-aligned GPAs
will fail. Maybe instead it should be allowed, and kvm_gmem_get_folio()
should handle the alignment checks on a case-by-case and simply force 4k
for offsets corresponding to unaligned bindings?

-Mike

