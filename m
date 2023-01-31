From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 31 Jan 2023 00:41:35 -0800
Subject: [PATCH v3 2/2] RISC-V: KVM: Redirect illegal instruction traps to guest
In-Reply-To: <20230128082847.3055316-2-apatel@ventanamicro.com>
References: <20230128082847.3055316-1-apatel@ventanamicro.com> <20230128082847.3055316-2-apatel@ventanamicro.com>
Message-ID: <CAOnJCU+77AG55TTpekDKYVeeXjpR5QPw-CJ1zQq0ogB_rtP8dg@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Jan 28, 2023 at 12:29 AM Anup Patel <apatel@ventanamicro.com> wrote:
>
> From: Andy Chiu <andy.chiu@sifive.com>
>
> The M-mode redirects an unhandled illegal instruction trap back
> to S-mode. However, KVM running in HS-mode terminates the VS-mode
> software when it receives illegal instruction trap. Instead, KVM
> should redirect the illegal instruction trap back to VS-mode, and
> let VS-mode trap handler decide the next step. This futher allows
> guest kernel to implement on-demand enabling of vector extension
> for a guest user space process upon first-use.
>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/kvm/vcpu_exit.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
> index af7c4bc07929..4ea101a73d8b 100644
> --- a/arch/riscv/kvm/vcpu_exit.c
> +++ b/arch/riscv/kvm/vcpu_exit.c
> @@ -182,6 +182,12 @@ int kvm_riscv_vcpu_exit(struct kvm_vcpu *vcpu, struct kvm_run *run,
>         ret = -EFAULT;
>         run->exit_reason = KVM_EXIT_UNKNOWN;
>         switch (trap->scause) {
> +       case EXC_INST_ILLEGAL:
> +               if (vcpu->arch.guest_context.hstatus & HSTATUS_SPV) {
> +                       kvm_riscv_vcpu_trap_redirect(vcpu, trap);
> +                       ret = 1;
> +               }
> +               break;
>         case EXC_VIRTUAL_INST_FAULT:
>                 if (vcpu->arch.guest_context.hstatus & HSTATUS_SPV)
>                         ret = kvm_riscv_vcpu_virtual_insn(vcpu, run, trap);
> --
> 2.34.1
>

Reviewed-by: Atish Patra <atishp@rivosinc.com>

-- 
Regards,
Atish

