From: Anup Patel <anup@brainfault.org>
Date: Thu, 18 Apr 2024 18:51:16 +0530
Subject: [PATCH v2 11/12] RISC-V: KVM: Allow Zcmop extension for Guest/VM
In-Reply-To: <20240418124300.1387978-12-cleger@rivosinc.com>
References: <20240418124300.1387978-1-cleger@rivosinc.com> <20240418124300.1387978-12-cleger@rivosinc.com>
Message-ID: <CAAhSdy3bjKQhRRFLhNtCGNG=f9cj=LHhr0sPWdeFFR9KpC3RVw@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Apr 18, 2024 at 6:14?PM Cl?ment L?ger <cleger@rivosinc.com> wrote:
>
> Extend the KVM ISA extension ONE_REG interface to allow KVM user space
> to detect and enable Zcmop extension for Guest/VM.
>
> Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>
Acked-by: Anup Patel <anup@brainfault.org>

Thanks,
Anup

> ---
>  arch/riscv/include/uapi/asm/kvm.h | 1 +
>  arch/riscv/kvm/vcpu_onereg.c      | 2 ++
>  2 files changed, 3 insertions(+)
>
> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> index 57db3fea679f..0366389a0bae 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -172,6 +172,7 @@ enum KVM_RISCV_ISA_EXT_ID {
>         KVM_RISCV_ISA_EXT_ZCB,
>         KVM_RISCV_ISA_EXT_ZCD,
>         KVM_RISCV_ISA_EXT_ZCF,
> +       KVM_RISCV_ISA_EXT_ZCMOP,
>         KVM_RISCV_ISA_EXT_MAX,
>  };
>
> diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
> index a2747a6dbdb6..77a0d337faeb 100644
> --- a/arch/riscv/kvm/vcpu_onereg.c
> +++ b/arch/riscv/kvm/vcpu_onereg.c
> @@ -52,6 +52,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
>         KVM_ISA_EXT_ARR(ZCB),
>         KVM_ISA_EXT_ARR(ZCD),
>         KVM_ISA_EXT_ARR(ZCF),
> +       KVM_ISA_EXT_ARR(ZCMOP),
>         KVM_ISA_EXT_ARR(ZFA),
>         KVM_ISA_EXT_ARR(ZFH),
>         KVM_ISA_EXT_ARR(ZFHMIN),
> @@ -136,6 +137,7 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
>         case KVM_RISCV_ISA_EXT_ZCB:
>         case KVM_RISCV_ISA_EXT_ZCD:
>         case KVM_RISCV_ISA_EXT_ZCF:
> +       case KVM_RISCV_ISA_EXT_ZCMOP:
>         case KVM_RISCV_ISA_EXT_ZFA:
>         case KVM_RISCV_ISA_EXT_ZFH:
>         case KVM_RISCV_ISA_EXT_ZFHMIN:
> --
> 2.43.0
>

