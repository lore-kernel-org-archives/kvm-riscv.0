From: Sean Christopherson <seanjc@google.com>
Date: Thu, 29 Aug 2024 21:35:58 -0700
Subject: [PATCH v4 08/10] KVM: Add arch hooks for enabling/disabling virtualization
In-Reply-To: <20240830043600.127750-1-seanjc@google.com>
References: <20240830043600.127750-1-seanjc@google.com>
Message-ID: <20240830043600.127750-9-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add arch hooks that are invoked when KVM enables/disable virtualization.
x86 will use the hooks to register an "emergency disable" callback, which
is essentially an x86-specific shutdown notifier that is used when the
kernel is doing an emergency reboot/shutdown/kexec.

Add comments for the declarations to help arch code understand exactly
when the callbacks are invoked.  Alternatively, the APIs themselves could
communicate most of the same info, but kvm_arch_pre_enable_virtualization()
and kvm_arch_post_disable_virtualization() are a bit cumbersome, and make
it a bit less obvious that they are intended to be implemented as a pair.

Reviewed-by: Chao Gao <chao.gao@intel.com>
Reviewed-by: Kai Huang <kai.huang@intel.com>
Acked-by: Kai Huang <kai.huang@intel.com>
Tested-by: Farrah Chen <farrah.chen@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/kvm_host.h | 14 ++++++++++++++
 virt/kvm/kvm_main.c      | 14 ++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 63e46a5f3812..50ace701d468 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1514,6 +1514,20 @@ static inline void kvm_create_vcpu_debugfs(struct kvm_vcpu *vcpu) {}
 #endif
 
 #ifdef CONFIG_KVM_GENERIC_HARDWARE_ENABLING
+/*
+ * kvm_arch_{enable,disable}_virtualization() are called on one CPU, under
+ * kvm_usage_lock, immediately after/before 0=>1 and 1=>0 transitions of
+ * kvm_usage_count, i.e. at the beginning of the generic hardware enabling
+ * sequence, and at the end of the generic hardware disabling sequence.
+ */
+void kvm_arch_enable_virtualization(void);
+void kvm_arch_disable_virtualization(void);
+/*
+ * kvm_arch_{enable,disable}_virtualization_cpu() are called on "every" CPU to
+ * do the actual twiddling of hardware bits.  The hooks are called on all
+ * online CPUs when KVM enables/disabled virtualization, and on a single CPU
+ * when that CPU is onlined/offlined (including for Resume/Suspend).
+ */
 int kvm_arch_enable_virtualization_cpu(void);
 void kvm_arch_disable_virtualization_cpu(void);
 #endif
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 55779fbb37ec..9ae4bd8a3712 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -5582,6 +5582,16 @@ static DEFINE_PER_CPU(bool, virtualization_enabled);
 static DEFINE_MUTEX(kvm_usage_lock);
 static int kvm_usage_count;
 
+__weak void kvm_arch_enable_virtualization(void)
+{
+
+}
+
+__weak void kvm_arch_disable_virtualization(void)
+{
+
+}
+
 static int kvm_enable_virtualization_cpu(void)
 {
 	if (__this_cpu_read(virtualization_enabled))
@@ -5681,6 +5691,8 @@ static int kvm_enable_virtualization(void)
 	if (kvm_usage_count++)
 		return 0;
 
+	kvm_arch_enable_virtualization();
+
 	r = cpuhp_setup_state(CPUHP_AP_KVM_ONLINE, "kvm/cpu:online",
 			      kvm_online_cpu, kvm_offline_cpu);
 	if (r)
@@ -5711,6 +5723,7 @@ static int kvm_enable_virtualization(void)
 	unregister_syscore_ops(&kvm_syscore_ops);
 	cpuhp_remove_state(CPUHP_AP_KVM_ONLINE);
 err_cpuhp:
+	kvm_arch_disable_virtualization();
 	--kvm_usage_count;
 	return r;
 }
@@ -5724,6 +5737,7 @@ static void kvm_disable_virtualization(void)
 
 	unregister_syscore_ops(&kvm_syscore_ops);
 	cpuhp_remove_state(CPUHP_AP_KVM_ONLINE);
+	kvm_arch_disable_virtualization();
 }
 
 static int kvm_init_virtualization(void)
-- 
2.46.0.469.g59c65b2a67-goog


