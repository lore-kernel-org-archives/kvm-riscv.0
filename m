From: Clément Léger <cleger@rivosinc.com>
Date: Thu, 18 Apr 2024 14:42:30 +0200
Subject: [PATCH v2 07/12] KVM: riscv: selftests: Add some Zc* extensions to get-reg-list test
In-Reply-To: <20240418124300.1387978-1-cleger@rivosinc.com>
References: <20240418124300.1387978-1-cleger@rivosinc.com>
Message-ID: <20240418124300.1387978-8-cleger@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The KVM RISC-V allows Zca, Zcf, Zcd and Zcb extensions for Guest/VM so
add these extensions to get-reg-list test.

Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
---
 tools/testing/selftests/kvm/riscv/get-reg-list.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index 40107bb61975..61cad4514197 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -55,6 +55,10 @@ bool filter_reg(__u64 reg)
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZBKC:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZBKX:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZBS:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZCA:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZCB:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZCD:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZCF:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZFA:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZFH:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZFHMIN:
@@ -421,6 +425,10 @@ static const char *isa_ext_single_id_to_str(__u64 reg_off)
 		KVM_ISA_EXT_ARR(ZBKC),
 		KVM_ISA_EXT_ARR(ZBKX),
 		KVM_ISA_EXT_ARR(ZBS),
+		KVM_ISA_EXT_ARR(ZCA),
+		KVM_ISA_EXT_ARR(ZCB),
+		KVM_ISA_EXT_ARR(ZCD),
+		KVM_ISA_EXT_ARR(ZCF),
 		KVM_ISA_EXT_ARR(ZFA),
 		KVM_ISA_EXT_ARR(ZFH),
 		KVM_ISA_EXT_ARR(ZFHMIN),
@@ -945,6 +953,10 @@ KVM_ISA_EXT_SIMPLE_CONFIG(zbkb, ZBKB);
 KVM_ISA_EXT_SIMPLE_CONFIG(zbkc, ZBKC);
 KVM_ISA_EXT_SIMPLE_CONFIG(zbkx, ZBKX);
 KVM_ISA_EXT_SIMPLE_CONFIG(zbs, ZBS);
+KVM_ISA_EXT_SIMPLE_CONFIG(zca, ZCA),
+KVM_ISA_EXT_SIMPLE_CONFIG(zcb, ZCB),
+KVM_ISA_EXT_SIMPLE_CONFIG(zcd, ZCD),
+KVM_ISA_EXT_SIMPLE_CONFIG(zcf, ZCF),
 KVM_ISA_EXT_SIMPLE_CONFIG(zfa, ZFA);
 KVM_ISA_EXT_SIMPLE_CONFIG(zfh, ZFH);
 KVM_ISA_EXT_SIMPLE_CONFIG(zfhmin, ZFHMIN);
@@ -1001,6 +1013,10 @@ struct vcpu_reg_list *vcpu_configs[] = {
 	&config_zbkc,
 	&config_zbkx,
 	&config_zbs,
+	&config_zca,
+	&config_zcb,
+	&config_zcd,
+	&config_zcf,
 	&config_zfa,
 	&config_zfh,
 	&config_zfhmin,
-- 
2.43.0


