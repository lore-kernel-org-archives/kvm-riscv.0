From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 20 Apr 2022 16:54:45 +0530
Subject: [PATCH v2 2/7] RISC-V: KVM: Add Sv57x4 mode support for G-stage
In-Reply-To: <20220420112450.155624-1-apatel@ventanamicro.com>
References: <20220420112450.155624-1-apatel@ventanamicro.com>
Message-ID: <20220420112450.155624-3-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Latest QEMU supports G-stage Sv57x4 mode so this patch extends KVM
RISC-V G-stage handling to detect and use Sv57x4 mode when available.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/csr.h |  1 +
 arch/riscv/kvm/main.c        |  3 +++
 arch/riscv/kvm/mmu.c         | 11 ++++++++++-
 3 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index e935f27b10fd..cc40521e438b 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -117,6 +117,7 @@
 #define HGATP_MODE_SV32X4	_AC(1, UL)
 #define HGATP_MODE_SV39X4	_AC(8, UL)
 #define HGATP_MODE_SV48X4	_AC(9, UL)
+#define HGATP_MODE_SV57X4	_AC(10, UL)
 
 #define HGATP32_MODE_SHIFT	31
 #define HGATP32_VMID_SHIFT	22
diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
index c374dad82eee..1549205fe5fe 100644
--- a/arch/riscv/kvm/main.c
+++ b/arch/riscv/kvm/main.c
@@ -105,6 +105,9 @@ int kvm_arch_init(void *opaque)
 	case HGATP_MODE_SV48X4:
 		str = "Sv48x4";
 		break;
+	case HGATP_MODE_SV57X4:
+		str = "Sv57x4";
+		break;
 	default:
 		return -ENODEV;
 	}
diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index dc0520792e31..8823eb32dcde 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -751,14 +751,23 @@ void kvm_riscv_gstage_update_hgatp(struct kvm_vcpu *vcpu)
 void kvm_riscv_gstage_mode_detect(void)
 {
 #ifdef CONFIG_64BIT
+	/* Try Sv57x4 G-stage mode */
+	csr_write(CSR_HGATP, HGATP_MODE_SV57X4 << HGATP_MODE_SHIFT);
+	if ((csr_read(CSR_HGATP) >> HGATP_MODE_SHIFT) == HGATP_MODE_SV57X4) {
+		gstage_mode = (HGATP_MODE_SV57X4 << HGATP_MODE_SHIFT);
+		gstage_pgd_levels = 5;
+		goto skip_sv48x4_test;
+	}
+
 	/* Try Sv48x4 G-stage mode */
 	csr_write(CSR_HGATP, HGATP_MODE_SV48X4 << HGATP_MODE_SHIFT);
 	if ((csr_read(CSR_HGATP) >> HGATP_MODE_SHIFT) == HGATP_MODE_SV48X4) {
 		gstage_mode = (HGATP_MODE_SV48X4 << HGATP_MODE_SHIFT);
 		gstage_pgd_levels = 4;
 	}
-	csr_write(CSR_HGATP, 0);
+skip_sv48x4_test:
 
+	csr_write(CSR_HGATP, 0);
 	__kvm_riscv_hfence_gvma_all();
 #endif
 }
-- 
2.25.1


