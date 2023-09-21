From: Xu Yilun <yilun.xu@intel.com>
Date: Thu, 21 Sep 2023 10:39:18 +0800
Subject: [RFC PATCH v12 02/33] KVM: Use gfn instead of hva for
 mmu_notifier_retry
In-Reply-To: <ZQr5uXhV6Cnx4DYT@google.com>
References: <20230914015531.1419405-1-seanjc@google.com>
 <20230914015531.1419405-3-seanjc@google.com>
 <ZQqMBEL61p739dpF@yilunxu-OptiPlex-7050>
 <ZQr5uXhV6Cnx4DYT@google.com>
Message-ID: <ZQus1v3AvEZjuat9@yilunxu-OptiPlex-7050>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2023-09-20 at 06:55:05 -0700, Sean Christopherson wrote:
> On Wed, Sep 20, 2023, Xu Yilun wrote:
> > On 2023-09-13 at 18:55:00 -0700, Sean Christopherson wrote:
> > > +void kvm_mmu_invalidate_range_add(struct kvm *kvm, gfn_t start, gfn_t end)
> > > +{
> > > +	lockdep_assert_held_write(&kvm->mmu_lock);
> > > +
> > > +	WARN_ON_ONCE(!kvm->mmu_invalidate_in_progress);
> > > +
> > >  	if (likely(kvm->mmu_invalidate_in_progress == 1)) {
> > >  		kvm->mmu_invalidate_range_start = start;
> > >  		kvm->mmu_invalidate_range_end = end;
> > 
> > IIUC, Now we only add or override a part of the invalidate range in
> > these fields, IOW only the range in last slot is stored when we unlock.
> 
> Ouch.  Good catch!
> 
> > That may break mmu_invalidate_retry_gfn() cause it can never know the
> > whole invalidate range.
> > 
> > How about we extend the mmu_invalidate_range_start/end everytime so that
> > it records the whole invalidate range:
> > 
> > if (kvm->mmu_invalidate_range_start == INVALID_GPA) {
> > 	kvm->mmu_invalidate_range_start = start;
> > 	kvm->mmu_invalidate_range_end = end;
> > } else {
> > 	kvm->mmu_invalidate_range_start =
> > 		min(kvm->mmu_invalidate_range_start, start);
> > 	kvm->mmu_invalidate_range_end =
> > 		max(kvm->mmu_invalidate_range_end, end);
> > }
> 
> Yeah, that does seem to be the easiest solution.
> 
> I'll post a fixup patch, unless you want the honors.

Please go ahead, cause at a second thought I'm wondering if this simple
range extension is reasonable.

When the invalidation acrosses multiple slots, I'm not sure if the
contiguous HVA range must correspond to contiguous GFN range. If not,
are we producing a larger range than required?

And when the invalidation acrosses multiple address space, I'm almost
sure it is wrong to merge GFN ranges from different address spaces. But
I have no clear solution yet.

Thanks,
Yilun

