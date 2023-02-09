From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu,  9 Feb 2023 16:26:25 +0100
Subject: [PATCH v4 5/8] RISC-V: cpufeature: Put vendor_id to work
In-Reply-To: <20230209152628.129914-1-ajones@ventanamicro.com>
References: <20230209152628.129914-1-ajones@ventanamicro.com>
Message-ID: <20230209152628.129914-6-ajones@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When [ab]using alternatives as cpufeature "static keys", which can
be used in assembly, also put vendor_id to work as application-
specific data. This will be initially used in Zicboz's application to
clear_page(), as Zicboz's block size must also be considered. In that
case, vendor_id's role will be to convey the maximum block size which
the Zicboz clear_page() implementation supports.

cpufeature alternative applications which need to check for the
existence or absence of other cpufeatures may also be able to make
use of this.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kernel/cpufeature.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 0d2db03cf167..74736b4f0624 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -278,6 +278,11 @@ void __init riscv_fill_hwcap(void)
 }
 
 #ifdef CONFIG_RISCV_ALTERNATIVE
+static bool riscv_cpufeature_application_check(u32 feature, u16 data)
+{
+	return data == 0;
+}
+
 void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
 						  struct alt_entry *end,
 						  unsigned int stage)
@@ -289,8 +294,6 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
 		return;
 
 	for (alt = begin; alt < end; alt++) {
-		if (alt->vendor_id != 0)
-			continue;
 		if (alt->errata_id >= RISCV_ISA_EXT_MAX) {
 			WARN(1, "This extension id:%d is not in ISA extension list",
 				alt->errata_id);
@@ -300,6 +303,9 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
 		if (!__riscv_isa_extension_available(NULL, alt->errata_id))
 			continue;
 
+		if (!riscv_cpufeature_application_check(alt->errata_id, alt->vendor_id))
+			continue;
+
 		oldptr = ALT_OLD_PTR(alt);
 		altptr = ALT_ALT_PTR(alt);
 		patch_text_nosync(oldptr, altptr, alt->alt_len);
-- 
2.39.1


