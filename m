From: Andrew Jones <ajones@ventanamicro.com>
Date: Wed, 20 Sep 2023 09:46:53 +0200
Subject: [PATCH 4/7] RISC-V: KVM: Allow Zicond extension for Guest/VM
In-Reply-To: <20230919035343.1399389-5-apatel@ventanamicro.com>
References: <20230919035343.1399389-1-apatel@ventanamicro.com>
 <20230919035343.1399389-5-apatel@ventanamicro.com>
Message-ID: <20230920-be44cc5bd0f749a1137d103c@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Sep 19, 2023 at 09:23:40AM +0530, Anup Patel wrote:
> We extend the KVM ISA extension ONE_REG interface to allow KVM
> user space to detect and enable Zicond extension for Guest/VM.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/uapi/asm/kvm.h | 1 +
>  arch/riscv/kvm/vcpu_onereg.c      | 2 ++
>  2 files changed, 3 insertions(+)
> 
> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> index e030c12c7dfc..35ceb38a4eff 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -139,6 +139,7 @@ enum KVM_RISCV_ISA_EXT_ID {
>  	KVM_RISCV_ISA_EXT_ZIHPM,
>  	KVM_RISCV_ISA_EXT_SMSTATEEN,
>  	KVM_RISCV_ISA_EXT_XVENTANACONDOPS,
> +	KVM_RISCV_ISA_EXT_ZICOND,
>  	KVM_RISCV_ISA_EXT_MAX,
>  };
>  
> diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
> index 17a847a1114b..d3ca4969c985 100644
> --- a/arch/riscv/kvm/vcpu_onereg.c
> +++ b/arch/riscv/kvm/vcpu_onereg.c
> @@ -47,6 +47,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
>  	KVM_ISA_EXT_ARR(ZICBOM),
>  	KVM_ISA_EXT_ARR(ZICBOZ),
>  	KVM_ISA_EXT_ARR(ZICNTR),
> +	KVM_ISA_EXT_ARR(ZICOND),
>  	KVM_ISA_EXT_ARR(ZICSR),
>  	KVM_ISA_EXT_ARR(ZIFENCEI),
>  	KVM_ISA_EXT_ARR(ZIHINTPAUSE),
> @@ -95,6 +96,7 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
>  	case KVM_RISCV_ISA_EXT_ZBB:
>  	case KVM_RISCV_ISA_EXT_ZBS:
>  	case KVM_RISCV_ISA_EXT_ZICNTR:
> +	case KVM_RISCV_ISA_EXT_ZICOND:
>  	case KVM_RISCV_ISA_EXT_ZICSR:
>  	case KVM_RISCV_ISA_EXT_ZIFENCEI:
>  	case KVM_RISCV_ISA_EXT_ZIHINTPAUSE:
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

