From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 14 Nov 2024 17:18:56 +0100
Subject: [RFC PATCH 11/15] RISC-V: Define irqbypass vcpu_info
In-Reply-To: <20241114161845.502027-17-ajones@ventanamicro.com>
References: <20241114161845.502027-17-ajones@ventanamicro.com>
Message-ID: <20241114161845.502027-28-ajones@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The vcpu_info parameter to irq_set_vcpu_affinity() effectively
defines an arch specific IOMMU <=> hypervisor protocol. Provide
a definition for the RISCV IOMMU.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/irq.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/riscv/include/asm/irq.h b/arch/riscv/include/asm/irq.h
index 7b038f3b7cb0..8588667cbb5f 100644
--- a/arch/riscv/include/asm/irq.h
+++ b/arch/riscv/include/asm/irq.h
@@ -23,6 +23,15 @@ void riscv_set_intc_hwnode_fn(struct fwnode_handle *(*fn)(void));
 
 struct fwnode_handle *riscv_get_intc_hwnode(void);
 
+struct riscv_iommu_vcpu_info {
+	u64 msi_addr_pattern;
+	u64 msi_addr_mask;
+	u32 group_index_bits;
+	u32 group_index_shift;
+	u64 gpa;
+	u64 hpa;
+};
+
 #ifdef CONFIG_ACPI
 
 enum riscv_irqchip_type {
-- 
2.47.0


