From: Raghavendra Rao Ananta <rananta@google.com>
Date: Mon, 31 Jul 2023 10:30:53 -0700
Subject: [PATCH v7 05/12] KVM: Move kvm_arch_flush_remote_tlbs_memslot()
 to common code
In-Reply-To: <87sf99r5gz.wl-maz@kernel.org>
References: <20230722022251.3446223-1-rananta@google.com> <20230722022251.3446223-6-rananta@google.com>
 <87sf99r5gz.wl-maz@kernel.org>
Message-ID: <CAJHc60xiGyV69a68UBabnzRK0NNycWWQ1kt=ZjJGmC2qzmadAg@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jul 27, 2023 at 3:53?AM Marc Zyngier <maz@kernel.org> wrote:
>
> On Sat, 22 Jul 2023 03:22:44 +0100,
> Raghavendra Rao Ananta <rananta@google.com> wrote:
> >
> > From: David Matlack <dmatlack@google.com>
> >
> > Move kvm_arch_flush_remote_tlbs_memslot() to common code and drop
> > "arch_" from the name. kvm_arch_flush_remote_tlbs_memslot() is just a
> > range-based TLB invalidation where the range is defined by the memslot.
> > Now that kvm_flush_remote_tlbs_range() can be called from common code we
> > can just use that and drop a bunch of duplicate code from the arch
> > directories.
> >
> > Note this adds a lockdep assertion for slots_lock being held when
> > calling kvm_flush_remote_tlbs_memslot(), which was previously only
> > asserted on x86. MIPS has calls to kvm_flush_remote_tlbs_memslot(),
> > but they all hold the slots_lock, so the lockdep assertion continues to
> > hold true.
> >
> > Also drop the CONFIG_KVM_GENERIC_DIRTYLOG_READ_PROTECT ifdef gating
> > kvm_flush_remote_tlbs_memslot(), since it is no longer necessary.
> >
> > Signed-off-by: David Matlack <dmatlack@google.com>
> > Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
> > Reviewed-by: Gavin Shan <gshan@redhat.com>
> > Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
> > ---
> >  arch/arm64/kvm/arm.c     |  6 ------
> >  arch/mips/kvm/mips.c     | 10 ++--------
> >  arch/riscv/kvm/mmu.c     |  6 ------
> >  arch/x86/kvm/mmu/mmu.c   | 16 +---------------
> >  arch/x86/kvm/x86.c       |  2 +-
> >  include/linux/kvm_host.h |  7 +++----
> >  virt/kvm/kvm_main.c      | 18 ++++++++++++++++--
> >  7 files changed, 23 insertions(+), 42 deletions(-)
> >
>
> [...]
>
> > diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> > index 804470fccac7..58213cc4b9b9 100644
> > --- a/virt/kvm/kvm_main.c
> > +++ b/virt/kvm/kvm_main.c
> > @@ -379,6 +379,20 @@ void kvm_flush_remote_tlbs_range(struct kvm *kvm, gfn_t gfn, u64 pages)
> >       kvm_flush_remote_tlbs(kvm);
> >  }
> >
> > +void kvm_flush_remote_tlbs_memslot(struct kvm *kvm,
> > +                                const struct kvm_memory_slot *memslot)
> > +{
> > +     /*
> > +      * All current use cases for flushing the TLBs for a specific memslot
> > +      * related to dirty logging, and many do the TLB flush out of mmu_lock.
>
> I appreciate this is a copy paste of an existing comment, but I can't
> parse it. My command of the English language is notoriously
> approximate, but it feels that something is missing in the first
> sentence, such as a verb.
>
No, you are right. The sentence is broken, probably a missing "are" at
the end of the first line. I'll fix it.

- Raghavendra
>         M.
>
> --
> Without deviation from the norm, progress is not possible.

