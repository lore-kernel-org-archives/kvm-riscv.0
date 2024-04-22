From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 22 Apr 2024 18:36:45 -0400
Subject: [PATCH v2 2/6] dt-bindings: riscv: Add Zawrs ISA extension
 description
In-Reply-To: <20240421-f63f90c2146deb0695b84441@orel>
References: <20240419135321.70781-8-ajones@ventanamicro.com>
 <20240419135321.70781-10-ajones@ventanamicro.com>
 <20240419-chafe-leotard-e5daee19b1c8@spud>
 <20240419-8c6af6a169a7aa0b9aa5cac5@orel>
 <20240419-disdain-litmus-82874cc4872e@spud>
 <ZiKeYRnXxtLUtkkW@ghost>
 <20240421-f63f90c2146deb0695b84441@orel>
Message-ID: <ZibmfbLnGCb9gmow@ghost>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Apr 21, 2024 at 12:20:03PM +0200, Andrew Jones wrote:
> On Fri, Apr 19, 2024 at 12:40:01PM -0400, Charlie Jenkins wrote:
> > On Fri, Apr 19, 2024 at 04:19:52PM +0100, Conor Dooley wrote:
> > > On Fri, Apr 19, 2024 at 05:16:05PM +0200, Andrew Jones wrote:
> > > > On Fri, Apr 19, 2024 at 03:45:46PM +0100, Conor Dooley wrote:
> > > > > On Fri, Apr 19, 2024 at 03:53:24PM +0200, Andrew Jones wrote:
> > > > > > Add description for the Zawrs (Wait-on-Reservation-Set) ISA extension
> > > > > > which was ratified in commit 98918c844281 of riscv-isa-manual.
> > > > > > 
> > > > > > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > > > > > ---
> > > > > >  .../devicetree/bindings/riscv/extensions.yaml        | 12 ++++++++++++
> > > > > >  1 file changed, 12 insertions(+)
> > > > > > 
> > > > > > diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > > > > > index 468c646247aa..584da2f539e5 100644
> > > > > > --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> > > > > > +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > > > > > @@ -177,6 +177,18 @@ properties:
> > > > > >              is supported as ratified at commit 5059e0ca641c ("update to
> > > > > >              ratified") of the riscv-zacas.
> > > > > >  
> > > > > > +        - const: zawrs
> > > > > > +          description: |
> > > > > > +            The Zawrs extension for entering a low-power state or for trapping
> > > > > > +            to a hypervisor while waiting on a store to a memory location, as
> > > > > > +            ratified in commit 98918c844281 ("Merge pull request #1217 from
> > > > > > +            riscv/zawrs") of riscv-isa-manual.
> > > > > 
> > > > > This part is fine...
> > > > > 
> > > > > 
> > > > > > Linux assumes that WRS.NTO will
> > > > > > +            either always eventually terminate the stall due to the reservation
> > > > > > +            set becoming invalid, implementation-specific other reasons, or
> > > > > > +            because a higher privilege level has configured it to cause an
> > > > > > +            illegal instruction exception after an implementation-specific
> > > > > > +            bounded time limit.
> > > > > 
> > > > > ...but I don't like this bit. The binding should just describe what the
> > > > > property means for the hardware, not discuss specifics about a
> > > > > particular OS.
> > > > > 
> > > > > And with my dt-bindings hat off and my kernel hat on, I think that if we
> > > > > want to have more specific requirements than the extension provides we
> > > > > either need to a) document that zawrs means that it will always
> > > > > terminate or b) additionally document a "zawrs-always-terminates" that
> > > > > has that meaning and look for it to enable the behaviour.
> > > > 
> > > > IIUC, the text above mostly just needs to remove 'Linux assumes' in order
> > > > to provide what we want for (a)? I'm not sure about (b). If Zawrs is
> > > > unusable as is, then we should probably just go back to the specs and get
> > > > a new standard extension name for a new version which includes the changes
> > > > we need.
> > > 
> > > An (official) new name for the behaviour that you actually want, especially
> > > if the patchset sent the other day does not have the more stringent
> > > requirement (I won't even pretend to understand Zawrs well enough to know
> > > whether it does or not), sounds like the ideal outcome. That way you're
> > > also sorted on the ACPI side.
> > 
> > What would be the purpose of a vendor implementing WRS.NTO (and putting
> > it in the DT) that never terminates? The spec says "Then a subsequent
> > WRS.NTO instruction would cause the hart to temporarily stall execution
> > in a low- power state until a store occurs to the reservation set or an
> > interrupt is observed." Why is this wording for WRS.NTO not sufficient
> > to assume that an implementation of this instruction would eventually
> > terminate?
> >
> 
> We can invoke smp_cond_load_relaxed(addr, VAL || anything_we_want()). This
> means we may not expect VAL ever to be written, which rules out "until a
> store occurs". As for "an interrupt is observed", we don't know which one
> to expect to arrive within a "reasonable" amount of time. We need to know
> which one(s), since, while wrs.nto will terminate even when interrupts are
> globally disabled, we still need to have the interrupt(s) we expect to be
> locally enabled. And, the interrupts should arrive in a "reasonable"
> amount of time since we want to poll anything_we_want() at a "reasonable"
> frequency.
> 
> So, we need firmware to promise to enable exceptions if there aren't any
> such interrupts. Or, we could require hardware descriptions to identify
> which interrupt(s) would be good to have enabled before calling wrs.nto.
> Maybe there's already some way to describe something like that?
> 
> Thanks,
> drew

Ahh okay I am caught up now. So the wording we are looking at in the
spec is:

"When executing in VS or VU mode, if the VTW bit is set in hstatus, the
TW bit in mstatus is clear, and the WRS.NTO does not complete within an
implementation-specific bounded time limit, the WRS.NTO instruction will
cause a virtual instruction exception."

With the concern being that it is possible for "implementation-specific
bounded time limit" to be infinite/never times out, and the kernel
enters a WRS where the reservation set is not required to be invalidated
for the condition we are waiting on to become true.

An option here would be to enforce in the spec that this time limit is
finite. If the original intention of the spec was to have it be finite,
then this would not be an issue. If the intention was to allow no time
limit, then this would probably have to be a new extension.

We are also able to change the kernel to not allow these conditions that
would break this interpretation of WRS. I found three instances in the
kernel that contain a condition that is not dependent on the wrs
reservation.

1.
# queued_spin_lock_slowpath() in kernel/locking/qspinlock.c
val = atomic_cond_read_relaxed(&lock->val,
			       (VAL != _Q_PENDING_VAL) || !cnt--);

The first condition will only become true if lock->val changes which
should invalidate the reservation. !cnt-- on the otherhand is a counter
of the number of loops that happen under-the-hood in
atomic_cond_read_relaxed. This seems like an abuse of the function and
could be factored out into a new bounded-iteration cond_read macro.

2.
# osq_lock() in kernel/locking/osq_lock.c
if (smp_cond_load_relaxed(&node->locked, VAL || need_resched() ||
			  vcpu_is_preempted(node_cpu(node->prev))))

VAL is the first condition and won't be a problem here since changes to
it will cause the reservation to become invalid. arm64 has hard-coded
vcpu_is_preempted to be false for the same exact reason that riscv would
want to (the wait wouldn't be woken up). There is a comment that
points this out in arch/arm64/include/asm/spinlock.h. riscv currently
uses the default implementation which returns false.

need_resched() should not be a problem since this condition only changes
when the hart recieves an IPI, so as long as the hart is able to receive
an IPI while in WRS it will be fine.

3.
# __arm_smmu_cmdq_poll_until_msi() in drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
smp_cond_load_relaxed(cmd, !VAL || (ret = queue_poll(&qp)));

arm driver, not relevant.



The only case that would cause a problem in the current implementation
of the kernel would be queued_spin_lock_slowpath() with the cnt check.
We are able to either change this definition, change the spec, or leave
it up to the vendor who would be hit by this issue to change it.

- Charlie


