From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 25 Jul 2023 20:54:30 +0530
Subject: [kvmtool PATCH 6/6] riscv: Fix guest/init linkage for multilib toolchain
In-Reply-To: <20230725152430.3351564-1-apatel@ventanamicro.com>
References: <20230725152430.3351564-1-apatel@ventanamicro.com>
Message-ID: <20230725152430.3351564-7-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

For RISC-V multilib toolchains, we must specify -mabi and -march
options when linking guest/init.

Fixes: 2e99678314c2 ("riscv: Initial skeletal support")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
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


