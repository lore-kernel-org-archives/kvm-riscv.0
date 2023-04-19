From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 19 Apr 2023 15:16:53 -0700
Subject: [RFC 25/48] RISC-V: KVM: Skip HVIP update for TVMs
In-Reply-To: <20230419221716.3603068-1-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
Message-ID: <20230419221716.3603068-26-atishp@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Skip HVIP update as the Host shouldn't be able to inject
interrupt directly to a TVM.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vcpu.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 43a0b8c..20d4800 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -822,7 +822,10 @@ void kvm_riscv_vcpu_sync_interrupts(struct kvm_vcpu *vcpu)
 	/* Read current HVIP and VSIE CSRs */
 	csr->vsie = nacl_csr_read(CSR_VSIE);
 
-	/* Sync-up HVIP.VSSIP bit changes does by Guest */
+	/*
+	 * Sync-up HVIP.VSSIP bit changes does by Guest. For TVMs,
+	 * the HVIP is not updated by the TSM. Expect it to be zero.
+	 */
 	hvip = nacl_csr_read(CSR_HVIP);
 	if ((csr->hvip ^ hvip) & (1UL << IRQ_VS_SOFT)) {
 		if (hvip & (1UL << IRQ_VS_SOFT)) {
@@ -1305,8 +1308,9 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 		 */
 		kvm_riscv_vcpu_flush_interrupts(vcpu);
 
-		/* Update HVIP CSR for current CPU */
-		kvm_riscv_update_hvip(vcpu);
+		/* Update HVIP CSR for current CPU only for non TVMs */
+		if (!is_cove_vcpu(vcpu))
+			kvm_riscv_update_hvip(vcpu);
 
 		if (ret <= 0 ||
 		    kvm_riscv_gstage_vmid_ver_changed(vcpu->kvm) ||
-- 
2.25.1


