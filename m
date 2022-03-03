From: Marc Zyngier <maz@kernel.org>
Date: Thu, 03 Mar 2022 11:37:35 +0000
Subject: [PATCH v3 09/19] KVM: arm64: Implement PSCI SYSTEM_SUSPEND
In-Reply-To: <YiATdBvHOvlTzhIF@google.com>
References: <20220223041844.3984439-1-oupton@google.com>
 <20220223041844.3984439-10-oupton@google.com>
 <87wnhk2whx.wl-maz@kernel.org> <YhfeBfgbDA8IGc9f@google.com>
 <87fso63ha2.wl-maz@kernel.org> <YiATdBvHOvlTzhIF@google.com>
Message-ID: <87wnhb1d34.wl-maz@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 03 Mar 2022 01:01:40 +0000,
Oliver Upton <oupton@google.com> wrote:
> 
>
> I'm beginning to wonder if the VMM/KVM split implementation of
> system-scoped PSCI calls can ever be right. There exists a critical
> section in all system-wide PSCI calls that currently spans an exit to
> userspace. I cannot devise a sane way to guard such a critical section
> when we are returning control to userspace.
> 
> For example, KVM offlines all of the CPUs except for the exiting CPU
> when handling SYSTEM_RESET or SYSTEM_OFF, but nothing prevents an
> interleaving KVM_ARM_VCPU_INIT or KVM_SET_MP_STATE from disturbing the
> state of the VM. Couldn't even say its a userspace bug, either, because
> a different vCPU could do something before the caller has exited. Even
> if we grab all the vCPU mutexes, we'd need to drop them before exiting
> to userspace.
> 
> If userspace decides to reject the PSCI call, we're giving control
> back to the guest in a wildly different state than it had making the
> PSCI call. Again, the PSCI spec is vague on this matter, but I believe
> the intuitive answer is that we should not change the VM state if the call
> is rejected. This could upset an otherwise well-behaved KVM guest.

Sure. But this is the equivalent of a buggy firmware/hardware, and a
failing PSCI reboot is likely to have had destructive effects. Is it
nice? Absolutely not. Is it a problem in practice? It hasn't in the
10+ years this API has been implemented.

The alternative is to be able to forward all the PSCI events to
userspace and let it deal with it. It has long been at the back of my
mind to allow userspace to request ranges of hypercalls to be
forwarded directly, without any in-kernel handling. I'm all for it,
but this must be a buy-in from the VMM.

> Doing SYSTEM_SUSPEND in userspace is better, as KVM avoids mucking with
> the VM state before the PSCI call is actually accepted. However, any of
> the consistency checks in the kernel for SYSTEM_SUSPEND are entirely
> moot. Anything can happen between the exit to userspace and the moment
> userspace actually recognizes the SYSTEM_SUSPEND call on the exiting
> CPU.

I agree. Maybe we just don't do any and only exit to userspace on the
calling vcpu. It then becomes the responsibility of userspace to take
the other vcpus out of the kernel and change their state if required.

> 
> KVM rejecting attempts to resume vCPUs besides the caller will break
> a correct userspace, given the inherent race that crops up when exiting.
> Blocking attempts to resume other vCPUs could have unintented
> consequences as well. It seems that we'd need to prevent
> KVM_ARM_VCPU_INIT calls as well as KVM_SET_MP_STATE, even though the
> former could be used in a valid SYSTEM_SUSPEND implementation.

I don't think we need to enforce this if we leave suspend entirely to
userspace. At the end of the day, we rely on the VMM not to screw up
the guest. If the VMM restarts the wrong vcpu, that's bad behaviour,
but there are a million other ways for the VMM to mess the guess up.

> I really do hate to go back to the drawing board on the PSCI stuff
> again, but there seems to be a fundamental issue in how system-scoped
> calls are handled. Userspace is probably the only place where we could
> quiesce the VM state, assess if the PSCI call should be accepted, and
> change the VM state.
>
> Do you think all of this is an issue as well?

I don't think we should worry too much about the other system events.
They are now ABI, and changing them is tricky. For suspend, I think
punting the whole thing to userspace is doable. Otherwise, the
alternative is to implement full userspace PSCI support, which is
going to be a lot of work (and a lot of ABI discussions...).

Thanks,

	M.

-- 
Without deviation from the norm, progress is not possible.

