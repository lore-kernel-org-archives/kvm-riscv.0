From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 19 Oct 2023 09:46:01 +0200
Subject: [PATCH v2 2/8] RISC-V: KVM: Change the SBI specification version
 to v2.0
In-Reply-To: <20231012051509.738750-3-apatel@ventanamicro.com>
References: <20231012051509.738750-1-apatel@ventanamicro.com>
 <20231012051509.738750-3-apatel@ventanamicro.com>
Message-ID: <20231019-d6386d58125da87f5e4c5ff2@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Oct 12, 2023 at 10:45:03AM +0530, Anup Patel wrote:
> We will be implementing SBI DBCN extension for KVM RISC-V so let
> us change the KVM RISC-V SBI specification version to v2.0.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/asm/kvm_vcpu_sbi.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> index cdcf0ff07be7..8d6d4dce8a5e 100644
> --- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
> +++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> @@ -11,7 +11,7 @@
>  
>  #define KVM_SBI_IMPID 3
>  
> -#define KVM_SBI_VERSION_MAJOR 1
> +#define KVM_SBI_VERSION_MAJOR 2
>  #define KVM_SBI_VERSION_MINOR 0
>  
>  enum kvm_riscv_sbi_ext_status {
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

