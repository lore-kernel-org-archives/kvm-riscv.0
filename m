From: Anup Patel <anup@brainfault.org>
Date: Mon, 13 Dec 2021 18:19:35 +0530
Subject: [RFC 2/6] RISC-V: Do not print the SBI version during HSM
 extension boot print
In-Reply-To: <20211204002038.113653-3-atishp@atishpatra.org>
References: <20211204002038.113653-1-atishp@atishpatra.org>
 <20211204002038.113653-3-atishp@atishpatra.org>
Message-ID: <CAAhSdy3ySJN5NCkUpromH1zQQqfaDPQHmEiMGYEUY5snAd-jFQ@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Dec 4, 2021 at 5:50 AM Atish Patra <atishp@atishpatra.org> wrote:
>
> From: Atish Patra <atishp@rivosinc.com>
>
> The HSM extension information log also prints the SBI version v0.2. This
> is misleading as the underlying firmware SBI version may be different
> from v0.2.
>
> Remove the unncessary printing of SBI version.
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/kernel/cpu_ops.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/cpu_ops.c b/arch/riscv/kernel/cpu_ops.c
> index 1985884fe829..3f5a38b03044 100644
> --- a/arch/riscv/kernel/cpu_ops.c
> +++ b/arch/riscv/kernel/cpu_ops.c
> @@ -38,7 +38,7 @@ void __init cpu_set_ops(int cpuid)
>  #if IS_ENABLED(CONFIG_RISCV_SBI)
>         if (sbi_probe_extension(SBI_EXT_HSM) > 0) {
>                 if (!cpuid)
> -                       pr_info("SBI v0.2 HSM extension detected\n");
> +                       pr_info("SBI HSM extension detected\n");
>                 cpu_ops[cpuid] = &cpu_ops_sbi;
>         } else
>  #endif
> --
> 2.33.1
>

