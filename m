From: Sean Christopherson <seanjc@google.com>
Date: Wed, 30 Nov 2022 23:09:03 +0000
Subject: [PATCH v2 19/50] KVM: arm64: Do arm/arch initialization without
 bouncing through kvm_init()
In-Reply-To: <20221130230934.1014142-1-seanjc@google.com>
References: <20221130230934.1014142-1-seanjc@google.com>
Message-ID: <20221130230934.1014142-20-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Do arm/arch specific initialization directly in arm's module_init(), now
called kvm_arm_init(), instead of bouncing through kvm_init() to reach
kvm_arch_init().  Invoking kvm_arch_init() is the very first action
performed by kvm_init(), so from a initialization perspective this is a
glorified nop.

Avoiding kvm_arch_init() also fixes a mostly benign bug as kvm_arch_exit()
doesn't properly unwind if a later stage of kvm_init() fails.  While the
soon-to-be-deleted comment about compiling as a module being unsupported
is correct, kvm_arch_exit() can still be called by kvm_init() if any step
after the call to kvm_arch_init() succeeds.

Add a FIXME to call out that pKVM initialization isn't unwound if
kvm_init() fails, which is a pre-existing problem inherited from
kvm_arch_exit().

Making kvm_arch_init() a nop will also allow dropping kvm_arch_init() and
kvm_arch_exit() entirely once all other architectures follow suit.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kvm/arm.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index e6f6fcfe6bcc..d3a4db1abf32 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -2195,7 +2195,7 @@ void kvm_arch_irq_bypass_start(struct irq_bypass_consumer *cons)
 /**
  * Initialize Hyp-mode and memory mappings on all CPUs.
  */
-int kvm_arch_init(void *opaque)
+int kvm_arm_init(void)
 {
 	int err;
 	bool in_hyp_mode;
@@ -2269,6 +2269,14 @@ int kvm_arch_init(void *opaque)
 		kvm_info("Hyp mode initialized successfully\n");
 	}
 
+	/*
+	 * FIXME: Do something reasonable if kvm_init() fails after pKVM
+	 * hypervisor protection is finalized.
+	 */
+	err = kvm_init(NULL, sizeof(struct kvm_vcpu), 0, THIS_MODULE);
+	if (err)
+		goto out_subs;
+
 	return 0;
 
 out_subs:
@@ -2281,10 +2289,15 @@ int kvm_arch_init(void *opaque)
 	return err;
 }
 
+int kvm_arch_init(void *opaque)
+{
+	return 0;
+}
+
 /* NOP: Compiling as a module not supported */
 void kvm_arch_exit(void)
 {
-	kvm_unregister_perf_callbacks();
+
 }
 
 static int __init early_kvm_mode_cfg(char *arg)
@@ -2325,10 +2338,4 @@ enum kvm_mode kvm_get_mode(void)
 	return kvm_mode;
 }
 
-static int arm_init(void)
-{
-	int rc = kvm_init(NULL, sizeof(struct kvm_vcpu), 0, THIS_MODULE);
-	return rc;
-}
-
-module_init(arm_init);
+module_init(kvm_arm_init);
-- 
2.38.1.584.g0f3c55d4c2-goog


