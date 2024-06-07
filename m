From: Anup Patel <anup@brainfault.org>
Date: Fri, 7 Jun 2024 12:37:01 +0530
Subject: [PATCH] RISC-V:KVM: Add AMO load/store access fault traps to
 redirect to guest
In-Reply-To: <20240429092113.70695-1-betterman5240@gmail.com>
References: <20240429092113.70695-1-betterman5240@gmail.com>
Message-ID: <CAAhSdy3HPGS48TeG5LxiECAtNyzmzsJPzo+_eicgxL28nAgoHg@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Apr 29, 2024 at 2:51?PM Yu-Wei Hsu <betterman5240@gmail.com> wrote:
>
> When unhandled AMO load/store access fault traps are not delegated to
> VS mode (hedeleg), M mode redirects them back to S mode.
> However, upon returning from M mode,the KVM executed in HS mode terminates
> VS mode software.
> KVM should redirect traps back to VS mode and let the VS mode trap handler
> determine the next steps.
> This is one approach to handling access fault traps in KVM,
> not only redirecting them to VS mode or terminating it.
>
> Signed-off-by: Yu-Wei Hsu <betterman5240@gmail.com>

Overall this patch looks good to me but the patch subject and
description can further simplified as follows:

    RISC-V: KVM: Redirect AMO load/store access fault traps to guest

    The KVM RISC-V does not delegate AMO load/store access fault traps to
    VS-mode (hedeleg) so typically M-mode takes these traps and redirects
    them back to HS-mode. However, upon returning from M-mode, the KVM
    RISC-V running in HS-mode terminates VS-mode software.

    The KVM RISC-V should redirect AMO load/store access fault traps back
    to VS-mode and let the VS-mode trap handler determine the next steps.

I have taken care of the above at the time of queuing this patch.

Reviewed-by: Anup Patel <anup@brainfault.org>

Queued this patch for Linux-6.11

Thanks,
Anup

> ---
>  arch/riscv/kvm/vcpu_exit.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
> index 2415722c01b8..ef8c5e3ec8a0 100644
> --- a/arch/riscv/kvm/vcpu_exit.c
> +++ b/arch/riscv/kvm/vcpu_exit.c
> @@ -185,6 +185,8 @@ int kvm_riscv_vcpu_exit(struct kvm_vcpu *vcpu, struct kvm_run *run,
>         case EXC_INST_ILLEGAL:
>         case EXC_LOAD_MISALIGNED:
>         case EXC_STORE_MISALIGNED:
> +       case EXC_LOAD_ACCESS:
> +       case EXC_STORE_ACCESS:
>                 if (vcpu->arch.guest_context.hstatus & HSTATUS_SPV) {
>                         kvm_riscv_vcpu_trap_redirect(vcpu, trap);
>                         ret = 1;
> --
> 2.25.1
>

