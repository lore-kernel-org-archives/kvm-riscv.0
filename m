From: Andrew Jones <ajones@ventanamicro.com>
Date: Tue, 5 Mar 2024 14:35:04 +0100
Subject: [kvmtool PATCH 03/10] riscv: Add Zbc extension support
In-Reply-To: <20240214122141.305126-4-apatel@ventanamicro.com>
References: <20240214122141.305126-1-apatel@ventanamicro.com>
 <20240214122141.305126-4-apatel@ventanamicro.com>
Message-ID: <20240305-8f39b0950d3bcdfd44e0cbe0@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Feb 14, 2024 at 05:51:34PM +0530, Anup Patel wrote:
> When the Zbc extension is available expose it to the guest
> via device tree so that guest can use it.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  riscv/fdt.c                         | 1 +
>  riscv/include/kvm/kvm-config-arch.h | 3 +++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/riscv/fdt.c b/riscv/fdt.c
> index 8485acf..84b6087 100644
> --- a/riscv/fdt.c
> +++ b/riscv/fdt.c
> @@ -24,6 +24,7 @@ struct isa_ext_info isa_info_arr[] = {
>  	{"svpbmt", KVM_RISCV_ISA_EXT_SVPBMT},
>  	{"zba", KVM_RISCV_ISA_EXT_ZBA},
>  	{"zbb", KVM_RISCV_ISA_EXT_ZBB},
> +	{"zbc", KVM_RISCV_ISA_EXT_ZBC},
>  	{"zbs", KVM_RISCV_ISA_EXT_ZBS},
>  	{"zicbom", KVM_RISCV_ISA_EXT_ZICBOM},
>  	{"zicboz", KVM_RISCV_ISA_EXT_ZICBOZ},
> diff --git a/riscv/include/kvm/kvm-config-arch.h b/riscv/include/kvm/kvm-config-arch.h
> index d2fc2d4..6d09eee 100644
> --- a/riscv/include/kvm/kvm-config-arch.h
> +++ b/riscv/include/kvm/kvm-config-arch.h
> @@ -49,6 +49,9 @@ struct kvm_config_arch {
>  	OPT_BOOLEAN('\0', "disable-zbb",				\
>  		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZBB],	\
>  		    "Disable Zbb Extension"),				\
> +	OPT_BOOLEAN('\0', "disable-zbc",				\
> +		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZBC],	\
> +		    "Disable Zbc Extension"),				\
>  	OPT_BOOLEAN('\0', "disable-zbs",				\
>  		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZBS],	\
>  		    "Disable Zbs Extension"),				\
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

