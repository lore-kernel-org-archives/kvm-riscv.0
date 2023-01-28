From: Jisheng Zhang <jszhang@kernel.org>
Date: Sun, 29 Jan 2023 01:28:51 +0800
Subject: [PATCH v5 08/13] riscv: module: Add ADD16 and SUB16 rela types
In-Reply-To: <20230128172856.3814-1-jszhang@kernel.org>
References: <20230128172856.3814-1-jszhang@kernel.org>
Message-ID: <20230128172856.3814-9-jszhang@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Andrew Jones <ajones@ventanamicro.com>

To prepare for 16-bit relocation types to be emitted in alternatives
add support for ADD16 and SUB16.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/kernel/module.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
index 76f4b9c2ec5b..7c651d55fcbd 100644
--- a/arch/riscv/kernel/module.c
+++ b/arch/riscv/kernel/module.c
@@ -268,6 +268,13 @@ static int apply_r_riscv_align_rela(struct module *me, u32 *location,
 	return -EINVAL;
 }
 
+static int apply_r_riscv_add16_rela(struct module *me, u32 *location,
+				    Elf_Addr v)
+{
+	*(u16 *)location += (u16)v;
+	return 0;
+}
+
 static int apply_r_riscv_add32_rela(struct module *me, u32 *location,
 				    Elf_Addr v)
 {
@@ -282,6 +289,13 @@ static int apply_r_riscv_add64_rela(struct module *me, u32 *location,
 	return 0;
 }
 
+static int apply_r_riscv_sub16_rela(struct module *me, u32 *location,
+				    Elf_Addr v)
+{
+	*(u16 *)location -= (u16)v;
+	return 0;
+}
+
 static int apply_r_riscv_sub32_rela(struct module *me, u32 *location,
 				    Elf_Addr v)
 {
@@ -315,8 +329,10 @@ static int (*reloc_handlers_rela[]) (struct module *me, u32 *location,
 	[R_RISCV_CALL]			= apply_r_riscv_call_rela,
 	[R_RISCV_RELAX]			= apply_r_riscv_relax_rela,
 	[R_RISCV_ALIGN]			= apply_r_riscv_align_rela,
+	[R_RISCV_ADD16]			= apply_r_riscv_add16_rela,
 	[R_RISCV_ADD32]			= apply_r_riscv_add32_rela,
 	[R_RISCV_ADD64]			= apply_r_riscv_add64_rela,
+	[R_RISCV_SUB16]			= apply_r_riscv_sub16_rela,
 	[R_RISCV_SUB32]			= apply_r_riscv_sub32_rela,
 	[R_RISCV_SUB64]			= apply_r_riscv_sub64_rela,
 };
-- 
2.38.1


