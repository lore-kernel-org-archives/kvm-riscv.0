From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 28 Nov 2023 20:23:47 +0530
Subject: [PATCH 05/15] KVM: riscv: selftests: Add scaler crypto extensions to get-reg-list test
In-Reply-To: <20231128145357.413321-1-apatel@ventanamicro.com>
References: <20231128145357.413321-1-apatel@ventanamicro.com>
Message-ID: <20231128145357.413321-6-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The KVM RISC-V allows scaler crypto extensions for Guest/VM so let us
add these extensions to get-reg-list test. This includes extensions
Zbkb, Zbkc, Zbkx, Zknd, Zkne, Zknh, Zkr, Zksed, Zksh, and Zkt.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 .../selftests/kvm/riscv/get-reg-list.c        | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index 4b75b011f2d8..aabc05e4b02b 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -45,6 +45,9 @@ bool filter_reg(__u64 reg)
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZBA:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZBB:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZBC:
+	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZBKB:
+	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZBKC:
+	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZBKX:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZBS:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZICBOM:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZICBOZ:
@@ -54,6 +57,13 @@ bool filter_reg(__u64 reg)
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZIFENCEI:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZIHINTPAUSE:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZIHPM:
+	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZKND:
+	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZKNE:
+	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZKNH:
+	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZKR:
+	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZKSED:
+	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZKSH:
+	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZKT:
 		return true;
 	/* AIA registers are always available when Ssaia can't be disabled */
 	case KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(siselect):
@@ -363,6 +373,9 @@ static const char *isa_ext_id_to_str(const char *prefix, __u64 id)
 		KVM_ISA_EXT_ARR(ZBA),
 		KVM_ISA_EXT_ARR(ZBB),
 		KVM_ISA_EXT_ARR(ZBC),
+		KVM_ISA_EXT_ARR(ZBKB),
+		KVM_ISA_EXT_ARR(ZBKC),
+		KVM_ISA_EXT_ARR(ZBKX),
 		KVM_ISA_EXT_ARR(ZBS),
 		KVM_ISA_EXT_ARR(ZICBOM),
 		KVM_ISA_EXT_ARR(ZICBOZ),
@@ -372,6 +385,13 @@ static const char *isa_ext_id_to_str(const char *prefix, __u64 id)
 		KVM_ISA_EXT_ARR(ZIFENCEI),
 		KVM_ISA_EXT_ARR(ZIHINTPAUSE),
 		KVM_ISA_EXT_ARR(ZIHPM),
+		KVM_ISA_EXT_ARR(ZKND),
+		KVM_ISA_EXT_ARR(ZKNE),
+		KVM_ISA_EXT_ARR(ZKNH),
+		KVM_ISA_EXT_ARR(ZKR),
+		KVM_ISA_EXT_ARR(ZKSED),
+		KVM_ISA_EXT_ARR(ZKSH),
+		KVM_ISA_EXT_ARR(ZKT),
 	};
 
 	if (reg_off >= ARRAY_SIZE(kvm_isa_ext_reg_name))
@@ -742,6 +762,9 @@ KVM_ISA_EXT_SIMPLE_CONFIG(svpbmt, SVPBMT);
 KVM_ISA_EXT_SIMPLE_CONFIG(zba, ZBA);
 KVM_ISA_EXT_SIMPLE_CONFIG(zbb, ZBB);
 KVM_ISA_EXT_SIMPLE_CONFIG(zbc, ZBC);
+KVM_ISA_EXT_SIMPLE_CONFIG(zbkb, ZBKB);
+KVM_ISA_EXT_SIMPLE_CONFIG(zbkc, ZBKC);
+KVM_ISA_EXT_SIMPLE_CONFIG(zbkx, ZBKX);
 KVM_ISA_EXT_SIMPLE_CONFIG(zbs, ZBS);
 KVM_ISA_EXT_SUBLIST_CONFIG(zicbom, ZICBOM);
 KVM_ISA_EXT_SUBLIST_CONFIG(zicboz, ZICBOZ);
@@ -751,6 +774,13 @@ KVM_ISA_EXT_SIMPLE_CONFIG(zicsr, ZICSR);
 KVM_ISA_EXT_SIMPLE_CONFIG(zifencei, ZIFENCEI);
 KVM_ISA_EXT_SIMPLE_CONFIG(zihintpause, ZIHINTPAUSE);
 KVM_ISA_EXT_SIMPLE_CONFIG(zihpm, ZIHPM);
+KVM_ISA_EXT_SIMPLE_CONFIG(zknd, ZKND);
+KVM_ISA_EXT_SIMPLE_CONFIG(zkne, ZKNE);
+KVM_ISA_EXT_SIMPLE_CONFIG(zknh, ZKNH);
+KVM_ISA_EXT_SIMPLE_CONFIG(zkr, ZKR);
+KVM_ISA_EXT_SIMPLE_CONFIG(zksed, ZKSED);
+KVM_ISA_EXT_SIMPLE_CONFIG(zksh, ZKSH);
+KVM_ISA_EXT_SIMPLE_CONFIG(zkt, ZKT);
 
 struct vcpu_reg_list *vcpu_configs[] = {
 	&config_aia,
@@ -765,6 +795,9 @@ struct vcpu_reg_list *vcpu_configs[] = {
 	&config_zba,
 	&config_zbb,
 	&config_zbc,
+	&config_zbkb,
+	&config_zbkc,
+	&config_zbkx,
 	&config_zbs,
 	&config_zicbom,
 	&config_zicboz,
@@ -774,5 +807,12 @@ struct vcpu_reg_list *vcpu_configs[] = {
 	&config_zifencei,
 	&config_zihintpause,
 	&config_zihpm,
+	&config_zknd,
+	&config_zkne,
+	&config_zknh,
+	&config_zkr,
+	&config_zksed,
+	&config_zksh,
+	&config_zkt,
 };
 int vcpu_configs_n = ARRAY_SIZE(vcpu_configs);
-- 
2.34.1


