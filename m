From: Marc Zyngier <maz@kernel.org>
Date: Fri, 25 Feb 2022 18:58:13 +0000
Subject: [PATCH v3 09/19] KVM: arm64: Implement PSCI SYSTEM_SUSPEND
In-Reply-To: <YhfeBfgbDA8IGc9f@google.com>
References: <20220223041844.3984439-1-oupton@google.com>
 <20220223041844.3984439-10-oupton@google.com>
 <87wnhk2whx.wl-maz@kernel.org> <YhfeBfgbDA8IGc9f@google.com>
Message-ID: <87fso63ha2.wl-maz@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 24 Feb 2022 19:35:33 +0000,
Oliver Upton <oupton@google.com> wrote:
> 
> Hi Marc,
> 
> Thanks for reviewing the series. ACK to the nits and smaller comments
> you've made, I'll incorporate that feedback in the next series.
> 
> On Thu, Feb 24, 2022 at 02:02:34PM +0000, Marc Zyngier wrote:
> > On Wed, 23 Feb 2022 04:18:34 +0000,
> > Oliver Upton <oupton@google.com> wrote:
> > > 
> > > ARM DEN0022D.b 5.19 "SYSTEM_SUSPEND" describes a PSCI call that allows
> > > software to request that a system be placed in the deepest possible
> > > low-power state. Effectively, software can use this to suspend itself to
> > > RAM. Note that the semantics of this PSCI call are very similar to
> > > CPU_SUSPEND, which is already implemented in KVM.
> > > 
> > > Implement the SYSTEM_SUSPEND in KVM. Similar to CPU_SUSPEND, the
> > > low-power state is implemented as a guest WFI. Synchronously reset the
> > > calling CPU before entering the WFI, such that the vCPU may immediately
> > > resume execution when a wakeup event is recognized.
> > > 
> > > Signed-off-by: Oliver Upton <oupton@google.com>
> > > ---
> > >  arch/arm64/kvm/psci.c  | 51 ++++++++++++++++++++++++++++++++++++++++++
> > >  arch/arm64/kvm/reset.c |  3 ++-
> > >  2 files changed, 53 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/arch/arm64/kvm/psci.c b/arch/arm64/kvm/psci.c
> > > index 77a00913cdfd..41adaaf2234a 100644
> > > --- a/arch/arm64/kvm/psci.c
> > > +++ b/arch/arm64/kvm/psci.c
> > > @@ -208,6 +208,50 @@ static void kvm_psci_system_reset(struct kvm_vcpu *vcpu)
> > >  	kvm_prepare_system_event(vcpu, KVM_SYSTEM_EVENT_RESET);
> > >  }
> > >  
> > > +static int kvm_psci_system_suspend(struct kvm_vcpu *vcpu)
> > > +{
> > > +	struct vcpu_reset_state reset_state;
> > > +	struct kvm *kvm = vcpu->kvm;
> > > +	struct kvm_vcpu *tmp;
> > > +	bool denied = false;
> > > +	unsigned long i;
> > > +
> > > +	reset_state.pc = smccc_get_arg1(vcpu);
> > > +	if (!kvm_ipa_valid(kvm, reset_state.pc)) {
> > > +		smccc_set_retval(vcpu, PSCI_RET_INVALID_ADDRESS, 0, 0, 0);
> > > +		return 1;
> > > +	}
> > > +
> > > +	reset_state.r0 = smccc_get_arg2(vcpu);
> > > +	reset_state.be = kvm_vcpu_is_be(vcpu);
> > > +	reset_state.reset = true;
> > > +
> > > +	/*
> > > +	 * The SYSTEM_SUSPEND PSCI call requires that all vCPUs (except the
> > > +	 * calling vCPU) be in an OFF state, as determined by the
> > > +	 * implementation.
> > > +	 *
> > > +	 * See ARM DEN0022D, 5.19 "SYSTEM_SUSPEND" for more details.
> > > +	 */
> > > +	mutex_lock(&kvm->lock);
> > > +	kvm_for_each_vcpu(i, tmp, kvm) {
> > > +		if (tmp != vcpu && !kvm_arm_vcpu_powered_off(tmp)) {
> > > +			denied = true;
> > > +			break;
> > > +		}
> > > +	}
> > > +	mutex_unlock(&kvm->lock);
> > 
> > This looks dodgy. Nothing seems to prevent userspace from setting the
> > mp_state to RUNNING in parallel with this, as only the vcpu mutex is
> > held when this ioctl is issued.
> > 
> > It looks to me that what you want is what lock_all_vcpus() does
> > (Alexandru has a patch moving it out of the vgic code as part of his
> > SPE series).
> > 
> > It is also pretty unclear what the interaction with userspace is once
> > you have released the lock. If the VMM starts a vcpu other than the
> > suspending one, what is its state? The spec doesn't see to help
> > here. I can see two options:
> > 
> > - either all the vcpus have the same reset state applied to them as
> >   they come up, unless they are started with CPU_ON by a vcpu that has
> >   already booted (but there is a single 'context_id' provided, and I
> >   fear this is going to confuse the OS)...
> > 
> > - or only the suspending vcpu can resume the system, and we must fail
> >   a change of mp_state for the other vcpus.
> > 
> > What do you think?
> 
> Definitely the latter. The documentation of SYSTEM_SUSPEND is quite
> shaky on this, but it would appear that the intention is for the caller
> to be the first CPU to wake up.

Yup. We now have clarification on the intent of the spec (only the
caller CPU can resume the system), and this needs to be tightened.

> 
> > > +
> > > +	if (denied) {
> > > +		smccc_set_retval(vcpu, PSCI_RET_DENIED, 0, 0, 0);
> > > +		return 1;
> > > +	}
> > > +
> > > +	__kvm_reset_vcpu(vcpu, &reset_state);
> > > +	kvm_vcpu_wfi(vcpu);
> > 
> > I have mixed feelings about this. The vcpu has reset before being in
> > WFI, while it really should be the other way around and userspace
> > could rely on observing the transition.
> > 
> > What breaks if you change this?
> 
> I don't think that userspace would be able to observe the transition
> even if we WFI before the reset.

I disagree. At any point can userspace issue a signal which would
trigger a return from WFI and an exit to userspace, and I don't think
this should result in a reset being observed.

This also means that SYSTEM_SUSPEND must be robust wrt signal
delivery, which it doesn't seem to be.

> I imagine that would take the form
> of setting KVM_REQ_VCPU_RESET, which we explicitly handle before
> letting userspace access the vCPU's state as of commit
> 6826c6849b46 ("KVM: arm64: Handle PSCI resets before userspace
> touches vCPU state").

In that case, the vcpu is ready to run, and is not blocked by
anything, so this is quite different.

>
> Given this, I felt it was probably best to avoid all the indirection and
> just do the vCPU reset in the handling of SYSTEM_SUSPEND. It does,
> however, imply that we have slightly different behavior when userspace
> exits are enabled, as that will happen pre-reset and pre-WFI.

And that's exactly the sort of behaviour I'd like to avoid if at all
possible. But maybe we don't need to support the standalone version
that doesn't involve userspace?

	M.

-- 
Without deviation from the norm, progress is not possible.

