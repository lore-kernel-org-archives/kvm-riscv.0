From: Andrew Jones <ajones@ventanamicro.com>
Date: Fri,  4 Aug 2023 16:56:18 +0300
Subject: [PATCH] RISC-V: KVM: Improve vector save/restore functions
Message-ID: <20230804135617.46188-2-ajones@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Make two nonfunctional changes to the vector get/set vector reg
functions and their supporting function for simplification and
readability. The first is to not pass KVM_REG_RISCV_VECTOR, but
rather integrate it directly into the masking. The second is to
rename reg_val to reg_addr where and address is used instead of
a value.

Also opportunistically touch up some of the code formatting for
a third nonfunctional change.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---

This is based on "[PATCH v4 00/10] RISC-V: KVM: change get_reg/set_reg
error code"[1]
[1] https://lore.kernel.org/all/20230803163302.445167-1-dbarboza at ventanamicro.com/

 arch/riscv/include/asm/kvm_vcpu_vector.h |  6 ++--
 arch/riscv/kvm/vcpu_onereg.c             |  6 ++--
 arch/riscv/kvm/vcpu_vector.c             | 46 ++++++++++--------------
 3 files changed, 23 insertions(+), 35 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_vector.h b/arch/riscv/include/asm/kvm_vcpu_vector.h
index ff994fdd6d0d..27f5bccdd8b0 100644
--- a/arch/riscv/include/asm/kvm_vcpu_vector.h
+++ b/arch/riscv/include/asm/kvm_vcpu_vector.h
@@ -74,9 +74,7 @@ static inline void kvm_riscv_vcpu_free_vector_context(struct kvm_vcpu *vcpu)
 #endif
 
 int kvm_riscv_vcpu_get_reg_vector(struct kvm_vcpu *vcpu,
-				  const struct kvm_one_reg *reg,
-				  unsigned long rtype);
+				  const struct kvm_one_reg *reg);
 int kvm_riscv_vcpu_set_reg_vector(struct kvm_vcpu *vcpu,
-				  const struct kvm_one_reg *reg,
-				  unsigned long rtype);
+				  const struct kvm_one_reg *reg);
 #endif
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index 989ea32dbcbe..9fee1c176fbb 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -645,8 +645,7 @@ int kvm_riscv_vcpu_set_reg(struct kvm_vcpu *vcpu,
 	case KVM_REG_RISCV_SBI_EXT:
 		return kvm_riscv_vcpu_set_reg_sbi_ext(vcpu, reg);
 	case KVM_REG_RISCV_VECTOR:
-		return kvm_riscv_vcpu_set_reg_vector(vcpu, reg,
-						 KVM_REG_RISCV_VECTOR);
+		return kvm_riscv_vcpu_set_reg_vector(vcpu, reg);
 	default:
 		break;
 	}
@@ -677,8 +676,7 @@ int kvm_riscv_vcpu_get_reg(struct kvm_vcpu *vcpu,
 	case KVM_REG_RISCV_SBI_EXT:
 		return kvm_riscv_vcpu_get_reg_sbi_ext(vcpu, reg);
 	case KVM_REG_RISCV_VECTOR:
-		return kvm_riscv_vcpu_get_reg_vector(vcpu, reg,
-						 KVM_REG_RISCV_VECTOR);
+		return kvm_riscv_vcpu_get_reg_vector(vcpu, reg);
 	default:
 		break;
 	}
diff --git a/arch/riscv/kvm/vcpu_vector.c b/arch/riscv/kvm/vcpu_vector.c
index 39c5bceb4d1b..b430cbb69521 100644
--- a/arch/riscv/kvm/vcpu_vector.c
+++ b/arch/riscv/kvm/vcpu_vector.c
@@ -92,9 +92,9 @@ void kvm_riscv_vcpu_free_vector_context(struct kvm_vcpu *vcpu)
 #endif
 
 static int kvm_riscv_vcpu_vreg_addr(struct kvm_vcpu *vcpu,
-				      unsigned long reg_num,
-				      size_t reg_size,
-				      void **reg_val)
+				    unsigned long reg_num,
+				    size_t reg_size,
+				    void **reg_addr)
 {
 	struct kvm_cpu_context *cntx = &vcpu->arch.guest_context;
 	size_t vlenb = riscv_v_vsize / 32;
@@ -104,16 +104,16 @@ static int kvm_riscv_vcpu_vreg_addr(struct kvm_vcpu *vcpu,
 			return -EINVAL;
 		switch (reg_num) {
 		case KVM_REG_RISCV_VECTOR_CSR_REG(vstart):
-			*reg_val = &cntx->vector.vstart;
+			*reg_addr = &cntx->vector.vstart;
 			break;
 		case KVM_REG_RISCV_VECTOR_CSR_REG(vl):
-			*reg_val = &cntx->vector.vl;
+			*reg_addr = &cntx->vector.vl;
 			break;
 		case KVM_REG_RISCV_VECTOR_CSR_REG(vtype):
-			*reg_val = &cntx->vector.vtype;
+			*reg_addr = &cntx->vector.vtype;
 			break;
 		case KVM_REG_RISCV_VECTOR_CSR_REG(vcsr):
-			*reg_val = &cntx->vector.vcsr;
+			*reg_addr = &cntx->vector.vcsr;
 			break;
 		case KVM_REG_RISCV_VECTOR_CSR_REG(datap):
 		default:
@@ -122,8 +122,8 @@ static int kvm_riscv_vcpu_vreg_addr(struct kvm_vcpu *vcpu,
 	} else if (reg_num <= KVM_REG_RISCV_VECTOR_REG(31)) {
 		if (reg_size != vlenb)
 			return -EINVAL;
-		*reg_val = cntx->vector.datap
-			  + (reg_num - KVM_REG_RISCV_VECTOR_REG(0)) * vlenb;
+		*reg_addr = cntx->vector.datap +
+			    (reg_num - KVM_REG_RISCV_VECTOR_REG(0)) * vlenb;
 	} else {
 		return -ENOENT;
 	}
@@ -132,60 +132,52 @@ static int kvm_riscv_vcpu_vreg_addr(struct kvm_vcpu *vcpu,
 }
 
 int kvm_riscv_vcpu_get_reg_vector(struct kvm_vcpu *vcpu,
-				  const struct kvm_one_reg *reg,
-				  unsigned long rtype)
+				  const struct kvm_one_reg *reg)
 {
 	unsigned long *isa = vcpu->arch.isa;
 	unsigned long __user *uaddr =
 			(unsigned long __user *)(unsigned long)reg->addr;
 	unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
 					    KVM_REG_SIZE_MASK |
-					    rtype);
+					    KVM_REG_RISCV_VECTOR);
 	size_t reg_size = KVM_REG_SIZE(reg->id);
-	void *reg_val;
+	void *reg_addr;
 	int rc;
 
-	if (rtype != KVM_REG_RISCV_VECTOR)
-		return -EINVAL;
-
 	if (!riscv_isa_extension_available(isa, v))
 		return -ENOENT;
 
-	rc = kvm_riscv_vcpu_vreg_addr(vcpu, reg_num, reg_size, &reg_val);
+	rc = kvm_riscv_vcpu_vreg_addr(vcpu, reg_num, reg_size, &reg_addr);
 	if (rc)
 		return rc;
 
-	if (copy_to_user(uaddr, reg_val, reg_size))
+	if (copy_to_user(uaddr, reg_addr, reg_size))
 		return -EFAULT;
 
 	return 0;
 }
 
 int kvm_riscv_vcpu_set_reg_vector(struct kvm_vcpu *vcpu,
-				  const struct kvm_one_reg *reg,
-				  unsigned long rtype)
+				  const struct kvm_one_reg *reg)
 {
 	unsigned long *isa = vcpu->arch.isa;
 	unsigned long __user *uaddr =
 			(unsigned long __user *)(unsigned long)reg->addr;
 	unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
 					    KVM_REG_SIZE_MASK |
-					    rtype);
+					    KVM_REG_RISCV_VECTOR);
 	size_t reg_size = KVM_REG_SIZE(reg->id);
-	void *reg_val;
+	void *reg_addr;
 	int rc;
 
-	if (rtype != KVM_REG_RISCV_VECTOR)
-		return -EINVAL;
-
 	if (!riscv_isa_extension_available(isa, v))
 		return -ENOENT;
 
-	rc = kvm_riscv_vcpu_vreg_addr(vcpu, reg_num, reg_size, &reg_val);
+	rc = kvm_riscv_vcpu_vreg_addr(vcpu, reg_num, reg_size, &reg_addr);
 	if (rc)
 		return rc;
 
-	if (copy_from_user(reg_val, uaddr, reg_size))
+	if (copy_from_user(reg_addr, uaddr, reg_size))
 		return -EFAULT;
 
 	return 0;
-- 
2.41.0


