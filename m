From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 17 May 2023 16:21:29 +0530
Subject: [PATCH 04/10] RISC-V: KVM: Set kvm_riscv_aia_nr_hgei to zero
In-Reply-To: <20230517105135.1871868-1-apatel@ventanamicro.com>
References: <20230517105135.1871868-1-apatel@ventanamicro.com>
Message-ID: <20230517105135.1871868-5-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We hard-code the kvm_riscv_aia_nr_hgei to zero until IMSIC HW
guest file support is added in KVM RISC-V.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/kvm/aia.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/aia.c b/arch/riscv/kvm/aia.c
index c78c06d99e39..3f97575707eb 100644
--- a/arch/riscv/kvm/aia.c
+++ b/arch/riscv/kvm/aia.c
@@ -408,7 +408,7 @@ int kvm_riscv_aia_alloc_hgei(int cpu, struct kvm_vcpu *owner,
 
 	raw_spin_unlock_irqrestore(&hgctrl->lock, flags);
 
-	/* TODO: To be updated later by AIA in-kernel irqchip support */
+	/* TODO: To be updated later by AIA IMSIC HW guest file support */
 	if (hgei_va)
 		*hgei_va = NULL;
 	if (hgei_pa)
@@ -610,6 +610,14 @@ int kvm_riscv_aia_init(void)
 	if (kvm_riscv_aia_nr_hgei)
 		kvm_riscv_aia_nr_hgei--;
 
+	/*
+	 * Number of usable HGEI lines should be minimum of per-HART
+	 * IMSIC guest files and number of bits in HGEIE
+	 *
+	 * TODO: To be updated later by AIA IMSIC HW guest file support
+	 */
+	kvm_riscv_aia_nr_hgei = 0;
+
 	/* Initialize guest external interrupt line management */
 	rc = aia_hgei_init();
 	if (rc)
-- 
2.34.1


