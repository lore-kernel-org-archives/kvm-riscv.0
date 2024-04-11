From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 11 Apr 2024 14:36:39 +0530
Subject: [PATCH 2/2] RISC-V: KVM: Use IMSIC guest files when available
In-Reply-To: <20240411090639.237119-1-apatel@ventanamicro.com>
References: <20240411090639.237119-1-apatel@ventanamicro.com>
Message-ID: <20240411090639.237119-3-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Let us discover and use IMSIC guest files from the IMSIC global
config provided by the IMSIC irqchip driver.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/kvm/aia.c | 33 ++++++++++++++++++++-------------
 1 file changed, 20 insertions(+), 13 deletions(-)

diff --git a/arch/riscv/kvm/aia.c b/arch/riscv/kvm/aia.c
index 8ea51a791371..596209f1a6ff 100644
--- a/arch/riscv/kvm/aia.c
+++ b/arch/riscv/kvm/aia.c
@@ -394,6 +394,8 @@ int kvm_riscv_aia_alloc_hgei(int cpu, struct kvm_vcpu *owner,
 {
 	int ret = -ENOENT;
 	unsigned long flags;
+	const struct imsic_global_config *gc;
+	const struct imsic_local_config *lc;
 	struct aia_hgei_control *hgctrl = per_cpu_ptr(&aia_hgei, cpu);
 
 	if (!kvm_riscv_aia_available() || !hgctrl)
@@ -409,11 +411,14 @@ int kvm_riscv_aia_alloc_hgei(int cpu, struct kvm_vcpu *owner,
 
 	raw_spin_unlock_irqrestore(&hgctrl->lock, flags);
 
-	/* TODO: To be updated later by AIA IMSIC HW guest file support */
-	if (hgei_va)
-		*hgei_va = NULL;
-	if (hgei_pa)
-		*hgei_pa = 0;
+	gc = imsic_get_global_config();
+	lc = (gc) ? per_cpu_ptr(gc->local, cpu) : NULL;
+	if (lc && ret > 0) {
+		if (hgei_va)
+			*hgei_va = lc->msi_va + (ret * IMSIC_MMIO_PAGE_SZ);
+		if (hgei_pa)
+			*hgei_pa = lc->msi_pa + (ret * IMSIC_MMIO_PAGE_SZ);
+	}
 
 	return ret;
 }
@@ -600,9 +605,11 @@ void kvm_riscv_aia_disable(void)
 int kvm_riscv_aia_init(void)
 {
 	int rc;
+	const struct imsic_global_config *gc;
 
 	if (!riscv_isa_extension_available(NULL, SxAIA))
 		return -ENODEV;
+	gc = imsic_get_global_config();
 
 	/* Figure-out number of bits in HGEIE */
 	csr_write(CSR_HGEIE, -1UL);
@@ -614,17 +621,17 @@ int kvm_riscv_aia_init(void)
 	/*
 	 * Number of usable HGEI lines should be minimum of per-HART
 	 * IMSIC guest files and number of bits in HGEIE
-	 *
-	 * TODO: To be updated later by AIA IMSIC HW guest file support
 	 */
-	kvm_riscv_aia_nr_hgei = 0;
+	if (gc)
+		kvm_riscv_aia_nr_hgei = min((ulong)kvm_riscv_aia_nr_hgei,
+					    BIT(gc->guest_index_bits) - 1);
+	else
+		kvm_riscv_aia_nr_hgei = 0;
 
-	/*
-	 * Find number of guest MSI IDs
-	 *
-	 * TODO: To be updated later by AIA IMSIC HW guest file support
-	 */
+	/* Find number of guest MSI IDs */
 	kvm_riscv_aia_max_ids = IMSIC_MAX_ID;
+	if (gc && kvm_riscv_aia_nr_hgei)
+		kvm_riscv_aia_max_ids = gc->nr_guest_ids + 1;
 
 	/* Initialize guest external interrupt line management */
 	rc = aia_hgei_init();
-- 
2.34.1


