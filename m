From: Sean Christopherson <seanjc@google.com>
Date: Fri,  8 Oct 2021 19:11:57 -0700
Subject: [PATCH v2 04/43] KVM: Force PPC to define its own rcuwait object
In-Reply-To: <20211009021236.4122790-1-seanjc@google.com>
References: <20211009021236.4122790-1-seanjc@google.com>
Message-ID: <20211009021236.4122790-5-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Do not define/reference kvm_vcpu.wait if __KVM_HAVE_ARCH_WQP is true, and
instead force the architecture (PPC) to define its own rcuwait object.
Allowing common KVM to directly access vcpu->wait without a guard makes
it all too easy to introduce potential bugs, e.g. kvm_vcpu_block(),
kvm_vcpu_on_spin(), and async_pf_execute() all operate on vcpu->wait, not
the result of kvm_arch_vcpu_get_wait(), and so may do the wrong thing for
PPC.

Due to PPC's shenanigans with respect to callbacks and waits (it switches
to the virtual core's wait object at KVM_RUN!?!?), it's not clear whether
or not this fixes any bugs.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/powerpc/include/asm/kvm_host.h | 1 +
 arch/powerpc/kvm/powerpc.c          | 3 ++-
 include/linux/kvm_host.h            | 2 ++
 virt/kvm/async_pf.c                 | 2 +-
 virt/kvm/kvm_main.c                 | 9 ++++++---
 5 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
index 59cb38b04ede..876c10803cda 100644
--- a/arch/powerpc/include/asm/kvm_host.h
+++ b/arch/powerpc/include/asm/kvm_host.h
@@ -749,6 +749,7 @@ struct kvm_vcpu_arch {
 	u8 irq_pending; /* Used by XIVE to signal pending guest irqs */
 	u32 last_inst;
 
+	struct rcuwait wait;
 	struct rcuwait *waitp;
 	struct kvmppc_vcore *vcore;
 	int ret;
diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index 8ab90ce8738f..be22da157569 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -762,7 +762,8 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
 	if (err)
 		goto out_vcpu_uninit;
 
-	vcpu->arch.waitp = &vcpu->wait;
+	rcuwait_init(&vcpu->arch.wait);
+	vcpu->arch.waitp = &vcpu->arch.wait;
 	kvmppc_create_vcpu_debugfs(vcpu, vcpu->vcpu_id);
 	return 0;
 
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 60a35d9fe259..1ced2914d9ca 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -310,7 +310,9 @@ struct kvm_vcpu {
 	struct mutex mutex;
 	struct kvm_run *run;
 
+#ifndef __KVM_HAVE_ARCH_WQP
 	struct rcuwait wait;
+#endif
 	struct pid __rcu *pid;
 	int sigset_active;
 	sigset_t sigset;
diff --git a/virt/kvm/async_pf.c b/virt/kvm/async_pf.c
index dd777688d14a..ccb35c22785e 100644
--- a/virt/kvm/async_pf.c
+++ b/virt/kvm/async_pf.c
@@ -85,7 +85,7 @@ static void async_pf_execute(struct work_struct *work)
 
 	trace_kvm_async_pf_completed(addr, cr2_or_gpa);
 
-	rcuwait_wake_up(&vcpu->wait);
+	rcuwait_wake_up(kvm_arch_vcpu_get_wait(vcpu));
 
 	mmput(mm);
 	kvm_put_kvm(vcpu->kvm);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 7bc38549487e..5d4a90032277 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -421,7 +421,9 @@ static void kvm_vcpu_init(struct kvm_vcpu *vcpu, struct kvm *kvm, unsigned id)
 	vcpu->kvm = kvm;
 	vcpu->vcpu_id = id;
 	vcpu->pid = NULL;
+#ifndef __KVM_HAVE_ARCH_WQP
 	rcuwait_init(&vcpu->wait);
+#endif
 	kvm_async_pf_vcpu_init(vcpu);
 
 	vcpu->pre_pcpu = -1;
@@ -3213,6 +3215,7 @@ update_halt_poll_stats(struct kvm_vcpu *vcpu, u64 poll_ns, bool waited)
  */
 void kvm_vcpu_block(struct kvm_vcpu *vcpu)
 {
+	struct rcuwait *wait = kvm_arch_vcpu_get_wait(vcpu);
 	bool halt_poll_allowed = !kvm_arch_no_poll(vcpu);
 	ktime_t start, cur, poll_end;
 	bool waited = false;
@@ -3251,7 +3254,7 @@ void kvm_vcpu_block(struct kvm_vcpu *vcpu)
 	}
 
 
-	prepare_to_rcuwait(&vcpu->wait);
+	prepare_to_rcuwait(wait);
 	for (;;) {
 		set_current_state(TASK_INTERRUPTIBLE);
 
@@ -3261,7 +3264,7 @@ void kvm_vcpu_block(struct kvm_vcpu *vcpu)
 		waited = true;
 		schedule();
 	}
-	finish_rcuwait(&vcpu->wait);
+	finish_rcuwait(wait);
 	cur = ktime_get();
 	if (waited) {
 		vcpu->stat.generic.halt_wait_ns +=
@@ -3460,7 +3463,7 @@ void kvm_vcpu_on_spin(struct kvm_vcpu *me, bool yield_to_kernel_mode)
 				continue;
 			if (vcpu == me)
 				continue;
-			if (rcuwait_active(&vcpu->wait) &&
+			if (rcuwait_active(kvm_arch_vcpu_get_wait(vcpu)) &&
 			    !vcpu_dy_runnable(vcpu))
 				continue;
 			if (READ_ONCE(vcpu->preempted) && yield_to_kernel_mode &&
-- 
2.33.0.882.g93a45727a2-goog


