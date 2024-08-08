From: Andrew Jones <andrew.jones@linux.dev>
Date: Thu,  8 Aug 2024 15:02:32 +0200
Subject: [kvm-unit-tests PATCH 2/3] riscv: Build with explicit ABI
In-Reply-To: <20240808130229.47415-5-andrew.jones@linux.dev>
References: <20240808130229.47415-5-andrew.jones@linux.dev>
Message-ID: <20240808130229.47415-7-andrew.jones@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

If we add -mabi to the command line then compilers that are built
to support multiple ABIs may be used for both rv32 and rv64 builds,
so add it for that reason. We also need the right linker flags, so
add those too and throw in a trimming of the ISA string (drop fd)
in order to keep it minimal.

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 riscv/Makefile | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/riscv/Makefile b/riscv/Makefile
index b0cd613fcd8c..7906cef7f199 100644
--- a/riscv/Makefile
+++ b/riscv/Makefile
@@ -64,13 +64,15 @@ define arch_elf_check =
 		$(error $(1) has unsupported reloc types))
 endef
 
-ISA_COMMON = mafdc_zicsr_zifencei_zihintpause
+ISA_COMMON = imac_zicsr_zifencei_zihintpause
 
 ifeq ($(ARCH),riscv64)
-CFLAGS += -march=rv64i$(ISA_COMMON)
-CFLAGS += -DCONFIG_64BIT
+CFLAGS  += -DCONFIG_64BIT
+CFLAGS  += -mabi=lp64 -march=rv64$(ISA_COMMON)
+LDFLAGS += -melf64lriscv
 else ifeq ($(ARCH),riscv32)
-CFLAGS += -march=rv32i$(ISA_COMMON)
+CFLAGS  += -mabi=ilp32 -march=rv32$(ISA_COMMON)
+LDFLAGS += -melf32lriscv
 endif
 CFLAGS += -DCONFIG_RELOC
 CFLAGS += -mcmodel=medany
-- 
2.45.2


