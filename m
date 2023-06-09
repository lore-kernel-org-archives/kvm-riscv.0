From: Haibo Xu <haibo1.xu@intel.com>
Date: Fri,  9 Jun 2023 10:12:17 +0800
Subject: [PATCH v3 09/10] KVM: riscv: selftests: Skip some registers set operation
In-Reply-To: <cover.1686275310.git.haibo1.xu@intel.com>
References: <cover.1686275310.git.haibo1.xu@intel.com>
Message-ID: <73045958d9ab71d5266d012f1e13061afa8c5331.1686275310.git.haibo1.xu@intel.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Set operation on some riscv registers(mostly pesudo ones) was not
supported and should be skipped in the get-reg-list test. Just
reuse the rejects_set utilities to handle it in riscv.

Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 tools/testing/selftests/kvm/get-reg-list.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/kvm/get-reg-list.c b/tools/testing/selftests/kvm/get-reg-list.c
index c4bd5a5259da..abacb95c21c6 100644
--- a/tools/testing/selftests/kvm/get-reg-list.c
+++ b/tools/testing/selftests/kvm/get-reg-list.c
@@ -211,16 +211,22 @@ static void run_test(struct vcpu_reg_list *c)
 			++failed_get;
 		}
 
-		/* rejects_set registers are rejected after KVM_ARM_VCPU_FINALIZE */
+		/*
+		 * rejects_set registers are rejected after KVM_ARM_VCPU_FINALIZE on aarch64,
+		 * or registers that should skip set operation on riscv.
+		 */
 		for_each_sublist(c, s) {
 			if (s->rejects_set && find_reg(s->rejects_set, s->rejects_set_n, reg.id)) {
 				reject_reg = true;
-				ret = __vcpu_ioctl(vcpu, KVM_SET_ONE_REG, &reg);
-				if (ret != -1 || errno != EPERM) {
-					printf("%s: Failed to reject (ret=%d, errno=%d) ", config_name(c), ret, errno);
-					print_reg(config_name(c), reg.id);
-					putchar('\n');
-					++failed_reject;
+				if ((reg.id & KVM_REG_ARCH_MASK) == KVM_REG_ARM64) {
+					ret = __vcpu_ioctl(vcpu, KVM_SET_ONE_REG, &reg);
+					if (ret != -1 || errno != EPERM) {
+						printf("%s: Failed to reject (ret=%d, errno=%d) ",
+								config_name(c), ret, errno);
+						print_reg(config_name(c), reg.id);
+						putchar('\n');
+						++failed_reject;
+					}
 				}
 				break;
 			}
-- 
2.34.1


