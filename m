From: Haibo Xu <haibo1.xu@intel.com>
Date: Tue, 25 Jul 2023 16:41:30 +0800
Subject: [PATCH v6 04/13] KVM: arm64: selftests: Rename vcpu_config and add to kvm_util.h
In-Reply-To: <cover.1690273969.git.haibo1.xu@intel.com>
References: <cover.1690273969.git.haibo1.xu@intel.com>
Message-ID: <4c3a15ad6dcf7d58fcad5ca9bed56b30c539c358.1690273969.git.haibo1.xu@intel.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Andrew Jones <ajones@ventanamicro.com>

Rename vcpu_config to vcpu_reg_list to be more specific and add
it to kvm_util.h. While it may not get used outside get-reg-list
tests, exporting it doesn't hurt, as long as it has a unique enough
name. This is a step in the direction of sharing most of the get-
reg-list test code between architectures.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
---
 .../selftests/kvm/aarch64/get-reg-list.c      | 60 +++++++------------
 .../selftests/kvm/include/kvm_util_base.h     | 16 +++++
 2 files changed, 38 insertions(+), 38 deletions(-)

diff --git a/tools/testing/selftests/kvm/aarch64/get-reg-list.c b/tools/testing/selftests/kvm/aarch64/get-reg-list.c
index c9412be3a04c..cb6b40e167d0 100644
--- a/tools/testing/selftests/kvm/aarch64/get-reg-list.c
+++ b/tools/testing/selftests/kvm/aarch64/get-reg-list.c
@@ -37,17 +37,6 @@
 static struct kvm_reg_list *reg_list;
 static __u64 *blessed_reg, blessed_n;
 
-struct reg_sublist {
-	const char *name;
-	long capability;
-	int feature;
-	bool finalize;
-	__u64 *regs;
-	__u64 regs_n;
-	__u64 *rejects_set;
-	__u64 rejects_set_n;
-};
-
 struct feature_id_reg {
 	__u64 reg;
 	__u64 id_reg;
@@ -76,12 +65,7 @@ static struct feature_id_reg feat_id_regs[] = {
 	}
 };
 
-struct vcpu_config {
-	char *name;
-	struct reg_sublist sublists[];
-};
-
-static struct vcpu_config *vcpu_configs[];
+static struct vcpu_reg_list *vcpu_configs[];
 static int vcpu_configs_n;
 
 #define for_each_sublist(c, s)							\
@@ -103,9 +87,9 @@ static int vcpu_configs_n;
 	for_each_reg_filtered(i)						\
 		if (!find_reg(blessed_reg, blessed_n, reg_list->reg[i]))
 
-static const char *config_name(struct vcpu_config *c)
+static const char *config_name(struct vcpu_reg_list *c)
 {
-	struct reg_sublist *s;
+	struct vcpu_reg_sublist *s;
 	int len = 0;
 
 	if (c->name)
@@ -390,18 +374,18 @@ static void core_reg_fixup(void)
 	reg_list = tmp;
 }
 
-static void prepare_vcpu_init(struct vcpu_config *c, struct kvm_vcpu_init *init)
+static void prepare_vcpu_init(struct vcpu_reg_list *c, struct kvm_vcpu_init *init)
 {
-	struct reg_sublist *s;
+	struct vcpu_reg_sublist *s;
 
 	for_each_sublist(c, s)
 		if (s->capability)
 			init->features[s->feature / 32] |= 1 << (s->feature % 32);
 }
 
-static void finalize_vcpu(struct kvm_vcpu *vcpu, struct vcpu_config *c)
+static void finalize_vcpu(struct kvm_vcpu *vcpu, struct vcpu_reg_list *c)
 {
-	struct reg_sublist *s;
+	struct vcpu_reg_sublist *s;
 	int feature;
 
 	for_each_sublist(c, s) {
@@ -412,9 +396,9 @@ static void finalize_vcpu(struct kvm_vcpu *vcpu, struct vcpu_config *c)
 	}
 }
 
-static void check_supported(struct vcpu_config *c)
+static void check_supported(struct vcpu_reg_list *c)
 {
-	struct reg_sublist *s;
+	struct vcpu_reg_sublist *s;
 
 	for_each_sublist(c, s) {
 		if (!s->capability)
@@ -430,14 +414,14 @@ static bool print_list;
 static bool print_filtered;
 static bool fixup_core_regs;
 
-static void run_test(struct vcpu_config *c)
+static void run_test(struct vcpu_reg_list *c)
 {
 	struct kvm_vcpu_init init = { .target = -1, };
 	int new_regs = 0, missing_regs = 0, i, n;
 	int failed_get = 0, failed_set = 0, failed_reject = 0;
 	struct kvm_vcpu *vcpu;
 	struct kvm_vm *vm;
-	struct reg_sublist *s;
+	struct vcpu_reg_sublist *s;
 
 	check_supported(c);
 
@@ -574,7 +558,7 @@ static void run_test(struct vcpu_config *c)
 
 static void help(void)
 {
-	struct vcpu_config *c;
+	struct vcpu_reg_list *c;
 	int i;
 
 	printf(
@@ -598,9 +582,9 @@ static void help(void)
 	);
 }
 
-static struct vcpu_config *parse_config(const char *config)
+static struct vcpu_reg_list *parse_config(const char *config)
 {
-	struct vcpu_config *c;
+	struct vcpu_reg_list *c;
 	int i;
 
 	if (config[8] != '=')
@@ -620,7 +604,7 @@ static struct vcpu_config *parse_config(const char *config)
 
 int main(int ac, char **av)
 {
-	struct vcpu_config *c, *sel = NULL;
+	struct vcpu_reg_list *c, *sel = NULL;
 	int i, ret = 0;
 	pid_t pid;
 
@@ -1104,14 +1088,14 @@ static __u64 pauth_generic_regs[] = {
 		.regs_n		= ARRAY_SIZE(pauth_generic_regs),	\
 	}
 
-static struct vcpu_config vregs_config = {
+static struct vcpu_reg_list vregs_config = {
 	.sublists = {
 	BASE_SUBLIST,
 	VREGS_SUBLIST,
 	{0},
 	},
 };
-static struct vcpu_config vregs_pmu_config = {
+static struct vcpu_reg_list vregs_pmu_config = {
 	.sublists = {
 	BASE_SUBLIST,
 	VREGS_SUBLIST,
@@ -1119,14 +1103,14 @@ static struct vcpu_config vregs_pmu_config = {
 	{0},
 	},
 };
-static struct vcpu_config sve_config = {
+static struct vcpu_reg_list sve_config = {
 	.sublists = {
 	BASE_SUBLIST,
 	SVE_SUBLIST,
 	{0},
 	},
 };
-static struct vcpu_config sve_pmu_config = {
+static struct vcpu_reg_list sve_pmu_config = {
 	.sublists = {
 	BASE_SUBLIST,
 	SVE_SUBLIST,
@@ -1134,7 +1118,7 @@ static struct vcpu_config sve_pmu_config = {
 	{0},
 	},
 };
-static struct vcpu_config pauth_config = {
+static struct vcpu_reg_list pauth_config = {
 	.sublists = {
 	BASE_SUBLIST,
 	VREGS_SUBLIST,
@@ -1142,7 +1126,7 @@ static struct vcpu_config pauth_config = {
 	{0},
 	},
 };
-static struct vcpu_config pauth_pmu_config = {
+static struct vcpu_reg_list pauth_pmu_config = {
 	.sublists = {
 	BASE_SUBLIST,
 	VREGS_SUBLIST,
@@ -1152,7 +1136,7 @@ static struct vcpu_config pauth_pmu_config = {
 	},
 };
 
-static struct vcpu_config *vcpu_configs[] = {
+static struct vcpu_reg_list *vcpu_configs[] = {
 	&vregs_config,
 	&vregs_pmu_config,
 	&sve_config,
diff --git a/tools/testing/selftests/kvm/include/kvm_util_base.h b/tools/testing/selftests/kvm/include/kvm_util_base.h
index 07732a157ccd..1a455511503e 100644
--- a/tools/testing/selftests/kvm/include/kvm_util_base.h
+++ b/tools/testing/selftests/kvm/include/kvm_util_base.h
@@ -15,6 +15,7 @@
 #include <linux/kernel.h>
 #include <linux/kvm.h>
 #include "linux/rbtree.h"
+#include <linux/types.h>
 
 #include <asm/atomic.h>
 
@@ -124,6 +125,21 @@ struct kvm_vm {
 	uint32_t memslots[NR_MEM_REGIONS];
 };
 
+struct vcpu_reg_sublist {
+	const char *name;
+	long capability;
+	int feature;
+	bool finalize;
+	__u64 *regs;
+	__u64 regs_n;
+	__u64 *rejects_set;
+	__u64 rejects_set_n;
+};
+
+struct vcpu_reg_list {
+	char *name;
+	struct vcpu_reg_sublist sublists[];
+};
 
 #define kvm_for_each_vcpu(vm, i, vcpu)			\
 	for ((i) = 0; (i) <= (vm)->last_vcpu_id; (i)++)	\
-- 
2.34.1


