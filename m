From: Andrew Jones <ajones@ventanamicro.com>
Date: Tue, 21 Feb 2023 20:09:09 +0100
Subject: [PATCH v5 1/8] RISC-V: alternatives: Support patching multiple insns in assembly
In-Reply-To: <20230221190916.572454-1-ajones@ventanamicro.com>
References: <20230221190916.572454-1-ajones@ventanamicro.com>
Message-ID: <20230221190916.572454-2-ajones@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

As pointed out in commit d374a16539b1 ("RISC-V: fix compile error
from deduplicated __ALTERNATIVE_CFG_2"), we need quotes around
parameters passed to macros within macros to avoid spaces being
interpreted as separators. ALT_NEW_CONTENT was trying to handle
this by defining new_c has a vararg, but this isn't sufficient
for calling ALTERNATIVE() from assembly with multiple instructions
in the new/old sequences. Remove the vararg "hack" and use quotes.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/include/asm/alternative-macros.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/alternative-macros.h b/arch/riscv/include/asm/alternative-macros.h
index 993a44a8fdac..b8c55fb3ab2c 100644
--- a/arch/riscv/include/asm/alternative-macros.h
+++ b/arch/riscv/include/asm/alternative-macros.h
@@ -14,7 +14,7 @@
 	.4byte \patch_id
 .endm
 
-.macro ALT_NEW_CONTENT vendor_id, patch_id, enable = 1, new_c : vararg
+.macro ALT_NEW_CONTENT vendor_id, patch_id, enable = 1, new_c
 	.if \enable
 	.pushsection .alternative, "a"
 	ALT_ENTRY 886b, 888f, \vendor_id, \patch_id, 889f - 888f
@@ -41,13 +41,13 @@
 	\old_c
 	.option pop
 887 :
-	ALT_NEW_CONTENT \vendor_id, \patch_id, \enable, \new_c
+	ALT_NEW_CONTENT \vendor_id, \patch_id, \enable, "\new_c"
 .endm
 
 .macro ALTERNATIVE_CFG_2 old_c, new_c_1, vendor_id_1, patch_id_1, enable_1,	\
 				new_c_2, vendor_id_2, patch_id_2, enable_2
 	ALTERNATIVE_CFG "\old_c", "\new_c_1", \vendor_id_1, \patch_id_1, \enable_1
-	ALT_NEW_CONTENT \vendor_id_2, \patch_id_2, \enable_2, \new_c_2
+	ALT_NEW_CONTENT \vendor_id_2, \patch_id_2, \enable_2, "\new_c_2"
 .endm
 
 #define __ALTERNATIVE_CFG(...)		ALTERNATIVE_CFG __VA_ARGS__
-- 
2.39.1


