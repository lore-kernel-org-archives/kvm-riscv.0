From: Sean Christopherson <seanjc@google.com>
Date: Thu,  4 Nov 2021 00:25:14 +0000
Subject: [PATCH v5.5 13/30] KVM: RISC-V: Use "new" memslot instead of
 userspace memory region
In-Reply-To: <20211104002531.1176691-1-seanjc@google.com>
References: <20211104002531.1176691-1-seanjc@google.com>
Message-ID: <20211104002531.1176691-14-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Get the slot ID, hva, etc... from the "new" memslot instead of the
userspace memory region when preparing/committing a memory region.  This
will allow a future commit to drop @mem from the prepare/commit hooks
once all architectures convert to using "new".

Opportunistically wait to get the various "new" values until after
filtering out the DELETE case in anticipation of a future commit passing
NULL for @new when deleting a memslot.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/riscv/kvm/mmu.c | 34 +++++++++++++++++++---------------
 1 file changed, 19 insertions(+), 15 deletions(-)

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 3a00c2df7640..db5230ec6951 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -466,18 +466,19 @@ void kvm_arch_commit_memory_region(struct kvm *kvm,
 	 * allocated dirty_bitmap[], dirty pages will be tracked while
 	 * the memory slot is write protected.
 	 */
-	if (change != KVM_MR_DELETE && mem->flags & KVM_MEM_LOG_DIRTY_PAGES)
-		stage2_wp_memory_region(kvm, mem->slot);
+	if (change != KVM_MR_DELETE && new->flags & KVM_MEM_LOG_DIRTY_PAGES)
+		stage2_wp_memory_region(kvm, new->id);
 }
 
 int kvm_arch_prepare_memory_region(struct kvm *kvm,
-				struct kvm_memory_slot *memslot,
-				const struct kvm_userspace_memory_region *mem,
-				enum kvm_mr_change change)
+				   const struct kvm_userspace_memory_region *mem,
+				   const struct kvm_memory_slot *old,
+				   struct kvm_memory_slot *new,
+				   enum kvm_mr_change change)
 {
-	hva_t hva = mem->userspace_addr;
-	hva_t reg_end = hva + mem->memory_size;
-	bool writable = !(mem->flags & KVM_MEM_READONLY);
+	hva_t hva, reg_end, size;
+	gpa_t base_gpa;
+	bool writable;
 	int ret = 0;
 
 	if (change != KVM_MR_CREATE && change != KVM_MR_MOVE &&
@@ -488,10 +489,15 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
 	 * Prevent userspace from creating a memory region outside of the GPA
 	 * space addressable by the KVM guest GPA space.
 	 */
-	if ((memslot->base_gfn + memslot->npages) >=
-	    (stage2_gpa_size >> PAGE_SHIFT))
+	if ((new->base_gfn + new->npages) >= (stage2_gpa_size >> PAGE_SHIFT))
 		return -EFAULT;
 
+	hva = new->userspace_addr;
+	size = new->npages << PAGE_SHIFT;
+	reg_end = hva + size;
+	base_gpa = new->base_gfn << PAGE_SHIFT;
+	writable = !(new->flags & KVM_MEM_READONLY);
+
 	mmap_read_lock(current->mm);
 
 	/*
@@ -527,15 +533,14 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
 		vm_end = min(reg_end, vma->vm_end);
 
 		if (vma->vm_flags & VM_PFNMAP) {
-			gpa_t gpa = mem->guest_phys_addr +
-				    (vm_start - mem->userspace_addr);
+			gpa_t gpa = base_gpa + (vm_start - hva);
 			phys_addr_t pa;
 
 			pa = (phys_addr_t)vma->vm_pgoff << PAGE_SHIFT;
 			pa += vm_start - vma->vm_start;
 
 			/* IO region dirty page logging not allowed */
-			if (memslot->flags & KVM_MEM_LOG_DIRTY_PAGES) {
+			if (new->flags & KVM_MEM_LOG_DIRTY_PAGES) {
 				ret = -EINVAL;
 				goto out;
 			}
@@ -553,8 +558,7 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
 
 	spin_lock(&kvm->mmu_lock);
 	if (ret)
-		stage2_unmap_range(kvm, mem->guest_phys_addr,
-				   mem->memory_size, false);
+		stage2_unmap_range(kvm, base_gpa, size, false);
 	spin_unlock(&kvm->mmu_lock);
 
 out:
-- 
2.33.1.1089.g2158813163f-goog


