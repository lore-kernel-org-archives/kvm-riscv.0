From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 03 Aug 2023 19:10:27 -0700
Subject: [PATCH 02/10] RISC-V: vector: Refactor instructions
In-Reply-To: <20230803-master-refactor-instructions-v4-v1-0-2128e61fa4ff@rivosinc.com>
References: <20230803-master-refactor-instructions-v4-v1-0-2128e61fa4ff@rivosinc.com>
Message-ID: <20230803-master-refactor-instructions-v4-v1-2-2128e61fa4ff@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Use instructions in insn.h

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/kernel/vector.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
index d67a60369e02..1433d70abdd7 100644
--- a/arch/riscv/kernel/vector.c
+++ b/arch/riscv/kernel/vector.c
@@ -18,7 +18,6 @@
 #include <asm/csr.h>
 #include <asm/elf.h>
 #include <asm/ptrace.h>
-#include <asm/bug.h>
 
 static bool riscv_v_implicit_uacc = IS_ENABLED(CONFIG_RISCV_ISA_V_DEFAULT_ENABLE);
 
@@ -56,7 +55,7 @@ static bool insn_is_vector(u32 insn_buf)
 	 * All V-related instructions, including CSR operations are 4-Byte. So,
 	 * do not handle if the instruction length is not 4-Byte.
 	 */
-	if (unlikely(GET_INSN_LENGTH(insn_buf) != 4))
+	if (unlikely(INSN_LEN(insn_buf) != 4))
 		return false;
 
 	switch (opcode) {

-- 
2.34.1


