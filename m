From: Andrew Jones <ajones@ventanamicro.com>
Date: Tue, 27 Jun 2023 11:11:05 +0200
Subject: [PATCH v4 09/12] KVM: selftests: Only do get/set tests on
 present blessed list
In-Reply-To: <47f0502d076c071260a87953cbabadfc85d278cf.1687515463.git.haibo1.xu@intel.com>
References: <cover.1687515463.git.haibo1.xu@intel.com>
 <47f0502d076c071260a87953cbabadfc85d278cf.1687515463.git.haibo1.xu@intel.com>
Message-ID: <20230627-adcb173b3ee813e2e16353bd@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jun 23, 2023 at 06:40:11PM +0800, Haibo Xu wrote:
> Only do the get/set tests on present and blessed registers
> since we don't know the capabilities of any new ones.
> 
> Suggested-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
> ---
>  tools/testing/selftests/kvm/get-reg-list.c | 29 ++++++++++++++--------
>  1 file changed, 18 insertions(+), 11 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/get-reg-list.c b/tools/testing/selftests/kvm/get-reg-list.c
> index b956ee410996..3beb6b62de0a 100644
> --- a/tools/testing/selftests/kvm/get-reg-list.c
> +++ b/tools/testing/selftests/kvm/get-reg-list.c
> @@ -52,6 +52,10 @@ extern int vcpu_configs_n;
>  	for_each_reg_filtered(i)						\
>  		if (!find_reg(blessed_reg, blessed_n, reg_list->reg[i]))
>  
> +#define for_each_present_blessed_reg(i)			\
> +	for ((i) = 0; (i) < blessed_n; ++(i))		\
> +		if (find_reg(reg_list->reg, reg_list->n, blessed_reg[i]))
> +
>  static const char *config_name(struct vcpu_reg_list *c)
>  {
>  	struct vcpu_reg_sublist *s;
> @@ -189,6 +193,16 @@ static void run_test(struct vcpu_reg_list *c)
>  		return;
>  	}
>  
> +	for_each_sublist(c, s)
> +		blessed_n += s->regs_n;
> +	blessed_reg = calloc(blessed_n, sizeof(__u64));
> +
> +	n = 0;
> +	for_each_sublist(c, s) {
> +		for (i = 0; i < s->regs_n; ++i)
> +			blessed_reg[n++] = s->regs[i];
> +	}
> +
>  	/*
>  	 * We only test that we can get the register and then write back the
>  	 * same value. Some registers may allow other values to be written
> @@ -198,8 +212,11 @@ static void run_test(struct vcpu_reg_list *c)
>  	 * be written need to have the other values tested, then we should
>  	 * create a new set of tests for those in a new independent test
>  	 * executable.
> +	 *
> +	 * Only do the get/set tests on present, blessed list registers,
> +	 * since we don't know the capabilities of any new registers.
>  	 */
> -	for_each_reg(i) {
> +	for_each_present_blessed_reg(i) {
>  		uint8_t addr[2048 / 8];
>  		struct kvm_one_reg reg = {
>  			.id = reg_list->reg[i],
> @@ -242,16 +259,6 @@ static void run_test(struct vcpu_reg_list *c)
>  		}
>  	}
>  
> -	for_each_sublist(c, s)
> -		blessed_n += s->regs_n;
> -	blessed_reg = calloc(blessed_n, sizeof(__u64));
> -
> -	n = 0;
> -	for_each_sublist(c, s) {
> -		for (i = 0; i < s->regs_n; ++i)
> -			blessed_reg[n++] = s->regs[i];
> -	}
> -
>  	for_each_new_reg(i)
>  		++new_regs;
>  
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

