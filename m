From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 5 Dec 2023 20:22:10 +0530
Subject: [PATCH v2 3/3] RISC-V: KVM: add vector CSRs in KVM_GET_REG_LIST
In-Reply-To: <20231205135041.2208004-4-dbarboza@ventanamicro.com>
References: <20231205135041.2208004-1-dbarboza@ventanamicro.com> <20231205135041.2208004-4-dbarboza@ventanamicro.com>
Message-ID: <CAK9=C2WaY--O303KfWK0ty8Pe_SipVqAbvARc4hODC=CAhCTnw@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Dec 5, 2023 at 7:21?PM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Add all vector CSRs (vstart, vl, vtype, vcsr, vlenb) in get-reg-list.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  arch/riscv/kvm/vcpu_onereg.c | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>
> diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
> index f8c9fa0c03c5..712785a8f22b 100644
> --- a/arch/riscv/kvm/vcpu_onereg.c
> +++ b/arch/riscv/kvm/vcpu_onereg.c
> @@ -986,6 +986,35 @@ static int copy_sbi_ext_reg_indices(u64 __user *uindices)
>         return num_sbi_ext_regs();
>  }
>
> +static inline unsigned long num_vector_regs(const struct kvm_vcpu *vcpu)
> +{
> +       if (!riscv_isa_extension_available(vcpu->arch.isa, v))
> +               return 0;
> +
> +       /* vstart, vl, vtype, vcsr, vlenb; */
> +       return 5;

We have two type of vector ONE_REG IDs:
KVM_REG_RISCV_VECTOR_CSR_REG()
KVM_REG_RISCV_VECTOR_REG()

You are only returning count of KVM_REG_RISCV_VECTOR_CSR_REG()
but not including KVM_REG_RISCV_VECTOR_REG()

Refer, kvm_riscv_vcpu_vreg_addr() implementation in
arch/riscv/kvm/vcpu_vector.c


> +}
> +
> +static int copy_vector_reg_indices(const struct kvm_vcpu *vcpu,
> +                               u64 __user *uindices)
> +{
> +       int n = num_vector_regs(vcpu);
> +       u64 reg, size;
> +
> +       for (int i = 0; i < n; i++) {
> +               size = IS_ENABLED(CONFIG_32BIT) ? KVM_REG_SIZE_U32 : KVM_REG_SIZE_U64;
> +               reg = KVM_REG_RISCV | size | KVM_REG_RISCV_VECTOR | i;
> +
> +               if (uindices) {
> +                       if (put_user(reg, uindices))
> +                               return -EFAULT;
> +                       uindices++;
> +               }

Same as above.

> +       }
> +
> +       return n;
> +}
> +
>  /*
>   * kvm_riscv_vcpu_num_regs - how many registers do we present via KVM_GET/SET_ONE_REG
>   *
> @@ -1001,6 +1030,7 @@ unsigned long kvm_riscv_vcpu_num_regs(struct kvm_vcpu *vcpu)
>         res += num_timer_regs();
>         res += num_fp_f_regs(vcpu);
>         res += num_fp_d_regs(vcpu);
> +       res += num_vector_regs(vcpu);
>         res += num_isa_ext_regs(vcpu);
>         res += num_sbi_ext_regs();
>
> @@ -1045,6 +1075,11 @@ int kvm_riscv_vcpu_copy_reg_indices(struct kvm_vcpu *vcpu,
>                 return ret;
>         uindices += ret;
>
> +       ret = copy_vector_reg_indices(vcpu, uindices);
> +       if (ret < 0)
> +               return ret;
> +       uindices += ret;
> +
>         ret = copy_isa_ext_reg_indices(vcpu, uindices);
>         if (ret < 0)
>                 return ret;
> --
> 2.41.0
>
>

Regards,
Anup

