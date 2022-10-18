From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 18 Oct 2022 19:38:49 +0530
Subject: [PATCH kvmtool 1/6] Update UAPI headers based on Linux-6.1-rc1
In-Reply-To: <20221018140854.69846-1-apatel@ventanamicro.com>
References: <20221018140854.69846-1-apatel@ventanamicro.com>
Message-ID: <20221018140854.69846-2-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We update all UAPI headers based on Linux-6.1-rc1 so that we can
use latest features.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arm/aarch64/include/asm/kvm.h |  6 ++++--
 include/linux/kvm.h           |  1 +
 include/linux/virtio_blk.h    | 19 +++++++++++++++++++
 include/linux/virtio_net.h    | 14 +++++++-------
 include/linux/virtio_ring.h   | 16 +++++++++++-----
 riscv/include/asm/kvm.h       |  4 ++++
 6 files changed, 46 insertions(+), 14 deletions(-)

diff --git a/arm/aarch64/include/asm/kvm.h b/arm/aarch64/include/asm/kvm.h
index 3bb1343..316917b 100644
--- a/arm/aarch64/include/asm/kvm.h
+++ b/arm/aarch64/include/asm/kvm.h
@@ -75,9 +75,11 @@ struct kvm_regs {
 
 /* KVM_ARM_SET_DEVICE_ADDR ioctl id encoding */
 #define KVM_ARM_DEVICE_TYPE_SHIFT	0
-#define KVM_ARM_DEVICE_TYPE_MASK	(0xffff << KVM_ARM_DEVICE_TYPE_SHIFT)
+#define KVM_ARM_DEVICE_TYPE_MASK	GENMASK(KVM_ARM_DEVICE_TYPE_SHIFT + 15, \
+						KVM_ARM_DEVICE_TYPE_SHIFT)
 #define KVM_ARM_DEVICE_ID_SHIFT		16
-#define KVM_ARM_DEVICE_ID_MASK		(0xffff << KVM_ARM_DEVICE_ID_SHIFT)
+#define KVM_ARM_DEVICE_ID_MASK		GENMASK(KVM_ARM_DEVICE_ID_SHIFT + 15, \
+						KVM_ARM_DEVICE_ID_SHIFT)
 
 /* Supported device IDs */
 #define KVM_ARM_DEVICE_VGIC_V2		0
diff --git a/include/linux/kvm.h b/include/linux/kvm.h
index eed0315..0d5d441 100644
--- a/include/linux/kvm.h
+++ b/include/linux/kvm.h
@@ -1177,6 +1177,7 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_VM_DISABLE_NX_HUGE_PAGES 220
 #define KVM_CAP_S390_ZPCI_OP 221
 #define KVM_CAP_S390_CPU_TOPOLOGY 222
+#define KVM_CAP_DIRTY_LOG_RING_ACQ_REL 223
 
 #ifdef KVM_CAP_IRQ_ROUTING
 
diff --git a/include/linux/virtio_blk.h b/include/linux/virtio_blk.h
index d888f01..58e70b2 100644
--- a/include/linux/virtio_blk.h
+++ b/include/linux/virtio_blk.h
@@ -40,6 +40,7 @@
 #define VIRTIO_BLK_F_MQ		12	/* support more than one vq */
 #define VIRTIO_BLK_F_DISCARD	13	/* DISCARD is supported */
 #define VIRTIO_BLK_F_WRITE_ZEROES	14	/* WRITE ZEROES is supported */
+#define VIRTIO_BLK_F_SECURE_ERASE	16 /* Secure Erase is supported */
 
 /* Legacy feature bits */
 #ifndef VIRTIO_BLK_NO_LEGACY
@@ -121,6 +122,21 @@ struct virtio_blk_config {
 	__u8 write_zeroes_may_unmap;
 
 	__u8 unused1[3];
+
+	/* the next 3 entries are guarded by VIRTIO_BLK_F_SECURE_ERASE */
+	/*
+	 * The maximum secure erase sectors (in 512-byte sectors) for
+	 * one segment.
+	 */
+	__virtio32 max_secure_erase_sectors;
+	/*
+	 * The maximum number of secure erase segments in a
+	 * secure erase command.
+	 */
+	__virtio32 max_secure_erase_seg;
+	/* Secure erase commands must be aligned to this number of sectors. */
+	__virtio32 secure_erase_sector_alignment;
+
 } __attribute__((packed));
 
 /*
@@ -155,6 +171,9 @@ struct virtio_blk_config {
 /* Write zeroes command */
 #define VIRTIO_BLK_T_WRITE_ZEROES	13
 
+/* Secure erase command */
+#define VIRTIO_BLK_T_SECURE_ERASE	14
+
 #ifndef VIRTIO_BLK_NO_LEGACY
 /* Barrier before this op. */
 #define VIRTIO_BLK_T_BARRIER	0x80000000
diff --git a/include/linux/virtio_net.h b/include/linux/virtio_net.h
index 29ced55..6cb842e 100644
--- a/include/linux/virtio_net.h
+++ b/include/linux/virtio_net.h
@@ -56,7 +56,7 @@
 #define VIRTIO_NET_F_MQ	22	/* Device supports Receive Flow
 					 * Steering */
 #define VIRTIO_NET_F_CTRL_MAC_ADDR 23	/* Set MAC address */
-#define VIRTIO_NET_F_NOTF_COAL	53	/* Guest can handle notifications coalescing */
+#define VIRTIO_NET_F_NOTF_COAL	53	/* Device supports notifications coalescing */
 #define VIRTIO_NET_F_HASH_REPORT  57	/* Supports hash report */
 #define VIRTIO_NET_F_RSS	  60	/* Supports RSS RX steering */
 #define VIRTIO_NET_F_RSC_EXT	  61	/* extended coalescing info */
@@ -364,24 +364,24 @@ struct virtio_net_hash_config {
  */
 #define VIRTIO_NET_CTRL_NOTF_COAL		6
 /*
- * Set the tx-usecs/tx-max-packets patameters.
- * tx-usecs - Maximum number of usecs to delay a TX notification.
- * tx-max-packets - Maximum number of packets to send before a TX notification.
+ * Set the tx-usecs/tx-max-packets parameters.
  */
 struct virtio_net_ctrl_coal_tx {
+	/* Maximum number of packets to send before a TX notification */
 	__le32 tx_max_packets;
+	/* Maximum number of usecs to delay a TX notification */
 	__le32 tx_usecs;
 };
 
 #define VIRTIO_NET_CTRL_NOTF_COAL_TX_SET		0
 
 /*
- * Set the rx-usecs/rx-max-packets patameters.
- * rx-usecs - Maximum number of usecs to delay a RX notification.
- * rx-max-frames - Maximum number of packets to receive before a RX notification.
+ * Set the rx-usecs/rx-max-packets parameters.
  */
 struct virtio_net_ctrl_coal_rx {
+	/* Maximum number of packets to receive before a RX notification */
 	__le32 rx_max_packets;
+	/* Maximum number of usecs to delay a RX notification */
 	__le32 rx_usecs;
 };
 
diff --git a/include/linux/virtio_ring.h b/include/linux/virtio_ring.h
index 476d3e5..f8c20d3 100644
--- a/include/linux/virtio_ring.h
+++ b/include/linux/virtio_ring.h
@@ -93,15 +93,21 @@
 #define VRING_USED_ALIGN_SIZE 4
 #define VRING_DESC_ALIGN_SIZE 16
 
-/* Virtio ring descriptors: 16 bytes.  These can chain together via "next". */
+/**
+ * struct vring_desc - Virtio ring descriptors,
+ * 16 bytes long. These can chain together via @next.
+ *
+ * @addr: buffer address (guest-physical)
+ * @len: buffer length
+ * @flags: descriptor flags
+ * @next: index of the next descriptor in the chain,
+ *        if the VRING_DESC_F_NEXT flag is set. We chain unused
+ *        descriptors via this, too.
+ */
 struct vring_desc {
-	/* Address (guest-physical). */
 	__virtio64 addr;
-	/* Length. */
 	__virtio32 len;
-	/* The flags as indicated above. */
 	__virtio16 flags;
-	/* We chain unused descriptors via this, too */
 	__virtio16 next;
 };
 
diff --git a/riscv/include/asm/kvm.h b/riscv/include/asm/kvm.h
index 7351417..8985ff2 100644
--- a/riscv/include/asm/kvm.h
+++ b/riscv/include/asm/kvm.h
@@ -48,6 +48,7 @@ struct kvm_sregs {
 /* CONFIG registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
 struct kvm_riscv_config {
 	unsigned long isa;
+	unsigned long zicbom_block_size;
 };
 
 /* CORE registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
@@ -98,6 +99,9 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_M,
 	KVM_RISCV_ISA_EXT_SVPBMT,
 	KVM_RISCV_ISA_EXT_SSTC,
+	KVM_RISCV_ISA_EXT_SVINVAL,
+	KVM_RISCV_ISA_EXT_ZIHINTPAUSE,
+	KVM_RISCV_ISA_EXT_ZICBOM,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
-- 
2.34.1


