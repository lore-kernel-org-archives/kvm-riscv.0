From: Maxim Levitsky <mlevitsk@redhat.com>
Date: Thu, 02 Dec 2021 14:02:56 +0200
Subject: [PATCH v2 11/43] KVM: Don't block+unblock when halt-polling is
 successful
In-Reply-To: <YaUNBfJh35WXMV0M@google.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-12-seanjc@google.com>
 <cceb33be9e2a6ac504bb95a7b2b8cf5fe0b1ff26.camel@redhat.com>
 <4e883728e3e5201a94eb46b56315afca5e95ad9c.camel@redhat.com>
 <YaUNBfJh35WXMV0M@google.com>
Message-ID: <3adb566de918fe2fcc7a8abe7dba5f2c9d292d66.camel@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, 2021-11-29 at 17:25 +0000, Sean Christopherson wrote:
> On Mon, Nov 29, 2021, Maxim Levitsky wrote:
> > (This thing is that when you tell the IOMMU that a vCPU is not running,
> > Another thing I discovered that this patch series totally breaks my VMs,
> > without cpu_pm=on The whole series (I didn't yet bisect it) makes even my
> > fedora32 VM be very laggy, almost unusable, and it only has one
> > passed-through device, a nic).
> 
> Grrrr, the complete lack of comments in the KVM code and the separate paths for
> VMX vs SVM when handling HLT with APICv make this all way for difficult to
> understand than it should be.
> 
> The hangs are likely due to:
> 
>   KVM: SVM: Unconditionally mark AVIC as running on vCPU load (with APICv)

Yes, the other hang I told about which makes all my VMs very laggy, almost impossible
to use is because of the above patch, but since I reproduced it now again without
any passed-through device, I also blame the cpu errata on this.

Best regards,
	Maxim Levitsky


> 
> If a posted interrupt arrives after KVM has done its final search through the vIRR,
> but before avic_update_iommu_vcpu_affinity() is called, the posted interrupt will
> be set in the vIRR without triggering a host IRQ to wake the vCPU via the GA log.
> 
> I.e. KVM is missing an equivalent to VMX's posted interrupt check for an outstanding
> notification after switching to the wakeup vector.
> 
> For now, the least awful approach is sadly to keep the vcpu_(un)blocking() hooks.
> Unlike VMX's PI support, there's no fast check for an interrupt being posted (KVM
> would have to rewalk the vIRR), no easy to signal the current CPU to do wakeup (I
> don't think KVM even has access to the IRQ used by the owning IOMMU), and there's
> no simplification of load/put code.
> 
> If the scheduler were changed to support waking in the sched_out path, then I'd be
> more inclined to handle this in avic_vcpu_put() by rewalking the vIRR one final
> time, but for now it's not worth it.
> 
> > If I apply though only the patch series up to this patch, my fedora VM seems
> > to work fine, but my windows VM still locks up hard when I run 'LatencyTop'
> > in it, which doesn't happen without this patch.
> 
> Buy "run 'LatencyTop' in it", do you mean running something in the Windows guest?
> The only search results I can find for LatencyTop are Linux specific.
> 
> > So far the symptoms I see is that on VCPU 0, ISR has quite high interrupt
> > (0xe1 last time I seen it), TPR and PPR are 0xe0 (although I have seen TPR to
> > have different values), and IRR has plenty of interrupts with lower priority.
> > The VM seems to be stuck in this case. As if its EOI got lost or something is
> > preventing the IRQ handler from issuing EOI.
> >  
> > LatencyTop does install some form of a kernel driver which likely does meddle
> > with interrupts (maybe it sends lots of self IPIs?).
> >  
> > 100% reproducible as soon as I start monitoring with LatencyTop.
> >  
> > Without this patch it works (or if disabling halt polling),
> 
> Huh.  I assume everything works if you disable halt polling _without_ this patch
> applied?
> 
> If so, that implies that successful halt polling without mucking with vCPU IOMMU
> affinity is somehow problematic.  I can't think of any relevant side effects other
> than timing.
> 



