From: Oliver Upton <oliver.upton@linux.dev>
Date: Wed, 22 May 2024 08:16:07 -0700
Subject: [PATCH v2 1/6] KVM: Add a flag to track if a loaded vCPU is
 scheduled out
In-Reply-To: <20240522014013.1672962-2-seanjc@google.com>
References: <20240522014013.1672962-1-seanjc@google.com>
 <20240522014013.1672962-2-seanjc@google.com>
Message-ID: <Zk4MN49212SaW1_z@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, May 21, 2024 at 06:40:08PM -0700, Sean Christopherson wrote:
> Add a kvm_vcpu.scheduled_out flag to track if a vCPU is in the process of
> being scheduled out (vCPU put path), or if the vCPU is being reloaded
> after being scheduled out (vCPU load path).  In the short term, this will
> allow dropping kvm_arch_sched_in(), as arch code can query scheduled_out
> during kvm_arch_vcpu_load().
> 
> Longer term, scheduled_out opens up other potential optimizations, without
> creating subtle/brittle dependencies.  E.g. it allows KVM to keep guest
> state (that is managed via kvm_arch_vcpu_{load,put}()) loaded across
> kvm_sched_{out,in}(), if KVM knows the state isn't accessed by the host
> kernel.  Forcing arch code to coordinate between kvm_arch_sched_{in,out}()
> and kvm_arch_vcpu_{load,put}() is awkward, not reusable, and relies on the
> exact ordering of calls into arch code.
> 
> Adding scheduled_out also obviates the need for a kvm_arch_sched_out()
> hook, e.g. if arch code needs to do something novel when putting vCPU
> state.
> 
> And even if KVM never uses scheduled_out for anything beyond dropping
> kvm_arch_sched_in(), just being able to remove all of the arch stubs makes
> it worth adding the flag.
> 
> Link: https://lore.kernel.org/all/20240430224431.490139-1-seanjc at google.com
> Cc: Oliver Upton <oliver.upton@linux.dev>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Oliver Upton <oliver.upton@linux.dev>

-- 
Thanks,
Oliver

