From: Sean Christopherson <seanjc@google.com>
Date: Tue, 26 Oct 2021 14:48:02 +0000
Subject: [PATCH v2 00/43] KVM: Halt-polling and x86 APICv overhaul
In-Reply-To: <04b1a72e-47b4-4bde-eb9e-ba36c156ff0d@de.ibm.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <04b1a72e-47b4-4bde-eb9e-ba36c156ff0d@de.ibm.com>
Message-ID: <YXgVIvYhABnrP2Jo@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Oct 26, 2021, Christian Borntraeger wrote:
> Am 09.10.21 um 04:11 schrieb Sean Christopherson:
> > This is basically two series smushed into one.  The first "half" aims
> > to differentiate between "halt" and a more generic "block", where "halt"
> > aligns with x86's HLT instruction, the halt-polling mechanisms, and
> > associated stats, and "block" means any guest action that causes the vCPU
> > to block/wait.
> > 
> > The second "half" overhauls x86's APIC virtualization code (Posted
> > Interrupts on Intel VMX, AVIC on AMD SVM) to do their updates in response
> > to vCPU (un)blocking in the vcpu_load/put() paths, keying off of the
> > vCPU's rcuwait status to determine when a blocking vCPU is being put and
> > reloaded.  This idea comes from arm64's kvm_timer_vcpu_put(), which I
> > stumbled across when diving into the history of arm64's (un)blocking hooks.
> > 
> > The x86 APICv overhaul allows for killing off several sets of hooks in
> > common KVM and in x86 KVM (to the vendor code).  Moving everything to
> > vcpu_put/load() also realizes nice cleanups, especially for the Posted
> > Interrupt code, which required some impressive mental gymnastics to
> > understand how vCPU task migration interacted with vCPU blocking.
> > 
> > Non-x86 folks, sorry for the noise.  I'm hoping the common parts can get
> > applied without much fuss so that future versions can be x86-only.
> > 
> > v2:
> >   - Collect reviews. [Christian, David]
> >   - Add patch to move arm64 WFI functionality out of hooks. [Marc]
> >   - Add RISC-V to the fun.
> >   - Add all the APICv fun.
> 
> Have we actually followed up on the regression regarding halt_poll_ns=0 no longer disabling
> polling for running systems?

No, I have that conversation flagged but haven't gotten back to it.  I still like
the idea of special casing halt_poll_ns=0 to override the capability.  I can send
a proper patch for that unless there's a different/better idea?

