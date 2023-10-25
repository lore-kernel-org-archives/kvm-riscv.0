From: Andrew Jones <ajones@ventanamicro.com>
Date: Wed, 25 Oct 2023 14:54:16 +0200
Subject: [kvmtool PATCH v2 2/6] riscv: Add Svnapot extension support
In-Reply-To: <20230918125730.1371985-3-apatel@ventanamicro.com>
References: <20230918125730.1371985-1-apatel@ventanamicro.com>
 <20230918125730.1371985-3-apatel@ventanamicro.com>
Message-ID: <20231025-ede83c6b800daa82237e7fcf@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Sep 18, 2023 at 06:27:26PM +0530, Anup Patel wrote:
> When the Svnapot extension is available expose it to the guest via
> device tree so that guest can use it.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  riscv/fdt.c                         | 1 +
>  riscv/include/kvm/kvm-config-arch.h | 3 +++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/riscv/fdt.c b/riscv/fdt.c
> index df71ed4..2724c6e 100644
> --- a/riscv/fdt.c
> +++ b/riscv/fdt.c
> @@ -19,6 +19,7 @@ struct isa_ext_info isa_info_arr[] = {
>  	{"ssaia", KVM_RISCV_ISA_EXT_SSAIA},
>  	{"sstc", KVM_RISCV_ISA_EXT_SSTC},
>  	{"svinval", KVM_RISCV_ISA_EXT_SVINVAL},
> +	{"svnapot", KVM_RISCV_ISA_EXT_SVNAPOT},
>  	{"svpbmt", KVM_RISCV_ISA_EXT_SVPBMT},
>  	{"zbb", KVM_RISCV_ISA_EXT_ZBB},
>  	{"zicbom", KVM_RISCV_ISA_EXT_ZICBOM},
> diff --git a/riscv/include/kvm/kvm-config-arch.h b/riscv/include/kvm/kvm-config-arch.h
> index b0a7e25..863baea 100644
> --- a/riscv/include/kvm/kvm-config-arch.h
> +++ b/riscv/include/kvm/kvm-config-arch.h
> @@ -34,6 +34,9 @@ struct kvm_config_arch {
>  	OPT_BOOLEAN('\0', "disable-svinval",				\
>  		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_SVINVAL],	\
>  		    "Disable Svinval Extension"),			\
> +	OPT_BOOLEAN('\0', "disable-svnapot",				\
> +		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_SVNAPOT],	\
> +		    "Disable Svnapot Extension"),			\
>  	OPT_BOOLEAN('\0', "disable-svpbmt",				\
>  		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_SVPBMT],	\
>  		    "Disable Svpbmt Extension"),			\
> -- 
> 2.34.1
>


Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

