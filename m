From: Sean Christopherson <seanjc@google.com>
Date: Mon, 15 Apr 2024 10:03:51 -0700
Subject: [PATCH 1/4] KVM: delete .change_pte MMU notifier callback
In-Reply-To: <86h6g5si0m.wl-maz@kernel.org>
References: <20240405115815.3226315-1-pbonzini@redhat.com> <20240405115815.3226315-2-pbonzini@redhat.com>
 <20240412104408.GA27645@willie-the-truck> <86jzl2sovz.wl-maz@kernel.org>
 <ZhlLHtfeSHk9gRRO@google.com> <86h6g5si0m.wl-maz@kernel.org>
Message-ID: <Zh1d94Pl6gneVoDd@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Apr 13, 2024, Marc Zyngier wrote:
> On Fri, 12 Apr 2024 15:54:22 +0100, Sean Christopherson <seanjc@google.com> wrote:
> > 
> > On Fri, Apr 12, 2024, Marc Zyngier wrote:
> > > On Fri, 12 Apr 2024 11:44:09 +0100, Will Deacon <will@kernel.org> wrote:
> > > > On Fri, Apr 05, 2024 at 07:58:12AM -0400, Paolo Bonzini wrote:
> > > > Also, if you're in the business of hacking the MMU notifier code, it
> > > > would be really great to change the .clear_flush_young() callback so
> > > > that the architecture could handle the TLB invalidation. At the moment,
> > > > the core KVM code invalidates the whole VMID courtesy of 'flush_on_ret'
> > > > being set by kvm_handle_hva_range(), whereas we could do a much
> > > > lighter-weight and targetted TLBI in the architecture page-table code
> > > > when we actually update the ptes for small ranges.
> > > 
> > > Indeed, and I was looking at this earlier this week as it has a pretty
> > > devastating effect with NV (it blows the shadow S2 for that VMID, with
> > > costly consequences).
> > > 
> > > In general, it feels like the TLB invalidation should stay with the
> > > code that deals with the page tables, as it has a pretty good idea of
> > > what needs to be invalidated and how -- specially on architectures
> > > that have a HW-broadcast facility like arm64.
> > 
> > Would this be roughly on par with an in-line flush on arm64?  The simpler, more
> > straightforward solution would be to let architectures override flush_on_ret,
> > but I would prefer something like the below as x86 can also utilize a range-based
> > flush when running as a nested hypervisor.

...

> I think this works for us on HW that has range invalidation, which
> would already be a positive move.
> 
> For the lesser HW that isn't range capable, it also gives the
> opportunity to perform the iteration ourselves or go for the nuclear
> option if the range is larger than some arbitrary constant (though
> this is additional work).
> 
> But this still considers the whole range as being affected by
> range->handler(). It'd be interesting to try and see whether more
> precise tracking is (or isn't) generally beneficial.

I assume the idea would be to let arch code do single-page invalidations of
stage-2 entries for each gfn?

Unless I'm having a brain fart, x86 can't make use of that functionality.  Intel
doesn't provide any way to do targeted invalidation of stage-2 mappings.  AMD
provides an instruction to do broadcast invalidations, but it takes a virtual
address, i.e. a stage-1 address.  I can't tell if it's a host virtual address or
a guest virtual address, but it's a moot point because KVM doen't have the guest
virtual address, and if it's a host virtual address, there would need to be valid
mappings in the host page tables for it to work, which KVM can't guarantee.

