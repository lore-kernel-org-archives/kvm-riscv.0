From: Sean Christopherson <seanjc@google.com>
Date: Fri, 10 Mar 2023 14:14:13 -0800
Subject: [PATCH 1/2] KVM: Use syscore_ops instead of reboot_notifier to hook restart/shutdown
In-Reply-To: <20230310221414.811690-1-seanjc@google.com>
References: <20230310221414.811690-1-seanjc@google.com>
Message-ID: <20230310221414.811690-2-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Use syscore_ops.shutdown to disable hardware virtualization during a
reboot instead of using the dedicated reboot_notifier so that KVM disables
virtualization _after_ system_state has been updated.  This will allow
fixing a race in KVM's handling of a forced reboot where KVM can end up
enabling hardware virtualization between kernel_restart_prepare() and
machine_restart().

Cc: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>
Cc: James Morse <james.morse@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Zenghui Yu <yuzenghui@huawei.com>
Cc: kvmarm at lists.linux.dev
Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Cc: Anup Patel <anup@brainfault.org>
Cc: Atish Patra <atishp@atishpatra.org>
Cc: kvm-riscv at lists.infradead.org
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index d255964ec331..6cdfbb2c641b 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -5211,8 +5211,7 @@ static int hardware_enable_all(void)
 	return r;
 }
 
-static int kvm_reboot(struct notifier_block *notifier, unsigned long val,
-		      void *v)
+static void kvm_reboot(void)
 {
 	/*
 	 * Some (well, at least mine) BIOSes hang on reboot if
@@ -5223,14 +5222,8 @@ static int kvm_reboot(struct notifier_block *notifier, unsigned long val,
 	pr_info("kvm: exiting hardware virtualization\n");
 	kvm_rebooting = true;
 	on_each_cpu(hardware_disable_nolock, NULL, 1);
-	return NOTIFY_OK;
 }
 
-static struct notifier_block kvm_reboot_notifier = {
-	.notifier_call = kvm_reboot,
-	.priority = 0,
-};
-
 static int kvm_suspend(void)
 {
 	/*
@@ -5261,6 +5254,8 @@ static void kvm_resume(void)
 static struct syscore_ops kvm_syscore_ops = {
 	.suspend = kvm_suspend,
 	.resume = kvm_resume,
+	.shutdown = kvm_reboot,
+
 };
 #else /* CONFIG_KVM_GENERIC_HARDWARE_ENABLING */
 static int hardware_enable_all(void)
@@ -5967,7 +5962,6 @@ int kvm_init(unsigned vcpu_size, unsigned vcpu_align, struct module *module)
 	if (r)
 		return r;
 
-	register_reboot_notifier(&kvm_reboot_notifier);
 	register_syscore_ops(&kvm_syscore_ops);
 #endif
 
@@ -6039,7 +6033,6 @@ int kvm_init(unsigned vcpu_size, unsigned vcpu_align, struct module *module)
 err_vcpu_cache:
 #ifdef CONFIG_KVM_GENERIC_HARDWARE_ENABLING
 	unregister_syscore_ops(&kvm_syscore_ops);
-	unregister_reboot_notifier(&kvm_reboot_notifier);
 	cpuhp_remove_state_nocalls(CPUHP_AP_KVM_ONLINE);
 #endif
 	return r;
@@ -6065,7 +6058,6 @@ void kvm_exit(void)
 	kvm_async_pf_deinit();
 #ifdef CONFIG_KVM_GENERIC_HARDWARE_ENABLING
 	unregister_syscore_ops(&kvm_syscore_ops);
-	unregister_reboot_notifier(&kvm_reboot_notifier);
 	cpuhp_remove_state_nocalls(CPUHP_AP_KVM_ONLINE);
 #endif
 	kvm_irqfd_exit();
-- 
2.40.0.rc1.284.g88254d51c5-goog


