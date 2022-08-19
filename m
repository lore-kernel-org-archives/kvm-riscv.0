From: Anup Patel <anup@brainfault.org>
Date: Fri, 19 Aug 2022 21:41:46 +0530
Subject: [PATCH 1/4] riscv: kvm: vcpu_timer: fix unused variable warnings
In-Reply-To: <20220814141237.493457-2-mail@conchuod.ie>
References: <20220814141237.493457-1-mail@conchuod.ie> <20220814141237.493457-2-mail@conchuod.ie>
Message-ID: <CAAhSdy1qEJR_d5ynbptsCVOA5fk+dPyZ0mzT7-y-RXtQjMni_Q@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Aug 14, 2022 at 7:42 PM Conor Dooley <mail@conchuod.ie> wrote:
>
> From: Conor Dooley <conor.dooley@microchip.com>
>
> In two places, csr is set but never used:
>
> arch/riscv/kvm/vcpu_timer.c:302:23: warning: variable 'csr' set but not used [-Wunused-but-set-variable]
>         struct kvm_vcpu_csr *csr;
>                              ^
> arch/riscv/kvm/vcpu_timer.c:327:23: warning: variable 'csr' set but not used [-Wunused-but-set-variable]
>         struct kvm_vcpu_csr *csr;
>                              ^
>
> Remove the variable.
>
> Fixes: 8f5cb44b1bae ("RISC-V: KVM: Support sstc extension")
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

I have queued this fix for 6.0-rc1

Thanks,
Anup

> ---
>  arch/riscv/kvm/vcpu_timer.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/arch/riscv/kvm/vcpu_timer.c b/arch/riscv/kvm/vcpu_timer.c
> index 16f50c46ba39..185f2386a747 100644
> --- a/arch/riscv/kvm/vcpu_timer.c
> +++ b/arch/riscv/kvm/vcpu_timer.c
> @@ -299,7 +299,6 @@ static void kvm_riscv_vcpu_update_timedelta(struct kvm_vcpu *vcpu)
>
>  void kvm_riscv_vcpu_timer_restore(struct kvm_vcpu *vcpu)
>  {
> -       struct kvm_vcpu_csr *csr;
>         struct kvm_vcpu_timer *t = &vcpu->arch.timer;
>
>         kvm_riscv_vcpu_update_timedelta(vcpu);
> @@ -307,7 +306,6 @@ void kvm_riscv_vcpu_timer_restore(struct kvm_vcpu *vcpu)
>         if (!t->sstc_enabled)
>                 return;
>
> -       csr = &vcpu->arch.guest_csr;
>  #if defined(CONFIG_32BIT)
>         csr_write(CSR_VSTIMECMP, (u32)t->next_cycles);
>         csr_write(CSR_VSTIMECMPH, (u32)(t->next_cycles >> 32));
> @@ -324,13 +322,11 @@ void kvm_riscv_vcpu_timer_restore(struct kvm_vcpu *vcpu)
>
>  void kvm_riscv_vcpu_timer_save(struct kvm_vcpu *vcpu)
>  {
> -       struct kvm_vcpu_csr *csr;
>         struct kvm_vcpu_timer *t = &vcpu->arch.timer;
>
>         if (!t->sstc_enabled)
>                 return;
>
> -       csr = &vcpu->arch.guest_csr;
>         t = &vcpu->arch.timer;
>  #if defined(CONFIG_32BIT)
>         t->next_cycles = csr_read(CSR_VSTIMECMP);
> --
> 2.37.1
>

