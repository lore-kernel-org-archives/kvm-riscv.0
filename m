From: Anup Patel <anup@brainfault.org>
Date: Tue, 10 May 2022 20:29:31 +0530
Subject: [PATCH v3] RISC-V: KVM: Introduce ISA extension register
In-Reply-To: <20220509182937.1881849-1-atishp@rivosinc.com>
References: <20220509182937.1881849-1-atishp@rivosinc.com>
Message-ID: <CAAhSdy2V20HEftXz04mOv40HV3pcyn+mAgwM7HRuDfQ+a7FGHA@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, May 9, 2022 at 11:59 PM Atish Patra <atishp@rivosinc.com> wrote:
>
> Currently, there is no provision for vmm (qemu-kvm or kvmtool) to
> query about multiple-letter ISA extensions. The config register
> is only used for base single letter ISA extensions.
>
> A new ISA extension register is added that will allow the vmm
> to query about any ISA extension one at a time. It is enabled for
> both single letter or multi-letter ISA extensions. The ISA extension
> register is useful to if the vmm requires to retrieve/set single
> extension while the config register should be used if all the base
> ISA extension required to retrieve or set.
>
> For any multi-letter ISA extensions, the new register interface
> must be used.
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

Looks good to me.

Queued this patch for 5.19

Thanks,
Anup

> ---
> Changes from v2->v3:
> 1. Fixed the comment style.
> 2. Fixed the kvm_riscv_vcpu_get_reg_isa_ext function.
> ---
>  arch/riscv/include/uapi/asm/kvm.h | 20 +++++++
>  arch/riscv/kvm/vcpu.c             | 99 +++++++++++++++++++++++++++++++
>  2 files changed, 119 insertions(+)
>
> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> index f808ad1ce500..92bd469e2ba6 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -82,6 +82,23 @@ struct kvm_riscv_timer {
>         __u64 state;
>  };
>
> +/**
> + * ISA extension IDs specific to KVM. This is not the same as the host ISA
> + * extension IDs as that is internal to the host and should not be exposed
> + * to the guest. This should always be contiguous to keep the mapping simple
> + * in KVM implementation.
> + */
> +enum KVM_RISCV_ISA_EXT_ID {
> +       KVM_RISCV_ISA_EXT_A = 0,
> +       KVM_RISCV_ISA_EXT_C,
> +       KVM_RISCV_ISA_EXT_D,
> +       KVM_RISCV_ISA_EXT_F,
> +       KVM_RISCV_ISA_EXT_H,
> +       KVM_RISCV_ISA_EXT_I,
> +       KVM_RISCV_ISA_EXT_M,
> +       KVM_RISCV_ISA_EXT_MAX,
> +};
> +
>  /* Possible states for kvm_riscv_timer */
>  #define KVM_RISCV_TIMER_STATE_OFF      0
>  #define KVM_RISCV_TIMER_STATE_ON       1
> @@ -123,6 +140,9 @@ struct kvm_riscv_timer {
>  #define KVM_REG_RISCV_FP_D_REG(name)   \
>                 (offsetof(struct __riscv_d_ext_state, name) / sizeof(__u64))
>
> +/* ISA Extension registers are mapped as type 7 */
> +#define KVM_REG_RISCV_ISA_EXT          (0x07 << KVM_REG_RISCV_TYPE_SHIFT)
> +
>  #endif
>
>  #endif /* __LINUX_KVM_RISCV_H */
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index 7461f964d20a..0875beaa1973 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -365,6 +365,101 @@ static int kvm_riscv_vcpu_set_reg_csr(struct kvm_vcpu *vcpu,
>         return 0;
>  }
>
> +/* Mapping between KVM ISA Extension ID & Host ISA extension ID */
> +static unsigned long kvm_isa_ext_arr[] = {
> +       RISCV_ISA_EXT_a,
> +       RISCV_ISA_EXT_c,
> +       RISCV_ISA_EXT_d,
> +       RISCV_ISA_EXT_f,
> +       RISCV_ISA_EXT_h,
> +       RISCV_ISA_EXT_i,
> +       RISCV_ISA_EXT_m,
> +};
> +
> +static int kvm_riscv_vcpu_get_reg_isa_ext(struct kvm_vcpu *vcpu,
> +                                         const struct kvm_one_reg *reg)
> +{
> +       unsigned long __user *uaddr =
> +                       (unsigned long __user *)(unsigned long)reg->addr;
> +       unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
> +                                           KVM_REG_SIZE_MASK |
> +                                           KVM_REG_RISCV_ISA_EXT);
> +       unsigned long reg_val = 0;
> +       unsigned long host_isa_ext;
> +
> +       if (KVM_REG_SIZE(reg->id) != sizeof(unsigned long))
> +               return -EINVAL;
> +
> +       if (reg_num >= KVM_RISCV_ISA_EXT_MAX || reg_num >= ARRAY_SIZE(kvm_isa_ext_arr))
> +               return -EINVAL;
> +
> +       host_isa_ext = kvm_isa_ext_arr[reg_num];
> +       if (__riscv_isa_extension_available(&vcpu->arch.isa, host_isa_ext))
> +               reg_val = 1; /* Mark the given extension as available */
> +
> +       if (copy_to_user(uaddr, &reg_val, KVM_REG_SIZE(reg->id)))
> +               return -EFAULT;
> +
> +       return 0;
> +}
> +
> +static int kvm_riscv_vcpu_set_reg_isa_ext(struct kvm_vcpu *vcpu,
> +                                         const struct kvm_one_reg *reg)
> +{
> +       unsigned long __user *uaddr =
> +                       (unsigned long __user *)(unsigned long)reg->addr;
> +       unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
> +                                           KVM_REG_SIZE_MASK |
> +                                           KVM_REG_RISCV_ISA_EXT);
> +       unsigned long reg_val;
> +       unsigned long host_isa_ext;
> +       unsigned long host_isa_ext_mask;
> +
> +       if (KVM_REG_SIZE(reg->id) != sizeof(unsigned long))
> +               return -EINVAL;
> +
> +       if (reg_num >= KVM_RISCV_ISA_EXT_MAX || reg_num >= ARRAY_SIZE(kvm_isa_ext_arr))
> +               return -EINVAL;
> +
> +       if (copy_from_user(&reg_val, uaddr, KVM_REG_SIZE(reg->id)))
> +               return -EFAULT;
> +
> +       host_isa_ext = kvm_isa_ext_arr[reg_num];
> +       if (!__riscv_isa_extension_available(NULL, host_isa_ext))
> +               return  -EOPNOTSUPP;
> +
> +       if (host_isa_ext >= RISCV_ISA_EXT_BASE &&
> +           host_isa_ext < RISCV_ISA_EXT_MAX) {
> +               /*
> +                * Multi-letter ISA extension. Currently there is no provision
> +                * to enable/disable the multi-letter ISA extensions for guests.
> +                * Return success if the request is to enable any ISA extension
> +                * that is available in the hardware.
> +                * Return -EOPNOTSUPP otherwise.
> +                */
> +               if (!reg_val)
> +                       return -EOPNOTSUPP;
> +               else
> +                       return 0;
> +       }
> +
> +       /* Single letter base ISA extension */
> +       if (!vcpu->arch.ran_atleast_once) {
> +               host_isa_ext_mask = BIT_MASK(host_isa_ext);
> +               if (!reg_val && (host_isa_ext_mask & KVM_RISCV_ISA_DISABLE_ALLOWED))
> +                       vcpu->arch.isa &= ~host_isa_ext_mask;
> +               else
> +                       vcpu->arch.isa |= host_isa_ext_mask;
> +               vcpu->arch.isa &= riscv_isa_extension_base(NULL);
> +               vcpu->arch.isa &= KVM_RISCV_ISA_ALLOWED;
> +               kvm_riscv_vcpu_fp_reset(vcpu);
> +       } else {
> +               return -EOPNOTSUPP;
> +       }
> +
> +       return 0;
> +}
> +
>  static int kvm_riscv_vcpu_set_reg(struct kvm_vcpu *vcpu,
>                                   const struct kvm_one_reg *reg)
>  {
> @@ -382,6 +477,8 @@ static int kvm_riscv_vcpu_set_reg(struct kvm_vcpu *vcpu,
>         else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_FP_D)
>                 return kvm_riscv_vcpu_set_reg_fp(vcpu, reg,
>                                                  KVM_REG_RISCV_FP_D);
> +       else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_ISA_EXT)
> +               return kvm_riscv_vcpu_set_reg_isa_ext(vcpu, reg);
>
>         return -EINVAL;
>  }
> @@ -403,6 +500,8 @@ static int kvm_riscv_vcpu_get_reg(struct kvm_vcpu *vcpu,
>         else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_FP_D)
>                 return kvm_riscv_vcpu_get_reg_fp(vcpu, reg,
>                                                  KVM_REG_RISCV_FP_D);
> +       else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_ISA_EXT)
> +               return kvm_riscv_vcpu_get_reg_isa_ext(vcpu, reg);
>
>         return -EINVAL;
>  }
> --
> 2.36.0
>

