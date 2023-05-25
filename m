From: Haibo Xu <haibo1.xu@intel.com>
Date: Thu, 25 May 2023 15:38:25 +0800
Subject: [PATCH v2 01/11] KVM: arm64: selftests: Replace str_with_index with strdup_printf
In-Reply-To: <cover.1684999824.git.haibo1.xu@intel.com>
References: <cover.1684999824.git.haibo1.xu@intel.com>
Message-ID: <ddec70e63111a2869028c356e177c4de4e1a4b8d.1684999824.git.haibo1.xu@intel.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Andrew Jones <ajones@ventanamicro.com>

The original author of aarch64/get-reg-list.c (me) was wearing
tunnel vision goggles when implementing str_with_index(). There's
no reason to have such a special case string function. Instead,
take inspiration from glib and implement strdup_printf. The
implementation builds on vasprintf() which requires _GNU_SOURCE,
but we require _GNU_SOURCE in most files already.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 .../selftests/kvm/aarch64/get-reg-list.c      | 23 ++++---------------
 .../testing/selftests/kvm/include/test_util.h |  2 ++
 tools/testing/selftests/kvm/lib/test_util.c   | 15 ++++++++++++
 3 files changed, 22 insertions(+), 18 deletions(-)

diff --git a/tools/testing/selftests/kvm/aarch64/get-reg-list.c b/tools/testing/selftests/kvm/aarch64/get-reg-list.c
index d4e1f4af29d6..c152523a5ed4 100644
--- a/tools/testing/selftests/kvm/aarch64/get-reg-list.c
+++ b/tools/testing/selftests/kvm/aarch64/get-reg-list.c
@@ -132,19 +132,6 @@ static bool find_reg(__u64 regs[], __u64 nr_regs, __u64 reg)
 	return false;
 }
 
-static const char *str_with_index(const char *template, __u64 index)
-{
-	char *str, *p;
-	int n;
-
-	str = strdup(template);
-	p = strstr(str, "##");
-	n = sprintf(p, "%lld", index);
-	strcat(p + n, strstr(template, "##") + 2);
-
-	return (const char *)str;
-}
-
 #define REG_MASK (KVM_REG_ARCH_MASK | KVM_REG_SIZE_MASK | KVM_REG_ARM_COPROC_MASK)
 
 #define CORE_REGS_XX_NR_WORDS	2
@@ -163,7 +150,7 @@ static const char *core_id_to_str(struct vcpu_config *c, __u64 id)
 	     KVM_REG_ARM_CORE_REG(regs.regs[30]):
 		idx = (core_off - KVM_REG_ARM_CORE_REG(regs.regs[0])) / CORE_REGS_XX_NR_WORDS;
 		TEST_ASSERT(idx < 31, "%s: Unexpected regs.regs index: %lld", config_name(c), idx);
-		return str_with_index("KVM_REG_ARM_CORE_REG(regs.regs[##])", idx);
+		return strdup_printf("KVM_REG_ARM_CORE_REG(regs.regs[%lld])", idx);
 	case KVM_REG_ARM_CORE_REG(regs.sp):
 		return "KVM_REG_ARM_CORE_REG(regs.sp)";
 	case KVM_REG_ARM_CORE_REG(regs.pc):
@@ -178,12 +165,12 @@ static const char *core_id_to_str(struct vcpu_config *c, __u64 id)
 	     KVM_REG_ARM_CORE_REG(spsr[KVM_NR_SPSR - 1]):
 		idx = (core_off - KVM_REG_ARM_CORE_REG(spsr[0])) / CORE_SPSR_XX_NR_WORDS;
 		TEST_ASSERT(idx < KVM_NR_SPSR, "%s: Unexpected spsr index: %lld", config_name(c), idx);
-		return str_with_index("KVM_REG_ARM_CORE_REG(spsr[##])", idx);
+		return strdup_printf("KVM_REG_ARM_CORE_REG(spsr[%lld])", idx);
 	case KVM_REG_ARM_CORE_REG(fp_regs.vregs[0]) ...
 	     KVM_REG_ARM_CORE_REG(fp_regs.vregs[31]):
 		idx = (core_off - KVM_REG_ARM_CORE_REG(fp_regs.vregs[0])) / CORE_FPREGS_XX_NR_WORDS;
 		TEST_ASSERT(idx < 32, "%s: Unexpected fp_regs.vregs index: %lld", config_name(c), idx);
-		return str_with_index("KVM_REG_ARM_CORE_REG(fp_regs.vregs[##])", idx);
+		return strdup_printf("KVM_REG_ARM_CORE_REG(fp_regs.vregs[%lld])", idx);
 	case KVM_REG_ARM_CORE_REG(fp_regs.fpsr):
 		return "KVM_REG_ARM_CORE_REG(fp_regs.fpsr)";
 	case KVM_REG_ARM_CORE_REG(fp_regs.fpcr):
@@ -212,13 +199,13 @@ static const char *sve_id_to_str(struct vcpu_config *c, __u64 id)
 		n = (id >> 5) & (KVM_ARM64_SVE_NUM_ZREGS - 1);
 		TEST_ASSERT(id == KVM_REG_ARM64_SVE_ZREG(n, 0),
 			    "%s: Unexpected bits set in SVE ZREG id: 0x%llx", config_name(c), id);
-		return str_with_index("KVM_REG_ARM64_SVE_ZREG(##, 0)", n);
+		return strdup_printf("KVM_REG_ARM64_SVE_ZREG(%lld, 0)", n);
 	case KVM_REG_ARM64_SVE_PREG_BASE ...
 	     KVM_REG_ARM64_SVE_PREG_BASE + (1ULL << 5) * KVM_ARM64_SVE_NUM_PREGS - 1:
 		n = (id >> 5) & (KVM_ARM64_SVE_NUM_PREGS - 1);
 		TEST_ASSERT(id == KVM_REG_ARM64_SVE_PREG(n, 0),
 			    "%s: Unexpected bits set in SVE PREG id: 0x%llx", config_name(c), id);
-		return str_with_index("KVM_REG_ARM64_SVE_PREG(##, 0)", n);
+		return strdup_printf("KVM_REG_ARM64_SVE_PREG(%lld, 0)", n);
 	case KVM_REG_ARM64_SVE_FFR_BASE:
 		TEST_ASSERT(id == KVM_REG_ARM64_SVE_FFR(0),
 			    "%s: Unexpected bits set in SVE FFR id: 0x%llx", config_name(c), id);
diff --git a/tools/testing/selftests/kvm/include/test_util.h b/tools/testing/selftests/kvm/include/test_util.h
index a6e9f215ce70..7e0182f837b5 100644
--- a/tools/testing/selftests/kvm/include/test_util.h
+++ b/tools/testing/selftests/kvm/include/test_util.h
@@ -186,4 +186,6 @@ static inline uint32_t atoi_non_negative(const char *name, const char *num_str)
 	return num;
 }
 
+char *strdup_printf(const char *fmt, ...) __attribute__((format(printf, 1, 2), nonnull(1)));
+
 #endif /* SELFTEST_KVM_TEST_UTIL_H */
diff --git a/tools/testing/selftests/kvm/lib/test_util.c b/tools/testing/selftests/kvm/lib/test_util.c
index b772193f6c18..3e36019eeb4a 100644
--- a/tools/testing/selftests/kvm/lib/test_util.c
+++ b/tools/testing/selftests/kvm/lib/test_util.c
@@ -5,6 +5,9 @@
  * Copyright (C) 2020, Google LLC.
  */
 
+#define _GNU_SOURCE
+#include <stdio.h>
+#include <stdarg.h>
 #include <assert.h>
 #include <ctype.h>
 #include <limits.h>
@@ -377,3 +380,15 @@ int atoi_paranoid(const char *num_str)
 
 	return num;
 }
+
+char *strdup_printf(const char *fmt, ...)
+{
+	va_list ap;
+	char *str;
+
+	va_start(ap, fmt);
+	vasprintf(&str, fmt, ap);
+	va_end(ap);
+
+	return str;
+}
-- 
2.34.1


