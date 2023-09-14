From: Sean Christopherson <seanjc@google.com>
Date: Thu, 14 Sep 2023 07:19:57 -0700
Subject: [RFC PATCH v12 02/33] KVM: Use gfn instead of hva for mmu_notifier_retry
In-Reply-To: <54d3e6bf-d374-caa5-0920-bb2fe3b7595c@linux.intel.com>
References: <20230914015531.1419405-1-seanjc@google.com> <20230914015531.1419405-3-seanjc@google.com>
 <54d3e6bf-d374-caa5-0920-bb2fe3b7595c@linux.intel.com>
Message-ID: <ZQMWjbt/SzKvag2K@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Sep 14, 2023, Binbin Wu wrote:
> 
> On 9/14/2023 9:55 AM, Sean Christopherson wrote:
> > +void kvm_mmu_invalidate_end(struct kvm *kvm)
> >   {
> >   	/*
> >   	 * This sequence increase will notify the kvm page fault that
> > @@ -833,6 +848,13 @@ void kvm_mmu_invalidate_end(struct kvm *kvm, unsigned long start,
> >   	 * in conjunction with the smp_rmb in mmu_invalidate_retry().
> >   	 */
> >   	kvm->mmu_invalidate_in_progress--;
> > +
> > +	/*
> > +	 * Assert that at least one range must be added between start() and
> > +	 * end().  Not adding a range isn't fatal, but it is a KVM bug.
> > +	 */
> > +	WARN_ON_ONCE(kvm->mmu_invalidate_in_progress &&
> > +		     kvm->mmu_invalidate_range_start == INVALID_GPA);
> Should the check happen before the decrease of kvm->mmu_invalidate_in_progress?
> Otherwise, KVM calls kvm_mmu_invalidate_begin(), then kvm_mmu_invalidate_end()
> the check will not take effect.

Indeed.  I'm pretty sure I added this code, not sure what I was thinking.  There's
no reason to check mmu_invalidate_in_progress, it's not like KVM allows
mmu_invalidate_in_progress to go negative.  The comment is also a bit funky.  I'll
post a fixup patch to make it look like this (assuming I'm not forgetting a subtle
reason for guarding the check with the in-progress flag):

	/*
	 * Assert that at least one range was added between start() and end().
	 * Not adding a range isn't fatal, but it is a KVM bug.
	 */
	WARN_ON_ONCE(kvm->mmu_invalidate_range_start == INVALID_GPA);

Regarding kvm->mmu_invalidate_in_progress, this would be a good opportunity to
move the BUG_ON() into the common end(), e.g. as is, an end() without a start()
from something other than the generic mmu_notifier would go unnoticed.  And I
_think_ we can replace the BUG_ON() with a KVM_BUG_ON() without putting the
kernel at risk.  E.g.

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index dd948276e5d6..54480655bcce 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -870,6 +870,7 @@ void kvm_mmu_invalidate_end(struct kvm *kvm)
         * in conjunction with the smp_rmb in mmu_invalidate_retry().
         */
        kvm->mmu_invalidate_in_progress--;
+       KVM_BUG_ON(kvm->mmu_invalidate_in_progress < 0, kvm);
 
        /*
         * Assert that@least one range was added between start() and end().
@@ -905,8 +906,6 @@ static void kvm_mmu_notifier_invalidate_range_end(struct mmu_notifier *mn,
         */
        if (wake)
                rcuwait_wake_up(&kvm->mn_memslots_update_rcuwait);
-
-       BUG_ON(kvm->mmu_invalidate_in_progress < 0);
 }
 
 static int kvm_mmu_notifier_clear_flush_young(struct mmu_notifier *mn,


