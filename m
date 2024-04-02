From: Anup Patel <anup@brainfault.org>
Date: Tue, 2 Apr 2024 09:25:49 +0530
Subject: [PATCH v3 1/3] RISC-V: KVM: Implement kvm_arch_vcpu_ioctl_set_guest_debug()
In-Reply-To: <20240327075526.31855-2-duchao@eswincomputing.com>
References: <20240327075526.31855-1-duchao@eswincomputing.com> <20240327075526.31855-2-duchao@eswincomputing.com>
Message-ID: <CAAhSdy0Cv23WDx=3H863rqeAdqQ5wbWZC=qFS=RFwR9VFbD_og@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Mar 27, 2024 at 1:29?PM Chao Du <duchao@eswincomputing.com> wrote:
>
> kvm_vm_ioctl_check_extension(): Return 1 if KVM_CAP_SET_GUEST_DEBUG is
> been checked.
>
> kvm_arch_vcpu_ioctl_set_guest_debug(): Update the guest_debug flags
> from userspace accordingly. Route the breakpoint exceptions to HS mode
> if the VCPU is being debugged by userspace, by clearing the
> corresponding bit in hedeleg.
>
> Initialize the hedeleg configuration in kvm_riscv_vcpu_setup_config().
> Write the actual CSR in kvm_arch_vcpu_load().
>
> Signed-off-by: Chao Du <duchao@eswincomputing.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/include/asm/kvm_host.h | 12 ++++++++++++
>  arch/riscv/kvm/main.c             | 18 ++----------------
>  arch/riscv/kvm/vcpu.c             | 16 ++++++++++++++--
>  arch/riscv/kvm/vm.c               |  1 +
>  4 files changed, 29 insertions(+), 18 deletions(-)
>
> diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
> index 484d04a92fa6..da4ab7e175ff 100644
> --- a/arch/riscv/include/asm/kvm_host.h
> +++ b/arch/riscv/include/asm/kvm_host.h
> @@ -43,6 +43,17 @@
>         KVM_ARCH_REQ_FLAGS(5, KVM_REQUEST_WAIT | KVM_REQUEST_NO_WAKEUP)
>  #define KVM_REQ_STEAL_UPDATE           KVM_ARCH_REQ(6)
>
> +#define KVM_HEDELEG_DEFAULT            (BIT(EXC_INST_MISALIGNED) | \
> +                                        BIT(EXC_BREAKPOINT)      | \
> +                                        BIT(EXC_SYSCALL)         | \
> +                                        BIT(EXC_INST_PAGE_FAULT) | \
> +                                        BIT(EXC_LOAD_PAGE_FAULT) | \
> +                                        BIT(EXC_STORE_PAGE_FAULT))
> +
> +#define KVM_HIDELEG_DEFAULT            (BIT(IRQ_VS_SOFT)  | \
> +                                        BIT(IRQ_VS_TIMER) | \
> +                                        BIT(IRQ_VS_EXT))
> +
>  enum kvm_riscv_hfence_type {
>         KVM_RISCV_HFENCE_UNKNOWN = 0,
>         KVM_RISCV_HFENCE_GVMA_VMID_GPA,
> @@ -169,6 +180,7 @@ struct kvm_vcpu_csr {
>  struct kvm_vcpu_config {
>         u64 henvcfg;
>         u64 hstateen0;
> +       unsigned long hedeleg;
>  };
>
>  struct kvm_vcpu_smstateen_csr {
> diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
> index 225a435d9c9a..bab2ec34cd87 100644
> --- a/arch/riscv/kvm/main.c
> +++ b/arch/riscv/kvm/main.c
> @@ -22,22 +22,8 @@ long kvm_arch_dev_ioctl(struct file *filp,
>
>  int kvm_arch_hardware_enable(void)
>  {
> -       unsigned long hideleg, hedeleg;
> -
> -       hedeleg = 0;
> -       hedeleg |= (1UL << EXC_INST_MISALIGNED);
> -       hedeleg |= (1UL << EXC_BREAKPOINT);
> -       hedeleg |= (1UL << EXC_SYSCALL);
> -       hedeleg |= (1UL << EXC_INST_PAGE_FAULT);
> -       hedeleg |= (1UL << EXC_LOAD_PAGE_FAULT);
> -       hedeleg |= (1UL << EXC_STORE_PAGE_FAULT);
> -       csr_write(CSR_HEDELEG, hedeleg);
> -
> -       hideleg = 0;
> -       hideleg |= (1UL << IRQ_VS_SOFT);
> -       hideleg |= (1UL << IRQ_VS_TIMER);
> -       hideleg |= (1UL << IRQ_VS_EXT);
> -       csr_write(CSR_HIDELEG, hideleg);
> +       csr_write(CSR_HEDELEG, KVM_HEDELEG_DEFAULT);
> +       csr_write(CSR_HIDELEG, KVM_HIDELEG_DEFAULT);
>
>         /* VS should access only the time counter directly. Everything else should trap */
>         csr_write(CSR_HCOUNTEREN, 0x02);
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index b5ca9f2e98ac..f3c87f0c93ba 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -475,8 +475,15 @@ int kvm_arch_vcpu_ioctl_set_mpstate(struct kvm_vcpu *vcpu,
>  int kvm_arch_vcpu_ioctl_set_guest_debug(struct kvm_vcpu *vcpu,
>                                         struct kvm_guest_debug *dbg)
>  {
> -       /* TODO; To be implemented later. */
> -       return -EINVAL;
> +       if (dbg->control & KVM_GUESTDBG_ENABLE) {
> +               vcpu->guest_debug = dbg->control;
> +               vcpu->arch.cfg.hedeleg &= ~BIT(EXC_BREAKPOINT);
> +       } else {
> +               vcpu->guest_debug = 0;
> +               vcpu->arch.cfg.hedeleg |= BIT(EXC_BREAKPOINT);
> +       }
> +
> +       return 0;
>  }
>
>  static void kvm_riscv_vcpu_setup_config(struct kvm_vcpu *vcpu)
> @@ -505,6 +512,10 @@ static void kvm_riscv_vcpu_setup_config(struct kvm_vcpu *vcpu)
>                 if (riscv_isa_extension_available(isa, SMSTATEEN))
>                         cfg->hstateen0 |= SMSTATEEN0_SSTATEEN0;
>         }
> +
> +       cfg->hedeleg = KVM_HEDELEG_DEFAULT;
> +       if (vcpu->guest_debug)
> +               cfg->hedeleg &= ~BIT(EXC_BREAKPOINT);
>  }
>
>  void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
> @@ -519,6 +530,7 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
>         csr_write(CSR_VSEPC, csr->vsepc);
>         csr_write(CSR_VSCAUSE, csr->vscause);
>         csr_write(CSR_VSTVAL, csr->vstval);
> +       csr_write(CSR_HEDELEG, cfg->hedeleg);
>         csr_write(CSR_HVIP, csr->hvip);
>         csr_write(CSR_VSATP, csr->vsatp);
>         csr_write(CSR_HENVCFG, cfg->henvcfg);
> diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
> index ce58bc48e5b8..7396b8654f45 100644
> --- a/arch/riscv/kvm/vm.c
> +++ b/arch/riscv/kvm/vm.c
> @@ -186,6 +186,7 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>         case KVM_CAP_READONLY_MEM:
>         case KVM_CAP_MP_STATE:
>         case KVM_CAP_IMMEDIATE_EXIT:
> +       case KVM_CAP_SET_GUEST_DEBUG:
>                 r = 1;
>                 break;
>         case KVM_CAP_NR_VCPUS:
> --
> 2.17.1
>

