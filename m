From: Andy Chiu <andy.chiu@sifive.com>
Date: Fri, 24 Feb 2023 17:01:05 +0000
Subject: [PATCH -next v14 06/19] riscv: Introduce Vector enable/disable helpers
In-Reply-To: <20230224170118.16766-1-andy.chiu@sifive.com>
References: <20230224170118.16766-1-andy.chiu@sifive.com>
Message-ID: <20230224170118.16766-7-andy.chiu@sifive.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Greentime Hu <greentime.hu@sifive.com>

These are small and likely to be frequently called so implement as
inline routines (vs. function call).

Co-developed-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Vineet Gupta <vineetg@rivosinc.com>
[vineetg: create new patch from meshup, introduced asm variant]
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
[andy.chiu: remove calls from asm thus remove asm vaiant]
---
 arch/riscv/include/asm/vector.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index 427a3b51df72..dfe5a321b2b4 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -11,12 +11,23 @@
 #ifdef CONFIG_RISCV_ISA_V
 
 #include <asm/hwcap.h>
+#include <asm/csr.h>
 
 static __always_inline bool has_vector(void)
 {
 	return riscv_has_extension_likely(RISCV_ISA_EXT_v);
 }
 
+static __always_inline void riscv_v_enable(void)
+{
+	csr_set(CSR_SSTATUS, SR_VS);
+}
+
+static __always_inline void riscv_v_disable(void)
+{
+	csr_clear(CSR_SSTATUS, SR_VS);
+}
+
 #else /* ! CONFIG_RISCV_ISA_V  */
 
 static __always_inline bool has_vector(void) { return false; }
-- 
2.17.1


