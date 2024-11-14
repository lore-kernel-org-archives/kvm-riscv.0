From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 14 Nov 2024 17:18:59 +0100
Subject: [RFC PATCH 14/15] vfio: enable IOMMU_TYPE1 for RISC-V
In-Reply-To: <20241114161845.502027-17-ajones@ventanamicro.com>
References: <20241114161845.502027-17-ajones@ventanamicro.com>
Message-ID: <20241114161845.502027-31-ajones@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Tomasz Jeznach <tjeznach@rivosinc.com>

Enable VFIO support on RISC-V architecture.

Signed-off-by: Tomasz Jeznach <tjeznach@rivosinc.com>
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 drivers/vfio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/vfio/Kconfig b/drivers/vfio/Kconfig
index ceae52fd7586..ad62205b4e45 100644
--- a/drivers/vfio/Kconfig
+++ b/drivers/vfio/Kconfig
@@ -39,7 +39,7 @@ config VFIO_GROUP
 
 config VFIO_CONTAINER
 	bool "Support for the VFIO container /dev/vfio/vfio"
-	select VFIO_IOMMU_TYPE1 if MMU && (X86 || S390 || ARM || ARM64)
+	select VFIO_IOMMU_TYPE1 if MMU && (X86 || S390 || ARM || ARM64 || RISCV)
 	depends on VFIO_GROUP
 	default y
 	help
-- 
2.47.0


