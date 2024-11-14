From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 14 Nov 2024 17:19:00 +0100
Subject: [RFC PATCH 15/15] RISC-V: defconfig: Add VFIO modules
In-Reply-To: <20241114161845.502027-17-ajones@ventanamicro.com>
References: <20241114161845.502027-17-ajones@ventanamicro.com>
Message-ID: <20241114161845.502027-32-ajones@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add the VFIO modules to the defconfig to complement KVM now
that there is IOMMU support.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index b4a37345703e..10fc9d84a28c 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -242,6 +242,8 @@ CONFIG_RTC_DRV_SUN6I=y
 CONFIG_DMADEVICES=y
 CONFIG_DMA_SUN6I=m
 CONFIG_DW_AXI_DMAC=y
+CONFIG_VFIO=m
+CONFIG_VFIO_PCI=m
 CONFIG_VIRTIO_PCI=y
 CONFIG_VIRTIO_BALLOON=y
 CONFIG_VIRTIO_INPUT=y
-- 
2.47.0


