From: Sean Christopherson <seanjc@google.com>
Date: Mon, 11 Apr 2022 20:12:41 +0000
Subject: [PATCH v3 00/23] KVM: Extend Eager Page Splitting to the shadow
 MMU
In-Reply-To: <CALzav=f_WY7xH_MV8-gJPAVmj1KjE_LvXupL7aA5n-vCjTETNw@mail.gmail.com>
References: <20220401175554.1931568-1-dmatlack@google.com>
 <YlRhiF1O71TWQr5r@google.com>
 <CALzav=f_WY7xH_MV8-gJPAVmj1KjE_LvXupL7aA5n-vCjTETNw@mail.gmail.com>
Message-ID: <YlSLuZphElMyF2sG@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Apr 11, 2022, David Matlack wrote:
> On Mon, Apr 11, 2022 at 10:12 AM Sean Christopherson <seanjc@google.com> wrote:
> > Circling back to eager page splitting, this series could be reworked to take the
> > first step of forking FNAME(page_fault), FNAME(fetch) and kvm_mmu_get_page() in
> > order to provide the necessary path for reworking nested MMU page faults.  Then it
> > can remove unsync and shrinker support for nested MMUs.  With those gone,
> > dissecting the nested MMU variant of kvm_mmu_get_page() should be simpler/cleaner
> > than dealing with the existing kvm_mmu_get_page(), i.e. should eliminate at least
> > some of the complexity/churn.
> 
> These sound like useful improvements but I am not really seeing the
> value of sequencing them before this series:
> 
>  - IMO the "churn" in patches 1-14 are a net improvement to the
> existing code. They improve readability by decomposing the shadow page
> creation path into smaller functions with better names, reduce the
> amount of redundant calculations, and reduce the dependence on struct
> kvm_vcpu where it is not needed. Even if eager page splitting is
> completely dropped I think they would be useful to merge.

I definitely like some of patches 1-14, probably most after a few read throughs.
But there are key parts that I do not like that are motivated almost entirely by
the desire to support page splitting.  Specifically, I don't like splitting the
logic of finding a page, and I don't like having a separate alloc vs. initializer
(though I'm guessing this will be needed somewhere to split huge pages for nested
MMUs).

E.g. I'd prefer the "get" flow look like the below (completely untested, for
discussion purposes only).  There's still churn, but the core loop is almost
entirely unchanged.

And it's not just this series, I don't want future improvements nested TDP to have
to deal with the legacy baggage.

Waaaay off topic, why do we still bother with stat.max_mmu_page_hash_collision?
I assume it was originally added to tune the hashing logic?  At this point is it
anything but wasted cycles?

static struct kvm_mmu_page *kvm_mmu_find_shadow_page(struct kvm_vcpu *vcpu,
						     gfn_t gfn,
						     unsigned int gfn_hash,
						     union kvm_mmu_page_role role)
{
	struct hlist_head *sp_list = &kvm->arch.mmu_page_hash[gfn_hash];
	struct kvm_mmu_page *sp;
	LIST_HEAD(invalid_list);

	int collisions = 0;

	for_each_valid_sp(kvm, sp, sp_list) {
		if (sp->gfn != gfn) {
			collisions++;
			continue;
		}

		if (sp->role.word != role.word) {
			/*
			 * If the guest is creating an upper-level page, zap
			 * unsync pages for the same gfn.  While it's possible
			 * the guest is using recursive page tables, in all
			 * likelihood the guest has stopped using the unsync
			 * page and is installing a completely unrelated page.
			 * Unsync pages must not be left as is, because the new
			 * upper-level page will be write-protected.
			 */
			if (role.level > PG_LEVEL_4K && sp->unsync)
				kvm_mmu_prepare_zap_page(vcpu->kvm, sp, invalid_list);

			continue;
		}

		/* unsync and write-flooding only apply to indirect SPs. */
		if (sp->role.direct)
			goto out;

		if (sp->unsync) {
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
			kvm_flush_remote_tlbs(vcpu->kvm);
		}

		__clear_sp_write_flooding_count(sp);
		goto out;
	}

	sp = NULL;

out:
	if (collisions > kvm->stat.max_mmu_page_hash_collisions)
		kvm->stat.max_mmu_page_hash_collisions = collisions;

	kvm_mmu_commit_zap_page(vcpu->kvm, &invalid_list);
	return sp;
}

static struct kvm_mmu_page *kvm_mmu_alloc_shadow_page(struct kvm_vcpu *vcpu,
						      gfn_t gfn,
						      unsigned int gfn_hash,
						      union kvm_mmu_page_role role)
{
	struct kvm_mmu_page *sp = __kvm_mmu_alloc_shadow_page(vcpu, role.direct);
	struct kvm_memory_slot *slot = kvm_vcpu_gfn_to_memslot(vcpu, gfn);
	struct hlist_head *sp_list = &kvm->arch.mmu_page_hash[gfn_hash];

	++kvm->stat.mmu_cache_miss;

	sp->gfn = gfn;
	sp->role = role;
	sp->mmu_valid_gen = kvm->arch.mmu_valid_gen;

	/*
	 * active_mmu_pages must be a FIFO list, as kvm_zap_obsolete_pages()
	 * depends on valid pages being added to the head of the list.  See
	 * comments in kvm_zap_obsolete_pages().
	 */
	list_add(&sp->link, &kvm->arch.active_mmu_pages);
	kvm_mod_used_mmu_pages(kvm, 1);

	sp_list = &kvm->arch.mmu_page_hash[kvm_page_table_hashfn(gfn)];
	hlist_add_head(&sp->hash_link, sp_list);

	if (!role.direct)
		account_shadowed(kvm, slot, sp);
}


static struct kvm_mmu_page *kvm_mmu_get_shadow_page(struct kvm_vcpu *vcpu,
						    gfn_t gfn,
						    union kvm_mmu_page_role role)
{
	unsigned int gfn_hash = kvm_page_table_hashfn(gfn);
	struct kvm_mmu_page *sp;
	bool created = false;

	sp = kvm_mmu_find_shadow_page(vcpu, gfn, gfn_hash, role);
	if (!sp) {
		created = true;
		sp = kvm_mmu_alloc_shadow_page(vcpu, gfn, gfn_hash, role);
	}

	trace_kvm_mmu_get_page(sp, created);
	return sp;
}

