From: Andrew Jones <andrew.jones@linux.dev>
Date: Fri, 26 Jan 2024 15:23:39 +0100
Subject: [kvm-unit-tests PATCH v2 14/24] riscv: Compile with march
In-Reply-To: <20240126142324.66674-26-andrew.jones@linux.dev>
References: <20240126142324.66674-26-andrew.jones@linux.dev>
Message-ID: <20240126142324.66674-40-andrew.jones@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Tell the compiler to provide mnemonics for instructions we depend on,
such as 'pause'. Specifying march also allows extensions which affect
compilation to be individually [un]selected. For example, building
without compressed (2 byte) instructions may be desirable, so 'c' may
be removed from the march isa string.

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
Acked-by: Thomas Huth <thuth@redhat.com>
---
 riscv/Makefile | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/riscv/Makefile b/riscv/Makefile
index 4a83f27f7df2..697a3beb2703 100644
--- a/riscv/Makefile
+++ b/riscv/Makefile
@@ -55,8 +55,13 @@ define arch_elf_check =
 		$(error $(1) has unsupported reloc types))
 endef
 
+ISA_COMMON = mafdc_zicsr_zifencei_zihintpause
+
 ifeq ($(ARCH),riscv64)
+CFLAGS += -march=rv64i$(ISA_COMMON)
 CFLAGS += -DCONFIG_64BIT
+else ifeq ($(ARCH),riscv32)
+CFLAGS += -march=rv32i$(ISA_COMMON)
 endif
 CFLAGS += -DCONFIG_RELOC
 CFLAGS += -mcmodel=medany
-- 
2.43.0


