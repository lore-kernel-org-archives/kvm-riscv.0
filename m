From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 18 Nov 2021 00:39:10 -0800
Subject: [PATCH v5 3/5] RISC-V: KVM: Add SBI v0.2 base extension
In-Reply-To: <20211118083912.981995-1-atishp@rivosinc.com>
References: <20211118083912.981995-1-atishp@rivosinc.com>
Message-ID: <20211118083912.981995-4-atishp@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Atish Patra <atish.patra@wdc.com>

SBI v0.2 base extension defined to allow backward compatibility and
probing of future extensions. This is also the only mandatory SBI
extension that must be implemented by SBI implementors.

Reviewed-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Atish Patra <atish.patra@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/kvm_vcpu_sbi.h |  2 +
 arch/riscv/include/asm/sbi.h          |  8 +++
 arch/riscv/kvm/Makefile               |  1 +
 arch/riscv/kvm/vcpu_sbi.c             |  3 +-
 arch/riscv/kvm/vcpu_sbi_base.c        | 70 +++++++++++++++++++++++++++
 5 files changed, 83 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/kvm/vcpu_sbi_base.c

diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
index 704151969ceb..76e4e17a3e00 100644
--- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
+++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
@@ -9,6 +9,8 @@
 #ifndef __RISCV_KVM_VCPU_SBI_H__
 #define __RISCV_KVM_VCPU_SBI_H__
 
+#define KVM_SBI_IMPID 3
+
 #define KVM_SBI_VERSION_MAJOR 0
 #define KVM_SBI_VERSION_MINOR 2
 
diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 0d42693cb65e..4f9370b6032e 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -27,6 +27,14 @@ enum sbi_ext_id {
 	SBI_EXT_IPI = 0x735049,
 	SBI_EXT_RFENCE = 0x52464E43,
 	SBI_EXT_HSM = 0x48534D,
+
+	/* Experimentals extensions must lie within this range */
+	SBI_EXT_EXPERIMENTAL_START = 0x0800000,
+	SBI_EXT_EXPERIMENTAL_END = 0x08FFFFFF,
+
+	/* Vendor extensions must lie within this range */
+	SBI_EXT_VENDOR_START = 0x09000000,
+	SBI_EXT_VENDOR_END = 0x09FFFFFF,
 };
 
 enum sbi_ext_base_fid {
diff --git a/arch/riscv/kvm/Makefile b/arch/riscv/kvm/Makefile
index d3d5ff3a6019..84c02922a329 100644
--- a/arch/riscv/kvm/Makefile
+++ b/arch/riscv/kvm/Makefile
@@ -24,4 +24,5 @@ kvm-y += vcpu_fp.o
 kvm-y += vcpu_switch.o
 kvm-y += vcpu_sbi.o
 kvm-$(CONFIG_RISCV_SBI_V01) += vcpu_sbi_v01.o
+kvm-y += vcpu_sbi_base.o
 kvm-y += vcpu_timer.o
diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
index a8e0191cd9fc..915a044a0b4f 100644
--- a/arch/riscv/kvm/vcpu_sbi.c
+++ b/arch/riscv/kvm/vcpu_sbi.c
@@ -39,9 +39,10 @@ static const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_v01 = {
 	.handler = NULL,
 };
 #endif
-
+extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_base;
 static const struct kvm_vcpu_sbi_extension *sbi_ext[] = {
 	&vcpu_sbi_ext_v01,
+	&vcpu_sbi_ext_base,
 };
 
 void kvm_riscv_vcpu_sbi_forward(struct kvm_vcpu *vcpu, struct kvm_run *run)
diff --git a/arch/riscv/kvm/vcpu_sbi_base.c b/arch/riscv/kvm/vcpu_sbi_base.c
new file mode 100644
index 000000000000..641015549d12
--- /dev/null
+++ b/arch/riscv/kvm/vcpu_sbi_base.c
@@ -0,0 +1,70 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2021 Western Digital Corporation or its affiliates.
+ *
+ * Authors:
+ *     Atish Patra <atish.patra@wdc.com>
+ */
+
+#include <linux/errno.h>
+#include <linux/err.h>
+#include <linux/kvm_host.h>
+#include <asm/csr.h>
+#include <asm/sbi.h>
+#include <asm/kvm_vcpu_timer.h>
+#include <asm/kvm_vcpu_sbi.h>
+
+static int kvm_sbi_ext_base_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
+				    unsigned long *out_val,
+				    struct kvm_cpu_trap *trap, bool *exit)
+{
+	int ret = 0;
+	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
+	struct sbiret ecall_ret;
+
+	switch (cp->a6) {
+	case SBI_EXT_BASE_GET_SPEC_VERSION:
+		*out_val = (KVM_SBI_VERSION_MAJOR <<
+			    SBI_SPEC_VERSION_MAJOR_SHIFT) |
+			    KVM_SBI_VERSION_MINOR;
+		break;
+	case SBI_EXT_BASE_GET_IMP_ID:
+		*out_val = KVM_SBI_IMPID;
+		break;
+	case SBI_EXT_BASE_GET_IMP_VERSION:
+		*out_val = 0;
+		break;
+	case SBI_EXT_BASE_PROBE_EXT:
+		*out_val = kvm_vcpu_sbi_find_ext(cp->a0) ? 1 : 0;
+		if ((!*out_val) &&
+		    ((cp->a0 >= SBI_EXT_EXPERIMENTAL_START &&
+		     cp->a0 <= SBI_EXT_EXPERIMENTAL_END) ||
+		    ((cp->a0 >= SBI_EXT_VENDOR_START &&
+		     cp->a0 <= SBI_EXT_VENDOR_END)))) {
+		/* For experimental/vendor extensions forward to the userspace*/
+			kvm_riscv_vcpu_sbi_forward(vcpu, run);
+			*exit = true;
+		}
+		break;
+	case SBI_EXT_BASE_GET_MVENDORID:
+	case SBI_EXT_BASE_GET_MARCHID:
+	case SBI_EXT_BASE_GET_MIMPID:
+		ecall_ret = sbi_ecall(SBI_EXT_BASE, cp->a6, 0, 0, 0, 0, 0, 0);
+		if (!ecall_ret.error)
+			*out_val = ecall_ret.value;
+		/*TODO: We are unnecessarily converting the error twice */
+		ret = sbi_err_map_linux_errno(ecall_ret.error);
+		break;
+	default:
+		ret = -EOPNOTSUPP;
+		break;
+	}
+
+	return ret;
+}
+
+const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_base = {
+	.extid_start = SBI_EXT_BASE,
+	.extid_end = SBI_EXT_BASE,
+	.handler = kvm_sbi_ext_base_handler,
+};
-- 
2.33.1


