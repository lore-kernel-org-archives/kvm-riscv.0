From: Sean Christopherson <seanjc@google.com>
Date: Fri, 13 Oct 2023 11:45:39 -0700
Subject: [RFC PATCH v12 07/33] KVM: Add KVM_EXIT_MEMORY_FAULT exit to
 report faults to userspace
In-Reply-To: <CALzav=csPcd3f5CYc=6Fa4JnsYP8UTVeSex0-7LvUBnTDpHxLQ@mail.gmail.com>
References: <20230914015531.1419405-8-seanjc@google.com> <117db856-9aec-e91c-b1d4-db2b90ae563d@intel.com>
 <ZQ3AmLO2SYv3DszH@google.com> <CAF7b7mrf-y9DNdsreOAedGJueOThnYE=ascFd4=rvW0Z4rhTQg@mail.gmail.com>
 <ZRtxoaJdVF1C2Mvy@google.com> <CAF7b7mqyU059YpBBVYjTMNXf9VHSc6tbKrQ8avFXYtP6LWMh8Q@mail.gmail.com>
 <ZRyn0nPQpbVpz8ah@google.com> <CAF7b7mqYr0J-J2oaU=c-dzLys-m6Ttp7ZOb3Em7n1wUj3rhh+A@mail.gmail.com>
 <ZR88w9W62qsZDro-@google.com> <CALzav=csPcd3f5CYc=6Fa4JnsYP8UTVeSex0-7LvUBnTDpHxLQ@mail.gmail.com>
Message-ID: <ZSmQUyfldIMMpx7X@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Oct 10, 2023, David Matlack wrote:
> On Thu, Oct 5, 2023 at 3:46?PM Sean Christopherson <seanjc@google.com> wrote:
> >
> > On Thu, Oct 05, 2023, Anish Moorthy wrote:
> > > On Tue, Oct 3, 2023 at 4:46?PM Sean Christopherson <seanjc@google.com> wrote:
> > > >
> > > > The only way a KVM_EXIT_MEMORY_FAULT that actually reaches userspace could be
> > > > "unreliable" is if something other than a memory_fault exit clobbered the union,
> > > > but didn't signal its KVM_EXIT_* reason.  And that would be an egregious bug that
> > > > isn't unique to KVM_EXIT_MEMORY_FAULT, i.e. the same data corruption would affect
> > > > each and every other KVM_EXIT_* reason.
> > >
> > > Keep in mind the case where an "unreliable" annotation sets up a
> > > KVM_EXIT_MEMORY_FAULT, KVM_RUN ends up continuing, then something
> > > unrelated comes up and causes KVM_RUN to EFAULT. Although this at
> > > least is a case of "outdated" information rather than blatant
> > > corruption.
> >
> > Drat, I managed to forget about that.
> >
> > > IIRC the last time this came up we said that there's minimal harm in
> > > userspace acting on the outdated info, but it seems like another good
> > > argument for just restricting the annotations to paths we know are
> > > reliable. What if the second EFAULT above is fatal (as I understand
> > > all are today) and sets up subsequent KVM_RUNs to crash and burn
> > > somehow? Seems like that'd be a safety issue.
> >
> > For your series, let's omit
> >
> >   KVM: Annotate -EFAULTs from kvm_vcpu_read/write_guest_page
> >
> > and just fill memory_fault for the page fault paths.  That will be easier to
> > document too since we can simply say that if the exit reason is KVM_EXIT_MEMORY_FAULT,
> > then run->memory_fault is valid and fresh.
> 
> +1
> 
> And from a performance perspective, I don't think we care about
> kvm_vcpu_read/write_guest_page(). Our (Google) KVM Demand Paging
> implementation just sends any kvm_vcpu_read/write_guest_page()
> requests through the netlink socket, which is just a poor man's
> userfaultfd. So I think we'll be fine sending these callsites through
> uffd instead of exiting out to userspace.
> 
> And with that out of the way, is there any reason to keep tying
> KVM_EXIT_MEMORY_FAULT to -EFAULT? As mentioned in the patch at the top
> of this thread, -EFAULT is just a hack to allow the emulator paths to
> return out to userspace. But that's no longer necessary.

Not forcing '0' makes handling other error codes simpler, e.g. if the memory is
poisoned, KVM can simply return -EHWPOISON instead of having to add a flag to
run->memory_fault[*].

KVM would also have to make returning '0' instead of -EFAULT conditional based on
a capability being enabled.

And again, committing to returning '0' will make it all but impossible to extend
KVM_EXIT_MEMORY_FAULT beyond the page fault handlers.  Well, I suppose we could
have the top level kvm_arch_vcpu_ioctl_run() do

	if (r == -EFAULT && vcpu->kvm->enable_memory_fault_exits &&
	    kvm_run->exit_reason == KVM_EXIT_MEMORY_FAULT)
		r = 0;

but that's quite gross IMO.

> I just find it odd that some KVM_EXIT_* correspond with KVM_RUN returning an
> error and others don't.

FWIW, there is already precedent for run->exit_reason being valid with a non-zero
error code.  E.g. KVM selftests relies on run->exit_reason being preserved when
forcing an immediate exit, which returns -EINTR, not '0'.

	if (kvm_run->immediate_exit) {
		r = -EINTR;
		goto out;
	}

And pre-immediate_exit code that relies on signalling vCPUs is even more explicit
in setting exit_reason with a non-zero errno:

		if (signal_pending(current)) {
			r = -EINTR;
			kvm_run->exit_reason = KVM_EXIT_INTR;
			++vcpu->stat.signal_exits;
		}

I agree that -EFAULT with KVM_EXIT_MEMORY_FAULT *looks* a little odd, but IMO the
existing KVM behavior of returning '0' is actually what's truly odd.  E.g. returning
'0' + KVM_EXIT_MMIO if the guest accesses non-existent memory is downright weird.
KVM_RUN should arguably never return '0', because it can never actual completely
succeed.

> The exit_reason is sufficient to tell userspace what's going on and has a
> firm contract, unlike -EFAULT which anything KVM calls into can return.

Eh, I don't think it lessens the contract in a meaningful way.  KVM is still
contractually obligated to fill run->exit_reason when KVM returns '0', and
userspace will still likely terminate the VM on an undocumented EFAULT/EHWPOISON.

E.g. if KVM has a bug and doesn't return KVM_EXIT_MEMORY_FAULT when handling a
page fault, then odds are very good that the bug would result in KVM returning a
"bare" -EFAULT regardless of whether KVM_EXIT_MEMORY_FAULT is paried with '0' or
-EFAULT.

[*] https://lore.kernel.org/all/ZQHzVOIsesTTysgf at google.com

