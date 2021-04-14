From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 15 Apr 2021 08:50:23 +1000
Subject: [PATCH RFC v5 07/12] hw/riscv: PLIC update external interrupt by
 KVM when kvm enabled
In-Reply-To: <20210412065246.1853-8-jiangyifei@huawei.com>
References: <20210412065246.1853-1-jiangyifei@huawei.com>
 <20210412065246.1853-8-jiangyifei@huawei.com>
Message-ID: <CAKmqyKNzyftUr0yTJ1TOENo_p3S_nO9peQRpdu=1Zbm70zncdQ@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Apr 12, 2021 at 4:57 PM Yifei Jiang <jiangyifei@huawei.com> wrote:
>
> Only support supervisor external interrupt currently.
>
> Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
> Signed-off-by: Yipeng Yin <yinyipeng1@huawei.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/intc/sifive_plic.c    | 29 ++++++++++++++++++++---------
>  target/riscv/kvm-stub.c  |  5 +++++
>  target/riscv/kvm.c       | 20 ++++++++++++++++++++
>  target/riscv/kvm_riscv.h |  1 +
>  4 files changed, 46 insertions(+), 9 deletions(-)
>
> diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
> index 97a1a27a9a..2746eb7a05 100644
> --- a/hw/intc/sifive_plic.c
> +++ b/hw/intc/sifive_plic.c
> @@ -31,6 +31,8 @@
>  #include "target/riscv/cpu.h"
>  #include "sysemu/sysemu.h"
>  #include "migration/vmstate.h"
> +#include "sysemu/kvm.h"
> +#include "kvm_riscv.h"
>
>  #define RISCV_DEBUG_PLIC 0
>
> @@ -147,15 +149,24 @@ static void sifive_plic_update(SiFivePLICState *plic)
>              continue;
>          }
>          int level = sifive_plic_irqs_pending(plic, addrid);
> -        switch (mode) {
> -        case PLICMode_M:
> -            riscv_cpu_update_mip(RISCV_CPU(cpu), MIP_MEIP, BOOL_TO_MASK(level));
> -            break;
> -        case PLICMode_S:
> -            riscv_cpu_update_mip(RISCV_CPU(cpu), MIP_SEIP, BOOL_TO_MASK(level));
> -            break;
> -        default:
> -            break;
> +        if (kvm_enabled()) {
> +            if (mode == PLICMode_M) {
> +                continue;
> +            }
> +            kvm_riscv_set_irq(RISCV_CPU(cpu), IRQ_S_EXT, level);
> +        } else {
> +            switch (mode) {
> +            case PLICMode_M:
> +                riscv_cpu_update_mip(RISCV_CPU(cpu),
> +                                     MIP_MEIP, BOOL_TO_MASK(level));
> +                break;
> +            case PLICMode_S:
> +                riscv_cpu_update_mip(RISCV_CPU(cpu),
> +                                     MIP_SEIP, BOOL_TO_MASK(level));
> +                break;
> +            default:
> +                break;
> +            }
>          }
>      }
>
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
> index 79c931acb4..da63535812 100644
> --- a/target/riscv/kvm.c
> +++ b/target/riscv/kvm.c
> @@ -453,6 +453,26 @@ void kvm_riscv_reset_vcpu(RISCVCPU *cpu)
>      env->gpr[11] = cpu->env.fdt_addr;          /* a1 */
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

