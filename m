From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 19 Apr 2023 15:16:57 -0700
Subject: [RFC 29/48] RISC-V: KVM: Skip AIA CSR updates for TVMs
In-Reply-To: <20230419221716.3603068-1-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
Message-ID: <20230419221716.3603068-30-atishp@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

For TVMs, the host must not support AIA CSR emulation. In addition to
that, during vcpu load/put the CSR updates are not necessary as the CSR
state must not be visible to the host.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/aia.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kvm/aia.c b/arch/riscv/kvm/aia.c
index 71216e1..e3da661 100644
--- a/arch/riscv/kvm/aia.c
+++ b/arch/riscv/kvm/aia.c
@@ -15,6 +15,7 @@
 #include <linux/percpu.h>
 #include <linux/spinlock.h>
 #include <asm/hwcap.h>
+#include <asm/kvm_cove.h>
 
 struct aia_hgei_control {
 	raw_spinlock_t lock;
@@ -134,7 +135,7 @@ void kvm_riscv_vcpu_aia_load(struct kvm_vcpu *vcpu, int cpu)
 {
 	struct kvm_vcpu_aia_csr *csr = &vcpu->arch.aia_context.guest_csr;
 
-	if (!kvm_riscv_aia_available())
+	if (!kvm_riscv_aia_available() || is_cove_vcpu(vcpu))
 		return;
 
 	csr_write(CSR_VSISELECT, csr->vsiselect);
@@ -152,7 +153,7 @@ void kvm_riscv_vcpu_aia_put(struct kvm_vcpu *vcpu)
 {
 	struct kvm_vcpu_aia_csr *csr = &vcpu->arch.aia_context.guest_csr;
 
-	if (!kvm_riscv_aia_available())
+	if (!kvm_riscv_aia_available() || is_cove_vcpu(vcpu))
 		return;
 
 	csr->vsiselect = csr_read(CSR_VSISELECT);
@@ -370,6 +371,10 @@ int kvm_riscv_vcpu_aia_rmw_ireg(struct kvm_vcpu *vcpu, unsigned int csr_num,
 	if (!kvm_riscv_aia_available())
 		return KVM_INSN_ILLEGAL_TRAP;
 
+	/* TVMs do not support AIA emulation */
+	if (is_cove_vcpu(vcpu))
+		return KVM_INSN_EXIT_TO_USER_SPACE;
+
 	/* First try to emulate in kernel space */
 	isel = csr_read(CSR_VSISELECT) & ISELECT_MASK;
 	if (isel >= ISELECT_IPRIO0 && isel <= ISELECT_IPRIO15)
@@ -529,6 +534,9 @@ void kvm_riscv_aia_enable(void)
 	if (!kvm_riscv_aia_available())
 		return;
 
+	if (unlikely(kvm_riscv_cove_enabled()))
+		goto enable_gext;
+
 	aia_set_hvictl(false);
 	csr_write(CSR_HVIPRIO1, 0x0);
 	csr_write(CSR_HVIPRIO2, 0x0);
@@ -539,6 +547,7 @@ void kvm_riscv_aia_enable(void)
 	csr_write(CSR_HVIPRIO2H, 0x0);
 #endif
 
+enable_gext:
 	/* Enable per-CPU SGEI interrupt */
 	enable_percpu_irq(hgei_parent_irq,
 			  irq_get_trigger_type(hgei_parent_irq));
@@ -559,7 +568,9 @@ void kvm_riscv_aia_disable(void)
 	csr_clear(CSR_HIE, BIT(IRQ_S_GEXT));
 	disable_percpu_irq(hgei_parent_irq);
 
-	aia_set_hvictl(false);
+	/* The host is not allowed modify hvictl for TVMs */
+	if (!unlikely(kvm_riscv_cove_enabled()))
+		aia_set_hvictl(false);
 
 	raw_spin_lock_irqsave(&hgctrl->lock, flags);
 
-- 
2.25.1


