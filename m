From: Andrew Jones <ajones@ventanamicro.com>
Date: Wed, 24 Apr 2024 12:32:04 +0200
Subject: [PATCH v2 2/6] dt-bindings: riscv: Add Zawrs ISA extension
 description
In-Reply-To: <CAEg0e7gYteAbHyQCvodO=Mh20qpW4oM9Lm42efNJvz=9muQO-g@mail.gmail.com>
References: <20240419-8c6af6a169a7aa0b9aa5cac5@orel>
 <20240419-disdain-litmus-82874cc4872e@spud>
 <ZiKeYRnXxtLUtkkW@ghost>
 <20240421-f63f90c2146deb0695b84441@orel>
 <ZibmfbLnGCb9gmow@ghost>
 <20240423-ed9ddb701be1df4a25e29f31@orel>
 <Zif3VZALGtLtl3D3@ghost>
 <ZigPN/iJ/gLT4DOD@ghost>
 <20240424-0e571b29835610c24409762b@orel>
 <CAEg0e7gYteAbHyQCvodO=Mh20qpW4oM9Lm42efNJvz=9muQO-g@mail.gmail.com>
Message-ID: <20240424-c24522c332fcaced37339045@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Apr 24, 2024 at 11:23:00AM +0200, Christoph M?llner wrote:
> On Wed, Apr 24, 2024 at 9:34?AM Andrew Jones <ajones@ventanamicro.com> wrote:
> >
> > On Tue, Apr 23, 2024 at 03:42:47PM -0400, Charlie Jenkins wrote:
> > > On Tue, Apr 23, 2024 at 02:00:53PM -0400, Charlie Jenkins wrote:
> > > > On Tue, Apr 23, 2024 at 10:46:01AM +0200, Andrew Jones wrote:
> > > > > On Mon, Apr 22, 2024 at 06:36:45PM -0400, Charlie Jenkins wrote:
> > > > > > On Sun, Apr 21, 2024 at 12:20:03PM +0200, Andrew Jones wrote:
> > > > > > > On Fri, Apr 19, 2024 at 12:40:01PM -0400, Charlie Jenkins wrote:
> > > > > ...
> > > > > > > > What would be the purpose of a vendor implementing WRS.NTO (and putting
> > > > > > > > it in the DT) that never terminates? The spec says "Then a subsequent
> > > > > > > > WRS.NTO instruction would cause the hart to temporarily stall execution
> > > > > > > > in a low- power state until a store occurs to the reservation set or an
> > > > > > > > interrupt is observed." Why is this wording for WRS.NTO not sufficient
> > > > > > > > to assume that an implementation of this instruction would eventually
> > > > > > > > terminate?
> > > > > > > >
> > > > > > >
> > > > > > > We can invoke smp_cond_load_relaxed(addr, VAL || anything_we_want()). This
> > > > > > > means we may not expect VAL ever to be written, which rules out "until a
> > > > > > > store occurs". As for "an interrupt is observed", we don't know which one
> > > > > > > to expect to arrive within a "reasonable" amount of time. We need to know
> > > > > > > which one(s), since, while wrs.nto will terminate even when interrupts are
> > > > > > > globally disabled, we still need to have the interrupt(s) we expect to be
> > > > > > > locally enabled. And, the interrupts should arrive in a "reasonable"
> > > > > > > amount of time since we want to poll anything_we_want() at a "reasonable"
> > > > > > > frequency.
> > > > > > >
> > > > > > > So, we need firmware to promise to enable exceptions if there aren't any
> > > > > > > such interrupts. Or, we could require hardware descriptions to identify
> > > > > > > which interrupt(s) would be good to have enabled before calling wrs.nto.
> > > > > > > Maybe there's already some way to describe something like that?
> > > > > > >
> > > > > > > Thanks,
> > > > > > > drew
> > > > > >
> > > > > > Ahh okay I am caught up now. So the wording we are looking at in the
> > > > > > spec is:
> > > > > >
> > > > > > "When executing in VS or VU mode, if the VTW bit is set in hstatus, the
> > > > > > TW bit in mstatus is clear, and the WRS.NTO does not complete within an
> > > > > > implementation-specific bounded time limit, the WRS.NTO instruction will
> > > > > > cause a virtual instruction exception."
> > > > >
> > > > > That's what the hypervisor should promise to do when there's no other
> > > > > guarantee of wrs.nto terminating (but the hypervisor likely wants to
> > > > > anyway since it wants guests to trap on wrs.nto in order to potentially
> > > > > schedule the lock holding VCPU). The firmware of the host should likewise
> > > > > promise to set mstatus.TW when there's no guarantee of wrs.nto
> > > > > terminating, but that's likely _not_ something it normally would want to
> > > > > do, so hopefully there will always be implementation-specific "other
> > > > > reasons" which guarantee termination.
> > > > >
> > > > > >
> > > > > > With the concern being that it is possible for "implementation-specific
> > > > > > bounded time limit" to be infinite/never times out,
> > > > >
> > > > > The implementation-defined short timeout cannot be infinite, but it only
> > > > > applies to wrs.sto. While using wrs.sto would relieve the concern, it
> > > > > cannot be configured to raise exceptions, which means it's not useful in
> > > > > guests. If we want to use wrs.sto in hosts and wrs.nto in guests then we
> > > > > need a paravirt channel which allows an "enlightened" guest to determine
> > > > > that it is a guest and that the hypervisor has configured wrs.nto to
> > > > > trap, which then indicates it's a good idea to patch wrs.sto to wrs.nto.
> > > > > But, adding paravirt stuff should be avoided whenever possible since it
> > > > > adds complexity we'd rather not maintain.
> > > > >
> > > >
> > > > That still wouldn't solve this issue, because the wrs.nto guest may still
> > > > never wakeup in the implementation-specific way?
> >
> > The paravirt approach does solve it, because wrs.nto is specified to raise
> > exceptions after an implementation-specific bounded time limit when the
> > hypervisor sets hstatus.VTW.
> >
> > >
> > > Thinking about this a bit more, this is a performance penalty and not a
> > > correctness issue.
> >
> > It's incorrect to have a design that is likely to result in bad
> > performance.
> >
> > > This line is an optimization that allows the lock
> > > holder to jump the queue if the holder directly in front is a preempted
> > > vcpu. Eventually the vcpu will be scheduled again and give up the lock.
> > > So an implementation of WRS.NTO that does not have the
> > > "implementation-specific bounded time limit" that the spec calls out for
> > > WRS.NTO to raise a virtual instruction exception, would still function,
> > > just slower.
> >
> > The problem isn't specific to virtualization. The problem is using wrs.nto
> > when it has not been configured to raise exceptions and there are not any
> > other guaranteed termination events (other than the reservation set
> > becoming invalid). While the paravirt solution is virtualization specific,
> > it works, because we would then only use wrs.nto when we know we can, and
> > otherwise use wrs.sto. But, as I said, I'd rather not have a paravirt
> > solution.
> 
> Andrew, it would be great if you could summarize this finding to the
> spec authors.
> Maybe a non-normative text added to the spec (that raises awareness
> for the issue

Sure, I'll write something up pointing out the concern with wrs.nto and
post it to a few RVI mailing lists.

> and provides a guideline to avoid it) could reduce the risk of triggering
> the issue on real HW. This might be enough justification to use WRS.NTO.
> 
> If WRS.NTO is considered as not reliable enough to wake up and therefore causing
> performance issues or CPU stalls if used for the spin lock optimization,
> it might be also reasonable to use WRS.STO instead.
> The cost of having too many wakeups seems much more acceptable than
> a stalled CPU.

wrs.sto is reasonable to use in all cases, since too many wakeups isn't
a concern. But, we can do better in the virtualization case with wrs.nto,
where the hypervisor can get involved, so, to avoid paravirt stuff, we'd
like to be able to always use wrs.nto.

Thanks,
drew

