From: Anup Patel <anup@brainfault.org>
Date: Thu, 2 Feb 2023 09:30:09 +0530
Subject: [PATCH v4 03/14] RISC-V: Improve SBI PMU extension related definitions
In-Reply-To: <20230201231250.3806412-4-atishp@rivosinc.com>
References: <20230201231250.3806412-1-atishp@rivosinc.com> <20230201231250.3806412-4-atishp@rivosinc.com>
Message-ID: <CAAhSdy2KSBq3NgCe00pHbTkxQkezrbGbo6XcZZ2Cgu6L_-osww@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Feb 2, 2023 at 4:42 AM Atish Patra <atishp@rivosinc.com> wrote:
>
> This patch fixes/improve few minor things in SBI PMU extension
> definition.
>
> 1. Align all the firmware event names.
> 2. Add macros for bit positions in cache event ID & ops.
>
> The changes were small enough to combine them together instead
> of creating 1 liner patches.
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/include/asm/sbi.h | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> index 4ca7fba..945b7be 100644
> --- a/arch/riscv/include/asm/sbi.h
> +++ b/arch/riscv/include/asm/sbi.h
> @@ -169,9 +169,9 @@ enum sbi_pmu_fw_generic_events_t {
>         SBI_PMU_FW_ILLEGAL_INSN         = 4,
>         SBI_PMU_FW_SET_TIMER            = 5,
>         SBI_PMU_FW_IPI_SENT             = 6,
> -       SBI_PMU_FW_IPI_RECVD            = 7,
> +       SBI_PMU_FW_IPI_RCVD             = 7,
>         SBI_PMU_FW_FENCE_I_SENT         = 8,
> -       SBI_PMU_FW_FENCE_I_RECVD        = 9,
> +       SBI_PMU_FW_FENCE_I_RCVD         = 9,
>         SBI_PMU_FW_SFENCE_VMA_SENT      = 10,
>         SBI_PMU_FW_SFENCE_VMA_RCVD      = 11,
>         SBI_PMU_FW_SFENCE_VMA_ASID_SENT = 12,
> @@ -215,6 +215,9 @@ enum sbi_pmu_ctr_type {
>  #define SBI_PMU_EVENT_CACHE_OP_ID_CODE_MASK 0x06
>  #define SBI_PMU_EVENT_CACHE_RESULT_ID_CODE_MASK 0x01
>
> +#define SBI_PMU_EVENT_CACHE_ID_SHIFT 3
> +#define SBI_PMU_EVENT_CACHE_OP_SHIFT 1
> +
>  #define SBI_PMU_EVENT_IDX_INVALID 0xFFFFFFFF
>
>  /* Flags defined for config matching function */
> --
> 2.25.1
>

