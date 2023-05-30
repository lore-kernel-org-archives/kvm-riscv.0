From: Andrew Jones <ajones@ventanamicro.com>
Date: Tue, 30 May 2023 19:50:22 +0200
Subject: [PATCH v3 1/3] RISC-V: KVM: Rename dis_idx to ext_idx
In-Reply-To: <20230530175024.354527-1-ajones@ventanamicro.com>
References: <20230530175024.354527-1-ajones@ventanamicro.com>
Message-ID: <20230530175024.354527-2-ajones@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Make the name of the extension_disabled[] index more general in
order to expand its application.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 arch/riscv/kvm/vcpu_sbi.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
index e52fde504433..6aa15f1b97d9 100644
--- a/arch/riscv/kvm/vcpu_sbi.c
+++ b/arch/riscv/kvm/vcpu_sbi.c
@@ -31,49 +31,49 @@ static const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_pmu = {
 #endif
 
 struct kvm_riscv_sbi_extension_entry {
-	enum KVM_RISCV_SBI_EXT_ID dis_idx;
+	enum KVM_RISCV_SBI_EXT_ID ext_idx;
 	const struct kvm_vcpu_sbi_extension *ext_ptr;
 };
 
 static const struct kvm_riscv_sbi_extension_entry sbi_ext[] = {
 	{
-		.dis_idx = KVM_RISCV_SBI_EXT_V01,
+		.ext_idx = KVM_RISCV_SBI_EXT_V01,
 		.ext_ptr = &vcpu_sbi_ext_v01,
 	},
 	{
-		.dis_idx = KVM_RISCV_SBI_EXT_MAX, /* Can't be disabled */
+		.ext_idx = KVM_RISCV_SBI_EXT_MAX, /* Can't be disabled */
 		.ext_ptr = &vcpu_sbi_ext_base,
 	},
 	{
-		.dis_idx = KVM_RISCV_SBI_EXT_TIME,
+		.ext_idx = KVM_RISCV_SBI_EXT_TIME,
 		.ext_ptr = &vcpu_sbi_ext_time,
 	},
 	{
-		.dis_idx = KVM_RISCV_SBI_EXT_IPI,
+		.ext_idx = KVM_RISCV_SBI_EXT_IPI,
 		.ext_ptr = &vcpu_sbi_ext_ipi,
 	},
 	{
-		.dis_idx = KVM_RISCV_SBI_EXT_RFENCE,
+		.ext_idx = KVM_RISCV_SBI_EXT_RFENCE,
 		.ext_ptr = &vcpu_sbi_ext_rfence,
 	},
 	{
-		.dis_idx = KVM_RISCV_SBI_EXT_SRST,
+		.ext_idx = KVM_RISCV_SBI_EXT_SRST,
 		.ext_ptr = &vcpu_sbi_ext_srst,
 	},
 	{
-		.dis_idx = KVM_RISCV_SBI_EXT_HSM,
+		.ext_idx = KVM_RISCV_SBI_EXT_HSM,
 		.ext_ptr = &vcpu_sbi_ext_hsm,
 	},
 	{
-		.dis_idx = KVM_RISCV_SBI_EXT_PMU,
+		.ext_idx = KVM_RISCV_SBI_EXT_PMU,
 		.ext_ptr = &vcpu_sbi_ext_pmu,
 	},
 	{
-		.dis_idx = KVM_RISCV_SBI_EXT_EXPERIMENTAL,
+		.ext_idx = KVM_RISCV_SBI_EXT_EXPERIMENTAL,
 		.ext_ptr = &vcpu_sbi_ext_experimental,
 	},
 	{
-		.dis_idx = KVM_RISCV_SBI_EXT_VENDOR,
+		.ext_idx = KVM_RISCV_SBI_EXT_VENDOR,
 		.ext_ptr = &vcpu_sbi_ext_vendor,
 	},
 };
@@ -147,7 +147,7 @@ static int riscv_vcpu_set_sbi_ext_single(struct kvm_vcpu *vcpu,
 		return -EINVAL;
 
 	for (i = 0; i < ARRAY_SIZE(sbi_ext); i++) {
-		if (sbi_ext[i].dis_idx == reg_num) {
+		if (sbi_ext[i].ext_idx == reg_num) {
 			sext = &sbi_ext[i];
 			break;
 		}
@@ -155,7 +155,7 @@ static int riscv_vcpu_set_sbi_ext_single(struct kvm_vcpu *vcpu,
 	if (!sext)
 		return -ENOENT;
 
-	scontext->extension_disabled[sext->dis_idx] = !reg_val;
+	scontext->extension_disabled[sext->ext_idx] = !reg_val;
 
 	return 0;
 }
@@ -172,7 +172,7 @@ static int riscv_vcpu_get_sbi_ext_single(struct kvm_vcpu *vcpu,
 		return -EINVAL;
 
 	for (i = 0; i < ARRAY_SIZE(sbi_ext); i++) {
-		if (sbi_ext[i].dis_idx == reg_num) {
+		if (sbi_ext[i].ext_idx == reg_num) {
 			sext = &sbi_ext[i];
 			break;
 		}
@@ -180,7 +180,7 @@ static int riscv_vcpu_get_sbi_ext_single(struct kvm_vcpu *vcpu,
 	if (!sext)
 		return -ENOENT;
 
-	*reg_val = !scontext->extension_disabled[sext->dis_idx];
+	*reg_val = !scontext->extension_disabled[sext->ext_idx];
 
 	return 0;
 }
@@ -315,8 +315,8 @@ const struct kvm_vcpu_sbi_extension *kvm_vcpu_sbi_find_ext(
 		sext = &sbi_ext[i];
 		if (sext->ext_ptr->extid_start <= extid &&
 		    sext->ext_ptr->extid_end >= extid) {
-			if (sext->dis_idx < KVM_RISCV_SBI_EXT_MAX &&
-			    scontext->extension_disabled[sext->dis_idx])
+			if (sext->ext_idx < KVM_RISCV_SBI_EXT_MAX &&
+			    scontext->extension_disabled[sext->ext_idx])
 				return NULL;
 			return sbi_ext[i].ext_ptr;
 		}
-- 
2.40.1


