From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 22 Feb 2022 16:01:34 -0800
Subject: [PATCH 5/6] RISC-V: KVM: Add common kvm_riscv_vcpu_wfi() function
In-Reply-To: <20220201082227.361967-6-apatel@ventanamicro.com>
References: <20220201082227.361967-1-apatel@ventanamicro.com>
 <20220201082227.361967-6-apatel@ventanamicro.com>
Message-ID: <CAOnJCUJE_FqmvTXrwRafGtDEKomm0idSPjSRsnVYr3-HzuCh9A@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Feb 1, 2022 at 12:24 AM Anup Patel <apatel@ventanamicro.com> wrote:
>
> The wait for interrupt (WFI) instruction emulation can share the VCPU
> halt logic with SBI HSM suspend emulation so this patch adds a common
> kvm_riscv_vcpu_wfi() function for this purpose.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/asm/kvm_host.h |  1 +
>  arch/riscv/kvm/vcpu_exit.c        | 22 ++++++++++++++++------
>  2 files changed, 17 insertions(+), 6 deletions(-)
>
> diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
> index 99ef6a120617..78da839657e5 100644
> --- a/arch/riscv/include/asm/kvm_host.h
> +++ b/arch/riscv/include/asm/kvm_host.h
> @@ -228,6 +228,7 @@ void kvm_riscv_stage2_vmid_update(struct kvm_vcpu *vcpu);
>
>  void __kvm_riscv_unpriv_trap(void);
>
> +void kvm_riscv_vcpu_wfi(struct kvm_vcpu *vcpu);
>  unsigned long kvm_riscv_vcpu_unpriv_read(struct kvm_vcpu *vcpu,
>                                          bool read_insn,
>                                          unsigned long guest_addr,
> diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
> index 571f319e995a..aa8af129e4bb 100644
> --- a/arch/riscv/kvm/vcpu_exit.c
> +++ b/arch/riscv/kvm/vcpu_exit.c
> @@ -144,12 +144,7 @@ static int system_opcode_insn(struct kvm_vcpu *vcpu,
>  {
>         if ((insn & INSN_MASK_WFI) == INSN_MATCH_WFI) {
>                 vcpu->stat.wfi_exit_stat++;
> -               if (!kvm_arch_vcpu_runnable(vcpu)) {
> -                       srcu_read_unlock(&vcpu->kvm->srcu, vcpu->arch.srcu_idx);
> -                       kvm_vcpu_halt(vcpu);
> -                       vcpu->arch.srcu_idx = srcu_read_lock(&vcpu->kvm->srcu);
> -                       kvm_clear_request(KVM_REQ_UNHALT, vcpu);
> -               }
> +               kvm_riscv_vcpu_wfi(vcpu);
>                 vcpu->arch.guest_context.sepc += INSN_LEN(insn);
>                 return 1;
>         }
> @@ -453,6 +448,21 @@ static int stage2_page_fault(struct kvm_vcpu *vcpu, struct kvm_run *run,
>         return 1;
>  }
>
> +/**
> + * kvm_riscv_vcpu_wfi -- Emulate wait for interrupt (WFI) behaviour
> + *
> + * @vcpu: The VCPU pointer
> + */
> +void kvm_riscv_vcpu_wfi(struct kvm_vcpu *vcpu)
> +{
> +       if (!kvm_arch_vcpu_runnable(vcpu)) {
> +               srcu_read_unlock(&vcpu->kvm->srcu, vcpu->arch.srcu_idx);
> +               kvm_vcpu_halt(vcpu);
> +               vcpu->arch.srcu_idx = srcu_read_lock(&vcpu->kvm->srcu);
> +               kvm_clear_request(KVM_REQ_UNHALT, vcpu);
> +       }
> +}
> +
>  /**
>   * kvm_riscv_vcpu_unpriv_read -- Read machine word from Guest memory
>   *
> --
> 2.25.1
>


Reviewed-by: Atish Patra <atishp@rivosinc.com>

--
Regards,
Atish

