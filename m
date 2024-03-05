From: Andrew Jones <ajones@ventanamicro.com>
Date: Tue, 5 Mar 2024 14:52:25 +0100
Subject: [kvmtool PATCH 10/10] riscv: Allow disabling SBI STA extension
 for Guest
In-Reply-To: <20240214122141.305126-11-apatel@ventanamicro.com>
References: <20240214122141.305126-1-apatel@ventanamicro.com>
 <20240214122141.305126-11-apatel@ventanamicro.com>
Message-ID: <20240305-05dffac2a28923796e790f0b@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Feb 14, 2024 at 05:51:41PM +0530, Anup Patel wrote:
> We add "--disable-sbi-sta" options to allow users disable SBI steal-time
> extension for the Guest.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  riscv/include/kvm/kvm-config-arch.h | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/riscv/include/kvm/kvm-config-arch.h b/riscv/include/kvm/kvm-config-arch.h
> index 6415d3d..e562d71 100644
> --- a/riscv/include/kvm/kvm-config-arch.h
> +++ b/riscv/include/kvm/kvm-config-arch.h
> @@ -186,6 +186,9 @@ struct kvm_config_arch {
>  		    "Disable SBI Vendor Extensions"),			\
>  	OPT_BOOLEAN('\0', "disable-sbi-dbcn",				\
>  		    &(cfg)->sbi_ext_disabled[KVM_RISCV_SBI_EXT_DBCN],	\
> -		    "Disable SBI DBCN Extension"),
> +		    "Disable SBI DBCN Extension"),			\
> +	OPT_BOOLEAN('\0', "disable-sbi-sta",				\
> +		    &(cfg)->sbi_ext_disabled[KVM_RISCV_SBI_EXT_STA],	\
> +		    "Disable SBI STA Extension"),
>  
>  #endif /* KVM__KVM_CONFIG_ARCH_H */
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

