From: Andrew Jones <ajones@ventanamicro.com>
Date: Sat, 1 Jul 2023 16:21:34 +0200
Subject: [PATCH v5 08/13] KVM: arm64: selftests: Move reject_set check
 logic to a function
In-Reply-To: <f5ef26e862260efdf1c809d0eee46ee1c8b457f2.1688010022.git.haibo1.xu@intel.com>
References: <cover.1688010022.git.haibo1.xu@intel.com>
 <f5ef26e862260efdf1c809d0eee46ee1c8b457f2.1688010022.git.haibo1.xu@intel.com>
Message-ID: <20230701-0255de0b29b22f180bb3bbbf@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Jul 01, 2023 at 09:42:56PM +0800, Haibo Xu wrote:
> No functional changes. Just move the reject_set check logic to a
> function so we can check for specific errno for specific register.

'for specific register' part isn't true anymore.

> This is a preparation for support reject_set in riscv.
> 
> Suggested-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
> ---
>  tools/testing/selftests/kvm/aarch64/get-reg-list.c | 5 +++++
>  tools/testing/selftests/kvm/get-reg-list.c         | 7 ++++++-
>  2 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/kvm/aarch64/get-reg-list.c b/tools/testing/selftests/kvm/aarch64/get-reg-list.c
> index aaf035c969ec..4aa58f1aebe3 100644
> --- a/tools/testing/selftests/kvm/aarch64/get-reg-list.c
> +++ b/tools/testing/selftests/kvm/aarch64/get-reg-list.c
> @@ -27,6 +27,11 @@ bool filter_reg(__u64 reg)
>  	return false;
>  }
>  
> +bool check_reject_set(int err)
> +{
> +	return err == EPERM;
> +}
> +
>  #define REG_MASK (KVM_REG_ARCH_MASK | KVM_REG_SIZE_MASK | KVM_REG_ARM_COPROC_MASK)
>  
>  #define CORE_REGS_XX_NR_WORDS	2
> diff --git a/tools/testing/selftests/kvm/get-reg-list.c b/tools/testing/selftests/kvm/get-reg-list.c
> index f6ad7991a812..79e198968860 100644
> --- a/tools/testing/selftests/kvm/get-reg-list.c
> +++ b/tools/testing/selftests/kvm/get-reg-list.c
> @@ -98,6 +98,11 @@ void __weak print_reg(const char *prefix, __u64 id)
>  	printf("\t0x%llx,\n", id);
>  }
>  
> +bool __weak check_reject_set(int err)
> +{
> +	return true;
> +}
> +
>  #ifdef __aarch64__
>  static void prepare_vcpu_init(struct vcpu_reg_list *c, struct kvm_vcpu_init *init)
>  {
> @@ -216,7 +221,7 @@ static void run_test(struct vcpu_reg_list *c)
>  			if (s->rejects_set && find_reg(s->rejects_set, s->rejects_set_n, reg.id)) {
>  				reject_reg = true;
>  				ret = __vcpu_ioctl(vcpu, KVM_SET_ONE_REG, &reg);
> -				if (ret != -1 || errno != EPERM) {
> +				if (ret != -1 || !check_reject_set(errno)) {
>  					printf("%s: Failed to reject (ret=%d, errno=%d) ", config_name(c), ret, errno);
>  					print_reg(config_name(c), reg.id);
>  					putchar('\n');
> -- 
> 2.34.1
>

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

