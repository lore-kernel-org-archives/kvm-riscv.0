From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 19 Apr 2023 15:16:45 -0700
Subject: [RFC 17/48] RISC-V : KVM: Skip vmid/hgatp management for TVMs
In-Reply-To: <20230419221716.3603068-1-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
Message-ID: <20230419221716.3603068-18-atishp@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The TSM manages the vmid for the guests running in CoVE. The host
doesn't need to update vmid at all. As a result, the host doesn't
need to update the hgatp as well.

Return early for vmid/hgatp management functions for confidential
guests.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/kvm_host.h |  2 +-
 arch/riscv/kvm/mmu.c              |  4 ++++
 arch/riscv/kvm/vcpu.c             |  2 +-
 arch/riscv/kvm/vmid.c             | 17 ++++++++++++-----
 4 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index ca2ebe3..047e046 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -325,7 +325,7 @@ unsigned long kvm_riscv_gstage_pgd_size(void);
 void __init kvm_riscv_gstage_vmid_detect(void);
 unsigned long kvm_riscv_gstage_vmid_bits(void);
 int kvm_riscv_gstage_vmid_init(struct kvm *kvm);
-bool kvm_riscv_gstage_vmid_ver_changed(struct kvm_vmid *vmid);
+bool kvm_riscv_gstage_vmid_ver_changed(struct kvm *kvm);
 void kvm_riscv_gstage_vmid_update(struct kvm_vcpu *vcpu);
 
 int kvm_riscv_setup_default_irq_routing(struct kvm *kvm, u32 lines);
diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 1d5e4ed..4b0f09e 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -778,6 +778,10 @@ void kvm_riscv_gstage_update_hgatp(struct kvm_vcpu *vcpu)
 	unsigned long hgatp = gstage_mode;
 	struct kvm_arch *k = &vcpu->kvm->arch;
 
+	/* COVE VCPU hgatp is managed by TSM. */
+	if (is_cove_vcpu(vcpu))
+		return;
+
 	hgatp |= (READ_ONCE(k->vmid.vmid) << HGATP_VMID_SHIFT) & HGATP_VMID;
 	hgatp |= (k->pgd_phys >> PAGE_SHIFT) & HGATP_PPN;
 
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 3b600c6..8cf462c 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -1288,7 +1288,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 		kvm_riscv_update_hvip(vcpu);
 
 		if (ret <= 0 ||
-		    kvm_riscv_gstage_vmid_ver_changed(&vcpu->kvm->arch.vmid) ||
+		    kvm_riscv_gstage_vmid_ver_changed(vcpu->kvm) ||
 		    kvm_request_pending(vcpu) ||
 		    xfer_to_guest_mode_work_pending()) {
 			vcpu->mode = OUTSIDE_GUEST_MODE;
diff --git a/arch/riscv/kvm/vmid.c b/arch/riscv/kvm/vmid.c
index ddc9871..dc03601 100644
--- a/arch/riscv/kvm/vmid.c
+++ b/arch/riscv/kvm/vmid.c
@@ -14,6 +14,7 @@
 #include <linux/smp.h>
 #include <linux/kvm_host.h>
 #include <asm/csr.h>
+#include <asm/kvm_cove.h>
 
 static unsigned long vmid_version = 1;
 static unsigned long vmid_next;
@@ -54,12 +55,13 @@ int kvm_riscv_gstage_vmid_init(struct kvm *kvm)
 	return 0;
 }
 
-bool kvm_riscv_gstage_vmid_ver_changed(struct kvm_vmid *vmid)
+bool kvm_riscv_gstage_vmid_ver_changed(struct kvm *kvm)
 {
-	if (!vmid_bits)
+	/* VMID version can't be changed by the host for TVMs */
+	if (!vmid_bits || is_cove_vm(kvm))
 		return false;
 
-	return unlikely(READ_ONCE(vmid->vmid_version) !=
+	return unlikely(READ_ONCE(kvm->arch.vmid.vmid_version) !=
 			READ_ONCE(vmid_version));
 }
 
@@ -72,9 +74,14 @@ void kvm_riscv_gstage_vmid_update(struct kvm_vcpu *vcpu)
 {
 	unsigned long i;
 	struct kvm_vcpu *v;
+	struct kvm *kvm = vcpu->kvm;
 	struct kvm_vmid *vmid = &vcpu->kvm->arch.vmid;
 
-	if (!kvm_riscv_gstage_vmid_ver_changed(vmid))
+	/* No VMID management for TVMs by the host */
+	if (is_cove_vcpu(vcpu))
+		return;
+
+	if (!kvm_riscv_gstage_vmid_ver_changed(kvm))
 		return;
 
 	spin_lock(&vmid_lock);
@@ -83,7 +90,7 @@ void kvm_riscv_gstage_vmid_update(struct kvm_vcpu *vcpu)
 	 * We need to re-check the vmid_version here to ensure that if
 	 * another vcpu already allocated a valid vmid for this vm.
 	 */
-	if (!kvm_riscv_gstage_vmid_ver_changed(vmid)) {
+	if (!kvm_riscv_gstage_vmid_ver_changed(kvm)) {
 		spin_unlock(&vmid_lock);
 		return;
 	}
-- 
2.25.1


