From: Anup Patel <anup@brainfault.org>
Date: Fri, 19 May 2023 20:28:19 +0530
Subject: [PATCH 2/3] RISC-V: KVM: Rename dis_idx to ext_idx
In-Reply-To: <20230426171328.69663-3-ajones@ventanamicro.com>
References: <20230426171328.69663-1-ajones@ventanamicro.com> <20230426171328.69663-3-ajones@ventanamicro.com>
Message-ID: <CAAhSdy3eF99koLhah6o+Vtz4L5ddnKeB1HN-1oTpZ-c3-0GLQw@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Apr 26, 2023 at 10:43?PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> Make the name of the extension_disabled[] index more general in
> order to expand its application.
>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/kvm/vcpu_sbi.c | 36 ++++++++++++++++++------------------
>  1 file changed, 18 insertions(+), 18 deletions(-)
>
> diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
> index aa3c126d2e3c..a1a82f0fbad2 100644
> --- a/arch/riscv/kvm/vcpu_sbi.c
> +++ b/arch/riscv/kvm/vcpu_sbi.c
> @@ -31,49 +31,49 @@ static const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_pmu = {
>  #endif
>
>  struct kvm_riscv_sbi_extension_entry {
> -       enum KVM_RISCV_SBI_EXT_ID dis_idx;
> +       enum KVM_RISCV_SBI_EXT_ID ext_idx;
>         const struct kvm_vcpu_sbi_extension *ext_ptr;
>  };
>
>  static const struct kvm_riscv_sbi_extension_entry sbi_ext[] = {
>         {
> -               .dis_idx = KVM_RISCV_SBI_EXT_V01,
> +               .ext_idx = KVM_RISCV_SBI_EXT_V01,
>                 .ext_ptr = &vcpu_sbi_ext_v01,
>         },
>         {
> -               .dis_idx = KVM_RISCV_SBI_EXT_MAX, /* Can't be disabled */
> +               .ext_idx = KVM_RISCV_SBI_EXT_MAX, /* Can't be disabled */
>                 .ext_ptr = &vcpu_sbi_ext_base,
>         },
>         {
> -               .dis_idx = KVM_RISCV_SBI_EXT_TIME,
> +               .ext_idx = KVM_RISCV_SBI_EXT_TIME,
>                 .ext_ptr = &vcpu_sbi_ext_time,
>         },
>         {
> -               .dis_idx = KVM_RISCV_SBI_EXT_IPI,
> +               .ext_idx = KVM_RISCV_SBI_EXT_IPI,
>                 .ext_ptr = &vcpu_sbi_ext_ipi,
>         },
>         {
> -               .dis_idx = KVM_RISCV_SBI_EXT_RFENCE,
> +               .ext_idx = KVM_RISCV_SBI_EXT_RFENCE,
>                 .ext_ptr = &vcpu_sbi_ext_rfence,
>         },
>         {
> -               .dis_idx = KVM_RISCV_SBI_EXT_SRST,
> +               .ext_idx = KVM_RISCV_SBI_EXT_SRST,
>                 .ext_ptr = &vcpu_sbi_ext_srst,
>         },
>         {
> -               .dis_idx = KVM_RISCV_SBI_EXT_HSM,
> +               .ext_idx = KVM_RISCV_SBI_EXT_HSM,
>                 .ext_ptr = &vcpu_sbi_ext_hsm,
>         },
>         {
> -               .dis_idx = KVM_RISCV_SBI_EXT_PMU,
> +               .ext_idx = KVM_RISCV_SBI_EXT_PMU,
>                 .ext_ptr = &vcpu_sbi_ext_pmu,
>         },
>         {
> -               .dis_idx = KVM_RISCV_SBI_EXT_EXPERIMENTAL,
> +               .ext_idx = KVM_RISCV_SBI_EXT_EXPERIMENTAL,
>                 .ext_ptr = &vcpu_sbi_ext_experimental,
>         },
>         {
> -               .dis_idx = KVM_RISCV_SBI_EXT_VENDOR,
> +               .ext_idx = KVM_RISCV_SBI_EXT_VENDOR,
>                 .ext_ptr = &vcpu_sbi_ext_vendor,
>         },
>  };
> @@ -147,7 +147,7 @@ static int riscv_vcpu_set_sbi_ext_single(struct kvm_vcpu *vcpu,
>                 return -EINVAL;
>
>         for (i = 0; i < ARRAY_SIZE(sbi_ext); i++) {
> -               if (sbi_ext[i].dis_idx == reg_num) {
> +               if (sbi_ext[i].ext_idx == reg_num) {
>                         sext = &sbi_ext[i];
>                         break;
>                 }
> @@ -155,7 +155,7 @@ static int riscv_vcpu_set_sbi_ext_single(struct kvm_vcpu *vcpu,
>         if (!sext)
>                 return -ENOENT;
>
> -       scontext->extension_disabled[sext->dis_idx] = !reg_val;
> +       scontext->extension_disabled[sext->ext_idx] = !reg_val;
>
>         return 0;
>  }
> @@ -172,7 +172,7 @@ static int riscv_vcpu_get_sbi_ext_single(struct kvm_vcpu *vcpu,
>                 return -EINVAL;
>
>         for (i = 0; i < ARRAY_SIZE(sbi_ext); i++) {
> -               if (sbi_ext[i].dis_idx == reg_num) {
> +               if (sbi_ext[i].ext_idx == reg_num) {
>                         sext = &sbi_ext[i];
>                         break;
>                 }
> @@ -180,7 +180,7 @@ static int riscv_vcpu_get_sbi_ext_single(struct kvm_vcpu *vcpu,
>         if (!sext)
>                 return -ENOENT;
>
> -       *reg_val = !scontext->extension_disabled[sext->dis_idx];
> +       *reg_val = !scontext->extension_disabled[sext->ext_idx];
>
>         return 0;
>  }
> @@ -317,12 +317,12 @@ const struct kvm_vcpu_sbi_extension *kvm_vcpu_sbi_find_ext(
>                 ext = entry->ext_ptr;
>
>                 if (ext->extid_start <= extid && ext->extid_end >= extid) {
> -                       if (entry->dis_idx >= KVM_RISCV_SBI_EXT_MAX)
> +                       if (entry->ext_idx >= KVM_RISCV_SBI_EXT_MAX)
>                                 return ext;
> -                       if (scontext->extension_disabled[entry->dis_idx])
> +                       if (scontext->extension_disabled[entry->ext_idx])
>                                 return NULL;
>                         if (ext->probe && !ext->probe(vcpu)) {
> -                               scontext->extension_disabled[entry->dis_idx] = true;
> +                               scontext->extension_disabled[entry->ext_idx] = true;
>                                 return NULL;
>                         }
>                         return ext;
> --
> 2.39.2
>

