From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 17 Oct 2024 09:45:40 +0200
Subject: [PATCH 1/2] RISC-V: KVM: Add SBI system suspend support
In-Reply-To: <20241017074538.18867-4-ajones@ventanamicro.com>
References: <20241017074538.18867-4-ajones@ventanamicro.com>
Message-ID: <20241017074538.18867-5-ajones@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Implement a KVM SBI SUSP extension handler. The handler only
validates the system suspend entry criteria and prepares for resuming
in the appropriate state at the resume_addr (as specified by the SBI
spec), but then it forwards the call to the VMM where any system
suspend behavior may be implemented. Since VMM support is needed, KVM
disables the extension by default.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_vcpu_sbi.h |  1 +
 arch/riscv/include/uapi/asm/kvm.h     |  1 +
 arch/riscv/kvm/Makefile               |  1 +
 arch/riscv/kvm/vcpu_sbi.c             |  4 ++
 arch/riscv/kvm/vcpu_sbi_system.c      | 73 +++++++++++++++++++++++++++
 5 files changed, 80 insertions(+)
 create mode 100644 arch/riscv/kvm/vcpu_sbi_system.c

diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
index b96705258cf9..4ed6203cdd30 100644
--- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
+++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
@@ -85,6 +85,7 @@ extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_rfence;
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_srst;
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_hsm;
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_dbcn;
+extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_susp;
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_sta;
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_experimental;
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_vendor;
diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index e97db3296456..08e04ad8b1ab 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -194,6 +194,7 @@ enum KVM_RISCV_SBI_EXT_ID {
 	KVM_RISCV_SBI_EXT_VENDOR,
 	KVM_RISCV_SBI_EXT_DBCN,
 	KVM_RISCV_SBI_EXT_STA,
+	KVM_RISCV_SBI_EXT_SUSP,
 	KVM_RISCV_SBI_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/Makefile b/arch/riscv/kvm/Makefile
index c2cacfbc06a0..4bfc6ef0e9ad 100644
--- a/arch/riscv/kvm/Makefile
+++ b/arch/riscv/kvm/Makefile
@@ -25,6 +25,7 @@ kvm-y += vcpu_sbi.o
 kvm-$(CONFIG_RISCV_SBI_V01) += vcpu_sbi_v01.o
 kvm-y += vcpu_sbi_base.o
 kvm-y += vcpu_sbi_replace.o
+kvm-y += vcpu_sbi_system.o
 kvm-y += vcpu_sbi_hsm.o
 kvm-y += vcpu_sbi_sta.o
 kvm-y += vcpu_timer.o
diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
index 7de128be8db9..7d8819640aff 100644
--- a/arch/riscv/kvm/vcpu_sbi.c
+++ b/arch/riscv/kvm/vcpu_sbi.c
@@ -70,6 +70,10 @@ static const struct kvm_riscv_sbi_extension_entry sbi_ext[] = {
 		.ext_idx = KVM_RISCV_SBI_EXT_DBCN,
 		.ext_ptr = &vcpu_sbi_ext_dbcn,
 	},
+	{
+		.ext_idx = KVM_RISCV_SBI_EXT_SUSP,
+		.ext_ptr = &vcpu_sbi_ext_susp,
+	},
 	{
 		.ext_idx = KVM_RISCV_SBI_EXT_STA,
 		.ext_ptr = &vcpu_sbi_ext_sta,
diff --git a/arch/riscv/kvm/vcpu_sbi_system.c b/arch/riscv/kvm/vcpu_sbi_system.c
new file mode 100644
index 000000000000..5d55e08791fa
--- /dev/null
+++ b/arch/riscv/kvm/vcpu_sbi_system.c
@@ -0,0 +1,73 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2024 Ventana Micro Systems Inc.
+ */
+
+#include <linux/kvm_host.h>
+
+#include <asm/kvm_vcpu_sbi.h>
+#include <asm/sbi.h>
+
+static int kvm_sbi_ext_susp_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
+				    struct kvm_vcpu_sbi_return *retdata)
+{
+	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
+	struct kvm_cpu_context *reset_cntx;
+	unsigned long funcid = cp->a6;
+	unsigned long hva, i;
+	struct kvm_vcpu *tmp;
+
+	switch (funcid) {
+	case SBI_EXT_SUSP_SYSTEM_SUSPEND:
+		if (cp->a0 != SBI_SUSP_SLEEP_TYPE_SUSPEND_TO_RAM) {
+			retdata->err_val = SBI_ERR_INVALID_PARAM;
+			return 0;
+		}
+
+		if (!(cp->sstatus & SR_SPP)) {
+			retdata->err_val = SBI_ERR_FAILURE;
+			return 0;
+		}
+
+		hva = kvm_vcpu_gfn_to_hva_prot(vcpu, cp->a1 >> PAGE_SHIFT, NULL);
+		if (kvm_is_error_hva(hva)) {
+			retdata->err_val = SBI_ERR_INVALID_ADDRESS;
+			return 0;
+		}
+
+		kvm_for_each_vcpu(i, tmp, vcpu->kvm) {
+			if (tmp == vcpu)
+				continue;
+			if (!kvm_riscv_vcpu_stopped(tmp)) {
+				retdata->err_val = SBI_ERR_DENIED;
+				return 0;
+			}
+		}
+
+		spin_lock(&vcpu->arch.reset_cntx_lock);
+		reset_cntx = &vcpu->arch.guest_reset_context;
+		reset_cntx->sepc = cp->a1;
+		reset_cntx->a0 = vcpu->vcpu_id;
+		reset_cntx->a1 = cp->a2;
+		spin_unlock(&vcpu->arch.reset_cntx_lock);
+
+		kvm_make_request(KVM_REQ_VCPU_RESET, vcpu);
+
+		/* userspace provides the suspend implementation */
+		kvm_riscv_vcpu_sbi_forward(vcpu, run);
+		retdata->uexit = true;
+		break;
+	default:
+		retdata->err_val = SBI_ERR_NOT_SUPPORTED;
+		break;
+	}
+
+	return 0;
+}
+
+const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_susp = {
+	.extid_start = SBI_EXT_SUSP,
+	.extid_end = SBI_EXT_SUSP,
+	.default_disabled = true,
+	.handler = kvm_sbi_ext_susp_handler,
+};
-- 
2.46.2


