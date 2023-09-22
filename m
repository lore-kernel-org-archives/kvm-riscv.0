From: Sean Christopherson <seanjc@google.com>
Date: Fri, 22 Sep 2023 09:28:08 -0700
Subject: [RFC PATCH v12 07/33] KVM: Add KVM_EXIT_MEMORY_FAULT exit to
 report faults to userspace
In-Reply-To: <117db856-9aec-e91c-b1d4-db2b90ae563d@intel.com>
References: <20230914015531.1419405-1-seanjc@google.com> <20230914015531.1419405-8-seanjc@google.com>
 <117db856-9aec-e91c-b1d4-db2b90ae563d@intel.com>
Message-ID: <ZQ3AmLO2SYv3DszH@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Removing non-KVM lists/people from Cc, this is going to get way off the guest_memfd
track...

On Fri, Sep 22, 2023, Xiaoyao Li wrote:
> On 9/14/2023 9:55 AM, Sean Christopherson wrote:
> > Place "struct memory_fault" in a second anonymous union so that filling
> > memory_fault doesn't clobber state from other yet-to-be-fulfilled exits,
> > and to provide additional information if KVM does NOT ultimately exit to
> > userspace with KVM_EXIT_MEMORY_FAULT, e.g. if KVM suppresses (or worse,
> > loses) the exit, as KVM often suppresses exits for memory failures that
> > occur when accessing paravirt data structures.  The initial usage for
> > private memory will be all-or-nothing, but other features such as the
> > proposed "userfault on missing mappings" support will use
> > KVM_EXIT_MEMORY_FAULT for potentially _all_ guest memory accesses, i.e.
> > will run afoul of KVM's various quirks.
> 
> So when exit reason is KVM_EXIT_MEMORY_FAULT, how can we tell which field in
> the first union is valid?

/facepalm

At one point, I believe we had discussed a second exit reason field?  But yeah,
as is, there's no way for userspace to glean anything useful from the first union.

The more I think about this, the more I think it's a fool's errand.  Even if KVM
provides the exit_reason history, userspace can't act on the previous, unfulfilled
exit without *knowing* that it's safe/correct to process the previous exit.  I
don't see how that's remotely possible.

Practically speaking, there is one known instance of this in KVM, and it's a
rather riduclous edge case that has existed "forever".  I'm very strongly inclined
to do nothing special, and simply treat clobbering an exit that userspace actually
cares about like any other KVM bug.

> When exit reason is not KVM_EXIT_MEMORY_FAULT, how can we know the info in
> the second union run.memory is valid without a run.memory.valid field?

Anish's series adds a flag in kvm_run.flags to track whether or not memory_fault
has been filled.  The idea is that KVM would clear the flag early in KVM_RUN, and
then set the flag when memory_fault is first filled.

	/* KVM_CAP_MEMORY_FAULT_INFO flag for kvm_run.flags */
	#define KVM_RUN_MEMORY_FAULT_FILLED (1 << 8)

I didn't propose that flag here because clobbering memory_fault from the page
fault path would be a flagrant KVM bug.

Honestly, I'm becoming more and more skeptical that separating memory_fault is
worthwhile, or even desirable.  Similar to memory_fault clobbering something else,
userspace can only take action if memory_fault is clobbered if userspace somehow
knows that it's safe/correct to do so.

Even if KVM exits "immediately" after initially filling memory_fault, the fact
that KVM is exiting for a different reason (or a different memory fault) means
that KVM did *something* between filling memory_fault and actually exiting.  And
it's completely impossible for usersepace to know what that "something" was.

E.g. in the splat from selftests[1], KVM reacts to a failure during Real Mode
event injection by synthesizing a triple fault

	ret = emulate_int_real(ctxt, irq);

	if (ret != X86EMUL_CONTINUE) {
		kvm_make_request(KVM_REQ_TRIPLE_FAULT, vcpu);

There are multiple KVM bugs@play: read_emulate() and write_emulate() incorrectly
assume *all* failures should be treated like MMIO, and conversely ->read_std() and
->write_std() don't handle *any* failures as MMIO.

Circling back to my "capturing the history is pointless" assertion, by the time
userspace gets an exit, the vCPU is already in shutdown, and KVM has clobbered
memory_fault something like five times.  There is zero chance userspace can do
anything but shed a tear for the VM and move on.

The whole "let's annotate all memory faults" idea came from my desire to push KVM
towards a future where all -EFAULT exits are annotated[2].  I still think we should
point KVM in that general direction, i.e. implement something that _can_ provide
100% "coverage" in the future, even though we don't expect to get there anytime soon.

I bring that up because neither private memory nor userfault-on-missing needs to
annotate anything other than -EFAULT during guest page faults.  I.e. all of this
paranoia about clobbering memory_fault isn't actually buying us anything other
than noise and complexity.  The cases we need to work _today_ are perfectly fine,
and _if_ some future use cases needs all/more paths to be 100% accurate, then the
right thing to do is to make whatever changes are necessary for KVM to be 100%
accurate.

In other words, trying to gracefully handle memory_fault clobbering is pointless.
KVM either needs to guarantee there's no clobbering (guest page fault paths) or
treat the annotation as best effort and informational-only (everything else at
this time).  Future features may grow the set of paths that needs strong guarantees,
but that just means fixing more paths and treating any violation of the contract
like any other KVM bug.

And if we stop being unnecessarily paranoid, KVM_RUN_MEMORY_FAULT_FILLED can also
go away.  The flag came about in part because *unconditionally* sanitizing
kvm_run.exit_reason at the start of KVM_RUN would break KVM's ABI, as userspace
may rely on the exit_reason being preserved when calling back into KVM to complete
userspace I/O (or MMIO)[3].  But the goal is purely to avoid exiting with stale
memory_fault information, not to sanitize every other existing exit_reason, and
that can be achieved by simply making the reset conditional.

Somewhat of a tangent, I think we should add KVM_CAP_MEMORY_FAULT_INFO if the
KVM_EXIT_MEMORY_FAULT supports comes in with guest_memfd.

Unless someone comes up with a good argument for keeping the paranoid behavior,
I'll post the below patch as fixup for the guest_memfd series, and work with Anish
to massage the attached patch (result of the below being sqaushed) in case his
series lands first.

[1] https://lore.kernel.org/all/202309141107.30863e9d-oliver.sang at intel.com
[2] https://lore.kernel.org/all/Y+6iX6a22+GEuH1b at google.com
[3] https://lore.kernel.org/all/ZFFbwOXZ5uI%2Fgdaf at google.com

---
 Documentation/virt/kvm/api.rst | 21 +++++++++++++++++++
 arch/x86/kvm/x86.c             |  1 +
 include/uapi/linux/kvm.h       | 37 ++++++++++------------------------
 virt/kvm/kvm_main.c            | 10 +++++++++
 4 files changed, 43 insertions(+), 26 deletions(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 5e08f2a157ef..d5c9e46e2d12 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -7829,6 +7829,27 @@ This capability is aimed to mitigate the threat that malicious VMs can
 cause CPU stuck (due to event windows don't open up) and make the CPU
 unavailable to host or other VMs.
 
+7.34 KVM_CAP_MEMORY_FAULT_INFO
+------------------------------
+
+:Architectures: x86
+:Returns: Informational only, -EINVAL on direct KVM_ENABLE_CAP.
+
+The presence of this capability indicates that KVM_RUN *may* fill
+kvm_run.memory_fault in response to failed guest memory accesses in a vCPU
+context.  KVM only guarantees that errors that occur when handling guest page
+fault VM-Exits will be annotated, all other error paths are best effort.
+
+The information in kvm_run.memory_fault is valid if and only if KVM_RUN returns
+an error with errno=EFAULT or errno=EHWPOISON *and* kvm_run.exit_reason is set
+to KVM_EXIT_MEMORY_FAULT.
+
+Note: Userspaces which attempt to resolve memory faults so that they can retry
+KVM_RUN are encouraged to guard against repeatedly receiving the same
+error/annotated fault.
+
+See KVM_EXIT_MEMORY_FAULT for more information.
+
 8. Other capabilities.
 ======================
 
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 767236b4d771..e25076fdd720 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -4525,6 +4525,7 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 	case KVM_CAP_ENABLE_CAP:
 	case KVM_CAP_VM_DISABLE_NX_HUGE_PAGES:
 	case KVM_CAP_IRQFD_RESAMPLE:
+	case KVM_CAP_MEMORY_FAULT_INFO:
 		r = 1;
 		break;
 	case KVM_CAP_EXIT_HYPERCALL:
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 65fc983af840..7f0ee6475141 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -525,6 +525,13 @@ struct kvm_run {
 #define KVM_NOTIFY_CONTEXT_INVALID	(1 << 0)
 			__u32 flags;
 		} notify;
+		/* KVM_EXIT_MEMORY_FAULT */
+		struct {
+#define KVM_MEMORY_EXIT_FLAG_PRIVATE	(1ULL << 3)
+			__u64 flags;
+			__u64 gpa;
+			__u64 size;
+		} memory_fault;
 		/* Fix the size of the union. */
 		char padding[256];
 	};
@@ -546,29 +553,6 @@ struct kvm_run {
 		struct kvm_sync_regs regs;
 		char padding[SYNC_REGS_SIZE_BYTES];
 	} s;
-
-	/*
-	 * This second exit union holds structs for exit types which may be
-	 * triggered after KVM has already initiated a different exit, or which
-	 * may be ultimately dropped by KVM.
-	 *
-	 * For example, because of limitations in KVM's uAPI, KVM x86 can
-	 * generate a memory fault exit an MMIO exit is initiated (exit_reason
-	 * and kvm_run.mmio are filled).  And conversely, KVM often disables
-	 * paravirt features if a memory fault occurs when accessing paravirt
-	 * data instead of reporting the error to userspace.
-	 */
-	union {
-		/* KVM_EXIT_MEMORY_FAULT */
-		struct {
-#define KVM_MEMORY_EXIT_FLAG_PRIVATE	(1ULL << 3)
-			__u64 flags;
-			__u64 gpa;
-			__u64 size;
-		} memory_fault;
-		/* Fix the size of the union. */
-		char padding2[256];
-	};
 };
 
 /* for KVM_REGISTER_COALESCED_MMIO / KVM_UNREGISTER_COALESCED_MMIO */
@@ -1231,9 +1215,10 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_ARM_EAGER_SPLIT_CHUNK_SIZE 228
 #define KVM_CAP_ARM_SUPPORTED_BLOCK_SIZES 229
 #define KVM_CAP_USER_MEMORY2 230
-#define KVM_CAP_MEMORY_ATTRIBUTES 231
-#define KVM_CAP_GUEST_MEMFD 232
-#define KVM_CAP_VM_TYPES 233
+#define KVM_CAP_MEMORY_FAULT_INFO 231
+#define KVM_CAP_MEMORY_ATTRIBUTES 232
+#define KVM_CAP_GUEST_MEMFD 233
+#define KVM_CAP_VM_TYPES 234
 
 #ifdef KVM_CAP_IRQ_ROUTING
 
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 96fc609459e3..d78e97b527e5 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -4450,6 +4450,16 @@ static long kvm_vcpu_ioctl(struct file *filp,
 				synchronize_rcu();
 			put_pid(oldpid);
 		}
+
+		/*
+		 * Reset the exit reason if the previous userspace exit was due
+		 * to a memory fault.  Not all -EFAULT exits are annotated, and
+		 * so leaving exit_reason set to KVM_EXIT_MEMORY_FAULT could
+		 * result in feeding userspace stale information.
+		 */
+		if (vcpu->run->exit_reason == KVM_EXIT_MEMORY_FAULT)
+			vcpu->run->exit_reason = KVM_EXIT_UNKNOWN
+
 		r = kvm_arch_vcpu_ioctl_run(vcpu);
 		trace_kvm_userspace_exit(vcpu->run->exit_reason, r);
 		break;

base-commit: 67aa951d727ad2715f7ad891929f18b7f2567a0f
-- 

-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-KVM-Add-KVM_EXIT_MEMORY_FAULT-exit-to-report-faults-.patch
Type: text/x-diff
Size: 9190 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230922/e8b03c33/attachment.bin>
