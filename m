From: Anup Patel <anup@brainfault.org>
Date: Mon, 22 Apr 2024 10:56:37 +0530
Subject: [PATCH v8 16/24] RISC-V: KVM: Improve firmware counter read function
In-Reply-To: <20240420151741.962500-17-atishp@rivosinc.com>
References: <20240420151741.962500-1-atishp@rivosinc.com> <20240420151741.962500-17-atishp@rivosinc.com>
Message-ID: <CAAhSdy0OPv3Fg1CWV9vzE_nHo943TNRh6-xxt8WTK6fOFg_ptg@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Apr 20, 2024 at 5:18?AM Atish Patra <atishp@rivosinc.com> wrote:
>
> Rename the function to indicate that it is meant for firmware
> counter read. While at it, add a range sanity check for it as
> well.
>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/include/asm/kvm_vcpu_pmu.h | 2 +-
>  arch/riscv/kvm/vcpu_pmu.c             | 7 ++++++-
>  arch/riscv/kvm/vcpu_sbi_pmu.c         | 2 +-
>  3 files changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/include/asm/kvm_vcpu_pmu.h b/arch/riscv/include/asm/kvm_vcpu_pmu.h
> index 55861b5d3382..fa0f535bbbf0 100644
> --- a/arch/riscv/include/asm/kvm_vcpu_pmu.h
> +++ b/arch/riscv/include/asm/kvm_vcpu_pmu.h
> @@ -89,7 +89,7 @@ int kvm_riscv_vcpu_pmu_ctr_cfg_match(struct kvm_vcpu *vcpu, unsigned long ctr_ba
>                                      unsigned long ctr_mask, unsigned long flags,
>                                      unsigned long eidx, u64 evtdata,
>                                      struct kvm_vcpu_sbi_return *retdata);
> -int kvm_riscv_vcpu_pmu_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
> +int kvm_riscv_vcpu_pmu_fw_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
>                                 struct kvm_vcpu_sbi_return *retdata);
>  int kvm_riscv_vcpu_pmu_fw_ctr_read_hi(struct kvm_vcpu *vcpu, unsigned long cidx,
>                                       struct kvm_vcpu_sbi_return *retdata);
> diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
> index e1409ec9afc0..04db1f993c47 100644
> --- a/arch/riscv/kvm/vcpu_pmu.c
> +++ b/arch/riscv/kvm/vcpu_pmu.c
> @@ -235,6 +235,11 @@ static int pmu_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
>         u64 enabled, running;
>         int fevent_code;
>
> +       if (cidx >= kvm_pmu_num_counters(kvpmu) || cidx == 1) {
> +               pr_warn("Invalid counter id [%ld] during read\n", cidx);
> +               return -EINVAL;
> +       }
> +
>         pmc = &kvpmu->pmc[cidx];
>
>         if (pmc->cinfo.type == SBI_PMU_CTR_TYPE_FW) {
> @@ -747,7 +752,7 @@ int kvm_riscv_vcpu_pmu_fw_ctr_read_hi(struct kvm_vcpu *vcpu, unsigned long cidx,
>         return 0;
>  }
>
> -int kvm_riscv_vcpu_pmu_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
> +int kvm_riscv_vcpu_pmu_fw_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
>                                 struct kvm_vcpu_sbi_return *retdata)
>  {
>         int ret;
> diff --git a/arch/riscv/kvm/vcpu_sbi_pmu.c b/arch/riscv/kvm/vcpu_sbi_pmu.c
> index cf111de51bdb..e4be34e03e83 100644
> --- a/arch/riscv/kvm/vcpu_sbi_pmu.c
> +++ b/arch/riscv/kvm/vcpu_sbi_pmu.c
> @@ -62,7 +62,7 @@ static int kvm_sbi_ext_pmu_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
>                 ret = kvm_riscv_vcpu_pmu_ctr_stop(vcpu, cp->a0, cp->a1, cp->a2, retdata);
>                 break;
>         case SBI_EXT_PMU_COUNTER_FW_READ:
> -               ret = kvm_riscv_vcpu_pmu_ctr_read(vcpu, cp->a0, retdata);
> +               ret = kvm_riscv_vcpu_pmu_fw_ctr_read(vcpu, cp->a0, retdata);
>                 break;
>         case SBI_EXT_PMU_COUNTER_FW_READ_HI:
>                 if (IS_ENABLED(CONFIG_32BIT))
> --
> 2.34.1
>

