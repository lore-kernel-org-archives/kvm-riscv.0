From: Anup Patel <anup@brainfault.org>
Date: Mon, 26 Sep 2022 14:56:05 +0530
Subject: [PATCH] RISC-V: KVM: Make ISA ext mappings explicit
In-Reply-To: <20220919133719.230337-1-ajones@ventanamicro.com>
References: <20220919133719.230337-1-ajones@ventanamicro.com>
Message-ID: <CAAhSdy3p69tFiS4V5PSWVws-=s+WihQ=DXfFawyG3L8bfQ3a4Q@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Sep 19, 2022 at 7:07 PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> While adding new extensions at the bottom of the array isn't hard to
> do, it's a pain to review in order to ensure we're not missing any.
> Also, resolving merge conflicts for multiple new ISA extensions can be
> error-prone. To make adding new mappings foolproof, explicitly assign
> the array elements. And, now that the order doesn't matter, we can
> alphabetize the extensions, so we do that too.
>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>

I have queued this patch for Linux-6.1

Thanks,
Anup

> ---
>
> Applies to riscv_kvm_queue
>
>  arch/riscv/kvm/vcpu.c | 25 ++++++++++++++-----------
>  1 file changed, 14 insertions(+), 11 deletions(-)
>
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index 0de0dd22e734..61fe1604e8ea 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -42,19 +42,22 @@ const struct kvm_stats_header kvm_vcpu_stats_header = {
>
>  #define KVM_RISCV_BASE_ISA_MASK                GENMASK(25, 0)
>
> +#define KVM_ISA_EXT_ARR(ext)           [KVM_RISCV_ISA_EXT_##ext] = RISCV_ISA_EXT_##ext
> +
>  /* Mapping between KVM ISA Extension ID & Host ISA extension ID */
>  static const unsigned long kvm_isa_ext_arr[] = {
> -       RISCV_ISA_EXT_a,
> -       RISCV_ISA_EXT_c,
> -       RISCV_ISA_EXT_d,
> -       RISCV_ISA_EXT_f,
> -       RISCV_ISA_EXT_h,
> -       RISCV_ISA_EXT_i,
> -       RISCV_ISA_EXT_m,
> -       RISCV_ISA_EXT_SVPBMT,
> -       RISCV_ISA_EXT_SSTC,
> -       RISCV_ISA_EXT_SVINVAL,
> -       RISCV_ISA_EXT_ZIHINTPAUSE,
> +       [KVM_RISCV_ISA_EXT_A] = RISCV_ISA_EXT_a,
> +       [KVM_RISCV_ISA_EXT_C] = RISCV_ISA_EXT_c,
> +       [KVM_RISCV_ISA_EXT_D] = RISCV_ISA_EXT_d,
> +       [KVM_RISCV_ISA_EXT_F] = RISCV_ISA_EXT_f,
> +       [KVM_RISCV_ISA_EXT_H] = RISCV_ISA_EXT_h,
> +       [KVM_RISCV_ISA_EXT_I] = RISCV_ISA_EXT_i,
> +       [KVM_RISCV_ISA_EXT_M] = RISCV_ISA_EXT_m,
> +
> +       KVM_ISA_EXT_ARR(SSTC),
> +       KVM_ISA_EXT_ARR(SVINVAL),
> +       KVM_ISA_EXT_ARR(SVPBMT),
> +       KVM_ISA_EXT_ARR(ZIHINTPAUSE),
>  };
>
>  static unsigned long kvm_riscv_vcpu_base2isa_ext(unsigned long base_ext)
> --
> 2.37.3
>

