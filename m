From: Anup Patel <anup@brainfault.org>
Date: Sun, 27 Nov 2022 11:08:24 +0530
Subject: [PATCH 6/9] RISC-V: KVM: Expose Zicboz to the guest
In-Reply-To: <20221027130247.31634-7-ajones@ventanamicro.com>
References: <20221027130247.31634-1-ajones@ventanamicro.com> <20221027130247.31634-7-ajones@ventanamicro.com>
Message-ID: <CAAhSdy2i=vytPkF5B7aommPfwTvLwYEgHKDoNjsLdHuF9bSn8A@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Oct 27, 2022 at 6:34 PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> Guests may use the cbo.zero instruction when the CPU has the Zicboz
> extension and the hypervisor sets henvcfg.CBZE.
>
> Add Zicboz support for KVM guests which may be enabled and
> disabled from KVM userspace using the ISA extension ONE_REG API.
>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/include/uapi/asm/kvm.h | 1 +
>  arch/riscv/kvm/vcpu.c             | 4 ++++
>  2 files changed, 5 insertions(+)
>
> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> index 4bbf55cb2b70..8dc21ceee7aa 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -103,6 +103,7 @@ enum KVM_RISCV_ISA_EXT_ID {
>         KVM_RISCV_ISA_EXT_SVINVAL,
>         KVM_RISCV_ISA_EXT_ZIHINTPAUSE,
>         KVM_RISCV_ISA_EXT_ZICBOM,
> +       KVM_RISCV_ISA_EXT_ZICBOZ,
>         KVM_RISCV_ISA_EXT_MAX,
>  };
>
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index 18a739070b51..7758faec590a 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -62,6 +62,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
>         KVM_ISA_EXT_ARR(SVPBMT),
>         KVM_ISA_EXT_ARR(ZIHINTPAUSE),
>         KVM_ISA_EXT_ARR(ZICBOM),
> +       KVM_ISA_EXT_ARR(ZICBOZ),
>  };
>
>  static unsigned long kvm_riscv_vcpu_base2isa_ext(unsigned long base_ext)
> @@ -821,6 +822,9 @@ static void kvm_riscv_vcpu_update_config(const unsigned long *isa)
>         if (riscv_isa_extension_available(isa, ZICBOM))
>                 henvcfg |= (ENVCFG_CBIE | ENVCFG_CBCFE);
>
> +       if (riscv_isa_extension_available(isa, ZICBOZ))
> +               henvcfg |= ENVCFG_CBZE;
> +
>         csr_write(CSR_HENVCFG, henvcfg);
>  #ifdef CONFIG_32BIT
>         csr_write(CSR_HENVCFGH, henvcfg >> 32);
> --
> 2.37.3
>
>
> --
> kvm-riscv mailing list
> kvm-riscv at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

