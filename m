From: Sean Christopherson <seanjc@google.com>
Date: Fri, 17 Jun 2022 17:11:27 +0000
Subject: [PATCH v6 20/22] KVM: x86/mmu: Refactor drop_large_spte()
In-Reply-To: <20220516232138.1783324-21-dmatlack@google.com>
References: <20220516232138.1783324-1-dmatlack@google.com>
 <20220516232138.1783324-21-dmatlack@google.com>
Message-ID: <Yqy1v59ZDJ7EkCix@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, May 16, 2022, David Matlack wrote:
>  static void drop_large_spte(struct kvm_vcpu *vcpu, u64 *sptep)
>  {
> -	if (__drop_large_spte(vcpu->kvm, sptep)) {
> -		struct kvm_mmu_page *sp = sptep_to_sp(sptep);
> -
> -		kvm_flush_remote_tlbs_with_address(vcpu->kvm, sp->gfn,
> -			KVM_PAGES_PER_HPAGE(sp->role.level));
> -	}
> +	return __drop_large_spte(vcpu->kvm, sptep, true);

A "return" for a void function is unnecessary.  And since the shortlog is already
a somewhat vague "do a refactor", I vote to opportunistically:

  - rename drop_large_spte() to drop_spte_if_huge()
  - rename __drop_large_spte() to drop_huge_spte()
  - move "if (!is_large_pte(*sptep))" to drop_spte_if_huge() since the split path
    should never pass in a non-huge SPTE.

That last point will also clean up an oddity with with "flush" parameter; given
the command-like name of "flush", it's a bit weird that __drop_large_spte() doesn't
flush when the SPTE is large.


static void drop_huge_spte(struct kvm *kvm, u64 *sptep, bool flush)
{
	struct kvm_mmu_page *sp;

	sp = sptep_to_sp(sptep);
	WARN_ON(sp->role.level == PG_LEVEL_4K);

	drop_spte(kvm, sptep);

	if (flush)
		kvm_flush_remote_tlbs_with_address(kvm, sp->gfn,
			KVM_PAGES_PER_HPAGE(sp->role.level));
}

static void drop_spte_if_huge(struct kvm_vcpu *vcpu, u64 *sptep)
{
	if (is_large_pte(*sptep))
		drop_huge_spte(vcpu->kvm, sptep, true);
}


>  }
>  
>  /*
> -- 
> 2.36.0.550.gb090851708-goog
> 

