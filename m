From: Anup Patel <anup@brainfault.org>
Date: Mon, 19 Jun 2023 14:34:33 +0530
Subject: [PATCH] RISC-V: KVM: Allow Svnapot extension for Guest/VM
In-Reply-To: <20230612111044.87775-1-apatel@ventanamicro.com>
References: <20230612111044.87775-1-apatel@ventanamicro.com>
Message-ID: <CAAhSdy2H8fhb84Q7kn==6pdRod_CcZ1hWyr3niDBGKfr4e-mQg@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jun 12, 2023 at 4:41?PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> We extend the KVM ISA extension ONE_REG interface to allow KVM
> user space to detect and enable Svnapot extension for Guest/VM.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Queued this patch for Linux-6.5

Thanks,
Anup

> ---
>  arch/riscv/include/uapi/asm/kvm.h | 1 +
>  arch/riscv/kvm/vcpu.c             | 2 ++
>  2 files changed, 3 insertions(+)
>
> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> index 61d7fecc4899..a1ca18408bbd 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -122,6 +122,7 @@ enum KVM_RISCV_ISA_EXT_ID {
>         KVM_RISCV_ISA_EXT_ZICBOZ,
>         KVM_RISCV_ISA_EXT_ZBB,
>         KVM_RISCV_ISA_EXT_SSAIA,
> +       KVM_RISCV_ISA_EXT_SVNAPOT,
>         KVM_RISCV_ISA_EXT_MAX,
>  };
>
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index 2db62c6c0d3e..7b355900f235 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -61,6 +61,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
>         KVM_ISA_EXT_ARR(SSAIA),
>         KVM_ISA_EXT_ARR(SSTC),
>         KVM_ISA_EXT_ARR(SVINVAL),
> +       KVM_ISA_EXT_ARR(SVNAPOT),
>         KVM_ISA_EXT_ARR(SVPBMT),
>         KVM_ISA_EXT_ARR(ZBB),
>         KVM_ISA_EXT_ARR(ZIHINTPAUSE),
> @@ -102,6 +103,7 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
>         case KVM_RISCV_ISA_EXT_SSAIA:
>         case KVM_RISCV_ISA_EXT_SSTC:
>         case KVM_RISCV_ISA_EXT_SVINVAL:
> +       case KVM_RISCV_ISA_EXT_SVNAPOT:
>         case KVM_RISCV_ISA_EXT_ZIHINTPAUSE:
>         case KVM_RISCV_ISA_EXT_ZBB:
>                 return false;
> --
> 2.34.1
>
>
> --
> kvm-riscv mailing list
> kvm-riscv at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

