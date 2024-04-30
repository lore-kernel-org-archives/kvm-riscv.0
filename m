From: Sean Christopherson <seanjc@google.com>
Date: Tue, 30 Apr 2024 12:31:54 -0700
Subject: [PATCH 1/4] KVM: Plumb in a @sched_in flag to kvm_arch_vcpu_load()
In-Reply-To: <20240430193157.419425-1-seanjc@google.com>
References: <20240430193157.419425-1-seanjc@google.com>
Message-ID: <20240430193157.419425-2-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add a @sched_in flag to kvm_arch_vcpu_load() to note that the vCPU is
being (re)loaded by kvm_sched_in(), i.e. after the vCPU was previously
scheduled out.  KVM x86 currently uses a dedicated kvm_arch_sched_in()
hook, but that's unnecessarily brittle as the behavior of the arch hook
heavily depends on the arbitrary order of the two arch calls.

A separate hook also makes it unnecessarily difficult to do something
unique when re-loading vCPU during kvm_sched_in(), e.g. to optimize vCPU
loading if KVM knows that some CPU state couldn't have changed while the
vCPU was scheduled out.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kvm/arm.c            | 2 +-
 arch/arm64/kvm/emulate-nested.c | 4 ++--
 arch/arm64/kvm/reset.c          | 2 +-
 arch/loongarch/kvm/vcpu.c       | 2 +-
 arch/mips/kvm/mmu.c             | 2 +-
 arch/powerpc/kvm/powerpc.c      | 2 +-
 arch/riscv/kvm/vcpu.c           | 4 ++--
 arch/s390/kvm/kvm-s390.c        | 2 +-
 arch/x86/kvm/x86.c              | 2 +-
 include/linux/kvm_host.h        | 2 +-
 virt/kvm/kvm_main.c             | 4 ++--
 11 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index c4a0a35e02c7..30ea103bfacb 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -428,7 +428,7 @@ void kvm_arch_vcpu_unblocking(struct kvm_vcpu *vcpu)
 
 }
 
-void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
+void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu, bool sched_in)
 {
 	struct kvm_s2_mmu *mmu;
 	int *last_ran;
diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
index 4697ba41b3a9..ad5458c47e5e 100644
--- a/arch/arm64/kvm/emulate-nested.c
+++ b/arch/arm64/kvm/emulate-nested.c
@@ -2193,7 +2193,7 @@ void kvm_emulate_nested_eret(struct kvm_vcpu *vcpu)
 	*vcpu_pc(vcpu) = elr;
 	*vcpu_cpsr(vcpu) = spsr;
 
-	kvm_arch_vcpu_load(vcpu, smp_processor_id());
+	kvm_arch_vcpu_load(vcpu, smp_processor_id(), false);
 	preempt_enable();
 }
 
@@ -2274,7 +2274,7 @@ static int kvm_inject_nested(struct kvm_vcpu *vcpu, u64 esr_el2,
 	 */
 	__kvm_adjust_pc(vcpu);
 
-	kvm_arch_vcpu_load(vcpu, smp_processor_id());
+	kvm_arch_vcpu_load(vcpu, smp_processor_id(), false);
 	preempt_enable();
 
 	return 1;
diff --git a/arch/arm64/kvm/reset.c b/arch/arm64/kvm/reset.c
index 68d1d05672bd..654cf09c81e9 100644
--- a/arch/arm64/kvm/reset.c
+++ b/arch/arm64/kvm/reset.c
@@ -262,7 +262,7 @@ void kvm_reset_vcpu(struct kvm_vcpu *vcpu)
 	kvm_timer_vcpu_reset(vcpu);
 
 	if (loaded)
-		kvm_arch_vcpu_load(vcpu, smp_processor_id());
+		kvm_arch_vcpu_load(vcpu, smp_processor_id(), false);
 	preempt_enable();
 }
 
diff --git a/arch/loongarch/kvm/vcpu.c b/arch/loongarch/kvm/vcpu.c
index 3a8779065f73..61d549c4f8d1 100644
--- a/arch/loongarch/kvm/vcpu.c
+++ b/arch/loongarch/kvm/vcpu.c
@@ -1050,7 +1050,7 @@ static int _kvm_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 	return 0;
 }
 
-void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
+void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu, bool sched_in)
 {
 	unsigned long flags;
 
diff --git a/arch/mips/kvm/mmu.c b/arch/mips/kvm/mmu.c
index c17157e700c0..6797799f3f32 100644
--- a/arch/mips/kvm/mmu.c
+++ b/arch/mips/kvm/mmu.c
@@ -682,7 +682,7 @@ static void kvm_mips_migrate_count(struct kvm_vcpu *vcpu)
 }
 
 /* Restore ASID once we are scheduled back after preemption */
-void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
+void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu, bool sched_in)
 {
 	unsigned long flags;
 
diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index d32abe7fe6ab..8de620716875 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -826,7 +826,7 @@ int kvm_cpu_has_pending_timer(struct kvm_vcpu *vcpu)
 	return kvmppc_core_pending_dec(vcpu);
 }
 
-void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
+void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu, bool sched_in)
 {
 #ifdef CONFIG_BOOKE
 	/*
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index b5ca9f2e98ac..a7b7f172fa61 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -87,7 +87,7 @@ static void kvm_riscv_reset_vcpu(struct kvm_vcpu *vcpu)
 
 	/* Reset the guest CSRs for hotplug usecase */
 	if (loaded)
-		kvm_arch_vcpu_load(vcpu, smp_processor_id());
+		kvm_arch_vcpu_load(vcpu, smp_processor_id(), false);
 	put_cpu();
 }
 
@@ -507,7 +507,7 @@ static void kvm_riscv_vcpu_setup_config(struct kvm_vcpu *vcpu)
 	}
 }
 
-void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
+void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu, bool sched_in)
 {
 	struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
 	struct kvm_vcpu_config *cfg = &vcpu->arch.cfg;
diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
index 5147b943a864..9f04dc312641 100644
--- a/arch/s390/kvm/kvm-s390.c
+++ b/arch/s390/kvm/kvm-s390.c
@@ -3713,7 +3713,7 @@ __u64 kvm_s390_get_cpu_timer(struct kvm_vcpu *vcpu)
 	return value;
 }
 
-void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
+void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu, bool shed_in)
 {
 
 	gmap_enable(vcpu->arch.enabled_gmap);
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 2d2619d3eee4..925cadb18b55 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -5003,7 +5003,7 @@ static bool need_emulate_wbinvd(struct kvm_vcpu *vcpu)
 	return kvm_arch_has_noncoherent_dma(vcpu->kvm);
 }
 
-void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
+void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu, bool sched_in)
 {
 	/* Address WBINVD may be executed by guest */
 	if (need_emulate_wbinvd(vcpu)) {
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index afbc99264ffa..2f5e35eb7eab 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1498,7 +1498,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu);
 
 void kvm_arch_sched_in(struct kvm_vcpu *vcpu, int cpu);
 
-void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu);
+void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu, bool sched_in);
 void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu);
 int kvm_arch_vcpu_precreate(struct kvm *kvm, unsigned int id);
 int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 658581d4ad68..4a4b29a9bace 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -211,7 +211,7 @@ void vcpu_load(struct kvm_vcpu *vcpu)
 
 	__this_cpu_write(kvm_running_vcpu, vcpu);
 	preempt_notifier_register(&vcpu->preempt_notifier);
-	kvm_arch_vcpu_load(vcpu, cpu);
+	kvm_arch_vcpu_load(vcpu, cpu, false);
 	put_cpu();
 }
 EXPORT_SYMBOL_GPL(vcpu_load);
@@ -6279,7 +6279,7 @@ static void kvm_sched_in(struct preempt_notifier *pn, int cpu)
 
 	__this_cpu_write(kvm_running_vcpu, vcpu);
 	kvm_arch_sched_in(vcpu, cpu);
-	kvm_arch_vcpu_load(vcpu, cpu);
+	kvm_arch_vcpu_load(vcpu, cpu, true);
 }
 
 static void kvm_sched_out(struct preempt_notifier *pn,
-- 
2.45.0.rc0.197.gbae5840b3b-goog


