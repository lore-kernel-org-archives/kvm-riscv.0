From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Date: Tue,  5 Dec 2023 14:45:08 -0300
Subject: [PATCH v3 2/3] RISC-V: KVM: add 'vlenb' Vector CSR
In-Reply-To: <20231205174509.2238870-1-dbarboza@ventanamicro.com>
References: <20231205174509.2238870-1-dbarboza@ventanamicro.com>
Message-ID: <20231205174509.2238870-3-dbarboza@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Userspace requires 'vlenb' to be able to encode it in reg ID. Otherwise
it is not possible to retrieve any vector reg since we're returning
EINVAL if reg_size isn't vlenb (see kvm_riscv_vcpu_vreg_addr()).

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 arch/riscv/kvm/vcpu_vector.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_vector.c b/arch/riscv/kvm/vcpu_vector.c
index 530e49c588d6..d92d1348045c 100644
--- a/arch/riscv/kvm/vcpu_vector.c
+++ b/arch/riscv/kvm/vcpu_vector.c
@@ -116,6 +116,9 @@ static int kvm_riscv_vcpu_vreg_addr(struct kvm_vcpu *vcpu,
 		case KVM_REG_RISCV_VECTOR_CSR_REG(vcsr):
 			*reg_addr = &cntx->vector.vcsr;
 			break;
+		case KVM_REG_RISCV_VECTOR_CSR_REG(vlenb):
+			*reg_addr = &cntx->vector.vlenb;
+			break;
 		case KVM_REG_RISCV_VECTOR_CSR_REG(datap):
 		default:
 			return -ENOENT;
@@ -174,6 +177,18 @@ int kvm_riscv_vcpu_set_reg_vector(struct kvm_vcpu *vcpu,
 	if (!riscv_isa_extension_available(isa, v))
 		return -ENOENT;
 
+	if (reg_num == KVM_REG_RISCV_VECTOR_CSR_REG(vlenb)) {
+		struct kvm_cpu_context *cntx = &vcpu->arch.guest_context;
+		unsigned long reg_val;
+
+		if (copy_from_user(&reg_val, uaddr, reg_size))
+			return -EFAULT;
+		if (reg_val != cntx->vector.vlenb)
+			return -EINVAL;
+
+		return 0;
+	}
+
 	rc = kvm_riscv_vcpu_vreg_addr(vcpu, reg_num, reg_size, &reg_addr);
 	if (rc)
 		return rc;
-- 
2.41.0


