From: Andrew Jones <ajones@ventanamicro.com>
Date: Fri, 24 Feb 2023 17:26:28 +0100
Subject: [PATCH v6 5/8] RISC-V: cpufeatures: Put the upper 16 bits of patch ID to work
In-Reply-To: <20230224162631.405473-1-ajones@ventanamicro.com>
References: <20230224162631.405473-1-ajones@ventanamicro.com>
Message-ID: <20230224162631.405473-6-ajones@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

cpufeature IDs are consecutive integers starting at 26, so a 32-bit
patch ID allows an aircraft carrier load of feature IDs. Repurposing
the upper 16 bits still leaves a boat load of feature IDs and gains
16 bits which may be used to control patching on a per patch-site
basis.

This will be initially used in Zicboz's application to clear_page(),
as Zicboz's block size must also be considered. In that case, the
upper 16-bit value's role will be to convey the maximum block size
which the Zicboz clear_page() implementation supports.

cpufeature patch sites which need to check for the existence or
absence of other cpufeatures may also be able to make use of this.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/include/asm/alternative.h |  4 +++
 arch/riscv/kernel/cpufeature.c       | 37 +++++++++++++++++++++++++---
 2 files changed, 37 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/alternative.h b/arch/riscv/include/asm/alternative.h
index c8dea9e94310..58ccd2f8cab7 100644
--- a/arch/riscv/include/asm/alternative.h
+++ b/arch/riscv/include/asm/alternative.h
@@ -13,10 +13,14 @@
 #ifdef CONFIG_RISCV_ALTERNATIVE
 
 #include <linux/init.h>
+#include <linux/kernel.h>
 #include <linux/types.h>
 #include <linux/stddef.h>
 #include <asm/hwcap.h>
 
+#define PATCH_ID_CPUFEATURE_ID(p)		lower_16_bits(p)
+#define PATCH_ID_CPUFEATURE_VALUE(p)		upper_16_bits(p)
+
 #define RISCV_ALTERNATIVES_BOOT		0 /* alternatives applied during regular boot */
 #define RISCV_ALTERNATIVES_MODULE	1 /* alternatives applied during module-init */
 #define RISCV_ALTERNATIVES_EARLY_BOOT	2 /* alternatives applied before mmu start */
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 538779d03311..d424cd76beb1 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -274,12 +274,35 @@ void __init riscv_fill_hwcap(void)
 }
 
 #ifdef CONFIG_RISCV_ALTERNATIVE
+/*
+ * Alternative patch sites consider 48 bits when determining when to patch
+ * the old instruction sequence with the new. These bits are broken into a
+ * 16-bit vendor ID and a 32-bit patch ID. A non-zero vendor ID means the
+ * patch site is for an erratum, identified by the 32-bit patch ID. When
+ * the vendor ID is zero, the patch site is for a cpufeature. cpufeatures
+ * further break down patch ID into two 16-bit numbers. The lower 16 bits
+ * are the cpufeature ID and the upper 16 bits are used for a value specific
+ * to the cpufeature and patch site. If the upper 16 bits are zero, then it
+ * implies no specific value is specified. cpufeatures that want to control
+ * patching on a per-site basis will provide non-zero values and implement
+ * checks here. The checks return true when patching should be done, and
+ * false otherwise.
+ */
+static bool riscv_cpufeature_patch_check(u16 id, u16 value)
+{
+	if (!value)
+		return true;
+
+	return false;
+}
+
 void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
 						  struct alt_entry *end,
 						  unsigned int stage)
 {
 	struct alt_entry *alt;
 	void *oldptr, *altptr;
+	u16 id, value;
 
 	if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
 		return;
@@ -287,13 +310,19 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
 	for (alt = begin; alt < end; alt++) {
 		if (alt->vendor_id != 0)
 			continue;
-		if (alt->patch_id >= RISCV_ISA_EXT_MAX) {
-			WARN(1, "This extension id:%d is not in ISA extension list",
-				alt->patch_id);
+
+		id = PATCH_ID_CPUFEATURE_ID(alt->patch_id);
+
+		if (id >= RISCV_ISA_EXT_MAX) {
+			WARN(1, "This extension id:%d is not in ISA extension list", id);
 			continue;
 		}
 
-		if (!__riscv_isa_extension_available(NULL, alt->patch_id))
+		if (!__riscv_isa_extension_available(NULL, id))
+			continue;
+
+		value = PATCH_ID_CPUFEATURE_VALUE(alt->patch_id);
+		if (!riscv_cpufeature_patch_check(id, value))
 			continue;
 
 		oldptr = ALT_OLD_PTR(alt);
-- 
2.39.1


