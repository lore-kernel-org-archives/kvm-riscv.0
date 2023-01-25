From: Andy Chiu <andy.chiu@sifive.com>
Date: Wed, 25 Jan 2023 14:20:39 +0000
Subject: [PATCH -next v13 02/19] riscv: Extending cpufeature.c to detect V-extension
In-Reply-To: <20230125142056.18356-1-andy.chiu@sifive.com>
References: <20230125142056.18356-1-andy.chiu@sifive.com>
Message-ID: <20230125142056.18356-3-andy.chiu@sifive.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Guo Ren <ren_guo@c-sky.com>

Add V-extension into riscv_isa_ext_keys array and detect it with isa
string parsing.

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Suggested-by: Vineet Gupta <vineetg@rivosinc.com>
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
 arch/riscv/include/asm/hwcap.h      |  4 ++++
 arch/riscv/include/asm/vector.h     | 26 ++++++++++++++++++++++++++
 arch/riscv/include/uapi/asm/hwcap.h |  1 +
 arch/riscv/kernel/cpufeature.c      | 12 ++++++++++++
 4 files changed, 43 insertions(+)
 create mode 100644 arch/riscv/include/asm/vector.h

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 57439da71c77..f413db6118e5 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -35,6 +35,7 @@ extern unsigned long elf_hwcap;
 #define RISCV_ISA_EXT_m		('m' - 'a')
 #define RISCV_ISA_EXT_s		('s' - 'a')
 #define RISCV_ISA_EXT_u		('u' - 'a')
+#define RISCV_ISA_EXT_v		('v' - 'a')
 
 /*
  * Increse this to higher value as kernel support more ISA extensions.
@@ -73,6 +74,7 @@ static_assert(RISCV_ISA_EXT_ID_MAX <= RISCV_ISA_EXT_MAX);
 enum riscv_isa_ext_key {
 	RISCV_ISA_EXT_KEY_FPU,		/* For 'F' and 'D' */
 	RISCV_ISA_EXT_KEY_SVINVAL,
+	RISCV_ISA_EXT_KEY_VECTOR,	/* For 'V' */
 	RISCV_ISA_EXT_KEY_ZIHINTPAUSE,
 	RISCV_ISA_EXT_KEY_MAX,
 };
@@ -95,6 +97,8 @@ static __always_inline int riscv_isa_ext2key(int num)
 		return RISCV_ISA_EXT_KEY_FPU;
 	case RISCV_ISA_EXT_SVINVAL:
 		return RISCV_ISA_EXT_KEY_SVINVAL;
+	case RISCV_ISA_EXT_v:
+		return RISCV_ISA_EXT_KEY_VECTOR;
 	case RISCV_ISA_EXT_ZIHINTPAUSE:
 		return RISCV_ISA_EXT_KEY_ZIHINTPAUSE;
 	default:
diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
new file mode 100644
index 000000000000..917c8867e702
--- /dev/null
+++ b/arch/riscv/include/asm/vector.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (C) 2020 SiFive
+ */
+
+#ifndef __ASM_RISCV_VECTOR_H
+#define __ASM_RISCV_VECTOR_H
+
+#include <linux/types.h>
+
+#ifdef CONFIG_RISCV_ISA_V
+
+#include <asm/hwcap.h>
+
+static __always_inline bool has_vector(void)
+{
+	return static_branch_likely(&riscv_isa_ext_keys[RISCV_ISA_EXT_KEY_VECTOR]);
+}
+
+#else /* ! CONFIG_RISCV_ISA_V  */
+
+static __always_inline bool has_vector(void) { return false; }
+
+#endif /* CONFIG_RISCV_ISA_V */
+
+#endif /* ! __ASM_RISCV_VECTOR_H */
diff --git a/arch/riscv/include/uapi/asm/hwcap.h b/arch/riscv/include/uapi/asm/hwcap.h
index 46dc3f5ee99f..c52bb7bbbabe 100644
--- a/arch/riscv/include/uapi/asm/hwcap.h
+++ b/arch/riscv/include/uapi/asm/hwcap.h
@@ -21,5 +21,6 @@
 #define COMPAT_HWCAP_ISA_F	(1 << ('F' - 'A'))
 #define COMPAT_HWCAP_ISA_D	(1 << ('D' - 'A'))
 #define COMPAT_HWCAP_ISA_C	(1 << ('C' - 'A'))
+#define COMPAT_HWCAP_ISA_V	(1 << ('V' - 'A'))
 
 #endif /* _UAPI_ASM_RISCV_HWCAP_H */
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index dde0e91d7668..c433899542ff 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -101,6 +101,7 @@ void __init riscv_fill_hwcap(void)
 	isa2hwcap['f' - 'a'] = COMPAT_HWCAP_ISA_F;
 	isa2hwcap['d' - 'a'] = COMPAT_HWCAP_ISA_D;
 	isa2hwcap['c' - 'a'] = COMPAT_HWCAP_ISA_C;
+	isa2hwcap['v' - 'a'] = COMPAT_HWCAP_ISA_V;
 
 	elf_hwcap = 0;
 
@@ -256,6 +257,17 @@ void __init riscv_fill_hwcap(void)
 		elf_hwcap &= ~COMPAT_HWCAP_ISA_F;
 	}
 
+	if (elf_hwcap & COMPAT_HWCAP_ISA_V) {
+#ifndef CONFIG_RISCV_ISA_V
+		/*
+		 * ISA string in device tree might have 'v' flag, but
+		 * CONFIG_RISCV_ISA_V is disabled in kernel.
+		 * Clear V flag in elf_hwcap if CONFIG_RISCV_ISA_V is disabled.
+		 */
+		elf_hwcap &= ~COMPAT_HWCAP_ISA_V;
+#endif
+	}
+
 	memset(print_str, 0, sizeof(print_str));
 	for (i = 0, j = 0; i < NUM_ALPHA_EXTS; i++)
 		if (riscv_isa[0] & BIT_MASK(i))
-- 
2.17.1


