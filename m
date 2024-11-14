From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 14 Nov 2024 17:18:48 +0100
Subject: [RFC PATCH 03/15] irqchip/riscv-imsic: Add support for DOMAIN_BUS_MSI_REMAP
In-Reply-To: <20241114161845.502027-17-ajones@ventanamicro.com>
References: <20241114161845.502027-17-ajones@ventanamicro.com>
Message-ID: <20241114161845.502027-20-ajones@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Unlike a child of an MSI NEXUS domain, a child of an MSI_REMAP domain
will not invoke init_dev_msi_info() with 'domain' equal to
'msi_parent_domain'. This is because the MSI_REMAP domain implements
init_dev_msi_info() with msi_parent_init_dev_msi_info(), which makes
'domain' point to the NEXUS (IMSIC) domain, while keeping
'msi_parent_domain' pointing to itself. The rest of the IMSIC
init_dev_msi_info() implementation works for MSI_REMAP domains,
though, so there's nothing to do to add support except accept the
token.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 drivers/irqchip/irq-riscv-imsic-platform.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/irqchip/irq-riscv-imsic-platform.c b/drivers/irqchip/irq-riscv-imsic-platform.c
index 5d7c30ad8855..6a7d7fefda6a 100644
--- a/drivers/irqchip/irq-riscv-imsic-platform.c
+++ b/drivers/irqchip/irq-riscv-imsic-platform.c
@@ -246,6 +246,8 @@ static bool imsic_init_dev_msi_info(struct device *dev,
 	case DOMAIN_BUS_NEXUS:
 		if (WARN_ON_ONCE(domain != real_parent))
 			return false;
+		fallthrough;
+	case DOMAIN_BUS_MSI_REMAP:
 #ifdef CONFIG_SMP
 		info->chip->irq_set_affinity = irq_chip_set_affinity_parent;
 #endif
-- 
2.47.0


