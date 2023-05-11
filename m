From: Haibo Xu <haibo1.xu@intel.com>
Date: Thu, 11 May 2023 17:22:48 +0800
Subject: [PATCH 1/2] riscv: kvm: Add KVM_GET_REG_LIST API support
In-Reply-To: <cover.1683791148.git.haibo1.xu@intel.com>
References: <cover.1683791148.git.haibo1.xu@intel.com>
Message-ID: <921fc2e1a91887170e277acb1b52df57480a5736.1683791148.git.haibo1.xu@intel.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

KVM_GET_REG_LIST API will return all registers that are available to
KVM_GET/SET_ONE_REG APIs. It's very useful to identify some platform
regression issue during VM migration.

Since this API was already supported on arm64, it'd be straightforward
to enable it on riscv with similar code structure.

Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
---
 Documentation/virt/kvm/api.rst |   2 +-
 arch/riscv/kvm/vcpu.c          | 346 +++++++++++++++++++++++++++++++++
 2 files changed, 347 insertions(+), 1 deletion(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index add067793b90..280e89abd004 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -3499,7 +3499,7 @@ VCPU matching underlying host.
 ---------------------
 
 :Capability: basic
-:Architectures: arm64, mips
+:Architectures: arm64, mips, riscv
 :Type: vcpu ioctl
 :Parameters: struct kvm_reg_list (in/out)
 :Returns: 0 on success; -1 on error
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 8bd9f2a8a0b9..fb8834e4fa15 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -657,6 +657,334 @@ static int kvm_riscv_vcpu_set_reg_isa_ext(struct kvm_vcpu *vcpu,
 	return 0;
 }
 
+static inline unsigned long num_config_regs(void)
+{
+	return sizeof(struct kvm_riscv_config) / sizeof(unsigned long);
+}
+
+static int copy_config_reg_indices(u64 __user *uindices)
+{
+	unsigned int i;
+	int n = num_config_regs();
+
+	for (i = 0; i < n; i++) {
+		u64 reg = KVM_REG_RISCV | KVM_REG_SIZE_U64 | KVM_REG_RISCV_CONFIG | i;
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
+static inline unsigned long num_core_regs(void)
+{
+	return sizeof(struct kvm_riscv_core) / sizeof(unsigned long);
+}
+
+static int copy_core_reg_indices(u64 __user *uindices)
+{
+	unsigned int i;
+	int n = num_core_regs();
+
+	for (i = 0; i < n; i++) {
+		u64 reg = KVM_REG_RISCV | KVM_REG_SIZE_U64 | KVM_REG_RISCV_CORE | i;
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
+static inline unsigned long num_csr_regs(void)
+{
+	unsigned long n = sizeof(struct kvm_riscv_csr) / sizeof(unsigned long);
+
+	if (kvm_riscv_aia_available())
+		n += sizeof(struct kvm_riscv_aia_csr) / sizeof(unsigned long);
+
+	return n;
+}
+
+static int copy_csr_reg_indices(u64 __user *uindices)
+{
+	unsigned int i;
+	int n1 = sizeof(struct kvm_riscv_csr) / sizeof(unsigned long);
+	int n2 = 0;
+
+	/* copy general csr regs */
+	for (i = 0; i < n1; i++) {
+		u64 reg = KVM_REG_RISCV | KVM_REG_SIZE_U64 | KVM_REG_RISCV_CSR |
+				  KVM_REG_RISCV_CSR_GENERAL | i;
+
+		if (uindices) {
+			if (put_user(reg, uindices))
+				return -EFAULT;
+			uindices++;
+		}
+	}
+
+	/* copy AIA csr regs */
+	if (kvm_riscv_aia_available()) {
+		n2 = sizeof(struct kvm_riscv_aia_csr) / sizeof(unsigned long);
+
+		for (i = 0; i < n2; i++) {
+			u64 reg = KVM_REG_RISCV | KVM_REG_SIZE_U64 | KVM_REG_RISCV_CSR |
+					  KVM_REG_RISCV_CSR_AIA | i;
+
+			if (uindices) {
+				if (put_user(reg, uindices))
+					return -EFAULT;
+				uindices++;
+			}
+		}
+	}
+
+	return n1 + n2;
+}
+
+static inline unsigned long num_timer_regs(void)
+{
+	return sizeof(struct kvm_riscv_timer) / sizeof(unsigned long);
+}
+
+static int copy_timer_reg_indices(u64 __user *uindices)
+{
+	unsigned int i;
+	int n = num_timer_regs();
+
+	for (i = 0; i < n; i++) {
+		u64 reg = KVM_REG_RISCV | KVM_REG_SIZE_U64 | KVM_REG_RISCV_TIMER | i;
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
+static inline unsigned long num_fp_f_regs(const struct kvm_vcpu *vcpu)
+{
+	const struct kvm_cpu_context *cntx = &vcpu->arch.guest_context;
+
+	if (riscv_isa_extension_available(vcpu->arch.isa, f))
+		return sizeof(cntx->fp.f) / sizeof(u32);
+	else
+		return 0;
+}
+
+static int copy_fp_f_reg_indices(const struct kvm_vcpu *vcpu,
+					u64 __user *uindices)
+{
+	unsigned int i;
+	int n = num_fp_f_regs(vcpu);
+
+	for (i = 0; i < n; i++) {
+		u64 reg = KVM_REG_RISCV | KVM_REG_SIZE_U32 | KVM_REG_RISCV_FP_F | i;
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
+static inline unsigned long num_fp_d_regs(const struct kvm_vcpu *vcpu)
+{
+	const struct kvm_cpu_context *cntx = &vcpu->arch.guest_context;
+
+	if (riscv_isa_extension_available(vcpu->arch.isa, d))
+		return sizeof(cntx->fp.d.f) / sizeof(u64) + 1;
+	else
+		return 0;
+}
+
+static int copy_fp_d_reg_indices(const struct kvm_vcpu *vcpu,
+					u64 __user *uindices)
+{
+	unsigned int i;
+	int n = num_fp_d_regs(vcpu);
+	u64 reg;
+
+	/* copy fp.d.f indeices */
+	for (i = 0; i < n-1; i++) {
+		reg = KVM_REG_RISCV | KVM_REG_SIZE_U64 | KVM_REG_RISCV_FP_D | i;
+
+		if (uindices) {
+			if (put_user(reg, uindices))
+				return -EFAULT;
+			uindices++;
+		}
+	}
+
+	/* copy fp.d.fcsr indeices */
+	reg = KVM_REG_RISCV | KVM_REG_SIZE_U32 | KVM_REG_RISCV_FP_D | i;
+	if (uindices) {
+		if (put_user(reg, uindices))
+			return -EFAULT;
+	}
+
+	return n;
+}
+
+static inline unsigned long num_isa_ext_regs(void)
+{
+	return KVM_RISCV_ISA_EXT_MAX;
+}
+
+static int copy_isa_ext_reg_indices(u64 __user *uindices)
+{
+	unsigned int i;
+	int n = num_isa_ext_regs();
+
+	for (i = 0; i < n; i++) {
+		u64 reg = KVM_REG_RISCV | KVM_REG_SIZE_U64 | KVM_REG_RISCV_ISA_EXT | i;
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
+static inline unsigned long num_sbi_ext_regs(void)
+{
+	/* number of KVM_REG_RISCV_SBI_SINGLE +
+	 *  2x(number of KVM_REG_RISCV_SBI_MULTI)
+	 */
+	return KVM_RISCV_SBI_EXT_MAX + 2*(KVM_REG_RISCV_SBI_MULTI_REG_LAST+1);
+}
+
+static int copy_sbi_ext_reg_indices(u64 __user *uindices)
+{
+	unsigned int i;
+	int n;
+
+	/* copy KVM_REG_RISCV_SBI_SINGLE */
+	n = KVM_RISCV_SBI_EXT_MAX;
+	for (i = 0; i < n; i++) {
+		u64 reg = KVM_REG_RISCV | KVM_REG_SIZE_U64 | KVM_REG_RISCV_SBI_EXT |
+				  KVM_REG_RISCV_SBI_SINGLE | i;
+
+		if (uindices) {
+			if (put_user(reg, uindices))
+				return -EFAULT;
+			uindices++;
+		}
+	}
+
+	/* copy KVM_REG_RISCV_SBI_MULTI */
+	n = KVM_REG_RISCV_SBI_MULTI_REG_LAST + 1;
+	for (i = 0; i < n; i++) {
+		u64 reg = KVM_REG_RISCV | KVM_REG_SIZE_U64 | KVM_REG_RISCV_SBI_EXT |
+				  KVM_REG_RISCV_SBI_MULTI_EN | i;
+
+		if (uindices) {
+			if (put_user(reg, uindices))
+				return -EFAULT;
+			uindices++;
+		}
+
+		reg = KVM_REG_RISCV | KVM_REG_SIZE_U64 | KVM_REG_RISCV_SBI_EXT |
+			  KVM_REG_RISCV_SBI_MULTI_DIS | i;
+
+		if (uindices) {
+			if (put_user(reg, uindices))
+				return -EFAULT;
+			uindices++;
+		}
+	}
+
+	return num_sbi_ext_regs();
+}
+
+/**
+ * kvm_riscv_vcpu_num_regs - how many registers do we present via KVM_GET/SET_ONE_REG
+ *
+ * This is for all registers.
+ */
+static unsigned long kvm_riscv_vcpu_num_regs(struct kvm_vcpu *vcpu)
+{
+	unsigned long res = 0;
+
+	res += num_config_regs();
+	res += num_core_regs();
+	res += num_csr_regs();
+	res += num_timer_regs();
+	res += num_fp_f_regs(vcpu);
+	res += num_fp_d_regs(vcpu);
+	res += num_isa_ext_regs();
+	res += num_sbi_ext_regs();
+
+	return res;
+}
+
+/**
+ * kvm_riscv_vcpu_copy_reg_indices - get indices of all registers.
+ */
+static int kvm_riscv_vcpu_copy_reg_indices(struct kvm_vcpu *vcpu,
+				u64 __user *uindices)
+{
+	int ret;
+
+	ret = copy_config_reg_indices(uindices);
+	if (ret < 0)
+		return ret;
+	uindices += ret;
+
+	ret = copy_core_reg_indices(uindices);
+	if (ret < 0)
+		return ret;
+	uindices += ret;
+
+	ret = copy_csr_reg_indices(uindices);
+	if (ret < 0)
+		return ret;
+	uindices += ret;
+
+	ret = copy_timer_reg_indices(uindices);
+	if (ret < 0)
+		return ret;
+	uindices += ret;
+
+	ret = copy_fp_f_reg_indices(vcpu, uindices);
+	if (ret < 0)
+		return ret;
+	uindices += ret;
+
+	ret = copy_fp_d_reg_indices(vcpu, uindices);
+	if (ret < 0)
+		return ret;
+	uindices += ret;
+
+	ret = copy_isa_ext_reg_indices(uindices);
+	if (ret < 0)
+		return ret;
+	uindices += ret;
+
+	ret = copy_sbi_ext_reg_indices(uindices);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
 static int kvm_riscv_vcpu_set_reg(struct kvm_vcpu *vcpu,
 				  const struct kvm_one_reg *reg)
 {
@@ -758,6 +1086,24 @@ long kvm_arch_vcpu_ioctl(struct file *filp,
 			r = kvm_riscv_vcpu_get_reg(vcpu, &reg);
 		break;
 	}
+	case KVM_GET_REG_LIST: {
+		struct kvm_reg_list __user *user_list = argp;
+		struct kvm_reg_list reg_list;
+		unsigned int n;
+
+		r = -EFAULT;
+		if (copy_from_user(&reg_list, user_list, sizeof(reg_list)))
+			break;
+		n = reg_list.n;
+		reg_list.n = kvm_riscv_vcpu_num_regs(vcpu);
+		if (copy_to_user(user_list, &reg_list, sizeof(reg_list)))
+			break;
+		r = -E2BIG;
+		if (n < reg_list.n)
+			break;
+		r = kvm_riscv_vcpu_copy_reg_indices(vcpu, user_list->reg);
+		break;
+	}
 	default:
 		break;
 	}
-- 
2.34.1


