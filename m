From: Raghavendra Rao Ananta <rananta@google.com>
Date: Wed, 5 Jul 2023 11:16:29 -0700
Subject: [RESEND PATCH v5 02/11] KVM: arm64: Use kvm_arch_flush_remote_tlbs()
In-Reply-To: <0bdc3105-fc3d-d0e1-60e7-d626171e1057@redhat.com>
References: <20230621175002.2832640-1-rananta@google.com> <20230621175002.2832640-3-rananta@google.com>
 <0bdc3105-fc3d-d0e1-60e7-d626171e1057@redhat.com>
Message-ID: <CAJHc60yZEbmbak=5kfFd4v60dtk3k0JHbXKh3nCSB3VjFShGUQ@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jul 4, 2023 at 4:38?PM Gavin Shan <gshan@redhat.com> wrote:
>
> On 6/22/23 03:49, Raghavendra Rao Ananta wrote:
> > From: David Matlack <dmatlack@google.com>
> >
> > Use kvm_arch_flush_remote_tlbs() instead of
> > CONFIG_HAVE_KVM_ARCH_TLB_FLUSH_ALL. The two mechanisms solve the same
> > problem, allowing architecture-specific code to provide a non-IPI
> > implementation of remote TLB flushing.
> >
> > Dropping CONFIG_HAVE_KVM_ARCH_TLB_FLUSH_ALL allows KVM to standardize
> > all architectures on kvm_arch_flush_remote_tlbs() instead of maintaining
> > two mechanisms.
> >
> > Opt to standardize on kvm_arch_flush_remote_tlbs() since it avoids
> > duplicating the generic TLB stats across architectures that implement
> > their own remote TLB flush.
> >
> > This adds an extra function call to the ARM64 kvm_flush_remote_tlbs()
> > path, but that is a small cost in comparison to flushing remote TLBs.
> >
> > No functional change intended.
>    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>
> It's not true and please refer to the below explanation.
>
> >
> > Signed-off-by: David Matlack <dmatlack@google.com>
> > Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
> > Reviewed-by: Zenghui Yu <zenghui.yu@linux.dev>
> > Acked-by: Oliver Upton <oliver.upton@linux.dev>
> > ---
> >   arch/arm64/include/asm/kvm_host.h | 3 +++
> >   arch/arm64/kvm/Kconfig            | 1 -
> >   arch/arm64/kvm/mmu.c              | 6 +++---
> >   virt/kvm/Kconfig                  | 3 ---
> >   virt/kvm/kvm_main.c               | 2 --
> >   5 files changed, 6 insertions(+), 9 deletions(-)
> >
>
> The changes make sense and look good to me. However, there is a functional change because
> the generic kvm_arch_flush_remote_tlbs() isn't exactly same to ARM64's variant. Strictly
> speaking, they're not interchangeable. In the generic function, both statistics (
> remote_tlb_flush_requests and remote_tlb_flush) are increased. Only the former statistic
> is increased in ARM64's variant.
>
> It looks correct to increase both statistics, but the commit log may need tweak to reflect
> it. With this resolved:
Good catch! I agree, there's a slight functional change here and I'll
adjust the commit message in my next revision.

Thank you.
Raghavendra

> Reviewed-by: Gavin Shan <gshan@redhat.com>
>
> > diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> > index 7e7e19ef6993e..81ab41b84f436 100644
> > --- a/arch/arm64/include/asm/kvm_host.h
> > +++ b/arch/arm64/include/asm/kvm_host.h
> > @@ -1078,6 +1078,9 @@ int __init kvm_set_ipa_limit(void);
> >   #define __KVM_HAVE_ARCH_VM_ALLOC
> >   struct kvm *kvm_arch_alloc_vm(void);
> >
> > +#define __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS
> > +int kvm_arch_flush_remote_tlbs(struct kvm *kvm);
> > +
> >   static inline bool kvm_vm_is_protected(struct kvm *kvm)
> >   {
> >       return false;
> > diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
> > index f531da6b362e9..6b730fcfee379 100644
> > --- a/arch/arm64/kvm/Kconfig
> > +++ b/arch/arm64/kvm/Kconfig
> > @@ -25,7 +25,6 @@ menuconfig KVM
> >       select MMU_NOTIFIER
> >       select PREEMPT_NOTIFIERS
> >       select HAVE_KVM_CPU_RELAX_INTERCEPT
> > -     select HAVE_KVM_ARCH_TLB_FLUSH_ALL
> >       select KVM_MMIO
> >       select KVM_GENERIC_DIRTYLOG_READ_PROTECT
> >       select KVM_XFER_TO_GUEST_WORK
> > diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> > index 3b9d4d24c361a..d0a0d3dca9316 100644
> > --- a/arch/arm64/kvm/mmu.c
> > +++ b/arch/arm64/kvm/mmu.c
> > @@ -81,15 +81,15 @@ static bool memslot_is_logging(struct kvm_memory_slot *memslot)
> >   }
> >
> >   /**
> > - * kvm_flush_remote_tlbs() - flush all VM TLB entries for v7/8
> > + * kvm_arch_flush_remote_tlbs() - flush all VM TLB entries for v7/8
> >    * @kvm:    pointer to kvm structure.
> >    *
> >    * Interface to HYP function to flush all VM TLB entries
> >    */
> > -void kvm_flush_remote_tlbs(struct kvm *kvm)
> > +int kvm_arch_flush_remote_tlbs(struct kvm *kvm)
> >   {
> > -     ++kvm->stat.generic.remote_tlb_flush_requests;
> >       kvm_call_hyp(__kvm_tlb_flush_vmid, &kvm->arch.mmu);
> > +     return 0;
> >   }
> >
> >   static bool kvm_is_device_pfn(unsigned long pfn)
> > diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
> > index b74916de5183a..484d0873061ca 100644
> > --- a/virt/kvm/Kconfig
> > +++ b/virt/kvm/Kconfig
> > @@ -62,9 +62,6 @@ config HAVE_KVM_CPU_RELAX_INTERCEPT
> >   config KVM_VFIO
> >          bool
> >
> > -config HAVE_KVM_ARCH_TLB_FLUSH_ALL
> > -       bool
> > -
> >   config HAVE_KVM_INVALID_WAKEUPS
> >          bool
> >
> > diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> > index a475ff9ef156d..600a985b86215 100644
> > --- a/virt/kvm/kvm_main.c
> > +++ b/virt/kvm/kvm_main.c
> > @@ -350,7 +350,6 @@ bool kvm_make_all_cpus_request(struct kvm *kvm, unsigned int req)
> >   }
> >   EXPORT_SYMBOL_GPL(kvm_make_all_cpus_request);
> >
> > -#ifndef CONFIG_HAVE_KVM_ARCH_TLB_FLUSH_ALL
> >   void kvm_flush_remote_tlbs(struct kvm *kvm)
> >   {
> >       ++kvm->stat.generic.remote_tlb_flush_requests;
> > @@ -371,7 +370,6 @@ void kvm_flush_remote_tlbs(struct kvm *kvm)
> >               ++kvm->stat.generic.remote_tlb_flush;
> >   }
> >   EXPORT_SYMBOL_GPL(kvm_flush_remote_tlbs);
> > -#endif
> >
> >   static void kvm_flush_shadow_all(struct kvm *kvm)
> >   {
>

