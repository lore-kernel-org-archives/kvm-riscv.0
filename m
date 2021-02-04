From: Atish Patra <atish.patra@wdc.com>
Date: Wed,  3 Feb 2021 21:32:39 -0800
Subject: [PATCH v2 6/6] RISC-V: Add SBI RESET extension in KVM
In-Reply-To: <20210204053239.1609558-1-atish.patra@wdc.com>
References: <20210204053239.1609558-1-atish.patra@wdc.com>
Message-ID: <20210204053239.1609558-7-atish.patra@wdc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

SBI RESET extension allows OS to initiate a system wide reboot or shutdown.

Implement the SBI RESET extension so that guests can issue shutdown/reset
requests as well.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/include/asm/kvm_vcpu_sbi.h |  1 +
 arch/riscv/kvm/vcpu_sbi.c             | 17 +++++++++++
 arch/riscv/kvm/vcpu_sbi_legacy.c      | 17 +----------
 arch/riscv/kvm/vcpu_sbi_replace.c     | 44 +++++++++++++++++++++++++++
 4 files changed, 63 insertions(+), 16 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
index e208c8ac57fe..4f08bb45d8ce 100644
--- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
+++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
@@ -29,4 +29,5 @@ struct kvm_vcpu_sbi_extension {
 
 void kvm_riscv_vcpu_sbi_forward(struct kvm_vcpu *vcpu, struct kvm_run *run);
 const struct kvm_vcpu_sbi_extension *kvm_vcpu_sbi_find_ext(unsigned long extid);
+void kvm_sbi_system_event(struct kvm_vcpu *vcpu, struct kvm_run *run, u32 type);
 #endif /* __RISCV_KVM_VCPU_SBI_H__ */
diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
index 20ef59ed83a6..858203b46700 100644
--- a/arch/riscv/kvm/vcpu_sbi.c
+++ b/arch/riscv/kvm/vcpu_sbi.c
@@ -38,6 +38,7 @@ extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_time;
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_ipi;
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_rfence;
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_hsm;
+extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_srst;
 
 static const struct kvm_vcpu_sbi_extension *sbi_ext[] = {
 	&vcpu_sbi_ext_legacy,
@@ -46,8 +47,24 @@ static const struct kvm_vcpu_sbi_extension *sbi_ext[] = {
 	&vcpu_sbi_ext_ipi,
 	&vcpu_sbi_ext_rfence,
 	&vcpu_sbi_ext_hsm,
+	&vcpu_sbi_ext_srst,
 };
 
+void kvm_sbi_system_event(struct kvm_vcpu *vcpu,
+			  struct kvm_run *run, u32 type)
+{
+	int i;
+	struct kvm_vcpu *tmp;
+
+	kvm_for_each_vcpu(i, tmp, vcpu->kvm)
+		tmp->arch.power_off = true;
+	kvm_make_all_cpus_request(vcpu->kvm, KVM_REQ_SLEEP);
+
+	memset(&run->system_event, 0, sizeof(run->system_event));
+	run->system_event.type = type;
+	run->exit_reason = KVM_EXIT_SYSTEM_EVENT;
+}
+
 void kvm_riscv_vcpu_sbi_forward(struct kvm_vcpu *vcpu, struct kvm_run *run)
 {
 	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
diff --git a/arch/riscv/kvm/vcpu_sbi_legacy.c b/arch/riscv/kvm/vcpu_sbi_legacy.c
index 126d97b1292d..9fd7ea386d5f 100644
--- a/arch/riscv/kvm/vcpu_sbi_legacy.c
+++ b/arch/riscv/kvm/vcpu_sbi_legacy.c
@@ -14,21 +14,6 @@
 #include <asm/kvm_vcpu_timer.h>
 #include <asm/kvm_vcpu_sbi.h>
 
-static void kvm_sbi_system_shutdown(struct kvm_vcpu *vcpu,
-				    struct kvm_run *run, u32 type)
-{
-	int i;
-	struct kvm_vcpu *tmp;
-
-	kvm_for_each_vcpu(i, tmp, vcpu->kvm)
-		tmp->arch.power_off = true;
-	kvm_make_all_cpus_request(vcpu->kvm, KVM_REQ_SLEEP);
-
-	memset(&run->system_event, 0, sizeof(run->system_event));
-	run->system_event.type = type;
-	run->exit_reason = KVM_EXIT_SYSTEM_EVENT;
-}
-
 static int kvm_sbi_ext_legacy_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
 				      unsigned long *out_val,
 				      struct kvm_cpu_trap *utrap,
@@ -83,7 +68,7 @@ static int kvm_sbi_ext_legacy_handler(struct kvm_vcpu *vcpu, struct kvm_run *run
 		}
 		break;
 	case SBI_EXT_0_1_SHUTDOWN:
-		kvm_sbi_system_shutdown(vcpu, run, KVM_SYSTEM_EVENT_SHUTDOWN);
+		kvm_sbi_system_event(vcpu, run, KVM_SYSTEM_EVENT_SHUTDOWN);
 		*exit = true;
 		break;
 	case SBI_EXT_0_1_REMOTE_FENCE_I:
diff --git a/arch/riscv/kvm/vcpu_sbi_replace.c b/arch/riscv/kvm/vcpu_sbi_replace.c
index dffb1930cada..7504e36ededb 100644
--- a/arch/riscv/kvm/vcpu_sbi_replace.c
+++ b/arch/riscv/kvm/vcpu_sbi_replace.c
@@ -134,3 +134,47 @@ const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_rfence = {
 	.extid_end = SBI_EXT_RFENCE,
 	.handler = kvm_sbi_ext_rfence_handler,
 };
+
+static int kvm_sbi_ext_srst_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
+				      unsigned long *out_val,
+				      struct kvm_cpu_trap *utrap, bool *exit)
+{
+	int ret = 0;
+	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
+	unsigned long reset_type = cp->a0;
+	unsigned long reset_reason = cp->a1;
+	unsigned long funcid = cp->a6;
+
+	if (!cp)
+		return -EINVAL;
+
+	if ((((u32)-1U) <= ((u64)reset_type)) ||
+	    (((u32)-1U) <= ((u64)reset_reason)))
+		return -EINVAL;
+
+	if ((funcid != SBI_EXT_SRST_RESET) ||
+	    (reset_reason > SBI_SRST_RESET_REASON_SYS_FAILURE))
+		ret = -EOPNOTSUPP;
+
+	switch (reset_type) {
+	case SBI_SRST_RESET_TYPE_SHUTDOWN:
+		kvm_sbi_system_event(vcpu, run, KVM_SYSTEM_EVENT_SHUTDOWN);
+		*exit = true;
+		break;
+	case SBI_SRST_RESET_TYPE_COLD_REBOOT:
+	case SBI_SRST_RESET_TYPE_WARM_REBOOT:
+		kvm_sbi_system_event(vcpu, run, KVM_SYSTEM_EVENT_RESET);
+		*exit = true;
+		break;
+	default:
+		ret = -EOPNOTSUPP;
+	};
+
+	return ret;
+}
+
+const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_srst = {
+	.extid_start = SBI_EXT_SRST,
+	.extid_end = SBI_EXT_SRST,
+	.handler = kvm_sbi_ext_srst_handler,
+};
-- 
2.25.1


