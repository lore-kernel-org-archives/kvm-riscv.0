From: Sean Christopherson <seanjc@google.com>
Date: Tue, 18 Jun 2024 14:41:24 -0700
Subject: [PATCH v3 0/3] KVM: Set vcpu->preempted/ready iff scheduled out
 while running
In-Reply-To: <20240503181734.1467938-1-dmatlack@google.com>
References: <20240503181734.1467938-1-dmatlack@google.com>
Message-ID: <171874683295.1901599.10170158200177384059.b4-ty@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 03 May 2024 11:17:31 -0700, David Matlack wrote:
> This series changes KVM to mark a vCPU as preempted/ready if-and-only-if
> it's scheduled out while running. i.e. Do not mark a vCPU
> preempted/ready if it's scheduled out during a non-KVM_RUN ioctl() or
> when userspace is doing KVM_RUN with immediate_exit=true.
> 
> This is a logical extension of commit 54aa83c90198 ("KVM: x86: do not
> set st->preempted when going back to user space"), which  stopped
> marking a vCPU as preempted when returning to userspace. But if userspace
> invokes a KVM vCPU ioctl() that gets preempted, the vCPU will be marked
> preempted/ready. This is arguably incorrect behavior since the vCPU was
> not actually preempted while the guest was running, it was preempted
> while doing something on behalf of userspace.
> 
> [...]

Applied to kvm-x86 generic, with minor changelog tweaks (me thinks you've been
away from upstream too long ;-) ).  Thanks!

[1/3] KVM: Introduce vcpu->wants_to_run
      https://github.com/kvm-x86/linux/commit/a6816314af57
[2/3] KVM: Ensure new code that references immediate_exit gets extra scrutiny
      https://github.com/kvm-x86/linux/commit/4b23e0c199b2
[3/3] KVM: Mark a vCPU as preempted/ready iff it's scheduled out while running
      https://github.com/kvm-x86/linux/commit/118964562969

--
https://github.com/kvm-x86/linux/tree/next

