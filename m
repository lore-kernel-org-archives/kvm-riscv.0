From: Anup Patel <anup@brainfault.org>
Date: Fri, 1 Mar 2024 10:13:33 +0530
Subject: [PATCH v4 12/15] KVM: riscv: selftests: Add SBI PMU extension definitions
In-Reply-To: <20240229010130.1380926-13-atishp@rivosinc.com>
References: <20240229010130.1380926-1-atishp@rivosinc.com> <20240229010130.1380926-13-atishp@rivosinc.com>
Message-ID: <CAAhSdy3U7Ut5yhth0nArsSaBNT2SHdUE8mgAyRdtkzsYqF7cXw@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Feb 29, 2024 at 6:32?AM Atish Patra <atishp@rivosinc.com> wrote:
>
> The SBI PMU extension definition is required for upcoming SBI PMU
> selftests.
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  .../selftests/kvm/include/riscv/processor.h   | 67 +++++++++++++++++++
>  1 file changed, 67 insertions(+)
>
> diff --git a/tools/testing/selftests/kvm/include/riscv/processor.h b/tools/testing/selftests/kvm/include/riscv/processor.h
> index f75c381fa35a..a49a39c8e8d4 100644
> --- a/tools/testing/selftests/kvm/include/riscv/processor.h
> +++ b/tools/testing/selftests/kvm/include/riscv/processor.h
> @@ -169,17 +169,84 @@ void vm_install_exception_handler(struct kvm_vm *vm, int vector, exception_handl
>  enum sbi_ext_id {
>         SBI_EXT_BASE = 0x10,
>         SBI_EXT_STA = 0x535441,
> +       SBI_EXT_PMU = 0x504D55,
>  };
>
>  enum sbi_ext_base_fid {
>         SBI_EXT_BASE_PROBE_EXT = 3,
>  };
>
> +enum sbi_ext_pmu_fid {
> +       SBI_EXT_PMU_NUM_COUNTERS = 0,
> +       SBI_EXT_PMU_COUNTER_GET_INFO,
> +       SBI_EXT_PMU_COUNTER_CFG_MATCH,
> +       SBI_EXT_PMU_COUNTER_START,
> +       SBI_EXT_PMU_COUNTER_STOP,
> +       SBI_EXT_PMU_COUNTER_FW_READ,
> +       SBI_EXT_PMU_COUNTER_FW_READ_HI,
> +       SBI_EXT_PMU_SNAPSHOT_SET_SHMEM,
> +};
> +
> +union sbi_pmu_ctr_info {
> +       unsigned long value;
> +       struct {
> +               unsigned long csr:12;
> +               unsigned long width:6;
> +#if __riscv_xlen == 32
> +               unsigned long reserved:13;
> +#else
> +               unsigned long reserved:45;
> +#endif
> +               unsigned long type:1;
> +       };
> +};
> +
>  struct sbiret {
>         long error;
>         long value;
>  };
>
> +/** General pmu event codes specified in SBI PMU extension */
> +enum sbi_pmu_hw_generic_events_t {
> +       SBI_PMU_HW_NO_EVENT                     = 0,
> +       SBI_PMU_HW_CPU_CYCLES                   = 1,
> +       SBI_PMU_HW_INSTRUCTIONS                 = 2,
> +       SBI_PMU_HW_CACHE_REFERENCES             = 3,
> +       SBI_PMU_HW_CACHE_MISSES                 = 4,
> +       SBI_PMU_HW_BRANCH_INSTRUCTIONS          = 5,
> +       SBI_PMU_HW_BRANCH_MISSES                = 6,
> +       SBI_PMU_HW_BUS_CYCLES                   = 7,
> +       SBI_PMU_HW_STALLED_CYCLES_FRONTEND      = 8,
> +       SBI_PMU_HW_STALLED_CYCLES_BACKEND       = 9,
> +       SBI_PMU_HW_REF_CPU_CYCLES               = 10,
> +
> +       SBI_PMU_HW_GENERAL_MAX,
> +};
> +
> +/* SBI PMU counter types */
> +enum sbi_pmu_ctr_type {
> +       SBI_PMU_CTR_TYPE_HW = 0x0,
> +       SBI_PMU_CTR_TYPE_FW,
> +};
> +
> +/* Flags defined for config matching function */
> +#define SBI_PMU_CFG_FLAG_SKIP_MATCH    (1 << 0)
> +#define SBI_PMU_CFG_FLAG_CLEAR_VALUE   (1 << 1)
> +#define SBI_PMU_CFG_FLAG_AUTO_START    (1 << 2)
> +#define SBI_PMU_CFG_FLAG_SET_VUINH     (1 << 3)
> +#define SBI_PMU_CFG_FLAG_SET_VSINH     (1 << 4)
> +#define SBI_PMU_CFG_FLAG_SET_UINH      (1 << 5)
> +#define SBI_PMU_CFG_FLAG_SET_SINH      (1 << 6)
> +#define SBI_PMU_CFG_FLAG_SET_MINH      (1 << 7)
> +
> +/* Flags defined for counter start function */
> +#define SBI_PMU_START_FLAG_SET_INIT_VALUE (1 << 0)
> +#define SBI_PMU_START_FLAG_INIT_FROM_SNAPSHOT BIT(1)
> +
> +/* Flags defined for counter stop function */
> +#define SBI_PMU_STOP_FLAG_RESET (1 << 0)
> +#define SBI_PMU_STOP_FLAG_TAKE_SNAPSHOT BIT(1)
> +
>  struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
>                         unsigned long arg1, unsigned long arg2,
>                         unsigned long arg3, unsigned long arg4,
> --
> 2.34.1
>

