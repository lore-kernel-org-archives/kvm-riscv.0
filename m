From: Anup Patel <anup@brainfault.org>
Date: Thu, 14 Dec 2023 19:16:13 +0530
Subject: [RFC 7/9] RISC-V: KVM: Implement SBI PMU Snapshot feature
In-Reply-To: <20231205024310.1593100-8-atishp@rivosinc.com>
References: <20231205024310.1593100-1-atishp@rivosinc.com> <20231205024310.1593100-8-atishp@rivosinc.com>
Message-ID: <CAAhSdy3cqeHg0HSE2qAZ3n4854xkhgZVjZa9hW0PD2NU9is4uA@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Dec 5, 2023 at 8:13?AM Atish Patra <atishp@rivosinc.com> wrote:
>
> PMU Snapshot function allows to minimize the number of traps when the
> guest access configures/access the hpmcounters. If the snapshot feature
> is enabled, the hypervisor updates the shared memory with counter
> data and state of overflown counters. The guest can just read the
> shared memory instead of trap & emulate done by the hypervisor.
>
> This patch doesn't implement the counter overflow yet.
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/include/asm/kvm_vcpu_pmu.h |  10 ++
>  arch/riscv/kvm/vcpu_pmu.c             | 129 ++++++++++++++++++++++++--
>  arch/riscv/kvm/vcpu_sbi_pmu.c         |   3 +
>  3 files changed, 134 insertions(+), 8 deletions(-)
>
> diff --git a/arch/riscv/include/asm/kvm_vcpu_pmu.h b/arch/riscv/include/asm/kvm_vcpu_pmu.h
> index 395518a1664e..64c75acad6ba 100644
> --- a/arch/riscv/include/asm/kvm_vcpu_pmu.h
> +++ b/arch/riscv/include/asm/kvm_vcpu_pmu.h
> @@ -36,6 +36,7 @@ struct kvm_pmc {
>         bool started;
>         /* Monitoring event ID */
>         unsigned long event_idx;
> +       struct kvm_vcpu *vcpu;

Where is this used ?

>  };
>
>  /* PMU data structure per vcpu */
> @@ -50,6 +51,12 @@ struct kvm_pmu {
>         bool init_done;
>         /* Bit map of all the virtual counter used */
>         DECLARE_BITMAP(pmc_in_use, RISCV_KVM_MAX_COUNTERS);
> +       /* Bit map of all the virtual counter overflown */
> +       DECLARE_BITMAP(pmc_overflown, RISCV_KVM_MAX_COUNTERS);
> +       /* The address of the counter snapshot area (guest physical address) */
> +       unsigned long snapshot_addr;
> +       /* The actual data of the snapshot */
> +       struct riscv_pmu_snapshot_data *sdata;
>  };
>
>  #define vcpu_to_pmu(vcpu) (&(vcpu)->arch.pmu_context)
> @@ -85,6 +92,9 @@ int kvm_riscv_vcpu_pmu_ctr_cfg_match(struct kvm_vcpu *vcpu, unsigned long ctr_ba
>  int kvm_riscv_vcpu_pmu_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
>                                 struct kvm_vcpu_sbi_return *retdata);
>  void kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu);
> +int kvm_riscv_vcpu_pmu_setup_snapshot(struct kvm_vcpu *vcpu, unsigned long saddr_low,
> +                                      unsigned long saddr_high, unsigned long flags,
> +                                      struct kvm_vcpu_sbi_return *retdata);
>  void kvm_riscv_vcpu_pmu_deinit(struct kvm_vcpu *vcpu);
>  void kvm_riscv_vcpu_pmu_reset(struct kvm_vcpu *vcpu);
>
> diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
> index 86391a5061dd..622c4ee89e7b 100644
> --- a/arch/riscv/kvm/vcpu_pmu.c
> +++ b/arch/riscv/kvm/vcpu_pmu.c
> @@ -310,6 +310,79 @@ int kvm_riscv_vcpu_pmu_read_hpm(struct kvm_vcpu *vcpu, unsigned int csr_num,
>         return ret;
>  }
>
> +static void kvm_pmu_clear_snapshot_area(struct kvm_vcpu *vcpu)
> +{
> +       struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
> +       int snapshot_area_size = sizeof(struct riscv_pmu_snapshot_data);
> +
> +       if (kvpmu->sdata) {
> +               memset(kvpmu->sdata, 0, snapshot_area_size);
> +               if (kvpmu->snapshot_addr != INVALID_GPA)
> +                       kvm_vcpu_write_guest(vcpu, kvpmu->snapshot_addr,
> +                                            kvpmu->sdata, snapshot_area_size);

We should free the "kvpmu->sdata" and set it to NULL. This way subsequent
re-enabling of snapshot won't leak the kernel memory.

> +       }
> +       kvpmu->snapshot_addr = INVALID_GPA;
> +}
> +
> +int kvm_riscv_vcpu_pmu_setup_snapshot(struct kvm_vcpu *vcpu, unsigned long saddr_low,
> +                                     unsigned long saddr_high, unsigned long flags,
> +                                     struct kvm_vcpu_sbi_return *retdata)
> +{
> +       struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
> +       int snapshot_area_size = sizeof(struct riscv_pmu_snapshot_data);
> +       int sbiret = 0;
> +       gpa_t saddr;
> +       unsigned long hva;
> +       bool writable;
> +
> +       if (!kvpmu) {
> +               sbiret = SBI_ERR_INVALID_PARAM;
> +               goto out;
> +       }
> +
> +       if (saddr_low == -1 && saddr_high == -1) {
> +               kvm_pmu_clear_snapshot_area(vcpu);
> +               return 0;
> +       }
> +
> +       saddr = saddr_low;
> +
> +       if (saddr_high != 0) {
> +#ifdef CONFIG_32BIT
> +               saddr |= ((gpa_t)saddr << 32);
> +#else
> +               sbiret = SBI_ERR_INVALID_ADDRESS;
> +               goto out;
> +#endif
> +       }
> +
> +       if (kvm_is_error_gpa(vcpu->kvm, saddr)) {
> +               sbiret = SBI_ERR_INVALID_PARAM;
> +               goto out;
> +       }
> +
> +       hva = kvm_vcpu_gfn_to_hva_prot(vcpu, saddr >> PAGE_SHIFT, &writable);
> +       if (kvm_is_error_hva(hva) || !writable) {
> +               sbiret = SBI_ERR_INVALID_ADDRESS;
> +               goto out;
> +       }
> +
> +       kvpmu->snapshot_addr = saddr;
> +       kvpmu->sdata = kzalloc(snapshot_area_size, GFP_ATOMIC);
> +       if (!kvpmu->sdata)
> +               return -ENOMEM;
> +
> +       if (kvm_vcpu_write_guest(vcpu, saddr, kvpmu->sdata, snapshot_area_size)) {
> +               kfree(kvpmu->sdata);
> +               kvpmu->snapshot_addr = INVALID_GPA;
> +               sbiret = SBI_ERR_FAILURE;
> +       }

Newline here.

> +out:
> +       retdata->err_val = sbiret;
> +
> +       return 0;
> +}
> +
>  int kvm_riscv_vcpu_pmu_num_ctrs(struct kvm_vcpu *vcpu,
>                                 struct kvm_vcpu_sbi_return *retdata)
>  {
> @@ -343,8 +416,10 @@ int kvm_riscv_vcpu_pmu_ctr_start(struct kvm_vcpu *vcpu, unsigned long ctr_base,
>         int i, pmc_index, sbiret = 0;
>         struct kvm_pmc *pmc;
>         int fevent_code;
> +       bool bSnapshot = flags & SBI_PMU_START_FLAG_INIT_FROM_SNAPSHOT;
>
> -       if (kvm_pmu_validate_counter_mask(kvpmu, ctr_base, ctr_mask) < 0) {
> +       if ((kvm_pmu_validate_counter_mask(kvpmu, ctr_base, ctr_mask) < 0) ||
> +           (bSnapshot && kvpmu->snapshot_addr == INVALID_GPA)) {

We have a different error code when shared memory is not available.

>                 sbiret = SBI_ERR_INVALID_PARAM;
>                 goto out;
>         }
> @@ -355,8 +430,14 @@ int kvm_riscv_vcpu_pmu_ctr_start(struct kvm_vcpu *vcpu, unsigned long ctr_base,
>                 if (!test_bit(pmc_index, kvpmu->pmc_in_use))
>                         continue;
>                 pmc = &kvpmu->pmc[pmc_index];
> -               if (flags & SBI_PMU_START_FLAG_SET_INIT_VALUE)
> +               if (flags & SBI_PMU_START_FLAG_SET_INIT_VALUE) {
>                         pmc->counter_val = ival;
> +               } else if (bSnapshot) {
> +                       kvm_vcpu_read_guest(vcpu, kvpmu->snapshot_addr, kvpmu->sdata,
> +                                           sizeof(struct riscv_pmu_snapshot_data));
> +                       pmc->counter_val = kvpmu->sdata->ctr_values[pmc_index];
> +               }
> +
>                 if (pmc->cinfo.type == SBI_PMU_CTR_TYPE_FW) {
>                         fevent_code = get_event_code(pmc->event_idx);
>                         if (fevent_code >= SBI_PMU_FW_MAX) {
> @@ -400,8 +481,10 @@ int kvm_riscv_vcpu_pmu_ctr_stop(struct kvm_vcpu *vcpu, unsigned long ctr_base,
>         u64 enabled, running;
>         struct kvm_pmc *pmc;
>         int fevent_code;
> +       bool bSnapshot = flags & SBI_PMU_STOP_FLAG_TAKE_SNAPSHOT;
>
> -       if (kvm_pmu_validate_counter_mask(kvpmu, ctr_base, ctr_mask) < 0) {
> +       if ((kvm_pmu_validate_counter_mask(kvpmu, ctr_base, ctr_mask) < 0) ||
> +           (bSnapshot && (kvpmu->snapshot_addr == INVALID_GPA))) {

Same as above.

>                 sbiret = SBI_ERR_INVALID_PARAM;
>                 goto out;
>         }
> @@ -423,27 +506,52 @@ int kvm_riscv_vcpu_pmu_ctr_stop(struct kvm_vcpu *vcpu, unsigned long ctr_base,
>                                 sbiret = SBI_ERR_ALREADY_STOPPED;
>
>                         kvpmu->fw_event[fevent_code].started = false;
> +                       /* No need to increment the value as it is absolute for firmware events */
> +                       pmc->counter_val = kvpmu->fw_event[fevent_code].value;

This change does not relate to the current patch.

>                 } else if (pmc->perf_event) {
>                         if (pmc->started) {
>                                 /* Stop counting the counter */
>                                 perf_event_disable(pmc->perf_event);
> -                               pmc->started = false;

Same as above.

>                         } else {
>                                 sbiret = SBI_ERR_ALREADY_STOPPED;
>                         }
>
> -                       if (flags & SBI_PMU_STOP_FLAG_RESET) {
> -                               /* Relase the counter if this is a reset request */
> +                       /* Stop counting the counter */
> +                       perf_event_disable(pmc->perf_event);
> +
> +                       /* We only update if stopped is already called. The caller may stop/reset
> +                        * the event in two steps.
> +                        */

Use a double winged style multiline comment block.

> +                       if (pmc->started) {
>                                 pmc->counter_val += perf_event_read_value(pmc->perf_event,
>                                                                           &enabled, &running);
> +                               pmc->started = false;
> +                       }
> +
> +                       if (flags & SBI_PMU_STOP_FLAG_RESET) {

No need for braces here.

> +                               /* Relase the counter if this is a reset request */

s/Relase/Release/

>                                 kvm_pmu_release_perf_event(pmc);
>                         }
>                 } else {
>                         sbiret = SBI_ERR_INVALID_PARAM;
>                 }
> +
> +               if (bSnapshot && !sbiret) {
> +                       //TODO: Add counter overflow support when sscofpmf support is added

Use "/* */"

> +                       kvpmu->sdata->ctr_values[i] = pmc->counter_val;
> +                       kvm_vcpu_write_guest(vcpu, kvpmu->snapshot_addr, kvpmu->sdata,
> +                                            sizeof(struct riscv_pmu_snapshot_data));
> +               }
> +
>                 if (flags & SBI_PMU_STOP_FLAG_RESET) {
>                         pmc->event_idx = SBI_PMU_EVENT_IDX_INVALID;
>                         clear_bit(pmc_index, kvpmu->pmc_in_use);
> +                       if (bSnapshot) {
> +                               /* Clear the snapshot area for the upcoming deletion event */
> +                               kvpmu->sdata->ctr_values[i] = 0;
> +                               kvm_vcpu_write_guest(vcpu, kvpmu->snapshot_addr, kvpmu->sdata,
> +                                                    sizeof(struct riscv_pmu_snapshot_data));
> +                       }
>                 }
>         }
>
> @@ -517,8 +625,10 @@ int kvm_riscv_vcpu_pmu_ctr_cfg_match(struct kvm_vcpu *vcpu, unsigned long ctr_ba
>                         kvpmu->fw_event[event_code].started = true;
>         } else {
>                 ret = kvm_pmu_create_perf_event(pmc, &attr, flags, eidx, evtdata);
> -               if (ret)
> -                       return ret;
> +               if (ret) {
> +                       sbiret = SBI_ERR_NOT_SUPPORTED;
> +                       goto out;
> +               }

This also looks like a change not related to the current patch.

>         }
>
>         set_bit(ctr_idx, kvpmu->pmc_in_use);
> @@ -566,6 +676,7 @@ void kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu)
>         kvpmu->num_hw_ctrs = num_hw_ctrs + 1;
>         kvpmu->num_fw_ctrs = SBI_PMU_FW_MAX;
>         memset(&kvpmu->fw_event, 0, SBI_PMU_FW_MAX * sizeof(struct kvm_fw_event));
> +       kvpmu->snapshot_addr = INVALID_GPA;
>
>         if (kvpmu->num_hw_ctrs > RISCV_KVM_MAX_HW_CTRS) {
>                 pr_warn_once("Limiting the hardware counters to 32 as specified by the ISA");
> @@ -585,6 +696,7 @@ void kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu)
>                 pmc = &kvpmu->pmc[i];
>                 pmc->idx = i;
>                 pmc->event_idx = SBI_PMU_EVENT_IDX_INVALID;
> +               pmc->vcpu = vcpu;
>                 if (i < kvpmu->num_hw_ctrs) {
>                         pmc->cinfo.type = SBI_PMU_CTR_TYPE_HW;
>                         if (i < 3)
> @@ -625,6 +737,7 @@ void kvm_riscv_vcpu_pmu_deinit(struct kvm_vcpu *vcpu)
>         }
>         bitmap_zero(kvpmu->pmc_in_use, RISCV_MAX_COUNTERS);
>         memset(&kvpmu->fw_event, 0, SBI_PMU_FW_MAX * sizeof(struct kvm_fw_event));
> +       kvpmu->snapshot_addr = INVALID_GPA;

You need to also free the sdata pointer.

>  }
>
>  void kvm_riscv_vcpu_pmu_reset(struct kvm_vcpu *vcpu)
> diff --git a/arch/riscv/kvm/vcpu_sbi_pmu.c b/arch/riscv/kvm/vcpu_sbi_pmu.c
> index 7eca72df2cbd..77c20a61fd7d 100644
> --- a/arch/riscv/kvm/vcpu_sbi_pmu.c
> +++ b/arch/riscv/kvm/vcpu_sbi_pmu.c
> @@ -64,6 +64,9 @@ static int kvm_sbi_ext_pmu_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
>         case SBI_EXT_PMU_COUNTER_FW_READ:
>                 ret = kvm_riscv_vcpu_pmu_ctr_read(vcpu, cp->a0, retdata);
>                 break;
> +       case SBI_EXT_PMU_SNAPSHOT_SET_SHMEM:
> +               ret = kvm_riscv_vcpu_pmu_setup_snapshot(vcpu, cp->a0, cp->a1, cp->a2, retdata);
> +               break;
>         default:
>                 retdata->err_val = SBI_ERR_NOT_SUPPORTED;
>         }
> --
> 2.34.1
>

Regards,
Anup

