From: David Matlack <dmatlack@google.com>
Date: Tue, 10 Oct 2023 15:21:37 -0700
Subject: [RFC PATCH v12 07/33] KVM: Add KVM_EXIT_MEMORY_FAULT exit to
 report faults to userspace
In-Reply-To: <ZR88w9W62qsZDro-@google.com>
References: <20230914015531.1419405-1-seanjc@google.com> <20230914015531.1419405-8-seanjc@google.com>
 <117db856-9aec-e91c-b1d4-db2b90ae563d@intel.com> <ZQ3AmLO2SYv3DszH@google.com>
 <CAF7b7mrf-y9DNdsreOAedGJueOThnYE=ascFd4=rvW0Z4rhTQg@mail.gmail.com>
 <ZRtxoaJdVF1C2Mvy@google.com> <CAF7b7mqyU059YpBBVYjTMNXf9VHSc6tbKrQ8avFXYtP6LWMh8Q@mail.gmail.com>
 <ZRyn0nPQpbVpz8ah@google.com> <CAF7b7mqYr0J-J2oaU=c-dzLys-m6Ttp7ZOb3Em7n1wUj3rhh+A@mail.gmail.com>
 <ZR88w9W62qsZDro-@google.com>
Message-ID: <CALzav=csPcd3f5CYc=6Fa4JnsYP8UTVeSex0-7LvUBnTDpHxLQ@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Oct 5, 2023 at 3:46?PM Sean Christopherson <seanjc@google.com> wrote:
>
> On Thu, Oct 05, 2023, Anish Moorthy wrote:
> > On Tue, Oct 3, 2023 at 4:46?PM Sean Christopherson <seanjc@google.com> wrote:
> > >
> > > The only way a KVM_EXIT_MEMORY_FAULT that actually reaches userspace could be
> > > "unreliable" is if something other than a memory_fault exit clobbered the union,
> > > but didn't signal its KVM_EXIT_* reason.  And that would be an egregious bug that
> > > isn't unique to KVM_EXIT_MEMORY_FAULT, i.e. the same data corruption would affect
> > > each and every other KVM_EXIT_* reason.
> >
> > Keep in mind the case where an "unreliable" annotation sets up a
> > KVM_EXIT_MEMORY_FAULT, KVM_RUN ends up continuing, then something
> > unrelated comes up and causes KVM_RUN to EFAULT. Although this at
> > least is a case of "outdated" information rather than blatant
> > corruption.
>
> Drat, I managed to forget about that.
>
> > IIRC the last time this came up we said that there's minimal harm in
> > userspace acting on the outdated info, but it seems like another good
> > argument for just restricting the annotations to paths we know are
> > reliable. What if the second EFAULT above is fatal (as I understand
> > all are today) and sets up subsequent KVM_RUNs to crash and burn
> > somehow? Seems like that'd be a safety issue.
>
> For your series, let's omit
>
>   KVM: Annotate -EFAULTs from kvm_vcpu_read/write_guest_page
>
> and just fill memory_fault for the page fault paths.  That will be easier to
> document too since we can simply say that if the exit reason is KVM_EXIT_MEMORY_FAULT,
> then run->memory_fault is valid and fresh.

+1

And from a performance perspective, I don't think we care about
kvm_vcpu_read/write_guest_page(). Our (Google) KVM Demand Paging
implementation just sends any kvm_vcpu_read/write_guest_page()
requests through the netlink socket, which is just a poor man's
userfaultfd. So I think we'll be fine sending these callsites through
uffd instead of exiting out to userspace.

And with that out of the way, is there any reason to keep tying
KVM_EXIT_MEMORY_FAULT to -EFAULT? As mentioned in the patch at the top
of this thread, -EFAULT is just a hack to allow the emulator paths to
return out to userspace. But that's no longer necessary. I just find
it odd that some KVM_EXIT_* correspond with KVM_RUN returning an error
and others don't. The exit_reason is sufficient to tell userspace
what's going on and has a firm contract, unlike -EFAULT which anything
KVM calls into can return.

>
> Adding a flag or whatever to mark the data as trustworthy would be the alternative,
> but that's effectively adding ABI that says "KVM is buggy, sorry".
>
> My dream of having KVM always return useful information for -EFAULT will have to
> wait for another day.

