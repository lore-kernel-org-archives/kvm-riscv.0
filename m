From: Sean Christopherson <seanjc@google.com>
Date: Wed, 30 Nov 2022 23:09:32 +0000
Subject: [PATCH v2 48/50] KVM: Register syscore (suspend/resume) ops early in kvm_init()
In-Reply-To: <20221130230934.1014142-1-seanjc@google.com>
References: <20221130230934.1014142-1-seanjc@google.com>
Message-ID: <20221130230934.1014142-49-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Register the suspend/resume notifier hooks at the same time KVM registers
its reboot notifier so that all the code in kvm_init() that deals with
enabling/disabling hardware is bundled together.  Opportunstically move
KVM's implementations to reside near the reboot notifier code for the
same reason.

Bunching the code together will allow architectures to opt out of KVM's
generic hardware enable/disable logic with minimal #ifdeffery.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 68 ++++++++++++++++++++++-----------------------
 1 file changed, 34 insertions(+), 34 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 674a9dab5411..c12db3839114 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -5154,6 +5154,38 @@ static struct notifier_block kvm_reboot_notifier = {
 	.priority = 0,
 };
 
+static int kvm_suspend(void)
+{
+	/*
+	 * Secondary CPUs and CPU hotplug are disabled across the suspend/resume
+	 * callbacks, i.e. no need to acquire kvm_lock to ensure the usage count
+	 * is stable.  Assert that kvm_lock is not held to ensure the system
+	 * isn't suspended while KVM is enabling hardware.  Hardware enabling
+	 * can be preempted, but the task cannot be frozen until it has dropped
+	 * all locks (userspace tasks are frozen via a fake signal).
+	 */
+	lockdep_assert_not_held(&kvm_lock);
+	lockdep_assert_irqs_disabled();
+
+	if (kvm_usage_count)
+		hardware_disable_nolock(NULL);
+	return 0;
+}
+
+static void kvm_resume(void)
+{
+	lockdep_assert_not_held(&kvm_lock);
+	lockdep_assert_irqs_disabled();
+
+	if (kvm_usage_count)
+		WARN_ON_ONCE(__hardware_enable_nolock());
+}
+
+static struct syscore_ops kvm_syscore_ops = {
+	.suspend = kvm_suspend,
+	.resume = kvm_resume,
+};
+
 static void kvm_io_bus_destroy(struct kvm_io_bus *bus)
 {
 	int i;
@@ -5732,38 +5764,6 @@ static void kvm_init_debug(void)
 	}
 }
 
-static int kvm_suspend(void)
-{
-	/*
-	 * Secondary CPUs and CPU hotplug are disabled across the suspend/resume
-	 * callbacks, i.e. no need to acquire kvm_lock to ensure the usage count
-	 * is stable.  Assert that kvm_lock is not held to ensure the system
-	 * isn't suspended while KVM is enabling hardware.  Hardware enabling
-	 * can be preempted, but the task cannot be frozen until it has dropped
-	 * all locks (userspace tasks are frozen via a fake signal).
-	 */
-	lockdep_assert_not_held(&kvm_lock);
-	lockdep_assert_irqs_disabled();
-
-	if (kvm_usage_count)
-		hardware_disable_nolock(NULL);
-	return 0;
-}
-
-static void kvm_resume(void)
-{
-	lockdep_assert_not_held(&kvm_lock);
-	lockdep_assert_irqs_disabled();
-
-	if (kvm_usage_count)
-		WARN_ON_ONCE(__hardware_enable_nolock());
-}
-
-static struct syscore_ops kvm_syscore_ops = {
-	.suspend = kvm_suspend,
-	.resume = kvm_resume,
-};
-
 static inline
 struct kvm_vcpu *preempt_notifier_to_vcpu(struct preempt_notifier *pn)
 {
@@ -5879,6 +5879,7 @@ int kvm_init(unsigned vcpu_size, unsigned vcpu_align, struct module *module)
 		return r;
 
 	register_reboot_notifier(&kvm_reboot_notifier);
+	register_syscore_ops(&kvm_syscore_ops);
 
 	/* A kmem cache lets us meet the alignment requirements of fx_save. */
 	if (!vcpu_align)
@@ -5913,8 +5914,6 @@ int kvm_init(unsigned vcpu_size, unsigned vcpu_align, struct module *module)
 
 	kvm_chardev_ops.owner = module;
 
-	register_syscore_ops(&kvm_syscore_ops);
-
 	kvm_preempt_ops.sched_in = kvm_sched_in;
 	kvm_preempt_ops.sched_out = kvm_sched_out;
 
@@ -5948,6 +5947,7 @@ int kvm_init(unsigned vcpu_size, unsigned vcpu_align, struct module *module)
 		free_cpumask_var(per_cpu(cpu_kick_mask, cpu));
 	kmem_cache_destroy(kvm_vcpu_cache);
 out_free_3:
+	unregister_syscore_ops(&kvm_syscore_ops);
 	unregister_reboot_notifier(&kvm_reboot_notifier);
 	cpuhp_remove_state_nocalls(CPUHP_AP_KVM_ONLINE);
 	return r;
-- 
2.38.1.584.g0f3c55d4c2-goog


