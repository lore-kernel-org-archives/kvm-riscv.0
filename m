From: Andrew Jones <ajones@ventanamicro.com>
Date: Tue, 27 Jun 2023 11:16:33 +0200
Subject: [PATCH v4 11/12] KVM: riscv: selftests: Add finalize_vcpu check
 in run_test
In-Reply-To: <fa6b80b578553e561ccacaeb24091e0716975593.1687515463.git.haibo1.xu@intel.com>
References: <cover.1687515463.git.haibo1.xu@intel.com>
 <fa6b80b578553e561ccacaeb24091e0716975593.1687515463.git.haibo1.xu@intel.com>
Message-ID: <20230627-feb5bf584a3fd16d2c0ffe66@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jun 23, 2023 at 06:40:13PM +0800, Haibo Xu wrote:
> Disable all vcpu extensions which were enabled by default
> if they were available in the risc-v host, and only enable
> the desired one for a vcpu_config.
> 
> Suggested-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
> ---
>  tools/testing/selftests/kvm/get-reg-list.c | 42 +++++++++++++++++++++-
>  1 file changed, 41 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/kvm/get-reg-list.c b/tools/testing/selftests/kvm/get-reg-list.c
> index 3beb6b62de0a..612dabc61137 100644
> --- a/tools/testing/selftests/kvm/get-reg-list.c
> +++ b/tools/testing/selftests/kvm/get-reg-list.c
> @@ -138,11 +138,50 @@ static struct kvm_vcpu *vcpu_config_get_vcpu(struct vcpu_reg_list *c, struct kvm
>  	prepare_vcpu_init(c, &init);
>  	vcpu = __vm_vcpu_add(vm, 0);
>  	aarch64_vcpu_setup(vcpu, &init);
> -	finalize_vcpu(vcpu, c);
>  
>  	return vcpu;
>  }
>  #else
> +static inline bool vcpu_has_ext(struct kvm_vcpu *vcpu, int ext)
> +{
> +	int ret;
> +	unsigned long value;
> +
> +	ret = __vcpu_get_reg(vcpu, RISCV_ISA_EXT_REG(ext), &value);
> +	if (ret) {
> +		printf("Failed to get ext %d", ext);
> +		return false;
> +	}
> +
> +	return !!value;
> +}
> +
> +static void finalize_vcpu(struct kvm_vcpu *vcpu, struct vcpu_reg_list *c)
> +{
> +	struct vcpu_reg_sublist *s;
> +
> +	/*
> +	 * Disable all extensions which were enabled by default
> +	 * if they were available in the risc-v host.
> +	 */
> +	for (int i = 0; i < KVM_RISCV_ISA_EXT_MAX; i++) {
> +		__vcpu_set_reg(vcpu, RISCV_ISA_EXT_REG(i), 0);
> +	}

nit: can drop the {}

> +
> +	for_each_sublist(c, s) {
> +		if (!s->feature)
> +			continue;
> +
> +		/* Try to enable the desired extension */
> +		__vcpu_set_reg(vcpu, RISCV_ISA_EXT_REG(s->feature), 1);
> +
> +		/* Double check whether the desired extension was enabled */
> +		__TEST_REQUIRE(vcpu_has_ext(vcpu, s->feature),
> +			       "%s: %s not available, skipping tests\n",
> +			       config_name(c), s->name);
> +	}
> +}
> +
>  static struct kvm_vcpu *vcpu_config_get_vcpu(struct vcpu_reg_list *c, struct kvm_vm *vm)
>  {
>  	return __vm_vcpu_add(vm, 0);
> @@ -178,6 +217,7 @@ static void run_test(struct vcpu_reg_list *c)
>  
>  	vm = vm_create_barebones();
>  	vcpu = vcpu_config_get_vcpu(c, vm);
> +	finalize_vcpu(vcpu, c);

Now that both arm and riscv call finalize_vcpu() we could do the weak
function trick for it and move the arch-specific implementations to
their own arch-specific files.

>  
>  	reg_list = vcpu_get_reg_list(vcpu);
>  
> -- 
> 2.34.1
>

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

