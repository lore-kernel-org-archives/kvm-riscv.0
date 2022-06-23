From: Sean Christopherson <seanjc@google.com>
Date: Thu, 23 Jun 2022 19:48:02 +0000
Subject: [PATCH v7 22/23] KVM: x86/mmu: Extend Eager Page Splitting to
 nested MMUs
In-Reply-To: <CALzav=fH_9_LKVE0_UCftwy2KZaB3nSBoWU07aPWALag4_mcHQ@mail.gmail.com>
References: <20220622192710.2547152-1-pbonzini@redhat.com>
 <20220622192710.2547152-23-pbonzini@redhat.com>
 <CALzav=fH_9_LKVE0_UCftwy2KZaB3nSBoWU07aPWALag4_mcHQ@mail.gmail.com>
Message-ID: <YrTDcrsn0/+alpzf@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jun 23, 2022, David Matlack wrote:
> On Wed, Jun 22, 2022 at 12:27 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

Please trim replies.

> > +static int topup_split_caches(struct kvm *kvm)
> > +{
> > +       int r;
> > +
> > +       lockdep_assert_held(&kvm->slots_lock);
> > +
> > +       /*
> > +        * It's common to need all SPLIT_DESC_CACHE_MIN_NR_OBJECTS (513) objects
> > +        * when splitting a page, but setting capacity == min would cause
> > +        * KVM to drop mmu_lock even if just one object was consumed from the
> > +        * cache.  So make capacity larger than min and handle two huge pages
> > +        * without having to drop the lock.
> 
> I was going to do some testing this week to confirm, but IIUC KVM will
> only allocate from split_desc_cache if the L1 hypervisor has aliased a
> huge page in multiple {E,N}PT12 page table entries. i.e. L1 is mapping
> a huge page into an L2 multiple times, or mapped into multiple L2s.
> This should be common in traditional, process-level, shadow paging,
> but I think will be quite rare for nested shadow paging.

Ooooh, right, I forgot that that pte_list_add() needs to allocate if and only if
there are multiple rmap entries, otherwise rmap->val points that the one and only
rmap directly.

Doubling the capacity is all but guaranteed to be pointless overhead.  What about
buffering with the default capacity?  That way KVM doesn't have to topup if it
happens to encounter an aliased gfn.  It's arbitrary, but so is the default capacity
size.

E.g. as fixup

---
 arch/x86/kvm/mmu/mmu.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 22b87007efff..90d6195edcf3 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -6125,19 +6125,23 @@ static bool need_topup_split_caches_or_resched(struct kvm *kvm)

 static int topup_split_caches(struct kvm *kvm)
 {
-	int r;
-
-	lockdep_assert_held(&kvm->slots_lock);
-
 	/*
-	 * It's common to need all SPLIT_DESC_CACHE_MIN_NR_OBJECTS (513) objects
-	 * when splitting a page, but setting capacity == min would cause
-	 * KVM to drop mmu_lock even if just one object was consumed from the
-	 * cache.  So make capacity larger than min and handle two huge pages
-	 * without having to drop the lock.
+	 * Allocating rmap list entries when splitting huge pages for nested
+	 * MMUs is rare as KVM needs to allocate if and only if there is more
+	 * than one rmap entry for the gfn, i.e. requires an L1 gfn to be
+	 * aliased by multiple L2 gfns, which is very atypical for VMMs.  If
+	 * there is only one rmap entry, rmap->val points directly at that one
+	 * entry and doesn't need to allocate a list.  Buffer the cache by the
+	 * default capacity so that KVM doesn't have to topup the cache if it
+	 * encounters an aliased gfn or two.
 	 */
-	r = __kvm_mmu_topup_memory_cache(&kvm->arch.split_desc_cache,
-					 2 * SPLIT_DESC_CACHE_MIN_NR_OBJECTS,
+	const int capacity = SPLIT_DESC_CACHE_MIN_NR_OBJECTS +
+			     KVM_ARCH_NR_OBJS_PER_MEMORY_CACHE;
+	int r;
+
+	lockdep_assert_held(&kvm->slots_lock);
+
+	r = __kvm_mmu_topup_memory_cache(&kvm->arch.split_desc_cache, capacity,
 					 SPLIT_DESC_CACHE_MIN_NR_OBJECTS);
 	if (r)
 		return r;

base-commit: 436b1c29f36ed3d4385058ba6f0d6266dbd2a882
--


