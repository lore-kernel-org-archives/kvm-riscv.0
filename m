From: Andrew Jones <ajones@ventanamicro.com>
Date: Wed, 20 Sep 2023 07:03:12 +0200
Subject: [PATCH 1/4] RISC-V: KVM: Fix KVM_GET_REG_LIST API for ISA_EXT
 registers
In-Reply-To: <20230918180646.1398384-2-apatel@ventanamicro.com>
References: <20230918180646.1398384-1-apatel@ventanamicro.com>
 <20230918180646.1398384-2-apatel@ventanamicro.com>
Message-ID: <20230920-6ef044ecc94ec729f2f6ca37@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Sep 18, 2023 at 11:36:43PM +0530, Anup Patel wrote:
> The ISA_EXT registers to enabled/disable ISA extensions for VCPU
> are always available when underlying host has the corresponding
> ISA extension. The copy_isa_ext_reg_indices() called by the
> KVM_GET_REG_LIST API does not align with this expectation so
> let's fix it.
> 
> Fixes: 031f9efafc08 ("KVM: riscv: Add KVM_GET_REG_LIST API support")
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/kvm/vcpu_onereg.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
> index 1b7e9fa265cb..e7e833ced91b 100644
> --- a/arch/riscv/kvm/vcpu_onereg.c
> +++ b/arch/riscv/kvm/vcpu_onereg.c
> @@ -842,7 +842,7 @@ static int copy_isa_ext_reg_indices(const struct kvm_vcpu *vcpu,
>  		u64 reg = KVM_REG_RISCV | size | KVM_REG_RISCV_ISA_EXT | i;
>  
>  		isa_ext = kvm_isa_ext_arr[i];
> -		if (!__riscv_isa_extension_available(vcpu->arch.isa, isa_ext))
> +		if (!__riscv_isa_extension_available(NULL, isa_ext))
>  			continue;
>  
>  		if (uindices) {
> -- 
> 2.34.1
>


Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

