From: Oliver Upton <oliver.upton@linux.dev>
Date: Mon, 5 Aug 2024 23:56:18 +0000
Subject: [PATCH v12 54/84] KVM: arm64: Mark "struct page" pfns
 accessed/dirty before dropping mmu_lock
In-Reply-To: <ZrFl3faiGHQ5oLjf@google.com>
References: <20240726235234.228822-1-seanjc@google.com>
 <20240726235234.228822-55-seanjc@google.com>
 <ZrFfgzRbiqT-Zi2O@linux.dev>
 <ZrFfvjy_-Tyx4xUV@linux.dev>
 <ZrFl3faiGHQ5oLjf@google.com>
Message-ID: <ZrFmool3SKpp_NRZ@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Aug 05, 2024 at 04:53:01PM -0700, Sean Christopherson wrote:
> On Mon, Aug 05, 2024, Oliver Upton wrote:
> > > > ---
> > > >  arch/arm64/kvm/mmu.c | 10 ++++++----
> > > >  1 file changed, 6 insertions(+), 4 deletions(-)
> > > > 
> > > > diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> > > > index 22ee37360c4e..ce13c3d884d5 100644
> > > > --- a/arch/arm64/kvm/mmu.c
> > > > +++ b/arch/arm64/kvm/mmu.c
> > > > @@ -1685,15 +1685,17 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
> > > >  	}
> > > >  
> > > >  out_unlock:
> > > > +	if (writable && !ret)
> > > > +		kvm_set_pfn_dirty(pfn);
> > > 
> > > I'm guessing you meant kvm_release_pfn_dirty() here, because this leaks
> > > a reference.
> 
> Doh, I did indeed.  Alternatively, this could be:
> 
> 	if (writable && !ret)
> 		kvm_set_pfn_dirty(pfn);
> 
> 	kvm_release_pfn_clean(pfn);
> 
> It won't matter in the end, because this just becomes:
> 
> 	kvm_release_faultin_page(kvm, page, !!ret, writable);
> 
> So I guess the question is if you prefer to make the switch to an if-else in this
> path, or more implicitly in the conversion to kvm_release_faultin_page().
> 
> I made the same goof for RISC-V, perhaps to prove that I too can copy+paste arm64's
> MMU code ;-)

LOL, whatever way you want to address it is fine by me, just wanted to
make sure this intermediate bug wouldn't bite an unlucky bisection.

-- 
Thanks,
Oliver

