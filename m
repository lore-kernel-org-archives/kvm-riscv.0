From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 9 Aug 2024 18:59:23 +0530
Subject: [PATCH] RISC-V: KVM: Fix sbiret init before forwarding to userspace
In-Reply-To: <20240807154943.150540-2-ajones@ventanamicro.com>
References: <20240807154943.150540-2-ajones@ventanamicro.com>
Message-ID: <CAK9=C2Wxk8gDq-2jct47OOO4eK634nDUUGE8NdDrd88_s8_W4g@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Aug 7, 2024 at 9:19?PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> When forwarding SBI calls to userspace ensure sbiret.error is
> initialized to SBI_ERR_NOT_SUPPORTED first, in case userspace
> neglects to set it to anything. If userspace neglects it then we
> can't be sure it did anything else either, so we just report it
> didn't do or try anything. Just init sbiret.value to zero, which is
> the preferred value to return when nothing special is specified.
>
> KVM was already initializing both sbiret.error and sbiret.value, but
> the values used appear to come from a copy+paste of the __sbi_ecall()
> implementation, i.e. a0 and a1, which don't apply prior to the call
> being executed, nor at all when forwarding to userspace.
>
> Fixes: dea8ee31a039 ("RISC-V: KVM: Add SBI v0.1 support")
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>

Queued this patch for Linux-6.11 fixes.

Thanks,
Anup

> ---
>  arch/riscv/kvm/vcpu_sbi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
> index 62f409d4176e..7de128be8db9 100644
> --- a/arch/riscv/kvm/vcpu_sbi.c
> +++ b/arch/riscv/kvm/vcpu_sbi.c
> @@ -127,8 +127,8 @@ void kvm_riscv_vcpu_sbi_forward(struct kvm_vcpu *vcpu, struct kvm_run *run)
>         run->riscv_sbi.args[3] = cp->a3;
>         run->riscv_sbi.args[4] = cp->a4;
>         run->riscv_sbi.args[5] = cp->a5;
> -       run->riscv_sbi.ret[0] = cp->a0;
> -       run->riscv_sbi.ret[1] = cp->a1;
> +       run->riscv_sbi.ret[0] = SBI_ERR_NOT_SUPPORTED;
> +       run->riscv_sbi.ret[1] = 0;
>  }
>
>  void kvm_riscv_vcpu_sbi_system_reset(struct kvm_vcpu *vcpu,
> --
> 2.45.2
>
>

