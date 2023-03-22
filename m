From: Jason A. Donenfeld <Jason@zx2c4.com>
Date: Wed, 22 Mar 2023 13:09:07 +0100
Subject: [PATCH] riscv: require alternatives framework when selecting FPU support
In-Reply-To: <ZBruFRwt3rUVngPu@zx2c4.com>
References: <ZBruFRwt3rUVngPu@zx2c4.com>
Message-ID: <20230322120907.2968494-1-Jason@zx2c4.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When moving switch_to's has_fpu() over to using riscv_has_extension_
likely() rather than static branchs, the FPU code gained a dependency on
the alternatives framework. If CONFIG_RISCV_ALTERNATIVE isn't selected
when CONFIG_FPU is, then has_fpu() returns false, and switch_to does not
work as intended. So select CONFIG_RISCV_ALTERNATIVE when CONFIG_FPU is
selected.

Fixes: 702e64550b12 ("riscv: fpu: switch has_fpu() to riscv_has_extension_likely()")
Link: https://lore.kernel.org/all/ZBruFRwt3rUVngPu at zx2c4.com/
Cc: Jisheng Zhang <jszhang@kernel.org>
Cc: Andrew Jones <ajones@ventanamicro.com>
Cc: Heiko Stuebner <heiko@sntech.de>
Cc: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index c5e42cc37604..0f59350c699d 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -467,6 +467,7 @@ config TOOLCHAIN_HAS_ZIHINTPAUSE
 config FPU
 	bool "FPU support"
 	default y
+	select RISCV_ALTERNATIVE
 	help
 	  Say N here if you want to disable all floating-point related procedure
 	  in the kernel.
-- 
2.40.0


