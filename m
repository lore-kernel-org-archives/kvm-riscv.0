From: Anup Patel <anup.patel@wdc.com>
Date: Mon, 27 Sep 2021 17:10:14 +0530
Subject: [PATCH v20 15/17] RISC-V: KVM: Add SBI v0.1 support
In-Reply-To: <20210927114016.1089328-1-anup.patel@wdc.com>
References: <20210927114016.1089328-1-anup.patel@wdc.com>
Message-ID: <20210927114016.1089328-16-anup.patel@wdc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Atish Patra <atish.patra@wdc.com>

The KVM host kernel is running in HS-mode needs so we need to handle
the SBI calls coming from guest kernel running in VS-mode.

This patch adds SBI v0.1 support in KVM RISC-V. Almost all SBI v0.1
calls are implemented in KVM kernel module except GETCHAR and PUTCHART
calls which are forwarded to user space because these calls cannot be
implemented in kernel space. In future, when we implement SBI v0.2 for
Guest, we will forward SBI v0.2 experimental and vendor extension calls
to user space.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
Signed-off-by: Anup Patel <anup.patel@wdc.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
---
 arch/riscv/include/asm/kvm_host.h |  10 ++
 arch/riscv/kvm/Makefile           |   1 +
 arch/riscv/kvm/vcpu.c             |   9 ++
 arch/riscv/kvm/vcpu_exit.c        |   4 +
 arch/riscv/kvm/vcpu_sbi.c         | 185 ++++++++++++++++++++++++++++++
 include/uapi/linux/kvm.h          |   8 ++
 6 files changed, 217 insertions(+)
 create mode 100644 arch/riscv/kvm/vcpu_sbi.c

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index be159686da46..d7e1696cd2ec 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -74,6 +74,10 @@ struct kvm_mmio_decode {
 	int return_handled;
 };
 
+struct kvm_sbi_context {
+	int return_handled;
+};
+
 #define KVM_MMU_PAGE_CACHE_NR_OBJS	32
 
 struct kvm_mmu_page_cache {
@@ -186,6 +190,9 @@ struct kvm_vcpu_arch {
 	/* MMIO instruction details */
 	struct kvm_mmio_decode mmio_decode;
 
+	/* SBI context */
+	struct kvm_sbi_context sbi_context;
+
 	/* Cache pages needed to program page tables with spinlock held */
 	struct kvm_mmu_page_cache mmu_page_cache;
 
@@ -253,4 +260,7 @@ bool kvm_riscv_vcpu_has_interrupts(struct kvm_vcpu *vcpu, unsigned long mask);
 void kvm_riscv_vcpu_power_off(struct kvm_vcpu *vcpu);
 void kvm_riscv_vcpu_power_on(struct kvm_vcpu *vcpu);
 
+int kvm_riscv_vcpu_sbi_return(struct kvm_vcpu *vcpu, struct kvm_run *run);
+int kvm_riscv_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *run);
+
 #endif /* __RISCV_KVM_HOST_H__ */
diff --git a/arch/riscv/kvm/Makefile b/arch/riscv/kvm/Makefile
index 4beb4e277e96..3226696b8340 100644
--- a/arch/riscv/kvm/Makefile
+++ b/arch/riscv/kvm/Makefile
@@ -21,4 +21,5 @@ kvm-y += mmu.o
 kvm-y += vcpu.o
 kvm-y += vcpu_exit.o
 kvm-y += vcpu_switch.o
+kvm-y += vcpu_sbi.o
 kvm-y += vcpu_timer.o
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 5acec47236c9..c44cabce7dd8 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -867,6 +867,15 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 		}
 	}
 
+	/* Process SBI value returned from user-space */
+	if (run->exit_reason == KVM_EXIT_RISCV_SBI) {
+		ret = kvm_riscv_vcpu_sbi_return(vcpu, vcpu->run);
+		if (ret) {
+			srcu_read_unlock(&vcpu->kvm->srcu, vcpu->arch.srcu_idx);
+			return ret;
+		}
+	}
+
 	if (run->immediate_exit) {
 		srcu_read_unlock(&vcpu->kvm->srcu, vcpu->arch.srcu_idx);
 		return -EINTR;
diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
index f659be94231d..13bbc3f73713 100644
--- a/arch/riscv/kvm/vcpu_exit.c
+++ b/arch/riscv/kvm/vcpu_exit.c
@@ -678,6 +678,10 @@ int kvm_riscv_vcpu_exit(struct kvm_vcpu *vcpu, struct kvm_run *run,
 		if (vcpu->arch.guest_context.hstatus & HSTATUS_SPV)
 			ret = stage2_page_fault(vcpu, run, trap);
 		break;
+	case EXC_SUPERVISOR_SYSCALL:
+		if (vcpu->arch.guest_context.hstatus & HSTATUS_SPV)
+			ret = kvm_riscv_vcpu_sbi_ecall(vcpu, run);
+		break;
 	default:
 		break;
 	};
diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
new file mode 100644
index 000000000000..ebdcdbade9c6
--- /dev/null
+++ b/arch/riscv/kvm/vcpu_sbi.c
@@ -0,0 +1,185 @@
+// SPDX-License-Identifier: GPL-2.0
+/**
+ * Copyright (c) 2019 Western Digital Corporation or its affiliates.
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
+
+#define SBI_VERSION_MAJOR			0
+#define SBI_VERSION_MINOR			1
+
+static void kvm_riscv_vcpu_sbi_forward(struct kvm_vcpu *vcpu,
+				       struct kvm_run *run)
+{
+	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
+
+	vcpu->arch.sbi_context.return_handled = 0;
+	vcpu->stat.ecall_exit_stat++;
+	run->exit_reason = KVM_EXIT_RISCV_SBI;
+	run->riscv_sbi.extension_id = cp->a7;
+	run->riscv_sbi.function_id = cp->a6;
+	run->riscv_sbi.args[0] = cp->a0;
+	run->riscv_sbi.args[1] = cp->a1;
+	run->riscv_sbi.args[2] = cp->a2;
+	run->riscv_sbi.args[3] = cp->a3;
+	run->riscv_sbi.args[4] = cp->a4;
+	run->riscv_sbi.args[5] = cp->a5;
+	run->riscv_sbi.ret[0] = cp->a0;
+	run->riscv_sbi.ret[1] = cp->a1;
+}
+
+int kvm_riscv_vcpu_sbi_return(struct kvm_vcpu *vcpu, struct kvm_run *run)
+{
+	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
+
+	/* Handle SBI return only once */
+	if (vcpu->arch.sbi_context.return_handled)
+		return 0;
+	vcpu->arch.sbi_context.return_handled = 1;
+
+	/* Update return values */
+	cp->a0 = run->riscv_sbi.ret[0];
+	cp->a1 = run->riscv_sbi.ret[1];
+
+	/* Move to next instruction */
+	vcpu->arch.guest_context.sepc += 4;
+
+	return 0;
+}
+
+#ifdef CONFIG_RISCV_SBI_V01
+
+static void kvm_sbi_system_shutdown(struct kvm_vcpu *vcpu,
+				    struct kvm_run *run, u32 type)
+{
+	int i;
+	struct kvm_vcpu *tmp;
+
+	kvm_for_each_vcpu(i, tmp, vcpu->kvm)
+		tmp->arch.power_off = true;
+	kvm_make_all_cpus_request(vcpu->kvm, KVM_REQ_SLEEP);
+
+	memset(&run->system_event, 0, sizeof(run->system_event));
+	run->system_event.type = type;
+	run->exit_reason = KVM_EXIT_SYSTEM_EVENT;
+}
+
+int kvm_riscv_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *run)
+{
+	ulong hmask;
+	int i, ret = 1;
+	u64 next_cycle;
+	struct kvm_vcpu *rvcpu;
+	bool next_sepc = true;
+	struct cpumask cm, hm;
+	struct kvm *kvm = vcpu->kvm;
+	struct kvm_cpu_trap utrap = { 0 };
+	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
+
+	if (!cp)
+		return -EINVAL;
+
+	switch (cp->a7) {
+	case SBI_EXT_0_1_CONSOLE_GETCHAR:
+	case SBI_EXT_0_1_CONSOLE_PUTCHAR:
+		/*
+		 * The CONSOLE_GETCHAR/CONSOLE_PUTCHAR SBI calls cannot be
+		 * handled in kernel so we forward these to user-space
+		 */
+		kvm_riscv_vcpu_sbi_forward(vcpu, run);
+		next_sepc = false;
+		ret = 0;
+		break;
+	case SBI_EXT_0_1_SET_TIMER:
+#if __riscv_xlen == 32
+		next_cycle = ((u64)cp->a1 << 32) | (u64)cp->a0;
+#else
+		next_cycle = (u64)cp->a0;
+#endif
+		kvm_riscv_vcpu_timer_next_event(vcpu, next_cycle);
+		break;
+	case SBI_EXT_0_1_CLEAR_IPI:
+		kvm_riscv_vcpu_unset_interrupt(vcpu, IRQ_VS_SOFT);
+		break;
+	case SBI_EXT_0_1_SEND_IPI:
+		if (cp->a0)
+			hmask = kvm_riscv_vcpu_unpriv_read(vcpu, false, cp->a0,
+							   &utrap);
+		else
+			hmask = (1UL << atomic_read(&kvm->online_vcpus)) - 1;
+		if (utrap.scause) {
+			utrap.sepc = cp->sepc;
+			kvm_riscv_vcpu_trap_redirect(vcpu, &utrap);
+			next_sepc = false;
+			break;
+		}
+		for_each_set_bit(i, &hmask, BITS_PER_LONG) {
+			rvcpu = kvm_get_vcpu_by_id(vcpu->kvm, i);
+			kvm_riscv_vcpu_set_interrupt(rvcpu, IRQ_VS_SOFT);
+		}
+		break;
+	case SBI_EXT_0_1_SHUTDOWN:
+		kvm_sbi_system_shutdown(vcpu, run, KVM_SYSTEM_EVENT_SHUTDOWN);
+		next_sepc = false;
+		ret = 0;
+		break;
+	case SBI_EXT_0_1_REMOTE_FENCE_I:
+	case SBI_EXT_0_1_REMOTE_SFENCE_VMA:
+	case SBI_EXT_0_1_REMOTE_SFENCE_VMA_ASID:
+		if (cp->a0)
+			hmask = kvm_riscv_vcpu_unpriv_read(vcpu, false, cp->a0,
+							   &utrap);
+		else
+			hmask = (1UL << atomic_read(&kvm->online_vcpus)) - 1;
+		if (utrap.scause) {
+			utrap.sepc = cp->sepc;
+			kvm_riscv_vcpu_trap_redirect(vcpu, &utrap);
+			next_sepc = false;
+			break;
+		}
+		cpumask_clear(&cm);
+		for_each_set_bit(i, &hmask, BITS_PER_LONG) {
+			rvcpu = kvm_get_vcpu_by_id(vcpu->kvm, i);
+			if (rvcpu->cpu < 0)
+				continue;
+			cpumask_set_cpu(rvcpu->cpu, &cm);
+		}
+		riscv_cpuid_to_hartid_mask(&cm, &hm);
+		if (cp->a7 == SBI_EXT_0_1_REMOTE_FENCE_I)
+			sbi_remote_fence_i(cpumask_bits(&hm));
+		else if (cp->a7 == SBI_EXT_0_1_REMOTE_SFENCE_VMA)
+			sbi_remote_hfence_vvma(cpumask_bits(&hm),
+						cp->a1, cp->a2);
+		else
+			sbi_remote_hfence_vvma_asid(cpumask_bits(&hm),
+						cp->a1, cp->a2, cp->a3);
+		break;
+	default:
+		/* Return error for unsupported SBI calls */
+		cp->a0 = SBI_ERR_NOT_SUPPORTED;
+		break;
+	};
+
+	if (next_sepc)
+		cp->sepc += 4;
+
+	return ret;
+}
+
+#else
+
+int kvm_riscv_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *run)
+{
+	kvm_riscv_vcpu_sbi_forward(vcpu, run);
+	return 0;
+}
+
+#endif
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index a067410ebea5..322b4b588d75 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -269,6 +269,7 @@ struct kvm_xen_exit {
 #define KVM_EXIT_AP_RESET_HOLD    32
 #define KVM_EXIT_X86_BUS_LOCK     33
 #define KVM_EXIT_XEN              34
+#define KVM_EXIT_RISCV_SBI        35
 
 /* For KVM_EXIT_INTERNAL_ERROR */
 /* Emulate instruction failed. */
@@ -469,6 +470,13 @@ struct kvm_run {
 		} msr;
 		/* KVM_EXIT_XEN */
 		struct kvm_xen_exit xen;
+		/* KVM_EXIT_RISCV_SBI */
+		struct {
+			unsigned long extension_id;
+			unsigned long function_id;
+			unsigned long args[6];
+			unsigned long ret[2];
+		} riscv_sbi;
 		/* Fix the size of the union. */
 		char padding[256];
 	};
-- 
2.25.1


