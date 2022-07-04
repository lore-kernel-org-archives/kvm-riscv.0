From: Anup Patel <anup@brainfault.org>
Date: Mon, 4 Jul 2022 14:43:08 +0530
Subject: [PATCH] riscv: kvm: move preempt_disable() call in kvm_arch_vcpu_ioctl_run
In-Reply-To: <20220701094955.1927867-1-nborisov@suse.com>
References: <20220701094955.1927867-1-nborisov@suse.com>
Message-ID: <CAAhSdy1jhVkfMD0si0XZvj2Js+wKXpNxKq+rgUWD_ZTy6+R2Bw@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jul 1, 2022 at 3:19 PM Nikolay Borisov <nborisov@suse.com> wrote:
>
> local_irq_disable provides stronger guarantees than preempt_disable so
> calling the latter is redundant when interrupts are disabled. Instead,
> explicitly disable preemption right before interrupts are
> enabled/disabled to ensure that the time accounted in guest_timing_exit_irqoff
> includes time taken by the guest or interrupts.
>
> Signed-off-by: Nikolay Borisov <nborisov@suse.com>

Looks good to me.

I have queued it for 5.20

Thanks,
Anup

> ---
>  arch/riscv/kvm/vcpu.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index 7f4ad5e4373a..0c527b2c3c63 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -888,8 +888,6 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
>
>                 kvm_riscv_check_vcpu_requests(vcpu);
>
> -               preempt_disable();
> -
>                 local_irq_disable();
>
>                 /*
> @@ -926,7 +924,6 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
>                     kvm_request_pending(vcpu)) {
>                         vcpu->mode = OUTSIDE_GUEST_MODE;
>                         local_irq_enable();
> -                       preempt_enable();
>                         kvm_vcpu_srcu_read_lock(vcpu);
>                         continue;
>                 }
> @@ -960,6 +957,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
>                 /* Syncup interrupts state with HW */
>                 kvm_riscv_vcpu_sync_interrupts(vcpu);
>
> +               preempt_disable();
>                 /*
>                  * We must ensure that any pending interrupts are taken before
>                  * we exit guest timing so that timer ticks are accounted as
> --
> 2.25.1
>

