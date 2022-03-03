From: Oliver Upton <oupton@google.com>
Date: Thu, 3 Mar 2022 01:01:40 +0000
Subject: [PATCH v3 09/19] KVM: arm64: Implement PSCI SYSTEM_SUSPEND
In-Reply-To: <87fso63ha2.wl-maz@kernel.org>
References: <20220223041844.3984439-1-oupton@google.com>
 <20220223041844.3984439-10-oupton@google.com>
 <87wnhk2whx.wl-maz@kernel.org> <YhfeBfgbDA8IGc9f@google.com>
 <87fso63ha2.wl-maz@kernel.org>
Message-ID: <YiATdBvHOvlTzhIF@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Feb 25, 2022 at 06:58:13PM +0000, Marc Zyngier wrote:
> On Thu, 24 Feb 2022 19:35:33 +0000,
> Oliver Upton <oupton@google.com> wrote:
> > 
> > Hi Marc,
> > 
> > Thanks for reviewing the series. ACK to the nits and smaller comments
> > you've made, I'll incorporate that feedback in the next series.
> > 
> > On Thu, Feb 24, 2022 at 02:02:34PM +0000, Marc Zyngier wrote:
> > > On Wed, 23 Feb 2022 04:18:34 +0000,
> > > Oliver Upton <oupton@google.com> wrote:
> > > > 
> > > > ARM DEN0022D.b 5.19 "SYSTEM_SUSPEND" describes a PSCI call that allows
> > > > software to request that a system be placed in the deepest possible
> > > > low-power state. Effectively, software can use this to suspend itself to
> > > > RAM. Note that the semantics of this PSCI call are very similar to
> > > > CPU_SUSPEND, which is already implemented in KVM.
> > > > 
> > > > Implement the SYSTEM_SUSPEND in KVM. Similar to CPU_SUSPEND, the
> > > > low-power state is implemented as a guest WFI. Synchronously reset the
> > > > calling CPU before entering the WFI, such that the vCPU may immediately
> > > > resume execution when a wakeup event is recognized.
> > > > 
> > > > Signed-off-by: Oliver Upton <oupton@google.com>
> > > > ---
> > > >  arch/arm64/kvm/psci.c  | 51 ++++++++++++++++++++++++++++++++++++++++++
> > > >  arch/arm64/kvm/reset.c |  3 ++-
> > > >  2 files changed, 53 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/arch/arm64/kvm/psci.c b/arch/arm64/kvm/psci.c
> > > > index 77a00913cdfd..41adaaf2234a 100644
> > > > --- a/arch/arm64/kvm/psci.c
> > > > +++ b/arch/arm64/kvm/psci.c
> > > > @@ -208,6 +208,50 @@ static void kvm_psci_system_reset(struct kvm_vcpu *vcpu)
> > > >  	kvm_prepare_system_event(vcpu, KVM_SYSTEM_EVENT_RESET);
> > > >  }
> > > >  
> > > > +static int kvm_psci_system_suspend(struct kvm_vcpu *vcpu)
> > > > +{
> > > > +	struct vcpu_reset_state reset_state;
> > > > +	struct kvm *kvm = vcpu->kvm;
> > > > +	struct kvm_vcpu *tmp;
> > > > +	bool denied = false;
> > > > +	unsigned long i;
> > > > +
> > > > +	reset_state.pc = smccc_get_arg1(vcpu);
> > > > +	if (!kvm_ipa_valid(kvm, reset_state.pc)) {
> > > > +		smccc_set_retval(vcpu, PSCI_RET_INVALID_ADDRESS, 0, 0, 0);
> > > > +		return 1;
> > > > +	}
> > > > +
> > > > +	reset_state.r0 = smccc_get_arg2(vcpu);
> > > > +	reset_state.be = kvm_vcpu_is_be(vcpu);
> > > > +	reset_state.reset = true;
> > > > +
> > > > +	/*
> > > > +	 * The SYSTEM_SUSPEND PSCI call requires that all vCPUs (except the
> > > > +	 * calling vCPU) be in an OFF state, as determined by the
> > > > +	 * implementation.
> > > > +	 *
> > > > +	 * See ARM DEN0022D, 5.19 "SYSTEM_SUSPEND" for more details.
> > > > +	 */
> > > > +	mutex_lock(&kvm->lock);
> > > > +	kvm_for_each_vcpu(i, tmp, kvm) {
> > > > +		if (tmp != vcpu && !kvm_arm_vcpu_powered_off(tmp)) {
> > > > +			denied = true;
> > > > +			break;
> > > > +		}
> > > > +	}
> > > > +	mutex_unlock(&kvm->lock);
> > > 
> > > This looks dodgy. Nothing seems to prevent userspace from setting the
> > > mp_state to RUNNING in parallel with this, as only the vcpu mutex is
> > > held when this ioctl is issued.
> > > 
> > > It looks to me that what you want is what lock_all_vcpus() does
> > > (Alexandru has a patch moving it out of the vgic code as part of his
> > > SPE series).
> > > 
> > > It is also pretty unclear what the interaction with userspace is once
> > > you have released the lock. If the VMM starts a vcpu other than the
> > > suspending one, what is its state? The spec doesn't see to help
> > > here. I can see two options:
> > > 
> > > - either all the vcpus have the same reset state applied to them as
> > >   they come up, unless they are started with CPU_ON by a vcpu that has
> > >   already booted (but there is a single 'context_id' provided, and I
> > >   fear this is going to confuse the OS)...
> > > 
> > > - or only the suspending vcpu can resume the system, and we must fail
> > >   a change of mp_state for the other vcpus.
> > > 
> > > What do you think?
> > 
> > Definitely the latter. The documentation of SYSTEM_SUSPEND is quite
> > shaky on this, but it would appear that the intention is for the caller
> > to be the first CPU to wake up.
> 
> Yup. We now have clarification on the intent of the spec (only the
> caller CPU can resume the system), and this needs to be tightened.
> 

I'm beginning to wonder if the VMM/KVM split implementation of
system-scoped PSCI calls can ever be right. There exists a critical
section in all system-wide PSCI calls that currently spans an exit to
userspace. I cannot devise a sane way to guard such a critical section
when we are returning control to userspace.

For example, KVM offlines all of the CPUs except for the exiting CPU
when handling SYSTEM_RESET or SYSTEM_OFF, but nothing prevents an
interleaving KVM_ARM_VCPU_INIT or KVM_SET_MP_STATE from disturbing the
state of the VM. Couldn't even say its a userspace bug, either, because
a different vCPU could do something before the caller has exited. Even
if we grab all the vCPU mutexes, we'd need to drop them before exiting
to userspace.

If userspace decides to reject the PSCI call, we're giving control
back to the guest in a wildly different state than it had making the
PSCI call. Again, the PSCI spec is vague on this matter, but I believe
the intuitive answer is that we should not change the VM state if the call
is rejected. This could upset an otherwise well-behaved KVM guest.

Doing SYSTEM_SUSPEND in userspace is better, as KVM avoids mucking with
the VM state before the PSCI call is actually accepted. However, any of
the consistency checks in the kernel for SYSTEM_SUSPEND are entirely
moot. Anything can happen between the exit to userspace and the moment
userspace actually recognizes the SYSTEM_SUSPEND call on the exiting
CPU.

KVM rejecting attempts to resume vCPUs besides the caller will break
a correct userspace, given the inherent race that crops up when exiting.
Blocking attempts to resume other vCPUs could have unintented
consequences as well. It seems that we'd need to prevent
KVM_ARM_VCPU_INIT calls as well as KVM_SET_MP_STATE, even though the
former could be used in a valid SYSTEM_SUSPEND implementation.

I really do hate to go back to the drawing board on the PSCI stuff
again, but there seems to be a fundamental issue in how system-scoped
calls are handled. Userspace is probably the only place where we could
quiesce the VM state, assess if the PSCI call should be accepted, and
change the VM state.

Do you think all of this is an issue as well?

--
Oliver

