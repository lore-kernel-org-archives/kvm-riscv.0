From: Sean Christopherson <seanjc@google.com>
Date: Thu, 2 Nov 2023 08:38:01 -0700
Subject: [PATCH v13 17/35] KVM: Add transparent hugepage support for
 dedicated guest memory
In-Reply-To: <CABgObfbq_Hg0B=jvsSDqYH3CSpX+RsxfwB-Tc-eYF4uq2Qw9cg@mail.gmail.com>
References: <20231027182217.3615211-18-seanjc@google.com> <7c0844d8-6f97-4904-a140-abeabeb552c1@intel.com>
 <ZUEML6oJXDCFJ9fg@google.com> <92ba7ddd-2bc8-4a8d-bd67-d6614b21914f@intel.com>
 <ZUJVfCkIYYFp5VwG@google.com> <CABgObfaw4Byuzj5J3k48jdwT0HCKXLJNiuaA9H8Dtg+GOq==Sw@mail.gmail.com>
 <ZUJ-cJfofk2d_I0B@google.com> <4ca2253d-276f-43c5-8e9f-0ded5d5b2779@redhat.com>
 <ZULSkilO-tdgDGyT@google.com> <CABgObfbq_Hg0B=jvsSDqYH3CSpX+RsxfwB-Tc-eYF4uq2Qw9cg@mail.gmail.com>
Message-ID: <ZUPCWfO1iO77-KDA@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Nov 02, 2023, Paolo Bonzini wrote:
> On Wed, Nov 1, 2023 at 11:35?PM Sean Christopherson <seanjc@google.com> wrote:
> >
> > On Wed, Nov 01, 2023, Paolo Bonzini wrote:
> > > On 11/1/23 17:36, Sean Christopherson wrote:
> > > > Can you post a fixup patch?  It's not clear to me exactly what behavior you intend
> > > > to end up with.
> > >
> > > Sure, just this:
> > >
> > > diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> > > index 7d1a33c2ad42..34fd070e03d9 100644
> > > --- a/virt/kvm/guest_memfd.c
> > > +++ b/virt/kvm/guest_memfd.c
> > > @@ -430,10 +430,7 @@ int kvm_gmem_create(struct kvm *kvm, struct kvm_create_guest_memfd *args)
> > >  {
> > >       loff_t size = args->size;
> > >       u64 flags = args->flags;
> > > -     u64 valid_flags = 0;
> > > -
> > > -     if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE))
> > > -             valid_flags |= KVM_GUEST_MEMFD_ALLOW_HUGEPAGE;
> > > +     u64 valid_flags = KVM_GUEST_MEMFD_ALLOW_HUGEPAGE;
> > >       if (flags & ~valid_flags)
> > >               return -EINVAL;
> > > @@ -441,11 +438,9 @@ int kvm_gmem_create(struct kvm *kvm, struct kvm_create_guest_memfd *args)
> > >       if (size < 0 || !PAGE_ALIGNED(size))
> > >               return -EINVAL;
> > > -#ifdef CONFIG_TRANSPARENT_HUGEPAGE
> > >       if ((flags & KVM_GUEST_MEMFD_ALLOW_HUGEPAGE) &&
> > >           !IS_ALIGNED(size, HPAGE_PMD_SIZE))
> > >               return -EINVAL;
> > > -#endif
> >
> > That won't work, HPAGE_PMD_SIZE is valid only for CONFIG_TRANSPARENT_HUGEPAGE=y.
> >
> > #else /* CONFIG_TRANSPARENT_HUGEPAGE */
> > #define HPAGE_PMD_SHIFT ({ BUILD_BUG(); 0; })
> > #define HPAGE_PMD_MASK ({ BUILD_BUG(); 0; })
> > #define HPAGE_PMD_SIZE ({ BUILD_BUG(); 0; })
> 
> Would have caught it when actually testing it, I guess. :) It has to
> be PMD_SIZE, possibly with
> 
> #ifdef CONFIG_TRANSPARENT_HUGEPAGE
> BUILD_BUG_ON(HPAGE_PMD_SIZE != PMD_SIZE);
> #endif

Yeah, that works for me.

Actually, looking that this again, there's not actually a hard dependency on THP.
A THP-enabled kernel _probably_  gives a higher probability of using hugepages,
but mostly because THP selects COMPACTION, and I suppose because using THP for
other allocations reduces overall fragmentation.

So rather than honor KVM_GUEST_MEMFD_ALLOW_HUGEPAGE iff THP is enabled, I think
we should do the below (I verified KVM can create hugepages with THP=n).  We'll
need another capability, but (a) we probably should have that anyways and (b) it
provides a cleaner path to adding PUD-sized hugepage support in the future.

And then adjust the tests like so:

diff --git a/tools/testing/selftests/kvm/guest_memfd_test.c b/tools/testing/selftests/kvm/guest_memfd_test.c
index c15de9852316..c9f449718fce 100644
--- a/tools/testing/selftests/kvm/guest_memfd_test.c
+++ b/tools/testing/selftests/kvm/guest_memfd_test.c
@@ -201,6 +201,10 @@ int main(int argc, char *argv[])
 
        TEST_REQUIRE(kvm_has_cap(KVM_CAP_GUEST_MEMFD));
 
+       if (kvm_has_cap(KVM_CAP_GUEST_MEMFD_HUGEPAGE_PMD_SIZE) && thp_configured())
+               TEST_ASSERT_EQ(get_trans_hugepagesz(),
+                              kvm_check_cap(KVM_CAP_GUEST_MEMFD_HUGEPAGE_PMD_SIZE));
+
        page_size = getpagesize();
        total_size = page_size * 4;
 
diff --git a/tools/testing/selftests/kvm/x86_64/private_mem_conversions_test.c b/tools/testing/selftests/kvm/x86_64/private_mem_conversions_test.c
index be311944e90a..245901587ed2 100644
--- a/tools/testing/selftests/kvm/x86_64/private_mem_conversions_test.c
+++ b/tools/testing/selftests/kvm/x86_64/private_mem_conversions_test.c
@@ -396,7 +396,7 @@ static void test_mem_conversions(enum vm_mem_backing_src_type src_type, uint32_t
 
        vm_enable_cap(vm, KVM_CAP_EXIT_HYPERCALL, (1 << KVM_HC_MAP_GPA_RANGE));
 
-       if (backing_src_can_be_huge(src_type))
+       if (kvm_has_cap(KVM_CAP_GUEST_MEMFD_HUGEPAGE_PMD_SIZE))
                memfd_flags = KVM_GUEST_MEMFD_ALLOW_HUGEPAGE;
        else
                memfd_flags = 0;

--
From: Sean Christopherson <seanjc@google.com>
Date: Wed, 25 Oct 2023 16:26:41 -0700
Subject: [PATCH] KVM: Add best-effort hugepage support for dedicated guest
 memory

Extend guest_memfd to allow backing guest memory with hugepages.  For now,
make hugepage utilization best-effort, i.e. fall back to non-huge mappings
if a hugepage can't be allocated.  Guaranteeing hugepages would require a
dedicated memory pool and significantly more complexity and churn..

Require userspace to opt-in via a flag even though it's unlikely real use
cases will ever want to use order-0 pages, e.g. to give userspace a safety
valve in case hugepage support is buggy, and to allow for easier testing
of both paths.

Do not take a dependency on CONFIG_TRANSPARENT_HUGEPAGE, as THP enabling
primarily deals with userspace page tables, which are explicitly not in
play for guest_memfd.  Selecting THP does make obtaining hugepages more
likely, but only because THP selects CONFIG_COMPACTION.  Don't select
CONFIG_COMPACTION either, because again it's not a hard dependency.

For simplicity, require the guest_memfd size to be a multiple of the
hugepage size, e.g. so that KVM doesn't need to do bounds checking when
deciding whether or not to allocate a huge folio.

When reporting the max order when KVM gets a pfn from guest_memfd, force
order-0 pages if the hugepage is not fully contained by the memslot
binding, e.g. if userspace requested hugepages but punches a hole in the
memslot bindings in order to emulate x86's VGA hole.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 Documentation/virt/kvm/api.rst | 17 +++++++++
 include/uapi/linux/kvm.h       |  3 ++
 virt/kvm/guest_memfd.c         | 69 +++++++++++++++++++++++++++++-----
 virt/kvm/kvm_main.c            |  4 ++
 4 files changed, 84 insertions(+), 9 deletions(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index e82c69d5e755..ccdd5413920d 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -6176,6 +6176,8 @@ and cannot be resized  (guest_memfd files do however support PUNCH_HOLE).
 	__u64 reserved[6];
   };
 
+  #define KVM_GUEST_MEMFD_ALLOW_HUGEPAGE         (1ULL << 0)
+
 Conceptually, the inode backing a guest_memfd file represents physical memory,
 i.e. is coupled to the virtual machine as a thing, not to a "struct kvm".  The
 file itself, which is bound to a "struct kvm", is that instance's view of the
@@ -6192,6 +6194,12 @@ most one mapping per page, i.e. binding multiple memory regions to a single
 guest_memfd range is not allowed (any number of memory regions can be bound to
 a single guest_memfd file, but the bound ranges must not overlap).
 
+If KVM_GUEST_MEMFD_ALLOW_HUGEPAGE is set in flags, KVM will attempt to allocate
+and map PMD-size hugepages for the guest_memfd file.  This is currently best
+effort.  If KVM_GUEST_MEMFD_ALLOW_HUGEPAGE is set, size must be aligned to at
+least the size reported by KVM_CAP_GUEST_MEMFD_HUGEPAGE_PMD_SIZE (which also
+enumerates support for KVM_GUEST_MEMFD_ALLOW_HUGEPAGE).
+
 See KVM_SET_USER_MEMORY_REGION2 for additional details.
 
 5. The kvm_run structure
@@ -8639,6 +8647,15 @@ block sizes is exposed in KVM_CAP_ARM_SUPPORTED_BLOCK_SIZES as a
 64-bit bitmap (each bit describing a block size). The default value is
 0, to disable the eager page splitting.
 
+
+8.41 KVM_CAP_GUEST_MEMFD_HUGEPAGE_PMD_SIZE
+------------------------------------------
+
+This is an information-only capability that returns guest_memfd's hugepage size
+for PMD hugepages.  Returns '0' if guest_memfd is not supported, or if KVM
+doesn't support creating hugepages for guest_memfd.  Note, guest_memfd doesn't
+currently support PUD-sized hugepages.
+
 9. Known KVM API problems
 =========================
 
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 25caee8d1a80..b78d0e3bf22a 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -1217,6 +1217,7 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_MEMORY_FAULT_INFO 231
 #define KVM_CAP_MEMORY_ATTRIBUTES 232
 #define KVM_CAP_GUEST_MEMFD 233
+#define KVM_CAP_GUEST_MEMFD_HUGEPAGE_PMD_SIZE 234
 
 #ifdef KVM_CAP_IRQ_ROUTING
 
@@ -2303,4 +2304,6 @@ struct kvm_create_guest_memfd {
 	__u64 reserved[6];
 };
 
+#define KVM_GUEST_MEMFD_ALLOW_HUGEPAGE		(1ULL << 0)
+
 #endif /* __LINUX_KVM_H */
diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index 98a12da80214..31b5e94d461a 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -13,14 +13,44 @@ struct kvm_gmem {
 	struct list_head entry;
 };
 
+#define NR_PAGES_PER_PMD (1 << PMD_ORDER)
+
+static struct folio *kvm_gmem_get_huge_folio(struct inode *inode, pgoff_t index)
+{
+	unsigned long huge_index = round_down(index, NR_PAGES_PER_PMD);
+	unsigned long flags = (unsigned long)inode->i_private;
+	struct address_space *mapping  = inode->i_mapping;
+	gfp_t gfp = mapping_gfp_mask(mapping);
+	struct folio *folio;
+
+	if (!(flags & KVM_GUEST_MEMFD_ALLOW_HUGEPAGE))
+		return NULL;
+
+	if (filemap_range_has_page(mapping, huge_index << PAGE_SHIFT,
+				   (huge_index + NR_PAGES_PER_PMD - 1) << PAGE_SHIFT))
+		return NULL;
+
+	folio = filemap_alloc_folio(gfp, PMD_ORDER);
+	if (!folio)
+		return NULL;
+
+	if (filemap_add_folio(mapping, folio, huge_index, gfp)) {
+		folio_put(folio);
+		return NULL;
+	}
+	return folio;
+}
+
 static struct folio *kvm_gmem_get_folio(struct inode *inode, pgoff_t index)
 {
 	struct folio *folio;
 
-	/* TODO: Support huge pages. */
-	folio = filemap_grab_folio(inode->i_mapping, index);
-	if (IS_ERR_OR_NULL(folio))
-		return NULL;
+	folio = kvm_gmem_get_huge_folio(inode, index);
+	if (!folio) {
+		folio = filemap_grab_folio(inode->i_mapping, index);
+		if (IS_ERR_OR_NULL(folio))
+			return NULL;
+	}
 
 	/*
 	 * Use the up-to-date flag to track whether or not the memory has been
@@ -373,6 +403,7 @@ static int __kvm_gmem_create(struct kvm *kvm, loff_t size, u64 flags)
 	inode->i_mode |= S_IFREG;
 	inode->i_size = size;
 	mapping_set_gfp_mask(inode->i_mapping, GFP_HIGHUSER);
+	mapping_set_large_folios(inode->i_mapping);
 	mapping_set_unmovable(inode->i_mapping);
 	/* Unmovable mappings are supposed to be marked unevictable as well. */
 	WARN_ON_ONCE(!mapping_unevictable(inode->i_mapping));
@@ -394,14 +425,18 @@ static int __kvm_gmem_create(struct kvm *kvm, loff_t size, u64 flags)
 
 int kvm_gmem_create(struct kvm *kvm, struct kvm_create_guest_memfd *args)
 {
+	u64 valid_flags = KVM_GUEST_MEMFD_ALLOW_HUGEPAGE;
 	loff_t size = args->size;
 	u64 flags = args->flags;
-	u64 valid_flags = 0;
 
 	if (flags & ~valid_flags)
 		return -EINVAL;
 
-	if (size < 0 || !PAGE_ALIGNED(size))
+	if (size <= 0 || !PAGE_ALIGNED(size))
+		return -EINVAL;
+
+	if ((flags & KVM_GUEST_MEMFD_ALLOW_HUGEPAGE) &&
+	    !IS_ALIGNED(size, PMD_SIZE))
 		return -EINVAL;
 
 	return __kvm_gmem_create(kvm, size, flags);
@@ -501,7 +536,7 @@ void kvm_gmem_unbind(struct kvm_memory_slot *slot)
 int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
 		     gfn_t gfn, kvm_pfn_t *pfn, int *max_order)
 {
-	pgoff_t index = gfn - slot->base_gfn + slot->gmem.pgoff;
+	pgoff_t index, huge_index;
 	struct kvm_gmem *gmem;
 	struct folio *folio;
 	struct page *page;
@@ -514,6 +549,7 @@ int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
 
 	gmem = file->private_data;
 
+	index = gfn - slot->base_gfn + slot->gmem.pgoff;
 	if (WARN_ON_ONCE(xa_load(&gmem->bindings, index) != slot)) {
 		r = -EIO;
 		goto out_fput;
@@ -533,9 +569,24 @@ int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
 	page = folio_file_page(folio, index);
 
 	*pfn = page_to_pfn(page);
-	if (max_order)
+	if (!max_order)
+		goto success;
+
+	*max_order = compound_order(compound_head(page));
+	if (!*max_order)
+		goto success;
+
+	/*
+	 * The folio can be mapped with a hugepage if and only if the folio is
+	 * fully contained by the range the memslot is bound to.  Note, the
+	 * caller is responsible for handling gfn alignment, this only deals
+	 * with the file binding.
+	 */
+	huge_index = ALIGN(index, 1ull << *max_order);
+	if (huge_index < ALIGN(slot->gmem.pgoff, 1ull << *max_order) ||
+	    huge_index + (1ull << *max_order) > slot->gmem.pgoff + slot->npages)
 		*max_order = 0;
-
+success:
 	r = 0;
 
 out_unlock:
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 5d1a2f1b4e94..0711f2c75667 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -4888,6 +4888,10 @@ static int kvm_vm_ioctl_check_extension_generic(struct kvm *kvm, long arg)
 #ifdef CONFIG_KVM_PRIVATE_MEM
 	case KVM_CAP_GUEST_MEMFD:
 		return !kvm || kvm_arch_has_private_mem(kvm);
+	case KVM_CAP_GUEST_MEMFD_HUGEPAGE_PMD_SIZE:
+		if (kvm && !kvm_arch_has_private_mem(kvm))
+			return 0;
+		return PMD_SIZE;
 #endif
 	default:
 		break;

base-commit: fcbef1e5e5d2a60dacac0d16c06ac00bedaefc0f
--

