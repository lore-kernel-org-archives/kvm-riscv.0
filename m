From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 12 Jul 2023 22:04:57 +0530
Subject: [kvmtool PATCH v4 5/9] riscv: Sort the ISA extension array alphabetically
In-Reply-To: <20230712163501.1769737-1-apatel@ventanamicro.com>
References: <20230712163501.1769737-1-apatel@ventanamicro.com>
Message-ID: <20230712163501.1769737-6-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Let us follow alphabetical order for listing ISA extensions in
the isa_info_arr[] array.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 riscv/fdt.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/riscv/fdt.c b/riscv/fdt.c
index 3cdb95c..977e962 100644
--- a/riscv/fdt.c
+++ b/riscv/fdt.c
@@ -15,11 +15,12 @@ struct isa_ext_info {
 };
 
 struct isa_ext_info isa_info_arr[] = {
-	{"svpbmt", KVM_RISCV_ISA_EXT_SVPBMT},
+	/* sorted alphabetically */
 	{"sstc", KVM_RISCV_ISA_EXT_SSTC},
 	{"svinval", KVM_RISCV_ISA_EXT_SVINVAL},
-	{"zihintpause", KVM_RISCV_ISA_EXT_ZIHINTPAUSE},
+	{"svpbmt", KVM_RISCV_ISA_EXT_SVPBMT},
 	{"zicbom", KVM_RISCV_ISA_EXT_ZICBOM},
+	{"zihintpause", KVM_RISCV_ISA_EXT_ZIHINTPAUSE},
 };
 
 static void dump_fdt(const char *dtb_file, void *fdt)
-- 
2.34.1


