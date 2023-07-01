From: Haibo Xu <haibo1.xu@intel.com>
Date: Sat,  1 Jul 2023 21:42:58 +0800
Subject: [PATCH v5 10/13] KVM: selftests: Only do get/set tests on present blessed list
In-Reply-To: <cover.1688010022.git.haibo1.xu@intel.com>
References: <cover.1688010022.git.haibo1.xu@intel.com>
Message-ID: <f44c3aa46971d524319c6340f9ce1b00c0182fd2.1688010022.git.haibo1.xu@intel.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Only do the get/set tests on present and blessed registers
since we don't know the capabilities of any new ones.

Suggested-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 tools/testing/selftests/kvm/get-reg-list.c | 29 ++++++++++++++--------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/tools/testing/selftests/kvm/get-reg-list.c b/tools/testing/selftests/kvm/get-reg-list.c
index c61090806007..74fb6f6fdd09 100644
--- a/tools/testing/selftests/kvm/get-reg-list.c
+++ b/tools/testing/selftests/kvm/get-reg-list.c
@@ -49,6 +49,10 @@ extern int vcpu_configs_n;
 	for_each_reg_filtered(i)						\
 		if (!find_reg(blessed_reg, blessed_n, reg_list->reg[i]))
 
+#define for_each_present_blessed_reg(i)			\
+	for ((i) = 0; (i) < blessed_n; ++(i))		\
+		if (find_reg(reg_list->reg, reg_list->n, blessed_reg[i]))
+
 static const char *config_name(struct vcpu_reg_list *c)
 {
 	struct vcpu_reg_sublist *s;
@@ -177,6 +181,16 @@ static void run_test(struct vcpu_reg_list *c)
 		return;
 	}
 
+	for_each_sublist(c, s)
+		blessed_n += s->regs_n;
+	blessed_reg = calloc(blessed_n, sizeof(__u64));
+
+	n = 0;
+	for_each_sublist(c, s) {
+		for (i = 0; i < s->regs_n; ++i)
+			blessed_reg[n++] = s->regs[i];
+	}
+
 	/*
 	 * We only test that we can get the register and then write back the
 	 * same value. Some registers may allow other values to be written
@@ -186,8 +200,11 @@ static void run_test(struct vcpu_reg_list *c)
 	 * be written need to have the other values tested, then we should
 	 * create a new set of tests for those in a new independent test
 	 * executable.
+	 *
+	 * Only do the get/set tests on present, blessed list registers,
+	 * since we don't know the capabilities of any new registers.
 	 */
-	for_each_reg(i) {
+	for_each_present_blessed_reg(i) {
 		uint8_t addr[2048 / 8];
 		struct kvm_one_reg reg = {
 			.id = reg_list->reg[i],
@@ -230,16 +247,6 @@ static void run_test(struct vcpu_reg_list *c)
 		}
 	}
 
-	for_each_sublist(c, s)
-		blessed_n += s->regs_n;
-	blessed_reg = calloc(blessed_n, sizeof(__u64));
-
-	n = 0;
-	for_each_sublist(c, s) {
-		for (i = 0; i < s->regs_n; ++i)
-			blessed_reg[n++] = s->regs[i];
-	}
-
 	for_each_new_reg(i)
 		++new_regs;
 
-- 
2.34.1


