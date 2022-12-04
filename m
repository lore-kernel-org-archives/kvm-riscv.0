From: Jisheng Zhang <jszhang@kernel.org>
Date: Mon,  5 Dec 2022 01:46:26 +0800
Subject: [PATCH v2 07/13] riscv: fpu: switch has_fpu() to riscv_has_extension_likely()
In-Reply-To: <20221204174632.3677-1-jszhang@kernel.org>
References: <20221204174632.3677-1-jszhang@kernel.org>
Message-ID: <20221204174632.3677-8-jszhang@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Switch has_fpu() from statich branch to the new helper
riscv_has_extension_likely().

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/riscv/include/asm/switch_to.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
index 11463489fec6..60f8ca01d36e 100644
--- a/arch/riscv/include/asm/switch_to.h
+++ b/arch/riscv/include/asm/switch_to.h
@@ -59,7 +59,8 @@ static inline void __switch_to_aux(struct task_struct *prev,
 
 static __always_inline bool has_fpu(void)
 {
-	return static_branch_likely(&riscv_isa_ext_keys[RISCV_ISA_EXT_KEY_FPU]);
+	return riscv_has_extension_likely(RISCV_ISA_EXT_f) ||
+		riscv_has_extension_likely(RISCV_ISA_EXT_d);
 }
 #else
 static __always_inline bool has_fpu(void) { return false; }
-- 
2.37.2


