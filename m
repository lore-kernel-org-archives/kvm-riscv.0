From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 17 Aug 2023 18:23:46 +0200
Subject: [PATCH 2/2] KVM: selftests: Add array order helpers to riscv get-reg-list
In-Reply-To: <20230817162344.17076-4-ajones@ventanamicro.com>
References: <20230817162344.17076-4-ajones@ventanamicro.com>
Message-ID: <20230817162344.17076-6-ajones@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add a couple macros to use when filling arrays in order to ensure
the elements are placed in the right order, regardless of the
order we prefer to read them. And immediately apply the new
macro to resorting the ISA extension lists alphabetically.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 .../selftests/kvm/riscv/get-reg-list.c        | 76 ++++++++++---------
 1 file changed, 41 insertions(+), 35 deletions(-)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index d8ecacd03ecf..0ea17a5ffbed 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -20,16 +20,16 @@ bool filter_reg(__u64 reg)
 	 * So, to make life easy, just filtering out these kind of registers.
 	 */
 	switch (reg & ~REG_MASK) {
+	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_SSAIA:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_SSTC:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_SVINVAL:
-	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZIHINTPAUSE:
-	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZBB:
-	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_SSAIA:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZBA:
+	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZBB:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZBS:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZICNTR:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZICSR:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZIFENCEI:
+	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZIHINTPAUSE:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZIHPM:
 		return true;
 	default:
@@ -281,35 +281,38 @@ static const char *fp_d_id_to_str(const char *prefix, __u64 id)
 	return NULL;
 }
 
+#define KVM_ISA_EXT_ARR(ext)		\
+[KVM_RISCV_ISA_EXT_##ext] = "KVM_RISCV_ISA_EXT_" #ext
+
 static const char *isa_ext_id_to_str(__u64 id)
 {
 	/* reg_off is the offset into unsigned long kvm_isa_ext_arr[] */
 	__u64 reg_off = id & ~(REG_MASK | KVM_REG_RISCV_ISA_EXT);
 
 	static const char * const kvm_isa_ext_reg_name[] = {
-		"KVM_RISCV_ISA_EXT_A",
-		"KVM_RISCV_ISA_EXT_C",
-		"KVM_RISCV_ISA_EXT_D",
-		"KVM_RISCV_ISA_EXT_F",
-		"KVM_RISCV_ISA_EXT_H",
-		"KVM_RISCV_ISA_EXT_I",
-		"KVM_RISCV_ISA_EXT_M",
-		"KVM_RISCV_ISA_EXT_SVPBMT",
-		"KVM_RISCV_ISA_EXT_SSTC",
-		"KVM_RISCV_ISA_EXT_SVINVAL",
-		"KVM_RISCV_ISA_EXT_ZIHINTPAUSE",
-		"KVM_RISCV_ISA_EXT_ZICBOM",
-		"KVM_RISCV_ISA_EXT_ZICBOZ",
-		"KVM_RISCV_ISA_EXT_ZBB",
-		"KVM_RISCV_ISA_EXT_SSAIA",
-		"KVM_RISCV_ISA_EXT_V",
-		"KVM_RISCV_ISA_EXT_SVNAPOT",
-		"KVM_RISCV_ISA_EXT_ZBA",
-		"KVM_RISCV_ISA_EXT_ZBS",
-		"KVM_RISCV_ISA_EXT_ZICNTR",
-		"KVM_RISCV_ISA_EXT_ZICSR",
-		"KVM_RISCV_ISA_EXT_ZIFENCEI",
-		"KVM_RISCV_ISA_EXT_ZIHPM",
+		KVM_ISA_EXT_ARR(A),
+		KVM_ISA_EXT_ARR(C),
+		KVM_ISA_EXT_ARR(D),
+		KVM_ISA_EXT_ARR(F),
+		KVM_ISA_EXT_ARR(H),
+		KVM_ISA_EXT_ARR(I),
+		KVM_ISA_EXT_ARR(M),
+		KVM_ISA_EXT_ARR(V),
+		KVM_ISA_EXT_ARR(SSAIA),
+		KVM_ISA_EXT_ARR(SSTC),
+		KVM_ISA_EXT_ARR(SVINVAL),
+		KVM_ISA_EXT_ARR(SVNAPOT),
+		KVM_ISA_EXT_ARR(SVPBMT),
+		KVM_ISA_EXT_ARR(ZBA),
+		KVM_ISA_EXT_ARR(ZBB),
+		KVM_ISA_EXT_ARR(ZBS),
+		KVM_ISA_EXT_ARR(ZICBOM),
+		KVM_ISA_EXT_ARR(ZICBOZ),
+		KVM_ISA_EXT_ARR(ZICNTR),
+		KVM_ISA_EXT_ARR(ZICSR),
+		KVM_ISA_EXT_ARR(ZIFENCEI),
+		KVM_ISA_EXT_ARR(ZIHINTPAUSE),
+		KVM_ISA_EXT_ARR(ZIHPM),
 	};
 
 	if (reg_off >= ARRAY_SIZE(kvm_isa_ext_reg_name)) {
@@ -323,19 +326,22 @@ static const char *isa_ext_id_to_str(__u64 id)
 	return kvm_isa_ext_reg_name[reg_off];
 }
 
+#define KVM_SBI_EXT_ARR(ext)		\
+[ext] = "KVM_REG_RISCV_SBI_SINGLE | " #ext
+
 static const char *sbi_ext_single_id_to_str(__u64 reg_off)
 {
 	/* reg_off is KVM_RISCV_SBI_EXT_ID */
 	static const char * const kvm_sbi_ext_reg_name[] = {
-		"KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_V01",
-		"KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_TIME",
-		"KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_IPI",
-		"KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_RFENCE",
-		"KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_SRST",
-		"KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_HSM",
-		"KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_PMU",
-		"KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_EXPERIMENTAL",
-		"KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_VENDOR",
+		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_V01),
+		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_TIME),
+		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_IPI),
+		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_RFENCE),
+		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_SRST),
+		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_HSM),
+		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_PMU),
+		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_EXPERIMENTAL),
+		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_VENDOR),
 	};
 
 	if (reg_off >= ARRAY_SIZE(kvm_sbi_ext_reg_name)) {
-- 
2.41.0


