From: Sean Christopherson <seanjc@google.com>
Date: Mon, 1 Nov 2021 17:41:29 +0000
Subject: [PATCH v2 26/43] KVM: VMX: Read Posted Interrupt "control"
 exactly once per loop iteration
In-Reply-To: <20a17d75855dfb9bd496466fcd9f14baab0b2bda.camel@redhat.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-27-seanjc@google.com>
 <b078cce30f86672d7d8f8eaa0adc47d24def24e2.camel@redhat.com>
 <YXrH/ZZBOHrWHz4j@google.com>
 <20a17d75855dfb9bd496466fcd9f14baab0b2bda.camel@redhat.com>
Message-ID: <YYAmyUZhmcSntUza@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Nov 01, 2021, Maxim Levitsky wrote:
> On Thu, 2021-10-28 at 15:55 +0000, Sean Christopherson wrote:
> > On Thu, Oct 28, 2021, Maxim Levitsky wrote:
> > > On Fri, 2021-10-08 at 19:12 -0700, Sean Christopherson wrote:
> > > I wish there was a way to mark fields in a struct, as requiring 'READ_ONCE' on them
> > > so that compiler would complain if this isn't done, or automatically use 'READ_ONCE'
> > > logic.
> > 
> > Hmm, I think you could make an argument that ON and thus the whole "control"
> > word should be volatile.  AFAICT, tagging just "on" as volatile actually works.
> > There's even in a clause in Documentation/process/volatile-considered-harmful.rst
> > that calls this out as a (potentially) legitimate use case.
> > 
> >   - Pointers to data structures in coherent memory which might be modified
> >     by I/O devices can, sometimes, legitimately be volatile.
> > 
> > That said, I think I actually prefer forcing the use of READ_ONCE.  The descriptor
> > requires more protections than what volatile provides, namely that all writes need
> > to be atomic.  So given that volatile alone isn't sufficient, I'd prefer to have
> > the code itself be more self-documenting.
> 
> I took a look at how READ_ONCE/WRITE_ONCE is implemented and indeed they use volatile
> (the comment above __READ_ONCE is worth gold...), so there is a bit of contradiction:
> 
> volatile-considered-harmful.rst states not to mark struct members volatile since
> you usually need more that than (very true often) and yet, I also heard that
> READ_ONCE/WRITE_ONCE is very encouraged to be used to fields that are used in lockless
> algorithms, even when not strictly needed,
> so why not to just mark the field and then use it normally? I guess that
> explicit READ_ONCE/WRITE_ONCE is much more readable/visible that a volatile
> in some header file.

Are you asking about this PI field in particular, or for any field in general?

In this particular case, visibility and documentation is really the only difference,
functionally the result is the same.  But that's also very much related to why this
case gets the exception listed above.  The "use it normally" part is also why I
don't want to tag the field volatile since writing the field absolutely cannot be
done "normally", it must be done atomically, and volatile doesn't capture that
detail.

If you're asking about fields in general, the "volatile is harmful" guideline is
to deter usage of volatile for cases where the field/variable in question is not
intrinsically volatile.  As the docs call out, using volatile in those cases often
leads to worse code generation because the compiler is disallowed from optimizing
accesses that are protected through other mechanisms.

A good example in x86 KVM is the READ_ONCE(sp->unsync) in mmu_try_to_unsync_pages() to
force the compiler to emit a load of sp->unsync after acquiring mmu_unsync_pages_lock.
Tagging "unsync" as volatile is unnecessary since the vast majority of its usage is
protected by holding a spinlock for write, and would prevent optimizing references in
kvm_mmu_get_page() and other flows that are protected by mmu_lock in the legacy MMU.

