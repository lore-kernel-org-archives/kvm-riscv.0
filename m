From: Sean Christopherson <seanjc@google.com>
Date: Tue, 30 Apr 2024 12:31:56 -0700
Subject: [PATCH 3/4] KVM: x86: Fold kvm_arch_sched_in() into kvm_arch_vcpu_load()
In-Reply-To: <20240430193157.419425-1-seanjc@google.com>
References: <20240430193157.419425-1-seanjc@google.com>
Message-ID: <20240430193157.419425-4-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Fold the guts of kvm_arch_sched_in() into kvm_arch_vcpu_load(), keying
off the recently added @sched_in as appropriate.

Note, there is a very slight functional change, as PLE shrink updates will
now happen after blasting WBINVD, but that is quite uninteresting.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm-x86-ops.h |  1 -
 arch/x86/include/asm/kvm_host.h    |  4 +---
 arch/x86/kvm/svm/svm.c             | 13 ++++---------
 arch/x86/kvm/vmx/main.c            |  2 --
 arch/x86/kvm/vmx/vmx.c             | 11 ++++-------
 arch/x86/kvm/vmx/x86_ops.h         |  3 +--
 arch/x86/kvm/x86.c                 | 19 +++++++++++--------
 7 files changed, 21 insertions(+), 32 deletions(-)

diff --git a/arch/x86/include/asm/kvm-x86-ops.h b/arch/x86/include/asm/kvm-x86-ops.h
index 5187fcf4b610..910d06cdb86b 100644
--- a/arch/x86/include/asm/kvm-x86-ops.h
+++ b/arch/x86/include/asm/kvm-x86-ops.h
@@ -103,7 +103,6 @@ KVM_X86_OP(write_tsc_multiplier)
 KVM_X86_OP(get_exit_info)
 KVM_X86_OP(check_intercept)
 KVM_X86_OP(handle_exit_irqoff)
-KVM_X86_OP(sched_in)
 KVM_X86_OP_OPTIONAL(update_cpu_dirty_logging)
 KVM_X86_OP_OPTIONAL(vcpu_blocking)
 KVM_X86_OP_OPTIONAL(vcpu_unblocking)
diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 01c69840647e..9fd1ec82303d 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1624,7 +1624,7 @@ struct kvm_x86_ops {
 	void (*vcpu_reset)(struct kvm_vcpu *vcpu, bool init_event);
 
 	void (*prepare_switch_to_guest)(struct kvm_vcpu *vcpu);
-	void (*vcpu_load)(struct kvm_vcpu *vcpu, int cpu);
+	void (*vcpu_load)(struct kvm_vcpu *vcpu, int cpu, bool sched_in);
 	void (*vcpu_put)(struct kvm_vcpu *vcpu);
 
 	void (*update_exception_bitmap)(struct kvm_vcpu *vcpu);
@@ -1746,8 +1746,6 @@ struct kvm_x86_ops {
 			       struct x86_exception *exception);
 	void (*handle_exit_irqoff)(struct kvm_vcpu *vcpu);
 
-	void (*sched_in)(struct kvm_vcpu *vcpu, int cpu);
-
 	/*
 	 * Size of the CPU's dirty log buffer, i.e. VMX's PML buffer.  A zero
 	 * value indicates CPU dirty logging is unsupported or disabled.
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index 0f3b59da0d4a..6d9763dc4fed 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -1539,11 +1539,14 @@ static void svm_prepare_host_switch(struct kvm_vcpu *vcpu)
 	to_svm(vcpu)->guest_state_loaded = false;
 }
 
-static void svm_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
+static void svm_vcpu_load(struct kvm_vcpu *vcpu, int cpu, bool sched_in)
 {
 	struct vcpu_svm *svm = to_svm(vcpu);
 	struct svm_cpu_data *sd = per_cpu_ptr(&svm_data, cpu);
 
+	if (sched_in && !kvm_pause_in_guest(vcpu->kvm))
+		shrink_ple_window(vcpu);
+
 	if (sd->current_vmcb != svm->vmcb) {
 		sd->current_vmcb = svm->vmcb;
 
@@ -4548,12 +4551,6 @@ static void svm_handle_exit_irqoff(struct kvm_vcpu *vcpu)
 		vcpu->arch.at_instruction_boundary = true;
 }
 
-static void svm_sched_in(struct kvm_vcpu *vcpu, int cpu)
-{
-	if (!kvm_pause_in_guest(vcpu->kvm))
-		shrink_ple_window(vcpu);
-}
-
 static void svm_setup_mce(struct kvm_vcpu *vcpu)
 {
 	/* [63:9] are reserved. */
@@ -5013,8 +5010,6 @@ static struct kvm_x86_ops svm_x86_ops __initdata = {
 	.check_intercept = svm_check_intercept,
 	.handle_exit_irqoff = svm_handle_exit_irqoff,
 
-	.sched_in = svm_sched_in,
-
 	.nested_ops = &svm_nested_ops,
 
 	.deliver_interrupt = svm_deliver_interrupt,
diff --git a/arch/x86/kvm/vmx/main.c b/arch/x86/kvm/vmx/main.c
index 7c546ad3e4c9..4fee9a8cc5a1 100644
--- a/arch/x86/kvm/vmx/main.c
+++ b/arch/x86/kvm/vmx/main.c
@@ -121,8 +121,6 @@ struct kvm_x86_ops vt_x86_ops __initdata = {
 	.check_intercept = vmx_check_intercept,
 	.handle_exit_irqoff = vmx_handle_exit_irqoff,
 
-	.sched_in = vmx_sched_in,
-
 	.cpu_dirty_log_size = PML_ENTITY_NUM,
 	.update_cpu_dirty_logging = vmx_update_cpu_dirty_logging,
 
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index cb36db7b6140..ccea594187c7 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -1505,10 +1505,13 @@ void vmx_vcpu_load_vmcs(struct kvm_vcpu *vcpu, int cpu,
  * Switches to specified vcpu, until a matching vcpu_put(), but assumes
  * vcpu mutex is already taken.
  */
-void vmx_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
+void vmx_vcpu_load(struct kvm_vcpu *vcpu, int cpu, bool sched_in)
 {
 	struct vcpu_vmx *vmx = to_vmx(vcpu);
 
+	if (sched_in && !kvm_pause_in_guest(vcpu->kvm))
+		shrink_ple_window(vcpu);
+
 	vmx_vcpu_load_vmcs(vcpu, cpu, NULL);
 
 	vmx_vcpu_pi_load(vcpu, cpu);
@@ -8093,12 +8096,6 @@ void vmx_cancel_hv_timer(struct kvm_vcpu *vcpu)
 }
 #endif
 
-void vmx_sched_in(struct kvm_vcpu *vcpu, int cpu)
-{
-	if (!kvm_pause_in_guest(vcpu->kvm))
-		shrink_ple_window(vcpu);
-}
-
 void vmx_update_cpu_dirty_logging(struct kvm_vcpu *vcpu)
 {
 	struct vcpu_vmx *vmx = to_vmx(vcpu);
diff --git a/arch/x86/kvm/vmx/x86_ops.h b/arch/x86/kvm/vmx/x86_ops.h
index 502704596c83..b7104a5f623e 100644
--- a/arch/x86/kvm/vmx/x86_ops.h
+++ b/arch/x86/kvm/vmx/x86_ops.h
@@ -23,7 +23,7 @@ int vmx_vcpu_pre_run(struct kvm_vcpu *vcpu);
 fastpath_t vmx_vcpu_run(struct kvm_vcpu *vcpu, bool force_immediate_exit);
 void vmx_vcpu_free(struct kvm_vcpu *vcpu);
 void vmx_vcpu_reset(struct kvm_vcpu *vcpu, bool init_event);
-void vmx_vcpu_load(struct kvm_vcpu *vcpu, int cpu);
+void vmx_vcpu_load(struct kvm_vcpu *vcpu, int cpu, bool sched_in);
 void vmx_vcpu_put(struct kvm_vcpu *vcpu);
 int vmx_handle_exit(struct kvm_vcpu *vcpu, fastpath_t exit_fastpath);
 void vmx_handle_exit_irqoff(struct kvm_vcpu *vcpu);
@@ -112,7 +112,6 @@ u64 vmx_get_l2_tsc_multiplier(struct kvm_vcpu *vcpu);
 void vmx_write_tsc_offset(struct kvm_vcpu *vcpu);
 void vmx_write_tsc_multiplier(struct kvm_vcpu *vcpu);
 void vmx_request_immediate_exit(struct kvm_vcpu *vcpu);
-void vmx_sched_in(struct kvm_vcpu *vcpu, int cpu);
 void vmx_update_cpu_dirty_logging(struct kvm_vcpu *vcpu);
 #ifdef CONFIG_X86_64
 int vmx_set_hv_timer(struct kvm_vcpu *vcpu, u64 guest_deadline_tsc,
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 925cadb18b55..9b0a21f2e56e 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -5005,6 +5005,16 @@ static bool need_emulate_wbinvd(struct kvm_vcpu *vcpu)
 
 void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu, bool sched_in)
 {
+	struct kvm_pmu *pmu = vcpu_to_pmu(vcpu);
+
+	if (sched_in) {
+		vcpu->arch.l1tf_flush_l1d = true;
+		if (pmu->version && unlikely(pmu->event_count)) {
+			pmu->need_cleanup = true;
+			kvm_make_request(KVM_REQ_PMU, vcpu);
+		}
+	}
+
 	/* Address WBINVD may be executed by guest */
 	if (need_emulate_wbinvd(vcpu)) {
 		if (static_call(kvm_x86_has_wbinvd_exit)())
@@ -5014,7 +5024,7 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu, bool sched_in)
 					wbinvd_ipi, NULL, 1);
 	}
 
-	static_call(kvm_x86_vcpu_load)(vcpu, cpu);
+	static_call(kvm_x86_vcpu_load)(vcpu, cpu, sched_in);
 
 	/* Save host pkru register if supported */
 	vcpu->arch.host_pkru = read_pkru();
@@ -12569,14 +12579,7 @@ bool kvm_vcpu_is_bsp(struct kvm_vcpu *vcpu)
 
 void kvm_arch_sched_in(struct kvm_vcpu *vcpu, int cpu)
 {
-	struct kvm_pmu *pmu = vcpu_to_pmu(vcpu);
 
-	vcpu->arch.l1tf_flush_l1d = true;
-	if (pmu->version && unlikely(pmu->event_count)) {
-		pmu->need_cleanup = true;
-		kvm_make_request(KVM_REQ_PMU, vcpu);
-	}
-	static_call(kvm_x86_sched_in)(vcpu, cpu);
 }
 
 void kvm_arch_free_vm(struct kvm *kvm)
-- 
2.45.0.rc0.197.gbae5840b3b-goog


