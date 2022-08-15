From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 15 Aug 2022 15:43:23 +0530
Subject: [PATCH kvmtool 3/5] riscv: Add Svpbmt extension support
In-Reply-To: <20220815101325.477694-1-apatel@ventanamicro.com>
References: <20220815101325.477694-1-apatel@ventanamicro.com>
Message-ID: <20220815101325.477694-4-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The Svpbmt extension allows PTE based memory attributes in page tables.
This extension also allows Guest/VM to use PTE based memory attributes
in VS-stage page tables so let us add it Guest/VM ISA string when KVM
RISC-V supports it.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 riscv/fdt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/riscv/fdt.c b/riscv/fdt.c
index 1818cf7..eb7851e 100644
--- a/riscv/fdt.c
+++ b/riscv/fdt.c
@@ -17,6 +17,7 @@ struct isa_ext_info {
 };
 
 struct isa_ext_info isa_info_arr[] = {
+	{"svpbmt", KVM_RISCV_ISA_EXT_SVPBMT},
 };
 
 static void dump_fdt(const char *dtb_file, void *fdt)
-- 
2.34.1


