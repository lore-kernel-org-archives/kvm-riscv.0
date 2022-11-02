From: Sean Christopherson <seanjc@google.com>
Date: Wed,  2 Nov 2022 23:18:57 +0000
Subject: [PATCH 30/44] KVM: Drop kvm_arch_check_processor_compat() hook
In-Reply-To: <20221102231911.3107438-1-seanjc@google.com>
References: <20221102231911.3107438-1-seanjc@google.com>
Message-ID: <20221102231911.3107438-31-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Drop kvm_arch_check_processor_compat() and its support code now that all
architecture implementations are nops.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kvm/arm.c       |  7 +------
 arch/mips/kvm/mips.c       |  7 +------
 arch/powerpc/kvm/book3s.c  |  2 +-
 arch/powerpc/kvm/e500.c    |  2 +-
 arch/powerpc/kvm/e500mc.c  |  2 +-
 arch/powerpc/kvm/powerpc.c |  5 -----
 arch/riscv/kvm/main.c      |  7 +------
 arch/s390/kvm/kvm-s390.c   |  7 +------
 arch/x86/kvm/svm/svm.c     |  4 ++--
 arch/x86/kvm/vmx/vmx.c     |  4 ++--
 arch/x86/kvm/x86.c         |  5 -----
 include/linux/kvm_host.h   |  4 +---
 virt/kvm/kvm_main.c        | 24 +-----------------------
 13 files changed, 13 insertions(+), 67 deletions(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 75c5125b0dd3..ed1836b6f044 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -63,11 +63,6 @@ int kvm_arch_vcpu_should_kick(struct kvm_vcpu *vcpu)
 	return kvm_vcpu_exiting_guest_mode(vcpu) == IN_GUEST_MODE;
 }
 
-int kvm_arch_check_processor_compat(void *opaque)
-{
-	return 0;
-}
-
 int kvm_vm_ioctl_enable_cap(struct kvm *kvm,
 			    struct kvm_enable_cap *cap)
 {
@@ -2268,7 +2263,7 @@ static __init int kvm_arm_init(void)
 	 * FIXME: Do something reasonable if kvm_init() fails after pKVM
 	 * hypervisor protection is finalized.
 	 */
-	err = kvm_init(NULL, sizeof(struct kvm_vcpu), 0, THIS_MODULE);
+	err = kvm_init(sizeof(struct kvm_vcpu), 0, THIS_MODULE);
 	if (err)
 		goto out_subs;
 
diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
index 3cade648827a..36c8991b5d39 100644
--- a/arch/mips/kvm/mips.c
+++ b/arch/mips/kvm/mips.c
@@ -135,11 +135,6 @@ void kvm_arch_hardware_disable(void)
 	kvm_mips_callbacks->hardware_disable();
 }
 
-int kvm_arch_check_processor_compat(void *opaque)
-{
-	return 0;
-}
-
 extern void kvm_init_loongson_ipi(struct kvm *kvm);
 
 int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
@@ -1636,7 +1631,7 @@ static int __init kvm_mips_init(void)
 
 	register_die_notifier(&kvm_mips_csr_die_notifier);
 
-	ret = kvm_init(NULL, sizeof(struct kvm_vcpu), 0, THIS_MODULE);
+	ret = kvm_init(sizeof(struct kvm_vcpu), 0, THIS_MODULE);
 	if (ret) {
 		unregister_die_notifier(&kvm_mips_csr_die_notifier);
 		return ret;
diff --git a/arch/powerpc/kvm/book3s.c b/arch/powerpc/kvm/book3s.c
index 87283a0e33d8..57f4e7896d67 100644
--- a/arch/powerpc/kvm/book3s.c
+++ b/arch/powerpc/kvm/book3s.c
@@ -1052,7 +1052,7 @@ static int kvmppc_book3s_init(void)
 {
 	int r;
 
-	r = kvm_init(NULL, sizeof(struct kvm_vcpu), 0, THIS_MODULE);
+	r = kvm_init(sizeof(struct kvm_vcpu), 0, THIS_MODULE);
 	if (r)
 		return r;
 #ifdef CONFIG_KVM_BOOK3S_32_HANDLER
diff --git a/arch/powerpc/kvm/e500.c b/arch/powerpc/kvm/e500.c
index 0ea61190ec04..b0f695428733 100644
--- a/arch/powerpc/kvm/e500.c
+++ b/arch/powerpc/kvm/e500.c
@@ -531,7 +531,7 @@ static int __init kvmppc_e500_init(void)
 	flush_icache_range(kvmppc_booke_handlers, kvmppc_booke_handlers +
 			   ivor[max_ivor] + handler_len);
 
-	r = kvm_init(NULL, sizeof(struct kvmppc_vcpu_e500), 0, THIS_MODULE);
+	r = kvm_init(sizeof(struct kvmppc_vcpu_e500), 0, THIS_MODULE);
 	if (r)
 		goto err_out;
 	kvm_ops_e500.owner = THIS_MODULE;
diff --git a/arch/powerpc/kvm/e500mc.c b/arch/powerpc/kvm/e500mc.c
index 795667f7ebf0..611532a0dedc 100644
--- a/arch/powerpc/kvm/e500mc.c
+++ b/arch/powerpc/kvm/e500mc.c
@@ -404,7 +404,7 @@ static int __init kvmppc_e500mc_init(void)
 	 */
 	kvmppc_init_lpid(KVMPPC_NR_LPIDS/threads_per_core);
 
-	r = kvm_init(NULL, sizeof(struct kvmppc_vcpu_e500), 0, THIS_MODULE);
+	r = kvm_init(sizeof(struct kvmppc_vcpu_e500), 0, THIS_MODULE);
 	if (r)
 		goto err_out;
 	kvm_ops_e500mc.owner = THIS_MODULE;
diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index 34278042ad27..51268be60dac 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -441,11 +441,6 @@ int kvm_arch_hardware_enable(void)
 	return 0;
 }
 
-int kvm_arch_check_processor_compat(void *opaque)
-{
-	return 0;
-}
-
 int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
 {
 	struct kvmppc_ops *kvm_ops = NULL;
diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
index 4710a6751687..34c3dece6990 100644
--- a/arch/riscv/kvm/main.c
+++ b/arch/riscv/kvm/main.c
@@ -20,11 +20,6 @@ long kvm_arch_dev_ioctl(struct file *filp,
 	return -EINVAL;
 }
 
-int kvm_arch_check_processor_compat(void *opaque)
-{
-	return 0;
-}
-
 int kvm_arch_hardware_enable(void)
 {
 	unsigned long hideleg, hedeleg;
@@ -110,6 +105,6 @@ static int __init riscv_kvm_init(void)
 
 	kvm_info("VMID %ld bits available\n", kvm_riscv_gstage_vmid_bits());
 
-	return kvm_init(NULL, sizeof(struct kvm_vcpu), 0, THIS_MODULE);
+	return kvm_init(sizeof(struct kvm_vcpu), 0, THIS_MODULE);
 }
 module_init(riscv_kvm_init);
diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
index 7c1c6d81b5d7..949231f1393e 100644
--- a/arch/s390/kvm/kvm-s390.c
+++ b/arch/s390/kvm/kvm-s390.c
@@ -254,11 +254,6 @@ int kvm_arch_hardware_enable(void)
 	return 0;
 }
 
-int kvm_arch_check_processor_compat(void *opaque)
-{
-	return 0;
-}
-
 /* forward declarations */
 static void kvm_gmap_notifier(struct gmap *gmap, unsigned long start,
 			      unsigned long end);
@@ -5654,7 +5649,7 @@ static int __init kvm_s390_init(void)
 	if (r)
 		return r;
 
-	r = kvm_init(NULL, sizeof(struct kvm_vcpu), 0, THIS_MODULE);
+	r = kvm_init(sizeof(struct kvm_vcpu), 0, THIS_MODULE);
 	if (r) {
 		__kvm_s390_exit();
 		return r;
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index 368b4db4b240..99c1ac2d9c84 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -5144,8 +5144,8 @@ static int __init svm_init(void)
 	 * Common KVM initialization _must_ come last, after this, /dev/kvm is
 	 * exposed to userspace!
 	 */
-	r = kvm_init(NULL, sizeof(struct vcpu_svm),
-		     __alignof__(struct vcpu_svm), THIS_MODULE);
+	r = kvm_init(sizeof(struct vcpu_svm), __alignof__(struct vcpu_svm),
+		     THIS_MODULE);
 	if (r)
 		goto err_kvm_init;
 
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 26baaccb659a..25e28d368274 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -8562,8 +8562,8 @@ static int __init vmx_init(void)
 	 * Common KVM initialization _must_ come last, after this, /dev/kvm is
 	 * exposed to userspace!
 	 */
-	r = kvm_init(NULL, sizeof(struct vcpu_vmx),
-		     __alignof__(struct vcpu_vmx), THIS_MODULE);
+	r = kvm_init(sizeof(struct vcpu_vmx), __alignof__(struct vcpu_vmx),
+		     THIS_MODULE);
 	if (r)
 		goto err_kvm_init;
 
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 94831f1a1d04..5b7b551ae44b 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -12036,11 +12036,6 @@ void kvm_arch_hardware_disable(void)
 	drop_user_return_notifiers();
 }
 
-int kvm_arch_check_processor_compat(void *opaque)
-{
-	return 0;
-}
-
 bool kvm_vcpu_is_reset_bsp(struct kvm_vcpu *vcpu)
 {
 	return vcpu->kvm->arch.bsp_vcpu_id == vcpu->vcpu_id;
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 6c2a28c4c684..0b96d836a051 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -936,8 +936,7 @@ static inline void kvm_irqfd_exit(void)
 {
 }
 #endif
-int kvm_init(void *opaque, unsigned vcpu_size, unsigned vcpu_align,
-		  struct module *module);
+int kvm_init(unsigned vcpu_size, unsigned vcpu_align, struct module *module);
 void kvm_exit(void);
 
 void kvm_get_kvm(struct kvm *kvm);
@@ -1444,7 +1443,6 @@ static inline void kvm_create_vcpu_debugfs(struct kvm_vcpu *vcpu) {}
 
 int kvm_arch_hardware_enable(void);
 void kvm_arch_hardware_disable(void);
-int kvm_arch_check_processor_compat(void *opaque);
 int kvm_arch_vcpu_runnable(struct kvm_vcpu *vcpu);
 bool kvm_arch_vcpu_in_kernel(struct kvm_vcpu *vcpu);
 int kvm_arch_vcpu_should_kick(struct kvm_vcpu *vcpu);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 17c852cb6842..dd13af9f06d5 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -5814,36 +5814,14 @@ void kvm_unregister_perf_callbacks(void)
 }
 #endif
 
-struct kvm_cpu_compat_check {
-	void *opaque;
-	int *ret;
-};
-
-static void check_processor_compat(void *data)
+int kvm_init(unsigned vcpu_size, unsigned vcpu_align, struct module *module)
 {
-	struct kvm_cpu_compat_check *c = data;
-
-	*c->ret = kvm_arch_check_processor_compat(c->opaque);
-}
-
-int kvm_init(void *opaque, unsigned vcpu_size, unsigned vcpu_align,
-		  struct module *module)
-{
-	struct kvm_cpu_compat_check c;
 	int r;
 	int cpu;
 
 	if (!zalloc_cpumask_var(&cpus_hardware_enabled, GFP_KERNEL))
 		return -ENOMEM;
 
-	c.ret = &r;
-	c.opaque = opaque;
-	for_each_online_cpu(cpu) {
-		smp_call_function_single(cpu, check_processor_compat, &c, 1);
-		if (r < 0)
-			goto out_free_2;
-	}
-
 	r = cpuhp_setup_state_nocalls(CPUHP_AP_KVM_STARTING, "kvm/cpu:starting",
 				      kvm_starting_cpu, kvm_dying_cpu);
 	if (r)
-- 
2.38.1.431.g37b22c650d-goog


