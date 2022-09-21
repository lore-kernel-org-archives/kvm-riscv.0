From: Chris Stillson <stillson@rivosinc.com>
Date: Wed, 21 Sep 2022 12:46:16 -0700
Subject: [PATCH 04/17] riscv: Add vector feature to compile
In-Reply-To: <20220921194629.1480202-1-stillson@rivosinc.com>
References: <20220921194629.1480202-1-stillson@rivosinc.com>
Message-ID: <20220921194629.1480202-5-stillson@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Guo Ren <guoren@linux.alibaba.com>

This patch adds a new config option which could enable assembler's
vector feature.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Co-developed-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
---
 arch/riscv/Kconfig  | 15 +++++++++++++--
 arch/riscv/Makefile |  1 +
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index ed66c31e4655..e294d85bfb7d 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -432,7 +432,17 @@ config FPU
 
 	  If you don't know what to do here, say Y.
 
-endmenu # "Platform type"
+config VECTOR
+	bool "VECTOR support"
+	depends on GCC_VERSION >= 120000 || CLANG_VERSION >= 130000
+	default n
+	help
+	  Say N here if you want to disable all vector related procedure
+	  in the kernel.
+
+	  If you don't know what to do here, say Y.
+
+endmenu
 
 menu "Kernel features"
 
@@ -556,6 +566,7 @@ config CMDLINE_EXTEND
 	  cases where the provided arguments are insufficient and
 	  you don't want to or cannot modify them.
 
+
 config CMDLINE_FORCE
 	bool "Always use the default kernel command string"
 	help
@@ -648,7 +659,7 @@ config XIP_PHYS_ADDR
 	  be linked for and stored to.  This address is dependent on your
 	  own flash usage.
 
-endmenu # "Boot options"
+endmenu
 
 config BUILTIN_DTB
 	bool
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 3fa8ef336822..1ec17f3d6d09 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -50,6 +50,7 @@ riscv-march-$(CONFIG_ARCH_RV32I)	:= rv32ima
 riscv-march-$(CONFIG_ARCH_RV64I)	:= rv64ima
 riscv-march-$(CONFIG_FPU)		:= $(riscv-march-y)fd
 riscv-march-$(CONFIG_RISCV_ISA_C)	:= $(riscv-march-y)c
+riscv-march-$(CONFIG_VECTOR)		:= $(riscv-march-y)v
 
 # Newer binutils versions default to ISA spec version 20191213 which moves some
 # instructions from the I extension to the Zicsr and Zifencei extensions.
-- 
2.25.1


