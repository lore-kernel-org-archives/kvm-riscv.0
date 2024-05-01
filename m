From: Oliver Upton <oliver.upton@linux.dev>
Date: Wed, 1 May 2024 18:01:31 +0000
Subject: [PATCH 0/4] KVM: Fold kvm_arch_sched_in() into
 kvm_arch_vcpu_load()
In-Reply-To: <ZjJRhQhX_12eBvY-@google.com>
References: <20240430193157.419425-1-seanjc@google.com>
 <ZjGMn5tlq8edKZYv@linux.dev>
 <ZjJRhQhX_12eBvY-@google.com>
Message-ID: <ZjKDe6SlVWGj0ugA@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, May 01, 2024 at 07:28:21AM -0700, Sean Christopherson wrote:
> On Wed, May 01, 2024, Oliver Upton wrote:
> > On Tue, Apr 30, 2024 at 12:31:53PM -0700, Sean Christopherson wrote:
> > > Drop kvm_arch_sched_in() and instead pass a @sched_in boolean to
> > > kvm_arch_vcpu_load().
> > > 
> > > While fiddling with an idea for optimizing state management on AMD CPUs,
> > > I wanted to skip re-saving certain host state when a vCPU is scheduled back
> > > in, as the state (theoretically) shouldn't change for the task while it's
> > > scheduled out.  Actually doing that was annoying and unnecessarily brittle
> > > due to having a separate API for the kvm_sched_in() case (the state save
> > > needed to be in kvm_arch_vcpu_load() for the common path).
> > > 
> > > E.g. I could have set a "temporary"-ish flag somewhere in kvm_vcpu, but (a)
> > > that's gross and (b) it would rely on the arbitrary ordering between
> > > sched_in() and vcpu_load() staying the same.
> > 
> > Another option would be to change the rules around kvm_arch_sched_in()
> > where the callee is expected to load the vCPU context.
> > 
> > The default implementation could just call kvm_arch_vcpu_load() directly
> > and the x86 implementation can order things the way it wants before
> > kvm_arch_vcpu_load().
> > 
> > I say this because ...
> > 
> > > The only real downside I see is that arm64 and riscv end up having to pass
> > > "false" for their direct usage of kvm_arch_vcpu_load(), and passing boolean
> > > literals isn't ideal.  But that can be solved by adding an inner helper that
> > > omits the @sched_in param (I almost added a patch to do that, but I couldn't
> > > convince myself it was necessary).
> > 
> > Needing to pass @sched_in for other usage of kvm_arch_vcpu_load() hurts
> > readability, especially when no other architecture besides x86 cares
> > about it.
> 
> Yeah, that bothers me too.
> 
> I tried your suggestion of having x86's kvm_arch_sched_in() do kvm_arch_vcpu_load(),
> and even with an added kvm_arch_sched_out() to provide symmetry, the x86 code is
> kludgy, and even the common code is a bit confusing as it's not super obvious
> that kvm_sched_{in,out}() is really just kvm_arch_vcpu_{load,put}().
> 
> Staring a bit more at the vCPU flags we have, adding a "bool scheduled_out" isn't
> terribly gross if it's done in common code and persists across load() and put(),
> i.e. isn't so blatantly a temporary field.  And because it's easy, it could be
> set with WRITE_ONCE() so that if it can be read cross-task if there's ever a
> reason to do so.
> 
> The x86 code ends up being less ugly, and adding future arch/vendor code for
> sched_in() *or* sched_out() requires minimal churn, e.g. arch code doesn't need
> to override kvm_arch_sched_in().
> 
> The only weird part is that vcpu->preempted and vcpu->ready have slightly
> different behavior, as they are cleared before kvm_arch_vcpu_load().  But the
> weirdness is really with those flags no having symmetry, not with scheduled_out
> itself.
> 
> Thoughts?

Yeah, this seems reasonable. Perhaps scheduled_out could be a nice hint
for guardrails / sanity checks in the future.

-- 
Thanks,
Oliver

