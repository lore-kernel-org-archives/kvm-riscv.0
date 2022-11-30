From: Sean Christopherson <seanjc@google.com>
Date: Wed, 30 Nov 2022 23:09:20 +0000
Subject: [PATCH v2 36/50] KVM: x86: Do VMX/SVM support checks directly in
 vendor code
In-Reply-To: <20221130230934.1014142-1-seanjc@google.com>
References: <20221130230934.1014142-1-seanjc@google.com>
Message-ID: <20221130230934.1014142-37-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Do basic VMX/SVM support checks directly in vendor code instead of
implementing them via kvm_x86_ops hooks.  Beyond the superficial benefit
of providing common messages, which isn't even clearly a net positive
since vendor code can provide more precise/detailed messages, there's
zero advantage to bouncing through common x86 code.

Consolidating the checks will also simplify performing the checks
across all CPUs (in a future patch).

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm_host.h |  2 --
 arch/x86/kvm/svm/svm.c          | 38 +++++++++++++++------------------
 arch/x86/kvm/vmx/vmx.c          | 37 +++++++++++++++++---------------
 arch/x86/kvm/x86.c              | 11 ----------
 4 files changed, 37 insertions(+), 51 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 04a9ae66fb8d..d79aedf70908 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1729,8 +1729,6 @@ struct kvm_x86_nested_ops {
 };
 
 struct kvm_x86_init_ops {
-	int (*cpu_has_kvm_support)(void);
-	int (*disabled_by_bios)(void);
 	int (*check_processor_compatibility)(void);
 	int (*hardware_setup)(void);
 	unsigned int (*handle_intel_pt_intr)(void);
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index ab53da3fbcd1..49ccef9fae81 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -519,21 +519,28 @@ static void svm_init_osvw(struct kvm_vcpu *vcpu)
 		vcpu->arch.osvw.status |= 1;
 }
 
-static int has_svm(void)
+static bool kvm_is_svm_supported(void)
 {
 	const char *msg;
+	u64 vm_cr;
 
 	if (!cpu_has_svm(&msg)) {
-		printk(KERN_INFO "has_svm: %s\n", msg);
-		return 0;
+		pr_err("SVM not supported, %s\n", msg);
+		return false;
 	}
 
 	if (cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT)) {
 		pr_info("KVM is unsupported when running as an SEV guest\n");
-		return 0;
+		return false;
 	}
 
-	return 1;
+	rdmsrl(MSR_VM_CR, vm_cr);
+	if (vm_cr & (1 << SVM_VM_CR_SVM_DISABLE)) {
+		pr_err("SVM disabled (by BIOS) in MSR_VM_CR\n");
+		return false;
+	}
+
+	return true;
 }
 
 void __svm_write_tsc_multiplier(u64 multiplier)
@@ -572,10 +579,9 @@ static int svm_hardware_enable(void)
 	if (efer & EFER_SVME)
 		return -EBUSY;
 
-	if (!has_svm()) {
-		pr_err("%s: err EOPNOTSUPP on %d\n", __func__, me);
+	if (!kvm_is_svm_supported())
 		return -EINVAL;
-	}
+
 	sd = per_cpu_ptr(&svm_data, me);
 	sd->asid_generation = 1;
 	sd->max_asid = cpuid_ebx(SVM_CPUID_FUNC) - 1;
@@ -4070,17 +4076,6 @@ static void svm_load_mmu_pgd(struct kvm_vcpu *vcpu, hpa_t root_hpa,
 	vmcb_mark_dirty(svm->vmcb, VMCB_CR);
 }
 
-static int is_disabled(void)
-{
-	u64 vm_cr;
-
-	rdmsrl(MSR_VM_CR, vm_cr);
-	if (vm_cr & (1 << SVM_VM_CR_SVM_DISABLE))
-		return 1;
-
-	return 0;
-}
-
 static void
 svm_patch_hypercall(struct kvm_vcpu *vcpu, unsigned char *hypercall)
 {
@@ -5080,8 +5075,6 @@ static __init int svm_hardware_setup(void)
 
 
 static struct kvm_x86_init_ops svm_init_ops __initdata = {
-	.cpu_has_kvm_support = has_svm,
-	.disabled_by_bios = is_disabled,
 	.hardware_setup = svm_hardware_setup,
 	.check_processor_compatibility = svm_check_processor_compat,
 
@@ -5095,6 +5088,9 @@ static int __init svm_init(void)
 
 	__unused_size_checks();
 
+	if (!kvm_is_svm_supported())
+		return -EOPNOTSUPP;
+
 	r = kvm_x86_vendor_init(&svm_init_ops);
 	if (r)
 		return r;
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 3f7d9f88b314..23b64bf4bfcf 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -2485,17 +2485,6 @@ static void vmx_cache_reg(struct kvm_vcpu *vcpu, enum kvm_reg reg)
 	}
 }
 
-static __init int cpu_has_kvm_support(void)
-{
-	return cpu_has_vmx();
-}
-
-static __init int vmx_disabled_by_bios(void)
-{
-	return !this_cpu_has(X86_FEATURE_MSR_IA32_FEAT_CTL) ||
-	       !this_cpu_has(X86_FEATURE_VMX);
-}
-
 static int kvm_cpu_vmxon(u64 vmxon_pointer)
 {
 	u64 msr;
@@ -7479,16 +7468,29 @@ static int vmx_vm_init(struct kvm *kvm)
 	return 0;
 }
 
+static bool __init kvm_is_vmx_supported(void)
+{
+	if (!cpu_has_vmx()) {
+		pr_err("CPU doesn't support VMX\n");
+		return false;
+	}
+
+	if (!this_cpu_has(X86_FEATURE_MSR_IA32_FEAT_CTL) ||
+	    !this_cpu_has(X86_FEATURE_VMX)) {
+		pr_err("VMX not enabled (by BIOS) in MSR_IA32_FEAT_CTL\n");
+		return false;
+	}
+
+	return true;
+}
+
 static int __init vmx_check_processor_compat(void)
 {
 	struct vmcs_config vmcs_conf;
 	struct vmx_capability vmx_cap;
 
-	if (!this_cpu_has(X86_FEATURE_MSR_IA32_FEAT_CTL) ||
-	    !this_cpu_has(X86_FEATURE_VMX)) {
-		pr_err("VMX is disabled on CPU %d\n", smp_processor_id());
+	if (!kvm_is_vmx_supported())
 		return -EIO;
-	}
 
 	if (setup_vmcs_config(&vmcs_conf, &vmx_cap) < 0)
 		return -EIO;
@@ -8499,8 +8501,6 @@ static __init int hardware_setup(void)
 }
 
 static struct kvm_x86_init_ops vmx_init_ops __initdata = {
-	.cpu_has_kvm_support = cpu_has_kvm_support,
-	.disabled_by_bios = vmx_disabled_by_bios,
 	.check_processor_compatibility = vmx_check_processor_compat,
 	.hardware_setup = hardware_setup,
 	.handle_intel_pt_intr = NULL,
@@ -8543,6 +8543,9 @@ static int __init vmx_init(void)
 {
 	int r, cpu;
 
+	if (!kvm_is_vmx_supported())
+		return -EOPNOTSUPP;
+
 	/*
 	 * Note, hv_init_evmcs() touches only VMX knobs, i.e. there's nothing
 	 * to unwind if a later step fails.
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 3d5455e08191..5551f3552f08 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -9315,17 +9315,6 @@ static int __kvm_x86_vendor_init(struct kvm_x86_init_ops *ops)
 		return -EEXIST;
 	}
 
-	if (!ops->cpu_has_kvm_support()) {
-		pr_err_ratelimited("no hardware support for '%s'\n",
-				   ops->runtime_ops->name);
-		return -EOPNOTSUPP;
-	}
-	if (ops->disabled_by_bios()) {
-		pr_err_ratelimited("support for '%s' disabled by bios\n",
-				   ops->runtime_ops->name);
-		return -EOPNOTSUPP;
-	}
-
 	/*
 	 * KVM explicitly assumes that the guest has an FPU and
 	 * FXSAVE/FXRSTOR. For example, the KVM_GET_FPU explicitly casts the
-- 
2.38.1.584.g0f3c55d4c2-goog


