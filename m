From: Will Deacon <will@kernel.org>
Date: Tue, 9 Apr 2024 15:55:32 +0100
Subject: [kvmtool PATCH 1/1] riscv: Add zacas extension
In-Reply-To: <3095a39b.95.18d3440cf62.Coremail.qinshaoqing@bosc.ac.cn>
References: <3095a39b.95.18d3440cf62.Coremail.qinshaoqing@bosc.ac.cn>
Message-ID: <20240409145531.GA23464@willie-the-truck>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jan 23, 2024 at 10:57:59AM +0800, ??? wrote:
> Add parsing for Zacas ISA extension which was ratified recently in the
> riscv-zacas manual.
> 
> Signed-off-by: Shaoqing Qin <qinshaoqing@bosc.ac.cn>
> ---
>  riscv/fdt.c                         | 1 +
>  riscv/include/asm/kvm.h             | 1 +
>  riscv/include/kvm/kvm-config-arch.h | 3 +++
>  3 files changed, 5 insertions(+)
> 
> diff --git a/riscv/fdt.c b/riscv/fdt.c
> index 9af71b5..1b4f701 100644
> --- a/riscv/fdt.c
> +++ b/riscv/fdt.c
> @@ -22,6 +22,7 @@ struct isa_ext_info isa_info_arr[] = {
>  	{"svnapot", KVM_RISCV_ISA_EXT_SVNAPOT},
>  	{"svpbmt", KVM_RISCV_ISA_EXT_SVPBMT},
>  	{"zbb", KVM_RISCV_ISA_EXT_ZBB},
> +	{"zacas", KVM_RISCV_ISA_EXT_ZACAS},
>  	{"zicbom", KVM_RISCV_ISA_EXT_ZICBOM},
>  	{"zicboz", KVM_RISCV_ISA_EXT_ZICBOZ},
>  	{"zihintpause", KVM_RISCV_ISA_EXT_ZIHINTPAUSE},
> diff --git a/riscv/include/asm/kvm.h b/riscv/include/asm/kvm.h
> index 992c5e4..0c65ff0 100644
> --- a/riscv/include/asm/kvm.h
> +++ b/riscv/include/asm/kvm.h
> @@ -122,6 +122,7 @@ enum KVM_RISCV_ISA_EXT_ID {
>  	KVM_RISCV_ISA_EXT_ZICBOM,
>  	KVM_RISCV_ISA_EXT_ZICBOZ,
>  	KVM_RISCV_ISA_EXT_ZBB,
> +	KVM_RISCV_ISA_EXT_ZACAS,
>  	KVM_RISCV_ISA_EXT_SSAIA,
>  	KVM_RISCV_ISA_EXT_V,
>  	KVM_RISCV_ISA_EXT_SVNAPOT,
> diff --git a/riscv/include/kvm/kvm-config-arch.h b/riscv/include/kvm/kvm-config-arch.h
> index 863baea..7840f91 100644
> --- a/riscv/include/kvm/kvm-config-arch.h
> +++ b/riscv/include/kvm/kvm-config-arch.h
> @@ -43,6 +43,9 @@ struct kvm_config_arch {
>  	OPT_BOOLEAN('\0', "disable-zbb",				\
>  		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZBB],	\
>  		    "Disable Zbb Extension"),				\
> +	OPT_BOOLEAN('\0', "disable-zacas",				\
> +		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZACAS],	\
> +		    "Disable Zacas Extension"),				\
>  	OPT_BOOLEAN('\0', "disable-zicbom",				\
>  		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZICBOM],	\
>  		    "Disable Zicbom Extension"),			\

I tried to apply this now that the upstream kernel seems to understand
ZACAS, but the patch doesn't seem to apply against the latest kvmtool
sources.

Please can you rebase it onto the latest version and send a v2?

Thanks,

Will

