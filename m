From: Marc Zyngier <maz@kernel.org>
Date: Thu, 17 Aug 2023 09:39:31 +0100
Subject: [PATCH v9 05/14] KVM: Allow range-based TLB invalidation from common code
In-Reply-To: <ZNv8cCzI9fMWkGWT@google.com>
References: <20230811045127.3308641-1-rananta@google.com>
	<20230811045127.3308641-6-rananta@google.com>
	<ZNv8cCzI9fMWkGWT@google.com>
Message-ID: <87a5uqoyf0.wl-maz@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, 15 Aug 2023 23:30:08 +0100,
Sean Christopherson <seanjc@google.com> wrote:
> 
> On Fri, Aug 11, 2023, Raghavendra Rao Ananta wrote:
> > diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> > index ec169f5c7dce2..00f7bda9202f2 100644
> > --- a/arch/x86/kvm/mmu/mmu.c
> > +++ b/arch/x86/kvm/mmu/mmu.c
> > @@ -278,16 +278,14 @@ static inline bool kvm_available_flush_remote_tlbs_range(void)
> >  	return kvm_x86_ops.flush_remote_tlbs_range;
> >  }
> >  
> > -void kvm_flush_remote_tlbs_range(struct kvm *kvm, gfn_t start_gfn,
> > -				 gfn_t nr_pages)
> > +int kvm_arch_flush_remote_tlbs_range(struct kvm *kvm, gfn_t gfn, u64 nr_pages)
> >  {
> >  	int ret = -EOPNOTSUPP;
> >  
> >  	if (kvm_x86_ops.flush_remote_tlbs_range)
> > -		ret = static_call(kvm_x86_flush_remote_tlbs_range)(kvm, start_gfn,
> > -								   nr_pages);
> > -	if (ret)
> > -		kvm_flush_remote_tlbs(kvm);
> > +		ret = static_call(kvm_x86_flush_remote_tlbs_range)(kvm, gfn, nr_pages);
> > +
> > +	return ret;
> 
> Please write this as
> 
> 	if (kvm_x86_ops.flush_remote_tlbs_range)
> 		return static_call(kvm_x86_flush_remote_tlbs_range)(kvm, gfn, nr_pages);
> 
> 	return -EOPNOTSUPP;
> 
> or alternatively
> 
> 	if (!kvm_x86_ops.flush_remote_tlbs_range)
> 		return -EOPNOTSUPP;
> 
> 	return static_call(kvm_x86_flush_remote_tlbs_range)(kvm, gfn, nr_pages);
> 
> Hmm, I'll throw my official vote for the second version.

I've applied the second version locally.

	M.

-- 
Without deviation from the norm, progress is not possible.

