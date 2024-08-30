From: Sean Christopherson <seanjc@google.com>
Date: Thu, 29 Aug 2024 21:35:54 -0700
Subject: [PATCH v4 04/10] KVM: Rename arch hooks related to per-CPU
 virtualization enabling
In-Reply-To: <20240830043600.127750-1-seanjc@google.com>
References: <20240830043600.127750-1-seanjc@google.com>
Message-ID: <20240830043600.127750-5-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Rename the per-CPU hooks used to enable virtualization in hardware to
align with the KVM-wide helpers in kvm_main.c, and to better capture that
the callbacks are invoked on every online CPU.

No functional change intended.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kvm/arm.c      | 6 +++---
 arch/loongarch/kvm/main.c | 4 ++--
 arch/mips/kvm/mips.c      | 4 ++--
 arch/riscv/kvm/main.c     | 4 ++--
 arch/x86/kvm/x86.c        | 6 +++---
 include/linux/kvm_host.h  | 4 ++--
 virt/kvm/kvm_main.c       | 4 ++--
 7 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 9bef7638342e..9c8f5390ec63 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -2163,7 +2163,7 @@ static void cpu_hyp_uninit(void *discard)
 	}
 }
 
-int kvm_arch_hardware_enable(void)
+int kvm_arch_enable_virtualization_cpu(void)
 {
 	/*
 	 * Most calls to this function are made with migration
@@ -2183,7 +2183,7 @@ int kvm_arch_hardware_enable(void)
 	return 0;
 }
 
-void kvm_arch_hardware_disable(void)
+void kvm_arch_disable_virtualization_cpu(void)
 {
 	kvm_timer_cpu_down();
 	kvm_vgic_cpu_down();
@@ -2379,7 +2379,7 @@ static int __init do_pkvm_init(u32 hyp_va_bits)
 
 	/*
 	 * The stub hypercalls are now disabled, so set our local flag to
-	 * prevent a later re-init attempt in kvm_arch_hardware_enable().
+	 * prevent a later re-init attempt in kvm_arch_enable_virtualization_cpu().
 	 */
 	__this_cpu_write(kvm_hyp_initialized, 1);
 	preempt_enable();
diff --git a/arch/loongarch/kvm/main.c b/arch/loongarch/kvm/main.c
index 844736b99d38..27e9b94c0a0b 100644
--- a/arch/loongarch/kvm/main.c
+++ b/arch/loongarch/kvm/main.c
@@ -261,7 +261,7 @@ long kvm_arch_dev_ioctl(struct file *filp,
 	return -ENOIOCTLCMD;
 }
 
-int kvm_arch_hardware_enable(void)
+int kvm_arch_enable_virtualization_cpu(void)
 {
 	unsigned long env, gcfg = 0;
 
@@ -300,7 +300,7 @@ int kvm_arch_hardware_enable(void)
 	return 0;
 }
 
-void kvm_arch_hardware_disable(void)
+void kvm_arch_disable_virtualization_cpu(void)
 {
 	write_csr_gcfg(0);
 	write_csr_gstat(0);
diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
index b5de770b092e..52e1f275351e 100644
--- a/arch/mips/kvm/mips.c
+++ b/arch/mips/kvm/mips.c
@@ -125,12 +125,12 @@ int kvm_arch_vcpu_should_kick(struct kvm_vcpu *vcpu)
 	return 1;
 }
 
-int kvm_arch_hardware_enable(void)
+int kvm_arch_enable_virtualization_cpu(void)
 {
 	return kvm_mips_callbacks->hardware_enable();
 }
 
-void kvm_arch_hardware_disable(void)
+void kvm_arch_disable_virtualization_cpu(void)
 {
 	kvm_mips_callbacks->hardware_disable();
 }
diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
index bab2ec34cd87..f3427f6de608 100644
--- a/arch/riscv/kvm/main.c
+++ b/arch/riscv/kvm/main.c
@@ -20,7 +20,7 @@ long kvm_arch_dev_ioctl(struct file *filp,
 	return -EINVAL;
 }
 
-int kvm_arch_hardware_enable(void)
+int kvm_arch_enable_virtualization_cpu(void)
 {
 	csr_write(CSR_HEDELEG, KVM_HEDELEG_DEFAULT);
 	csr_write(CSR_HIDELEG, KVM_HIDELEG_DEFAULT);
@@ -35,7 +35,7 @@ int kvm_arch_hardware_enable(void)
 	return 0;
 }
 
-void kvm_arch_hardware_disable(void)
+void kvm_arch_disable_virtualization_cpu(void)
 {
 	kvm_riscv_aia_disable();
 
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 70219e406987..1182baf0d487 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -355,7 +355,7 @@ static void kvm_on_user_return(struct user_return_notifier *urn)
 
 	/*
 	 * Disabling irqs at this point since the following code could be
-	 * interrupted and executed through kvm_arch_hardware_disable()
+	 * interrupted and executed through kvm_arch_disable_virtualization_cpu()
 	 */
 	local_irq_save(flags);
 	if (msrs->registered) {
@@ -12512,7 +12512,7 @@ void kvm_vcpu_deliver_sipi_vector(struct kvm_vcpu *vcpu, u8 vector)
 }
 EXPORT_SYMBOL_GPL(kvm_vcpu_deliver_sipi_vector);
 
-int kvm_arch_hardware_enable(void)
+int kvm_arch_enable_virtualization_cpu(void)
 {
 	struct kvm *kvm;
 	struct kvm_vcpu *vcpu;
@@ -12608,7 +12608,7 @@ int kvm_arch_hardware_enable(void)
 	return 0;
 }
 
-void kvm_arch_hardware_disable(void)
+void kvm_arch_disable_virtualization_cpu(void)
 {
 	kvm_x86_call(hardware_disable)();
 	drop_user_return_notifiers();
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 79a6b1a63027..63e46a5f3812 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1514,8 +1514,8 @@ static inline void kvm_create_vcpu_debugfs(struct kvm_vcpu *vcpu) {}
 #endif
 
 #ifdef CONFIG_KVM_GENERIC_HARDWARE_ENABLING
-int kvm_arch_hardware_enable(void);
-void kvm_arch_hardware_disable(void);
+int kvm_arch_enable_virtualization_cpu(void);
+void kvm_arch_disable_virtualization_cpu(void);
 #endif
 int kvm_arch_vcpu_runnable(struct kvm_vcpu *vcpu);
 bool kvm_arch_vcpu_in_kernel(struct kvm_vcpu *vcpu);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index fbdd2e46e65b..b000f221abfb 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -5584,7 +5584,7 @@ static int kvm_enable_virtualization_cpu(void)
 	if (__this_cpu_read(virtualization_enabled))
 		return 0;
 
-	if (kvm_arch_hardware_enable()) {
+	if (kvm_arch_enable_virtualization_cpu()) {
 		pr_info("kvm: enabling virtualization on CPU%d failed\n",
 			raw_smp_processor_id());
 		return -EIO;
@@ -5609,7 +5609,7 @@ static void kvm_disable_virtualization_cpu(void *ign)
 	if (!__this_cpu_read(virtualization_enabled))
 		return;
 
-	kvm_arch_hardware_disable();
+	kvm_arch_disable_virtualization_cpu();
 
 	__this_cpu_write(virtualization_enabled, false);
 }
-- 
2.46.0.469.g59c65b2a67-goog


