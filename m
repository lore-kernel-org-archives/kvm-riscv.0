From: Sean Christopherson <seanjc@google.com>
Date: Mon, 2 Oct 2023 18:42:57 -0700
Subject: [RFC PATCH v12 07/33] KVM: Add KVM_EXIT_MEMORY_FAULT exit to
 report faults to userspace
In-Reply-To: <CAF7b7mrf-y9DNdsreOAedGJueOThnYE=ascFd4=rvW0Z4rhTQg@mail.gmail.com>
References: <20230914015531.1419405-1-seanjc@google.com> <20230914015531.1419405-8-seanjc@google.com>
 <117db856-9aec-e91c-b1d4-db2b90ae563d@intel.com> <ZQ3AmLO2SYv3DszH@google.com>
 <CAF7b7mrf-y9DNdsreOAedGJueOThnYE=ascFd4=rvW0Z4rhTQg@mail.gmail.com>
Message-ID: <ZRtxoaJdVF1C2Mvy@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Oct 02, 2023, Anish Moorthy wrote:
> On Fri, Sep 22, 2023 at 9:28?AM Sean Christopherson <seanjc@google.com> wrote:
> >
> > > So when exit reason is KVM_EXIT_MEMORY_FAULT, how can we tell which field in
> > > the first union is valid?
> >
> > /facepalm
> >
> > At one point, I believe we had discussed a second exit reason field?  But yeah,
> > as is, there's no way for userspace to glean anything useful from the first union.
> 
> Oh, was this an objective? When I was pushing for the second union
> this I was just trying to make sure all the efault annotations
> wouldn't clobber *other* exits. But yeah, I don't/didn't see a
> meaningful way to have valid information in both structs.

Clobbering other exits means KVM is already broken, because simply accessing memory
in guest context after initiating an exit is a KVM bug as it would violate ordering
and maybe causality.   E.g. the only reason the preemption case (see below) isn't
completely buggy is specifically because it's host paravirt behavior.

In other words, ignoring preemption for the moment, not clobbering other exits isn't
useful because whatever buggy KVM behavior caused the clobbering already happened,
i.e. the VM is already in trouble either way.  The only realistic options are to fix
the KVM bugs, or to effectively take an errata and say "don't do that" (like we've
done for the silly PUSHD to MMIO case).

> > The more I think about this, the more I think it's a fool's errand.  Even if KVM
> > provides the exit_reason history, userspace can't act on the previous, unfulfilled
> > exit without *knowing* that it's safe/correct to process the previous exit.  I
> > don't see how that's remotely possible.
> >
> > Practically speaking, there is one known instance of this in KVM, and it's a
> > rather riduclous edge case that has existed "forever".  I'm very strongly inclined
> > to do nothing special, and simply treat clobbering an exit that userspace actually
> > cares about like any other KVM bug.
> >
> > > When exit reason is not KVM_EXIT_MEMORY_FAULT, how can we know the info in
> > > the second union run.memory is valid without a run.memory.valid field?
> >
> > Anish's series adds a flag in kvm_run.flags to track whether or not memory_fault
> > has been filled.  The idea is that KVM would clear the flag early in KVM_RUN, and
> > then set the flag when memory_fault is first filled.
> >
> >         /* KVM_CAP_MEMORY_FAULT_INFO flag for kvm_run.flags */
> >         #define KVM_RUN_MEMORY_FAULT_FILLED (1 << 8)
> >
> > I didn't propose that flag here because clobbering memory_fault from the page
> > fault path would be a flagrant KVM bug.
> >
> > Honestly, I'm becoming more and more skeptical that separating memory_fault is
> > worthwhile, or even desirable.  Similar to memory_fault clobbering something else,
> > userspace can only take action if memory_fault is clobbered if userspace somehow
> > knows that it's safe/correct to do so.
> >
> > Even if KVM exits "immediately" after initially filling memory_fault, the fact
> > that KVM is exiting for a different reason (or a different memory fault) means
> > that KVM did *something* between filling memory_fault and actually exiting.  And
> > it's completely impossible for usersepace to know what that "something" was.
> 
> Are you describing a scenario in which memory_fault is (initially)
> filled, then something else happens to fill memory_fault (thus
> clobbering it), then KVM_RUN exits? I'm confused by the tension
> between the "KVM exits 'immediately'" and "KVM did *something* between
> filling memory_fault and actually existing" statements here.

Yes, I'm describing a hypothetical scenario.  Immediately was in quotes because
even if KVM returns from the *current* function straightaway, it's possible that
control is deep in a call stack, i.e. KVM may "immediately" try to exit from the
current function's perspective, but in reality it may take a while to actually
get out to userspace.

> > > E.g. in the splat from selftests[1], KVM reacts to a failure during Real Mode
> > event injection by synthesizing a triple fault
> >
> >         ret = emulate_int_real(ctxt, irq);
> >
> >         if (ret != X86EMUL_CONTINUE) {
> >                 kvm_make_request(KVM_REQ_TRIPLE_FAULT, vcpu);
> >
> > There are multiple KVM bugs at play: read_emulate() and write_emulate() incorrectly
> > assume *all* failures should be treated like MMIO, and conversely ->read_std() and
> > ->write_std() don't handle *any* failures as MMIO.
> >
> > Circling back to my "capturing the history is pointless" assertion, by the time
> > userspace gets an exit, the vCPU is already in shutdown, and KVM has clobbered
> > memory_fault something like five times.  There is zero chance userspace can do
> > anything but shed a tear for the VM and move on.
> >
> > The whole "let's annotate all memory faults" idea came from my desire to push KVM
> > towards a future where all -EFAULT exits are annotated[2].  I still think we should
> > point KVM in that general direction, i.e. implement something that _can_ provide
> > 100% "coverage" in the future, even though we don't expect to get there anytime soon.
> >
> > I bring that up because neither private memory nor userfault-on-missing needs to
> > annotate anything other than -EFAULT during guest page faults.  I.e. all of this
> > paranoia about clobbering memory_fault isn't actually buying us anything other
> > than noise and complexity.  The cases we need to work _today_ are perfectly fine,
> > and _if_ some future use cases needs all/more paths to be 100% accurate, then the
> > right thing to do is to make whatever changes are necessary for KVM to be 100%
> > accurate.
> >
> > In other words, trying to gracefully handle memory_fault clobbering is pointless.
> > KVM either needs to guarantee there's no clobbering (guest page fault paths) or
> > treat the annotation as best effort and informational-only (everything else at
> > this time).  Future features may grow the set of paths that needs strong guarantees,
> > but that just means fixing more paths and treating any violation of the contract
> > like any other KVM bug.
> 
> Ok, so if we're restricting the exit to just the places it's totally
> accurate (page-fault paths) then, IIUC,
> 
> - There's no reason to attach it to EFAULT, ie it becomes a "normal" exit

No, I still want at least partial line of sight to being able to provide useful
information to userspace on EFAULT.  Making KVM_EXIT_MEMORY_FAULT a "normal" exit
pretty much squashes any hope of that.

> - I should go drop the patches annotating kvm_vcpu_read/write_page
> from my series

Hold up on that.  I'd prefer to keep them as there's still value in giving userspace
debug information.  All I'm proposing is that we would firmly state in the
documentation that those paths must be treated as informational-only.

The whole kvm_steal_time_set_preempted() mess does give me pause though.  That
helper isn't actually problematic, but only because it uses copy_to_user_nofault()
directly :-/

But that doesn't necessarily mean we need to abandon the entire idea, e.g. it
might not be a terrible idea to explicitly differentiate accesses to guest memory
for paravirt stuff, from accesses to guest memory on behalf of the guest.

Anyways, don't do anything just yet.

> - The helper function [a] for filling the memory_fault field
> (downgraded back into the current union) can drop the "has the field
> already been filled?" check/WARN.

That would need to be dropped regardless because it's user-triggered (sadly).

> - [KVM_CAP_USERFAULT_ON_MISSING] The memslot flag check [b] needs to
> be moved back from __gfn_to_pfn_memslot() into
> user_mem_abort()/kvm_handle_error_pfn() since the slot flag-triggered
> fast-gup failures *have* to result in the memory fault exits, and we
> only want to do those in the two SLAT-failure paths (for now).

I'll look at this more closely when I review your series (slowly, slowly getting
there).  There's no right or wrong answer here, it's more a question of what's the
easiest to maintain.

> [a] https://lore.kernel.org/all/20230908222905.1321305-5-amoorthy at google.com/
> [b] https://lore.kernel.org/all/20230908222905.1321305-11-amoorthy at google.com/
> 
> > And if we stop being unnecessarily paranoid, KVM_RUN_MEMORY_FAULT_FILLED can also
> > go away.  The flag came about in part because *unconditionally* sanitizing
> > kvm_run.exit_reason at the start of KVM_RUN would break KVM's ABI, as userspace
> > may rely on the exit_reason being preserved when calling back into KVM to complete
> > userspace I/O (or MMIO)[3].  But the goal is purely to avoid exiting with stale
> > memory_fault information, not to sanitize every other existing exit_reason, and
> > that can be achieved by simply making the reset conditional.
> >
> > ...
> >
> > diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> > index 96fc609459e3..d78e97b527e5 100644
> > --- a/virt/kvm/kvm_main.c
> > +++ b/virt/kvm/kvm_main.c
> > @@ -4450,6 +4450,16 @@ static long kvm_vcpu_ioctl(struct file *filp,
> >                                 synchronize_rcu();
> >                         put_pid(oldpid);
> >                 }
> > +
> > +               /*
> > +                * Reset the exit reason if the previous userspace exit was due
> > +                * to a memory fault.  Not all -EFAULT exits are annotated, and
> > +                * so leaving exit_reason set to KVM_EXIT_MEMORY_FAULT could
> > +                * result in feeding userspace stale information.
> > +                */
> > +               if (vcpu->run->exit_reason == KVM_EXIT_MEMORY_FAULT)
> > +                       vcpu->run->exit_reason = KVM_EXIT_UNKNOWN
> > +
> >                 r = kvm_arch_vcpu_ioctl_run(vcpu);
> 
> Under my reading of the earlier block I'm not sure why we need to keep
> this around. The original idea behind a canary of this type was to
> avoid stomping on non-memory-fault exits in cases where something
> caused an (ignored) annotated memory fault before the exit could be
> completed. But if the annotations are going to be restricted in
> general to just the page fault paths, then we can just eliminate the
> sentinel check (and just this block) entirely, right?

This isn't a canary, it's to ensure KVM doesn't feed userspace garbage.  As above,
I'm not saying we throw away all of the code for the "optional" paths, I'm saying
that we only commit to 100% accuracy for the paths that the two use cases need to
work, i.e. the page fault handlers.

