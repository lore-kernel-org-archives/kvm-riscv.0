From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 19 Apr 2023 15:23:48 -0700
Subject: [RFC kvmtool 08/10] riscv: virtio: Enforce VIRTIO_F_ACCESS_PLATFORM feature flag.
In-Reply-To: <20230419222350.3604274-1-atishp@rivosinc.com>
References: <20230419222350.3604274-1-atishp@rivosinc.com>
Message-ID: <20230419222350.3604274-9-atishp@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Rajnesh Kanwal <rkanwal@rivosinc.com>

VIRTIO_F_ACCESS_PLATFORM feature tells the guest that device will
be using DMA for transfers. This forces the guest to use DMA API
to allow the host to successfully access guest memory as needed.

This is needed for CoVE VMs.

Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
---
 riscv/kvm.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/riscv/kvm.c b/riscv/kvm.c
index e728790..aebb6bd 100644
--- a/riscv/kvm.c
+++ b/riscv/kvm.c
@@ -7,6 +7,7 @@
 #include <linux/kernel.h>
 #include <linux/kvm.h>
 #include <linux/sizes.h>
+#include <linux/virtio_config.h>
 
 struct kvm_ext kvm_req_ext[] = {
 	{ DEFINE_KVM_EXT(KVM_CAP_ONE_REG) },
@@ -224,5 +225,14 @@ int kvm__arch_setup_firmware(struct kvm *kvm)
 
 u64 kvm__arch_get_virtio_host_features(struct kvm *kvm)
 {
-	return 0;
+	u64 features = 0;
+
+	/* CoVE VMs mandate VIRTIO_F_ACCESS_PLATFORM feature to force use of
+	 * SWIOTLB bounce buffers through DMA API. Without this device probe
+	 * will fail for CoVE VMs.
+	 */
+	if (kvm->cfg.arch.cove_vm)
+		features |= (1ULL << VIRTIO_F_ACCESS_PLATFORM);
+
+	return features;
 }
-- 
2.25.1


