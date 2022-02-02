From: Anup Patel <anup@brainfault.org>
Date: Wed, 2 Feb 2022 16:51:30 +0530
Subject: [PATCH] RISC-V: KVM: Fix SBI implementation version
In-Reply-To: <20220131164232.295585-1-apatel@ventanamicro.com>
References: <20220131164232.295585-1-apatel@ventanamicro.com>
Message-ID: <CAAhSdy3ReL2cJXZ+0YMcEeWJg02p86Sr-dNXKXm7GMMaqUZJiA@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jan 31, 2022 at 10:13 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> The SBI implementation version returned by KVM RISC-V should be the
> Host Linux version code.
>
> Fixes: c62a76859723 ("RISC-V: KVM: Add SBI v0.2 base extension")
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>

Thanks, I have queued this for fixes.

Regards,
Anup

> ---
>  arch/riscv/kvm/vcpu_sbi_base.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kvm/vcpu_sbi_base.c b/arch/riscv/kvm/vcpu_sbi_base.c
> index 4ecf377f483b..48f431091cdb 100644
> --- a/arch/riscv/kvm/vcpu_sbi_base.c
> +++ b/arch/riscv/kvm/vcpu_sbi_base.c
> @@ -9,6 +9,7 @@
>  #include <linux/errno.h>
>  #include <linux/err.h>
>  #include <linux/kvm_host.h>
> +#include <linux/version.h>
>  #include <asm/csr.h>
>  #include <asm/sbi.h>
>  #include <asm/kvm_vcpu_timer.h>
> @@ -32,7 +33,7 @@ static int kvm_sbi_ext_base_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
>                 *out_val = KVM_SBI_IMPID;
>                 break;
>         case SBI_EXT_BASE_GET_IMP_VERSION:
> -               *out_val = 0;
> +               *out_val = LINUX_VERSION_CODE;
>                 break;
>         case SBI_EXT_BASE_PROBE_EXT:
>                 if ((cp->a0 >= SBI_EXT_EXPERIMENTAL_START &&
> --
> 2.25.1
>

