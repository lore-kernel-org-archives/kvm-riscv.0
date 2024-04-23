From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 23 Apr 2024 15:42:47 -0400
Subject: [PATCH v2 2/6] dt-bindings: riscv: Add Zawrs ISA extension
 description
In-Reply-To: <Zif3VZALGtLtl3D3@ghost>
References: <20240419135321.70781-8-ajones@ventanamicro.com>
 <20240419135321.70781-10-ajones@ventanamicro.com>
 <20240419-chafe-leotard-e5daee19b1c8@spud>
 <20240419-8c6af6a169a7aa0b9aa5cac5@orel>
 <20240419-disdain-litmus-82874cc4872e@spud>
 <ZiKeYRnXxtLUtkkW@ghost>
 <20240421-f63f90c2146deb0695b84441@orel>
 <ZibmfbLnGCb9gmow@ghost>
 <20240423-ed9ddb701be1df4a25e29f31@orel>
 <Zif3VZALGtLtl3D3@ghost>
Message-ID: <ZigPN/iJ/gLT4DOD@ghost>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Apr 23, 2024 at 02:00:53PM -0400, Charlie Jenkins wrote:
> On Tue, Apr 23, 2024 at 10:46:01AM +0200, Andrew Jones wrote:
> > On Mon, Apr 22, 2024 at 06:36:45PM -0400, Charlie Jenkins wrote:
> > > On Sun, Apr 21, 2024 at 12:20:03PM +0200, Andrew Jones wrote:
> > > > On Fri, Apr 19, 2024 at 12:40:01PM -0400, Charlie Jenkins wrote:
> > ...
> > > > > What would be the purpose of a vendor implementing WRS.NTO (and putting
> > > > > it in the DT) that never terminates? The spec says "Then a subsequent
> > > > > WRS.NTO instruction would cause the hart to temporarily stall execution
> > > > > in a low- power state until a store occurs to the reservation set or an
> > > > > interrupt is observed." Why is this wording for WRS.NTO not sufficient
> > > > > to assume that an implementation of this instruction would eventually
> > > > > terminate?
> > > > >
> > > > 
> > > > We can invoke smp_cond_load_relaxed(addr, VAL || anything_we_want()). This
> > > > means we may not expect VAL ever to be written, which rules out "until a
> > > > store occurs". As for "an interrupt is observed", we don't know which one
> > > > to expect to arrive within a "reasonable" amount of time. We need to know
> > > > which one(s), since, while wrs.nto will terminate even when interrupts are
> > > > globally disabled, we still need to have the interrupt(s) we expect to be
> > > > locally enabled. And, the interrupts should arrive in a "reasonable"
> > > > amount of time since we want to poll anything_we_want() at a "reasonable"
> > > > frequency.
> > > > 
> > > > So, we need firmware to promise to enable exceptions if there aren't any
> > > > such interrupts. Or, we could require hardware descriptions to identify
> > > > which interrupt(s) would be good to have enabled before calling wrs.nto.
> > > > Maybe there's already some way to describe something like that?
> > > > 
> > > > Thanks,
> > > > drew
> > > 
> > > Ahh okay I am caught up now. So the wording we are looking at in the
> > > spec is:
> > > 
> > > "When executing in VS or VU mode, if the VTW bit is set in hstatus, the
> > > TW bit in mstatus is clear, and the WRS.NTO does not complete within an
> > > implementation-specific bounded time limit, the WRS.NTO instruction will
> > > cause a virtual instruction exception."
> > 
> > That's what the hypervisor should promise to do when there's no other
> > guarantee of wrs.nto terminating (but the hypervisor likely wants to
> > anyway since it wants guests to trap on wrs.nto in order to potentially
> > schedule the lock holding VCPU). The firmware of the host should likewise
> > promise to set mstatus.TW when there's no guarantee of wrs.nto
> > terminating, but that's likely _not_ something it normally would want to
> > do, so hopefully there will always be implementation-specific "other
> > reasons" which guarantee termination.
> > 
> > > 
> > > With the concern being that it is possible for "implementation-specific
> > > bounded time limit" to be infinite/never times out,
> > 
> > The implementation-defined short timeout cannot be infinite, but it only
> > applies to wrs.sto. While using wrs.sto would relieve the concern, it
> > cannot be configured to raise exceptions, which means it's not useful in
> > guests. If we want to use wrs.sto in hosts and wrs.nto in guests then we
> > need a paravirt channel which allows an "enlightened" guest to determine
> > that it is a guest and that the hypervisor has configured wrs.nto to
> > trap, which then indicates it's a good idea to patch wrs.sto to wrs.nto.
> > But, adding paravirt stuff should be avoided whenever possible since it
> > adds complexity we'd rather not maintain.
> > 
> 
> That still wouldn't solve this issue, because the wrs.nto guest may still
> never wakeup in the implementation-specific way?
> 
> > > and the kernel
> > > enters a WRS where the reservation set is not required to be invalidated
> > > for the condition we are waiting on to become true.
> > > 
> > > An option here would be to enforce in the spec that this time limit is
> > > finite. If the original intention of the spec was to have it be finite,
> > > then this would not be an issue. If the intention was to allow no time
> > > limit, then this would probably have to be a new extension.
> > 
> > wrs.nto has been specified to never timeout.
> > wrs.sto has been specified to never raise exceptions.
> > 
> > If we had an instruction which would timeout when mstatus.TW/hstatus.VTW
> > is clear and raise exceptions when set, then that's the one we'd choose.
> > 
> 
> Yes, this does seem like the ideal situtation.
> 
> > > 
> > > We are also able to change the kernel to not allow these conditions that
> > > would break this interpretation of WRS. I found three instances in the
> > > kernel that contain a condition that is not dependent on the wrs
> > > reservation.
> > > 
> > > 1.
> > > # queued_spin_lock_slowpath() in kernel/locking/qspinlock.c
> > > val = atomic_cond_read_relaxed(&lock->val,
> > > 			       (VAL != _Q_PENDING_VAL) || !cnt--);
> > > 
> > > The first condition will only become true if lock->val changes which
> > > should invalidate the reservation. !cnt-- on the otherhand is a counter
> > > of the number of loops that happen under-the-hood in
> > > atomic_cond_read_relaxed. This seems like an abuse of the function and
> > > could be factored out into a new bounded-iteration cond_read macro.
> > > 
> > > 2.
> > > # osq_lock() in kernel/locking/osq_lock.c
> > > if (smp_cond_load_relaxed(&node->locked, VAL || need_resched() ||
> > > 			  vcpu_is_preempted(node_cpu(node->prev))))
> > > 
> > > VAL is the first condition and won't be a problem here since changes to
> > > it will cause the reservation to become invalid. arm64 has hard-coded
> > > vcpu_is_preempted to be false for the same exact reason that riscv would
> > > want to (the wait wouldn't be woken up). There is a comment that
> > > points this out in arch/arm64/include/asm/spinlock.h. riscv currently
> > > uses the default implementation which returns false.
> > 
> > The operative word is 'currently'. I plan to eventually get riscv's
> > vcpu_is_preempted() working since we already laid the groundwork by
> > adding a preempted flag to the SBI STA struct.
> > 
> > > 
> > > need_resched() should not be a problem since this condition only changes
> > > when the hart recieves an IPI, so as long as the hart is able to receive
> > > an IPI while in WRS it will be fine.
> > > 
> > > 3.
> > > # __arm_smmu_cmdq_poll_until_msi() in drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > > smp_cond_load_relaxed(cmd, !VAL || (ret = queue_poll(&qp)));
> > > 
> > > arm driver, not relevant.
> > > 
> > > 
> > > 
> > > The only case that would cause a problem in the current implementation
> > > of the kernel would be queued_spin_lock_slowpath() with the cnt check.
> > > We are able to either change this definition, change the spec, or leave
> > > it up to the vendor who would be hit by this issue to change it.
> > 
> > We could attempt to document restrictions on the condition given to
> > smp_cond_load_relaxed() and then change the callers to honor those
> > restrictions, but that doesn't sound too easy. How will we remove
> > vcpu_is_preempted() on x86?
> 
> The solution here seems like it would be to not use wrs for riscv in
> this case.  We really would need an alternate extension that allows wrs
> in a guest to be guaranteed to trap into the host at some point. 

Thinking about this a bit more, this is a performance penalty and not a
correctness issue. This line is an optimization that allows the lock
holder to jump the queue if the holder directly in front is a preempted
vcpu. Eventually the vcpu will be scheduled again and give up the lock.
So an implementation of WRS.NTO that does not have the
"implementation-specific bounded time limit" that the spec calls out for
WRS.NTO to raise a virtual instruction exception, would still function,
just slower.

I am not sure where the line we would draw here. Using WRS here would be
very beneficial for most implementations, but will not be optimally
efficient on some implementations of WRS in virtualization. We could
make a note that for optimal efficiency Linux recommends that a virtual
instruction exception is eventually thrown.

We also wouldn't need to mess with the cnt variable since that can only
increase during a loop by the thread that is doing the loop. It is an
optimization to break out early. Again this is purely performance. If
the implementation never breaks out without the lock variable being
changed, it will just wait until the variable is changed rather than
breaking out early.

- Charlie

> 
> > 
> > We should probably start the process of a new extension which has the
> > hybrid wrs.sto/nto instruction, but I'm reluctant to, since, in practice,
> > the current wrs.nto is probably fine. I don't really expect there to be
> > implementations that never terminate, even though I'd rather we document
> > that it's _required_ wrs.nto terminates, or that exceptions be raised.
> > Maybe I'm attempting to document it in the wrong place though. Maybe this
> > is more of a Documentation/arch/riscv/boot.rst type of thing.
> > 
> 
> wrs.nto is most likely sufficient. A new extension will take a long
> time. We could go ahead with wrs.nto, propose the extension, and when
> the extension is ready switch over to it. In the meantime have this
> behavior documented.
> 
> > Thanks,
> > drew
> 
> - Charlie
> 

