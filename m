From: Sean Christopherson <seanjc@google.com>
Date: Wed, 30 Nov 2022 23:08:57 +0000
Subject: [PATCH v2 13/50] KVM: x86: Move guts of kvm_arch_init() to standalone helper
In-Reply-To: <20221130230934.1014142-1-seanjc@google.com>
References: <20221130230934.1014142-1-seanjc@google.com>
Message-ID: <20221130230934.1014142-14-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Move the guts of kvm_arch_init() to a new helper, kvm_x86_vendor_init(),
so that VMX can do _all_ arch and vendor initialization before calling
kvm_init().  Calling kvm_init() must be the _very_ last step during init,
as kvm_init() exposes /dev/kvm to userspace, i.e. allows creating VMs.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm_host.h |  3 +++
 arch/x86/kvm/svm/svm.c          | 23 +++++++++++++++++++++--
 arch/x86/kvm/vmx/vmx.c          | 21 +++++++++++++++------
 arch/x86/kvm/x86.c              | 15 +++++++++++++--
 4 files changed, 52 insertions(+), 10 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 70af7240a1d5..04a9ae66fb8d 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1758,6 +1758,9 @@ extern struct kvm_x86_ops kvm_x86_ops;
 #define KVM_X86_OP_OPTIONAL_RET0 KVM_X86_OP
 #include <asm/kvm-x86-ops.h>
 
+int kvm_x86_vendor_init(struct kvm_x86_init_ops *ops);
+void kvm_x86_vendor_exit(void);
+
 #define __KVM_HAVE_ARCH_VM_ALLOC
 static inline struct kvm *kvm_arch_alloc_vm(void)
 {
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index 91352d692845..19e81a99c58f 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -5091,15 +5091,34 @@ static struct kvm_x86_init_ops svm_init_ops __initdata = {
 
 static int __init svm_init(void)
 {
+	int r;
+
 	__unused_size_checks();
 
-	return kvm_init(&svm_init_ops, sizeof(struct vcpu_svm),
-			__alignof__(struct vcpu_svm), THIS_MODULE);
+	r = kvm_x86_vendor_init(&svm_init_ops);
+	if (r)
+		return r;
+
+	/*
+	 * Common KVM initialization _must_ come last, after this, /dev/kvm is
+	 * exposed to userspace!
+	 */
+	r = kvm_init(&svm_init_ops, sizeof(struct vcpu_svm),
+		     __alignof__(struct vcpu_svm), THIS_MODULE);
+	if (r)
+		goto err_kvm_init;
+
+	return 0;
+
+err_kvm_init:
+	kvm_x86_vendor_exit();
+	return r;
 }
 
 static void __exit svm_exit(void)
 {
 	kvm_exit();
+	kvm_x86_vendor_exit();
 }
 
 module_init(svm_init)
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index b8bf95b9710d..8e81cd94407d 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -8529,6 +8529,7 @@ static void vmx_exit(void)
 #endif
 
 	kvm_exit();
+	kvm_x86_vendor_exit();
 
 	vmx_cleanup_l1d_flush();
 
@@ -8546,23 +8547,25 @@ static int __init vmx_init(void)
 	 */
 	hv_init_evmcs();
 
+	r = kvm_x86_vendor_init(&vmx_init_ops);
+	if (r)
+		return r;
+
 	r = kvm_init(&vmx_init_ops, sizeof(struct vcpu_vmx),
 		     __alignof__(struct vcpu_vmx), THIS_MODULE);
 	if (r)
-		return r;
+		goto err_kvm_init;
 
 	/*
-	 * Must be called after kvm_init() so enable_ept is properly set
+	 * Must be called after common x86 init so enable_ept is properly set
 	 * up. Hand the parameter mitigation value in which was stored in
 	 * the pre module init parser. If no parameter was given, it will
 	 * contain 'auto' which will be turned into the default 'cond'
 	 * mitigation mode.
 	 */
 	r = vmx_setup_l1d_flush(vmentry_l1d_flush_param);
-	if (r) {
-		vmx_exit();
-		return r;
-	}
+	if (r)
+		goto err_l1d_flush;
 
 	vmx_setup_fb_clear_ctrl();
 
@@ -8587,5 +8590,11 @@ static int __init vmx_init(void)
 		allow_smaller_maxphyaddr = true;
 
 	return 0;
+
+err_l1d_flush:
+	vmx_exit();
+err_kvm_init:
+	kvm_x86_vendor_exit();
+	return r;
 }
 module_init(vmx_init);
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 915d57c3b41d..b33932fca36e 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -9278,7 +9278,16 @@ static inline void kvm_ops_update(struct kvm_x86_init_ops *ops)
 
 int kvm_arch_init(void *opaque)
 {
-	struct kvm_x86_init_ops *ops = opaque;
+	return 0;
+}
+
+void kvm_arch_exit(void)
+{
+
+}
+
+int kvm_x86_vendor_init(struct kvm_x86_init_ops *ops)
+{
 	u64 host_pat;
 	int r;
 
@@ -9410,8 +9419,9 @@ int kvm_arch_init(void *opaque)
 	kmem_cache_destroy(x86_emulator_cache);
 	return r;
 }
+EXPORT_SYMBOL_GPL(kvm_x86_vendor_init);
 
-void kvm_arch_exit(void)
+void kvm_x86_vendor_exit(void)
 {
 	kvm_unregister_perf_callbacks();
 
@@ -9440,6 +9450,7 @@ void kvm_arch_exit(void)
 	WARN_ON(static_branch_unlikely(&kvm_xen_enabled.key));
 #endif
 }
+EXPORT_SYMBOL_GPL(kvm_x86_vendor_exit);
 
 static int __kvm_emulate_halt(struct kvm_vcpu *vcpu, int state, int reason)
 {
-- 
2.38.1.584.g0f3c55d4c2-goog


