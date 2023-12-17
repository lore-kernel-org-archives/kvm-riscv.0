From: Andrew Jones <ajones@ventanamicro.com>
Date: Sun, 17 Dec 2023 21:40:27 +0100
Subject: [PATCH v3 07/13] RISC-V: KVM: Add support for SBI extension registers
In-Reply-To: <20231217204019.36492-15-ajones@ventanamicro.com>
References: <20231217204019.36492-15-ajones@ventanamicro.com>
Message-ID: <20231217204019.36492-22-ajones@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Some SBI extensions have state that needs to be saved / restored
when migrating the VM. Provide a get/set-one-reg register type
for SBI extension registers. Each SBI extension that uses this type
will have its own subtype. There are currently no subtypes defined.
The next patch introduces the first one.

Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_vcpu_sbi.h |  4 ++
 arch/riscv/include/uapi/asm/kvm.h     |  3 ++
 arch/riscv/kvm/vcpu_onereg.c          | 42 +++++++++++++++++--
 arch/riscv/kvm/vcpu_sbi.c             | 58 +++++++++++++++++++++++++++
 4 files changed, 103 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
index 99c23bb37a37..dd60f73b5c36 100644
--- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
+++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
@@ -60,6 +60,10 @@ int kvm_riscv_vcpu_set_reg_sbi_ext(struct kvm_vcpu *vcpu,
 				   const struct kvm_one_reg *reg);
 int kvm_riscv_vcpu_get_reg_sbi_ext(struct kvm_vcpu *vcpu,
 				   const struct kvm_one_reg *reg);
+int kvm_riscv_vcpu_set_reg_sbi(struct kvm_vcpu *vcpu,
+			       const struct kvm_one_reg *reg);
+int kvm_riscv_vcpu_get_reg_sbi(struct kvm_vcpu *vcpu,
+			       const struct kvm_one_reg *reg);
 const struct kvm_vcpu_sbi_extension *kvm_vcpu_sbi_find_ext(
 				struct kvm_vcpu *vcpu, unsigned long extid);
 bool riscv_vcpu_supports_sbi_ext(struct kvm_vcpu *vcpu, int idx);
diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index e961d79622fb..30f89a0e855f 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -242,6 +242,9 @@ enum KVM_RISCV_SBI_EXT_ID {
 #define KVM_REG_RISCV_VECTOR_REG(n)	\
 		((n) + sizeof(struct __riscv_v_ext_state) / sizeof(unsigned long))
 
+/* Registers for specific SBI extensions are mapped as type 10 */
+#define KVM_REG_RISCV_SBI		(0x0a << KVM_REG_RISCV_TYPE_SHIFT)
+
 /* Device Control API: RISC-V AIA */
 #define KVM_DEV_RISCV_APLIC_ALIGN		0x1000
 #define KVM_DEV_RISCV_APLIC_SIZE		0x4000
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index 11cdbf844291..901480e73817 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -961,6 +961,29 @@ static unsigned long num_sbi_ext_regs(struct kvm_vcpu *vcpu)
 	return copy_sbi_ext_reg_indices(vcpu, NULL);
 }
 
+static inline unsigned long num_sbi_regs(struct kvm_vcpu *vcpu)
+{
+	return 0;
+}
+
+static int copy_sbi_reg_indices(struct kvm_vcpu *vcpu, u64 __user *uindices)
+{
+	int n = num_sbi_regs(vcpu);
+
+	for (int i = 0; i < n; i++) {
+		u64 reg = KVM_REG_RISCV | KVM_REG_SIZE_U64 |
+			  KVM_REG_RISCV_SBI | i;
+
+		if (uindices) {
+			if (put_user(reg, uindices))
+				return -EFAULT;
+			uindices++;
+		}
+	}
+
+	return n;
+}
+
 static inline unsigned long num_vector_regs(const struct kvm_vcpu *vcpu)
 {
 	if (!riscv_isa_extension_available(vcpu->arch.isa, v))
@@ -1028,6 +1051,7 @@ unsigned long kvm_riscv_vcpu_num_regs(struct kvm_vcpu *vcpu)
 	res += num_vector_regs(vcpu);
 	res += num_isa_ext_regs(vcpu);
 	res += num_sbi_ext_regs(vcpu);
+	res += num_sbi_regs(vcpu);
 
 	return res;
 }
@@ -1083,6 +1107,12 @@ int kvm_riscv_vcpu_copy_reg_indices(struct kvm_vcpu *vcpu,
 	ret = copy_sbi_ext_reg_indices(vcpu, uindices);
 	if (ret < 0)
 		return ret;
+	uindices += ret;
+
+	ret = copy_sbi_reg_indices(vcpu, uindices);
+	if (ret < 0)
+		return ret;
+	uindices += ret;
 
 	return 0;
 }
@@ -1105,12 +1135,14 @@ int kvm_riscv_vcpu_set_reg(struct kvm_vcpu *vcpu,
 	case KVM_REG_RISCV_FP_D:
 		return kvm_riscv_vcpu_set_reg_fp(vcpu, reg,
 						 KVM_REG_RISCV_FP_D);
+	case KVM_REG_RISCV_VECTOR:
+		return kvm_riscv_vcpu_set_reg_vector(vcpu, reg);
 	case KVM_REG_RISCV_ISA_EXT:
 		return kvm_riscv_vcpu_set_reg_isa_ext(vcpu, reg);
 	case KVM_REG_RISCV_SBI_EXT:
 		return kvm_riscv_vcpu_set_reg_sbi_ext(vcpu, reg);
-	case KVM_REG_RISCV_VECTOR:
-		return kvm_riscv_vcpu_set_reg_vector(vcpu, reg);
+	case KVM_REG_RISCV_SBI:
+		return kvm_riscv_vcpu_set_reg_sbi(vcpu, reg);
 	default:
 		break;
 	}
@@ -1136,12 +1168,14 @@ int kvm_riscv_vcpu_get_reg(struct kvm_vcpu *vcpu,
 	case KVM_REG_RISCV_FP_D:
 		return kvm_riscv_vcpu_get_reg_fp(vcpu, reg,
 						 KVM_REG_RISCV_FP_D);
+	case KVM_REG_RISCV_VECTOR:
+		return kvm_riscv_vcpu_get_reg_vector(vcpu, reg);
 	case KVM_REG_RISCV_ISA_EXT:
 		return kvm_riscv_vcpu_get_reg_isa_ext(vcpu, reg);
 	case KVM_REG_RISCV_SBI_EXT:
 		return kvm_riscv_vcpu_get_reg_sbi_ext(vcpu, reg);
-	case KVM_REG_RISCV_VECTOR:
-		return kvm_riscv_vcpu_get_reg_vector(vcpu, reg);
+	case KVM_REG_RISCV_SBI:
+		return kvm_riscv_vcpu_get_reg_sbi(vcpu, reg);
 	default:
 		break;
 	}
diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
index 088daaa23dd8..834176242ddf 100644
--- a/arch/riscv/kvm/vcpu_sbi.c
+++ b/arch/riscv/kvm/vcpu_sbi.c
@@ -325,6 +325,64 @@ int kvm_riscv_vcpu_get_reg_sbi_ext(struct kvm_vcpu *vcpu,
 	return 0;
 }
 
+int kvm_riscv_vcpu_set_reg_sbi(struct kvm_vcpu *vcpu,
+			       const struct kvm_one_reg *reg)
+{
+	unsigned long __user *uaddr =
+			(unsigned long __user *)(unsigned long)reg->addr;
+	unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
+					    KVM_REG_SIZE_MASK |
+					    KVM_REG_RISCV_SBI);
+	unsigned long reg_subtype, reg_val;
+
+	if (KVM_REG_SIZE(reg->id) != sizeof(unsigned long))
+		return -EINVAL;
+
+	if (copy_from_user(&reg_val, uaddr, KVM_REG_SIZE(reg->id)))
+		return -EFAULT;
+
+	reg_subtype = reg_num & KVM_REG_RISCV_SUBTYPE_MASK;
+	reg_num &= ~KVM_REG_RISCV_SUBTYPE_MASK;
+
+	switch (reg_subtype) {
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+int kvm_riscv_vcpu_get_reg_sbi(struct kvm_vcpu *vcpu,
+			       const struct kvm_one_reg *reg)
+{
+	unsigned long __user *uaddr =
+			(unsigned long __user *)(unsigned long)reg->addr;
+	unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
+					    KVM_REG_SIZE_MASK |
+					    KVM_REG_RISCV_SBI);
+	unsigned long reg_subtype, reg_val;
+	int ret;
+
+	if (KVM_REG_SIZE(reg->id) != sizeof(unsigned long))
+		return -EINVAL;
+
+	reg_subtype = reg_num & KVM_REG_RISCV_SUBTYPE_MASK;
+	reg_num &= ~KVM_REG_RISCV_SUBTYPE_MASK;
+
+	switch (reg_subtype) {
+	default:
+		return -EINVAL;
+	}
+
+	if (ret)
+		return ret;
+
+	if (copy_to_user(uaddr, &reg_val, KVM_REG_SIZE(reg->id)))
+		return -EFAULT;
+
+	return 0;
+}
+
 const struct kvm_vcpu_sbi_extension *kvm_vcpu_sbi_find_ext(
 				struct kvm_vcpu *vcpu, unsigned long extid)
 {
-- 
2.43.0


