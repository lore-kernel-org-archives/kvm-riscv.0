From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 18 Sep 2023 23:36:46 +0530
Subject: [PATCH 4/4] KVM: riscv: selftests: Selectively filter-out AIA registers
In-Reply-To: <20230918180646.1398384-1-apatel@ventanamicro.com>
References: <20230918180646.1398384-1-apatel@ventanamicro.com>
Message-ID: <20230918180646.1398384-5-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Currently the AIA ONE_REG registers are reported by get-reg-list
as new registers for various vcpu_reg_list configs whenever Ssaia
is available on the host because Ssaia extension can only be
disabled by Smstateen extension which is not always available.

To tackle this, we should filter-out AIA ONE_REG registers only
when Ssaia can't be disabled for a VCPU.

Fixes: 477069398ed6 ("KVM: riscv: selftests: Add get-reg-list test")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 .../selftests/kvm/riscv/get-reg-list.c        | 23 +++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index 76c0ad11e423..85907c86b835 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -12,6 +12,8 @@
 
 #define REG_MASK (KVM_REG_ARCH_MASK | KVM_REG_SIZE_MASK)
 
+static bool isa_ext_cant_disable[KVM_RISCV_ISA_EXT_MAX];
+
 bool filter_reg(__u64 reg)
 {
 	switch (reg & ~REG_MASK) {
@@ -48,6 +50,15 @@ bool filter_reg(__u64 reg)
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZIFENCEI:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZIHPM:
 		return true;
+	/* AIA registers are always available when Ssaia can't be disabled */
+	case KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(siselect):
+	case KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(iprio1):
+	case KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(iprio2):
+	case KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(sieh):
+	case KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(siph):
+	case KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(iprio1h):
+	case KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(iprio2h):
+		return isa_ext_cant_disable[KVM_RISCV_ISA_EXT_SSAIA] ? true : false;
 	default:
 		break;
 	}
@@ -71,14 +82,22 @@ static inline bool vcpu_has_ext(struct kvm_vcpu *vcpu, int ext)
 
 void finalize_vcpu(struct kvm_vcpu *vcpu, struct vcpu_reg_list *c)
 {
+	int rc;
 	struct vcpu_reg_sublist *s;
+	unsigned long isa_ext_state[KVM_RISCV_ISA_EXT_MAX] = { 0 };
+
+	for (int i = 0; i < KVM_RISCV_ISA_EXT_MAX; i++)
+		__vcpu_get_reg(vcpu, RISCV_ISA_EXT_REG(i), &isa_ext_state[i]);
 
 	/*
 	 * Disable all extensions which were enabled by default
 	 * if they were available in the risc-v host.
 	 */
-	for (int i = 0; i < KVM_RISCV_ISA_EXT_MAX; i++)
-		__vcpu_set_reg(vcpu, RISCV_ISA_EXT_REG(i), 0);
+	for (int i = 0; i < KVM_RISCV_ISA_EXT_MAX; i++) {
+		rc = __vcpu_set_reg(vcpu, RISCV_ISA_EXT_REG(i), 0);
+		if (rc && isa_ext_state[i])
+			isa_ext_cant_disable[i] = true;
+	}
 
 	for_each_sublist(c, s) {
 		if (!s->feature)
-- 
2.34.1


