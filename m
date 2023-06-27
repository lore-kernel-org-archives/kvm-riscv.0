From: Andrew Jones <ajones@ventanamicro.com>
Date: Tue, 27 Jun 2023 11:09:28 +0200
Subject: [PATCH v4 08/12] KVM: arm64: selftests: Move reject_set check
 logic to a function
In-Reply-To: <341feff384c9f8a20ed4aac6e2dda0440d6b84f2.1687515463.git.haibo1.xu@intel.com>
References: <cover.1687515463.git.haibo1.xu@intel.com>
 <341feff384c9f8a20ed4aac6e2dda0440d6b84f2.1687515463.git.haibo1.xu@intel.com>
Message-ID: <20230627-4d207186c4ef81be43c9d874@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jun 23, 2023 at 06:40:10PM +0800, Haibo Xu wrote:
> No functional changes. Just move the reject_set check logic to a
> function so we can check for specific errno for specific register.
> This is a preparation for support reject_set in riscv.
> 
> Suggested-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
> ---
>  tools/testing/selftests/kvm/aarch64/get-reg-list.c | 8 ++++++++
>  tools/testing/selftests/kvm/get-reg-list.c         | 7 ++++++-
>  2 files changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/kvm/aarch64/get-reg-list.c b/tools/testing/selftests/kvm/aarch64/get-reg-list.c
> index aaf035c969ec..4e2e1fe833eb 100644
> --- a/tools/testing/selftests/kvm/aarch64/get-reg-list.c
> +++ b/tools/testing/selftests/kvm/aarch64/get-reg-list.c
> @@ -27,6 +27,14 @@ bool filter_reg(__u64 reg)
>  	return false;
>  }
>  
> +bool reject_set_fail(__u64 reg)
> +{
> +	if (reg == KVM_REG_ARM64_SVE_VLS)
> +		return (errno != EPERM);
> +
> +	return false;
> +}

I think we should pass errno in as a parameter and I prefer positive
predicate functions, so I'd name this check_reject_set() and reverse
the logic. Also, we don't want to check for KVM_REG_ARM64_SVE_VLS,
because that duplicates the rejects set. I see in a later patch
that riscv needs to check reg because different errors are used
for different registers, but that's because KVM_REG_RISCV_TIMER_REG(state)
was erroneously added to the rejects set. KVM_REG_RISCV_TIMER_REG(state)
doesn't belong there. That register can be set, but it only supports
certain input, otherwise, it correctly, results in EINVAL. We'll need
the concept of a "skip set" to avoid tripping over that one.

So, I think arm's function should be

 bool check_reject_set(int errno)
 {
     return errno == EPERM;
 }

and riscv's should be

 bool check_reject_set(int errno)
 {
     return errno == EOPNOTSUPP;
 }

> +
>  #define REG_MASK (KVM_REG_ARCH_MASK | KVM_REG_SIZE_MASK | KVM_REG_ARM_COPROC_MASK)
>  
>  #define CORE_REGS_XX_NR_WORDS	2
> diff --git a/tools/testing/selftests/kvm/get-reg-list.c b/tools/testing/selftests/kvm/get-reg-list.c
> index f6ad7991a812..b956ee410996 100644
> --- a/tools/testing/selftests/kvm/get-reg-list.c
> +++ b/tools/testing/selftests/kvm/get-reg-list.c
> @@ -98,6 +98,11 @@ void __weak print_reg(const char *prefix, __u64 id)
>  	printf("\t0x%llx,\n", id);
>  }
>  
> +bool __weak reject_set_fail(__u64 reg)
> +{
> +	return false;
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
> +				if (ret != -1 || reject_set_fail(reg.id)) {
>  					printf("%s: Failed to reject (ret=%d, errno=%d) ", config_name(c), ret, errno);
>  					print_reg(config_name(c), reg.id);
>  					putchar('\n');
> -- 
> 2.34.1
>

Thanks,
drew

