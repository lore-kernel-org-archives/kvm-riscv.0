From: Atish Patra <atish.patra@wdc.com>
Date: Wed,  3 Feb 2021 21:32:37 -0800
Subject: [PATCH v2 4/6] RISC-V: Add v0.1 replacement SBI extensions defined in
 v02
In-Reply-To: <20210204053239.1609558-1-atish.patra@wdc.com>
References: <20210204053239.1609558-1-atish.patra@wdc.com>
Message-ID: <20210204053239.1609558-5-atish.patra@wdc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The SBI v0.2 contains some of the improved versions of required v0.1
extensions such as remote fence, timer and IPI.

This patch implements those extensions.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/kvm/Makefile           |   2 +-
 arch/riscv/kvm/vcpu_sbi.c         |   6 ++
 arch/riscv/kvm/vcpu_sbi_replace.c | 136 ++++++++++++++++++++++++++++++
 3 files changed, 143 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/kvm/vcpu_sbi_replace.c

diff --git a/arch/riscv/kvm/Makefile b/arch/riscv/kvm/Makefile
index 0f17dffe8d46..302501295397 100644
--- a/arch/riscv/kvm/Makefile
+++ b/arch/riscv/kvm/Makefile
@@ -11,5 +11,5 @@ kvm-objs := $(common-objs-y)
 
 kvm-objs += main.o vm.o vmid.o tlb.o mmu.o
 kvm-objs += vcpu.o vcpu_exit.o vcpu_switch.o vcpu_timer.o
-kvm-objs += vcpu_sbi.o vcpu_sbi_base.o vcpu_sbi_legacy.o
+kvm-objs += vcpu_sbi.o vcpu_sbi_base.o vcpu_sbi_legacy.o vcpu_sbi_replace.o
 obj-$(CONFIG_KVM)	+= kvm.o
diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
index c85c3b1dd2eb..e21ce1e69e03 100644
--- a/arch/riscv/kvm/vcpu_sbi.c
+++ b/arch/riscv/kvm/vcpu_sbi.c
@@ -32,10 +32,16 @@ static int kvm_linux_err_map_sbi(int err)
 
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_legacy;
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_base;
+extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_time;
+extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_ipi;
+extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_rfence;
 
 static const struct kvm_vcpu_sbi_extension *sbi_ext[] = {
 	&vcpu_sbi_ext_legacy,
 	&vcpu_sbi_ext_base,
+	&vcpu_sbi_ext_time,
+	&vcpu_sbi_ext_ipi,
+	&vcpu_sbi_ext_rfence,
 };
 
 void kvm_riscv_vcpu_sbi_forward(struct kvm_vcpu *vcpu, struct kvm_run *run)
diff --git a/arch/riscv/kvm/vcpu_sbi_replace.c b/arch/riscv/kvm/vcpu_sbi_replace.c
new file mode 100644
index 000000000000..dffb1930cada
--- /dev/null
+++ b/arch/riscv/kvm/vcpu_sbi_replace.c
@@ -0,0 +1,136 @@
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
+#include <asm/kvm_vcpu_timer.h>
+#include <asm/kvm_vcpu_sbi.h>
+
+static int kvm_sbi_ext_time_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
+				    unsigned long *out_val,
+				    struct kvm_cpu_trap *utrap, bool *exit)
+{
+	int ret = 0;
+	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
+	u64 next_cycle;
+
+	if (!cp || (cp->a6 != SBI_EXT_TIME_SET_TIMER))
+		return -EINVAL;
+
+#if __riscv_xlen == 32
+	next_cycle = ((u64)cp->a1 << 32) | (u64)cp->a0;
+#else
+	next_cycle = (u64)cp->a0;
+#endif
+	kvm_riscv_vcpu_timer_next_event(vcpu, next_cycle);
+
+	return ret;
+}
+
+const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_time = {
+	.extid_start = SBI_EXT_TIME,
+	.extid_end = SBI_EXT_TIME,
+	.handler = kvm_sbi_ext_time_handler,
+};
+
+static int kvm_sbi_ext_ipi_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
+				   unsigned long *out_val,
+				   struct kvm_cpu_trap *utrap, bool *exit)
+{
+	int i, ret = 0;
+	struct kvm_vcpu *tmp;
+	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
+	unsigned long hmask = cp->a0;
+	unsigned long hbase = cp->a1;
+
+	if (!cp || (cp->a6 != SBI_EXT_IPI_SEND_IPI))
+		return -EINVAL;
+
+	kvm_for_each_vcpu(i, tmp, vcpu->kvm) {
+		if (hbase != -1UL) {
+			if (tmp->vcpu_id < hbase)
+				continue;
+			if (!(hmask & (1UL << (tmp->vcpu_id - hbase))))
+				continue;
+		}
+		ret = kvm_riscv_vcpu_set_interrupt(tmp, IRQ_VS_SOFT);
+		if (ret < 0)
+			break;
+	}
+
+	return ret;
+}
+
+const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_ipi = {
+	.extid_start = SBI_EXT_IPI,
+	.extid_end = SBI_EXT_IPI,
+	.handler = kvm_sbi_ext_ipi_handler,
+};
+
+static int kvm_sbi_ext_rfence_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
+				      unsigned long *out_val,
+				      struct kvm_cpu_trap *utrap, bool *exit)
+{
+	int i, ret = 0;
+	struct cpumask cm, hm;
+	struct kvm_vcpu *tmp;
+	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
+	unsigned long hmask = cp->a0;
+	unsigned long hbase = cp->a1;
+	unsigned long funcid = cp->a6;
+
+	if (!cp)
+		return -EINVAL;
+
+	cpumask_clear(&cm);
+	cpumask_clear(&hm);
+	kvm_for_each_vcpu(i, tmp, vcpu->kvm) {
+		if (hbase != -1UL) {
+			if (tmp->vcpu_id < hbase)
+				continue;
+			if (!(hmask & (1UL << (tmp->vcpu_id - hbase))))
+				continue;
+		}
+		if (tmp->cpu < 0)
+			continue;
+		cpumask_set_cpu(tmp->cpu, &cm);
+	}
+
+	riscv_cpuid_to_hartid_mask(&cm, &hm);
+
+	switch (funcid) {
+	case SBI_EXT_RFENCE_REMOTE_FENCE_I:
+		ret = sbi_remote_fence_i(cpumask_bits(&hm));
+		break;
+	case SBI_EXT_RFENCE_REMOTE_SFENCE_VMA:
+		ret = sbi_remote_hfence_vvma(cpumask_bits(&hm), cp->a2, cp->a3);
+		break;
+	case SBI_EXT_RFENCE_REMOTE_SFENCE_VMA_ASID:
+		ret = sbi_remote_hfence_vvma_asid(cpumask_bits(&hm), cp->a2,
+						  cp->a3, cp->a4);
+		break;
+	case SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA:
+	case SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA_VMID:
+	case SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA:
+	case SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA_ASID:
+	/* TODO: implement for nested hypervisor case */
+	default:
+		ret = -EOPNOTSUPP;
+	}
+
+	return ret;
+}
+
+const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_rfence = {
+	.extid_start = SBI_EXT_RFENCE,
+	.extid_end = SBI_EXT_RFENCE,
+	.handler = kvm_sbi_ext_rfence_handler,
+};
-- 
2.25.1


