From: David Woodhouse <dwmw2@infradead.org>
Date: Thu, 18 Nov 2021 14:22:04 +0000
Subject: [PATCH v3 08/12] KVM: Propagate vcpu explicitly to
 mark_page_dirty_in_slot()
In-Reply-To: <4c48546b-eb4a-dff7-cc38-5df54f73f5d4@redhat.com>
References: <20211117174003.297096-1-dwmw2@infradead.org>
 <20211117174003.297096-9-dwmw2@infradead.org>
 <85d9fec17f32c3eb9e100e56b91af050.squirrel@twosheds.infradead.org>
 <4c48546b-eb4a-dff7-cc38-5df54f73f5d4@redhat.com>
Message-ID: <20b5952e76c54a3a5dfe5a898e3b835404ac6fb1.camel@infradead.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 2021-11-18 at 13:04 +0100, Paolo Bonzini wrote:
> On 11/17/21 22:09, David Woodhouse wrote:
> > >   {
> > > -	struct kvm_vcpu *vcpu = kvm_get_running_vcpu();
> > > +	struct kvm_vcpu *running_vcpu = kvm_get_running_vcpu();
> > > 
> > > +	WARN_ON_ONCE(vcpu && vcpu != running_vcpu);
> > >   	WARN_ON_ONCE(vcpu->kvm != kvm);
> > Ah, that one needs to be changed to check running_vcpu instead. Or this
> > needs to go first:
> > 
> > I think I prefer making the vCPU a required argument. If anyone's going to
> > pull a vCPU pointer out of their posterior, let the caller do it.
> > 
> 
> I understand that feeling, but still using the running vCPU is by far 
> the common case, and it's not worth adding a new function parameter to 
> all call sites.
> 
> What about using a separate function, possibly __-prefixed, for the case 
> where you have a very specific vCPU?

We could certainly do a kvm_vcpu_mark_page_dirty_in_slot() and reduce
the collateral damage. I think this patch wouldn't need to touch
anything outside virt/kvm/ if we did that.

But bikeshedding aside, it occurs to me that I have a more substantial
concern about this approach ? are we even *allowed* to touch the dirty
ring of another vCPU? It seems to be based on the assumption that it's
entirely a per-cpu structure on the kernel side. Wouldn't we need a
spinlock in kvm_dirty_ring_push() at the very least?

At this point I'm somewhat tempted to remove the mark_page_dirty() call
from gfn_to_pfn_cache_invalidate_start() and move it to the tail of 
kvm_gfn_to_pfn_cache_refresh() instead, where it unpins and memunmaps
the page. (We'd still tell the *kernel* by calling kvm_set_pfn_dirty()
immediately in the invalidation, just defer the KVM mark_page_dirty()
to be done in the context of an actual vCPU.)

If I do that, I can drop this 'propagate vcpu' patch completely.

I'm already happy enough that I'll fix the Xen shared_info page by
*never* bothering to dirty_log for it, and I can wash my hands of that
problem.... if I stop typing now. But...

That leaves the one in TDP MMU handle_changed_spte_dirty_log() which
AFAICT can trigger the same crash seen by butt3rflyh4ck ? can't that
happen from a thread where kvm_get_running_vcpu() is NULL too? For that
one I'm not sure.

-------------- next part --------------
A non-text attachment was scrubbed...
Name: smime.p7s
Type: application/pkcs7-signature
Size: 5174 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20211118/bcc97888/attachment.p7s>
