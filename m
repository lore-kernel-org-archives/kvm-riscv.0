From: Andrew Jones <ajones@ventanamicro.com>
Date: Tue, 16 Aug 2022 18:30:58 +0200
Subject: [PATCH] riscv: Ensure isa-ext static keys are writable
Message-ID: <20220816163058.3004536-1-ajones@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

riscv_isa_ext_keys[] is an array of static keys used in the unified
ISA extension framework. The keys added to this array may be used
anywhere, including in modules. Ensure the keys remain writable by
placing them in the data section.

The need to change riscv_isa_ext_keys[]'s section was found when the
kvm module started failing to load. Commit 8eb060e10185 ("arch/riscv:
add Zihintpause support") adds a static branch check for a newly
added isa-ext key to cpu_relax(), which kvm uses.

Fixes: c360cbec3511 ("riscv: introduce unified static key mechanism for ISA extensions")
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kernel/cpufeature.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 553d755483ed..3b5583db9d80 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -28,7 +28,7 @@ unsigned long elf_hwcap __read_mostly;
 /* Host ISA bitmap */
 static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
 
-__ro_after_init DEFINE_STATIC_KEY_ARRAY_FALSE(riscv_isa_ext_keys, RISCV_ISA_EXT_KEY_MAX);
+DEFINE_STATIC_KEY_ARRAY_FALSE(riscv_isa_ext_keys, RISCV_ISA_EXT_KEY_MAX);
 EXPORT_SYMBOL(riscv_isa_ext_keys);
 
 /**
-- 
2.37.1


