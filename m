From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 12 Jul 2023 21:40:42 +0530
Subject: [PATCH 2/7] RISC-V: KVM: Extend ONE_REG to enable/disable multiple ISA extensions
In-Reply-To: <20230712161047.1764756-1-apatel@ventanamicro.com>
References: <20230712161047.1764756-1-apatel@ventanamicro.com>
Message-ID: <20230712161047.1764756-3-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Currently, the ISA extension ONE_REG interface only allows enabling or
disabling one extension at a time. To improve this, we extend the ISA
extension ONE_REG interface (similar to SBI extension ONE_REG interface)
so that KVM user space can enable/disable multiple extensions in one
ioctl.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/uapi/asm/kvm.h |   9 ++
 arch/riscv/kvm/vcpu_onereg.c      | 153 ++++++++++++++++++++++++------
 2 files changed, 133 insertions(+), 29 deletions(-)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 930fdc4101cd..6c2285f86545 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -193,6 +193,15 @@ enum KVM_RISCV_SBI_EXT_ID {
 
 /* ISA Extension registers are mapped as type 7 */
 #define KVM_REG_RISCV_ISA_EXT		(0x07 << KVM_REG_RISCV_TYPE_SHIFT)
+#define KVM_REG_RISCV_ISA_SINGLE	(0x0 << KVM_REG_RISCV_SUBTYPE_SHIFT)
+#define KVM_REG_RISCV_ISA_MULTI_EN	(0x1 << KVM_REG_RISCV_SUBTYPE_SHIFT)
+#define KVM_REG_RISCV_ISA_MULTI_DIS	(0x2 << KVM_REG_RISCV_SUBTYPE_SHIFT)
+#define KVM_REG_RISCV_ISA_MULTI_REG(__ext_id)	\
+		((__ext_id) / __BITS_PER_LONG)
+#define KVM_REG_RISCV_ISA_MULTI_MASK(__ext_id)	\
+		(1UL << ((__ext_id) % __BITS_PER_LONG))
+#define KVM_REG_RISCV_ISA_MULTI_REG_LAST	\
+		KVM_REG_RISCV_ISA_MULTI_REG(KVM_RISCV_ISA_EXT_MAX - 1)
 
 /* SBI extension registers are mapped as type 8 */
 #define KVM_REG_RISCV_SBI_EXT		(0x08 << KVM_REG_RISCV_TYPE_SHIFT)
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index 836ffe79311a..236359722364 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -408,55 +408,34 @@ static int kvm_riscv_vcpu_set_reg_csr(struct kvm_vcpu *vcpu,
 	return 0;
 }
 
-static int kvm_riscv_vcpu_get_reg_isa_ext(struct kvm_vcpu *vcpu,
-					  const struct kvm_one_reg *reg)
+static int riscv_vcpu_get_isa_ext_single(struct kvm_vcpu *vcpu,
+					 unsigned long reg_num,
+					 unsigned long *reg_val)
 {
-	unsigned long __user *uaddr =
-			(unsigned long __user *)(unsigned long)reg->addr;
-	unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
-					    KVM_REG_SIZE_MASK |
-					    KVM_REG_RISCV_ISA_EXT);
-	unsigned long reg_val = 0;
 	unsigned long host_isa_ext;
 
-	if (KVM_REG_SIZE(reg->id) != sizeof(unsigned long))
-		return -EINVAL;
-
 	if (reg_num >= KVM_RISCV_ISA_EXT_MAX ||
 	    reg_num >= ARRAY_SIZE(kvm_isa_ext_arr))
 		return -EINVAL;
 
+	*reg_val = 0;
 	host_isa_ext = kvm_isa_ext_arr[reg_num];
 	if (__riscv_isa_extension_available(vcpu->arch.isa, host_isa_ext))
-		reg_val = 1; /* Mark the given extension as available */
-
-	if (copy_to_user(uaddr, &reg_val, KVM_REG_SIZE(reg->id)))
-		return -EFAULT;
+		*reg_val = 1; /* Mark the given extension as available */
 
 	return 0;
 }
 
-static int kvm_riscv_vcpu_set_reg_isa_ext(struct kvm_vcpu *vcpu,
-					  const struct kvm_one_reg *reg)
+static int riscv_vcpu_set_isa_ext_single(struct kvm_vcpu *vcpu,
+					 unsigned long reg_num,
+					 unsigned long reg_val)
 {
-	unsigned long __user *uaddr =
-			(unsigned long __user *)(unsigned long)reg->addr;
-	unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
-					    KVM_REG_SIZE_MASK |
-					    KVM_REG_RISCV_ISA_EXT);
-	unsigned long reg_val;
 	unsigned long host_isa_ext;
 
-	if (KVM_REG_SIZE(reg->id) != sizeof(unsigned long))
-		return -EINVAL;
-
 	if (reg_num >= KVM_RISCV_ISA_EXT_MAX ||
 	    reg_num >= ARRAY_SIZE(kvm_isa_ext_arr))
 		return -EINVAL;
 
-	if (copy_from_user(&reg_val, uaddr, KVM_REG_SIZE(reg->id)))
-		return -EFAULT;
-
 	host_isa_ext = kvm_isa_ext_arr[reg_num];
 	if (!__riscv_isa_extension_available(NULL, host_isa_ext))
 		return	-EOPNOTSUPP;
@@ -482,6 +461,122 @@ static int kvm_riscv_vcpu_set_reg_isa_ext(struct kvm_vcpu *vcpu,
 	return 0;
 }
 
+static int riscv_vcpu_get_isa_ext_multi(struct kvm_vcpu *vcpu,
+					unsigned long reg_num,
+					unsigned long *reg_val)
+{
+	unsigned long i, ext_id, ext_val;
+
+	if (reg_num > KVM_REG_RISCV_ISA_MULTI_REG_LAST)
+		return -EINVAL;
+
+	for (i = 0; i < BITS_PER_LONG; i++) {
+		ext_id = i + reg_num * BITS_PER_LONG;
+		if (ext_id >= KVM_RISCV_ISA_EXT_MAX)
+			break;
+
+		ext_val = 0;
+		riscv_vcpu_get_isa_ext_single(vcpu, ext_id, &ext_val);
+		if (ext_val)
+			*reg_val |= KVM_REG_RISCV_ISA_MULTI_MASK(ext_id);
+	}
+
+	return 0;
+}
+
+static int riscv_vcpu_set_isa_ext_multi(struct kvm_vcpu *vcpu,
+					unsigned long reg_num,
+					unsigned long reg_val, bool enable)
+{
+	unsigned long i, ext_id;
+
+	if (reg_num > KVM_REG_RISCV_ISA_MULTI_REG_LAST)
+		return -EINVAL;
+
+	for_each_set_bit(i, &reg_val, BITS_PER_LONG) {
+		ext_id = i + reg_num * BITS_PER_LONG;
+		if (ext_id >= KVM_RISCV_ISA_EXT_MAX)
+			break;
+
+		riscv_vcpu_set_isa_ext_single(vcpu, ext_id, enable);
+	}
+
+	return 0;
+}
+
+static int kvm_riscv_vcpu_get_reg_isa_ext(struct kvm_vcpu *vcpu,
+					  const struct kvm_one_reg *reg)
+{
+	int rc;
+	unsigned long __user *uaddr =
+			(unsigned long __user *)(unsigned long)reg->addr;
+	unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
+					    KVM_REG_SIZE_MASK |
+					    KVM_REG_RISCV_ISA_EXT);
+	unsigned long reg_val, reg_subtype;
+
+	if (KVM_REG_SIZE(reg->id) != sizeof(unsigned long))
+		return -EINVAL;
+
+	reg_subtype = reg_num & KVM_REG_RISCV_SUBTYPE_MASK;
+	reg_num &= ~KVM_REG_RISCV_SUBTYPE_MASK;
+
+	reg_val = 0;
+	switch (reg_subtype) {
+	case KVM_REG_RISCV_ISA_SINGLE:
+		rc = riscv_vcpu_get_isa_ext_single(vcpu, reg_num, &reg_val);
+		break;
+	case KVM_REG_RISCV_ISA_MULTI_EN:
+	case KVM_REG_RISCV_ISA_MULTI_DIS:
+		rc = riscv_vcpu_get_isa_ext_multi(vcpu, reg_num, &reg_val);
+		if (!rc && reg_subtype == KVM_REG_RISCV_ISA_MULTI_DIS)
+			reg_val = ~reg_val;
+		break;
+	default:
+		rc = -EINVAL;
+	}
+	if (rc)
+		return rc;
+
+	if (copy_to_user(uaddr, &reg_val, KVM_REG_SIZE(reg->id)))
+		return -EFAULT;
+
+	return 0;
+}
+
+static int kvm_riscv_vcpu_set_reg_isa_ext(struct kvm_vcpu *vcpu,
+					  const struct kvm_one_reg *reg)
+{
+	unsigned long __user *uaddr =
+			(unsigned long __user *)(unsigned long)reg->addr;
+	unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
+					    KVM_REG_SIZE_MASK |
+					    KVM_REG_RISCV_ISA_EXT);
+	unsigned long reg_val, reg_subtype;
+
+	if (KVM_REG_SIZE(reg->id) != sizeof(unsigned long))
+		return -EINVAL;
+
+	reg_subtype = reg_num & KVM_REG_RISCV_SUBTYPE_MASK;
+	reg_num &= ~KVM_REG_RISCV_SUBTYPE_MASK;
+
+	if (copy_from_user(&reg_val, uaddr, KVM_REG_SIZE(reg->id)))
+		return -EFAULT;
+
+	switch (reg_subtype) {
+	case KVM_REG_RISCV_ISA_SINGLE:
+		return riscv_vcpu_set_isa_ext_single(vcpu, reg_num, reg_val);
+	case KVM_REG_RISCV_SBI_MULTI_EN:
+		return riscv_vcpu_set_isa_ext_multi(vcpu, reg_num, reg_val, true);
+	case KVM_REG_RISCV_SBI_MULTI_DIS:
+		return riscv_vcpu_set_isa_ext_multi(vcpu, reg_num, reg_val, false);
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 int kvm_riscv_vcpu_set_reg(struct kvm_vcpu *vcpu,
 			   const struct kvm_one_reg *reg)
 {
-- 
2.34.1


