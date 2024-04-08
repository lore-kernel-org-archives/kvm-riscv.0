From: Anup Patel <anup@brainfault.org>
Date: Mon, 8 Apr 2024 17:37:23 +0530
Subject: [PATCH 1/2] RISCV: KVM: add tracepoints for entry and exit events
In-Reply-To: <20240328031220.1287-2-liangshenlin@eswincomputing.com>
References: <20240328031220.1287-1-liangshenlin@eswincomputing.com> <20240328031220.1287-2-liangshenlin@eswincomputing.com>
Message-ID: <CAAhSdy0DgW055iV7=_D6iOLr1iVeK9SZmG8hqBG0_hb1z=+07g@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Mar 28, 2024 at 8:49?AM Shenlin Liang
<liangshenlin@eswincomputing.com> wrote:
>
> Like other architectures, RISCV KVM also needs to add these event
> tracepoints to count the number of times kvm guest entry/exit.
>
> Signed-off-by: Shenlin Liang <liangshenlin@eswincomputing.com>
> ---
>  arch/riscv/kvm/trace_riscv.h | 60 ++++++++++++++++++++++++++++++++++++
>  arch/riscv/kvm/vcpu.c        |  7 +++++
>  2 files changed, 67 insertions(+)
>  create mode 100644 arch/riscv/kvm/trace_riscv.h
>
> diff --git a/arch/riscv/kvm/trace_riscv.h b/arch/riscv/kvm/trace_riscv.h
> new file mode 100644
> index 000000000000..5848083c7a5e
> --- /dev/null
> +++ b/arch/riscv/kvm/trace_riscv.h
> @@ -0,0 +1,60 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Tracepoints for RISC-V KVM
> + *
> + * Copyright 2024 Beijing ESWIN Computing Technology Co., Ltd.
> + *
> + */
> +#if !defined(_TRACE_RSICV_KVM_H) || defined(TRACE_HEADER_MULTI_READ)
> +#define _TRACE_RSICV_KVM_H

s/_RSICV_/_RISCV_/

> +
> +#include <linux/tracepoint.h>
> +
> +#undef TRACE_SYSTEM
> +#define TRACE_SYSTEM kvm
> +
> +TRACE_EVENT(kvm_entry,
> +       TP_PROTO(struct kvm_vcpu *vcpu),
> +       TP_ARGS(vcpu),
> +
> +       TP_STRUCT__entry(
> +               __field(unsigned long, pc)
> +       ),
> +
> +       TP_fast_assign(
> +               __entry->pc     = vcpu->arch.guest_context.sepc;
> +       ),
> +
> +       TP_printk("PC: 0x%016lx", __entry->pc)
> +);
> +
> +TRACE_EVENT(kvm_exit,
> +       TP_PROTO(struct kvm_vcpu *vcpu, unsigned long exit_reason,
> +                       unsigned long scause),
> +       TP_ARGS(vcpu, exit_reason, scause),
> +
> +       TP_STRUCT__entry(
> +               __field(unsigned long, pc)
> +               __field(unsigned long, exit_reason)
> +               __field(unsigned long, scause)

This is not the right contents describing a KVM exit.

The fields over here should be aligned with "struct kvm_cpu_trap"
so we should have following fields:
    __field(unsigned long, sepc)
    __field(unsigned long, scause)
    __field(unsigned long, stval)
    __field(unsigned long, htval)
    __field(unsigned long, htinst)

> +       ),
> +
> +       TP_fast_assign(
> +               __entry->pc             = vcpu->arch.guest_context.sepc;
> +               __entry->exit_reason    = exit_reason;
> +               __entry->scause         = scause;
> +       ),
> +
> +       TP_printk("EXIT_REASON:0x%lx,PC: 0x%016lx,SCAUSE:0x%lx",
> +                       __entry->exit_reason, __entry->pc, __entry->scause)
> +);
> +
> +#endif /* _TRACE_RSICV_KVM_H */
> +
> +#undef TRACE_INCLUDE_PATH
> +#define TRACE_INCLUDE_PATH .
> +#undef TRACE_INCLUDE_FILE
> +#define TRACE_INCLUDE_FILE trace_riscv
> +
> +/* This part must be outside protection */
> +#include <trace/define_trace.h>
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index b5ca9f2e98ac..ed0932f0d514 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -21,6 +21,9 @@
>  #include <asm/cacheflush.h>
>  #include <asm/kvm_vcpu_vector.h>
>
> +#define CREATE_TRACE_POINTS
> +#include "trace_riscv.h"
> +
>  const struct _kvm_stats_desc kvm_vcpu_stats_desc[] = {
>         KVM_GENERIC_VCPU_STATS(),
>         STATS_DESC_COUNTER(VCPU, ecall_exit_stat),
> @@ -782,6 +785,8 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
>                  */
>                 kvm_riscv_local_tlb_sanitize(vcpu);
>
> +               trace_kvm_entry(vcpu);
> +
>                 guest_timing_enter_irqoff();
>
>                 kvm_riscv_vcpu_enter_exit(vcpu);
> @@ -820,6 +825,8 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
>
>                 local_irq_enable();
>
> +               trace_kvm_exit(vcpu, run->exit_reason, trap.scause);
> +
>                 preempt_enable();
>
>                 kvm_vcpu_srcu_read_lock(vcpu);
> --
> 2.37.2
>

Regards,
Anup

