From: Atish Patra <atishp@rivosinc.com>
Date: Fri,  4 Mar 2022 02:10:23 -0800
Subject: [RFC PATCH kvmtool 3/3] riscv: Add Sstc extension support
In-Reply-To: <20220304101023.764631-1-atishp@rivosinc.com>
References: <20220304101023.764631-1-atishp@rivosinc.com>
Message-ID: <20220304101023.764631-4-atishp@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Sstc extension allows the guest OS to program the timer directly without
relying on the SBI call. The kernel detects the presence of Sstc extnesion
from the riscv,isa DT property. Add the Sstc extension to the device tree
if it is supported by the host.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 riscv/fdt.c             | 1 +
 riscv/include/asm/kvm.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/riscv/fdt.c b/riscv/fdt.c
index 2e69bd219fe5..a2bea5e17749 100644
--- a/riscv/fdt.c
+++ b/riscv/fdt.c
@@ -18,6 +18,7 @@ struct isa_ext_info {
 };
 
 struct isa_ext_info isa_info_arr[] = {
+	{"sstc", KVM_RISCV_ISA_EXT_SSTC},
 };
 
 static void dump_fdt(const char *dtb_file, void *fdt)
diff --git a/riscv/include/asm/kvm.h b/riscv/include/asm/kvm.h
index e01678aa2a55..c7c313272c0b 100644
--- a/riscv/include/asm/kvm.h
+++ b/riscv/include/asm/kvm.h
@@ -97,6 +97,7 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_H,
 	KVM_RISCV_ISA_EXT_I,
 	KVM_RISCV_ISA_EXT_M,
+	KVM_RISCV_ISA_EXT_SSTC,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
-- 
2.30.2


