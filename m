From: Sean Christopherson <seanjc@google.com>
Date: Wed, 30 Nov 2022 23:09:08 +0000
Subject: [PATCH v2 24/50] KVM: RISC-V: Do arch init directly in riscv_kvm_init()
In-Reply-To: <20221130230934.1014142-1-seanjc@google.com>
References: <20221130230934.1014142-1-seanjc@google.com>
Message-ID: <20221130230934.1014142-25-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Fold the guts of kvm_arch_init() into riscv_kvm_init() instead of
bouncing through kvm_init()=>kvm_arch_init().  Functionally, this is a
glorified nop as invoking kvm_arch_init() is the very first action
performed by kvm_init().

Moving setup to riscv_kvm_init(), which is tagged __init, will allow
tagging more functions and data with __init and __ro_after_init.  And
emptying kvm_arch_init() will allow dropping the hook entirely once all
architecture implementations are nops.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
Reviewed-by: Philippe Mathieu-Daud? <philmd@linaro.org>
Acked-by: Anup Patel <anup@brainfault.org>
---
 arch/riscv/kvm/main.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
index a146fa0ce4d2..cb063b8a9a0f 100644
--- a/arch/riscv/kvm/main.c
+++ b/arch/riscv/kvm/main.c
@@ -66,6 +66,15 @@ void kvm_arch_hardware_disable(void)
 }
 
 int kvm_arch_init(void *opaque)
+{
+	return 0;
+}
+
+void kvm_arch_exit(void)
+{
+}
+
+static int __init riscv_kvm_init(void)
 {
 	const char *str;
 
@@ -110,15 +119,6 @@ int kvm_arch_init(void *opaque)
 
 	kvm_info("VMID %ld bits available\n", kvm_riscv_gstage_vmid_bits());
 
-	return 0;
-}
-
-void kvm_arch_exit(void)
-{
-}
-
-static int __init riscv_kvm_init(void)
-{
 	return kvm_init(NULL, sizeof(struct kvm_vcpu), 0, THIS_MODULE);
 }
 module_init(riscv_kvm_init);
-- 
2.38.1.584.g0f3c55d4c2-goog


