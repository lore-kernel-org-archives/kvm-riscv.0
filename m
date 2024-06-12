From: Sean Christopherson <seanjc@google.com>
Date: Tue, 11 Jun 2024 18:18:27 -0700
Subject: [PATCH v2 0/6] KVM: Fold kvm_arch_sched_in() into kvm_arch_vcpu_load()
In-Reply-To: <20240522014013.1672962-1-seanjc@google.com>
References: <20240522014013.1672962-1-seanjc@google.com>
Message-ID: <171813751765.307375.7908491276602596005.b4-ty@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, 21 May 2024 18:40:07 -0700, Sean Christopherson wrote:
> Drop kvm_arch_sched_in() and instead add and use kvm_vcpu.scheduled_out
> to communicate to kvm_arch_vcpu_load() that the vCPU is being scheduling
> back in.
> 
> While fiddling with an idea for optimizing state management on AMD CPUs,
> I wanted to skip re-saving certain host state when a vCPU is scheduled back
> in, as the state (theoretically) shouldn't change for the task while it's
> scheduled out.  Actually doing that was annoying and unnecessarily brittle
> due to having a separate API for the kvm_sched_in() case (the state save
> needed to be in kvm_arch_vcpu_load() for the common path).
> 
> [...]

Applied to kvm-x86 generic, thanks!

[1/6] KVM: Add a flag to track if a loaded vCPU is scheduled out
      https://github.com/kvm-x86/linux/commit/d1ae567fb8b5
[2/6] KVM: VMX: Move PLE grow/shrink helpers above vmx_vcpu_load()
      https://github.com/kvm-x86/linux/commit/5d9c07febb86
[3/6] KVM: x86: Fold kvm_arch_sched_in() into kvm_arch_vcpu_load()
      https://github.com/kvm-x86/linux/commit/8fbb696a8f53
[4/6] KVM: Delete the now unused kvm_arch_sched_in()
      https://github.com/kvm-x86/linux/commit/2a27c4314007
[5/6] KVM: x86: Unconditionally set l1tf_flush_l1d during vCPU load
      https://github.com/kvm-x86/linux/commit/ef2e18ef3750
[6/6] KVM: x86: Drop now-superflous setting of l1tf_flush_l1d in vcpu_run()
      https://github.com/kvm-x86/linux/commit/3dee3b187499

--
https://github.com/kvm-x86/linux/tree/next

