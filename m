From: Haibo Xu <haibo1.xu@intel.com>
Date: Tue, 25 Jul 2023 16:41:37 +0800
Subject: [PATCH v6 11/13] KVM: selftests: Add skip_set facility to get_reg_list test
In-Reply-To: <cover.1690273969.git.haibo1.xu@intel.com>
References: <cover.1690273969.git.haibo1.xu@intel.com>
Message-ID: <04cecbc3169d93d7501885a205851f4e8b0a935b.1690273969.git.haibo1.xu@intel.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add new skips_set members to vcpu_reg_sublist so as to skip
set operation on some registers.

Suggested-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 tools/testing/selftests/kvm/get-reg-list.c    | 20 +++++++++++++------
 .../selftests/kvm/include/kvm_util_base.h     |  2 ++
 2 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/kvm/get-reg-list.c b/tools/testing/selftests/kvm/get-reg-list.c
index 2232620fb797..be7bf5224434 100644
--- a/tools/testing/selftests/kvm/get-reg-list.c
+++ b/tools/testing/selftests/kvm/get-reg-list.c
@@ -163,6 +163,7 @@ static void run_test(struct vcpu_reg_list *c)
 {
 	int new_regs = 0, missing_regs = 0, i, n;
 	int failed_get = 0, failed_set = 0, failed_reject = 0;
+	int skipped_set = 0;
 	struct kvm_vcpu *vcpu;
 	struct kvm_vm *vm;
 	struct vcpu_reg_sublist *s;
@@ -216,7 +217,7 @@ static void run_test(struct vcpu_reg_list *c)
 			.id = reg_list->reg[i],
 			.addr = (__u64)&addr,
 		};
-		bool reject_reg = false;
+		bool reject_reg = false, skip_reg = false;
 		int ret;
 
 		ret = __vcpu_get_reg(vcpu, reg_list->reg[i], &addr);
@@ -227,8 +228,8 @@ static void run_test(struct vcpu_reg_list *c)
 			++failed_get;
 		}
 
-		/* rejects_set registers are rejected after KVM_ARM_VCPU_FINALIZE */
 		for_each_sublist(c, s) {
+			/* rejects_set registers are rejected for set operation */
 			if (s->rejects_set && find_reg(s->rejects_set, s->rejects_set_n, reg.id)) {
 				reject_reg = true;
 				ret = __vcpu_ioctl(vcpu, KVM_SET_ONE_REG, &reg);
@@ -240,9 +241,16 @@ static void run_test(struct vcpu_reg_list *c)
 				}
 				break;
 			}
+
+			/* skips_set registers are skipped for set operation */
+			if (s->skips_set && find_reg(s->skips_set, s->skips_set_n, reg.id)) {
+				skip_reg = true;
+				++skipped_set;
+				break;
+			}
 		}
 
-		if (!reject_reg) {
+		if (!reject_reg && !skip_reg) {
 			ret = __vcpu_ioctl(vcpu, KVM_SET_ONE_REG, &reg);
 			if (ret) {
 				printf("%s: Failed to set ", config_name(c));
@@ -287,9 +295,9 @@ static void run_test(struct vcpu_reg_list *c)
 	}
 
 	TEST_ASSERT(!missing_regs && !failed_get && !failed_set && !failed_reject,
-		    "%s: There are %d missing registers; "
-		    "%d registers failed get; %d registers failed set; %d registers failed reject",
-		    config_name(c), missing_regs, failed_get, failed_set, failed_reject);
+		    "%s: There are %d missing registers; %d registers failed get; "
+		    "%d registers failed set; %d registers failed reject; %d registers skipped set",
+		    config_name(c), missing_regs, failed_get, failed_set, failed_reject, skipped_set);
 
 	pr_info("%s: PASS\n", config_name(c));
 	blessed_n = 0;
diff --git a/tools/testing/selftests/kvm/include/kvm_util_base.h b/tools/testing/selftests/kvm/include/kvm_util_base.h
index ec65c292b5fd..a2623aaf3a55 100644
--- a/tools/testing/selftests/kvm/include/kvm_util_base.h
+++ b/tools/testing/selftests/kvm/include/kvm_util_base.h
@@ -134,6 +134,8 @@ struct vcpu_reg_sublist {
 	__u64 regs_n;
 	__u64 *rejects_set;
 	__u64 rejects_set_n;
+	__u64 *skips_set;
+	__u64 skips_set_n;
 };
 
 struct vcpu_reg_list {
-- 
2.34.1


