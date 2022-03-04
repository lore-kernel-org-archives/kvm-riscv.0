From: Atish Patra <atishp@rivosinc.com>
Date: Fri,  4 Mar 2022 02:10:21 -0800
Subject: [RFC PATCH kvmtool 1/3] riscv: Update the uapi header as per Linux
 kernel
In-Reply-To: <20220304101023.764631-1-atishp@rivosinc.com>
References: <20220304101023.764631-1-atishp@rivosinc.com>
Message-ID: <20220304101023.764631-2-atishp@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The one reg interface is extended for multi-letter ISA extensions
in KVM. Update the uapi header file as per that.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 riscv/include/asm/kvm.h | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/riscv/include/asm/kvm.h b/riscv/include/asm/kvm.h
index f808ad1ce500..e01678aa2a55 100644
--- a/riscv/include/asm/kvm.h
+++ b/riscv/include/asm/kvm.h
@@ -47,6 +47,7 @@ struct kvm_sregs {
 
 /* CONFIG registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
 struct kvm_riscv_config {
+	/* This is a bitmap of all the single letter base ISA extensions */
 	unsigned long isa;
 };
 
@@ -82,6 +83,23 @@ struct kvm_riscv_timer {
 	__u64 state;
 };
 
+/**
+ * ISA extension IDs specific to KVM. This is not the same as the host ISA
+ * extension IDs as that is internal to the host and should not be exposed
+ * to the guest. This should always be contiguous to keep the mapping simple
+ * in KVM implementation.
+ */
+enum KVM_RISCV_ISA_EXT_ID {
+	KVM_RISCV_ISA_EXT_A = 0,
+	KVM_RISCV_ISA_EXT_C,
+	KVM_RISCV_ISA_EXT_D,
+	KVM_RISCV_ISA_EXT_F,
+	KVM_RISCV_ISA_EXT_H,
+	KVM_RISCV_ISA_EXT_I,
+	KVM_RISCV_ISA_EXT_M,
+	KVM_RISCV_ISA_EXT_MAX,
+};
+
 /* Possible states for kvm_riscv_timer */
 #define KVM_RISCV_TIMER_STATE_OFF	0
 #define KVM_RISCV_TIMER_STATE_ON	1
@@ -123,6 +141,9 @@ struct kvm_riscv_timer {
 #define KVM_REG_RISCV_FP_D_REG(name)	\
 		(offsetof(struct __riscv_d_ext_state, name) / sizeof(__u64))
 
+/* ISA Extension registers are mapped as type 7 */
+#define KVM_REG_RISCV_ISA_EXT		(0x07 << KVM_REG_RISCV_TYPE_SHIFT)
+
 #endif
 
 #endif /* __LINUX_KVM_RISCV_H */
-- 
2.30.2


