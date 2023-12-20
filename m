From: Andrew Jones <ajones@ventanamicro.com>
Date: Wed, 20 Dec 2023 17:00:21 +0100
Subject: [PATCH v4 08/13] RISC-V: KVM: Add support for SBI STA registers
In-Reply-To: <20231220160012.40184-15-ajones@ventanamicro.com>
References: <20231220160012.40184-15-ajones@ventanamicro.com>
Message-ID: <20231220160012.40184-23-ajones@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

KVM userspace needs to be able to save and restore the steal-time
shared memory address. Provide the address through the get/set-one-reg
interface with two ulong-sized SBI STA extension registers (lo and hi).
64-bit KVM userspace must not set the hi register to anything other
than zero and is allowed to completely neglect saving/restoring it.

Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_vcpu_sbi.h |  5 +++
 arch/riscv/include/uapi/asm/kvm.h     |  9 +++++
 arch/riscv/kvm/vcpu_onereg.c          | 37 +++++++++++-------
 arch/riscv/kvm/vcpu_sbi.c             |  5 +++
 arch/riscv/kvm/vcpu_sbi_sta.c         | 55 +++++++++++++++++++++++++++
 5 files changed, 97 insertions(+), 14 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
index dd60f73b5c36..b96705258cf9 100644
--- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
+++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
@@ -70,6 +70,11 @@ bool riscv_vcpu_supports_sbi_ext(struct kvm_vcpu *vcpu, int idx);
 int kvm_riscv_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *run);
 void kvm_riscv_vcpu_sbi_init(struct kvm_vcpu *vcpu);
 
+int kvm_riscv_vcpu_get_reg_sbi_sta(struct kvm_vcpu *vcpu, unsigned long reg_num,
+				   unsigned long *reg_val);
+int kvm_riscv_vcpu_set_reg_sbi_sta(struct kvm_vcpu *vcpu, unsigned long reg_num,
+				   unsigned long reg_val);
+
 #ifdef CONFIG_RISCV_SBI_V01
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_v01;
 #endif
diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 3471b1e48d18..d6b7a5b95874 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -161,6 +161,12 @@ enum KVM_RISCV_SBI_EXT_ID {
 	KVM_RISCV_SBI_EXT_MAX,
 };
 
+/* SBI STA extension registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
+struct kvm_riscv_sbi_sta {
+	unsigned long shmem_lo;
+	unsigned long shmem_hi;
+};
+
 /* Possible states for kvm_riscv_timer */
 #define KVM_RISCV_TIMER_STATE_OFF	0
 #define KVM_RISCV_TIMER_STATE_ON	1
@@ -244,6 +250,9 @@ enum KVM_RISCV_SBI_EXT_ID {
 
 /* Registers for specific SBI extensions are mapped as type 10 */
 #define KVM_REG_RISCV_SBI_STATE		(0x0a << KVM_REG_RISCV_TYPE_SHIFT)
+#define KVM_REG_RISCV_SBI_STA		(0x0 << KVM_REG_RISCV_SUBTYPE_SHIFT)
+#define KVM_REG_RISCV_SBI_STA_REG(name)		\
+		(offsetof(struct kvm_riscv_sbi_sta, name) / sizeof(unsigned long))
 
 /* Device Control API: RISC-V AIA */
 #define KVM_DEV_RISCV_APLIC_ALIGN		0x1000
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index c7f82a3b8fba..c95ea55c29a7 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -961,27 +961,36 @@ static unsigned long num_sbi_ext_regs(struct kvm_vcpu *vcpu)
 	return copy_sbi_ext_reg_indices(vcpu, NULL);
 }
 
-static inline unsigned long num_sbi_regs(struct kvm_vcpu *vcpu)
-{
-	return 0;
-}
-
 static int copy_sbi_reg_indices(struct kvm_vcpu *vcpu, u64 __user *uindices)
 {
-	int n = num_sbi_regs(vcpu);
+	struct kvm_vcpu_sbi_context *scontext = &vcpu->arch.sbi_context;
+	int total = 0;
 
-	for (int i = 0; i < n; i++) {
-		u64 reg = KVM_REG_RISCV | KVM_REG_SIZE_U64 |
-			  KVM_REG_RISCV_SBI_STATE | i;
+	if (scontext->ext_status[KVM_RISCV_SBI_EXT_STA] == KVM_RISCV_SBI_EXT_STATUS_ENABLED) {
+		u64 size = IS_ENABLED(CONFIG_32BIT) ? KVM_REG_SIZE_U32 : KVM_REG_SIZE_U64;
+		int n = sizeof(struct kvm_riscv_sbi_sta) / sizeof(unsigned long);
 
-		if (uindices) {
-			if (put_user(reg, uindices))
-				return -EFAULT;
-			uindices++;
+		for (int i = 0; i < n; i++) {
+			u64 reg = KVM_REG_RISCV | size |
+				  KVM_REG_RISCV_SBI_STATE |
+				  KVM_REG_RISCV_SBI_STA | i;
+
+			if (uindices) {
+				if (put_user(reg, uindices))
+					return -EFAULT;
+				uindices++;
+			}
 		}
+
+		total += n;
 	}
 
-	return n;
+	return total;
+}
+
+static inline unsigned long num_sbi_regs(struct kvm_vcpu *vcpu)
+{
+	return copy_sbi_reg_indices(vcpu, NULL);
 }
 
 static inline unsigned long num_vector_regs(const struct kvm_vcpu *vcpu)
diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
index a1997c39dfde..72a2ffb8dcd1 100644
--- a/arch/riscv/kvm/vcpu_sbi.c
+++ b/arch/riscv/kvm/vcpu_sbi.c
@@ -345,6 +345,8 @@ int kvm_riscv_vcpu_set_reg_sbi(struct kvm_vcpu *vcpu,
 	reg_num &= ~KVM_REG_RISCV_SUBTYPE_MASK;
 
 	switch (reg_subtype) {
+	case KVM_REG_RISCV_SBI_STA:
+		return kvm_riscv_vcpu_set_reg_sbi_sta(vcpu, reg_num, reg_val);
 	default:
 		return -EINVAL;
 	}
@@ -370,6 +372,9 @@ int kvm_riscv_vcpu_get_reg_sbi(struct kvm_vcpu *vcpu,
 	reg_num &= ~KVM_REG_RISCV_SUBTYPE_MASK;
 
 	switch (reg_subtype) {
+	case KVM_REG_RISCV_SBI_STA:
+		ret = kvm_riscv_vcpu_get_reg_sbi_sta(vcpu, reg_num, &reg_val);
+		break;
 	default:
 		return -EINVAL;
 	}
diff --git a/arch/riscv/kvm/vcpu_sbi_sta.c b/arch/riscv/kvm/vcpu_sbi_sta.c
index 6592d287fc4e..87bf1a5f05ce 100644
--- a/arch/riscv/kvm/vcpu_sbi_sta.c
+++ b/arch/riscv/kvm/vcpu_sbi_sta.c
@@ -3,6 +3,8 @@
  * Copyright (c) 2023 Ventana Micro Systems Inc.
  */
 
+#include <linux/kconfig.h>
+#include <linux/kernel.h>
 #include <linux/kvm_host.h>
 
 #include <asm/kvm_vcpu_sbi.h>
@@ -59,3 +61,56 @@ const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_sta = {
 	.handler = kvm_sbi_ext_sta_handler,
 	.probe = kvm_sbi_ext_sta_probe,
 };
+
+int kvm_riscv_vcpu_get_reg_sbi_sta(struct kvm_vcpu *vcpu,
+				   unsigned long reg_num,
+				   unsigned long *reg_val)
+{
+	switch (reg_num) {
+	case KVM_REG_RISCV_SBI_STA_REG(shmem_lo):
+		*reg_val = (unsigned long)vcpu->arch.sta.shmem;
+		break;
+	case KVM_REG_RISCV_SBI_STA_REG(shmem_hi):
+		if (IS_ENABLED(CONFIG_32BIT))
+			*reg_val = upper_32_bits(vcpu->arch.sta.shmem);
+		else
+			*reg_val = 0;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+int kvm_riscv_vcpu_set_reg_sbi_sta(struct kvm_vcpu *vcpu,
+				   unsigned long reg_num,
+				   unsigned long reg_val)
+{
+	switch (reg_num) {
+	case KVM_REG_RISCV_SBI_STA_REG(shmem_lo):
+		if (IS_ENABLED(CONFIG_32BIT)) {
+			gpa_t hi = upper_32_bits(vcpu->arch.sta.shmem);
+
+			vcpu->arch.sta.shmem = reg_val;
+			vcpu->arch.sta.shmem |= hi << 32;
+		} else {
+			vcpu->arch.sta.shmem = reg_val;
+		}
+		break;
+	case KVM_REG_RISCV_SBI_STA_REG(shmem_hi):
+		if (IS_ENABLED(CONFIG_32BIT)) {
+			gpa_t lo = lower_32_bits(vcpu->arch.sta.shmem);
+
+			vcpu->arch.sta.shmem = ((gpa_t)reg_val << 32);
+			vcpu->arch.sta.shmem |= lo;
+		} else if (reg_val != 0) {
+			return -EINVAL;
+		}
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
-- 
2.43.0


