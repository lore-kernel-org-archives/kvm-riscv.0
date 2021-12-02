From: Sean Christopherson <seanjc@google.com>
Date: Thu, 2 Dec 2021 02:00:03 +0000
Subject: [PATCH v2 11/43] KVM: Don't block+unblock when halt-polling is
 successful
In-Reply-To: <32eabe7d270e5a466ba2d9345b4270b8fe27700c.camel@redhat.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-12-seanjc@google.com>
 <cceb33be9e2a6ac504bb95a7b2b8cf5fe0b1ff26.camel@redhat.com>
 <4e883728e3e5201a94eb46b56315afca5e95ad9c.camel@redhat.com>
 <YaUNBfJh35WXMV0M@google.com>
 <496c2fc6-26b0-9b5d-32f4-2f9e9dd6a064@redhat.com>
 <YaUiEquKYi5eqWC0@google.com>
 <880a5727-69d1-72a1-b129-b053781625ad@redhat.com>
 <458c0819a578ba854f00089bc312c8faa177a81a.camel@redhat.com>
 <32eabe7d270e5a466ba2d9345b4270b8fe27700c.camel@redhat.com>
Message-ID: <Yagoo7R8P5xVilsj@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Dec 02, 2021, Maxim Levitsky wrote:
> On Tue, 2021-11-30 at 00:53 +0200, Maxim Levitsky wrote:
> > On Mon, 2021-11-29 at 20:18 +0100, Paolo Bonzini wrote:
> > Basically what I see that
> >  
> > 1. vCPU2 disables is_running in avic physical id cache
> > 2. vCPU2 checks that IRR is empty and it is
> > 3. vCPU2 does schedule();
> >  
> > and it keeps on sleeping forever. If I kick it via signal 
> > (like just doing 'info registers' qemu hmp command
> > or just stop/cont on the same hmp interface, the
> > vCPU wakes up and notices that IRR suddenly is not empty,
> > and the VM comes back to life (and then hangs after a while again
> > with the same problem....).
> >  
> > As far as I see in the traces, the bit in IRR came from
> > another VCPU who didn't respect the ir_running bit and didn't get 
> > AVIC_INCOMPLETE_IPI VMexit.
> > I can't 100% prove it yet, but everything in the trace shows this.

...

> I am now almost sure that this is errata #1235.
> 
> I had attached a kvm-unit-test I wrote (patch against master of
> https://gitlab.com/kvm-unit-tests/kvm-unit-tests.git/) which is able to
> reproduce the issue on stock 5.15.0 kernel (*no patches applied at all*)
> after just few seconds.  If kvm is loaded without halt-polling (that is
> halt_poll_ns=0 is used).
> 
> Halt polling and/or Sean's patch are not to blame, it just changes timeing.
> With Sean's patch I don't need to disable half polling.

Hmm, that suggests the bug/erratum is due to the CPU consuming stale data from #4
for the IsRunning check in #5, or retiring uops for the IsRunning check before
retiring the vIRR update.  It would be helpful if the erratum actually provided
info on the "highly specific and detailed set of internal timing conditions". :-/

  4. Lookup the vAPIC backing page address in the Physical APIC table using the
     guest physical APIC ID as an index into the table.
  5. For every valid destination:
     - Atomically set the appropriate IRR bit in each of the destinations? vAPIC
       backing page.
     - Check the IsRunning status of each destination.

