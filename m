From: Atish Patra <atish.patra@wdc.com>
Date: Mon,  3 Aug 2020 10:58:46 -0700
Subject: [PATCH 6/6] RISC-V: Add SBI HSM extension in KVM
In-Reply-To: <20200803175846.26272-1-atish.patra@wdc.com>
References: <20200803175846.26272-1-atish.patra@wdc.com>
Message-ID: <20200803175846.26272-7-atish.patra@wdc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

SBI HSM extension allows OS to start/stop harts any time. It also allows
ordered booting of harts instead of random booting.

Implement SBI HSM exntesion and designate the vcpu 0 as the boot vcpu id.
All other non-zero non-booting vcpus should be brought up by the OS
implementing HSM extension. If the guest OS doesn't implement HSM
extension, only single vcpu will be available to OS.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/include/asm/sbi.h  |   1 +
 arch/riscv/kvm/Makefile       |   2 +-
 arch/riscv/kvm/vcpu.c         |  19 ++++++
 arch/riscv/kvm/vcpu_sbi.c     |   4 ++
 arch/riscv/kvm/vcpu_sbi_hsm.c | 109 ++++++++++++++++++++++++++++++++++
 5 files changed, 134 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/kvm/vcpu_sbi_hsm.c

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 7d8f2b389253..e18ba15fc9e1 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -90,6 +90,7 @@ enum sbi_hsm_hart_status {
 #define SBI_ERR_INVALID_PARAM	-3
 #define SBI_ERR_DENIED		-4
 #define SBI_ERR_INVALID_ADDRESS	-5
+#define SBI_ERR_ALREADY_AVAILABLE -6
 
 extern unsigned long sbi_spec_version;
 struct sbiret {
diff --git a/arch/riscv/kvm/Makefile b/arch/riscv/kvm/Makefile
index b0e8b760fda0..5c3c40636067 100644
--- a/arch/riscv/kvm/Makefile
+++ b/arch/riscv/kvm/Makefile
@@ -10,5 +10,5 @@ kvm-objs := $(common-objs-y)
 
 kvm-objs += main.o vm.o vmid.o tlb.o mmu.o
 kvm-objs += vcpu.o vcpu_exit.o vcpu_switch.o vcpu_timer.o
-kvm-objs += vcpu_sbi.o vcpu_sbi_base.o vcpu_sbi_legacy.o vcpu_sbi_replace.o
+kvm-objs += vcpu_sbi.o vcpu_sbi_base.o vcpu_sbi_legacy.o vcpu_sbi_replace.o vcpu_sbi_hsm.o
 obj-$(CONFIG_KVM)	+= kvm.o
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index adb0815951aa..f921d7771f40 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -130,6 +130,13 @@ static void kvm_riscv_reset_vcpu(struct kvm_vcpu *vcpu)
 	struct kvm_vcpu_csr *reset_csr = &vcpu->arch.guest_reset_csr;
 	struct kvm_cpu_context *cntx = &vcpu->arch.guest_context;
 	struct kvm_cpu_context *reset_cntx = &vcpu->arch.guest_reset_context;
+	bool loaded;
+
+	/* Disable preemption to avoid race with preempt notifiers */
+	preempt_disable();
+	loaded = (vcpu->cpu != -1);
+	if (loaded)
+		kvm_arch_vcpu_put(vcpu);
 
 	memcpy(csr, reset_csr, sizeof(*csr));
 
@@ -141,6 +148,11 @@ static void kvm_riscv_reset_vcpu(struct kvm_vcpu *vcpu)
 
 	WRITE_ONCE(vcpu->arch.irqs_pending, 0);
 	WRITE_ONCE(vcpu->arch.irqs_pending_mask, 0);
+
+	/* Reset the guest CSRs for hotplug usecase */
+	if (loaded)
+		kvm_arch_vcpu_load(vcpu, smp_processor_id());
+	preempt_enable();
 }
 
 int kvm_arch_vcpu_precreate(struct kvm *kvm, unsigned int id)
@@ -182,6 +194,13 @@ int kvm_arch_vcpu_setup(struct kvm_vcpu *vcpu)
 
 void kvm_arch_vcpu_postcreate(struct kvm_vcpu *vcpu)
 {
+	/**
+	 * vcpu with id 0 is the designated boot cpu.
+	 * Keep all vcpus with non-zero cpu id in power-off state so that they
+	 * can brought to online using SBI HSM extension.
+	 */
+	if (vcpu->vcpu_idx != 0)
+		kvm_riscv_vcpu_power_off(vcpu);
 }
 
 void kvm_arch_vcpu_destroy(struct kvm_vcpu *vcpu)
diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
index 8c3ca522dddb..2f59b56d8640 100644
--- a/arch/riscv/kvm/vcpu_sbi.c
+++ b/arch/riscv/kvm/vcpu_sbi.c
@@ -25,6 +25,8 @@ static int kvm_linux_err_map_sbi(int err)
 		return SBI_ERR_INVALID_ADDRESS;
 	case -ENOTSUPP:
 		return SBI_ERR_NOT_SUPPORTED;
+	case -EALREADY:
+		return SBI_ERR_ALREADY_AVAILABLE;
 	default:
 		return SBI_ERR_FAILURE;
 	};
@@ -35,6 +37,7 @@ extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_base;
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_time;
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_ipi;
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_rfence;
+extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_hsm;
 
 static const struct kvm_vcpu_sbi_extension *sbi_ext[] = {
 	&vcpu_sbi_ext_legacy,
@@ -42,6 +45,7 @@ static const struct kvm_vcpu_sbi_extension *sbi_ext[] = {
 	&vcpu_sbi_ext_time,
 	&vcpu_sbi_ext_ipi,
 	&vcpu_sbi_ext_rfence,
+	&vcpu_sbi_ext_hsm,
 };
 
 void kvm_riscv_vcpu_sbi_forward(struct kvm_vcpu *vcpu, struct kvm_run *run)
diff --git a/arch/riscv/kvm/vcpu_sbi_hsm.c b/arch/riscv/kvm/vcpu_sbi_hsm.c
new file mode 100644
index 000000000000..f8ab64f5f344
--- /dev/null
+++ b/arch/riscv/kvm/vcpu_sbi_hsm.c
@@ -0,0 +1,109 @@
+// SPDX-License-Identifier: GPL-2.0
+/**
+ * Copyright (c) 2020 Western Digital Corporation or its affiliates.
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
+#include <asm/kvm_vcpu_sbi.h>
+
+static int kvm_sbi_hsm_vcpu_start(struct kvm_vcpu *vcpu)
+{
+	struct kvm_cpu_context *reset_cntx;
+	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
+	struct kvm_vcpu *target_vcpu;
+	unsigned long target_vcpuid = cp->a0;
+
+	target_vcpu = kvm_get_vcpu_by_id(vcpu->kvm, target_vcpuid);
+	if (!target_vcpu)
+		return -EINVAL;
+	if (!target_vcpu->arch.power_off)
+		return -EALREADY;
+
+	reset_cntx = &target_vcpu->arch.guest_reset_context;
+	/* start address */
+	reset_cntx->sepc = cp->a1;
+	/* target vcpu id to start */
+	reset_cntx->a0 = target_vcpuid;
+	/* private data passed from kernel */
+	reset_cntx->a1 = cp->a2;
+	kvm_make_request(KVM_REQ_VCPU_RESET, target_vcpu);
+
+	/* Make sure that the reset request is enqueued before power on */
+	smp_wmb();
+	kvm_riscv_vcpu_power_on(target_vcpu);
+
+	return 0;
+}
+
+static int kvm_sbi_hsm_vcpu_stop(struct kvm_vcpu *vcpu)
+{
+	if ((!vcpu) || (vcpu->arch.power_off))
+		return -EINVAL;
+
+	kvm_riscv_vcpu_power_off(vcpu);
+
+	return 0;
+}
+
+static int kvm_sbi_hsm_vcpu_get_status(struct kvm_vcpu *vcpu)
+{
+	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
+	unsigned long target_vcpuid = cp->a0;
+	struct kvm_vcpu *target_vcpu;
+
+	target_vcpu = kvm_get_vcpu_by_id(vcpu->kvm, target_vcpuid);
+	if (!target_vcpu)
+		return -EINVAL;
+	if (!target_vcpu->arch.power_off)
+		return SBI_HSM_HART_STATUS_STARTED;
+	else
+		return SBI_HSM_HART_STATUS_STOPPED;
+}
+
+static int kvm_sbi_ext_hsm_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
+				   unsigned long *out_val,
+				   struct kvm_cpu_trap *utrap,
+				   bool *exit)
+{
+	int ret = 0;
+	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
+	struct kvm *kvm = vcpu->kvm;
+	unsigned long funcid = cp->a6;
+
+	if (!cp)
+		return -EINVAL;
+	switch (funcid) {
+	case SBI_EXT_HSM_HART_START:
+		mutex_lock(&kvm->lock);
+		ret = kvm_sbi_hsm_vcpu_start(vcpu);
+		mutex_unlock(&kvm->lock);
+		break;
+	case SBI_EXT_HSM_HART_STOP:
+		ret = kvm_sbi_hsm_vcpu_stop(vcpu);
+		break;
+	case SBI_EXT_HSM_HART_STATUS:
+		ret = kvm_sbi_hsm_vcpu_get_status(vcpu);
+		if (ret >= 0) {
+			*out_val = ret;
+			ret = 0;
+		}
+		break;
+	default:
+		ret = -ENOTSUPP;
+	}
+
+	return ret;
+}
+
+const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_hsm = {
+	.extid_start = SBI_EXT_HSM,
+	.extid_end = SBI_EXT_HSM,
+	.handler = kvm_sbi_ext_hsm_handler,
+};
-- 
2.24.0


