From: Andy Chiu <andy.chiu@sifive.com>
Date: Mon,  5 Jun 2023 11:07:17 +0000
Subject: [PATCH -next v21 20/27] riscv: hwcap: change ELF_HWCAP to a function
In-Reply-To: <20230605110724.21391-1-andy.chiu@sifive.com>
References: <20230605110724.21391-1-andy.chiu@sifive.com>
Message-ID: <20230605110724.21391-21-andy.chiu@sifive.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Using a function is flexible to represent ELF_HWCAP. So the kernel may
encode hwcap reflecting supported hardware features just at the moment of
the start of each program.

This will be helpful when we introduce prctl/sysctl interface to control
per-process availability of Vector extension in following patches.
Programs started with V disabled should see V masked off in theirs
ELF_HWCAP.

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
 arch/riscv/include/asm/elf.h   | 2 +-
 arch/riscv/include/asm/hwcap.h | 2 ++
 arch/riscv/kernel/cpufeature.c | 5 +++++
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/elf.h b/arch/riscv/include/asm/elf.h
index ca23c4f6c440..c24280774caf 100644
--- a/arch/riscv/include/asm/elf.h
+++ b/arch/riscv/include/asm/elf.h
@@ -66,7 +66,7 @@ extern bool compat_elf_check_arch(Elf32_Ehdr *hdr);
  * via a bitmap that coorespends to each single-letter ISA extension.  This is
  * essentially defunct, but will remain for compatibility with userspace.
  */
-#define ELF_HWCAP	(elf_hwcap & ((1UL << RISCV_ISA_EXT_BASE) - 1))
+#define ELF_HWCAP	riscv_get_elf_hwcap()
 extern unsigned long elf_hwcap;
 
 /*
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 574385930ba7..e6c288ac4581 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -61,6 +61,8 @@
 
 #include <linux/jump_label.h>
 
+unsigned long riscv_get_elf_hwcap(void);
+
 struct riscv_isa_ext_data {
 	/* Name of the extension displayed to userspace via /proc/cpuinfo */
 	char uprop[RISCV_ISA_EXT_NAME_LEN_MAX];
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 28032b083463..29c0680652a0 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -293,6 +293,11 @@ void __init riscv_fill_hwcap(void)
 	pr_info("riscv: ELF capabilities %s\n", print_str);
 }
 
+unsigned long riscv_get_elf_hwcap(void)
+{
+	return (elf_hwcap & ((1UL << RISCV_ISA_EXT_BASE) - 1));
+}
+
 #ifdef CONFIG_RISCV_ALTERNATIVE
 /*
  * Alternative patch sites consider 48 bits when determining when to patch
-- 
2.17.1


