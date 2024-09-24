From: zhouquan@iscas.ac.cn <zhouquan@iscas.ac.cn>
Date: Tue, 24 Sep 2024 19:03:41 +0800
Subject: [kvmtool PATCH 1/2] Sync-up headers with Linux-6.11 kernel
In-Reply-To: <cover.1727174321.git.zhouquan@iscas.ac.cn>
References: <cover.1727174321.git.zhouquan@iscas.ac.cn>
Message-ID: <ff808dfac24903d859faa4f50c18a3bc2f420539.1727174321.git.zhouquan@iscas.ac.cn>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Quan Zhou <zhouquan@iscas.ac.cn>

Sync Linux-6.11 headers to get the latest RISC-V KVM caps.

Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
---
 include/linux/kvm.h       | 27 ++++++++++++++++++++-
 powerpc/include/asm/kvm.h |  3 +++
 riscv/include/asm/kvm.h   |  7 ++++++
 x86/include/asm/kvm.h     | 49 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 85 insertions(+), 1 deletion(-)

diff --git a/include/linux/kvm.h b/include/linux/kvm.h
index d03842a..637efc0 100644
--- a/include/linux/kvm.h
+++ b/include/linux/kvm.h
@@ -192,11 +192,24 @@ struct kvm_xen_exit {
 /* Flags that describe what fields in emulation_failure hold valid data. */
 #define KVM_INTERNAL_ERROR_EMULATION_FLAG_INSTRUCTION_BYTES (1ULL << 0)
 
+/*
+ * struct kvm_run can be modified by userspace@any time, so KVM must be
+ * careful to avoid TOCTOU bugs. In order to protect KVM, HINT_UNSAFE_IN_KVM()
+ * renames fields in struct kvm_run from <symbol> to <symbol>__unsafe when
+ * compiled into the kernel, ensuring that any use within KVM is obvious and
+ * gets extra scrutiny.
+ */
+#ifdef __KERNEL__
+#define HINT_UNSAFE_IN_KVM(_symbol) _symbol##__unsafe
+#else
+#define HINT_UNSAFE_IN_KVM(_symbol) _symbol
+#endif
+
 /* for KVM_RUN, returned by mmap(vcpu_fd, offset=0) */
 struct kvm_run {
 	/* in */
 	__u8 request_interrupt_window;
-	__u8 immediate_exit;
+	__u8 HINT_UNSAFE_IN_KVM(immediate_exit);
 	__u8 padding1[6];
 
 	/* out */
@@ -917,6 +930,9 @@ struct kvm_enable_cap {
 #define KVM_CAP_MEMORY_ATTRIBUTES 233
 #define KVM_CAP_GUEST_MEMFD 234
 #define KVM_CAP_VM_TYPES 235
+#define KVM_CAP_PRE_FAULT_MEMORY 236
+#define KVM_CAP_X86_APIC_BUS_CYCLES_NS 237
+#define KVM_CAP_X86_GUEST_MODE 238
 
 struct kvm_irq_routing_irqchip {
 	__u32 irqchip;
@@ -1548,4 +1564,13 @@ struct kvm_create_guest_memfd {
 	__u64 reserved[6];
 };
 
+#define KVM_PRE_FAULT_MEMORY	_IOWR(KVMIO, 0xd5, struct kvm_pre_fault_memory)
+
+struct kvm_pre_fault_memory {
+	__u64 gpa;
+	__u64 size;
+	__u64 flags;
+	__u64 padding[5];
+};
+
 #endif /* __LINUX_KVM_H */
diff --git a/powerpc/include/asm/kvm.h b/powerpc/include/asm/kvm.h
index 1691297..eaeda00 100644
--- a/powerpc/include/asm/kvm.h
+++ b/powerpc/include/asm/kvm.h
@@ -645,6 +645,9 @@ struct kvm_ppc_cpu_char {
 #define KVM_REG_PPC_SIER3	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0xc3)
 #define KVM_REG_PPC_DAWR1	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0xc4)
 #define KVM_REG_PPC_DAWRX1	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0xc5)
+#define KVM_REG_PPC_DEXCR	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0xc6)
+#define KVM_REG_PPC_HASHKEYR	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0xc7)
+#define KVM_REG_PPC_HASHPKEYR	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0xc8)
 
 /* Transactional Memory checkpointed state:
  * This is all GPRs, all VSX regs and a subset of SPRs
diff --git a/riscv/include/asm/kvm.h b/riscv/include/asm/kvm.h
index e878e7c..e97db32 100644
--- a/riscv/include/asm/kvm.h
+++ b/riscv/include/asm/kvm.h
@@ -168,6 +168,13 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_ZTSO,
 	KVM_RISCV_ISA_EXT_ZACAS,
 	KVM_RISCV_ISA_EXT_SSCOFPMF,
+	KVM_RISCV_ISA_EXT_ZIMOP,
+	KVM_RISCV_ISA_EXT_ZCA,
+	KVM_RISCV_ISA_EXT_ZCB,
+	KVM_RISCV_ISA_EXT_ZCD,
+	KVM_RISCV_ISA_EXT_ZCF,
+	KVM_RISCV_ISA_EXT_ZCMOP,
+	KVM_RISCV_ISA_EXT_ZAWRS,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
diff --git a/x86/include/asm/kvm.h b/x86/include/asm/kvm.h
index 9fae1b7..bf57a82 100644
--- a/x86/include/asm/kvm.h
+++ b/x86/include/asm/kvm.h
@@ -106,6 +106,7 @@ struct kvm_ioapic_state {
 
 #define KVM_RUN_X86_SMM		 (1 << 0)
 #define KVM_RUN_X86_BUS_LOCK     (1 << 1)
+#define KVM_RUN_X86_GUEST_MODE   (1 << 2)
 
 /* for KVM_GET_REGS and KVM_SET_REGS */
 struct kvm_regs {
@@ -697,6 +698,11 @@ enum sev_cmd_id {
 	/* Second time is the charm; improved versions of the above ioctls.  */
 	KVM_SEV_INIT2,
 
+	/* SNP-specific commands */
+	KVM_SEV_SNP_LAUNCH_START = 100,
+	KVM_SEV_SNP_LAUNCH_UPDATE,
+	KVM_SEV_SNP_LAUNCH_FINISH,
+
 	KVM_SEV_NR_MAX,
 };
 
@@ -824,6 +830,48 @@ struct kvm_sev_receive_update_data {
 	__u32 pad2;
 };
 
+struct kvm_sev_snp_launch_start {
+	__u64 policy;
+	__u8 gosvw[16];
+	__u16 flags;
+	__u8 pad0[6];
+	__u64 pad1[4];
+};
+
+/* Kept in sync with firmware values for simplicity. */
+#define KVM_SEV_SNP_PAGE_TYPE_NORMAL		0x1
+#define KVM_SEV_SNP_PAGE_TYPE_ZERO		0x3
+#define KVM_SEV_SNP_PAGE_TYPE_UNMEASURED	0x4
+#define KVM_SEV_SNP_PAGE_TYPE_SECRETS		0x5
+#define KVM_SEV_SNP_PAGE_TYPE_CPUID		0x6
+
+struct kvm_sev_snp_launch_update {
+	__u64 gfn_start;
+	__u64 uaddr;
+	__u64 len;
+	__u8 type;
+	__u8 pad0;
+	__u16 flags;
+	__u32 pad1;
+	__u64 pad2[4];
+};
+
+#define KVM_SEV_SNP_ID_BLOCK_SIZE	96
+#define KVM_SEV_SNP_ID_AUTH_SIZE	4096
+#define KVM_SEV_SNP_FINISH_DATA_SIZE	32
+
+struct kvm_sev_snp_launch_finish {
+	__u64 id_block_uaddr;
+	__u64 id_auth_uaddr;
+	__u8 id_block_en;
+	__u8 auth_key_en;
+	__u8 vcek_disabled;
+	__u8 host_data[KVM_SEV_SNP_FINISH_DATA_SIZE];
+	__u8 pad0[3];
+	__u16 flags;
+	__u64 pad1[4];
+};
+
 #define KVM_X2APIC_API_USE_32BIT_IDS            (1ULL << 0)
 #define KVM_X2APIC_API_DISABLE_BROADCAST_QUIRK  (1ULL << 1)
 
@@ -874,5 +922,6 @@ struct kvm_hyperv_eventfd {
 #define KVM_X86_SW_PROTECTED_VM	1
 #define KVM_X86_SEV_VM		2
 #define KVM_X86_SEV_ES_VM	3
+#define KVM_X86_SNP_VM		4
 
 #endif /* _ASM_X86_KVM_H */
-- 
2.34.1


