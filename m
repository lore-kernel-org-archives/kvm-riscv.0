From: Andrew Jones <ajones@ventanamicro.com>
Date: Fri, 24 May 2024 12:33:24 +0200
Subject: [v2][kvmtool PATCH 1/1] riscv: Add zacas extension
In-Reply-To: <228d4ce6.49.18fa881fced.Coremail.qinshaoqing@bosc.ac.cn>
References: <228d4ce6.49.18fa881fced.Coremail.qinshaoqing@bosc.ac.cn>
Message-ID: <20240524-0b829950649ff4b154a57284@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, May 24, 2024 at 10:50:42AM GMT, Shaoqing Qin wrote:
> Add parsing for Zacas ISA extension which was ratified recently in the
> riscv-zacas manual.
> The tests are based on the 6.9 version of the kernel
> 
> Signed-off-by: Shaoqing Qin <qinshaoqing@bosc.ac.cn>
> ---
> Changed from v1:
> 1. modify ZACAS enum number.
> 2. modify the code location,just for formatting.
> ---
>  riscv/fdt.c                         | 1 +
>  riscv/include/asm/kvm.h             | 1 +
>  riscv/include/kvm/kvm-config-arch.h | 3 +++
>  3 files changed, 5 insertions(+)
> 
> diff --git a/riscv/fdt.c b/riscv/fdt.c
> index cc8070d..6dfc25b 100644
> --- a/riscv/fdt.c
> +++ b/riscv/fdt.c
> @@ -22,6 +22,7 @@ struct isa_ext_info isa_info_arr[] = {
>  	{"svinval", KVM_RISCV_ISA_EXT_SVINVAL},
>  	{"svnapot", KVM_RISCV_ISA_EXT_SVNAPOT},
>  	{"svpbmt", KVM_RISCV_ISA_EXT_SVPBMT},
> +	{"zacas", KVM_RISCV_ISA_EXT_ZACAS},
>  	{"zba", KVM_RISCV_ISA_EXT_ZBA},
>  	{"zbb", KVM_RISCV_ISA_EXT_ZBB},
>  	{"zbc", KVM_RISCV_ISA_EXT_ZBC},
> diff --git a/riscv/include/asm/kvm.h b/riscv/include/asm/kvm.h
> index 7499e88..6b2cbe7 100644
> --- a/riscv/include/asm/kvm.h
> +++ b/riscv/include/asm/kvm.h
> @@ -135,6 +135,7 @@ enum KVM_RISCV_ISA_EXT_ID {
>  	KVM_RISCV_ISA_EXT_ZBS,
>  	KVM_RISCV_ISA_EXT_ZICNTR,
>  	KVM_RISCV_ISA_EXT_ZICSR,
> +	KVM_RISCV_ISA_EXT_ZACAS,

This should be updated with util/update_headers.sh

>  	KVM_RISCV_ISA_EXT_ZIFENCEI,
>  	KVM_RISCV_ISA_EXT_ZIHPM,
>  	KVM_RISCV_ISA_EXT_SMSTATEEN,
> diff --git a/riscv/include/kvm/kvm-config-arch.h b/riscv/include/kvm/kvm-config-arch.h
> index e562d71..e5343a6 100644
> --- a/riscv/include/kvm/kvm-config-arch.h
> +++ b/riscv/include/kvm/kvm-config-arch.h
> @@ -43,6 +43,9 @@ struct kvm_config_arch {
>  	OPT_BOOLEAN('\0', "disable-svpbmt",				\
>  		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_SVPBMT],	\
>  		    "Disable Svpbmt Extension"),			\
> +	OPT_BOOLEAN('\0', "disable-zacas",				\
> +		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZACAS],	\
> +		    "Disable Zacas Extension"),			\
>  	OPT_BOOLEAN('\0', "disable-zba",				\
>  		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZBA],	\
>  		    "Disable Zba Extension"),				\
> -- 
> 2.43.0

But, we don't need this patch since Zacas was posted along with Ztso here

https://lore.kernel.org/all/20240514054928.854419-1-apatel at ventanamicro.com/

Thanks,
drew

