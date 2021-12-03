From: Anup Patel <anup@brainfault.org>
Date: Fri, 3 Dec 2021 14:45:25 +0530
Subject: [PATCH v1 07/12] target/riscv: Support setting external interrupt
 by KVM
In-Reply-To: <20211120074644.729-8-jiangyifei@huawei.com>
References: <20211120074644.729-1-jiangyifei@huawei.com>
 <20211120074644.729-8-jiangyifei@huawei.com>
Message-ID: <CAAhSdy3suxztJYmOtEdtY+bpvESACc4QbPbv0jNL00qpw0WeUw@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Nov 20, 2021 at 1:17 PM Yifei Jiang <jiangyifei@huawei.com> wrote:
>
> Extend riscv_cpu_update_mip() to support setting external interrupt
> by KVM. It will call kvm_riscv_set_irq() to change the IRQ state in
> the KVM module When kvm is enabled and the MIP_SEIP bit is set in "mask"
>
> In addition, bacause target/riscv/cpu_helper.c is used to TCG, so move
> riscv_cpu_update_mip() to target/riscv/cpu.c from target/riscv/cpu_helper.c
>
> Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
> Signed-off-by: Mingwang Li <limingwang@huawei.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.c        | 34 ++++++++++++++++++++++++++++++++++
>  target/riscv/cpu_helper.c | 27 ---------------------------
>  target/riscv/kvm-stub.c   |  5 +++++
>  target/riscv/kvm.c        | 20 ++++++++++++++++++++
>  target/riscv/kvm_riscv.h  |  1 +
>  5 files changed, 60 insertions(+), 27 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 1c944872a3..a464845c99 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -21,6 +21,7 @@
>  #include "qemu/qemu-print.h"
>  #include "qemu/ctype.h"
>  #include "qemu/log.h"
> +#include "qemu/main-loop.h"
>  #include "cpu.h"
>  #include "internals.h"
>  #include "exec/exec-all.h"
> @@ -131,6 +132,39 @@ static void set_feature(CPURISCVState *env, int feature)
>      env->features |= (1ULL << feature);
>  }
>
> +#ifndef CONFIG_USER_ONLY
> +uint32_t riscv_cpu_update_mip(RISCVCPU *cpu, uint32_t mask, uint32_t value)
> +{
> +    CPURISCVState *env = &cpu->env;
> +    CPUState *cs = CPU(cpu);
> +    uint32_t old = env->mip;
> +    bool locked = false;
> +
> +    if (!qemu_mutex_iothread_locked()) {
> +        locked = true;
> +        qemu_mutex_lock_iothread();
> +    }
> +
> +    env->mip = (env->mip & ~mask) | (value & mask);
> +
> +    if (kvm_enabled() && (mask & MIP_SEIP)) {
> +        kvm_riscv_set_irq(RISCV_CPU(cpu), IRQ_S_EXT, value & MIP_SEIP);
> +    }
> +
> +    if (env->mip) {
> +        cpu_interrupt(cs, CPU_INTERRUPT_HARD);
> +    } else {
> +        cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
> +    }
> +
> +    if (locked) {
> +        qemu_mutex_unlock_iothread();
> +    }
> +
> +    return old;
> +}
> +#endif
> +

We should not change riscv_cpu_update_mip() for injecting KVM interrupts
because this function touches the user-space state of MIP csr but for KVM
the SIP csr state is always in kernel-space.

Further, the KVM kernel-space ensures synchronization so we don't need
to do qemu_mutex_lock/unlock_iothread() for KVM interrupts.

I would suggest to extend riscv_cpu_set_irq() for KVM interrupts. When
KVM is enabled, the riscv_cpu_set_irq() should throw warning/abort for
any interrupt other than S-mode external interrupts.

Regards,
Anup

>  static void set_resetvec(CPURISCVState *env, target_ulong resetvec)
>  {
>  #ifndef CONFIG_USER_ONLY
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 9eeed38c7e..5e36c35b15 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -286,33 +286,6 @@ int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint32_t interrupts)
>      }
>  }
>
> -uint32_t riscv_cpu_update_mip(RISCVCPU *cpu, uint32_t mask, uint32_t value)
> -{
> -    CPURISCVState *env = &cpu->env;
> -    CPUState *cs = CPU(cpu);
> -    uint32_t old = env->mip;
> -    bool locked = false;
> -
> -    if (!qemu_mutex_iothread_locked()) {
> -        locked = true;
> -        qemu_mutex_lock_iothread();
> -    }
> -
> -    env->mip = (env->mip & ~mask) | (value & mask);
> -
> -    if (env->mip) {
> -        cpu_interrupt(cs, CPU_INTERRUPT_HARD);
> -    } else {
> -        cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
> -    }
> -
> -    if (locked) {
> -        qemu_mutex_unlock_iothread();
> -    }
> -
> -    return old;
> -}
> -
>  void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(uint32_t),
>                               uint32_t arg)
>  {
> diff --git a/target/riscv/kvm-stub.c b/target/riscv/kvm-stub.c
> index 39b96fe3f4..4e8fc31a21 100644
> --- a/target/riscv/kvm-stub.c
> +++ b/target/riscv/kvm-stub.c
> @@ -23,3 +23,8 @@ void kvm_riscv_reset_vcpu(RISCVCPU *cpu)
>  {
>      abort();
>  }
> +
> +void kvm_riscv_set_irq(RISCVCPU *cpu, int irq, int level)
> +{
> +    abort();
> +}
> diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
> index 7f3ffcc2b4..8da2648d1a 100644
> --- a/target/riscv/kvm.c
> +++ b/target/riscv/kvm.c
> @@ -458,6 +458,26 @@ void kvm_riscv_reset_vcpu(RISCVCPU *cpu)
>      env->satp = 0;
>  }
>
> +void kvm_riscv_set_irq(RISCVCPU *cpu, int irq, int level)
> +{
> +    int ret;
> +    unsigned virq = level ? KVM_INTERRUPT_SET : KVM_INTERRUPT_UNSET;
> +
> +    if (irq != IRQ_S_EXT) {
> +        return;
> +    }
> +
> +    if (!kvm_enabled()) {
> +        return;
> +    }
> +
> +    ret = kvm_vcpu_ioctl(CPU(cpu), KVM_INTERRUPT, &virq);
> +    if (ret < 0) {
> +        perror("Set irq failed");
> +        abort();
> +    }
> +}
> +
>  bool kvm_arch_cpu_check_are_resettable(void)
>  {
>      return true;
> diff --git a/target/riscv/kvm_riscv.h b/target/riscv/kvm_riscv.h
> index f38c82bf59..ed281bdce0 100644
> --- a/target/riscv/kvm_riscv.h
> +++ b/target/riscv/kvm_riscv.h
> @@ -20,5 +20,6 @@
>  #define QEMU_KVM_RISCV_H
>
>  void kvm_riscv_reset_vcpu(RISCVCPU *cpu);
> +void kvm_riscv_set_irq(RISCVCPU *cpu, int irq, int level);
>
>  #endif
> --
> 2.19.1
>
>
> --
> kvm-riscv mailing list
> kvm-riscv at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

