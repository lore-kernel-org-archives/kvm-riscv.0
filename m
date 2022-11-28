From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 28 Nov 2022 13:04:02 -0800
Subject: [PATCH 2/9] RISC-V: KVM: Remove redundant includes of asm/kvm_vcpu_timer.h
In-Reply-To: <20221128161424.608889-3-apatel@ventanamicro.com>
References: <20221128161424.608889-1-apatel@ventanamicro.com> <20221128161424.608889-3-apatel@ventanamicro.com>
Message-ID: <CAOnJCUKPaFeHfgf2xYaE8tSK6wKqMntMHD-KnMr5n=vLxSC9+w@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Nov 28, 2022 at 8:14 AM Anup Patel <apatel@ventanamicro.com> wrote:
>
> The asm/kvm_vcpu_timer.h is redundantly included in vcpu_sbi_base.c
> so let us remove it.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/kvm/vcpu_sbi_base.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/arch/riscv/kvm/vcpu_sbi_base.c b/arch/riscv/kvm/vcpu_sbi_base.c
> index 48f431091cdb..22b9126e2872 100644
> --- a/arch/riscv/kvm/vcpu_sbi_base.c
> +++ b/arch/riscv/kvm/vcpu_sbi_base.c
> @@ -12,7 +12,6 @@
>  #include <linux/version.h>
>  #include <asm/csr.h>
>  #include <asm/sbi.h>
> -#include <asm/kvm_vcpu_timer.h>
>  #include <asm/kvm_vcpu_sbi.h>
>
>  static int kvm_sbi_ext_base_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
> --
> 2.34.1
>

Reviewed-by: Atish Patra <atishp@rivosinc.com>

-- 
Regards,
Atish

