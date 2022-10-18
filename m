From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 18 Oct 2022 19:38:50 +0530
Subject: [PATCH kvmtool 2/6] riscv: Add Svinval extension support
In-Reply-To: <20221018140854.69846-1-apatel@ventanamicro.com>
References: <20221018140854.69846-1-apatel@ventanamicro.com>
Message-ID: <20221018140854.69846-3-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Svinval extension allows the guest OS to perform range based TLB
maintenance efficiently. Add the Svinval extensiont to the device
tree if it is supported by the host.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 riscv/fdt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/riscv/fdt.c b/riscv/fdt.c
index e3d7717..42bc062 100644
--- a/riscv/fdt.c
+++ b/riscv/fdt.c
@@ -19,6 +19,7 @@ struct isa_ext_info {
 struct isa_ext_info isa_info_arr[] = {
 	{"svpbmt", KVM_RISCV_ISA_EXT_SVPBMT},
 	{"sstc", KVM_RISCV_ISA_EXT_SSTC},
+	{"svinval", KVM_RISCV_ISA_EXT_SVINVAL},
 };
 
 static void dump_fdt(const char *dtb_file, void *fdt)
-- 
2.34.1


