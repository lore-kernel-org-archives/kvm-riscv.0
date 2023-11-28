From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 28 Nov 2023 20:26:19 +0530
Subject: [kvmtool PATCH 01/10] Sync-up header with Linux-6.7-rc3 for KVM RISC-V
In-Reply-To: <20231128145628.413414-1-apatel@ventanamicro.com>
References: <20231128145628.413414-1-apatel@ventanamicro.com>
Message-ID: <20231128145628.413414-2-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We sync-up Linux headers to get latest KVM RISC-V headers having
Zba, Zbs, Zicntr, Zifencei, Zihpm, Smstateen, XVentanaCondOps Zicond,
and SBI DBCN support.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arm/aarch64/include/asm/kvm.h | 32 ++++++++++++++++++++++++++++++++
 include/linux/kvm.h           | 11 +++++++++++
 include/linux/virtio_config.h |  5 +++++
 include/linux/virtio_pci.h    | 11 +++++++++++
 riscv/include/asm/kvm.h       | 12 ++++++++++++
 5 files changed, 71 insertions(+)

diff --git a/arm/aarch64/include/asm/kvm.h b/arm/aarch64/include/asm/kvm.h
index f7ddd73..89d2fc8 100644
--- a/arm/aarch64/include/asm/kvm.h
+++ b/arm/aarch64/include/asm/kvm.h
@@ -505,6 +505,38 @@ struct kvm_smccc_filter {
 #define KVM_HYPERCALL_EXIT_SMC		(1U << 0)
 #define KVM_HYPERCALL_EXIT_16BIT	(1U << 1)
 
+/*
+ * Get feature ID registers userspace writable mask.
+ *
+ * From DDI0487J.a, D19.2.66 ("ID_AA64MMFR2_EL1, AArch64 Memory Model
+ * Feature Register 2"):
+ *
+ * "The Feature ID space is defined as the System register space in
+ * AArch64 with op0==3, op1=={0, 1, 3}, CRn==0, CRm=={0-7},
+ * op2=={0-7}."
+ *
+ * This covers all currently known R/O registers that indicate
+ * anything useful feature wise, including the ID registers.
+ *
+ * If we ever need to introduce a new range, it will be described as
+ * such in the range field.
+ */
+#define KVM_ARM_FEATURE_ID_RANGE_IDX(op0, op1, crn, crm, op2)		\
+	({								\
+		__u64 __op1 = (op1) & 3;				\
+		__op1 -= (__op1 == 3);					\
+		(__op1 << 6 | ((crm) & 7) << 3 | (op2));		\
+	})
+
+#define KVM_ARM_FEATURE_ID_RANGE	0
+#define KVM_ARM_FEATURE_ID_RANGE_SIZE	(3 * 8 * 8)
+
+struct reg_mask_range {
+	__u64 addr;		/* Pointer to mask array */
+	__u32 range;		/* Requested range */
+	__u32 reserved[13];
+};
+
 #endif
 
 #endif /* __ARM_KVM_H__ */
diff --git a/include/linux/kvm.h b/include/linux/kvm.h
index 13065dd..211b86d 100644
--- a/include/linux/kvm.h
+++ b/include/linux/kvm.h
@@ -264,6 +264,7 @@ struct kvm_xen_exit {
 #define KVM_EXIT_RISCV_SBI        35
 #define KVM_EXIT_RISCV_CSR        36
 #define KVM_EXIT_NOTIFY           37
+#define KVM_EXIT_LOONGARCH_IOCSR  38
 
 /* For KVM_EXIT_INTERNAL_ERROR */
 /* Emulate instruction failed. */
@@ -336,6 +337,13 @@ struct kvm_run {
 			__u32 len;
 			__u8  is_write;
 		} mmio;
+		/* KVM_EXIT_LOONGARCH_IOCSR */
+		struct {
+			__u64 phys_addr;
+			__u8  data[8];
+			__u32 len;
+			__u8  is_write;
+		} iocsr_io;
 		/* KVM_EXIT_HYPERCALL */
 		struct {
 			__u64 nr;
@@ -1192,6 +1200,7 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_COUNTER_OFFSET 227
 #define KVM_CAP_ARM_EAGER_SPLIT_CHUNK_SIZE 228
 #define KVM_CAP_ARM_SUPPORTED_BLOCK_SIZES 229
+#define KVM_CAP_ARM_SUPPORTED_REG_MASK_RANGES 230
 
 #ifdef KVM_CAP_IRQ_ROUTING
 
@@ -1362,6 +1371,7 @@ struct kvm_dirty_tlb {
 #define KVM_REG_ARM64		0x6000000000000000ULL
 #define KVM_REG_MIPS		0x7000000000000000ULL
 #define KVM_REG_RISCV		0x8000000000000000ULL
+#define KVM_REG_LOONGARCH	0x9000000000000000ULL
 
 #define KVM_REG_SIZE_SHIFT	52
 #define KVM_REG_SIZE_MASK	0x00f0000000000000ULL
@@ -1562,6 +1572,7 @@ struct kvm_s390_ucas_mapping {
 #define KVM_ARM_MTE_COPY_TAGS	  _IOR(KVMIO,  0xb4, struct kvm_arm_copy_mte_tags)
 /* Available with KVM_CAP_COUNTER_OFFSET */
 #define KVM_ARM_SET_COUNTER_OFFSET _IOW(KVMIO,  0xb5, struct kvm_arm_counter_offset)
+#define KVM_ARM_GET_REG_WRITABLE_MASKS _IOR(KVMIO,  0xb6, struct reg_mask_range)
 
 /* ioctl for vm fd */
 #define KVM_CREATE_DEVICE	  _IOWR(KVMIO,  0xe0, struct kvm_create_device)
diff --git a/include/linux/virtio_config.h b/include/linux/virtio_config.h
index 2c712c6..8881aea 100644
--- a/include/linux/virtio_config.h
+++ b/include/linux/virtio_config.h
@@ -105,6 +105,11 @@
  */
 #define VIRTIO_F_NOTIFICATION_DATA	38
 
+/* This feature indicates that the driver uses the data provided by the device
+ * as a virtqueue identifier in available buffer notifications.
+ */
+#define VIRTIO_F_NOTIF_CONFIG_DATA	39
+
 /*
  * This feature indicates that the driver can reset a queue individually.
  */
diff --git a/include/linux/virtio_pci.h b/include/linux/virtio_pci.h
index f703afc..44f4dd2 100644
--- a/include/linux/virtio_pci.h
+++ b/include/linux/virtio_pci.h
@@ -166,6 +166,17 @@ struct virtio_pci_common_cfg {
 	__le32 queue_used_hi;		/* read-write */
 };
 
+/*
+ * Warning: do not use sizeof on this: use offsetofend for
+ * specific fields you need.
+ */
+struct virtio_pci_modern_common_cfg {
+	struct virtio_pci_common_cfg cfg;
+
+	__le16 queue_notify_data;	/* read-write */
+	__le16 queue_reset;		/* read-write */
+};
+
 /* Fields in VIRTIO_PCI_CAP_PCI_CFG: */
 struct virtio_pci_cfg_cap {
 	struct virtio_pci_cap cap;
diff --git a/riscv/include/asm/kvm.h b/riscv/include/asm/kvm.h
index 992c5e4..60d3b21 100644
--- a/riscv/include/asm/kvm.h
+++ b/riscv/include/asm/kvm.h
@@ -80,6 +80,7 @@ struct kvm_riscv_csr {
 	unsigned long sip;
 	unsigned long satp;
 	unsigned long scounteren;
+	unsigned long senvcfg;
 };
 
 /* AIA CSR registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
@@ -93,6 +94,11 @@ struct kvm_riscv_aia_csr {
 	unsigned long iprio2h;
 };
 
+/* Smstateen CSR for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
+struct kvm_riscv_smstateen_csr {
+	unsigned long sstateen0;
+};
+
 /* TIMER registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
 struct kvm_riscv_timer {
 	__u64 frequency;
@@ -131,6 +137,8 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_ZICSR,
 	KVM_RISCV_ISA_EXT_ZIFENCEI,
 	KVM_RISCV_ISA_EXT_ZIHPM,
+	KVM_RISCV_ISA_EXT_SMSTATEEN,
+	KVM_RISCV_ISA_EXT_ZICOND,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
@@ -148,6 +156,7 @@ enum KVM_RISCV_SBI_EXT_ID {
 	KVM_RISCV_SBI_EXT_PMU,
 	KVM_RISCV_SBI_EXT_EXPERIMENTAL,
 	KVM_RISCV_SBI_EXT_VENDOR,
+	KVM_RISCV_SBI_EXT_DBCN,
 	KVM_RISCV_SBI_EXT_MAX,
 };
 
@@ -178,10 +187,13 @@ enum KVM_RISCV_SBI_EXT_ID {
 #define KVM_REG_RISCV_CSR		(0x03 << KVM_REG_RISCV_TYPE_SHIFT)
 #define KVM_REG_RISCV_CSR_GENERAL	(0x0 << KVM_REG_RISCV_SUBTYPE_SHIFT)
 #define KVM_REG_RISCV_CSR_AIA		(0x1 << KVM_REG_RISCV_SUBTYPE_SHIFT)
+#define KVM_REG_RISCV_CSR_SMSTATEEN	(0x2 << KVM_REG_RISCV_SUBTYPE_SHIFT)
 #define KVM_REG_RISCV_CSR_REG(name)	\
 		(offsetof(struct kvm_riscv_csr, name) / sizeof(unsigned long))
 #define KVM_REG_RISCV_CSR_AIA_REG(name)	\
 	(offsetof(struct kvm_riscv_aia_csr, name) / sizeof(unsigned long))
+#define KVM_REG_RISCV_CSR_SMSTATEEN_REG(name)  \
+	(offsetof(struct kvm_riscv_smstateen_csr, name) / sizeof(unsigned long))
 
 /* Timer registers are mapped as type 4 */
 #define KVM_REG_RISCV_TIMER		(0x04 << KVM_REG_RISCV_TYPE_SHIFT)
-- 
2.34.1


