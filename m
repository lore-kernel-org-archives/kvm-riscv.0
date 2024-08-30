From: Sean Christopherson <seanjc@google.com>
Date: Thu, 29 Aug 2024 21:35:53 -0700
Subject: [PATCH v4 03/10] KVM: Rename symbols related to enabling
 virtualization hardware
In-Reply-To: <20240830043600.127750-1-seanjc@google.com>
References: <20240830043600.127750-1-seanjc@google.com>
Message-ID: <20240830043600.127750-4-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Rename the various functions (and a variable) that enable virtualization
to prepare for upcoming changes, and to clean up artifacts of KVM's
previous behavior, which required manually juggling locks around
kvm_usage_count.

Drop the "nolock" qualifier from per-CPU functions now that there are no
"nolock" implementations of the "all" variants, i.e. now that calling a
non-nolock function from a nolock function isn't confusing (unlike this
sentence).

Drop "all" from the outer helpers as they no longer manually iterate
over all CPUs, and because it might not be obvious what "all" refers to.

In lieu of the above qualifiers, append "_cpu" to the end of the functions
that are per-CPU helpers for the outer APIs.

Opportunistically prepend "kvm" to all functions to help make it clear
that they are KVM helpers, but mostly because there's no reason not to.

Lastly, use "virtualization" instead of "hardware", because while the
functions do enable virtualization in hardware, there are a _lot_ of
things that KVM enables in hardware.

Defer renaming the arch hooks to future patches, purely to reduce the
amount of churn in a single commit.

Reviewed-by: Chao Gao <chao.gao@intel.com>
Reviewed-by: Kai Huang <kai.huang@intel.com>
Acked-by: Kai Huang <kai.huang@intel.com>
Tested-by: Farrah Chen <farrah.chen@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 42 +++++++++++++++++++++---------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index a5826e16a106..fbdd2e46e65b 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -136,8 +136,8 @@ static int kvm_no_compat_open(struct inode *inode, struct file *file)
 #define KVM_COMPAT(c)	.compat_ioctl	= kvm_no_compat_ioctl,	\
 			.open		= kvm_no_compat_open
 #endif
-static int hardware_enable_all(void);
-static void hardware_disable_all(void);
+static int kvm_enable_virtualization(void);
+static void kvm_disable_virtualization(void);
 
 static void kvm_io_bus_destroy(struct kvm_io_bus *bus);
 
@@ -1220,7 +1220,7 @@ static struct kvm *kvm_create_vm(unsigned long type, const char *fdname)
 	if (r)
 		goto out_err_no_arch_destroy_vm;
 
-	r = hardware_enable_all();
+	r = kvm_enable_virtualization();
 	if (r)
 		goto out_err_no_disable;
 
@@ -1263,7 +1263,7 @@ static struct kvm *kvm_create_vm(unsigned long type, const char *fdname)
 		mmu_notifier_unregister(&kvm->mmu_notifier, current->mm);
 #endif
 out_err_no_mmu_notifier:
-	hardware_disable_all();
+	kvm_disable_virtualization();
 out_err_no_disable:
 	kvm_arch_destroy_vm(kvm);
 out_err_no_arch_destroy_vm:
@@ -1360,7 +1360,7 @@ static void kvm_destroy_vm(struct kvm *kvm)
 #endif
 	kvm_arch_free_vm(kvm);
 	preempt_notifier_dec();
-	hardware_disable_all();
+	kvm_disable_virtualization();
 	mmdrop(mm);
 }
 
@@ -5575,13 +5575,13 @@ static struct miscdevice kvm_dev = {
 __visible bool kvm_rebooting;
 EXPORT_SYMBOL_GPL(kvm_rebooting);
 
-static DEFINE_PER_CPU(bool, hardware_enabled);
+static DEFINE_PER_CPU(bool, virtualization_enabled);
 static DEFINE_MUTEX(kvm_usage_lock);
 static int kvm_usage_count;
 
-static int hardware_enable_nolock(void)
+static int kvm_enable_virtualization_cpu(void)
 {
-	if (__this_cpu_read(hardware_enabled))
+	if (__this_cpu_read(virtualization_enabled))
 		return 0;
 
 	if (kvm_arch_hardware_enable()) {
@@ -5590,7 +5590,7 @@ static int hardware_enable_nolock(void)
 		return -EIO;
 	}
 
-	__this_cpu_write(hardware_enabled, true);
+	__this_cpu_write(virtualization_enabled, true);
 	return 0;
 }
 
@@ -5601,22 +5601,22 @@ static int kvm_online_cpu(unsigned int cpu)
 	 * be enabled. Otherwise running VMs would encounter unrecoverable
 	 * errors when scheduled to this CPU.
 	 */
-	return hardware_enable_nolock();
+	return kvm_enable_virtualization_cpu();
 }
 
-static void hardware_disable_nolock(void *junk)
+static void kvm_disable_virtualization_cpu(void *ign)
 {
-	if (!__this_cpu_read(hardware_enabled))
+	if (!__this_cpu_read(virtualization_enabled))
 		return;
 
 	kvm_arch_hardware_disable();
 
-	__this_cpu_write(hardware_enabled, false);
+	__this_cpu_write(virtualization_enabled, false);
 }
 
 static int kvm_offline_cpu(unsigned int cpu)
 {
-	hardware_disable_nolock(NULL);
+	kvm_disable_virtualization_cpu(NULL);
 	return 0;
 }
 
@@ -5635,7 +5635,7 @@ static void kvm_shutdown(void)
 	 */
 	pr_info("kvm: exiting hardware virtualization\n");
 	kvm_rebooting = true;
-	on_each_cpu(hardware_disable_nolock, NULL, 1);
+	on_each_cpu(kvm_disable_virtualization_cpu, NULL, 1);
 }
 
 static int kvm_suspend(void)
@@ -5651,7 +5651,7 @@ static int kvm_suspend(void)
 	lockdep_assert_not_held(&kvm_usage_lock);
 	lockdep_assert_irqs_disabled();
 
-	hardware_disable_nolock(NULL);
+	kvm_disable_virtualization_cpu(NULL);
 	return 0;
 }
 
@@ -5660,7 +5660,7 @@ static void kvm_resume(void)
 	lockdep_assert_not_held(&kvm_usage_lock);
 	lockdep_assert_irqs_disabled();
 
-	WARN_ON_ONCE(hardware_enable_nolock());
+	WARN_ON_ONCE(kvm_enable_virtualization_cpu());
 }
 
 static struct syscore_ops kvm_syscore_ops = {
@@ -5669,7 +5669,7 @@ static struct syscore_ops kvm_syscore_ops = {
 	.shutdown = kvm_shutdown,
 };
 
-static int hardware_enable_all(void)
+static int kvm_enable_virtualization(void)
 {
 	int r;
 
@@ -5712,7 +5712,7 @@ static int hardware_enable_all(void)
 	return r;
 }
 
-static void hardware_disable_all(void)
+static void kvm_disable_virtualization(void)
 {
 	guard(mutex)(&kvm_usage_lock);
 
@@ -5723,12 +5723,12 @@ static void hardware_disable_all(void)
 	cpuhp_remove_state(CPUHP_AP_KVM_ONLINE);
 }
 #else /* CONFIG_KVM_GENERIC_HARDWARE_ENABLING */
-static int hardware_enable_all(void)
+static int kvm_enable_virtualization(void)
 {
 	return 0;
 }
 
-static void hardware_disable_all(void)
+static void kvm_disable_virtualization(void)
 {
 
 }
-- 
2.46.0.469.g59c65b2a67-goog


