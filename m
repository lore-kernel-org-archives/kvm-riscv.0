From: Sean Christopherson <seanjc@google.com>
Date: Wed, 13 Apr 2022 18:28:15 +0000
Subject: [PATCH v3 00/23] KVM: Extend Eager Page Splitting to the shadow
 MMU
In-Reply-To: <YlcPIYJ0CB2qnfpT@google.com>
References: <20220401175554.1931568-1-dmatlack@google.com>
 <YlRhiF1O71TWQr5r@google.com>
 <CALzav=f_WY7xH_MV8-gJPAVmj1KjE_LvXupL7aA5n-vCjTETNw@mail.gmail.com>
 <YlSLuZphElMyF2sG@google.com>
 <CALzav=fGucZOZjbVE2+9PZVf1p+jP7GBYDpPph5PoU552LELsw@mail.gmail.com>
 <YlTKQz8HVPtyfwKe@google.com>
 <CALzav=dz8rSK6bs8pJ9Vv02Z7aWO+yZ5jAA8+nmLAtJe3SMAsA@mail.gmail.com>
 <YlYhO7GvjKY1cwHr@google.com> <YlcPIYJ0CB2qnfpT@google.com>
Message-ID: <YlcWP5Z3osvUg0Ia@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Apr 13, 2022, David Matlack wrote:
> On Wed, Apr 13, 2022 at 01:02:51AM +0000, Sean Christopherson wrote:
> > There will be one wart due to unsync pages needing @vcpu, but we can pass in NULL
> > for the split case and assert that @vcpu is non-null since all of the children
> > should be direct.
> 
> The NULL vcpu check will be a little gross,

Yeah, I would even call it a lot gross :-)

> but it should never trigger in practice since eager page splitting always
> requests direct SPs. My preference has been to enforce that in code by
> splitting out

It still is enforced in code, just at different points.  The split version WARNs
and continues after finding a page, the below WARNs and rejects _while_ finding
the page.

Speaking of WARNs, that reminds me... it might be worth adding a WARN in
kvm_mmu_get_child_sp() to document (and detect, but more to document) that @direct
should never encounter an page with unsync or unsync_children, e.g. 

	union kvm_mmu_page_role role;
	struct kvm_mmu_page *sp;

	role = kvm_mmu_child_role(sptep, direct, access);
	sp = kvm_mmu_get_page(vcpu, gfn, role);

	/* Comment goes here about direct pages in shadow MMUs? */
	WARN_ON(direct && (sp->unsync || sp->unsync_children));
	return sp;

The indirect walk of FNAME(fetch)() handles unsync_children, but none of the other
callers do.  Obviously shouldn't happen, but especially in the huge page split
case it took me a second to understand exactly why it can't happen.

> but I can see the advantage of your proposal is that eager page splitting and
> faults will go through the exact same code path to get a kvm_mmu_page.
> __kvm_mmu_find_shadow_page(), but I can see the advantage of your
> proposal is that eager page splitting and faults will go through the
> exact same code path to get a kvm_mmu_page.
> 
> > 
> > 		if (sp->unsync) {
> > 			if (WARN_ON_ONCE(!vcpu)) {
> > 				kvm_mmu_prepare_zap_page(kvm, sp,
> > 							 &invalid_list);
> > 				continue;
> > 			}
> > 
> > 			/*
> > 			 * The page is good, but is stale.  kvm_sync_page does
> > 			 * get the latest guest state, but (unlike mmu_unsync_children)
> > 			 * it doesn't write-protect the page or mark it synchronized!
> > 			 * This way the validity of the mapping is ensured, but the
> > 			 * overhead of write protection is not incurred until the
> > 			 * guest invalidates the TLB mapping.  This allows multiple
> > 			 * SPs for a single gfn to be unsync.
> > 			 *
> > 			 * If the sync fails, the page is zapped.  If so, break
> > 			 * in order to rebuild it.
> > 			 */
> > 			if (!kvm_sync_page(vcpu, sp, &invalid_list))
> > 				break;
> > 
> > 			WARN_ON(!list_empty(&invalid_list));
> > 			kvm_flush_remote_tlbs(kvm);
> > 		}

