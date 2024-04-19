From: Sean Christopherson <seanjc@google.com>
Date: Fri, 19 Apr 2024 06:58:06 -0700
Subject: [PATCH 1/4] KVM: delete .change_pte MMU notifier callback
In-Reply-To: <20240419112432.GB2972@willie-the-truck>
References: <20240405115815.3226315-1-pbonzini@redhat.com> <20240405115815.3226315-2-pbonzini@redhat.com>
 <20240412104408.GA27645@willie-the-truck> <86jzl2sovz.wl-maz@kernel.org>
 <ZhlLHtfeSHk9gRRO@google.com> <86h6g5si0m.wl-maz@kernel.org>
 <Zh1d94Pl6gneVoDd@google.com> <20240418141932.GA1855@willie-the-truck>
 <ZiF6NgGYLSsPNEOg@google.com> <20240419112432.GB2972@willie-the-truck>
Message-ID: <ZiJ4bqrBUPM0E8iq@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Apr 19, 2024, Will Deacon wrote:
> > @@ -663,10 +669,22 @@ static __always_inline kvm_mn_ret_t __kvm_handle_hva_range(struct kvm *kvm,
> >  					break;
> >  			}
> >  			r.ret |= range->handler(kvm, &gfn_range);
> > +
> > +		       /*
> > +			* Use a precise gfn-based TLB flush when possible, as
> > +			* most mmu_notifier events affect a small-ish range.
> > +			* Fall back to a full TLB flush if the gfn-based flush
> > +			* fails, and don't bother trying the gfn-based flush
> > +			* if a full flush is already pending.
> > +			*/
> > +		       if (range->flush_on_ret && !need_flush && r.ret &&
> > +			   kvm_arch_flush_remote_tlbs_range(kvm, gfn_range.start,
> > +							    gfn_range.end - gfn_range.start + 1))
> 
> What's that '+ 1' needed for here?

 (a) To see if you're paying attention.
 (b) Because more is always better.
 (c) Because math is hard.
 (d) Because I haven't tested this.
 (e) Both (c) and (d).

