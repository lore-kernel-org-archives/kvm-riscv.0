From: Sean Christopherson <seanjc@google.com>
Date: Wed, 30 Nov 2022 23:09:13 +0000
Subject: [PATCH v2 29/50] KVM: Drop kvm_arch_{init,exit}() hooks
In-Reply-To: <20221130230934.1014142-1-seanjc@google.com>
References: <20221130230934.1014142-1-seanjc@google.com>
Message-ID: <20221130230934.1014142-30-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Drop kvm_arch_init() and kvm_arch_exit() now that all implementations
are nops.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
Reviewed-by: Eric Farman <farman@linux.ibm.com>	# s390
Reviewed-by: Philippe Mathieu-Daud? <philmd@linaro.org>
Acked-by: Anup Patel <anup@brainfault.org>
---
 arch/arm64/kvm/arm.c                | 11 -----------
 arch/mips/kvm/mips.c                | 10 ----------
 arch/powerpc/include/asm/kvm_host.h |  1 -
 arch/powerpc/kvm/powerpc.c          |  5 -----
 arch/riscv/kvm/main.c               |  9 ---------
 arch/s390/kvm/kvm-s390.c            | 10 ----------
 arch/x86/kvm/x86.c                  | 10 ----------
 include/linux/kvm_host.h            |  3 ---
 virt/kvm/kvm_main.c                 | 19 ++-----------------
 9 files changed, 2 insertions(+), 76 deletions(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 4d34abcfc9a9..936ef7d1ea94 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -2289,17 +2289,6 @@ static __init int kvm_arm_init(void)
 	return err;
 }
 
-int kvm_arch_init(void *opaque)
-{
-	return 0;
-}
-
-/* NOP: Compiling as a module not supported */
-void kvm_arch_exit(void)
-{
-
-}
-
 static int __init early_kvm_mode_cfg(char *arg)
 {
 	if (!arg)
diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
index ae7a24342fdf..3cade648827a 100644
--- a/arch/mips/kvm/mips.c
+++ b/arch/mips/kvm/mips.c
@@ -1010,16 +1010,6 @@ long kvm_arch_vm_ioctl(struct file *filp, unsigned int ioctl, unsigned long arg)
 	return r;
 }
 
-int kvm_arch_init(void *opaque)
-{
-	return 0;
-}
-
-void kvm_arch_exit(void)
-{
-
-}
-
 int kvm_arch_vcpu_ioctl_get_sregs(struct kvm_vcpu *vcpu,
 				  struct kvm_sregs *sregs)
 {
diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
index 5d2c3a487e73..0a80e80c7b9e 100644
--- a/arch/powerpc/include/asm/kvm_host.h
+++ b/arch/powerpc/include/asm/kvm_host.h
@@ -881,7 +881,6 @@ static inline void kvm_arch_sync_events(struct kvm *kvm) {}
 static inline void kvm_arch_memslots_updated(struct kvm *kvm, u64 gen) {}
 static inline void kvm_arch_flush_shadow_all(struct kvm *kvm) {}
 static inline void kvm_arch_sched_in(struct kvm_vcpu *vcpu, int cpu) {}
-static inline void kvm_arch_exit(void) {}
 static inline void kvm_arch_vcpu_blocking(struct kvm_vcpu *vcpu) {}
 static inline void kvm_arch_vcpu_unblocking(struct kvm_vcpu *vcpu) {}
 
diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index d44b85ba8cef..01d0f9935e6c 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -2539,11 +2539,6 @@ void kvmppc_init_lpid(unsigned long nr_lpids_param)
 }
 EXPORT_SYMBOL_GPL(kvmppc_init_lpid);
 
-int kvm_arch_init(void *opaque)
-{
-	return 0;
-}
-
 EXPORT_TRACEPOINT_SYMBOL_GPL(kvm_ppc_instr);
 
 void kvm_arch_create_vcpu_debugfs(struct kvm_vcpu *vcpu, struct dentry *debugfs_dentry)
diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
index cb063b8a9a0f..4710a6751687 100644
--- a/arch/riscv/kvm/main.c
+++ b/arch/riscv/kvm/main.c
@@ -65,15 +65,6 @@ void kvm_arch_hardware_disable(void)
 	csr_write(CSR_HIDELEG, 0);
 }
 
-int kvm_arch_init(void *opaque)
-{
-	return 0;
-}
-
-void kvm_arch_exit(void)
-{
-}
-
 static int __init riscv_kvm_init(void)
 {
 	const char *str;
diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
index 66d162723d21..25b08b956888 100644
--- a/arch/s390/kvm/kvm-s390.c
+++ b/arch/s390/kvm/kvm-s390.c
@@ -541,16 +541,6 @@ static void __kvm_s390_exit(void)
 	debug_unregister(kvm_s390_dbf_uv);
 }
 
-int kvm_arch_init(void *opaque)
-{
-	return 0;
-}
-
-void kvm_arch_exit(void)
-{
-
-}
-
 /* Section: device related */
 long kvm_arch_dev_ioctl(struct file *filp,
 			unsigned int ioctl, unsigned long arg)
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 45184ca89317..66f16458aa97 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -9277,16 +9277,6 @@ static inline void kvm_ops_update(struct kvm_x86_init_ops *ops)
 	kvm_pmu_ops_update(ops->pmu_ops);
 }
 
-int kvm_arch_init(void *opaque)
-{
-	return 0;
-}
-
-void kvm_arch_exit(void)
-{
-
-}
-
 static int __kvm_x86_vendor_init(struct kvm_x86_init_ops *ops)
 {
 	u64 host_pat;
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index f2e0e78d2d92..7dde28333e7c 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1439,9 +1439,6 @@ int kvm_arch_vcpu_ioctl_set_guest_debug(struct kvm_vcpu *vcpu,
 					struct kvm_guest_debug *dbg);
 int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu);
 
-int kvm_arch_init(void *opaque);
-void kvm_arch_exit(void);
-
 void kvm_arch_sched_in(struct kvm_vcpu *vcpu, int cpu);
 
 void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 0e62887e8ce1..a4a10a0b322f 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -5852,20 +5852,8 @@ int kvm_init(void *opaque, unsigned vcpu_size, unsigned vcpu_align,
 	int r;
 	int cpu;
 
-	/*
-	 * FIXME: Get rid of kvm_arch_init(), vendor code should call arch code
-	 * directly.  Note, kvm_arch_init() _must_ be called before anything
-	 * else as x86 relies on checks buried in kvm_arch_init() to guard
-	 * against multiple calls to kvm_init().
-	 */
-	r = kvm_arch_init(opaque);
-	if (r)
-		return r;
-
-	if (!zalloc_cpumask_var(&cpus_hardware_enabled, GFP_KERNEL)) {
-		r = -ENOMEM;
-		goto err_hw_enabled;
-	}
+	if (!zalloc_cpumask_var(&cpus_hardware_enabled, GFP_KERNEL))
+		return -ENOMEM;
 
 	c.ret = &r;
 	c.opaque = opaque;
@@ -5953,8 +5941,6 @@ int kvm_init(void *opaque, unsigned vcpu_size, unsigned vcpu_align,
 	cpuhp_remove_state_nocalls(CPUHP_AP_KVM_STARTING);
 out_free_2:
 	free_cpumask_var(cpus_hardware_enabled);
-err_hw_enabled:
-	kvm_arch_exit();
 	return r;
 }
 EXPORT_SYMBOL_GPL(kvm_init);
@@ -5982,7 +5968,6 @@ void kvm_exit(void)
 	on_each_cpu(hardware_disable_nolock, NULL, 1);
 	kvm_irqfd_exit();
 	free_cpumask_var(cpus_hardware_enabled);
-	kvm_arch_exit();
 }
 EXPORT_SYMBOL_GPL(kvm_exit);
 
-- 
2.38.1.584.g0f3c55d4c2-goog


