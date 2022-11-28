From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 28 Nov 2022 13:04:20 -0800
Subject: [PATCH 3/9] RISC-V: KVM: Remove redundant includes of asm/csr.h
In-Reply-To: <20221128161424.608889-4-apatel@ventanamicro.com>
References: <20221128161424.608889-1-apatel@ventanamicro.com> <20221128161424.608889-4-apatel@ventanamicro.com>
Message-ID: <CAOnJCUJT_WcBk3bkB7BnA+xPSGoLH0W19ZAwUD2NhnfyApsL5g@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Nov 28, 2022 at 8:14 AM Anup Patel <apatel@ventanamicro.com> wrote:
>
> We should include asm/csr.h only where required so let us remove
> redundant includes of this header.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/asm/kvm_host.h | 1 -
>  arch/riscv/kvm/vcpu_sbi_base.c    | 1 -
>  arch/riscv/kvm/vcpu_sbi_hsm.c     | 1 -
>  arch/riscv/kvm/vcpu_sbi_replace.c | 1 -
>  arch/riscv/kvm/vcpu_sbi_v01.c     | 1 -
>  5 files changed, 5 deletions(-)
>
> diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
> index dbbf43d52623..6502f9099965 100644
> --- a/arch/riscv/include/asm/kvm_host.h
> +++ b/arch/riscv/include/asm/kvm_host.h
> @@ -13,7 +13,6 @@
>  #include <linux/kvm.h>
>  #include <linux/kvm_types.h>
>  #include <linux/spinlock.h>
> -#include <asm/csr.h>
>  #include <asm/hwcap.h>
>  #include <asm/kvm_vcpu_fp.h>
>  #include <asm/kvm_vcpu_insn.h>
> diff --git a/arch/riscv/kvm/vcpu_sbi_base.c b/arch/riscv/kvm/vcpu_sbi_base.c
> index 22b9126e2872..0c806f61c629 100644
> --- a/arch/riscv/kvm/vcpu_sbi_base.c
> +++ b/arch/riscv/kvm/vcpu_sbi_base.c
> @@ -10,7 +10,6 @@
>  #include <linux/err.h>
>  #include <linux/kvm_host.h>
>  #include <linux/version.h>
> -#include <asm/csr.h>
>  #include <asm/sbi.h>
>  #include <asm/kvm_vcpu_sbi.h>
>
> diff --git a/arch/riscv/kvm/vcpu_sbi_hsm.c b/arch/riscv/kvm/vcpu_sbi_hsm.c
> index 239dec0a628a..2e915cafd551 100644
> --- a/arch/riscv/kvm/vcpu_sbi_hsm.c
> +++ b/arch/riscv/kvm/vcpu_sbi_hsm.c
> @@ -9,7 +9,6 @@
>  #include <linux/errno.h>
>  #include <linux/err.h>
>  #include <linux/kvm_host.h>
> -#include <asm/csr.h>
>  #include <asm/sbi.h>
>  #include <asm/kvm_vcpu_sbi.h>
>
> diff --git a/arch/riscv/kvm/vcpu_sbi_replace.c b/arch/riscv/kvm/vcpu_sbi_replace.c
> index 4c034d8a606a..03a0198389f0 100644
> --- a/arch/riscv/kvm/vcpu_sbi_replace.c
> +++ b/arch/riscv/kvm/vcpu_sbi_replace.c
> @@ -9,7 +9,6 @@
>  #include <linux/errno.h>
>  #include <linux/err.h>
>  #include <linux/kvm_host.h>
> -#include <asm/csr.h>
>  #include <asm/sbi.h>
>  #include <asm/kvm_vcpu_timer.h>
>  #include <asm/kvm_vcpu_sbi.h>
> diff --git a/arch/riscv/kvm/vcpu_sbi_v01.c b/arch/riscv/kvm/vcpu_sbi_v01.c
> index 8a91a14e7139..489f225ee66d 100644
> --- a/arch/riscv/kvm/vcpu_sbi_v01.c
> +++ b/arch/riscv/kvm/vcpu_sbi_v01.c
> @@ -9,7 +9,6 @@
>  #include <linux/errno.h>
>  #include <linux/err.h>
>  #include <linux/kvm_host.h>
> -#include <asm/csr.h>
>  #include <asm/sbi.h>
>  #include <asm/kvm_vcpu_timer.h>
>  #include <asm/kvm_vcpu_sbi.h>
> --
> 2.34.1
>

Reviewed-by: Atish Patra <atishp@rivosinc.com>

-- 
Regards,
Atish

