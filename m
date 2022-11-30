From: Sean Christopherson <seanjc@google.com>
Date: Wed, 30 Nov 2022 23:09:00 +0000
Subject: [PATCH v2 16/50] KVM: arm64: Simplify the CPUHP logic
In-Reply-To: <20221130230934.1014142-1-seanjc@google.com>
References: <20221130230934.1014142-1-seanjc@google.com>
Message-ID: <20221130230934.1014142-17-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Marc Zyngier <maz@kernel.org>

For a number of historical reasons, the KVM/arm64 hotplug setup is pretty
complicated, and we have two extra CPUHP notifiers for vGIC and timers.

It looks pretty pointless, and gets in the way of further changes.
So let's just expose some helpers that can be called from the core
CPUHP callback, and get rid of everything else.

This gives us the opportunity to drop a useless notifier entry,
as well as tidy-up the timer enable/disable, which was a bit odd.

Signed-off-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kvm/arch_timer.c     | 27 ++++++++++-----------------
 arch/arm64/kvm/arm.c            | 13 +++++++++++++
 arch/arm64/kvm/vgic/vgic-init.c | 19 ++-----------------
 include/kvm/arm_arch_timer.h    |  4 ++++
 include/kvm/arm_vgic.h          |  4 ++++
 include/linux/cpuhotplug.h      |  3 ---
 6 files changed, 33 insertions(+), 37 deletions(-)

diff --git a/arch/arm64/kvm/arch_timer.c b/arch/arm64/kvm/arch_timer.c
index bb24a76b4224..33fca1a691a5 100644
--- a/arch/arm64/kvm/arch_timer.c
+++ b/arch/arm64/kvm/arch_timer.c
@@ -811,10 +811,18 @@ void kvm_timer_vcpu_init(struct kvm_vcpu *vcpu)
 	ptimer->host_timer_irq_flags = host_ptimer_irq_flags;
 }
 
-static void kvm_timer_init_interrupt(void *info)
+void kvm_timer_cpu_up(void)
 {
 	enable_percpu_irq(host_vtimer_irq, host_vtimer_irq_flags);
-	enable_percpu_irq(host_ptimer_irq, host_ptimer_irq_flags);
+	if (host_ptimer_irq)
+		enable_percpu_irq(host_ptimer_irq, host_ptimer_irq_flags);
+}
+
+void kvm_timer_cpu_down(void)
+{
+	disable_percpu_irq(host_vtimer_irq);
+	if (host_ptimer_irq)
+		disable_percpu_irq(host_ptimer_irq);
 }
 
 int kvm_arm_timer_set_reg(struct kvm_vcpu *vcpu, u64 regid, u64 value)
@@ -976,18 +984,6 @@ void kvm_arm_timer_write_sysreg(struct kvm_vcpu *vcpu,
 	preempt_enable();
 }
 
-static int kvm_timer_starting_cpu(unsigned int cpu)
-{
-	kvm_timer_init_interrupt(NULL);
-	return 0;
-}
-
-static int kvm_timer_dying_cpu(unsigned int cpu)
-{
-	disable_percpu_irq(host_vtimer_irq);
-	return 0;
-}
-
 static int timer_irq_set_vcpu_affinity(struct irq_data *d, void *vcpu)
 {
 	if (vcpu)
@@ -1185,9 +1181,6 @@ int kvm_timer_hyp_init(bool has_gic)
 		goto out_free_irq;
 	}
 
-	cpuhp_setup_state(CPUHP_AP_KVM_ARM_TIMER_STARTING,
-			  "kvm/arm/timer:starting", kvm_timer_starting_cpu,
-			  kvm_timer_dying_cpu);
 	return 0;
 out_free_irq:
 	free_percpu_irq(host_vtimer_irq, kvm_get_running_vcpus());
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index c6732ac329ca..07f5cef5c33b 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -1670,7 +1670,15 @@ static void _kvm_arch_hardware_enable(void *discard)
 
 int kvm_arch_hardware_enable(void)
 {
+	int was_enabled = __this_cpu_read(kvm_arm_hardware_enabled);
+
 	_kvm_arch_hardware_enable(NULL);
+
+	if (!was_enabled) {
+		kvm_vgic_cpu_up();
+		kvm_timer_cpu_up();
+	}
+
 	return 0;
 }
 
@@ -1684,6 +1692,11 @@ static void _kvm_arch_hardware_disable(void *discard)
 
 void kvm_arch_hardware_disable(void)
 {
+	if (__this_cpu_read(kvm_arm_hardware_enabled)) {
+		kvm_timer_cpu_down();
+		kvm_vgic_cpu_down();
+	}
+
 	if (!is_protected_kvm_enabled())
 		_kvm_arch_hardware_disable(NULL);
 }
diff --git a/arch/arm64/kvm/vgic/vgic-init.c b/arch/arm64/kvm/vgic/vgic-init.c
index f6d4f4052555..6c7f6ae21ec0 100644
--- a/arch/arm64/kvm/vgic/vgic-init.c
+++ b/arch/arm64/kvm/vgic/vgic-init.c
@@ -465,17 +465,15 @@ int kvm_vgic_map_resources(struct kvm *kvm)
 
 /* GENERIC PROBE */
 
-static int vgic_init_cpu_starting(unsigned int cpu)
+void kvm_vgic_cpu_up(void)
 {
 	enable_percpu_irq(kvm_vgic_global_state.maint_irq, 0);
-	return 0;
 }
 
 
-static int vgic_init_cpu_dying(unsigned int cpu)
+void kvm_vgic_cpu_down(void)
 {
 	disable_percpu_irq(kvm_vgic_global_state.maint_irq);
-	return 0;
 }
 
 static irqreturn_t vgic_maintenance_handler(int irq, void *data)
@@ -584,19 +582,6 @@ int kvm_vgic_hyp_init(void)
 		return ret;
 	}
 
-	ret = cpuhp_setup_state(CPUHP_AP_KVM_ARM_VGIC_INIT_STARTING,
-				"kvm/arm/vgic:starting",
-				vgic_init_cpu_starting, vgic_init_cpu_dying);
-	if (ret) {
-		kvm_err("Cannot register vgic CPU notifier\n");
-		goto out_free_irq;
-	}
-
 	kvm_info("vgic interrupt IRQ%d\n", kvm_vgic_global_state.maint_irq);
 	return 0;
-
-out_free_irq:
-	free_percpu_irq(kvm_vgic_global_state.maint_irq,
-			kvm_get_running_vcpus());
-	return ret;
 }
diff --git a/include/kvm/arm_arch_timer.h b/include/kvm/arm_arch_timer.h
index cd6d8f260eab..1638418f72dd 100644
--- a/include/kvm/arm_arch_timer.h
+++ b/include/kvm/arm_arch_timer.h
@@ -104,4 +104,8 @@ void kvm_arm_timer_write_sysreg(struct kvm_vcpu *vcpu,
 u32 timer_get_ctl(struct arch_timer_context *ctxt);
 u64 timer_get_cval(struct arch_timer_context *ctxt);
 
+/* CPU HP callbacks */
+void kvm_timer_cpu_up(void);
+void kvm_timer_cpu_down(void);
+
 #endif
diff --git a/include/kvm/arm_vgic.h b/include/kvm/arm_vgic.h
index 4df9e73a8bb5..fc4acc91ba06 100644
--- a/include/kvm/arm_vgic.h
+++ b/include/kvm/arm_vgic.h
@@ -431,4 +431,8 @@ int vgic_v4_load(struct kvm_vcpu *vcpu);
 void vgic_v4_commit(struct kvm_vcpu *vcpu);
 int vgic_v4_put(struct kvm_vcpu *vcpu, bool need_db);
 
+/* CPU HP callbacks */
+void kvm_vgic_cpu_up(void);
+void kvm_vgic_cpu_down(void);
+
 #endif /* __KVM_ARM_VGIC_H */
diff --git a/include/linux/cpuhotplug.h b/include/linux/cpuhotplug.h
index f61447913db9..7337414e4947 100644
--- a/include/linux/cpuhotplug.h
+++ b/include/linux/cpuhotplug.h
@@ -186,9 +186,6 @@ enum cpuhp_state {
 	CPUHP_AP_TI_GP_TIMER_STARTING,
 	CPUHP_AP_HYPERV_TIMER_STARTING,
 	CPUHP_AP_KVM_STARTING,
-	CPUHP_AP_KVM_ARM_VGIC_INIT_STARTING,
-	CPUHP_AP_KVM_ARM_VGIC_STARTING,
-	CPUHP_AP_KVM_ARM_TIMER_STARTING,
 	/* Must be the last timer callback */
 	CPUHP_AP_DUMMY_TIMER_STARTING,
 	CPUHP_AP_ARM_XEN_STARTING,
-- 
2.38.1.584.g0f3c55d4c2-goog


