From: Anup Patel <anup@brainfault.org>
Date: Mon, 29 Nov 2021 09:10:36 +0530
Subject: [PATCH 2/4] RISC-V: KVM: Add VM capability to allow userspace get
 GPA size
In-Reply-To: <4fcb162a-738b-64e7-6326-9f9967d1b8a8@redhat.com>
References: <20211126154020.342924-1-anup.patel@wdc.com>
 <20211126154020.342924-3-anup.patel@wdc.com>
 <4fcb162a-738b-64e7-6326-9f9967d1b8a8@redhat.com>
Message-ID: <CAAhSdy0EVLVjbD9XdM_-DyjRjH4C3Bo9=WUbm6HUJ8NmPpeH_g@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Nov 26, 2021 at 9:43 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 11/26/21 16:40, Anup Patel wrote:
> > The GPA size supported for a RISC-V Guest/VM is based on the MMU mode
> > used by G-stage translation. The KVM RISC-V will detect and use the
> > best possible MMU mode for the G-stage in kvm_arch_init().
> >
> > We add a RISC-V specific VM capability KVM_CAP_RISCV_VM_GPA_SIZE which
>
> You can make it just KVM_CAP_VM_GPA_BITS instead - it's useful on other
> architectures as well.

Sure, I will update.

Regards,
Anup

>
> Paolo
>
> > can be used by KVM userspace to get guest physical address (GPA) size
> > (i.e. number of GPA bits) supported for a Guest/VM.
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > ---
> >   arch/riscv/include/asm/kvm_host.h | 1 +
> >   arch/riscv/kvm/mmu.c              | 5 +++++
> >   arch/riscv/kvm/vm.c               | 3 +++
> >   include/uapi/linux/kvm.h          | 1 +
> >   4 files changed, 10 insertions(+)
> >
> > diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
> > index 37589b953bcb..ae5d238607fe 100644
> > --- a/arch/riscv/include/asm/kvm_host.h
> > +++ b/arch/riscv/include/asm/kvm_host.h
> > @@ -221,6 +221,7 @@ void kvm_riscv_stage2_free_pgd(struct kvm *kvm);
> >   void kvm_riscv_stage2_update_hgatp(struct kvm_vcpu *vcpu);
> >   void kvm_riscv_stage2_mode_detect(void);
> >   unsigned long kvm_riscv_stage2_mode(void);
> > +int kvm_riscv_stage2_gpa_size(void);
> >
> >   void kvm_riscv_stage2_vmid_detect(void);
> >   unsigned long kvm_riscv_stage2_vmid_bits(void);
> > diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> > index 9ffd0255af43..9b6d6465094f 100644
> > --- a/arch/riscv/kvm/mmu.c
> > +++ b/arch/riscv/kvm/mmu.c
> > @@ -760,3 +760,8 @@ unsigned long kvm_riscv_stage2_mode(void)
> >   {
> >       return stage2_mode >> HGATP_MODE_SHIFT;
> >   }
> > +
> > +int kvm_riscv_stage2_gpa_size(void)
> > +{
> > +     return stage2_gpa_bits;
> > +}
> > diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
> > index fb18af34a4b5..ae97f6929897 100644
> > --- a/arch/riscv/kvm/vm.c
> > +++ b/arch/riscv/kvm/vm.c
> > @@ -82,6 +82,9 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
> >       case KVM_CAP_NR_MEMSLOTS:
> >               r = KVM_USER_MEM_SLOTS;
> >               break;
> > +     case KVM_CAP_RISCV_VM_GPA_SIZE:
> > +             r = kvm_riscv_stage2_gpa_size();
> > +             break;
> >       default:
> >               r = 0;
> >               break;
> > diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> > index 1daa45268de2..dac98df3101d 100644
> > --- a/include/uapi/linux/kvm.h
> > +++ b/include/uapi/linux/kvm.h
> > @@ -1131,6 +1131,7 @@ struct kvm_ppc_resize_hpt {
> >   #define KVM_CAP_EXIT_ON_EMULATION_FAILURE 204
> >   #define KVM_CAP_ARM_MTE 205
> >   #define KVM_CAP_VM_MOVE_ENC_CONTEXT_FROM 206
> > +#define KVM_CAP_RISCV_VM_GPA_SIZE 207
> >
> >   #ifdef KVM_CAP_IRQ_ROUTING
> >
> >
>

