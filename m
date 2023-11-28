From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 28 Nov 2023 20:23:49 +0530
Subject: [PATCH 07/15] KVM: riscv: selftests: Add vector crypto extensions to get-reg-list test
In-Reply-To: <20231128145357.413321-1-apatel@ventanamicro.com>
References: <20231128145357.413321-1-apatel@ventanamicro.com>
Message-ID: <20231128145357.413321-8-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The KVM RISC-V allows vector crypto extensions for Guest/VM so let us
add these extensions to get-reg-list test. This includes extensions
Zvbb, Zvbc, Zvkb, Zvkg, Zvkned, Zvknha, Zvknhb, Zvksed, Zvksh, and Zvkt.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 .../selftests/kvm/riscv/get-reg-list.c        | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index aabc05e4b02b..04ff8836c474 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -64,6 +64,16 @@ bool filter_reg(__u64 reg)
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZKSED:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZKSH:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZKT:
+	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZVBB:
+	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZVBC:
+	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZVKB:
+	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZVKG:
+	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZVKNED:
+	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZVKNHA:
+	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZVKNHB:
+	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZVKSED:
+	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZVKSH:
+	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZVKT:
 		return true;
 	/* AIA registers are always available when Ssaia can't be disabled */
 	case KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(siselect):
@@ -392,6 +402,16 @@ static const char *isa_ext_id_to_str(const char *prefix, __u64 id)
 		KVM_ISA_EXT_ARR(ZKSED),
 		KVM_ISA_EXT_ARR(ZKSH),
 		KVM_ISA_EXT_ARR(ZKT),
+		KVM_ISA_EXT_ARR(ZVBB),
+		KVM_ISA_EXT_ARR(ZVBC),
+		KVM_ISA_EXT_ARR(ZVKB),
+		KVM_ISA_EXT_ARR(ZVKG),
+		KVM_ISA_EXT_ARR(ZVKNED),
+		KVM_ISA_EXT_ARR(ZVKNHA),
+		KVM_ISA_EXT_ARR(ZVKNHB),
+		KVM_ISA_EXT_ARR(ZVKSED),
+		KVM_ISA_EXT_ARR(ZVKSH),
+		KVM_ISA_EXT_ARR(ZVKT),
 	};
 
 	if (reg_off >= ARRAY_SIZE(kvm_isa_ext_reg_name))
@@ -781,6 +801,16 @@ KVM_ISA_EXT_SIMPLE_CONFIG(zkr, ZKR);
 KVM_ISA_EXT_SIMPLE_CONFIG(zksed, ZKSED);
 KVM_ISA_EXT_SIMPLE_CONFIG(zksh, ZKSH);
 KVM_ISA_EXT_SIMPLE_CONFIG(zkt, ZKT);
+KVM_ISA_EXT_SIMPLE_CONFIG(zvbb, ZVBB);
+KVM_ISA_EXT_SIMPLE_CONFIG(zvbc, ZVBC);
+KVM_ISA_EXT_SIMPLE_CONFIG(zvkb, ZVKB);
+KVM_ISA_EXT_SIMPLE_CONFIG(zvkg, ZVKG);
+KVM_ISA_EXT_SIMPLE_CONFIG(zvkned, ZVKNED);
+KVM_ISA_EXT_SIMPLE_CONFIG(zvknha, ZVKNHA);
+KVM_ISA_EXT_SIMPLE_CONFIG(zvknhb, ZVKNHB);
+KVM_ISA_EXT_SIMPLE_CONFIG(zvksed, ZVKSED);
+KVM_ISA_EXT_SIMPLE_CONFIG(zvksh, ZVKSH);
+KVM_ISA_EXT_SIMPLE_CONFIG(zvkt, ZVKT);
 
 struct vcpu_reg_list *vcpu_configs[] = {
 	&config_aia,
@@ -814,5 +844,15 @@ struct vcpu_reg_list *vcpu_configs[] = {
 	&config_zksed,
 	&config_zksh,
 	&config_zkt,
+	&config_zvbb,
+	&config_zvbc,
+	&config_zvkb,
+	&config_zvkg,
+	&config_zvkned,
+	&config_zvknha,
+	&config_zvknhb,
+	&config_zvksed,
+	&config_zvksh,
+	&config_zvkt,
 };
 int vcpu_configs_n = ARRAY_SIZE(vcpu_configs);
-- 
2.34.1


