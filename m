From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Date: Mon,  4 Dec 2023 15:29:04 -0300
Subject: [PATCH 3/3] RISC-V: KVM: add vector CSRs in KVM_GET_REG_LIST
In-Reply-To: <20231204182905.2163676-1-dbarboza@ventanamicro.com>
References: <20231204182905.2163676-1-dbarboza@ventanamicro.com>
Message-ID: <20231204182905.2163676-4-dbarboza@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add all vector CSRs (vstart, vl, vtype, vcsr, vlenb) in get-reg-list.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 arch/riscv/kvm/vcpu_onereg.c | 37 ++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index f8c9fa0c03c5..1c91615f47cc 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -986,6 +986,37 @@ static int copy_sbi_ext_reg_indices(u64 __user *uindices)
 	return num_sbi_ext_regs();
 }
 
+static inline unsigned long num_vector_regs(const struct kvm_vcpu *vcpu)
+{
+	const struct kvm_cpu_context *cntx = &vcpu->arch.guest_context;
+
+	if (!riscv_isa_extension_available(vcpu->arch.isa, v))
+		return 0;
+
+	/* vstart, vl, vtype, vcsr, vlenb; */
+	return 5;
+}
+
+static int copy_vector_reg_indices(const struct kvm_vcpu *vcpu,
+				u64 __user *uindices)
+{
+	int n = num_vector_regs(vcpu);
+	u64 reg, size;
+
+	for (int i = 0; i < n; i++) {
+		size = IS_ENABLED(CONFIG_32BIT) ? KVM_REG_SIZE_U32 : KVM_REG_SIZE_U64;
+		reg = KVM_REG_RISCV | size | KVM_REG_RISCV_VECTOR | i;
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
 /*
  * kvm_riscv_vcpu_num_regs - how many registers do we present via KVM_GET/SET_ONE_REG
  *
@@ -1001,6 +1032,7 @@ unsigned long kvm_riscv_vcpu_num_regs(struct kvm_vcpu *vcpu)
 	res += num_timer_regs();
 	res += num_fp_f_regs(vcpu);
 	res += num_fp_d_regs(vcpu);
+	res += num_vector_regs(vcpu);
 	res += num_isa_ext_regs(vcpu);
 	res += num_sbi_ext_regs();
 
@@ -1045,6 +1077,11 @@ int kvm_riscv_vcpu_copy_reg_indices(struct kvm_vcpu *vcpu,
 		return ret;
 	uindices += ret;
 
+	ret = copy_vector_reg_indices(vcpu, uindices);
+	if (ret < 0)
+		return ret;
+	uindices += ret;
+
 	ret = copy_isa_ext_reg_indices(vcpu, uindices);
 	if (ret < 0)
 		return ret;
-- 
2.41.0


