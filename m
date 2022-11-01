From: Andrew Jones <ajones@ventanamicro.com>
Date: Tue, 1 Nov 2022 16:32:41 +0100
Subject: [RFC  3/9] RISC-V: KVM: Define a probe function for SBI
 extension data structures
In-Reply-To: <20220718170205.2972215-4-atishp@rivosinc.com>
References: <20220718170205.2972215-1-atishp@rivosinc.com>
 <20220718170205.2972215-4-atishp@rivosinc.com>
Message-ID: <20221101153241.wnox5zp7ymyg4gnx@kamzik>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jul 18, 2022 at 10:01:59AM -0700, Atish Patra wrote:
> c,urrently the probe function just check if an SBI extension is
Currently                            checks

> registered or not. However, the extension may not want to advertise
> itself depending on some other condition.
> An additional extension specific probe function will allow
> extensions to decide if they want to be advertised to the caller or
> not. Any extension that do not require additional dependency check
                          does                                 checks

> does not required to implement this function.

s/does/is/

> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/include/asm/kvm_vcpu_sbi.h |  3 +++
>  arch/riscv/kvm/vcpu_sbi_base.c        | 13 +++++++++++--
>  2 files changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> index 83d6d4d2b1df..5853a1ef71ea 100644
> --- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
> +++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> @@ -25,6 +25,9 @@ struct kvm_vcpu_sbi_extension {
>  	int (*handler)(struct kvm_vcpu *vcpu, struct kvm_run *run,
>  		       unsigned long *out_val, struct kvm_cpu_trap *utrap,
>  		       bool *exit);
> +
> +	/* Extension specific probe function */
> +	unsigned long (*probe)(unsigned long extid);
>  };
>  
>  void kvm_riscv_vcpu_sbi_forward(struct kvm_vcpu *vcpu, struct kvm_run *run);
> diff --git a/arch/riscv/kvm/vcpu_sbi_base.c b/arch/riscv/kvm/vcpu_sbi_base.c
> index 48f431091cdb..14be1a819588 100644
> --- a/arch/riscv/kvm/vcpu_sbi_base.c
> +++ b/arch/riscv/kvm/vcpu_sbi_base.c
> @@ -22,6 +22,7 @@ static int kvm_sbi_ext_base_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
>  	int ret = 0;
>  	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
>  	struct sbiret ecall_ret;
> +	const struct kvm_vcpu_sbi_extension *sbi_ext;
>  
>  	switch (cp->a6) {
>  	case SBI_EXT_BASE_GET_SPEC_VERSION:
> @@ -46,8 +47,16 @@ static int kvm_sbi_ext_base_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
>  			 */
>  			kvm_riscv_vcpu_sbi_forward(vcpu, run);
>  			*exit = true;
> -		} else
> -			*out_val = kvm_vcpu_sbi_find_ext(cp->a0) ? 1 : 0;
> +		} else {
> +			sbi_ext = kvm_vcpu_sbi_find_ext(cp->a0);
> +			if (sbi_ext) {
> +				if (sbi_ext->probe)
> +					*out_val = sbi_ext->probe(cp->a0);
> +				else
> +					*out_val = 1;
> +			} else
> +				*out_val = 0;
> +		}
>  		break;
>  	case SBI_EXT_BASE_GET_MVENDORID:
>  	case SBI_EXT_BASE_GET_MARCHID:
> -- 
> 2.25.1
>

Other than the commit message fixes

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

