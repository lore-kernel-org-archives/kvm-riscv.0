From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 19 Jul 2024 21:39:05 +0530
Subject: [PATCH 05/13] RISC-V: KVM: Replace aia_set_hvictl() with aia_hvictl_value()
In-Reply-To: <20240719160913.342027-1-apatel@ventanamicro.com>
References: <20240719160913.342027-1-apatel@ventanamicro.com>
Message-ID: <20240719160913.342027-6-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The aia_set_hvictl() internally writes the HVICTL CSR which makes
it difficult optimize the CSR write using SBI NACL extension for
kvm_riscv_vcpu_aia_update_hvip() function so replace aia_set_hvictl()
with new aia_hvictl_value() which only computes the HVICTL value.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/kvm/aia.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/kvm/aia.c b/arch/riscv/kvm/aia.c
index 2967d305c442..17ae4a7c0e94 100644
--- a/arch/riscv/kvm/aia.c
+++ b/arch/riscv/kvm/aia.c
@@ -51,7 +51,7 @@ static int aia_find_hgei(struct kvm_vcpu *owner)
 	return hgei;
 }
 
-static void aia_set_hvictl(bool ext_irq_pending)
+static inline unsigned long aia_hvictl_value(bool ext_irq_pending)
 {
 	unsigned long hvictl;
 
@@ -62,7 +62,7 @@ static void aia_set_hvictl(bool ext_irq_pending)
 
 	hvictl = (IRQ_S_EXT << HVICTL_IID_SHIFT) & HVICTL_IID;
 	hvictl |= ext_irq_pending;
-	csr_write(CSR_HVICTL, hvictl);
+	return hvictl;
 }
 
 #ifdef CONFIG_32BIT
@@ -130,7 +130,7 @@ void kvm_riscv_vcpu_aia_update_hvip(struct kvm_vcpu *vcpu)
 #ifdef CONFIG_32BIT
 	csr_write(CSR_HVIPH, vcpu->arch.aia_context.guest_csr.hviph);
 #endif
-	aia_set_hvictl(!!(csr->hvip & BIT(IRQ_VS_EXT)));
+	csr_write(CSR_HVICTL, aia_hvictl_value(!!(csr->hvip & BIT(IRQ_VS_EXT))));
 }
 
 void kvm_riscv_vcpu_aia_load(struct kvm_vcpu *vcpu, int cpu)
@@ -536,7 +536,7 @@ void kvm_riscv_aia_enable(void)
 	if (!kvm_riscv_aia_available())
 		return;
 
-	aia_set_hvictl(false);
+	csr_write(CSR_HVICTL, aia_hvictl_value(false));
 	csr_write(CSR_HVIPRIO1, 0x0);
 	csr_write(CSR_HVIPRIO2, 0x0);
 #ifdef CONFIG_32BIT
@@ -572,7 +572,7 @@ void kvm_riscv_aia_disable(void)
 	csr_clear(CSR_HIE, BIT(IRQ_S_GEXT));
 	disable_percpu_irq(hgei_parent_irq);
 
-	aia_set_hvictl(false);
+	csr_write(CSR_HVICTL, aia_hvictl_value(false));
 
 	raw_spin_lock_irqsave(&hgctrl->lock, flags);
 
-- 
2.34.1


