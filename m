From: Max Hsu <max.hsu@sifive.com>
Date: Fri, 29 Mar 2024 17:26:25 +0800
Subject: [PATCH RFC 09/11] riscv: KVM: Add scontext to ONE_REG
In-Reply-To: <20240329-dev-maxh-lin-452-6-9-v1-0-1534f93b94a7@sifive.com>
References: <20240329-dev-maxh-lin-452-6-9-v1-0-1534f93b94a7@sifive.com>
Message-ID: <20240329-dev-maxh-lin-452-6-9-v1-9-1534f93b94a7@sifive.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Yong-Xuan Wang <yongxuan.wang@sifive.com>

Updte the ONE_REG interface to allow the scontext CSR can be accessed from
user space.

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Co-developed-by: Max Hsu <max.hsu@sifive.com>
Signed-off-by: Max Hsu <max.hsu@sifive.com>
---
 arch/riscv/include/uapi/asm/kvm.h |  8 +++++
 arch/riscv/kvm/vcpu_onereg.c      | 62 +++++++++++++++++++++++++++++++++++++--
 2 files changed, 68 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 9f70da85ed51..1886722127d7 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -98,6 +98,11 @@ struct kvm_riscv_smstateen_csr {
 	unsigned long sstateen0;
 };
 
+/* Sdtrig CSR for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
+struct kvm_riscv_sdtrig_csr {
+	unsigned long scontext;
+};
+
 /* TIMER registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
 struct kvm_riscv_timer {
 	__u64 frequency;
@@ -224,12 +229,15 @@ struct kvm_riscv_sbi_sta {
 #define KVM_REG_RISCV_CSR_GENERAL	(0x0 << KVM_REG_RISCV_SUBTYPE_SHIFT)
 #define KVM_REG_RISCV_CSR_AIA		(0x1 << KVM_REG_RISCV_SUBTYPE_SHIFT)
 #define KVM_REG_RISCV_CSR_SMSTATEEN	(0x2 << KVM_REG_RISCV_SUBTYPE_SHIFT)
+#define KVM_REG_RISCV_CSR_SDTRIG	(0x3 << KVM_REG_RISCV_SUBTYPE_SHIFT)
 #define KVM_REG_RISCV_CSR_REG(name)	\
 		(offsetof(struct kvm_riscv_csr, name) / sizeof(unsigned long))
 #define KVM_REG_RISCV_CSR_AIA_REG(name)	\
 	(offsetof(struct kvm_riscv_aia_csr, name) / sizeof(unsigned long))
 #define KVM_REG_RISCV_CSR_SMSTATEEN_REG(name)  \
 	(offsetof(struct kvm_riscv_smstateen_csr, name) / sizeof(unsigned long))
+#define KVM_REG_RISCV_CSR_SDTRIG_REG(name)  \
+	(offsetof(struct kvm_riscv_sdtrig_csr, name) / sizeof(unsigned long))
 
 /* Timer registers are mapped as type 4 */
 #define KVM_REG_RISCV_TIMER		(0x04 << KVM_REG_RISCV_TYPE_SHIFT)
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index 10dda5ddc0a6..2796a86ec70b 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -471,6 +471,34 @@ static int kvm_riscv_vcpu_smstateen_get_csr(struct kvm_vcpu *vcpu,
 	return 0;
 }
 
+static inline int kvm_riscv_vcpu_sdtrig_set_csr(struct kvm_vcpu *vcpu,
+						unsigned long reg_num,
+						unsigned long reg_val)
+{
+	struct kvm_vcpu_sdtrig_csr *csr = &vcpu->arch.sdtrig_csr;
+
+	if (reg_num >= sizeof(struct kvm_riscv_sdtrig_csr) /
+		sizeof(unsigned long))
+		return -EINVAL;
+
+	((unsigned long *)csr)[reg_num] = reg_val;
+	return 0;
+}
+
+static int kvm_riscv_vcpu_sdtrig_get_csr(struct kvm_vcpu *vcpu,
+					 unsigned long reg_num,
+					 unsigned long *out_val)
+{
+	struct kvm_vcpu_sdtrig_csr *csr = &vcpu->arch.sdtrig_csr;
+
+	if (reg_num >= sizeof(struct kvm_riscv_sdtrig_csr) /
+		sizeof(unsigned long))
+		return -EINVAL;
+
+	*out_val = ((unsigned long *)csr)[reg_num];
+	return 0;
+}
+
 static int kvm_riscv_vcpu_get_reg_csr(struct kvm_vcpu *vcpu,
 				      const struct kvm_one_reg *reg)
 {
@@ -500,6 +528,11 @@ static int kvm_riscv_vcpu_get_reg_csr(struct kvm_vcpu *vcpu,
 			rc = kvm_riscv_vcpu_smstateen_get_csr(vcpu, reg_num,
 							      &reg_val);
 		break;
+	case KVM_REG_RISCV_CSR_SDTRIG:
+		rc = -EINVAL;
+		if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SDTRIG))
+			rc = kvm_riscv_vcpu_sdtrig_get_csr(vcpu, reg_num, &reg_val);
+		break;
 	default:
 		rc = -ENOENT;
 		break;
@@ -545,6 +578,11 @@ static int kvm_riscv_vcpu_set_reg_csr(struct kvm_vcpu *vcpu,
 			rc = kvm_riscv_vcpu_smstateen_set_csr(vcpu, reg_num,
 							      reg_val);
 		break;
+	case KVM_REG_RISCV_CSR_SDTRIG:
+		rc = -EINVAL;
+		if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SDTRIG))
+			rc = kvm_riscv_vcpu_sdtrig_set_csr(vcpu, reg_num, reg_val);
+		break;
 	default:
 		rc = -ENOENT;
 		break;
@@ -803,6 +841,8 @@ static inline unsigned long num_csr_regs(const struct kvm_vcpu *vcpu)
 		n += sizeof(struct kvm_riscv_aia_csr) / sizeof(unsigned long);
 	if (riscv_isa_extension_available(vcpu->arch.isa, SMSTATEEN))
 		n += sizeof(struct kvm_riscv_smstateen_csr) / sizeof(unsigned long);
+	if (riscv_isa_extension_available(vcpu->arch.isa, SDTRIG))
+		n += sizeof(struct kvm_riscv_sdtrig_csr) / sizeof(unsigned long);
 
 	return n;
 }
@@ -811,7 +851,7 @@ static int copy_csr_reg_indices(const struct kvm_vcpu *vcpu,
 				u64 __user *uindices)
 {
 	int n1 = sizeof(struct kvm_riscv_csr) / sizeof(unsigned long);
-	int n2 = 0, n3 = 0;
+	int n2 = 0, n3 = 0, n4 = 0;
 
 	/* copy general csr regs */
 	for (int i = 0; i < n1; i++) {
@@ -863,7 +903,25 @@ static int copy_csr_reg_indices(const struct kvm_vcpu *vcpu,
 		}
 	}
 
-	return n1 + n2 + n3;
+	/* copy Sdtrig csr regs */
+	if (riscv_isa_extension_available(vcpu->arch.isa, SDTRIG)) {
+		n4 = sizeof(struct kvm_riscv_sdtrig_csr) / sizeof(unsigned long);
+
+		for (int i = 0; i < n4; i++) {
+			u64 size = IS_ENABLED(CONFIG_32BIT) ?
+				   KVM_REG_SIZE_U32 : KVM_REG_SIZE_U64;
+			u64 reg = KVM_REG_RISCV | size | KVM_REG_RISCV_CSR |
+					  KVM_REG_RISCV_CSR_SDTRIG | i;
+
+			if (uindices) {
+				if (put_user(reg, uindices))
+					return -EFAULT;
+				uindices++;
+			}
+		}
+	}
+
+	return n1 + n2 + n3 + n4;
 }
 
 static inline unsigned long num_timer_regs(void)

-- 
2.43.2


