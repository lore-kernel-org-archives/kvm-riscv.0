From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 20 Sep 2022 23:58:34 +0530
Subject: [PATCH v1] RISC-V: KVM: Allow Guest use Zihintpause extension
In-Reply-To: <20220916054637.24133-1-mchitale@ventanamicro.com>
References: <20220916054637.24133-1-mchitale@ventanamicro.com>
Message-ID: <CAK9=C2UhaRo6idT3xXLUx52UHyTeHVfMQczXyYQRPboNxjXiFQ@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Sep 16, 2022 at 11:17 AM Mayuresh Chitale
<mchitale@ventanamicro.com> wrote:
>
> We should advertise Zihintpause ISA extension to KVM user-space whenever
> host supports it. This will allow KVM user-space (i.e. QEMU or KVMTOOL)
> to pass on this information to Guest via ISA string.
>
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>

I have queued this patch for 6.1

Thanks,
Anup

> ---
>  arch/riscv/include/uapi/asm/kvm.h | 1 +
>  arch/riscv/kvm/vcpu.c             | 2 ++
>  2 files changed, 3 insertions(+)
>
> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> index b6770ee08872..9085b90cf324 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -99,6 +99,7 @@ enum KVM_RISCV_ISA_EXT_ID {
>         KVM_RISCV_ISA_EXT_SVPBMT,
>         KVM_RISCV_ISA_EXT_SSTC,
>         KVM_RISCV_ISA_EXT_SVINVAL,
> +       KVM_RISCV_ISA_EXT_ZIHINTPAUSE,
>         KVM_RISCV_ISA_EXT_MAX,
>  };
>
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index 901bb5c0cb50..0de0dd22e734 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -54,6 +54,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
>         RISCV_ISA_EXT_SVPBMT,
>         RISCV_ISA_EXT_SSTC,
>         RISCV_ISA_EXT_SVINVAL,
> +       RISCV_ISA_EXT_ZIHINTPAUSE,
>  };
>
>  static unsigned long kvm_riscv_vcpu_base2isa_ext(unsigned long base_ext)
> @@ -89,6 +90,7 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
>         case KVM_RISCV_ISA_EXT_M:
>         case KVM_RISCV_ISA_EXT_SSTC:
>         case KVM_RISCV_ISA_EXT_SVINVAL:
> +       case KVM_RISCV_ISA_EXT_ZIHINTPAUSE:
>                 return false;
>         default:
>                 break;
> --
> 2.34.1
>
>
> --
> kvm-riscv mailing list
> kvm-riscv at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

