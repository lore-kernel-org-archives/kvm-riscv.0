From: Raghavendra Rao Ananta <rananta@google.com>
Date: Mon, 31 Jul 2023 10:21:08 -0700
Subject: [PATCH v7 01/12] KVM: Rename kvm_arch_flush_remote_tlb() to kvm_arch_flush_remote_tlbs()
In-Reply-To: <87v8e5r6s6.wl-maz@kernel.org>
References: <20230722022251.3446223-1-rananta@google.com> <20230722022251.3446223-2-rananta@google.com>
 <87v8e5r6s6.wl-maz@kernel.org>
Message-ID: <CAJHc60wtc2Usei3hKj1ykVRvBZFFCBOHMi9HCxnNvGK2dPFApA@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jul 27, 2023 at 3:24?AM Marc Zyngier <maz@kernel.org> wrote:
>
> On Sat, 22 Jul 2023 03:22:40 +0100,
> Raghavendra Rao Ananta <rananta@google.com> wrote:
> >
> > From: David Matlack <dmatlack@google.com>
> >
> > Rename kvm_arch_flush_remote_tlb() and the associated macro
> > __KVM_HAVE_ARCH_FLUSH_REMOTE_TLB to kvm_arch_flush_remote_tlbs() and
> > __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS respectively.
> >
> > Making the name plural matches kvm_flush_remote_tlbs() and makes it more
> > clear that this function can affect more than one remote TLB.
> >
> > No functional change intended.
> >
> > Signed-off-by: David Matlack <dmatlack@google.com>
> > Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
> > Reviewed-by: Gavin Shan <gshan@redhat.com>
> > Reviewed-by: Philippe Mathieu-Daud? <philmd@linaro.org>
> > Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
> > ---
> >  arch/mips/include/asm/kvm_host.h | 4 ++--
> >  arch/mips/kvm/mips.c             | 2 +-
> >  arch/x86/include/asm/kvm_host.h  | 4 ++--
> >  include/linux/kvm_host.h         | 4 ++--
> >  virt/kvm/kvm_main.c              | 2 +-
> >  5 files changed, 8 insertions(+), 8 deletions(-)
> >
> > diff --git a/arch/mips/include/asm/kvm_host.h b/arch/mips/include/asm/kvm_host.h
> > index 04cedf9f8811..9b0ad8f3bf32 100644
> > --- a/arch/mips/include/asm/kvm_host.h
> > +++ b/arch/mips/include/asm/kvm_host.h
> > @@ -896,7 +896,7 @@ static inline void kvm_arch_sched_in(struct kvm_vcpu *vcpu, int cpu) {}
> >  static inline void kvm_arch_vcpu_blocking(struct kvm_vcpu *vcpu) {}
> >  static inline void kvm_arch_vcpu_unblocking(struct kvm_vcpu *vcpu) {}
> >
> > -#define __KVM_HAVE_ARCH_FLUSH_REMOTE_TLB
> > -int kvm_arch_flush_remote_tlb(struct kvm *kvm);
> > +#define __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS
> > +int kvm_arch_flush_remote_tlbs(struct kvm *kvm);
>
> How about making this prototype global? I don't see a point in having
> it per-architecture, specially as you are adding arm64 to that mix in
> the following patch.
>
We can make it global, but I'm not sure what was the intention of the
original author. My guess is that he was following the same style that
we have for some of the other kvm_arch_*() functions
(kvm_arch_free_vm() for example)?

- Raghavendra
>         M.
>
> --
> Without deviation from the norm, progress is not possible.

