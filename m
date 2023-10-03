From: Sean Christopherson <seanjc@google.com>
Date: Tue, 3 Oct 2023 13:51:52 -0700
Subject: [RFC PATCH v12 11/33] KVM: Introduce per-page memory attributes
In-Reply-To: <CA+EHjTzx+0pxh7DYONZUeJsm1GCiC6L8Vg_Tm9MLVEae-FKuQg@mail.gmail.com>
References: <20230914015531.1419405-1-seanjc@google.com> <20230914015531.1419405-12-seanjc@google.com>
 <CA+EHjTzSUXx8P9gWmUERg4owxH6r6yNPm1_RL-BzS_2CNPtRKw@mail.gmail.com>
 <ZRw6X2BptZnRPNK7@google.com> <CA+EHjTzx+0pxh7DYONZUeJsm1GCiC6L8Vg_Tm9MLVEae-FKuQg@mail.gmail.com>
Message-ID: <ZRx-6F6NSd9QU8QT@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Oct 03, 2023, Fuad Tabba wrote:
> On Tue, Oct 3, 2023 at 4:59?PM Sean Christopherson <seanjc@google.com> wrote:
> > On Tue, Oct 03, 2023, Fuad Tabba wrote:
> > > > +#define KVM_MEMORY_ATTRIBUTE_PRIVATE           (1ULL << 3)
> > > > +
> > >
> > > In pKVM, we don't want to allow setting (or clearing) of PRIVATE/SHARED
> > > attributes from userspace.
> >
> > Why not?  The whole thing falls apart if userspace doesn't *know* the state of a
> > page, and the only way for userspace to know the state of a page at a given moment
> > in time is if userspace controls the attributes.  E.g. even if KVM were to provide
> > a way for userspace to query attributes, the attributes exposed to usrspace would
> > become stale the instant KVM drops slots_lock (or whatever lock protects the attributes)
> > since userspace couldn't prevent future changes.
> 
> I think I might not quite understand the purpose of the
> KVM_SET_MEMORY_ATTRIBUTES ABI. In pKVM, all of a protected guest's memory is
> private by default, until the guest shares it with the host (via a
> hypercall), or another guest (future work). When the guest shares it,
> userspace is notified via KVM_EXIT_HYPERCALL. In many use cases, userspace
> doesn't need to keep track directly of all of this, but can reactively un/map
> the memory being un/shared.

Yes, and then userspace needs to tell KVM, via KVM_SET_MEMORY_ATTRIBUTES, that
userspace has agreed to change the state of the page.  Userspace may not need/want
to explicitly track the state of pages, but userspace still needs to tell KVM what
userspace wants.

KVM is primarily an accelerator, e.g. KVM's role is to make things go fast (relative
to doing things in userspace) and provide access to resources/instructions that
require elevated privileges.  As a general rule, we try to avoid defining the vCPU
model, security policies, etc. in KVM, because hardcoding policy into KVM (and the
kernel as a whole) eventually limits the utility of KVM.

As it pertains to PRIVATE vs. SHARED, KVM's role is to define and enforce the basic
rules, but KVM shouldn't do things like define when it is (il)legal to convert
memory to/from SHARED, what pages can be converted, what happens if the guest and
userspace disagree, etc.

> > Why does pKVM need to prevent userspace from stating *its* view of attributes?
> >
> > If the goal is to reduce memory overhead, that can be solved by using an internal,
> > non-ABI attributes flag to track pKVM's view of SHARED vs. PRIVATE.  If the guest
> > attempts to access memory where pKVM and userspace don't agree on the state,
> > generate an exit to userspace.  Or kill the guest.  Or do something else entirely.
> 
> For the pKVM hypervisor the guest's view of the attributes doesn't
> matter. The hypervisor at the end of the day is the ultimate arbiter
> for what is shared and with how. For pKVM (at least in my port of
> guestmem), we use the memory attributes from guestmem essentially to
> control which memory can be mapped by the host.

The guest's view absolutely matters.  The guest's view may not be expressed at
access time, e.g. as you note below, pKVM and other software-protected VMs don't
have a dedicated shared vs. private bit like TDX and SNP.  But the view is still
there, e.g. in the pKVM model, the guest expresses its desire for shared vs.
private via hypercall, and IIRC, the guest's view is tracked by the hypervisor
in the stage-2 PTEs.  pKVM itself may track the guest's view on things, but the
view is still the guest's.

E.g. if the guest thinks a page is private, but in reality KVM and host userspace
have it as shared, then the guest may unintentionally leak data to the untrusted
world.

IIUC, you have implemented guest_memfd support in pKVM by changing the attributes
when the guest makes the hypercall.  This can work, but only so long as the guest
and userspace are well-behaved, and it will likely paint pKVM into a corner in
the long run.

E.g. if the guest makes a hypercall to convert memory to PRIVATE, but there is
no memslot or the memslot doesn't support private memory, then unless there is
policy baked into KVM, or an ABI for the guest<=>host hypercall interface that
allows unwinding the program counter, you're stuck.  Returning an error for the
hypercall straight from KVM is undesirable as that would put policy into KVM that
doesn't need to be there, e.g. that would prevent userspace from manipulating
memslots in response to (un)share requests from the guest.  It's a similar story
if KVM marks the page as PRIVATE, as that would prevent userspace from returning
an error for the hypercall, i.e. would prevent usersepace from denying the request
to convert to PRIVATE.

> One difference between pKVM and TDX (as I understand it), is that TDX
> uses the msb of the guest's IPA to indicate whether memory is shared
> or private, and that can generate a mismatch on guest memory access
> between what it thinks the state is, and what the sharing state in
> reality is. pKVM doesn't have that. Memory is private by default, and
> can be shared in-place, both in the guest's IPA space as well as the
> underlying physical page.

TDX's shared bit and SNP's encryption bit are just a means of hardware enforcement.
pKVM does have a hardware bit because hardware doesn't provide any enforcement.
But as above, pKVM does have an equivalent *somewhere*.

> > > The other thing, which we need for pKVM anyway, is to make
> > > kvm_vm_set_mem_attributes() global, so that it can be called from outside of
> > > kvm_main.c (already have a local patch for this that declares it in
> > > kvm_host.h),
> >
> > That's no problem, but I am definitely opposed to KVM modifying attributes that
> > are owned by userspace.
> >
> > > and not gate this function by KVM_GENERIC_MEMORY_ATTRIBUTES.
> >
> > As above, I am opposed to pKVM having a completely different ABI for managing
> > PRIVATE vs. SHARED.  I have no objection to pKVM using unclaimed flags in the
> > attributes to store extra metadata, but if KVM_SET_MEMORY_ATTRIBUTES doesn't work
> > for pKVM, then we've failed miserably and should revist the uAPI.
> 
> Like I said, pKVM doesn't need a userspace ABI for managing PRIVATE/SHARED,
> just a way of tracking in the host kernel of what is shared (as opposed to
> the hypervisor, which already has the knowledge). The solution could simply
> be that pKVM does not enable KVM_GENERIC_MEMORY_ATTRIBUTES, has its own
> tracking of the status of the guest pages, and only selects KVM_PRIVATE_MEM.

At the risk of overstepping my bounds, I think that effectively giving the guest
full control over what is shared vs. private is a mistake.  It more or less locks
pKVM into a single model, and even within that model, dealing with errors and/or
misbehaving guests becomes unnecessarily problematic.

Using KVM_SET_MEMORY_ATTRIBUTES may not provide value *today*, e.g. the userspace
side of pKVM could simply "reflect" all conversion hypercalls, and terminate the
VM on errors.  But the cost is very minimal, e.g. a single extra ioctl() per
converion, and the upside is that pKVM won't be stuck if a use case comes along
that wants to go beyond "all conversion requests either immediately succeed or
terminate the guest".

