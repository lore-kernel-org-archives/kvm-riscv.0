From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 30 Oct 2023 18:00:49 +0100
Subject: [PATCH v13 03/35] KVM: Use gfn instead of hva for mmu_notifier_retry
In-Reply-To: <ZT_fnAcDAvuPCwws@google.com>
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-4-seanjc@google.com>
 <ZT_fnAcDAvuPCwws@google.com>
Message-ID: <CABgObfYM4nyb1K3xJVGvV+eQmZoLPAmz2-=1CG8++pCwvVW7Qg@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Oct 30, 2023 at 5:53?PM David Matlack <dmatlack@google.com> wrote:
>
> On 2023-10-27 11:21 AM, Sean Christopherson wrote:
> > From: Chao Peng <chao.p.peng@linux.intel.com>
> >
> > Currently in mmu_notifier invalidate path, hva range is recorded and
> > then checked against by mmu_notifier_retry_hva() in the page fault
> > handling path. However, for the to be introduced private memory, a page
>                           ^^^^^^^^^^^^^^^^^^^^^^^^
>
> Is there a missing word here?

No but there could be missing hyphens ("for the to-be-introduced
private memory"); possibly a "soon" could help parsing and that is
what you were talking about?

> >       if (likely(kvm->mmu_invalidate_in_progress == 1)) {
> > +             kvm->mmu_invalidate_range_start = INVALID_GPA;
> > +             kvm->mmu_invalidate_range_end = INVALID_GPA;
>
> I don't think this is incorrect, but I was a little suprised to see this
> here rather than in end() when mmu_invalidate_in_progress decrements to
> 0.

I think that would be incorrect on the very first start?

> > +     }
> > +}
> > +
> > +void kvm_mmu_invalidate_range_add(struct kvm *kvm, gfn_t start, gfn_t end)
> > +{
> > +     lockdep_assert_held_write(&kvm->mmu_lock);
>
> Does this compile/function on KVM architectures with
> !KVM_HAVE_MMU_RWLOCK?

Yes:

#define lockdep_assert_held_write(l)    \
        lockdep_assert(lockdep_is_held_type(l, 0))

where 0 is the lock-held type used by lock_acquire_exclusive. In turn
is what you get for a spinlock or mutex, in addition to a rwlock or
rwsem that is taken for write.

Instead, lockdep_assert_held() asserts that the lock is taken without
asserting a particular lock-held type.

> > @@ -834,6 +851,12 @@ void kvm_mmu_invalidate_end(struct kvm *kvm, unsigned long start,
>
> Let's add a lockdep_assert_held_write(&kvm->mmu_lock) here too while
> we're at it?

Yes, good idea.

Paolo


