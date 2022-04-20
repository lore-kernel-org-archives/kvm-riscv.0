From: Atish Patra <atishp@atishpatra.org>
Date: Wed, 20 Apr 2022 00:42:50 -0700
Subject: [PATCH 2/2] RISC-V: KVM: Restrict the extensions that can be
 disabled
In-Reply-To: <20220420013258.3639264-3-atishp@rivosinc.com>
References: <20220420013258.3639264-1-atishp@rivosinc.com>
 <20220420013258.3639264-3-atishp@rivosinc.com>
Message-ID: <CAOnJCU+EPHxD7MqbswKMy=gZhmyyXMiezqaw1+D1h+O+pbYR2w@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Apr 19, 2022 at 6:33 PM Atish Patra <atishp@rivosinc.com> wrote:
>
> Currently, the config reg register allows to disable all allowed
> single letter ISA extensions. It shouldn't be the case as vmm
> shouldn't be able disable base extensions (imac).

/s/able/able to/

> These extensions should always be enabled as long as they are enabled
> in the host ISA.
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/kvm/vcpu.c | 21 +++++++++++++--------
>  1 file changed, 13 insertions(+), 8 deletions(-)
>
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index 2e25a7b83a1b..14dd801651e5 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -38,12 +38,16 @@ const struct kvm_stats_header kvm_vcpu_stats_header = {
>                        sizeof(kvm_vcpu_stats_desc),
>  };
>
> -#define KVM_RISCV_ISA_ALLOWED  (riscv_isa_extension_mask(a) | \
> -                                riscv_isa_extension_mask(c) | \
> -                                riscv_isa_extension_mask(d) | \
> -                                riscv_isa_extension_mask(f) | \
> -                                riscv_isa_extension_mask(i) | \
> -                                riscv_isa_extension_mask(m))
> +#define KVM_RISCV_ISA_DISABLE_ALLOWED  (riscv_isa_extension_mask(d) | \
> +                                       riscv_isa_extension_mask(f))
> +
> +#define KVM_RISCV_ISA_DISABLE_NOT_ALLOWED      (riscv_isa_extension_mask(a) | \
> +                                               riscv_isa_extension_mask(c) | \
> +                                               riscv_isa_extension_mask(i) | \
> +                                               riscv_isa_extension_mask(m))
> +
> +#define KVM_RISCV_ISA_ALLOWED (KVM_RISCV_ISA_DISABLE_ALLOWED | \
> +                              KVM_RISCV_ISA_DISABLE_NOT_ALLOWED)
>
>  static void kvm_riscv_reset_vcpu(struct kvm_vcpu *vcpu)
>  {
> @@ -217,9 +221,10 @@ static int kvm_riscv_vcpu_set_reg_config(struct kvm_vcpu *vcpu,
>         switch (reg_num) {
>         case KVM_REG_RISCV_CONFIG_REG(isa):
>                 if (!vcpu->arch.ran_atleast_once) {
> -                       vcpu->arch.isa = reg_val;
> +                       /* Ignore the disable request for these extensions */
> +                       vcpu->arch.isa = reg_val | KVM_RISCV_ISA_DISABLE_NOT_ALLOWED;
>                         vcpu->arch.isa &= riscv_isa_extension_base(NULL);
> -                       vcpu->arch.isa &= KVM_RISCV_ISA_ALLOWED;
> +                       vcpu->arch.isa &= KVM_RISCV_ISA_DISABLE_ALLOWED;
>                         kvm_riscv_vcpu_fp_reset(vcpu);
>                 } else {
>                         return -EOPNOTSUPP;
> --
> 2.25.1
>

Sorry. I forgot to add the fixes tag.

Fixes: 92ad82002c39 (RISC-V: KVM: Implement
KVM_GET_ONE_REG/KVM_SET_ONE_REG ioctls)

-- 
Regards,
Atish

