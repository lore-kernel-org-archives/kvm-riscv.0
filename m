From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 15 Aug 2022 15:43:24 +0530
Subject: [PATCH kvmtool 4/5] riscv: Add Sstc extension support
In-Reply-To: <20220815101325.477694-1-apatel@ventanamicro.com>
References: <20220815101325.477694-1-apatel@ventanamicro.com>
Message-ID: <20220815101325.477694-5-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Atish Patra <atishp@rivosinc.com>

Sstc extension allows the guest OS to program the timer directly without
relying on the SBI call. The kernel detects the presence of Sstc extnesion
from the riscv,isa DT property. Add the Sstc extension to the device tree
if it is supported by the host.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 riscv/fdt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/riscv/fdt.c b/riscv/fdt.c
index eb7851e..aeba042 100644
--- a/riscv/fdt.c
+++ b/riscv/fdt.c
@@ -18,6 +18,7 @@ struct isa_ext_info {
 
 struct isa_ext_info isa_info_arr[] = {
 	{"svpbmt", KVM_RISCV_ISA_EXT_SVPBMT},
+	{"sstc", KVM_RISCV_ISA_EXT_SSTC},
 };
 
 static void dump_fdt(const char *dtb_file, void *fdt)
-- 
2.34.1


