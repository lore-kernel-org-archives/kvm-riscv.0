From: Shenlin Liang <liangshenlin@eswincomputing.com>
Date: Mon, 15 Apr 2024 03:11:30 +0000
Subject: [PATCH v2 1/2] RISCV: KVM: add tracepoints for entry and exit events
In-Reply-To: <20240415031131.23443-1-liangshenlin@eswincomputing.com>
References: <20240415031131.23443-1-liangshenlin@eswincomputing.com>
Message-ID: <20240415031131.23443-2-liangshenlin@eswincomputing.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Like other architectures, RISCV KVM also needs to add these event
tracepoints to count the number of times kvm guest entry/exit.

Signed-off-by: Shenlin Liang <liangshenlin@eswincomputing.com>
---
 arch/riscv/kvm/trace.h | 67 ++++++++++++++++++++++++++++++++++++++++++
 arch/riscv/kvm/vcpu.c  |  7 +++++
 2 files changed, 74 insertions(+)
 create mode 100644 arch/riscv/kvm/trace.h

diff --git a/arch/riscv/kvm/trace.h b/arch/riscv/kvm/trace.h
new file mode 100644
index 000000000000..3d54175d805c
--- /dev/null
+++ b/arch/riscv/kvm/trace.h
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Tracepoints for RISC-V KVM
+ *
+ * Copyright 2024 Beijing ESWIN Computing Technology Co., Ltd.
+ *
+ */
+#if !defined(_TRACE_KVM_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _TRACE_KVM_H
+
+#include <linux/tracepoint.h>
+
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM kvm
+
+TRACE_EVENT(kvm_entry,
+	TP_PROTO(struct kvm_vcpu *vcpu),
+	TP_ARGS(vcpu),
+
+	TP_STRUCT__entry(
+		__field(unsigned long, pc)
+	),
+
+	TP_fast_assign(
+		__entry->pc	= vcpu->arch.guest_context.sepc;
+	),
+
+	TP_printk("PC: 0x016%lx", __entry->pc)
+);
+
+TRACE_EVENT(kvm_exit,
+	TP_PROTO(struct kvm_cpu_trap *trap),
+	TP_ARGS(trap),
+
+	TP_STRUCT__entry(
+		__field(unsigned long, sepc)
+		__field(unsigned long, scause)
+		__field(unsigned long, stval)
+		__field(unsigned long, htval)
+		__field(unsigned long, htinst)
+	),
+
+	TP_fast_assign(
+		__entry->sepc		= trap->sepc;
+		__entry->scause		= trap->scause;
+		__entry->stval		= trap->stval;
+		__entry->htval		= trap->htval;
+		__entry->htinst		= trap->htinst;
+	),
+
+	TP_printk("SEPC:0x%lx, SCAUSE:0x%lx, STVAL:0x%lx, HTVAL:0x%lx, HTINST:0x%lx",
+		__entry->sepc,
+		__entry->scause,
+		__entry->stval,
+		__entry->htval,
+		__entry->htinst)
+);
+
+#endif /* _TRACE_RSICV_KVM_H */
+
+#undef TRACE_INCLUDE_PATH
+#define TRACE_INCLUDE_PATH .
+#undef TRACE_INCLUDE_FILE
+#define TRACE_INCLUDE_FILE trace
+
+/* This part must be outside protection */
+#include <trace/define_trace.h>
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index b5ca9f2e98ac..f4e27004ceb8 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -21,6 +21,9 @@
 #include <asm/cacheflush.h>
 #include <asm/kvm_vcpu_vector.h>
 
+#define CREATE_TRACE_POINTS
+#include "trace.h"
+
 const struct _kvm_stats_desc kvm_vcpu_stats_desc[] = {
 	KVM_GENERIC_VCPU_STATS(),
 	STATS_DESC_COUNTER(VCPU, ecall_exit_stat),
@@ -782,6 +785,8 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 		 */
 		kvm_riscv_local_tlb_sanitize(vcpu);
 
+		trace_kvm_entry(vcpu);
+
 		guest_timing_enter_irqoff();
 
 		kvm_riscv_vcpu_enter_exit(vcpu);
@@ -820,6 +825,8 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 
 		local_irq_enable();
 
+		trace_kvm_exit(&trap);
+
 		preempt_enable();
 
 		kvm_vcpu_srcu_read_lock(vcpu);
-- 
2.37.2


