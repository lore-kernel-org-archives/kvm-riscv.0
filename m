From: Zhang Jiaming <jiaming@nfschina.com>
Date: Fri,  1 Jul 2022 14:28:38 +0800
Subject: [PATCH] RISC-V: KVM: Fix variable spelling mistake
Message-ID: <20220701062838.6727-1-jiaming@nfschina.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

There is a spelling mistake in mmu.c and vcpu_exit.c. Fix it.

Signed-off-by: Zhang Jiaming <jiaming@nfschina.com>
---
 arch/riscv/kvm/mmu.c       | 8 ++++----
 arch/riscv/kvm/vcpu_exit.c | 6 +++---
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 1c00695ebee7..2965284a490d 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -611,7 +611,7 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
 {
 	int ret;
 	kvm_pfn_t hfn;
-	bool writeable;
+	bool writable;
 	short vma_pageshift;
 	gfn_t gfn = gpa >> PAGE_SHIFT;
 	struct vm_area_struct *vma;
@@ -659,7 +659,7 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
 
 	mmu_seq = kvm->mmu_notifier_seq;
 
-	hfn = gfn_to_pfn_prot(kvm, gfn, is_write, &writeable);
+	hfn = gfn_to_pfn_prot(kvm, gfn, is_write, &writable);
 	if (hfn == KVM_PFN_ERR_HWPOISON) {
 		send_sig_mceerr(BUS_MCEERR_AR, (void __user *)hva,
 				vma_pageshift, current);
@@ -673,14 +673,14 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
 	 * for write faults.
 	 */
 	if (logging && !is_write)
-		writeable = false;
+		writable = false;
 
 	spin_lock(&kvm->mmu_lock);
 
 	if (mmu_notifier_retry(kvm, mmu_seq))
 		goto out_unlock;
 
-	if (writeable) {
+	if (writable) {
 		kvm_set_pfn_dirty(hfn);
 		mark_page_dirty(kvm, gfn);
 		ret = gstage_map_page(kvm, pcache, gpa, hfn << PAGE_SHIFT,
diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
index dbb09afd7546..f4e569688619 100644
--- a/arch/riscv/kvm/vcpu_exit.c
+++ b/arch/riscv/kvm/vcpu_exit.c
@@ -417,17 +417,17 @@ static int gstage_page_fault(struct kvm_vcpu *vcpu, struct kvm_run *run,
 {
 	struct kvm_memory_slot *memslot;
 	unsigned long hva, fault_addr;
-	bool writeable;
+	bool writable;
 	gfn_t gfn;
 	int ret;
 
 	fault_addr = (trap->htval << 2) | (trap->stval & 0x3);
 	gfn = fault_addr >> PAGE_SHIFT;
 	memslot = gfn_to_memslot(vcpu->kvm, gfn);
-	hva = gfn_to_hva_memslot_prot(memslot, gfn, &writeable);
+	hva = gfn_to_hva_memslot_prot(memslot, gfn, &writable);
 
 	if (kvm_is_error_hva(hva) ||
-	    (trap->scause == EXC_STORE_GUEST_PAGE_FAULT && !writeable)) {
+	    (trap->scause == EXC_STORE_GUEST_PAGE_FAULT && !writable)) {
 		switch (trap->scause) {
 		case EXC_LOAD_GUEST_PAGE_FAULT:
 			return emulate_load(vcpu, run, fault_addr,
-- 
2.25.1


