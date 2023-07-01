From: Haibo Xu <haibo1.xu@intel.com>
Date: Sat,  1 Jul 2023 21:42:57 +0800
Subject: [PATCH v5 09/13] KVM: arm64: selftests: Move finalize_vcpu back to run_test
In-Reply-To: <cover.1688010022.git.haibo1.xu@intel.com>
References: <cover.1688010022.git.haibo1.xu@intel.com>
Message-ID: <a2a8fd67a11c9f640c9d1ee438984d84bac156ed.1688010022.git.haibo1.xu@intel.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

No functional changes. Just move the finalize_vcpu call back to
run_test and do weak function trick to prepare for the opration
in riscv.

Suggested-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 .../selftests/kvm/aarch64/get-reg-list.c      | 13 +++++++++++
 tools/testing/selftests/kvm/get-reg-list.c    | 22 +++++--------------
 .../selftests/kvm/include/kvm_util_base.h     |  3 +++
 3 files changed, 21 insertions(+), 17 deletions(-)

diff --git a/tools/testing/selftests/kvm/aarch64/get-reg-list.c b/tools/testing/selftests/kvm/aarch64/get-reg-list.c
index 4aa58f1aebe3..6a7f9de21640 100644
--- a/tools/testing/selftests/kvm/aarch64/get-reg-list.c
+++ b/tools/testing/selftests/kvm/aarch64/get-reg-list.c
@@ -32,6 +32,19 @@ bool check_reject_set(int err)
 	return err == EPERM;
 }
 
+void finalize_vcpu(struct kvm_vcpu *vcpu, struct vcpu_reg_list *c)
+{
+	struct vcpu_reg_sublist *s;
+	int feature;
+
+	for_each_sublist(c, s) {
+		if (s->finalize) {
+			feature = s->feature;
+			vcpu_ioctl(vcpu, KVM_ARM_VCPU_FINALIZE, &feature);
+		}
+	}
+}
+
 #define REG_MASK (KVM_REG_ARCH_MASK | KVM_REG_SIZE_MASK | KVM_REG_ARM_COPROC_MASK)
 
 #define CORE_REGS_XX_NR_WORDS	2
diff --git a/tools/testing/selftests/kvm/get-reg-list.c b/tools/testing/selftests/kvm/get-reg-list.c
index 79e198968860..c61090806007 100644
--- a/tools/testing/selftests/kvm/get-reg-list.c
+++ b/tools/testing/selftests/kvm/get-reg-list.c
@@ -34,9 +34,6 @@ static __u64 *blessed_reg, blessed_n;
 extern struct vcpu_reg_list *vcpu_configs[];
 extern int vcpu_configs_n;
 
-#define for_each_sublist(c, s)							\
-	for ((s) = &(c)->sublists[0]; (s)->regs; ++(s))
-
 #define for_each_reg(i)								\
 	for ((i) = 0; (i) < reg_list->n; ++(i))
 
@@ -103,6 +100,10 @@ bool __weak check_reject_set(int err)
 	return true;
 }
 
+void __weak finalize_vcpu(struct kvm_vcpu *vcpu, struct vcpu_reg_list *c)
+{
+}
+
 #ifdef __aarch64__
 static void prepare_vcpu_init(struct vcpu_reg_list *c, struct kvm_vcpu_init *init)
 {
@@ -113,19 +114,6 @@ static void prepare_vcpu_init(struct vcpu_reg_list *c, struct kvm_vcpu_init *ini
 			init->features[s->feature / 32] |= 1 << (s->feature % 32);
 }
 
-static void finalize_vcpu(struct kvm_vcpu *vcpu, struct vcpu_reg_list *c)
-{
-	struct vcpu_reg_sublist *s;
-	int feature;
-
-	for_each_sublist(c, s) {
-		if (s->finalize) {
-			feature = s->feature;
-			vcpu_ioctl(vcpu, KVM_ARM_VCPU_FINALIZE, &feature);
-		}
-	}
-}
-
 static struct kvm_vcpu *vcpu_config_get_vcpu(struct vcpu_reg_list *c, struct kvm_vm *vm)
 {
 	struct kvm_vcpu_init init = { .target = -1, };
@@ -134,7 +122,6 @@ static struct kvm_vcpu *vcpu_config_get_vcpu(struct vcpu_reg_list *c, struct kvm
 	prepare_vcpu_init(c, &init);
 	vcpu = __vm_vcpu_add(vm, 0);
 	aarch64_vcpu_setup(vcpu, &init);
-	finalize_vcpu(vcpu, c);
 
 	return vcpu;
 }
@@ -174,6 +161,7 @@ static void run_test(struct vcpu_reg_list *c)
 
 	vm = vm_create_barebones();
 	vcpu = vcpu_config_get_vcpu(c, vm);
+	finalize_vcpu(vcpu, c);
 
 	reg_list = vcpu_get_reg_list(vcpu);
 
diff --git a/tools/testing/selftests/kvm/include/kvm_util_base.h b/tools/testing/selftests/kvm/include/kvm_util_base.h
index ac4aaa21deee..e4480049000d 100644
--- a/tools/testing/selftests/kvm/include/kvm_util_base.h
+++ b/tools/testing/selftests/kvm/include/kvm_util_base.h
@@ -141,6 +141,9 @@ struct vcpu_reg_list {
 	struct vcpu_reg_sublist sublists[];
 };
 
+#define for_each_sublist(c, s)		\
+	for ((s) = &(c)->sublists[0]; (s)->regs; ++(s))
+
 #define kvm_for_each_vcpu(vm, i, vcpu)			\
 	for ((i) = 0; (i) <= (vm)->last_vcpu_id; (i)++)	\
 		if (!((vcpu) = vm->vcpus[i]))		\
-- 
2.34.1


