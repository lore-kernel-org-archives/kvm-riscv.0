From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 12 Jan 2023 11:28:39 +0100
Subject: [PATCH v2 03/11] RISC-V: KVM: Return correct code for hsm stop
 function
In-Reply-To: <20221215170046.2010255-4-atishp@rivosinc.com>
References: <20221215170046.2010255-1-atishp@rivosinc.com>
 <20221215170046.2010255-4-atishp@rivosinc.com>
Message-ID: <20230112102839.rsabb2bah5lkkx4e@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Dec 15, 2022 at 09:00:38AM -0800, Atish Patra wrote:
> According to the SBI specification, the stop function can only
> return error code SBI_ERR_FAILED. However, currently it returns
> -EINVAL which will be mapped SBI_ERR_INVALID_PARAM.

I presume the mapping referred to here is kvm_linux_err_map_sbi().
If so, then -EPERM isn't correct either. That maps to SBI_ERR_DENIED.
The only thing that will ensure we get SBI_ERR_FAILURE (-1) is
anything not handled by the kvm_linux_err_map_sbi switch, as we
need to use the default.

Thanks,
drew

> 
> Return the appropriate linux error code.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/kvm/vcpu_sbi_hsm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kvm/vcpu_sbi_hsm.c b/arch/riscv/kvm/vcpu_sbi_hsm.c
> index 2e915ca..0f8d9fe 100644
> --- a/arch/riscv/kvm/vcpu_sbi_hsm.c
> +++ b/arch/riscv/kvm/vcpu_sbi_hsm.c
> @@ -42,7 +42,7 @@ static int kvm_sbi_hsm_vcpu_start(struct kvm_vcpu *vcpu)
>  static int kvm_sbi_hsm_vcpu_stop(struct kvm_vcpu *vcpu)
>  {
>  	if (vcpu->arch.power_off)
> -		return -EINVAL;
> +		return -EPERM;
>  
>  	kvm_riscv_vcpu_power_off(vcpu);
>  
> -- 
> 2.25.1
> 

