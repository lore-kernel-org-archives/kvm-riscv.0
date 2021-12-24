From: Anup Patel <anup.patel@wdc.com>
Date: Fri, 24 Dec 2021 13:06:01 +0530
Subject: [PATCH v4 1/4] RISC-V: KVM: Forward SBI experimental and vendor
 extensions
In-Reply-To: <20211224073604.1085464-1-anup.patel@wdc.com>
References: <20211224073604.1085464-1-anup.patel@wdc.com>
Message-ID: <20211224073604.1085464-2-anup.patel@wdc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The SBI experimental extension space is for temporary (or experimental)
stuff whereas SBI vendor extension space is for hardware vendor specific
stuff. Both these SBI extension spaces won't be standardized by the SBI
specification so let's blindly forward such SBI calls to the userspace.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Reviewed-and-tested-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vcpu_sbi.c      |  4 ++++
 arch/riscv/kvm/vcpu_sbi_base.c | 27 +++++++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
index f62d25bc9733..78aa3db76225 100644
--- a/arch/riscv/kvm/vcpu_sbi.c
+++ b/arch/riscv/kvm/vcpu_sbi.c
@@ -46,6 +46,8 @@ extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_time;
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_ipi;
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_rfence;
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_hsm;
+extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_experimental;
+extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_vendor;
 
 static const struct kvm_vcpu_sbi_extension *sbi_ext[] = {
 	&vcpu_sbi_ext_v01,
@@ -54,6 +56,8 @@ static const struct kvm_vcpu_sbi_extension *sbi_ext[] = {
 	&vcpu_sbi_ext_ipi,
 	&vcpu_sbi_ext_rfence,
 	&vcpu_sbi_ext_hsm,
+	&vcpu_sbi_ext_experimental,
+	&vcpu_sbi_ext_vendor,
 };
 
 void kvm_riscv_vcpu_sbi_forward(struct kvm_vcpu *vcpu, struct kvm_run *run)
diff --git a/arch/riscv/kvm/vcpu_sbi_base.c b/arch/riscv/kvm/vcpu_sbi_base.c
index d1ec08fe7289..4ecf377f483b 100644
--- a/arch/riscv/kvm/vcpu_sbi_base.c
+++ b/arch/riscv/kvm/vcpu_sbi_base.c
@@ -70,3 +70,30 @@ const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_base = {
 	.extid_end = SBI_EXT_BASE,
 	.handler = kvm_sbi_ext_base_handler,
 };
+
+static int kvm_sbi_ext_forward_handler(struct kvm_vcpu *vcpu,
+					struct kvm_run *run,
+					unsigned long *out_val,
+					struct kvm_cpu_trap *utrap,
+					bool *exit)
+{
+	/*
+	 * Both SBI experimental and vendor extensions are
+	 * unconditionally forwarded to userspace.
+	 */
+	kvm_riscv_vcpu_sbi_forward(vcpu, run);
+	*exit = true;
+	return 0;
+}
+
+const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_experimental = {
+	.extid_start = SBI_EXT_EXPERIMENTAL_START,
+	.extid_end = SBI_EXT_EXPERIMENTAL_END,
+	.handler = kvm_sbi_ext_forward_handler,
+};
+
+const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_vendor = {
+	.extid_start = SBI_EXT_VENDOR_START,
+	.extid_end = SBI_EXT_VENDOR_END,
+	.handler = kvm_sbi_ext_forward_handler,
+};
-- 
2.25.1


