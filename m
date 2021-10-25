From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 25 Oct 2021 16:13:59 +0200
Subject: [PATCH v2 00/43] KVM: Halt-polling and x86 APICv overhaul
In-Reply-To: <20211009021236.4122790-1-seanjc@google.com>
References: <20211009021236.4122790-1-seanjc@google.com>
Message-ID: <614858dd-106c-64cc-04bc-f1887b2054d1@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 09/10/21 04:11, Sean Christopherson wrote:
> This is basically two series smushed into one.  The first "half" aims
> to differentiate between "halt" and a more generic "block", where "halt"
> aligns with x86's HLT instruction, the halt-polling mechanisms, and
> associated stats, and "block" means any guest action that causes the vCPU
> to block/wait.
> 
> The second "half" overhauls x86's APIC virtualization code (Posted
> Interrupts on Intel VMX, AVIC on AMD SVM) to do their updates in response
> to vCPU (un)blocking in the vcpu_load/put() paths, keying off of the
> vCPU's rcuwait status to determine when a blocking vCPU is being put and
> reloaded.  This idea comes from arm64's kvm_timer_vcpu_put(), which I
> stumbled across when diving into the history of arm64's (un)blocking hooks.
> 
> The x86 APICv overhaul allows for killing off several sets of hooks in
> common KVM and in x86 KVM (to the vendor code).  Moving everything to
> vcpu_put/load() also realizes nice cleanups, especially for the Posted
> Interrupt code, which required some impressive mental gymnastics to
> understand how vCPU task migration interacted with vCPU blocking.
> 
> Non-x86 folks, sorry for the noise.  I'm hoping the common parts can get
> applied without much fuss so that future versions can be x86-only.
> 
> v2:
>   - Collect reviews. [Christian, David]
>   - Add patch to move arm64 WFI functionality out of hooks. [Marc]
>   - Add RISC-V to the fun.
>   - Add all the APICv fun.
> 
> v1: https://lkml.kernel.org/r/20210925005528.1145584-1-seanjc at google.com
> 
> Jing Zhang (1):
>    KVM: stats: Add stat to detect if vcpu is currently blocking
> 
> Sean Christopherson (42):
>    KVM: VMX: Don't unblock vCPU w/ Posted IRQ if IRQs are disabled in
>      guest
>    KVM: SVM: Ensure target pCPU is read once when signalling AVIC
>      doorbell
>    KVM: s390: Ensure kvm_arch_no_poll() is read once when blocking vCPU
>    KVM: Force PPC to define its own rcuwait object
>    KVM: Update halt-polling stats if and only if halt-polling was
>      attempted
>    KVM: Refactor and document halt-polling stats update helper
>    KVM: Reconcile discrepancies in halt-polling stats
>    KVM: s390: Clear valid_wakeup in kvm_s390_handle_wait(), not in arch
>      hook
>    KVM: Drop obsolete kvm_arch_vcpu_block_finish()
>    KVM: arm64: Move vGIC v4 handling for WFI out arch callback hook
>    KVM: Don't block+unblock when halt-polling is successful
>    KVM: x86: Tweak halt emulation helper names to free up kvm_vcpu_halt()
>    KVM: Rename kvm_vcpu_block() => kvm_vcpu_halt()
>    KVM: Split out a kvm_vcpu_block() helper from kvm_vcpu_halt()
>    KVM: Don't redo ktime_get() when calculating halt-polling
>      stop/deadline
>    KVM: x86: Directly block (instead of "halting") UNINITIALIZED vCPUs
>    KVM: x86: Invoke kvm_vcpu_block() directly for non-HALTED wait states
>    KVM: Add helpers to wake/query blocking vCPU
>    KVM: VMX: Skip Posted Interrupt updates if APICv is hard disabled
>    KVM: VMX: Clean up PI pre/post-block WARNs
>    KVM: VMX: Drop unnecessary PI logic to handle impossible conditions
>    KVM: VMX: Use boolean returns for Posted Interrupt "test" helpers
>    KVM: VMX: Drop pointless PI.NDST update when blocking
>    KVM: VMX: Save/restore IRQs (instead of CLI/STI) during PI pre/post
>      block
>    KVM: VMX: Read Posted Interrupt "control" exactly once per loop
>      iteration
>    KVM: VMX: Move Posted Interrupt ndst computation out of write loop
>    KVM: VMX: Remove vCPU from PI wakeup list before updating PID.NV
>    KVM: VMX: Handle PI wakeup shenanigans during vcpu_put/load
>    KVM: Drop unused kvm_vcpu.pre_pcpu field
>    KVM: Move x86 VMX's posted interrupt list_head to vcpu_vmx
>    KVM: VMX: Move preemption timer <=> hrtimer dance to common x86
>    KVM: x86: Unexport LAPIC's switch_to_{hv,sw}_timer() helpers
>    KVM: x86: Remove defunct pre_block/post_block kvm_x86_ops hooks
>    KVM: SVM: Signal AVIC doorbell iff vCPU is in guest mode
>    KVM: SVM: Don't bother checking for "running" AVIC when kicking for
>      IPIs
>    KVM: SVM: Unconditionally mark AVIC as running on vCPU load (with
>      APICv)
>    KVM: Drop defunct kvm_arch_vcpu_(un)blocking() hooks
>    KVM: VMX: Don't do full kick when triggering posted interrupt "fails"
>    KVM: VMX: Wake vCPU when delivering posted IRQ even if vCPU == this
>      vCPU
>    KVM: VMX: Pass desired vector instead of bool for triggering posted
>      IRQ
>    KVM: VMX: Fold fallback path into triggering posted IRQ helper
>    KVM: VMX: Don't do full kick when handling posted interrupt wakeup
> 
>   arch/arm64/include/asm/kvm_emulate.h |   2 +
>   arch/arm64/include/asm/kvm_host.h    |   1 -
>   arch/arm64/kvm/arch_timer.c          |   5 +-
>   arch/arm64/kvm/arm.c                 |  60 +++---
>   arch/arm64/kvm/handle_exit.c         |   5 +-
>   arch/arm64/kvm/psci.c                |   2 +-
>   arch/mips/include/asm/kvm_host.h     |   3 -
>   arch/mips/kvm/emulate.c              |   2 +-
>   arch/powerpc/include/asm/kvm_host.h  |   4 +-
>   arch/powerpc/kvm/book3s_pr.c         |   2 +-
>   arch/powerpc/kvm/book3s_pr_papr.c    |   2 +-
>   arch/powerpc/kvm/booke.c             |   2 +-
>   arch/powerpc/kvm/powerpc.c           |   5 +-
>   arch/riscv/include/asm/kvm_host.h    |   1 -
>   arch/riscv/kvm/vcpu_exit.c           |   2 +-
>   arch/s390/include/asm/kvm_host.h     |   4 -
>   arch/s390/kvm/interrupt.c            |   3 +-
>   arch/s390/kvm/kvm-s390.c             |   7 +-
>   arch/x86/include/asm/kvm-x86-ops.h   |   4 -
>   arch/x86/include/asm/kvm_host.h      |  29 +--
>   arch/x86/kvm/lapic.c                 |   4 +-
>   arch/x86/kvm/svm/avic.c              |  95 ++++-----
>   arch/x86/kvm/svm/svm.c               |   8 -
>   arch/x86/kvm/svm/svm.h               |  14 --
>   arch/x86/kvm/vmx/nested.c            |   2 +-
>   arch/x86/kvm/vmx/posted_intr.c       | 279 ++++++++++++---------------
>   arch/x86/kvm/vmx/posted_intr.h       |  14 +-
>   arch/x86/kvm/vmx/vmx.c               |  63 +++---
>   arch/x86/kvm/vmx/vmx.h               |   3 +
>   arch/x86/kvm/x86.c                   |  55 ++++--
>   include/linux/kvm_host.h             |  27 ++-
>   include/linux/kvm_types.h            |   1 +
>   virt/kvm/async_pf.c                  |   2 +-
>   virt/kvm/kvm_main.c                  | 138 +++++++------
>   34 files changed, 413 insertions(+), 437 deletions(-)
> 

Queued 1-20 and 22-28.  Initially I skipped 21 because I didn't receive 
it, but I have to think more about whether I agree with it.

In reality the CMPXCHG loops can really fail just once, because they 
only race with the processor setting ON=1.  But if the warnings were to 
trigger at all, it would mean that something iffy is happening in the 
pi_desc->control state machine, and having the check on every iteration 
is (very marginally) more effective.

It's all theoretical, granted.

Paolo


