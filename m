From: Oliver Upton <oliver.upton@linux.dev>
Date: Wed, 1 May 2024 00:28:15 +0000
Subject: [PATCH 0/4] KVM: Fold kvm_arch_sched_in() into
 kvm_arch_vcpu_load()
In-Reply-To: <20240430193157.419425-1-seanjc@google.com>
References: <20240430193157.419425-1-seanjc@google.com>
Message-ID: <ZjGMn5tlq8edKZYv@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Apr 30, 2024 at 12:31:53PM -0700, Sean Christopherson wrote:
> Drop kvm_arch_sched_in() and instead pass a @sched_in boolean to
> kvm_arch_vcpu_load().
> 
> While fiddling with an idea for optimizing state management on AMD CPUs,
> I wanted to skip re-saving certain host state when a vCPU is scheduled back
> in, as the state (theoretically) shouldn't change for the task while it's
> scheduled out.  Actually doing that was annoying and unnecessarily brittle
> due to having a separate API for the kvm_sched_in() case (the state save
> needed to be in kvm_arch_vcpu_load() for the common path).
> 
> E.g. I could have set a "temporary"-ish flag somewhere in kvm_vcpu, but (a)
> that's gross and (b) it would rely on the arbitrary ordering between
> sched_in() and vcpu_load() staying the same.

Another option would be to change the rules around kvm_arch_sched_in()
where the callee is expected to load the vCPU context.

The default implementation could just call kvm_arch_vcpu_load() directly
and the x86 implementation can order things the way it wants before
kvm_arch_vcpu_load().

I say this because ...

> The only real downside I see is that arm64 and riscv end up having to pass
> "false" for their direct usage of kvm_arch_vcpu_load(), and passing boolean
> literals isn't ideal.  But that can be solved by adding an inner helper that
> omits the @sched_in param (I almost added a patch to do that, but I couldn't
> convince myself it was necessary).

Needing to pass @sched_in for other usage of kvm_arch_vcpu_load() hurts
readability, especially when no other architecture besides x86 cares
about it.

-- 
Thanks,
Oliver

