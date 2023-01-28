From: Jisheng Zhang <jszhang@kernel.org>
Date: Sun, 29 Jan 2023 01:28:48 +0800
Subject: [PATCH v5 05/13] riscv: introduce riscv_has_extension_[un]likely()
In-Reply-To: <20230128172856.3814-1-jszhang@kernel.org>
References: <20230128172856.3814-1-jszhang@kernel.org>
Message-ID: <20230128172856.3814-6-jszhang@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Generally, riscv ISA extensions are fixed for any specific hardware
platform, so a hart's features won't change after booting. This
chacteristic makes it straightforward to use a static branch to check
if a specific ISA extension is supported or not to optimize
performance.

However, some ISA extensions such as SVPBMT and ZICBOM are handled
via. the alternative sequences.

Basically, for ease of maintenance, we prefer to use static branches
in C code, but recently, Samuel found that the static branch usage in
cpu_relax() breaks building with CONFIG_CC_OPTIMIZE_FOR_SIZE[1]. As
Samuel pointed out, "Having a static branch in cpu_relax() is
problematic because that function is widely inlined, including in some
quite complex functions like in the VDSO. A quick measurement shows
this static branch is responsible by itself for around 40% of the jump
table."

Samuel's findings pointed out one of a few downsides of static branches
usage in C code to handle ISA extensions detected at boot time:
static branch's metadata in the __jump_table section, which is not
discarded after ISA extensions are finalized, wastes some space.

I want to try to solve the issue for all possible dynamic handling of
ISA extensions at boot time. Inspired by Mark[2], this patch introduces
riscv_has_extension_*() helpers, which work like static branches but
are patched using alternatives, thus the metadata can be freed after
patching.

Link: https://lore.kernel.org/linux-riscv/20220922060958.44203-1-samuel at sholland.org/ [1]
Link: https://lore.kernel.org/linux-arm-kernel/20220912162210.3626215-8-mark.rutland at arm.com/ [2]
Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/include/asm/hwcap.h | 37 ++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 8e0ee841fa77..411ef0fb5c4b 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -8,6 +8,7 @@
 #ifndef _ASM_RISCV_HWCAP_H
 #define _ASM_RISCV_HWCAP_H
 
+#include <asm/alternative-macros.h>
 #include <asm/errno.h>
 #include <linux/bits.h>
 #include <uapi/asm/hwcap.h>
@@ -99,6 +100,42 @@ static __always_inline int riscv_isa_ext2key(int num)
 	}
 }
 
+static __always_inline bool
+riscv_has_extension_likely(const unsigned long ext)
+{
+	compiletime_assert(ext < RISCV_ISA_EXT_MAX,
+			   "ext must be < RISCV_ISA_EXT_MAX");
+
+	asm_volatile_goto(
+	ALTERNATIVE("j	%l[l_no]", "nop", 0, %[ext], 1)
+	:
+	: [ext] "i" (ext)
+	:
+	: l_no);
+
+	return true;
+l_no:
+	return false;
+}
+
+static __always_inline bool
+riscv_has_extension_unlikely(const unsigned long ext)
+{
+	compiletime_assert(ext < RISCV_ISA_EXT_MAX,
+			   "ext must be < RISCV_ISA_EXT_MAX");
+
+	asm_volatile_goto(
+	ALTERNATIVE("nop", "j	%l[l_yes]", 0, %[ext], 1)
+	:
+	: [ext] "i" (ext)
+	:
+	: l_yes);
+
+	return false;
+l_yes:
+	return true;
+}
+
 unsigned long riscv_isa_extension_base(const unsigned long *isa_bitmap);
 
 #define riscv_isa_extension_mask(ext) BIT_MASK(RISCV_ISA_EXT_##ext)
-- 
2.38.1


