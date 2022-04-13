From: Sean Christopherson <seanjc@google.com>
Date: Wed, 13 Apr 2022 01:02:51 +0000
Subject: [PATCH v3 00/23] KVM: Extend Eager Page Splitting to the shadow
 MMU
In-Reply-To: <CALzav=dz8rSK6bs8pJ9Vv02Z7aWO+yZ5jAA8+nmLAtJe3SMAsA@mail.gmail.com>
References: <20220401175554.1931568-1-dmatlack@google.com>
 <YlRhiF1O71TWQr5r@google.com>
 <CALzav=f_WY7xH_MV8-gJPAVmj1KjE_LvXupL7aA5n-vCjTETNw@mail.gmail.com>
 <YlSLuZphElMyF2sG@google.com>
 <CALzav=fGucZOZjbVE2+9PZVf1p+jP7GBYDpPph5PoU552LELsw@mail.gmail.com>
 <YlTKQz8HVPtyfwKe@google.com>
 <CALzav=dz8rSK6bs8pJ9Vv02Z7aWO+yZ5jAA8+nmLAtJe3SMAsA@mail.gmail.com>
Message-ID: <YlYhO7GvjKY1cwHr@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Apr 12, 2022, David Matlack wrote:
> On Mon, Apr 11, 2022 at 5:39 PM Sean Christopherson <seanjc@google.com> wrote:
> >
> > On Mon, Apr 11, 2022, David Matlack wrote:
> > >
> > > One thing that would be helpful is if you can explain in a bit more
> > > specifically what you'd like to see. Part of the reason why I prefer
> > > to sequence your proposal after eager page splitting is that I do not
> > > fully understand what you're proposing, and how complex it would be.
> > > e.g. Forking FNAME(fetch), FNAME(page_fault), and kvm_mmu_get_page()
> > > for nested MMUs does not sound like less churn.
> >
> > Oh, it's most definitely not less code, and probably more churn.  But, it's churn
> > that pushes us in a more favorable direction and that is desirable long term.  I
> > don't mind churning code, but I want the churn to make future life easier, not
> > harder.  Details below.
> 
> Of course. Let's make sure we're on the same page about what churn
> introduced by this series will make future life harder that we hope to
> avoid. If I understand you correctly, it's the following 2 changes:
> 
>  (a.) Using separate functions to allocate SPs and initialize SPs.
>  (b.) Separating kvm_mmu_find_shadow_page() from __kvm_mmu_find_shadow_page().
> 
> (a.) stems from the fact that SP allocation during eager page
> splitting is made directly rather than through kvm_mmu_memory_caches,
> which was what you pushed for in the TDP MMU implementation. We could
> instead use kvm_mmu_memory_caches for the shadow MMU eager page

...

> So even if we did everything you proposed (which seems like an awful
> lot just to avoid __kvm_mmu_find_shadow_page()), there's a chance we
> would still end up with the exact same code. i.e.
> kvm_mmu_nested_tdp_find_sp() would be implemented by calling
> __kvm_mmu_find_shadow_page(), because it would be a waste to
> re-implement an almost identical function?

I went far enough down this path to know that my idea isn't completely awful,
and wouldn't actually need to fork FNAME(page_fault) at this time, but sadly I
still dislike the end result.

Your assessment that the we'd still end up with very similar (if not quite exact)
code is spot on.  Ditto for your other assertion in (a) about using the caches.

My vote for this series is to go the cache route, e.g. wrap kvm_mmu_memory_caches
in a struct and pass that into kvm_mmu_get_page().  I still think it was the right
call to ignore the caches for the TDP MMU, it gives the TDP MMU more flexibility
and it was trivial to bypass the caches since the TDP MMU was doing its own thing
anyways.

But for the shadow MMU, IMO the cons outweigh the pros.  E.g. in addition to
ending up with two similar but subtly different "get page" flows, passing around
"struct kvm_mmu_page **spp" is a bit unpleasant.  Ditto for having a partially
initialized kvm_mmu_page.  The split code also ends up in a wierd state where it
uses the caches for the pte_list, but not the other allocations.

There will be one wart due to unsync pages needing @vcpu, but we can pass in NULL
for the split case and assert that @vcpu is non-null since all of the children
should be direct.

		if (sp->unsync) {
			if (WARN_ON_ONCE(!vcpu)) {
				kvm_mmu_prepare_zap_page(kvm, sp,
							 &invalid_list);
				continue;
			}

			/*
			 * The page is good, but is stale.  kvm_sync_page does
			 * get the latest guest state, but (unlike mmu_unsync_children)
			 * it doesn't write-protect the page or mark it synchronized!
			 * This way the validity of the mapping is ensured, but the
			 * overhead of write protection is not incurred until the
			 * guest invalidates the TLB mapping.  This allows multiple
			 * SPs for a single gfn to be unsync.
			 *
			 * If the sync fails, the page is zapped.  If so, break
			 * in order to rebuild it.
			 */
			if (!kvm_sync_page(vcpu, sp, &invalid_list))
				break;

			WARN_ON(!list_empty(&invalid_list));
			kvm_flush_remote_tlbs(kvm);
		}

