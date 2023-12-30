From: Anup Patel <anup@brainfault.org>
Date: Sat, 30 Dec 2023 13:40:20 +0530
Subject: [v2 10/10] RISC-V: KVM: Support 64 bit firmware counters on RV32
In-Reply-To: <20231229214950.4061381-11-atishp@rivosinc.com>
References: <20231229214950.4061381-1-atishp@rivosinc.com> <20231229214950.4061381-11-atishp@rivosinc.com>
Message-ID: <CAAhSdy03BLQRdTZAqteK9PsbjxQt7cncXu_fG1CG99uQK5v6CA@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Dec 30, 2023 at 3:20?AM Atish Patra <atishp@rivosinc.com> wrote:
>
> The SBI v2.0 introduced a fw_read_hi function to read 64 bit firmware
> counters for RV32 based systems.
>
> Add infrastructure to support that.
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/include/asm/kvm_vcpu_pmu.h |  4 ++-
>  arch/riscv/kvm/vcpu_pmu.c             | 37 ++++++++++++++++++++++++++-
>  arch/riscv/kvm/vcpu_sbi_pmu.c         |  6 +++++
>  3 files changed, 45 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/include/asm/kvm_vcpu_pmu.h b/arch/riscv/include/asm/kvm_vcpu_pmu.h
> index af6d0ff5ce41..463c349a9ea5 100644
> --- a/arch/riscv/include/asm/kvm_vcpu_pmu.h
> +++ b/arch/riscv/include/asm/kvm_vcpu_pmu.h
> @@ -20,7 +20,7 @@ static_assert(RISCV_KVM_MAX_COUNTERS <= 64);
>
>  struct kvm_fw_event {
>         /* Current value of the event */
> -       unsigned long value;
> +       u64 value;
>
>         /* Event monitoring status */
>         bool started;
> @@ -91,6 +91,8 @@ int kvm_riscv_vcpu_pmu_ctr_cfg_match(struct kvm_vcpu *vcpu, unsigned long ctr_ba
>                                      struct kvm_vcpu_sbi_return *retdata);
>  int kvm_riscv_vcpu_pmu_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
>                                 struct kvm_vcpu_sbi_return *retdata);
> +int kvm_riscv_vcpu_pmu_fw_ctr_read_hi(struct kvm_vcpu *vcpu, unsigned long cidx,
> +                                     struct kvm_vcpu_sbi_return *retdata);
>  void kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu);
>  int kvm_riscv_vcpu_pmu_setup_snapshot(struct kvm_vcpu *vcpu, unsigned long saddr_low,
>                                       unsigned long saddr_high, unsigned long flags,
> diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
> index f2bf5b5bdd61..e6ce37819ca2 100644
> --- a/arch/riscv/kvm/vcpu_pmu.c
> +++ b/arch/riscv/kvm/vcpu_pmu.c
> @@ -196,6 +196,29 @@ static int pmu_get_pmc_index(struct kvm_pmu *pmu, unsigned long eidx,
>         return kvm_pmu_get_programmable_pmc_index(pmu, eidx, cbase, cmask);
>  }
>
> +static int pmu_fw_ctr_read_hi(struct kvm_vcpu *vcpu, unsigned long cidx,
> +                             unsigned long *out_val)
> +{
> +       struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
> +       struct kvm_pmc *pmc;
> +       int fevent_code;
> +
> +       if (!IS_ENABLED(CONFIG_32BIT))
> +               return -EINVAL;
> +
> +       pmc = &kvpmu->pmc[cidx];
> +
> +       if (pmc->cinfo.type != SBI_PMU_CTR_TYPE_FW)
> +               return -EINVAL;
> +
> +       fevent_code = get_event_code(pmc->event_idx);
> +       pmc->counter_val = kvpmu->fw_event[fevent_code].value;
> +
> +       *out_val = pmc->counter_val >> 32;
> +
> +       return 0;
> +}
> +
>  static int pmu_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
>                         unsigned long *out_val)
>  {
> @@ -701,6 +724,18 @@ int kvm_riscv_vcpu_pmu_ctr_cfg_match(struct kvm_vcpu *vcpu, unsigned long ctr_ba
>         return 0;
>  }
>
> +int kvm_riscv_vcpu_pmu_fw_ctr_read_hi(struct kvm_vcpu *vcpu, unsigned long cidx,
> +                                     struct kvm_vcpu_sbi_return *retdata)
> +{
> +       int ret;
> +
> +       ret = pmu_fw_ctr_read_hi(vcpu, cidx, &retdata->out_val);
> +       if (ret == -EINVAL)
> +               retdata->err_val = SBI_ERR_INVALID_PARAM;
> +
> +       return 0;
> +}
> +
>  int kvm_riscv_vcpu_pmu_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
>                                 struct kvm_vcpu_sbi_return *retdata)
>  {
> @@ -774,7 +809,7 @@ void kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu)
>                         pmc->cinfo.csr = CSR_CYCLE + i;
>                 } else {
>                         pmc->cinfo.type = SBI_PMU_CTR_TYPE_FW;
> -                       pmc->cinfo.width = BITS_PER_LONG - 1;
> +                       pmc->cinfo.width = 63;
>                 }
>         }
>
> diff --git a/arch/riscv/kvm/vcpu_sbi_pmu.c b/arch/riscv/kvm/vcpu_sbi_pmu.c
> index 9f61136e4bb1..58a0e5587e2a 100644
> --- a/arch/riscv/kvm/vcpu_sbi_pmu.c
> +++ b/arch/riscv/kvm/vcpu_sbi_pmu.c
> @@ -64,6 +64,12 @@ static int kvm_sbi_ext_pmu_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
>         case SBI_EXT_PMU_COUNTER_FW_READ:
>                 ret = kvm_riscv_vcpu_pmu_ctr_read(vcpu, cp->a0, retdata);
>                 break;
> +       case SBI_EXT_PMU_COUNTER_FW_READ_HI:
> +               if (IS_ENABLED(CONFIG_32BIT))
> +                       ret = kvm_riscv_vcpu_pmu_fw_ctr_read_hi(vcpu, cp->a0, retdata);
> +               else
> +                       retdata->out_val = 0;
> +               break;
>         case SBI_EXT_PMU_SNAPSHOT_SET_SHMEM:
>                 ret = kvm_riscv_vcpu_pmu_setup_snapshot(vcpu, cp->a0, cp->a1, cp->a2, retdata);
>                 break;
> --
> 2.34.1
>

