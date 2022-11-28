From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 28 Nov 2022 21:44:19 +0530
Subject: [PATCH 4/9] RISC-V: KVM: Use switch-case in kvm_riscv_vcpu_set/get_reg()
In-Reply-To: <20221128161424.608889-1-apatel@ventanamicro.com>
References: <20221128161424.608889-1-apatel@ventanamicro.com>
Message-ID: <20221128161424.608889-5-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We should use switch-case in kvm_riscv_vcpu_set/get_reg() functions
because the else-if ladder is quite big now.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kvm/vcpu.c | 36 ++++++++++++++++++++++--------------
 1 file changed, 22 insertions(+), 14 deletions(-)

diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 982a3f5e7130..68c86f632d37 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -544,22 +544,26 @@ static int kvm_riscv_vcpu_set_reg_isa_ext(struct kvm_vcpu *vcpu,
 static int kvm_riscv_vcpu_set_reg(struct kvm_vcpu *vcpu,
 				  const struct kvm_one_reg *reg)
 {
-	if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_CONFIG)
+	switch (reg->id & KVM_REG_RISCV_TYPE_MASK) {
+	case KVM_REG_RISCV_CONFIG:
 		return kvm_riscv_vcpu_set_reg_config(vcpu, reg);
-	else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_CORE)
+	case KVM_REG_RISCV_CORE:
 		return kvm_riscv_vcpu_set_reg_core(vcpu, reg);
-	else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_CSR)
+	case KVM_REG_RISCV_CSR:
 		return kvm_riscv_vcpu_set_reg_csr(vcpu, reg);
-	else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_TIMER)
+	case KVM_REG_RISCV_TIMER:
 		return kvm_riscv_vcpu_set_reg_timer(vcpu, reg);
-	else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_FP_F)
+	case KVM_REG_RISCV_FP_F:
 		return kvm_riscv_vcpu_set_reg_fp(vcpu, reg,
 						 KVM_REG_RISCV_FP_F);
-	else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_FP_D)
+	case KVM_REG_RISCV_FP_D:
 		return kvm_riscv_vcpu_set_reg_fp(vcpu, reg,
 						 KVM_REG_RISCV_FP_D);
-	else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_ISA_EXT)
+	case KVM_REG_RISCV_ISA_EXT:
 		return kvm_riscv_vcpu_set_reg_isa_ext(vcpu, reg);
+	default:
+		break;
+	}
 
 	return -EINVAL;
 }
@@ -567,22 +571,26 @@ static int kvm_riscv_vcpu_set_reg(struct kvm_vcpu *vcpu,
 static int kvm_riscv_vcpu_get_reg(struct kvm_vcpu *vcpu,
 				  const struct kvm_one_reg *reg)
 {
-	if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_CONFIG)
+	switch (reg->id & KVM_REG_RISCV_TYPE_MASK) {
+	case KVM_REG_RISCV_CONFIG:
 		return kvm_riscv_vcpu_get_reg_config(vcpu, reg);
-	else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_CORE)
+	case KVM_REG_RISCV_CORE:
 		return kvm_riscv_vcpu_get_reg_core(vcpu, reg);
-	else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_CSR)
+	case KVM_REG_RISCV_CSR:
 		return kvm_riscv_vcpu_get_reg_csr(vcpu, reg);
-	else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_TIMER)
+	case KVM_REG_RISCV_TIMER:
 		return kvm_riscv_vcpu_get_reg_timer(vcpu, reg);
-	else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_FP_F)
+	case KVM_REG_RISCV_FP_F:
 		return kvm_riscv_vcpu_get_reg_fp(vcpu, reg,
 						 KVM_REG_RISCV_FP_F);
-	else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_FP_D)
+	case KVM_REG_RISCV_FP_D:
 		return kvm_riscv_vcpu_get_reg_fp(vcpu, reg,
 						 KVM_REG_RISCV_FP_D);
-	else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_ISA_EXT)
+	case KVM_REG_RISCV_ISA_EXT:
 		return kvm_riscv_vcpu_get_reg_isa_ext(vcpu, reg);
+	default:
+		break;
+	}
 
 	return -EINVAL;
 }
-- 
2.34.1


