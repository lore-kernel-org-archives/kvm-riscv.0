From: Oliver Upton <oupton@google.com>
Date: Sat, 26 Feb 2022 10:28:21 -0800
Subject: [PATCH v3 13/19] KVM: arm64: Add support KVM_SYSTEM_EVENT_SUSPEND
 to PSCI SYSTEM_SUSPEND
In-Reply-To: <8735k57tnx.wl-maz@kernel.org>
References: <20220223041844.3984439-1-oupton@google.com>
 <20220223041844.3984439-14-oupton@google.com>
 <87sfs82rz4.wl-maz@kernel.org> <YhflJ74nF2N+u1i4@google.com>
 <8735k57tnx.wl-maz@kernel.org>
Message-ID: <CAOQ_Qsi1n2PTGe3F5BAhy3yHS4ar_0n0tru7smAfwAFWGY3Jug@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Feb 26, 2022 at 3:29 AM Marc Zyngier <maz@kernel.org> wrote:
>
> On Thu, 24 Feb 2022 20:05:59 +0000,
> Oliver Upton <oupton@google.com> wrote:
> >
> > On Thu, Feb 24, 2022 at 03:40:15PM +0000, Marc Zyngier wrote:
> > > > diff --git a/arch/arm64/kvm/psci.c b/arch/arm64/kvm/psci.c
> > > > index 2bb8d047cde4..a7de84cec2e4 100644
> > > > --- a/arch/arm64/kvm/psci.c
> > > > +++ b/arch/arm64/kvm/psci.c
> > > > @@ -245,6 +245,11 @@ static int kvm_psci_system_suspend(struct kvm_vcpu *vcpu)
> > > >           return 1;
> > > >   }
> > > >
> > > > + if (kvm->arch.system_suspend_exits) {
> > > > +         kvm_vcpu_set_system_event_exit(vcpu, KVM_SYSTEM_EVENT_SUSPEND);
> > > > +         return 0;
> > > > + }
> > > > +
> > >
> > > So there really is a difference in behaviour here. Userspace sees the
> > > WFI behaviour before reset (it implements it), while when not using
> > > the SUSPEND event, reset occurs before anything else.
> > >
> > > They really should behave in a similar way (WFI first, reset next).
> >
> > I mentioned this on the other patch, but I think the conversation should
> > continue here as UAPI context is in this one.
> >
> > If SUSPEND exits are disabled and SYSTEM_SUSPEND is implemented in the
> > kernel, userspace cannot observe any intermediate state. I think it is
> > necessary for migration, otherwise if userspace were to save the vCPU
> > post-WFI, pre-reset the pending reset would get lost along the way.
> >
> > As far as userspace is concerned, I think the WFI+reset operation is
> > atomic. SUSPEND exits just allow userspace to intervene before said
> > atomic operation.
> >
> > Perhaps I'm missing something: assuming SUSPEND exits are disabled, what
> > value is provided to userspace if it can see WFI behavior before the
> > reset?
>
> Signals get in the way, and break the notion of atomicity. Userspace
> *will* observe this.
>
> I agree that save/restore is an important point, and that snapshoting
> the guest at this stage should capture the reset value. But it is the
> asymmetry of the behaviours that I find jarring:
>
> - if you ask for userspace exit, no reset value is applied and you
>   need to implement the reset in userspace
>
> - if you *don't* ask for a userspace exit, the reset values are
>   applied, and a signal while in WFI will result in this reset being
>   observed
>
> Why can't the userspace exit path also apply the reset values *before*
> exiting? After all, you can model this exit to userspace as
> reset+WFI+'spurious exit from WFI'. This would at least unify the two
> behaviours.

I hesitated applying the reset context to the CPU before the userspace
exit because that would be wildly different from the other system
events. Userspace wouldn't have much choice but to comply with the
guest request at that point.

What about adopting the following:

 - Drop the in-kernel SYSTEM_SUSPEND emulation. I think you were
getting at this point in [1], and I'd certainly be open to it. Without
a userspace exit, I don't think there is anything meaningfully
different between this call and a WFI instruction.

 - Add data to the kvm_run structure to convey the reset state for a
SYSTEM_SUSPEND exit. There's plenty of room left in the structure for
more, and can be done generically (just an array of data) for future
expansion. We already are going to need a code change in userspace to
do this right, so may as well update its view of kvm_run along the
way.

 - Exit to userspace with PSCI_RET_INTERNAL_FAILURE queued up for the
guest. Doing so keeps the exits consistent with the other system
exits, and affords userspace the ability to deny the call when it
wants to.

[1]: http://lore.kernel.org/r/87fso63ha2.wl-maz at kernel.org

> I still dislike the reset state being applied early, but consistency
> (and save/restore) trumps taste here. I know I'm being pedantic here,
> but we've been burned with loosely defined semantics in the past, and
> I want to get this right. Or less wrong.

I completely agree with you. The semantics are a bit funky, and I
really do wonder if the easiest way around that is to just make the
implementation a userspace problem.

--
Oliver

