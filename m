From: David Matlack <dmatlack@google.com>
Date: Mon, 30 Oct 2023 11:21:12 -0700
Subject: [PATCH v13 03/35] KVM: Use gfn instead of hva for mmu_notifier_retry
In-Reply-To: <CABgObfYM4nyb1K3xJVGvV+eQmZoLPAmz2-=1CG8++pCwvVW7Qg@mail.gmail.com>
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-4-seanjc@google.com>
 <ZT_fnAcDAvuPCwws@google.com> <CABgObfYM4nyb1K3xJVGvV+eQmZoLPAmz2-=1CG8++pCwvVW7Qg@mail.gmail.com>
Message-ID: <CALzav=djOS8T7AmUa3A7QmP1f0xAm2W-KRDmOov_H8ps77A2qA@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Oct 30, 2023 at 10:01?AM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On Mon, Oct 30, 2023 at 5:53?PM David Matlack <dmatlack@google.com> wrote:
> >
> > On 2023-10-27 11:21 AM, Sean Christopherson wrote:
> > > From: Chao Peng <chao.p.peng@linux.intel.com>
> > >
> > > Currently in mmu_notifier invalidate path, hva range is recorded and
> > > then checked against by mmu_notifier_retry_hva() in the page fault
> > > handling path. However, for the to be introduced private memory, a page
> >                           ^^^^^^^^^^^^^^^^^^^^^^^^
> >
> > Is there a missing word here?
>
> No but there could be missing hyphens ("for the to-be-introduced
> private memory"); possibly a "soon" could help parsing and that is
> what you were talking about?

Ah that explains it :)

>
> > >       if (likely(kvm->mmu_invalidate_in_progress == 1)) {
> > > +             kvm->mmu_invalidate_range_start = INVALID_GPA;
> > > +             kvm->mmu_invalidate_range_end = INVALID_GPA;
> >
> > I don't think this is incorrect, but I was a little suprised to see this
> > here rather than in end() when mmu_invalidate_in_progress decrements to
> > 0.
>
> I think that would be incorrect on the very first start?

Good point. KVM could initialize start/end before registering
notifiers, but that's extra code.

