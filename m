From: Raghavendra Rao Ananta <rananta@google.com>
Date: Mon, 31 Jul 2023 17:39:58 -0700
Subject: [PATCH v7 04/12] KVM: Allow range-based TLB invalidation from
 common code
In-Reply-To: <ZMgtwp/YCZciRvdr@google.com>
References: <20230722022251.3446223-1-rananta@google.com> <20230722022251.3446223-5-rananta@google.com>
 <ZMgtwp/YCZciRvdr@google.com>
Message-ID: <CAJHc60xsNtnOpc8=XV_102A2sEESk=Scfhj7ktjNepQp2exw_A@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jul 31, 2023 at 2:55?PM Sean Christopherson <seanjc@google.com> wrote:
>
> On Sat, Jul 22, 2023, Raghavendra Rao Ananta wrote:
> > diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> > index ec169f5c7dce..eb88d25f9896 100644
> > --- a/arch/x86/kvm/mmu/mmu.c
> > +++ b/arch/x86/kvm/mmu/mmu.c
> > @@ -278,16 +278,15 @@ static inline bool kvm_available_flush_remote_tlbs_range(void)
> >       return kvm_x86_ops.flush_remote_tlbs_range;
> >  }
> >
> > -void kvm_flush_remote_tlbs_range(struct kvm *kvm, gfn_t start_gfn,
> > -                              gfn_t nr_pages)
> > +int kvm_arch_flush_remote_tlbs_range(struct kvm *kvm, gfn_t start_gfn, u64 pages)
>
> Please keep "nr_pages", I have a very strong preference for that over just "pages"
> as the "nr_" makes it super obvious that it's a single number, as opposed to an
> array of pages or something.
>
Sure, I'll revert back to 'nr_pages'.

- Raghavendra
> And it doesn't truly matter, but IMO the gfn_t type is more appropriate since
> the gfn and the number of pages need to have the same type.

