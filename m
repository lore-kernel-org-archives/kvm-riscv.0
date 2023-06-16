From: Anup Patel <anup@brainfault.org>
Date: Fri, 16 Jun 2023 17:49:38 +0530
Subject: [PATCH] riscv: kvm: define vcpu_sbi_ext_pmu in header
In-Reply-To: <20230616115410.166244-1-ben.dooks@codethink.co.uk>
References: <20230616115410.166244-1-ben.dooks@codethink.co.uk>
Message-ID: <CAAhSdy0-WJVBbJJoePLRooRFquiJKRizpEO6ATTnds9iNJou-Q@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jun 16, 2023 at 5:24?PM Ben Dooks <ben.dooks@codethink.co.uk> wrote:
>
> Sparse is giving a warning about vcpu_sbi_ext_pmu not being
> defined, so add a definition to the relevant header to fix
> the following:
>
> arch/riscv/kvm/vcpu_sbi_pmu.c:81:37: warning: symbol 'vcpu_sbi_ext_pmu' was not declared. Should it be static?
>
> Fixes: 3e5e56c60a1477 ("riscv: kvm: move extern sbi_ext declarations to a header")
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Thanks,
Anup

> ---
>  arch/riscv/include/asm/kvm_vcpu_sbi.h | 3 +++
>  arch/riscv/kvm/vcpu_sbi.c             | 4 +---
>  2 files changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> index 4278125a38a5..b94c7e958da7 100644
> --- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
> +++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> @@ -66,4 +66,7 @@ extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_hsm;
>  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_experimental;
>  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_vendor;
>
> +#ifdef CONFIG_RISCV_PMU_SBI
> +extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_pmu;
> +#endif
>  #endif /* __RISCV_KVM_VCPU_SBI_H__ */
> diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
> index e52fde504433..c973d92a0ba5 100644
> --- a/arch/riscv/kvm/vcpu_sbi.c
> +++ b/arch/riscv/kvm/vcpu_sbi.c
> @@ -20,9 +20,7 @@ static const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_v01 = {
>  };
>  #endif
>
> -#ifdef CONFIG_RISCV_PMU_SBI
> -extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_pmu;
> -#else
> +#ifndef CONFIG_RISCV_PMU_SBI
>  static const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_pmu = {
>         .extid_start = -1UL,
>         .extid_end = -1UL,
> --
> 2.39.2
>

