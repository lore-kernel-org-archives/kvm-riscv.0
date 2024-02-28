From: Andrew Jones <ajones@ventanamicro.com>
Date: Wed, 28 Feb 2024 14:05:31 +0100
Subject: [PATCH 2/5] RISC-V: KVM: Allow Ztso extension for Guest/VM
In-Reply-To: <20240214123757.305347-3-apatel@ventanamicro.com>
References: <20240214123757.305347-1-apatel@ventanamicro.com>
 <20240214123757.305347-3-apatel@ventanamicro.com>
Message-ID: <20240228-4b0546ecd98e675844aab46f@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Feb 14, 2024 at 06:07:54PM +0530, Anup Patel wrote:
> We extend the KVM ISA extension ONE_REG interface to allow KVM
> user space to detect and enable Ztso extension for Guest/VM.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/uapi/asm/kvm.h | 1 +
>  arch/riscv/kvm/vcpu_onereg.c      | 2 ++
>  2 files changed, 3 insertions(+)
> 
> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> index 7499e88a947c..f8aa9f2ace95 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -166,6 +166,7 @@ enum KVM_RISCV_ISA_EXT_ID {
>  	KVM_RISCV_ISA_EXT_ZVFH,
>  	KVM_RISCV_ISA_EXT_ZVFHMIN,
>  	KVM_RISCV_ISA_EXT_ZFA,
> +	KVM_RISCV_ISA_EXT_ZTSO,
>  	KVM_RISCV_ISA_EXT_MAX,
>  };
>  
> diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
> index 5f7355e96008..38f5cf286087 100644
> --- a/arch/riscv/kvm/vcpu_onereg.c
> +++ b/arch/riscv/kvm/vcpu_onereg.c
> @@ -66,6 +66,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
>  	KVM_ISA_EXT_ARR(ZKSED),
>  	KVM_ISA_EXT_ARR(ZKSH),
>  	KVM_ISA_EXT_ARR(ZKT),
> +	KVM_ISA_EXT_ARR(ZTSO),
>  	KVM_ISA_EXT_ARR(ZVBB),
>  	KVM_ISA_EXT_ARR(ZVBC),
>  	KVM_ISA_EXT_ARR(ZVFH),
> @@ -141,6 +142,7 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
>  	case KVM_RISCV_ISA_EXT_ZKSED:
>  	case KVM_RISCV_ISA_EXT_ZKSH:
>  	case KVM_RISCV_ISA_EXT_ZKT:
> +	case KVM_RISCV_ISA_EXT_ZTSO:
>  	case KVM_RISCV_ISA_EXT_ZVBB:
>  	case KVM_RISCV_ISA_EXT_ZVBC:
>  	case KVM_RISCV_ISA_EXT_ZVFH:
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

