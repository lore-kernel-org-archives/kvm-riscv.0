From: Sean Christopherson <seanjc@google.com>
Date: Fri, 27 Oct 2023 11:22:04 -0700
Subject: [PATCH v13 22/35] KVM: Allow arch code to track number of memslot
 address spaces per VM
In-Reply-To: <20231027182217.3615211-1-seanjc@google.com>
References: <20231027182217.3615211-1-seanjc@google.com>
Message-ID: <20231027182217.3615211-23-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Let x86 track the number of address spaces on a per-VM basis so that KVM
can disallow SMM memslots for confidential VMs.  Confidentials VMs are
fundamentally incompatible with emulating SMM, which as the name suggests
requires being able to read and write guest memory and register state.

Disallowing SMM will simplify support for guest private memory, as KVM
will not need to worry about tracking memory attributes for multiple
address spaces (SMM is the only "non-default" address space across all
architectures).

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/powerpc/kvm/book3s_hv.c    |  2 +-
 arch/x86/include/asm/kvm_host.h |  8 +++++++-
 arch/x86/kvm/debugfs.c          |  2 +-
 arch/x86/kvm/mmu/mmu.c          |  6 +++---
 arch/x86/kvm/x86.c              |  2 +-
 include/linux/kvm_host.h        | 17 +++++++++++------
 virt/kvm/dirty_ring.c           |  2 +-
 virt/kvm/kvm_main.c             | 26 ++++++++++++++------------
 8 files changed, 39 insertions(+), 26 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 130bafdb1430..9b0eaa17275a 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -6084,7 +6084,7 @@ static int kvmhv_svm_off(struct kvm *kvm)
 	}
 
 	srcu_idx = srcu_read_lock(&kvm->srcu);
-	for (i = 0; i < KVM_ADDRESS_SPACE_NUM; i++) {
+	for (i = 0; i < kvm_arch_nr_memslot_as_ids(kvm); i++) {
 		struct kvm_memory_slot *memslot;
 		struct kvm_memslots *slots = __kvm_memslots(kvm, i);
 		int bkt;
diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 6702f795c862..f9e8d5642069 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -2124,9 +2124,15 @@ enum {
 #define HF_SMM_MASK		(1 << 1)
 #define HF_SMM_INSIDE_NMI_MASK	(1 << 2)
 
-# define KVM_ADDRESS_SPACE_NUM 2
+# define KVM_MAX_NR_ADDRESS_SPACES	2
 # define kvm_arch_vcpu_memslots_id(vcpu) ((vcpu)->arch.hflags & HF_SMM_MASK ? 1 : 0)
 # define kvm_memslots_for_spte_role(kvm, role) __kvm_memslots(kvm, (role).smm)
+
+static inline int kvm_arch_nr_memslot_as_ids(struct kvm *kvm)
+{
+	return KVM_MAX_NR_ADDRESS_SPACES;
+}
+
 #else
 # define kvm_memslots_for_spte_role(kvm, role) __kvm_memslots(kvm, 0)
 #endif
diff --git a/arch/x86/kvm/debugfs.c b/arch/x86/kvm/debugfs.c
index ee8c4c3496ed..42026b3f3ff3 100644
--- a/arch/x86/kvm/debugfs.c
+++ b/arch/x86/kvm/debugfs.c
@@ -111,7 +111,7 @@ static int kvm_mmu_rmaps_stat_show(struct seq_file *m, void *v)
 	mutex_lock(&kvm->slots_lock);
 	write_lock(&kvm->mmu_lock);
 
-	for (i = 0; i < KVM_ADDRESS_SPACE_NUM; i++) {
+	for (i = 0; i < kvm_arch_nr_memslot_as_ids(kvm); i++) {
 		int bkt;
 
 		slots = __kvm_memslots(kvm, i);
diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index c4e758f0aebb..baeba8fc1c38 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -3755,7 +3755,7 @@ static int mmu_first_shadow_root_alloc(struct kvm *kvm)
 	    kvm_page_track_write_tracking_enabled(kvm))
 		goto out_success;
 
-	for (i = 0; i < KVM_ADDRESS_SPACE_NUM; i++) {
+	for (i = 0; i < kvm_arch_nr_memslot_as_ids(kvm); i++) {
 		slots = __kvm_memslots(kvm, i);
 		kvm_for_each_memslot(slot, bkt, slots) {
 			/*
@@ -6294,7 +6294,7 @@ static bool kvm_rmap_zap_gfn_range(struct kvm *kvm, gfn_t gfn_start, gfn_t gfn_e
 	if (!kvm_memslots_have_rmaps(kvm))
 		return flush;
 
-	for (i = 0; i < KVM_ADDRESS_SPACE_NUM; i++) {
+	for (i = 0; i < kvm_arch_nr_memslot_as_ids(kvm); i++) {
 		slots = __kvm_memslots(kvm, i);
 
 		kvm_for_each_memslot_in_gfn_range(&iter, slots, gfn_start, gfn_end) {
@@ -6791,7 +6791,7 @@ void kvm_mmu_invalidate_mmio_sptes(struct kvm *kvm, u64 gen)
 	 * modifier prior to checking for a wrap of the MMIO generation so
 	 * that a wrap in any address space is detected.
 	 */
-	gen &= ~((u64)KVM_ADDRESS_SPACE_NUM - 1);
+	gen &= ~((u64)kvm_arch_nr_memslot_as_ids(kvm) - 1);
 
 	/*
 	 * The very rare case: if the MMIO generation number has wrapped,
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 824b58b44382..c4d17727b199 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -12456,7 +12456,7 @@ void __user * __x86_set_memory_region(struct kvm *kvm, int id, gpa_t gpa,
 		hva = slot->userspace_addr;
 	}
 
-	for (i = 0; i < KVM_ADDRESS_SPACE_NUM; i++) {
+	for (i = 0; i < kvm_arch_nr_memslot_as_ids(kvm); i++) {
 		struct kvm_userspace_memory_region2 m;
 
 		m.slot = id | (i << 16);
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index c3cfe08b1300..687589ce9f63 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -80,8 +80,8 @@
 /* Two fragments for cross MMIO pages. */
 #define KVM_MAX_MMIO_FRAGMENTS	2
 
-#ifndef KVM_ADDRESS_SPACE_NUM
-#define KVM_ADDRESS_SPACE_NUM	1
+#ifndef KVM_MAX_NR_ADDRESS_SPACES
+#define KVM_MAX_NR_ADDRESS_SPACES	1
 #endif
 
 /*
@@ -692,7 +692,12 @@ bool kvm_arch_irqchip_in_kernel(struct kvm *kvm);
 #define KVM_MEM_SLOTS_NUM SHRT_MAX
 #define KVM_USER_MEM_SLOTS (KVM_MEM_SLOTS_NUM - KVM_INTERNAL_MEM_SLOTS)
 
-#if KVM_ADDRESS_SPACE_NUM == 1
+#if KVM_MAX_NR_ADDRESS_SPACES == 1
+static inline int kvm_arch_nr_memslot_as_ids(struct kvm *kvm)
+{
+	return KVM_MAX_NR_ADDRESS_SPACES;
+}
+
 static inline int kvm_arch_vcpu_memslots_id(struct kvm_vcpu *vcpu)
 {
 	return 0;
@@ -747,9 +752,9 @@ struct kvm {
 	struct mm_struct *mm; /* userspace tied to this vm */
 	unsigned long nr_memslot_pages;
 	/* The two memslot sets - active and inactive (per address space) */
-	struct kvm_memslots __memslots[KVM_ADDRESS_SPACE_NUM][2];
+	struct kvm_memslots __memslots[KVM_MAX_NR_ADDRESS_SPACES][2];
 	/* The current active memslot set for each address space */
-	struct kvm_memslots __rcu *memslots[KVM_ADDRESS_SPACE_NUM];
+	struct kvm_memslots __rcu *memslots[KVM_MAX_NR_ADDRESS_SPACES];
 	struct xarray vcpu_array;
 	/*
 	 * Protected by slots_lock, but can be read outside if an
@@ -1018,7 +1023,7 @@ void kvm_put_kvm_no_destroy(struct kvm *kvm);
 
 static inline struct kvm_memslots *__kvm_memslots(struct kvm *kvm, int as_id)
 {
-	as_id = array_index_nospec(as_id, KVM_ADDRESS_SPACE_NUM);
+	as_id = array_index_nospec(as_id, KVM_MAX_NR_ADDRESS_SPACES);
 	return srcu_dereference_check(kvm->memslots[as_id], &kvm->srcu,
 			lockdep_is_held(&kvm->slots_lock) ||
 			!refcount_read(&kvm->users_count));
diff --git a/virt/kvm/dirty_ring.c b/virt/kvm/dirty_ring.c
index c1cd7dfe4a90..86d267db87bb 100644
--- a/virt/kvm/dirty_ring.c
+++ b/virt/kvm/dirty_ring.c
@@ -58,7 +58,7 @@ static void kvm_reset_dirty_gfn(struct kvm *kvm, u32 slot, u64 offset, u64 mask)
 	as_id = slot >> 16;
 	id = (u16)slot;
 
-	if (as_id >= KVM_ADDRESS_SPACE_NUM || id >= KVM_USER_MEM_SLOTS)
+	if (as_id >= kvm_arch_nr_memslot_as_ids(kvm) || id >= KVM_USER_MEM_SLOTS)
 		return;
 
 	memslot = id_to_memslot(__kvm_memslots(kvm, as_id), id);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 5d1a2f1b4e94..23633984142f 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -615,7 +615,7 @@ static __always_inline kvm_mn_ret_t __kvm_handle_hva_range(struct kvm *kvm,
 
 	idx = srcu_read_lock(&kvm->srcu);
 
-	for (i = 0; i < KVM_ADDRESS_SPACE_NUM; i++) {
+	for (i = 0; i < kvm_arch_nr_memslot_as_ids(kvm); i++) {
 		struct interval_tree_node *node;
 
 		slots = __kvm_memslots(kvm, i);
@@ -1248,7 +1248,7 @@ static struct kvm *kvm_create_vm(unsigned long type, const char *fdname)
 		goto out_err_no_irq_srcu;
 
 	refcount_set(&kvm->users_count, 1);
-	for (i = 0; i < KVM_ADDRESS_SPACE_NUM; i++) {
+	for (i = 0; i < kvm_arch_nr_memslot_as_ids(kvm); i++) {
 		for (j = 0; j < 2; j++) {
 			slots = &kvm->__memslots[i][j];
 
@@ -1398,7 +1398,7 @@ static void kvm_destroy_vm(struct kvm *kvm)
 #endif
 	kvm_arch_destroy_vm(kvm);
 	kvm_destroy_devices(kvm);
-	for (i = 0; i < KVM_ADDRESS_SPACE_NUM; i++) {
+	for (i = 0; i < kvm_arch_nr_memslot_as_ids(kvm); i++) {
 		kvm_free_memslots(kvm, &kvm->__memslots[i][0]);
 		kvm_free_memslots(kvm, &kvm->__memslots[i][1]);
 	}
@@ -1681,7 +1681,7 @@ static void kvm_swap_active_memslots(struct kvm *kvm, int as_id)
 	 * space 0 will use generations 0, 2, 4, ... while address space 1 will
 	 * use generations 1, 3, 5, ...
 	 */
-	gen += KVM_ADDRESS_SPACE_NUM;
+	gen += kvm_arch_nr_memslot_as_ids(kvm);
 
 	kvm_arch_memslots_updated(kvm, gen);
 
@@ -2051,7 +2051,7 @@ int __kvm_set_memory_region(struct kvm *kvm,
 	    (mem->guest_memfd_offset & (PAGE_SIZE - 1) ||
 	     mem->guest_memfd_offset + mem->memory_size < mem->guest_memfd_offset))
 		return -EINVAL;
-	if (as_id >= KVM_ADDRESS_SPACE_NUM || id >= KVM_MEM_SLOTS_NUM)
+	if (as_id >= kvm_arch_nr_memslot_as_ids(kvm) || id >= KVM_MEM_SLOTS_NUM)
 		return -EINVAL;
 	if (mem->guest_phys_addr + mem->memory_size < mem->guest_phys_addr)
 		return -EINVAL;
@@ -2187,7 +2187,7 @@ int kvm_get_dirty_log(struct kvm *kvm, struct kvm_dirty_log *log,
 
 	as_id = log->slot >> 16;
 	id = (u16)log->slot;
-	if (as_id >= KVM_ADDRESS_SPACE_NUM || id >= KVM_USER_MEM_SLOTS)
+	if (as_id >= kvm_arch_nr_memslot_as_ids(kvm) || id >= KVM_USER_MEM_SLOTS)
 		return -EINVAL;
 
 	slots = __kvm_memslots(kvm, as_id);
@@ -2249,7 +2249,7 @@ static int kvm_get_dirty_log_protect(struct kvm *kvm, struct kvm_dirty_log *log)
 
 	as_id = log->slot >> 16;
 	id = (u16)log->slot;
-	if (as_id >= KVM_ADDRESS_SPACE_NUM || id >= KVM_USER_MEM_SLOTS)
+	if (as_id >= kvm_arch_nr_memslot_as_ids(kvm) || id >= KVM_USER_MEM_SLOTS)
 		return -EINVAL;
 
 	slots = __kvm_memslots(kvm, as_id);
@@ -2361,7 +2361,7 @@ static int kvm_clear_dirty_log_protect(struct kvm *kvm,
 
 	as_id = log->slot >> 16;
 	id = (u16)log->slot;
-	if (as_id >= KVM_ADDRESS_SPACE_NUM || id >= KVM_USER_MEM_SLOTS)
+	if (as_id >= kvm_arch_nr_memslot_as_ids(kvm) || id >= KVM_USER_MEM_SLOTS)
 		return -EINVAL;
 
 	if (log->first_page & 63)
@@ -2502,7 +2502,7 @@ static __always_inline void kvm_handle_gfn_range(struct kvm *kvm,
 	gfn_range.only_private = false;
 	gfn_range.only_shared = false;
 
-	for (i = 0; i < KVM_ADDRESS_SPACE_NUM; i++) {
+	for (i = 0; i < kvm_arch_nr_memslot_as_ids(kvm); i++) {
 		slots = __kvm_memslots(kvm, i);
 
 		kvm_for_each_memslot_in_gfn_range(&iter, slots, range->start, range->end) {
@@ -4857,9 +4857,11 @@ static int kvm_vm_ioctl_check_extension_generic(struct kvm *kvm, long arg)
 	case KVM_CAP_IRQ_ROUTING:
 		return KVM_MAX_IRQ_ROUTES;
 #endif
-#if KVM_ADDRESS_SPACE_NUM > 1
+#if KVM_MAX_NR_ADDRESS_SPACES > 1
 	case KVM_CAP_MULTI_ADDRESS_SPACE:
-		return KVM_ADDRESS_SPACE_NUM;
+		if (kvm)
+			return kvm_arch_nr_memslot_as_ids(kvm);
+		return KVM_MAX_NR_ADDRESS_SPACES;
 #endif
 	case KVM_CAP_NR_MEMSLOTS:
 		return KVM_USER_MEM_SLOTS;
@@ -4967,7 +4969,7 @@ bool kvm_are_all_memslots_empty(struct kvm *kvm)
 
 	lockdep_assert_held(&kvm->slots_lock);
 
-	for (i = 0; i < KVM_ADDRESS_SPACE_NUM; i++) {
+	for (i = 0; i < kvm_arch_nr_memslot_as_ids(kvm); i++) {
 		if (!kvm_memslots_empty(__kvm_memslots(kvm, i)))
 			return false;
 	}
-- 
2.42.0.820.g83a721a137-goog


