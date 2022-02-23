From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 22 Feb 2022 19:37:04 -0800
Subject: [PATCH 6/6] RISC-V: KVM: Implement SBI HSM suspend call
In-Reply-To: <20220201082227.361967-7-apatel@ventanamicro.com>
References: <20220201082227.361967-1-apatel@ventanamicro.com>
 <20220201082227.361967-7-apatel@ventanamicro.com>
Message-ID: <CAOnJCUJ_13oZqLhmcwO4tx+OsnL1YdR-y_FyNAmd=_+9rGAFLw@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Feb 1, 2022 at 12:24 AM Anup Patel <apatel@ventanamicro.com> wrote:
>
> The SBI v0.3 specification extends SBI HSM extension by adding SBI HSM
> suspend call and related HART states. This patch extends the KVM RISC-V
> HSM implementation to provide KVM guest a minimal SBI HSM suspend call
> which is equivalent to a WFI instruction.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/kvm/vcpu_sbi_hsm.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/arch/riscv/kvm/vcpu_sbi_hsm.c b/arch/riscv/kvm/vcpu_sbi_hsm.c
> index 1ac4b2e8e4ec..239dec0a628a 100644
> --- a/arch/riscv/kvm/vcpu_sbi_hsm.c
> +++ b/arch/riscv/kvm/vcpu_sbi_hsm.c
> @@ -61,6 +61,8 @@ static int kvm_sbi_hsm_vcpu_get_status(struct kvm_vcpu *vcpu)
>                 return -EINVAL;
>         if (!target_vcpu->arch.power_off)
>                 return SBI_HSM_STATE_STARTED;
> +       else if (vcpu->stat.generic.blocking)
> +               return SBI_HSM_STATE_SUSPENDED;
>         else
>                 return SBI_HSM_STATE_STOPPED;
>  }
> @@ -91,6 +93,18 @@ static int kvm_sbi_ext_hsm_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
>                         ret = 0;
>                 }
>                 break;
> +       case SBI_EXT_HSM_HART_SUSPEND:
> +               switch (cp->a0) {
> +               case SBI_HSM_SUSPEND_RET_DEFAULT:
> +                       kvm_riscv_vcpu_wfi(vcpu);
> +                       break;
> +               case SBI_HSM_SUSPEND_NON_RET_DEFAULT:
> +                       ret = -EOPNOTSUPP;
> +                       break;
> +               default:
> +                       ret = -EINVAL;
> +               }
> +               break;
>         default:
>                 ret = -EOPNOTSUPP;
>         }
> --
> 2.25.1
>

Reviewed-by: Atish Patra <atishp@rivosinc.com>

-- 
Regards,
Atish

