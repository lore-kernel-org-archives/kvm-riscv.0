From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 9 Sep 2022 11:37:16 -0700
Subject: [PATCH v3 2/2] RISC-V: KVM: Expose Zicbom to the guest
In-Reply-To: <20220909144400.1114485-3-ajones@ventanamicro.com>
References: <20220909144400.1114485-1-ajones@ventanamicro.com> <20220909144400.1114485-3-ajones@ventanamicro.com>
Message-ID: <CAOnJCU+meVE_A=ki1bTMNCf-CHMwCQvTn-0aaHydREAH=OdcFw@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Sep 9, 2022 at 7:44 AM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> Guests may use the cbo.inval,clean,flush instructions when the
> CPU has the Zicbom extension and the hypervisor sets henvcfg.CBIE
> (for cbo.inval) and henvcfg.CBCFE (for cbo.clean,flush).
>
> Add Zicbom support for KVM guests which may be enabled and
> disabled from KVM userspace using the ISA extension ONE_REG API.
>
> Also opportunistically switch the other isa extension checks in
> kvm_riscv_vcpu_update_config() to riscv_isa_extension_available().
>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/include/uapi/asm/kvm.h | 1 +
>  arch/riscv/kvm/vcpu.c             | 9 +++++++--
>  2 files changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> index b9a4cf36be4b..ed37a4a6e5cf 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -99,6 +99,7 @@ enum KVM_RISCV_ISA_EXT_ID {
>         KVM_RISCV_ISA_EXT_M,
>         KVM_RISCV_ISA_EXT_SVPBMT,
>         KVM_RISCV_ISA_EXT_SSTC,
> +       KVM_RISCV_ISA_EXT_ZICBOM,
>         KVM_RISCV_ISA_EXT_MAX,
>  };
>
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index 2ef33d5d94d1..74d1532b26c0 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -54,6 +54,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
>         RISCV_ISA_EXT_m,
>         RISCV_ISA_EXT_SVPBMT,
>         RISCV_ISA_EXT_SSTC,
> +       RISCV_ISA_EXT_ZICBOM,
>  };
>
>  static unsigned long kvm_riscv_vcpu_base2isa_ext(unsigned long base_ext)
> @@ -792,11 +793,15 @@ static void kvm_riscv_vcpu_update_config(const unsigned long *isa)
>  {
>         u64 henvcfg = 0;
>
> -       if (__riscv_isa_extension_available(isa, RISCV_ISA_EXT_SVPBMT))
> +       if (riscv_isa_extension_available(isa, SVPBMT))
>                 henvcfg |= ENVCFG_PBMTE;
>
> -       if (__riscv_isa_extension_available(isa, RISCV_ISA_EXT_SSTC))
> +       if (riscv_isa_extension_available(isa, SSTC))
>                 henvcfg |= ENVCFG_STCE;
> +

Ideally, these should be in a separate patch.

> +       if (riscv_isa_extension_available(isa, ZICBOM))
> +               henvcfg |= (ENVCFG_CBIE | ENVCFG_CBCFE);
> +
>         csr_write(CSR_HENVCFG, henvcfg);
>  #ifdef CONFIG_32BIT
>         csr_write(CSR_HENVCFGH, henvcfg >> 32);
> --
> 2.37.2
>

Otherwise, LGTM.
Reviewed-by: Atish Patra <atishp@rivosinc.com>
-- 
Regards,
Atish

