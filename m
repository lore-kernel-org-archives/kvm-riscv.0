From: Mayuresh Chitale <mchitale@ventanamicro.com>
Date: Wed, 26 Jul 2023 14:13:52 +0530
Subject: [PATCH v4 7/7] RISCV: KVM: Add sstateen0 to ONE_REG
In-Reply-To: <20230726084352.2136377-1-mchitale@ventanamicro.com>
References: <20230726084352.2136377-1-mchitale@ventanamicro.com>
Message-ID: <20230726084352.2136377-8-mchitale@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add support for sstateen0 CSR to the ONE_REG interface to allow its
access from user space.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/uapi/asm/kvm.h |  9 +++++++
 arch/riscv/kvm/vcpu_onereg.c      | 41 +++++++++++++++++++++++++++++++
 2 files changed, 50 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 7a43d08c3eed..fd3866cc08a2 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -93,6 +93,11 @@ struct kvm_riscv_aia_csr {
 	unsigned long iprio2h;
 };
 
+/* Smstateen CSR for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
+struct kvm_riscv_smstateen_csr {
+	unsigned long sstateen0;
+};
+
 /* TIMER registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
 struct kvm_riscv_timer {
 	__u64 frequency;
@@ -179,10 +184,14 @@ enum KVM_RISCV_SBI_EXT_ID {
 #define KVM_REG_RISCV_CSR		(0x03 << KVM_REG_RISCV_TYPE_SHIFT)
 #define KVM_REG_RISCV_CSR_GENERAL	(0x0 << KVM_REG_RISCV_SUBTYPE_SHIFT)
 #define KVM_REG_RISCV_CSR_AIA		(0x1 << KVM_REG_RISCV_SUBTYPE_SHIFT)
+#define KVM_REG_RISCV_CSR_SMSTATEEN	(0x2 << KVM_REG_RISCV_SUBTYPE_SHIFT)
+
 #define KVM_REG_RISCV_CSR_REG(name)	\
 		(offsetof(struct kvm_riscv_csr, name) / sizeof(unsigned long))
 #define KVM_REG_RISCV_CSR_AIA_REG(name)	\
 	(offsetof(struct kvm_riscv_aia_csr, name) / sizeof(unsigned long))
+#define KVM_REG_RISCV_CSR_SMSTATEEN_REG(name)	\
+	(offsetof(struct kvm_riscv_smstateen_csr, name) / sizeof(unsigned long))
 
 /* Timer registers are mapped as type 4 */
 #define KVM_REG_RISCV_TIMER		(0x04 << KVM_REG_RISCV_TYPE_SHIFT)
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index 0dc2c2cecb45..2d1ea5bb2a1d 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -49,6 +49,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	KVM_ISA_EXT_ARR(ZIFENCEI),
 	KVM_ISA_EXT_ARR(ZIHINTPAUSE),
 	KVM_ISA_EXT_ARR(ZIHPM),
+	KVM_ISA_EXT_ARR(SMSTATEEN),
 };
 
 static unsigned long kvm_riscv_vcpu_base2isa_ext(unsigned long base_ext)
@@ -350,6 +351,34 @@ static int kvm_riscv_vcpu_general_set_csr(struct kvm_vcpu *vcpu,
 	return 0;
 }
 
+static inline int kvm_riscv_vcpu_smstateen_set_csr(struct kvm_vcpu *vcpu,
+						   unsigned long reg_num,
+						   unsigned long reg_val)
+{
+	struct kvm_vcpu_smstateen_csr *csr = &vcpu->arch.smstateen_csr;
+
+	if (reg_num >= sizeof(struct kvm_riscv_smstateen_csr) /
+	    sizeof(unsigned long))
+		return -EINVAL;
+
+	((unsigned long *)csr)[reg_num] = reg_val;
+	return 0;
+}
+
+static int kvm_riscv_vcpu_smstateen_get_csr(struct kvm_vcpu *vcpu,
+					    unsigned long reg_num,
+					    unsigned long *out_val)
+{
+	struct kvm_vcpu_smstateen_csr *csr = &vcpu->arch.smstateen_csr;
+
+	if (reg_num >= sizeof(struct kvm_riscv_smstateen_csr) /
+	    sizeof(unsigned long))
+		return -EINVAL;
+
+	*out_val = ((unsigned long *)csr)[reg_num];
+	return 0;
+}
+
 static int kvm_riscv_vcpu_get_reg_csr(struct kvm_vcpu *vcpu,
 				      const struct kvm_one_reg *reg)
 {
@@ -373,6 +402,12 @@ static int kvm_riscv_vcpu_get_reg_csr(struct kvm_vcpu *vcpu,
 	case KVM_REG_RISCV_CSR_AIA:
 		rc = kvm_riscv_vcpu_aia_get_csr(vcpu, reg_num, &reg_val);
 		break;
+	case KVM_REG_RISCV_CSR_SMSTATEEN:
+		rc = -EINVAL;
+		if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN))
+			rc = kvm_riscv_vcpu_smstateen_get_csr(vcpu, reg_num,
+							      &reg_val);
+		break;
 	default:
 		rc = -EINVAL;
 		break;
@@ -412,6 +447,12 @@ static int kvm_riscv_vcpu_set_reg_csr(struct kvm_vcpu *vcpu,
 	case KVM_REG_RISCV_CSR_AIA:
 		rc = kvm_riscv_vcpu_aia_set_csr(vcpu, reg_num, reg_val);
 		break;
+	case KVM_REG_RISCV_CSR_SMSTATEEN:
+		rc = -EINVAL;
+		if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN))
+			rc = kvm_riscv_vcpu_smstateen_set_csr(vcpu, reg_num,
+							      reg_val);
+		break;
 	default:
 		rc = -EINVAL;
 		break;
-- 
2.34.1


