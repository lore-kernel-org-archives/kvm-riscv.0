From: Anup Patel <anup@brainfault.org>
Date: Thu, 14 Dec 2023 17:43:09 +0530
Subject: [RFC 1/9] RISC-V: Fix the typo in Scountovf CSR name
In-Reply-To: <20231205024310.1593100-2-atishp@rivosinc.com>
References: <20231205024310.1593100-1-atishp@rivosinc.com> <20231205024310.1593100-2-atishp@rivosinc.com>
Message-ID: <CAAhSdy0j=BKfoNFr2+P+z0YK29LkudpHQ5XQUZhY_F1mfWQAug@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Dec 5, 2023 at 8:13?AM Atish Patra <atishp@rivosinc.com> wrote:
>
> The counter overflow CSR name is "scountovf" not "sscountovf".
>
> Fix the csr name.
>
> Fixes: 4905ec2fb7e6 ("RISC-V: Add sscofpmf extension support")
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/include/asm/csr.h         | 2 +-
>  arch/riscv/include/asm/errata_list.h | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> index 306a19a5509c..88cdc8a3e654 100644
> --- a/arch/riscv/include/asm/csr.h
> +++ b/arch/riscv/include/asm/csr.h
> @@ -281,7 +281,7 @@
>  #define CSR_HPMCOUNTER30H      0xc9e
>  #define CSR_HPMCOUNTER31H      0xc9f
>
> -#define CSR_SSCOUNTOVF         0xda0
> +#define CSR_SCOUNTOVF          0xda0
>
>  #define CSR_SSTATUS            0x100
>  #define CSR_SIE                        0x104
> diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
> index 83ed25e43553..7026fba12eeb 100644
> --- a/arch/riscv/include/asm/errata_list.h
> +++ b/arch/riscv/include/asm/errata_list.h
> @@ -152,7 +152,7 @@ asm volatile(ALTERNATIVE_2(                                         \
>
>  #define ALT_SBI_PMU_OVERFLOW(__ovl)                                    \
>  asm volatile(ALTERNATIVE(                                              \
> -       "csrr %0, " __stringify(CSR_SSCOUNTOVF),                        \
> +       "csrr %0, " __stringify(CSR_SCOUNTOVF),                         \
>         "csrr %0, " __stringify(THEAD_C9XX_CSR_SCOUNTEROF),             \
>                 THEAD_VENDOR_ID, ERRATA_THEAD_PMU,                      \
>                 CONFIG_ERRATA_THEAD_PMU)                                \
> --
> 2.34.1
>

