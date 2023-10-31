From: Fuad Tabba <tabba@google.com>
Date: Tue, 31 Oct 2023 15:05:45 +0000
Subject: [PATCH v13 16/35] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
In-Reply-To: <20231027182217.3615211-17-seanjc@google.com>
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-17-seanjc@google.com>
Message-ID: <CA+EHjTzj4drYKONVOLP19DYpJ4O8kSXcFzw2AKier1QdcFKx_Q@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

On Fri, Oct 27, 2023 at 7:23?PM Sean Christopherson <seanjc@google.com> wrote:

...

> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index e2252c748fd6..e82c69d5e755 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -6079,6 +6079,15 @@ applied.
>  :Parameters: struct kvm_userspace_memory_region2 (in)
>  :Returns: 0 on success, -1 on error
>
> +KVM_SET_USER_MEMORY_REGION2 is an extension to KVM_SET_USER_MEMORY_REGION that
> +allows mapping guest_memfd memory into a guest.  All fields shared with
> +KVM_SET_USER_MEMORY_REGION identically.  Userspace can set KVM_MEM_PRIVATE in
> +flags to have KVM bind the memory region to a given guest_memfd range of
> +[guest_memfd_offset, guest_memfd_offset + memory_size].  The target guest_memfd
> +must point at a file created via KVM_CREATE_GUEST_MEMFD on the current VM, and
> +the target range must not be bound to any other memory region.  All standard
> +bounds checks apply (use common sense).
> +

Bikeshedding here: Not sure if KVM_MEM_PRIVATE is the best name for
this. It gets confusing with KVM_MEMORY_ATTRIBUTE_PRIVATE, i.e., that
a region marked as KVM_MEM_PRIVATE is only potentially private. It did
confuse the rest of the team when I walked them through a previous
version of this code once. Would something like KVM_MEM_GUESTMEM make
more sense?

>  ::
>
>    struct kvm_userspace_memory_region2 {
> @@ -6087,9 +6096,24 @@ applied.
>         __u64 guest_phys_addr;
>         __u64 memory_size; /* bytes */
>         __u64 userspace_addr; /* start of the userspace allocated memory */
> +  __u64 guest_memfd_offset;
> +       __u32 guest_memfd;
> +       __u32 pad1;
> +       __u64 pad2[14];
>    };
>
> -See KVM_SET_USER_MEMORY_REGION.
> +A KVM_MEM_PRIVATE region _must_ have a valid guest_memfd (private memory) and
> +userspace_addr (shared memory).  However, "valid" for userspace_addr simply
> +means that the address itself must be a legal userspace address.  The backing
> +mapping for userspace_addr is not required to be valid/populated at the time of
> +KVM_SET_USER_MEMORY_REGION2, e.g. shared memory can be lazily mapped/allocated
> +on-demand.

Regarding requiring that a private region have both a valid
guest_memfd and a userspace_addr, should this be
implementation-specific? In pKVM at least, all regions for protected
VMs are private, and KVM doesn't care about the host userspace address
for those regions even when part of the memory is shared.

> +When mapping a gfn into the guest, KVM selects shared vs. private, i.e consumes
> +userspace_addr vs. guest_memfd, based on the gfn's KVM_MEMORY_ATTRIBUTE_PRIVATE
> +state.  At VM creation time, all memory is shared, i.e. the PRIVATE attribute
> +is '0' for all gfns.  Userspace can control whether memory is shared/private by
> +toggling KVM_MEMORY_ATTRIBUTE_PRIVATE via KVM_SET_MEMORY_ATTRIBUTES as needed.

In pKVM, guest memory is private by default, and most of it will
remain so for the lifetime of the VM. Userspace could explicitly mark
all the guest's memory as private at initialization, but it would save
a slight amount of work. That said, I understand that it might be
better to be consistent across implementations.

...

> --- /dev/null
> +++ b/virt/kvm/guest_memfd.c
> @@ -0,0 +1,548 @@
> +// SPDX-License-Identifier: GPL-2.0
> +#include <linux/backing-dev.h>
> +#include <linux/falloc.h>
> +#include <linux/kvm_host.h>
> +#include <linux/pagemap.h>
> +#include <linux/anon_inodes.h>

nit: should this include be first (to maintain alphabetical ordering
of the includes)?

> +
> +#include "kvm_mm.h"
> +
> +struct kvm_gmem {
> +       struct kvm *kvm;
> +       struct xarray bindings;
> +       struct list_head entry;
> +};
> +
> +static struct folio *kvm_gmem_get_folio(struct inode *inode, pgoff_t index)
> +{
> +       struct folio *folio;
> +
> +       /* TODO: Support huge pages. */
> +       folio = filemap_grab_folio(inode->i_mapping, index);
> +       if (IS_ERR_OR_NULL(folio))
> +               return NULL;
> +
> +       /*
> +        * Use the up-to-date flag to track whether or not the memory has been
> +        * zeroed before being handed off to the guest.  There is no backing
> +        * storage for the memory, so the folio will remain up-to-date until
> +        * it's removed.
> +        *
> +        * TODO: Skip clearing pages when trusted firmware will do it when
> +        * assigning memory to the guest.
> +        */
> +       if (!folio_test_uptodate(folio)) {
> +               unsigned long nr_pages = folio_nr_pages(folio);
> +               unsigned long i;
> +
> +               for (i = 0; i < nr_pages; i++)
> +                       clear_highpage(folio_page(folio, i));
> +
> +               folio_mark_uptodate(folio);
> +       }
> +
> +       /*
> +        * Ignore accessed, referenced, and dirty flags.  The memory is
> +        * unevictable and there is no storage to write back to.
> +        */
> +       return folio;
> +}
> +
> +static void kvm_gmem_invalidate_begin(struct kvm_gmem *gmem, pgoff_t start,
> +                                     pgoff_t end)
> +{
> +       bool flush = false, found_memslot = false;
> +       struct kvm_memory_slot *slot;
> +       struct kvm *kvm = gmem->kvm;
> +       unsigned long index;
> +
> +       xa_for_each_range(&gmem->bindings, index, slot, start, end - 1) {
> +               pgoff_t pgoff = slot->gmem.pgoff;
> +
> +               struct kvm_gfn_range gfn_range = {
> +                       .start = slot->base_gfn + max(pgoff, start) - pgoff,
> +                       .end = slot->base_gfn + min(pgoff + slot->npages, end) - pgoff,
> +                       .slot = slot,
> +                       .may_block = true,
> +               };
> +
> +               if (!found_memslot) {
> +                       found_memslot = true;
> +
> +                       KVM_MMU_LOCK(kvm);
> +                       kvm_mmu_invalidate_begin(kvm);
> +               }
> +
> +               flush |= kvm_mmu_unmap_gfn_range(kvm, &gfn_range);
> +       }
> +
> +       if (flush)
> +               kvm_flush_remote_tlbs(kvm);
> +
> +       if (found_memslot)
> +               KVM_MMU_UNLOCK(kvm);
> +}
> +
> +static void kvm_gmem_invalidate_end(struct kvm_gmem *gmem, pgoff_t start,
> +                                   pgoff_t end)
> +{
> +       struct kvm *kvm = gmem->kvm;
> +
> +       if (xa_find(&gmem->bindings, &start, end - 1, XA_PRESENT)) {
> +               KVM_MMU_LOCK(kvm);
> +               kvm_mmu_invalidate_end(kvm);
> +               KVM_MMU_UNLOCK(kvm);
> +       }
> +}
> +
> +static long kvm_gmem_punch_hole(struct inode *inode, loff_t offset, loff_t len)
> +{
> +       struct list_head *gmem_list = &inode->i_mapping->private_list;
> +       pgoff_t start = offset >> PAGE_SHIFT;
> +       pgoff_t end = (offset + len) >> PAGE_SHIFT;
> +       struct kvm_gmem *gmem;
> +
> +       /*
> +        * Bindings must stable across invalidation to ensure the start+end

nit: Bindings must _be/stay?_ stable

...

> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 78a0b09ef2a5..5d1a2f1b4e94 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -798,7 +798,7 @@ void kvm_mmu_invalidate_range_add(struct kvm *kvm, gfn_t start, gfn_t end)
>         }
>  }
>
> -static bool kvm_mmu_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range)
> +bool kvm_mmu_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range)
>  {
>         kvm_mmu_invalidate_range_add(kvm, range->start, range->end);
>         return kvm_unmap_gfn_range(kvm, range);
> @@ -1034,6 +1034,9 @@ static void kvm_destroy_dirty_bitmap(struct kvm_memory_slot *memslot)
>  /* This does not remove the slot from struct kvm_memslots data structures */
>  static void kvm_free_memslot(struct kvm *kvm, struct kvm_memory_slot *slot)
>  {
> +       if (slot->flags & KVM_MEM_PRIVATE)
> +               kvm_gmem_unbind(slot);
> +

Should this be called after kvm_arch_free_memslot()? Arch-specific ode
might need some of the data before the unbinding, something I thought
might be necessary at one point for the pKVM port when deleting a
memslot, but realized later that kvm_invalidate_memslot() ->
kvm_arch_guest_memory_reclaimed() was the more logical place for it.
Also, since that seems to be the pattern for arch-specific handlers in
KVM.

>         kvm_destroy_dirty_bitmap(slot);
>
>         kvm_arch_free_memslot(kvm, slot);

...

Cheers,
/fuad

