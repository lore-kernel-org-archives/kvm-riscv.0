From: Sean Christopherson <seanjc@google.com>
Date: Wed, 30 Nov 2022 23:08:47 +0000
Subject: [PATCH v2 03/50] KVM: Allocate cpus_hardware_enabled after arch
 hardware setup
In-Reply-To: <20221130230934.1014142-1-seanjc@google.com>
References: <20221130230934.1014142-1-seanjc@google.com>
Message-ID: <20221130230934.1014142-4-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Allocate cpus_hardware_enabled after arch hardware setup so that arch
"init" and "hardware setup" are called back-to-back and thus can be
combined in a future patch.  cpus_hardware_enabled is never used before
kvm_create_vm(), i.e. doesn't have a dependency with hardware setup and
only needs to be allocated before /dev/kvm is exposed to userspace.

Free the object before the arch hooks are invoked to maintain symmetry,
and so that arch code can move away from the hooks without having to
worry about ordering changes.

Signed-off-by: Sean Christopherson <seanjc@google.com>
Reviewed-by: Yuan Yao <yuan.yao@intel.com>
---
 virt/kvm/kvm_main.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 43e2e4f38151..ded88ad6c2d8 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -5862,15 +5862,15 @@ int kvm_init(void *opaque, unsigned vcpu_size, unsigned vcpu_align,
 	if (r)
 		return r;
 
+	r = kvm_arch_hardware_setup(opaque);
+	if (r < 0)
+		goto err_hw_setup;
+
 	if (!zalloc_cpumask_var(&cpus_hardware_enabled, GFP_KERNEL)) {
 		r = -ENOMEM;
 		goto err_hw_enabled;
 	}
 
-	r = kvm_arch_hardware_setup(opaque);
-	if (r < 0)
-		goto out_free_1;
-
 	c.ret = &r;
 	c.opaque = opaque;
 	for_each_online_cpu(cpu) {
@@ -5956,10 +5956,10 @@ int kvm_init(void *opaque, unsigned vcpu_size, unsigned vcpu_align,
 	unregister_reboot_notifier(&kvm_reboot_notifier);
 	cpuhp_remove_state_nocalls(CPUHP_AP_KVM_STARTING);
 out_free_2:
-	kvm_arch_hardware_unsetup();
-out_free_1:
 	free_cpumask_var(cpus_hardware_enabled);
 err_hw_enabled:
+	kvm_arch_hardware_unsetup();
+err_hw_setup:
 	kvm_arch_exit();
 	return r;
 }
@@ -5986,9 +5986,9 @@ void kvm_exit(void)
 	cpuhp_remove_state_nocalls(CPUHP_AP_KVM_STARTING);
 	on_each_cpu(hardware_disable_nolock, NULL, 1);
 	kvm_irqfd_exit();
+	free_cpumask_var(cpus_hardware_enabled);
 	kvm_arch_hardware_unsetup();
 	kvm_arch_exit();
-	free_cpumask_var(cpus_hardware_enabled);
 	kvm_vfio_ops_exit();
 }
 EXPORT_SYMBOL_GPL(kvm_exit);
-- 
2.38.1.584.g0f3c55d4c2-goog


