From: Sean Christopherson <seanjc@google.com>
Date: Tue, 18 Jul 2023 16:44:52 -0700
Subject: [RFC PATCH v11 09/29] KVM: x86: Disallow hugepages when memory
 attributes are mixed
In-Reply-To: <20230718234512.1690985-1-seanjc@google.com>
References: <20230718234512.1690985-1-seanjc@google.com>
Message-ID: <20230718234512.1690985-10-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Chao Peng <chao.p.peng@linux.intel.com>

Disallow creating hugepages with mixed memory attributes, e.g. shared
versus private, as mapping a hugepage in this case would allow the guest
to access memory with the wrong attributes, e.g. overlaying private memory
with a shared hugepage.

Tracking whether or not attributes are mixed via the existing
disallow_lpage field, but use the most significant bit in 'disallow_lpage'
to indicate a hugepage has mixed attributes instead using the normal
refcounting.  Whether or not attributes are mixed is binary; either they
are or they aren't.  Attempting to squeeze that info into the refcount is
unnecessarily complex as it would require knowing the previous state of
the mixed count when updating attributes.  Using a flag means KVM just
needs to ensure the current status is reflected in the memslots.

Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
Co-developed-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm_host.h |   3 +
 arch/x86/kvm/mmu/mmu.c          | 185 +++++++++++++++++++++++++++++++-
 arch/x86/kvm/x86.c              |   4 +
 3 files changed, 190 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index f9a927296d85..b87ff7b601fa 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1816,6 +1816,9 @@ int kvm_mmu_create(struct kvm_vcpu *vcpu);
 int kvm_mmu_init_vm(struct kvm *kvm);
 void kvm_mmu_uninit_vm(struct kvm *kvm);
 
+void kvm_mmu_init_memslot_memory_attributes(struct kvm *kvm,
+					    struct kvm_memory_slot *slot);
+
 void kvm_mmu_after_set_cpuid(struct kvm_vcpu *vcpu);
 void kvm_mmu_reset_context(struct kvm_vcpu *vcpu);
 void kvm_mmu_slot_remove_write_access(struct kvm *kvm,
diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index b034727c4cf9..aefe67185637 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -803,16 +803,27 @@ static struct kvm_lpage_info *lpage_info_slot(gfn_t gfn,
 	return &slot->arch.lpage_info[level - 2][idx];
 }
 
+/*
+ * The most significant bit in disallow_lpage tracks whether or not memory
+ * attributes are mixed, i.e. not identical for all gfns at the current level.
+ * The lower order bits are used to refcount other cases where a hugepage is
+ * disallowed, e.g. if KVM has shadow a page table at the gfn.
+ */
+#define KVM_LPAGE_MIXED_FLAG	BIT(31)
+
 static void update_gfn_disallow_lpage_count(const struct kvm_memory_slot *slot,
 					    gfn_t gfn, int count)
 {
 	struct kvm_lpage_info *linfo;
-	int i;
+	int old, i;
 
 	for (i = PG_LEVEL_2M; i <= KVM_MAX_HUGEPAGE_LEVEL; ++i) {
 		linfo = lpage_info_slot(gfn, slot, i);
+
+		old = linfo->disallow_lpage;
 		linfo->disallow_lpage += count;
-		WARN_ON(linfo->disallow_lpage < 0);
+
+		WARN_ON_ONCE((old ^ linfo->disallow_lpage) & KVM_LPAGE_MIXED_FLAG);
 	}
 }
 
@@ -7223,3 +7234,173 @@ void kvm_mmu_pre_destroy_vm(struct kvm *kvm)
 	if (kvm->arch.nx_huge_page_recovery_thread)
 		kthread_stop(kvm->arch.nx_huge_page_recovery_thread);
 }
+
+#ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
+static bool hugepage_test_mixed(struct kvm_memory_slot *slot, gfn_t gfn,
+				int level)
+{
+	return lpage_info_slot(gfn, slot, level)->disallow_lpage & KVM_LPAGE_MIXED_FLAG;
+}
+
+static void hugepage_clear_mixed(struct kvm_memory_slot *slot, gfn_t gfn,
+				 int level)
+{
+	lpage_info_slot(gfn, slot, level)->disallow_lpage &= ~KVM_LPAGE_MIXED_FLAG;
+}
+
+static void hugepage_set_mixed(struct kvm_memory_slot *slot, gfn_t gfn,
+			       int level)
+{
+	lpage_info_slot(gfn, slot, level)->disallow_lpage |= KVM_LPAGE_MIXED_FLAG;
+}
+
+static bool range_has_attrs(struct kvm *kvm, gfn_t start, gfn_t end,
+			    unsigned long attrs)
+{
+	XA_STATE(xas, &kvm->mem_attr_array, start);
+	unsigned long index;
+	bool has_attrs;
+	void *entry;
+
+	rcu_read_lock();
+
+	if (!attrs) {
+		has_attrs = !xas_find(&xas, end);
+		goto out;
+	}
+
+	has_attrs = true;
+	for (index = start; index < end; index++) {
+		do {
+			entry = xas_next(&xas);
+		} while (xas_retry(&xas, entry));
+
+		if (xas.xa_index != index || xa_to_value(entry) != attrs) {
+			has_attrs = false;
+			break;
+		}
+	}
+
+out:
+	rcu_read_unlock();
+	return has_attrs;
+}
+
+static bool hugepage_has_attrs(struct kvm *kvm, struct kvm_memory_slot *slot,
+			       gfn_t gfn, int level, unsigned long attrs)
+{
+	const unsigned long start = gfn;
+	const unsigned long end = start + KVM_PAGES_PER_HPAGE(level);
+
+	if (level == PG_LEVEL_2M)
+		return range_has_attrs(kvm, start, end, attrs);
+
+	for (gfn = start; gfn < end; gfn += KVM_PAGES_PER_HPAGE(level - 1)) {
+		if (hugepage_test_mixed(slot, gfn, level - 1) ||
+		    attrs != kvm_get_memory_attributes(kvm, gfn))
+			return false;
+	}
+	return true;
+}
+
+bool kvm_arch_post_set_memory_attributes(struct kvm *kvm,
+					 struct kvm_gfn_range *range)
+{
+	unsigned long attrs = range->arg.attributes;
+	struct kvm_memory_slot *slot = range->slot;
+	int level;
+
+	lockdep_assert_held_write(&kvm->mmu_lock);
+	lockdep_assert_held(&kvm->slots_lock);
+
+	/*
+	 * KVM x86 currently only supports KVM_MEMORY_ATTRIBUTE_PRIVATE, skip
+	 * the slot if the slot will never consume the PRIVATE attribute.
+	 */
+	if (!kvm_slot_can_be_private(slot))
+		return false;
+
+	/*
+	 * The sequence matters here: upper levels consume the result of lower
+	 * level's scanning.
+	 */
+	for (level = PG_LEVEL_2M; level <= KVM_MAX_HUGEPAGE_LEVEL; level++) {
+		gfn_t nr_pages = KVM_PAGES_PER_HPAGE(level);
+		gfn_t gfn = gfn_round_for_level(range->start, level);
+
+		/* Process the head page if it straddles the range. */
+		if (gfn != range->start || gfn + nr_pages > range->end) {
+			/*
+			 * Skip mixed tracking if the aligned gfn isn't covered
+			 * by the memslot, KVM can't use a hugepage due to the
+			 * misaligned address regardless of memory attributes.
+			 */
+			if (gfn >= slot->base_gfn) {
+				if (hugepage_has_attrs(kvm, slot, gfn, level, attrs))
+					hugepage_clear_mixed(slot, gfn, level);
+				else
+					hugepage_set_mixed(slot, gfn, level);
+			}
+			gfn += nr_pages;
+		}
+
+		/*
+		 * Pages entirely covered by the range are guaranteed to have
+		 * only the attributes which were just set.
+		 */
+		for ( ; gfn + nr_pages <= range->end; gfn += nr_pages)
+			hugepage_clear_mixed(slot, gfn, level);
+
+		/*
+		 * Process the last tail page if it straddles the range and is
+		 * contained by the memslot.  Like the head page, KVM can't
+		 * create a hugepage if the slot size is misaligned.
+		 */
+		if (gfn < range->end &&
+		    (gfn + nr_pages) <= (slot->base_gfn + slot->npages)) {
+			if (hugepage_has_attrs(kvm, slot, gfn, level, attrs))
+				hugepage_clear_mixed(slot, gfn, level);
+			else
+				hugepage_set_mixed(slot, gfn, level);
+		}
+	}
+	return false;
+}
+
+void kvm_mmu_init_memslot_memory_attributes(struct kvm *kvm,
+					    struct kvm_memory_slot *slot)
+{
+	int level;
+
+	if (!kvm_slot_can_be_private(slot))
+		return;
+
+	for (level = PG_LEVEL_2M; level <= KVM_MAX_HUGEPAGE_LEVEL; level++) {
+		/*
+		 * Don't bother tracking mixed attributes for pages that can't
+		 * be huge due to alignment, i.e. process only pages that are
+		 * entirely contained by the memslot.
+		 */
+		gfn_t end = gfn_round_for_level(slot->base_gfn + slot->npages, level);
+		gfn_t start = gfn_round_for_level(slot->base_gfn, level);
+		gfn_t nr_pages = KVM_PAGES_PER_HPAGE(level);
+		gfn_t gfn;
+
+		if (start < slot->base_gfn)
+			start += nr_pages;
+
+		/*
+		 * Unlike setting attributes, every potential hugepage needs to
+		 * be manually checked as the attributes may already be mixed.
+		 */
+		for (gfn = start; gfn < end; gfn += nr_pages) {
+			unsigned long attrs = kvm_get_memory_attributes(kvm, gfn);
+
+			if (hugepage_has_attrs(kvm, slot, gfn, level, attrs))
+				hugepage_clear_mixed(slot, gfn, level);
+			else
+				hugepage_set_mixed(slot, gfn, level);
+		}
+	}
+}
+#endif
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 92e77afd3ffd..dd7cefe78815 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -12570,6 +12570,10 @@ static int kvm_alloc_memslot_metadata(struct kvm *kvm,
 		}
 	}
 
+#ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
+	kvm_mmu_init_memslot_memory_attributes(kvm, slot);
+#endif
+
 	if (kvm_page_track_create_memslot(kvm, slot, npages))
 		goto out_free;
 
-- 
2.41.0.255.g8b1d071c50-goog


