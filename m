From: Andrew Jones <ajones@ventanamicro.com>
Date: Mon, 17 Apr 2023 12:33:57 +0200
Subject: [RFC PATCH 09/14] RISC-V: KVM: Add support for SBI extension registers
In-Reply-To: <20230417103402.798596-1-ajones@ventanamicro.com>
References: <20230417103402.798596-1-ajones@ventanamicro.com>
Message-ID: <20230417103402.798596-10-ajones@ventanamicro.com>
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

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/uapi/asm/kvm.h |  3 ++
 arch/riscv/kvm/vcpu.c             | 62 +++++++++++++++++++++++++++++++
 2 files changed, 65 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 5b6723c13301..172dc565e01a 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -186,6 +186,9 @@ enum KVM_RISCV_SBI_EXT_ID {
 #define KVM_REG_RISCV_SBI_MULTI_REG_LAST	\
 		KVM_REG_RISCV_SBI_MULTI_REG(KVM_RISCV_SBI_EXT_MAX - 1)
 
+/* Registers for specific SBI extensions are mapped as type 9 */
+#define KVM_REG_RISCV_SBI		(0x09 << KVM_REG_RISCV_TYPE_SHIFT)
+
 #endif
 
 #endif /* __LINUX_KVM_RISCV_H */
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 72b4b3ef6ab3..56aec4c2521e 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -585,6 +585,64 @@ static int kvm_riscv_vcpu_set_reg_isa_ext(struct kvm_vcpu *vcpu,
 	return 0;
 }
 
+static int kvm_riscv_vcpu_get_reg_sbi(struct kvm_vcpu *vcpu,
+				      const struct kvm_one_reg *reg)
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
+static int kvm_riscv_vcpu_set_reg_sbi(struct kvm_vcpu *vcpu,
+				      const struct kvm_one_reg *reg)
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
 static int kvm_riscv_vcpu_set_reg(struct kvm_vcpu *vcpu,
 				  const struct kvm_one_reg *reg)
 {
@@ -607,6 +665,8 @@ static int kvm_riscv_vcpu_set_reg(struct kvm_vcpu *vcpu,
 		return kvm_riscv_vcpu_set_reg_isa_ext(vcpu, reg);
 	case KVM_REG_RISCV_SBI_EXT:
 		return kvm_riscv_vcpu_set_reg_sbi_ext(vcpu, reg);
+	case KVM_REG_RISCV_SBI:
+		return kvm_riscv_vcpu_set_reg_sbi(vcpu, reg);
 	default:
 		break;
 	}
@@ -636,6 +696,8 @@ static int kvm_riscv_vcpu_get_reg(struct kvm_vcpu *vcpu,
 		return kvm_riscv_vcpu_get_reg_isa_ext(vcpu, reg);
 	case KVM_REG_RISCV_SBI_EXT:
 		return kvm_riscv_vcpu_get_reg_sbi_ext(vcpu, reg);
+	case KVM_REG_RISCV_SBI:
+		return kvm_riscv_vcpu_get_reg_sbi(vcpu, reg);
 	default:
 		break;
 	}
-- 
2.39.2


