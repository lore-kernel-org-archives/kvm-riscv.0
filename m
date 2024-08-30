From: Sean Christopherson <seanjc@google.com>
Date: Thu, 29 Aug 2024 21:35:57 -0700
Subject: [PATCH v4 07/10] KVM: Add a module param to allow enabling
 virtualization when KVM is loaded
In-Reply-To: <20240830043600.127750-1-seanjc@google.com>
References: <20240830043600.127750-1-seanjc@google.com>
Message-ID: <20240830043600.127750-8-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add an on-by-default module param, enable_virt_at_load, to let userspace
force virtualization to be enabled in hardware when KVM is initialized,
i.e. just before /dev/kvm is exposed to userspace.  Enabling virtualization
during KVM initialization allows userspace to avoid the additional latency
when creating/destroying the first/last VM (or more specifically, on the
0=>1 and 1=>0 edges of creation/destruction).

Now that KVM uses the cpuhp framework to do per-CPU enabling, the latency
could be non-trivial as the cpuhup bringup/teardown is serialized across
CPUs, e.g. the latency could be problematic for use case that need to spin
up VMs quickly.

Prior to commit 10474ae8945c ("KVM: Activate Virtualization On Demand"),
KVM _unconditionally_ enabled virtualization during load, i.e. there's no
fundamental reason KVM needs to dynamically toggle virtualization.  These
days, the only known argument for not enabling virtualization is to allow
KVM to be autoloaded without blocking other out-of-tree hypervisors, and
such use cases can simply change the module param, e.g. via command line.

Note, the aforementioned commit also mentioned that enabling SVM (AMD's
virtualization extensions) can result in "using invalid TLB entries".
It's not clear whether the changelog was referring to a KVM bug, a CPU
bug, or something else entirely.  Regardless, leaving virtualization off
by default is not a robust "fix", as any protection provided is lost the
instant userspace creates the first VM.

Reviewed-by: Chao Gao <chao.gao@intel.com>
Acked-by: Kai Huang <kai.huang@intel.com>
Reviewed-by: Kai Huang <kai.huang@intel.com>
Tested-by: Farrah Chen <farrah.chen@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../admin-guide/kernel-parameters.txt         | 17 +++++++++
 virt/kvm/kvm_main.c                           | 35 +++++++++++++++++++
 2 files changed, 52 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 09126bb8cc9f..1b52b1b7bbc4 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -2648,6 +2648,23 @@
 
 			Default is Y (on).
 
+	kvm.enable_virt_at_load=[KVM,ARM64,LOONGARCH,MIPS,RISCV,X86]
+			If enabled, KVM will enable virtualization in hardware
+			when KVM is loaded, and disable virtualization when KVM
+			is unloaded (if KVM is built as a module).
+
+			If disabled, KVM will dynamically enable and disable
+			virtualization on-demand when creating and destroying
+			VMs, i.e. on the 0=>1 and 1=>0 transitions of the
+			number of VMs.
+
+			Enabling virtualization at module lode avoids potential
+			latency for creation of the 0=>1 VM, as KVM serializes
+			virtualization enabling across all online CPUs.  The
+			"cost" of enabling virtualization when KVM is loaded,
+			is that doing so may interfere with using out-of-tree
+			hypervisors that want to "own" virtualization hardware.
+
 	kvm.enable_vmware_backdoor=[KVM] Support VMware backdoor PV interface.
 				   Default is false (don't support).
 
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index b000f221abfb..55779fbb37ec 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -5572,6 +5572,9 @@ static struct miscdevice kvm_dev = {
 };
 
 #ifdef CONFIG_KVM_GENERIC_HARDWARE_ENABLING
+static bool enable_virt_at_load = true;
+module_param(enable_virt_at_load, bool, 0444);
+
 __visible bool kvm_rebooting;
 EXPORT_SYMBOL_GPL(kvm_rebooting);
 
@@ -5722,15 +5725,39 @@ static void kvm_disable_virtualization(void)
 	unregister_syscore_ops(&kvm_syscore_ops);
 	cpuhp_remove_state(CPUHP_AP_KVM_ONLINE);
 }
+
+static int kvm_init_virtualization(void)
+{
+	if (enable_virt_at_load)
+		return kvm_enable_virtualization();
+
+	return 0;
+}
+
+static void kvm_uninit_virtualization(void)
+{
+	if (enable_virt_at_load)
+		kvm_disable_virtualization();
+}
 #else /* CONFIG_KVM_GENERIC_HARDWARE_ENABLING */
 static int kvm_enable_virtualization(void)
 {
 	return 0;
 }
 
+static int kvm_init_virtualization(void)
+{
+	return 0;
+}
+
 static void kvm_disable_virtualization(void)
 {
 
+}
+
+static void kvm_uninit_virtualization(void)
+{
+
 }
 #endif /* CONFIG_KVM_GENERIC_HARDWARE_ENABLING */
 
@@ -6475,6 +6502,10 @@ int kvm_init(unsigned vcpu_size, unsigned vcpu_align, struct module *module)
 
 	kvm_gmem_init(module);
 
+	r = kvm_init_virtualization();
+	if (r)
+		goto err_virt;
+
 	/*
 	 * Registration _must_ be the very last thing done, as this exposes
 	 * /dev/kvm to userspace, i.e. all infrastructure must be setup!
@@ -6488,6 +6519,8 @@ int kvm_init(unsigned vcpu_size, unsigned vcpu_align, struct module *module)
 	return 0;
 
 err_register:
+	kvm_uninit_virtualization();
+err_virt:
 	kvm_vfio_ops_exit();
 err_vfio:
 	kvm_async_pf_deinit();
@@ -6513,6 +6546,8 @@ void kvm_exit(void)
 	 */
 	misc_deregister(&kvm_dev);
 
+	kvm_uninit_virtualization();
+
 	debugfs_remove_recursive(kvm_debugfs_dir);
 	for_each_possible_cpu(cpu)
 		free_cpumask_var(per_cpu(cpu_kick_mask, cpu));
-- 
2.46.0.469.g59c65b2a67-goog


