From: Anup Patel <anup@brainfault.org>
Date: Thu, 14 Dec 2023 17:46:17 +0530
Subject: [RFC 3/9] RISC-V: Add FIRMWARE_READ_HI definition
In-Reply-To: <20231205024310.1593100-4-atishp@rivosinc.com>
References: <20231205024310.1593100-1-atishp@rivosinc.com> <20231205024310.1593100-4-atishp@rivosinc.com>
Message-ID: <CAAhSdy0_DdCeFdzzJgoWhnrMz1-UqQXKLWNBAAXB6SQ_eJ2gyg@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Dec 5, 2023 at 8:13?AM Atish Patra <atishp@rivosinc.com> wrote:
>
> SBI v2.0 added another function to SBI PMU extension to read
> the upper bits of a counter with width larger than XLEN.
>
> Add the definition for that function.
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/include/asm/sbi.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> index 0892f4421bc4..f3eeca79a02d 100644
> --- a/arch/riscv/include/asm/sbi.h
> +++ b/arch/riscv/include/asm/sbi.h
> @@ -121,6 +121,7 @@ enum sbi_ext_pmu_fid {
>         SBI_EXT_PMU_COUNTER_START,
>         SBI_EXT_PMU_COUNTER_STOP,
>         SBI_EXT_PMU_COUNTER_FW_READ,
> +       SBI_EXT_PMU_COUNTER_FW_READ_HI,
>  };
>
>  union sbi_pmu_ctr_info {
> --
> 2.34.1
>

