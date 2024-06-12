From: Sean Christopherson <seanjc@google.com>
Date: Wed, 12 Jun 2024 10:31:27 -0700
Subject: [PATCH 1/4] KVM: delete .change_pte MMU notifier callback
In-Reply-To: <Zmm9SdVfg18RECT5@google.com>
References: <20240405115815.3226315-2-pbonzini@redhat.com> <20240412104408.GA27645@willie-the-truck>
 <86jzl2sovz.wl-maz@kernel.org> <ZhlLHtfeSHk9gRRO@google.com>
 <86h6g5si0m.wl-maz@kernel.org> <Zh1d94Pl6gneVoDd@google.com>
 <20240418141932.GA1855@willie-the-truck> <ZiF6NgGYLSsPNEOg@google.com>
 <20240419112432.GB2972@willie-the-truck> <Zmm9SdVfg18RECT5@google.com>
Message-ID: <Zmnbb-Xlyz4VXNHI@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jun 12, 2024, Sean Christopherson wrote:
> On Fri, Apr 19, 2024, Will Deacon wrote:
> > On Thu, Apr 18, 2024 at 12:53:26PM -0700, Sean Christopherson wrote:
> > > On Thu, Apr 18, 2024, Will Deacon wrote:
> > > > > I assume the idea would be to let arch code do single-page invalidations of
> > > > > stage-2 entries for each gfn?
> > > > 
> > > > Right, as it's the only code which knows which ptes actually ended up
> > > > being aged.
> > > > 
> > > > > Unless I'm having a brain fart, x86 can't make use of that functionality.  Intel
> > > > > doesn't provide any way to do targeted invalidation of stage-2 mappings.  AMD
> > > > > provides an instruction to do broadcast invalidations, but it takes a virtual
> > > > > address, i.e. a stage-1 address.  I can't tell if it's a host virtual address or
> > > > > a guest virtual address, but it's a moot point because KVM doen't have the guest
> > > > > virtual address, and if it's a host virtual address, there would need to be valid
> > > > > mappings in the host page tables for it to work, which KVM can't guarantee.
> > > > 
> > > > Ah, so it sounds like it would need to be an arch opt-in then.
> > > 
> > > Even if x86 (or some other arch code) could use the precise tracking, I think it
> > > would make sense to have the behavior be arch specific.  Adding infrastructure
> > > to get information from arch code, only to turn around and give it back to arch
> > > code would be odd.
> > 
> > Sorry, yes, that's what I had in mind. Basically, a way for the arch code
> > to say "I've handled the TLBI, don't worry about it."
> > 
> > > Unless arm64 can't do the invalidation immediately after aging the stage-2 PTE,
> > > the best/easiest solution would be to let arm64 opt out of the common TLB flush
> > > when a SPTE is made young.
> > > 
> > > With the range-based flushing bundled in, this?
> > > 
> > > ---
> > >  include/linux/kvm_host.h |  2 ++
> > >  virt/kvm/kvm_main.c      | 40 +++++++++++++++++++++++++---------------
> > >  2 files changed, 27 insertions(+), 15 deletions(-)
> > > 
> > > diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> > > index afbc99264ffa..8fe5f5e16919 100644
> > > --- a/include/linux/kvm_host.h
> > > +++ b/include/linux/kvm_host.h
> > > @@ -2010,6 +2010,8 @@ extern const struct kvm_stats_header kvm_vcpu_stats_header;
> > >  extern const struct _kvm_stats_desc kvm_vcpu_stats_desc[];
> > >  
> > >  #ifdef CONFIG_KVM_GENERIC_MMU_NOTIFIER
> > > +int kvm_arch_flush_tlb_if_young(void);
> > > +
> > >  static inline int mmu_invalidate_retry(struct kvm *kvm, unsigned long mmu_seq)
> > >  {
> > >  	if (unlikely(kvm->mmu_invalidate_in_progress))
> > > diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> > > index 38b498669ef9..5ebef8ef239c 100644
> > > --- a/virt/kvm/kvm_main.c
> > > +++ b/virt/kvm/kvm_main.c
> > > @@ -595,6 +595,11 @@ static void kvm_null_fn(void)
> > >  }
> > >  #define IS_KVM_NULL_FN(fn) ((fn) == (void *)kvm_null_fn)
> > >  
> > > +int __weak kvm_arch_flush_tlb_if_young(void)
> > > +{
> > > +	return true;
> > > +}
> > 
> > I tend to find __weak functions a little ugly, but I think the gist of the
> > diff looks good to me. Thanks for putting it together!
> 
> Circling back to this, I don't think we should pursue this specific tweak, at
> least not without hard data for a concrete use case.

Ha, I spoke too soon.  Based on the learning from the KVM+MGLRU thread[*], it
looks like KVM should omit the TLB flush when aging pages whenever possible.  If
that's not doable on all architectures for whatever reason, then something like
this is probably the way to go.

[*] https://lore.kernel.org/all/CAOUHufYCmYNngmS=rOSAQRB0N9ai+mA0aDrB9RopBvPHEK42Ng at mail.gmail.com

