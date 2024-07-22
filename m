From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 22 Jul 2024 17:37:09 +0530
Subject: [PATCH 1/2] Sync-up headers with Linux-6.10 kernel
In-Reply-To: <20240722120710.417705-1-apatel@ventanamicro.com>
References: <20240722120710.417705-1-apatel@ventanamicro.com>
Message-ID: <20240722120710.417705-2-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We sync-up Linux headers to get latest KVM RISC-V headers having
Sscofpmf support.

Signed-off-by: Anup Patel Anup Patel <apatel@ventanamicro.com>
---
 include/linux/kvm.h        |   4 +-
 include/linux/virtio_net.h | 143 +++++++++++++++++++++++++++++++++++++
 riscv/include/asm/kvm.h    |   1 +
 x86/include/asm/kvm.h      |  22 +++++-
 4 files changed, 166 insertions(+), 4 deletions(-)

diff --git a/include/linux/kvm.h b/include/linux/kvm.h
index 2190adb..d03842a 100644
--- a/include/linux/kvm.h
+++ b/include/linux/kvm.h
@@ -1221,9 +1221,9 @@ struct kvm_vfio_spapr_tce {
 /* Available with KVM_CAP_SPAPR_RESIZE_HPT */
 #define KVM_PPC_RESIZE_HPT_PREPARE _IOR(KVMIO, 0xad, struct kvm_ppc_resize_hpt)
 #define KVM_PPC_RESIZE_HPT_COMMIT  _IOR(KVMIO, 0xae, struct kvm_ppc_resize_hpt)
-/* Available with KVM_CAP_PPC_RADIX_MMU or KVM_CAP_PPC_HASH_MMU_V3 */
+/* Available with KVM_CAP_PPC_MMU_RADIX or KVM_CAP_PPC_MMU_HASH_V3 */
 #define KVM_PPC_CONFIGURE_V3_MMU  _IOW(KVMIO,  0xaf, struct kvm_ppc_mmuv3_cfg)
-/* Available with KVM_CAP_PPC_RADIX_MMU */
+/* Available with KVM_CAP_PPC_MMU_RADIX */
 #define KVM_PPC_GET_RMMU_INFO	  _IOW(KVMIO,  0xb0, struct kvm_ppc_rmmu_info)
 /* Available with KVM_CAP_PPC_GET_CPU_CHAR */
 #define KVM_PPC_GET_CPU_CHAR	  _IOR(KVMIO,  0xb1, struct kvm_ppc_cpu_char)
diff --git a/include/linux/virtio_net.h b/include/linux/virtio_net.h
index cc65ef0..ac91747 100644
--- a/include/linux/virtio_net.h
+++ b/include/linux/virtio_net.h
@@ -56,6 +56,7 @@
 #define VIRTIO_NET_F_MQ	22	/* Device supports Receive Flow
 					 * Steering */
 #define VIRTIO_NET_F_CTRL_MAC_ADDR 23	/* Set MAC address */
+#define VIRTIO_NET_F_DEVICE_STATS 50	/* Device can provide device-level statistics. */
 #define VIRTIO_NET_F_VQ_NOTF_COAL 52	/* Device supports virtqueue notification coalescing */
 #define VIRTIO_NET_F_NOTF_COAL	53	/* Device supports notifications coalescing */
 #define VIRTIO_NET_F_GUEST_USO4	54	/* Guest can handle USOv4 in. */
@@ -406,4 +407,146 @@ struct  virtio_net_ctrl_coal_vq {
 	struct virtio_net_ctrl_coal coal;
 };
 
+/*
+ * Device Statistics
+ */
+#define VIRTIO_NET_CTRL_STATS         8
+#define VIRTIO_NET_CTRL_STATS_QUERY   0
+#define VIRTIO_NET_CTRL_STATS_GET     1
+
+struct virtio_net_stats_capabilities {
+
+#define VIRTIO_NET_STATS_TYPE_CVQ       (1ULL << 32)
+
+#define VIRTIO_NET_STATS_TYPE_RX_BASIC  (1ULL << 0)
+#define VIRTIO_NET_STATS_TYPE_RX_CSUM   (1ULL << 1)
+#define VIRTIO_NET_STATS_TYPE_RX_GSO    (1ULL << 2)
+#define VIRTIO_NET_STATS_TYPE_RX_SPEED  (1ULL << 3)
+
+#define VIRTIO_NET_STATS_TYPE_TX_BASIC  (1ULL << 16)
+#define VIRTIO_NET_STATS_TYPE_TX_CSUM   (1ULL << 17)
+#define VIRTIO_NET_STATS_TYPE_TX_GSO    (1ULL << 18)
+#define VIRTIO_NET_STATS_TYPE_TX_SPEED  (1ULL << 19)
+
+	__le64 supported_stats_types[1];
+};
+
+struct virtio_net_ctrl_queue_stats {
+	struct {
+		__le16 vq_index;
+		__le16 reserved[3];
+		__le64 types_bitmap[1];
+	} stats[1];
+};
+
+struct virtio_net_stats_reply_hdr {
+#define VIRTIO_NET_STATS_TYPE_REPLY_CVQ       32
+
+#define VIRTIO_NET_STATS_TYPE_REPLY_RX_BASIC  0
+#define VIRTIO_NET_STATS_TYPE_REPLY_RX_CSUM   1
+#define VIRTIO_NET_STATS_TYPE_REPLY_RX_GSO    2
+#define VIRTIO_NET_STATS_TYPE_REPLY_RX_SPEED  3
+
+#define VIRTIO_NET_STATS_TYPE_REPLY_TX_BASIC  16
+#define VIRTIO_NET_STATS_TYPE_REPLY_TX_CSUM   17
+#define VIRTIO_NET_STATS_TYPE_REPLY_TX_GSO    18
+#define VIRTIO_NET_STATS_TYPE_REPLY_TX_SPEED  19
+	__u8 type;
+	__u8 reserved;
+	__le16 vq_index;
+	__le16 reserved1;
+	__le16 size;
+};
+
+struct virtio_net_stats_cvq {
+	struct virtio_net_stats_reply_hdr hdr;
+
+	__le64 command_num;
+	__le64 ok_num;
+};
+
+struct virtio_net_stats_rx_basic {
+	struct virtio_net_stats_reply_hdr hdr;
+
+	__le64 rx_notifications;
+
+	__le64 rx_packets;
+	__le64 rx_bytes;
+
+	__le64 rx_interrupts;
+
+	__le64 rx_drops;
+	__le64 rx_drop_overruns;
+};
+
+struct virtio_net_stats_tx_basic {
+	struct virtio_net_stats_reply_hdr hdr;
+
+	__le64 tx_notifications;
+
+	__le64 tx_packets;
+	__le64 tx_bytes;
+
+	__le64 tx_interrupts;
+
+	__le64 tx_drops;
+	__le64 tx_drop_malformed;
+};
+
+struct virtio_net_stats_rx_csum {
+	struct virtio_net_stats_reply_hdr hdr;
+
+	__le64 rx_csum_valid;
+	__le64 rx_needs_csum;
+	__le64 rx_csum_none;
+	__le64 rx_csum_bad;
+};
+
+struct virtio_net_stats_tx_csum {
+	struct virtio_net_stats_reply_hdr hdr;
+
+	__le64 tx_csum_none;
+	__le64 tx_needs_csum;
+};
+
+struct virtio_net_stats_rx_gso {
+	struct virtio_net_stats_reply_hdr hdr;
+
+	__le64 rx_gso_packets;
+	__le64 rx_gso_bytes;
+	__le64 rx_gso_packets_coalesced;
+	__le64 rx_gso_bytes_coalesced;
+};
+
+struct virtio_net_stats_tx_gso {
+	struct virtio_net_stats_reply_hdr hdr;
+
+	__le64 tx_gso_packets;
+	__le64 tx_gso_bytes;
+	__le64 tx_gso_segments;
+	__le64 tx_gso_segments_bytes;
+	__le64 tx_gso_packets_noseg;
+	__le64 tx_gso_bytes_noseg;
+};
+
+struct virtio_net_stats_rx_speed {
+	struct virtio_net_stats_reply_hdr hdr;
+
+	/* rx_{packets,bytes}_allowance_exceeded are too long. So rename to
+	 * short name.
+	 */
+	__le64 rx_ratelimit_packets;
+	__le64 rx_ratelimit_bytes;
+};
+
+struct virtio_net_stats_tx_speed {
+	struct virtio_net_stats_reply_hdr hdr;
+
+	/* tx_{packets,bytes}_allowance_exceeded are too long. So rename to
+	 * short name.
+	 */
+	__le64 tx_ratelimit_packets;
+	__le64 tx_ratelimit_bytes;
+};
+
 #endif /* _UAPI_LINUX_VIRTIO_NET_H */
diff --git a/riscv/include/asm/kvm.h b/riscv/include/asm/kvm.h
index b1c503c..e878e7c 100644
--- a/riscv/include/asm/kvm.h
+++ b/riscv/include/asm/kvm.h
@@ -167,6 +167,7 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_ZFA,
 	KVM_RISCV_ISA_EXT_ZTSO,
 	KVM_RISCV_ISA_EXT_ZACAS,
+	KVM_RISCV_ISA_EXT_SSCOFPMF,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
diff --git a/x86/include/asm/kvm.h b/x86/include/asm/kvm.h
index ef11aa4..9fae1b7 100644
--- a/x86/include/asm/kvm.h
+++ b/x86/include/asm/kvm.h
@@ -457,8 +457,13 @@ struct kvm_sync_regs {
 
 #define KVM_STATE_VMX_PREEMPTION_TIMER_DEADLINE	0x00000001
 
-/* attributes for system fd (group 0) */
-#define KVM_X86_XCOMP_GUEST_SUPP	0
+/* vendor-independent attributes for system fd (group 0) */
+#define KVM_X86_GRP_SYSTEM		0
+#  define KVM_X86_XCOMP_GUEST_SUPP	0
+
+/* vendor-specific groups and attributes for system fd */
+#define KVM_X86_GRP_SEV			1
+#  define KVM_X86_SEV_VMSA_FEATURES	0
 
 struct kvm_vmx_nested_state_data {
 	__u8 vmcs12[KVM_STATE_NESTED_VMX_VMCS_SIZE];
@@ -689,6 +694,9 @@ enum sev_cmd_id {
 	/* Guest Migration Extension */
 	KVM_SEV_SEND_CANCEL,
 
+	/* Second time is the charm; improved versions of the above ioctls.  */
+	KVM_SEV_INIT2,
+
 	KVM_SEV_NR_MAX,
 };
 
@@ -700,6 +708,14 @@ struct kvm_sev_cmd {
 	__u32 sev_fd;
 };
 
+struct kvm_sev_init {
+	__u64 vmsa_features;
+	__u32 flags;
+	__u16 ghcb_version;
+	__u16 pad1;
+	__u32 pad2[8];
+};
+
 struct kvm_sev_launch_start {
 	__u32 handle;
 	__u32 policy;
@@ -856,5 +872,7 @@ struct kvm_hyperv_eventfd {
 
 #define KVM_X86_DEFAULT_VM	0
 #define KVM_X86_SW_PROTECTED_VM	1
+#define KVM_X86_SEV_VM		2
+#define KVM_X86_SEV_ES_VM	3
 
 #endif /* _ASM_X86_KVM_H */
-- 
2.34.1


