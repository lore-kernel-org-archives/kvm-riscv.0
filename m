From: Jisheng Zhang <jszhang@kernel.org>
Date: Thu, 12 Jan 2023 01:10:24 +0800
Subject: [PATCH v3 10/13] riscv: alternative: patch alternatives in the vDSO
In-Reply-To: <20230111171027.2392-1-jszhang@kernel.org>
References: <20230111171027.2392-1-jszhang@kernel.org>
Message-ID: <20230111171027.2392-11-jszhang@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Make it possible to use alternatives in the vDSO, so that better
implementations can be used if possible.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Reviewed-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/vdso.h     |  4 ++++
 arch/riscv/kernel/alternative.c   | 25 +++++++++++++++++++++++++
 arch/riscv/kernel/vdso.c          |  5 -----
 arch/riscv/kernel/vdso/vdso.lds.S |  7 +++++++
 4 files changed, 36 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/include/asm/vdso.h b/arch/riscv/include/asm/vdso.h
index a7644f46d0e5..f891478829a5 100644
--- a/arch/riscv/include/asm/vdso.h
+++ b/arch/riscv/include/asm/vdso.h
@@ -28,8 +28,12 @@
 #define COMPAT_VDSO_SYMBOL(base, name)						\
 	(void __user *)((unsigned long)(base) + compat__vdso_##name##_offset)
 
+extern char compat_vdso_start[], compat_vdso_end[];
+
 #endif /* CONFIG_COMPAT */
 
+extern char vdso_start[], vdso_end[];
+
 #endif /* !__ASSEMBLY__ */
 
 #endif /* CONFIG_MMU */
diff --git a/arch/riscv/kernel/alternative.c b/arch/riscv/kernel/alternative.c
index 3d4f1f32c7f6..a883a309139f 100644
--- a/arch/riscv/kernel/alternative.c
+++ b/arch/riscv/kernel/alternative.c
@@ -11,7 +11,9 @@
 #include <linux/cpu.h>
 #include <linux/uaccess.h>
 #include <asm/alternative.h>
+#include <asm/module.h>
 #include <asm/sections.h>
+#include <asm/vdso.h>
 #include <asm/vendorid_list.h>
 #include <asm/sbi.h>
 #include <asm/csr.h>
@@ -160,6 +162,27 @@ static void __init_or_module _apply_alternatives(struct alt_entry *begin,
 				stage);
 }
 
+static void __init apply_vdso_alternatives(void)
+{
+	const struct elf64_hdr *hdr;
+	const struct elf64_shdr *shdr;
+	const struct elf64_shdr *alt;
+	struct alt_entry *begin, *end;
+
+	hdr = (struct elf64_hdr *)vdso_start;
+	shdr = (void *)hdr + hdr->e_shoff;
+	alt = find_section(hdr, shdr, ".alternative");
+	if (!alt)
+		return;
+
+	begin = (void *)hdr + alt->sh_offset,
+	end = (void *)hdr + alt->sh_offset + alt->sh_size,
+
+	_apply_alternatives((struct alt_entry *)begin,
+			    (struct alt_entry *)end,
+			    RISCV_ALTERNATIVES_BOOT);
+}
+
 void __init apply_boot_alternatives(void)
 {
 	/* If called on non-boot cpu things could go wrong */
@@ -168,6 +191,8 @@ void __init apply_boot_alternatives(void)
 	_apply_alternatives((struct alt_entry *)__alt_start,
 			    (struct alt_entry *)__alt_end,
 			    RISCV_ALTERNATIVES_BOOT);
+
+	apply_vdso_alternatives();
 }
 
 /*
diff --git a/arch/riscv/kernel/vdso.c b/arch/riscv/kernel/vdso.c
index e410275918ac..4e631c098f4d 100644
--- a/arch/riscv/kernel/vdso.c
+++ b/arch/riscv/kernel/vdso.c
@@ -22,11 +22,6 @@ struct vdso_data {
 };
 #endif
 
-extern char vdso_start[], vdso_end[];
-#ifdef CONFIG_COMPAT
-extern char compat_vdso_start[], compat_vdso_end[];
-#endif
-
 enum vvar_pages {
 	VVAR_DATA_PAGE_OFFSET,
 	VVAR_TIMENS_PAGE_OFFSET,
diff --git a/arch/riscv/kernel/vdso/vdso.lds.S b/arch/riscv/kernel/vdso/vdso.lds.S
index 150b1a572e61..4a0606633290 100644
--- a/arch/riscv/kernel/vdso/vdso.lds.S
+++ b/arch/riscv/kernel/vdso/vdso.lds.S
@@ -40,6 +40,13 @@ SECTIONS
 	. = 0x800;
 	.text		: { *(.text .text.*) }		:text
 
+	. = ALIGN(4);
+	.alternative : {
+		__alt_start = .;
+		*(.alternative)
+		__alt_end = .;
+	}
+
 	.data		: {
 		*(.got.plt) *(.got)
 		*(.data .data.* .gnu.linkonce.d.*)
-- 
2.38.1


