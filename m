From: Anup Patel <apatel@ventanamicro.com>
Date: Sat, 18 Nov 2023 18:58:47 +0530
Subject: [kvmtool PATCH v3 6/6] riscv: Fix guest/init linkage for multilib toolchain
In-Reply-To: <20231118132847.758785-1-apatel@ventanamicro.com>
References: <20231118132847.758785-1-apatel@ventanamicro.com>
Message-ID: <20231118132847.758785-7-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

For RISC-V multilib toolchains, we must specify -mabi and -march
options when linking guest/init.

Fixes: 2e99678314c2 ("riscv: Initial skeletal support")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Makefile b/Makefile
index acd5ffd..d84dc8e 100644
--- a/Makefile
+++ b/Makefile
@@ -223,9 +223,11 @@ ifeq ($(ARCH),riscv)
 	OBJS		+= riscv/aia.o
 	ifeq ($(RISCV_XLEN),32)
 		CFLAGS	+= -mabi=ilp32d -march=rv32gc
+		GUEST_INIT_FLAGS += -mabi=ilp32d -march=rv32gc
 	endif
 	ifeq ($(RISCV_XLEN),64)
 		CFLAGS	+= -mabi=lp64d -march=rv64gc
+		GUEST_INIT_FLAGS += -mabi=lp64d -march=rv64gc
 	endif
 
 	ARCH_WANT_LIBFDT := y
-- 
2.34.1


