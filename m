From: Andrew Jones <ajones@ventanamicro.com>
Date: Fri, 21 Jun 2024 10:52:16 +0200
Subject: [PATCH v5 3/4] RISC-V: KVM: Add Svade and Svadu Extensions
 Support for Guest/VM
In-Reply-To: <20240605121512.32083-4-yongxuan.wang@sifive.com>
References: <20240605121512.32083-1-yongxuan.wang@sifive.com>
 <20240605121512.32083-4-yongxuan.wang@sifive.com>
Message-ID: <20240621-2c3ffd345cba1317bc0f5f9d@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jun 05, 2024 at 08:15:09PM GMT, Yong-Xuan Wang wrote:
> We extend the KVM ISA extension ONE_REG interface to allow VMM tools to
> detect and enable Svade and Svadu extensions for Guest/VM. Since the
> henvcfg.ADUE is read-only zero if the menvcfg.ADUE is zero, the Svadu
> extension is available for Guest/VM only when arch_has_hw_pte_young()
> is true.
> 
> Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
> ---
>  arch/riscv/include/uapi/asm/kvm.h | 2 ++
>  arch/riscv/kvm/vcpu.c             | 6 ++++++
>  arch/riscv/kvm/vcpu_onereg.c      | 6 ++++++
>  3 files changed, 14 insertions(+)
> 
> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> index e878e7cc3978..a5e0c35d7e9a 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -168,6 +168,8 @@ enum KVM_RISCV_ISA_EXT_ID {
>  	KVM_RISCV_ISA_EXT_ZTSO,
>  	KVM_RISCV_ISA_EXT_ZACAS,
>  	KVM_RISCV_ISA_EXT_SSCOFPMF,
> +	KVM_RISCV_ISA_EXT_SVADE,
> +	KVM_RISCV_ISA_EXT_SVADU,
>  	KVM_RISCV_ISA_EXT_MAX,
>  };
>  
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index 17e21df36cc1..21edd60c4756 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -540,6 +540,12 @@ static void kvm_riscv_vcpu_setup_config(struct kvm_vcpu *vcpu)
>  	if (riscv_isa_extension_available(isa, ZICBOZ))
>  		cfg->henvcfg |= ENVCFG_CBZE;
>  
> +	if (riscv_isa_extension_available(isa, SVADU))
> +		cfg->henvcfg |= ENVCFG_ADUE;
> +
> +	if (riscv_isa_extension_available(isa, SVADE))
> +		cfg->henvcfg &= ~ENVCFG_ADUE;

nit: I'd write this as

	if (!riscv_isa_extension_available(isa, SVADE) &&
	    riscv_isa_extension_available(isa, SVADU))
		cfg->henvcfg |= ENVCFG_ADUE;

> +
>  	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN)) {
>  		cfg->hstateen0 |= SMSTATEEN0_HSENVCFG;
>  		if (riscv_isa_extension_available(isa, SSAIA))
> diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
> index c676275ea0a0..06e930f1e206 100644
> --- a/arch/riscv/kvm/vcpu_onereg.c
> +++ b/arch/riscv/kvm/vcpu_onereg.c
> @@ -15,6 +15,7 @@
>  #include <asm/cacheflush.h>
>  #include <asm/cpufeature.h>
>  #include <asm/kvm_vcpu_vector.h>
> +#include <asm/pgtable.h>
>  #include <asm/vector.h>
>  
>  #define KVM_RISCV_BASE_ISA_MASK		GENMASK(25, 0)
> @@ -38,6 +39,8 @@ static const unsigned long kvm_isa_ext_arr[] = {
>  	KVM_ISA_EXT_ARR(SSAIA),
>  	KVM_ISA_EXT_ARR(SSCOFPMF),
>  	KVM_ISA_EXT_ARR(SSTC),
> +	KVM_ISA_EXT_ARR(SVADE),
> +	KVM_ISA_EXT_ARR(SVADU),
>  	KVM_ISA_EXT_ARR(SVINVAL),
>  	KVM_ISA_EXT_ARR(SVNAPOT),
>  	KVM_ISA_EXT_ARR(SVPBMT),
> @@ -105,6 +108,9 @@ static bool kvm_riscv_vcpu_isa_enable_allowed(unsigned long ext)
>  		return __riscv_isa_extension_available(NULL, RISCV_ISA_EXT_SSAIA);
>  	case KVM_RISCV_ISA_EXT_V:
>  		return riscv_v_vstate_ctrl_user_allowed();
> +	case KVM_RISCV_ISA_EXT_SVADU:
> +		/* The henvcfg.ADUE is read-only zero if menvcfg.ADUE is zero. */
> +		return arch_has_hw_pte_young();
>  	default:
>  		break;
>  	}
> -- 
> 2.17.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>


