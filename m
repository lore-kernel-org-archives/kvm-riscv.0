From: Anup Patel <apatel@ventanamicro.com>
Date: Fri,  2 Sep 2022 22:31:30 +0530
Subject: [PATCH 2/3] RISC-V: KVM: Use Svinval for local TLB maintenance when available
In-Reply-To: <20220902170131.32334-1-apatel@ventanamicro.com>
References: <20220902170131.32334-1-apatel@ventanamicro.com>
Message-ID: <20220902170131.32334-3-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We should prefer HINVAL.GVMA and HINVAL.VVMA instruction for local TLB
maintenance when underlying host supports Svinval extension.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/insn-def.h | 20 +++++++++++
 arch/riscv/kvm/tlb.c              | 60 ++++++++++++++++++++++++-------
 2 files changed, 68 insertions(+), 12 deletions(-)

diff --git a/arch/riscv/include/asm/insn-def.h b/arch/riscv/include/asm/insn-def.h
index 8fe9036efb68..246a627d16ee 100644
--- a/arch/riscv/include/asm/insn-def.h
+++ b/arch/riscv/include/asm/insn-def.h
@@ -110,4 +110,24 @@
 	__ASM_STR(.error "hlv.d requires 64-bit support")
 #endif
 
+#define SINVAL_VMA(vaddr, asid)					\
+	INSN_R(OPCODE_SYSTEM, FUNC3(0), FUNC7(11),		\
+	       __RD(0), RS1(vaddr), RS2(asid))
+
+#define SFENCE_W_INVAL()					\
+	INSN_R(OPCODE_SYSTEM, FUNC3(0), FUNC7(12),		\
+	       __RD(0), __RS1(0), __RS2(0))
+
+#define SFENCE_INVAL_IR()					\
+	INSN_R(OPCODE_SYSTEM, FUNC3(0), FUNC7(12),		\
+	       __RD(0), __RS1(0), __RS2(1))
+
+#define HINVAL_VVMA(vaddr, asid)				\
+	INSN_R(OPCODE_SYSTEM, FUNC3(0), FUNC7(19),		\
+	       __RD(0), RS1(vaddr), RS2(asid))
+
+#define HINVAL_GVMA(gaddr, vmid)				\
+	INSN_R(OPCODE_SYSTEM, FUNC3(0), FUNC7(51),		\
+	       __RD(0), RS1(gaddr), RS2(vmid))
+
 #endif /* __ASM_INSN_DEF_H */
diff --git a/arch/riscv/kvm/tlb.c b/arch/riscv/kvm/tlb.c
index 1ce3394b3acf..309d79b3e5cd 100644
--- a/arch/riscv/kvm/tlb.c
+++ b/arch/riscv/kvm/tlb.c
@@ -12,8 +12,12 @@
 #include <linux/kvm_host.h>
 #include <asm/cacheflush.h>
 #include <asm/csr.h>
+#include <asm/hwcap.h>
 #include <asm/insn-def.h>
 
+#define has_svinval()	\
+	static_branch_unlikely(&riscv_isa_ext_keys[RISCV_ISA_EXT_KEY_SVINVAL])
+
 void kvm_riscv_local_hfence_gvma_vmid_gpa(unsigned long vmid,
 					  gpa_t gpa, gpa_t gpsz,
 					  unsigned long order)
@@ -25,9 +29,17 @@ void kvm_riscv_local_hfence_gvma_vmid_gpa(unsigned long vmid,
 		return;
 	}
 
-	for (pos = gpa; pos < (gpa + gpsz); pos += BIT(order))
-		asm volatile (HFENCE_GVMA(%0, %1)
-		: : "r" (pos >> 2), "r" (vmid) : "memory");
+	if (has_svinval()) {
+		asm volatile (SFENCE_W_INVAL() ::: "memory");
+		for (pos = gpa; pos < (gpa + gpsz); pos += BIT(order))
+			asm volatile (HINVAL_GVMA(%0, %1)
+			: : "r" (pos >> 2), "r" (vmid) : "memory");
+		asm volatile (SFENCE_INVAL_IR() ::: "memory");
+	} else {
+		for (pos = gpa; pos < (gpa + gpsz); pos += BIT(order))
+			asm volatile (HFENCE_GVMA(%0, %1)
+			: : "r" (pos >> 2), "r" (vmid) : "memory");
+	}
 }
 
 void kvm_riscv_local_hfence_gvma_vmid_all(unsigned long vmid)
@@ -45,9 +57,17 @@ void kvm_riscv_local_hfence_gvma_gpa(gpa_t gpa, gpa_t gpsz,
 		return;
 	}
 
-	for (pos = gpa; pos < (gpa + gpsz); pos += BIT(order))
-		asm volatile(HFENCE_GVMA(%0, zero)
-		: : "r" (pos >> 2) : "memory");
+	if (has_svinval()) {
+		asm volatile (SFENCE_W_INVAL() ::: "memory");
+		for (pos = gpa; pos < (gpa + gpsz); pos += BIT(order))
+			asm volatile(HINVAL_GVMA(%0, zero)
+			: : "r" (pos >> 2) : "memory");
+		asm volatile (SFENCE_INVAL_IR() ::: "memory");
+	} else {
+		for (pos = gpa; pos < (gpa + gpsz); pos += BIT(order))
+			asm volatile(HFENCE_GVMA(%0, zero)
+			: : "r" (pos >> 2) : "memory");
+	}
 }
 
 void kvm_riscv_local_hfence_gvma_all(void)
@@ -70,9 +90,17 @@ void kvm_riscv_local_hfence_vvma_asid_gva(unsigned long vmid,
 
 	hgatp = csr_swap(CSR_HGATP, vmid << HGATP_VMID_SHIFT);
 
-	for (pos = gva; pos < (gva + gvsz); pos += BIT(order))
-		asm volatile(HFENCE_VVMA(%0, %1)
-		: : "r" (pos), "r" (asid) : "memory");
+	if (has_svinval()) {
+		asm volatile (SFENCE_W_INVAL() ::: "memory");
+		for (pos = gva; pos < (gva + gvsz); pos += BIT(order))
+			asm volatile(HINVAL_VVMA(%0, %1)
+			: : "r" (pos), "r" (asid) : "memory");
+		asm volatile (SFENCE_INVAL_IR() ::: "memory");
+	} else {
+		for (pos = gva; pos < (gva + gvsz); pos += BIT(order))
+			asm volatile(HFENCE_VVMA(%0, %1)
+			: : "r" (pos), "r" (asid) : "memory");
+	}
 
 	csr_write(CSR_HGATP, hgatp);
 }
@@ -102,9 +130,17 @@ void kvm_riscv_local_hfence_vvma_gva(unsigned long vmid,
 
 	hgatp = csr_swap(CSR_HGATP, vmid << HGATP_VMID_SHIFT);
 
-	for (pos = gva; pos < (gva + gvsz); pos += BIT(order))
-		asm volatile(HFENCE_VVMA(%0, zero)
-		: : "r" (pos) : "memory");
+	if (has_svinval()) {
+		asm volatile (SFENCE_W_INVAL() ::: "memory");
+		for (pos = gva; pos < (gva + gvsz); pos += BIT(order))
+			asm volatile(HINVAL_VVMA(%0, zero)
+			: : "r" (pos) : "memory");
+		asm volatile (SFENCE_INVAL_IR() ::: "memory");
+	} else {
+		for (pos = gva; pos < (gva + gvsz); pos += BIT(order))
+			asm volatile(HFENCE_VVMA(%0, zero)
+			: : "r" (pos) : "memory");
+	}
 
 	csr_write(CSR_HGATP, hgatp);
 }
-- 
2.34.1


