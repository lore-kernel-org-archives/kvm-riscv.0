From: Anup Patel <anup@brainfault.org>
Date: Wed, 14 Feb 2024 18:21:14 +0530
Subject: [PATCH v1 2/3] RISC-V: KVM: Handle breakpoint exits for VCPU
In-Reply-To: <20240206074931.22930-3-duchao@eswincomputing.com>
References: <20240206074931.22930-1-duchao@eswincomputing.com> <20240206074931.22930-3-duchao@eswincomputing.com>
Message-ID: <CAAhSdy0xYr6jKRdYzTTGfTe26WUC352u1HFd727z7EXA+8AnCQ@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Feb 6, 2024 at 1:22?PM Chao Du <duchao@eswincomputing.com> wrote:
>
> Exit to userspace for breakpoint traps. Set the exit_reason as
> KVM_EXIT_DEBUG before exit.
>
> Signed-off-by: Chao Du <duchao@eswincomputing.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/kvm/vcpu_exit.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
> index 2415722c01b8..5761f95abb60 100644
> --- a/arch/riscv/kvm/vcpu_exit.c
> +++ b/arch/riscv/kvm/vcpu_exit.c
> @@ -204,6 +204,10 @@ int kvm_riscv_vcpu_exit(struct kvm_vcpu *vcpu, struct kvm_run *run,
>                 if (vcpu->arch.guest_context.hstatus & HSTATUS_SPV)
>                         ret = kvm_riscv_vcpu_sbi_ecall(vcpu, run);
>                 break;
> +       case EXC_BREAKPOINT:
> +               run->exit_reason = KVM_EXIT_DEBUG;
> +               ret = 0;
> +               break;
>         default:
>                 break;
>         }
> --
> 2.17.1
>

