From: Haibo Xu <haibo1.xu@intel.com>
Date: Sat,  1 Jul 2023 21:42:55 +0800
Subject: [PATCH v5 07/13] KVM: arm64: selftests: Finish generalizing get-reg-list
In-Reply-To: <cover.1688010022.git.haibo1.xu@intel.com>
References: <cover.1688010022.git.haibo1.xu@intel.com>
Message-ID: <0d81728cf8b4fd931b495ac4c86d6a74e55a5230.1688010022.git.haibo1.xu@intel.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Andrew Jones <ajones@ventanamicro.com>

Add some unfortunate #ifdeffery to ensure the common get-reg-list.c
can be compiled and run with other architectures. The next
architecture to support get-reg-list should now only need to provide
$(ARCH_DIR)/get-reg-list.c where arch-specific print_reg() and
vcpu_configs[] get defined.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
---
 tools/testing/selftests/kvm/get-reg-list.c | 26 +++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/kvm/get-reg-list.c b/tools/testing/selftests/kvm/get-reg-list.c
index 69bb91087081..f6ad7991a812 100644
--- a/tools/testing/selftests/kvm/get-reg-list.c
+++ b/tools/testing/selftests/kvm/get-reg-list.c
@@ -98,6 +98,7 @@ void __weak print_reg(const char *prefix, __u64 id)
 	printf("\t0x%llx,\n", id);
 }
 
+#ifdef __aarch64__
 static void prepare_vcpu_init(struct vcpu_reg_list *c, struct kvm_vcpu_init *init)
 {
 	struct vcpu_reg_sublist *s;
@@ -120,6 +121,25 @@ static void finalize_vcpu(struct kvm_vcpu *vcpu, struct vcpu_reg_list *c)
 	}
 }
 
+static struct kvm_vcpu *vcpu_config_get_vcpu(struct vcpu_reg_list *c, struct kvm_vm *vm)
+{
+	struct kvm_vcpu_init init = { .target = -1, };
+	struct kvm_vcpu *vcpu;
+
+	prepare_vcpu_init(c, &init);
+	vcpu = __vm_vcpu_add(vm, 0);
+	aarch64_vcpu_setup(vcpu, &init);
+	finalize_vcpu(vcpu, c);
+
+	return vcpu;
+}
+#else
+static struct kvm_vcpu *vcpu_config_get_vcpu(struct vcpu_reg_list *c, struct kvm_vm *vm)
+{
+	return __vm_vcpu_add(vm, 0);
+}
+#endif
+
 static void check_supported(struct vcpu_reg_list *c)
 {
 	struct vcpu_reg_sublist *s;
@@ -139,7 +159,6 @@ static bool print_filtered;
 
 static void run_test(struct vcpu_reg_list *c)
 {
-	struct kvm_vcpu_init init = { .target = -1, };
 	int new_regs = 0, missing_regs = 0, i, n;
 	int failed_get = 0, failed_set = 0, failed_reject = 0;
 	struct kvm_vcpu *vcpu;
@@ -149,10 +168,7 @@ static void run_test(struct vcpu_reg_list *c)
 	check_supported(c);
 
 	vm = vm_create_barebones();
-	prepare_vcpu_init(c, &init);
-	vcpu = __vm_vcpu_add(vm, 0);
-	aarch64_vcpu_setup(vcpu, &init);
-	finalize_vcpu(vcpu, c);
+	vcpu = vcpu_config_get_vcpu(c, vm);
 
 	reg_list = vcpu_get_reg_list(vcpu);
 
-- 
2.34.1


