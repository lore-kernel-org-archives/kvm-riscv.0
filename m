From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 19 Sep 2023 11:59:42 -0700
Subject: [PATCH 2/4] RISC-V: KVM: Fix riscv_vcpu_get_isa_ext_single() for
 missing extensions
In-Reply-To: <20230918180646.1398384-3-apatel@ventanamicro.com>
References: <20230918180646.1398384-1-apatel@ventanamicro.com> <20230918180646.1398384-3-apatel@ventanamicro.com>
Message-ID: <CAOnJCUJ-25tCN61K2Uvu__xgKWDZrxpzwCrWW_uGCBROm9pAzw@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Sep 18, 2023 at 11:07?AM Anup Patel <apatel@ventanamicro.com> wrote:
>
> The riscv_vcpu_get_isa_ext_single() should fail with -ENOENT error
> when corresponding ISA extension is not available on the host.
>
> Fixes: e98b1085be79 ("RISC-V: KVM: Factor-out ONE_REG related code to its own source file")
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/kvm/vcpu_onereg.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
> index e7e833ced91b..b7e0e03c69b1 100644
> --- a/arch/riscv/kvm/vcpu_onereg.c
> +++ b/arch/riscv/kvm/vcpu_onereg.c
> @@ -460,8 +460,11 @@ static int riscv_vcpu_get_isa_ext_single(struct kvm_vcpu *vcpu,
>             reg_num >= ARRAY_SIZE(kvm_isa_ext_arr))
>                 return -ENOENT;
>
> -       *reg_val = 0;
>         host_isa_ext = kvm_isa_ext_arr[reg_num];
> +       if (!__riscv_isa_extension_available(NULL, host_isa_ext))
> +               return -ENOENT;
> +
> +       *reg_val = 0;
>         if (__riscv_isa_extension_available(vcpu->arch.isa, host_isa_ext))
>                 *reg_val = 1; /* Mark the given extension as available */
>
> --
> 2.34.1
>

Reviewed-by: Atish Patra <atishp@rivosinc.com>

-- 
Regards,
Atish

