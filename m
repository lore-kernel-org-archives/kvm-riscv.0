From: Haibo Xu <haibo1.xu@intel.com>
Date: Thu, 25 May 2023 15:38:33 +0800
Subject: [PATCH v2 09/11] KVM: riscv: selftests: Make check_supported arch specific
In-Reply-To: <cover.1684999824.git.haibo1.xu@intel.com>
References: <cover.1684999824.git.haibo1.xu@intel.com>
Message-ID: <26dea518fc5e8da51e61db279d175364bfecd009.1684999824.git.haibo1.xu@intel.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

check_supported() was used to verify whether a feature/extension was
supported in a guest in the get-reg-list test. Currently this info
can be retrieved through the KVM_CAP_ARM_* API in aarch64, but in
riscv, this info was only exposed through the KVM_GET_ONE_REG on
KVM_REG_RISCV_ISA_EXT pseudo registers.

Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
---
 tools/testing/selftests/kvm/get-reg-list.c | 32 +++++++++++-----------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/tools/testing/selftests/kvm/get-reg-list.c b/tools/testing/selftests/kvm/get-reg-list.c
index f6ad7991a812..f1fc113e9719 100644
--- a/tools/testing/selftests/kvm/get-reg-list.c
+++ b/tools/testing/selftests/kvm/get-reg-list.c
@@ -99,6 +99,20 @@ void __weak print_reg(const char *prefix, __u64 id)
 }
 
 #ifdef __aarch64__
+static void check_supported(struct vcpu_reg_list *c)
+{
+	struct vcpu_reg_sublist *s;
+
+	for_each_sublist(c, s) {
+		if (!s->capability)
+			continue;
+
+		__TEST_REQUIRE(kvm_has_cap(s->capability),
+			       "%s: %s not available, skipping tests\n",
+			       config_name(c), s->name);
+	}
+}
+
 static void prepare_vcpu_init(struct vcpu_reg_list *c, struct kvm_vcpu_init *init)
 {
 	struct vcpu_reg_sublist *s;
@@ -126,6 +140,8 @@ static struct kvm_vcpu *vcpu_config_get_vcpu(struct vcpu_reg_list *c, struct kvm
 	struct kvm_vcpu_init init = { .target = -1, };
 	struct kvm_vcpu *vcpu;
 
+	check_supported(c);
+
 	prepare_vcpu_init(c, &init);
 	vcpu = __vm_vcpu_add(vm, 0);
 	aarch64_vcpu_setup(vcpu, &init);
@@ -140,20 +156,6 @@ static struct kvm_vcpu *vcpu_config_get_vcpu(struct vcpu_reg_list *c, struct kvm
 }
 #endif
 
-static void check_supported(struct vcpu_reg_list *c)
-{
-	struct vcpu_reg_sublist *s;
-
-	for_each_sublist(c, s) {
-		if (!s->capability)
-			continue;
-
-		__TEST_REQUIRE(kvm_has_cap(s->capability),
-			       "%s: %s not available, skipping tests\n",
-			       config_name(c), s->name);
-	}
-}
-
 static bool print_list;
 static bool print_filtered;
 
@@ -165,8 +167,6 @@ static void run_test(struct vcpu_reg_list *c)
 	struct kvm_vm *vm;
 	struct vcpu_reg_sublist *s;
 
-	check_supported(c);
-
 	vm = vm_create_barebones();
 	vcpu = vcpu_config_get_vcpu(c, vm);
 
-- 
2.34.1


