From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 19 Apr 2023 15:23:50 -0700
Subject: [RFC kvmtool 10/10] riscv: cove: Don't emit interrupt_map for pci devices in fdt.
In-Reply-To: <20230419222350.3604274-1-atishp@rivosinc.com>
References: <20230419222350.3604274-1-atishp@rivosinc.com>
Message-ID: <20230419222350.3604274-11-atishp@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Rajnesh Kanwal <rkanwal@rivosinc.com>

CoVE VMs don't support pin based interrupts yet as APLIC isn't
supported.

Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
---
 riscv/fdt.c                  |  2 +-
 riscv/include/kvm/kvm-arch.h |  2 +-
 riscv/pci.c                  | 83 +++++++++++++++++++-----------------
 3 files changed, 46 insertions(+), 41 deletions(-)

diff --git a/riscv/fdt.c b/riscv/fdt.c
index a7d32b3..115ae17 100644
--- a/riscv/fdt.c
+++ b/riscv/fdt.c
@@ -232,7 +232,7 @@ static int setup_fdt(struct kvm *kvm)
 	}
 
 	/* PCI host controller */
-	pci__generate_fdt_nodes(fdt);
+	pci__generate_fdt_nodes(fdt, kvm);
 
 	_FDT(fdt_end_node(fdt));
 
diff --git a/riscv/include/kvm/kvm-arch.h b/riscv/include/kvm/kvm-arch.h
index 08ac54a..9f6967f 100644
--- a/riscv/include/kvm/kvm-arch.h
+++ b/riscv/include/kvm/kvm-arch.h
@@ -104,7 +104,7 @@ void aia__create(struct kvm *kvm);
 
 void plic__create(struct kvm *kvm);
 
-void pci__generate_fdt_nodes(void *fdt);
+void pci__generate_fdt_nodes(void *fdt, struct kvm *kvm);
 
 int riscv__add_irqfd(struct kvm *kvm, unsigned int gsi, int trigger_fd,
 		     int resample_fd);
diff --git a/riscv/pci.c b/riscv/pci.c
index 9760ca3..31ea286 100644
--- a/riscv/pci.c
+++ b/riscv/pci.c
@@ -17,7 +17,7 @@ struct of_interrupt_map_entry {
 	u32				irqchip_sense;
 } __attribute__((packed));
 
-void pci__generate_fdt_nodes(void *fdt)
+void pci__generate_fdt_nodes(void *fdt, struct kvm *kvm)
 {
 	struct device_header *dev_hdr;
 	struct of_interrupt_map_entry irq_map[OF_PCI_IRQ_MAP_MAX];
@@ -67,51 +67,56 @@ void pci__generate_fdt_nodes(void *fdt)
 	_FDT(fdt_property(fdt, "reg", &cfg_reg_prop, sizeof(cfg_reg_prop)));
 	_FDT(fdt_property(fdt, "ranges", ranges, sizeof(ranges)));
 
-	/* Generate the interrupt map ... */
-	dev_hdr = device__first_dev(DEVICE_BUS_PCI);
-	while (dev_hdr && nentries < ARRAY_SIZE(irq_map)) {
-		struct of_interrupt_map_entry *entry;
-		struct pci_device_header *pci_hdr = dev_hdr->data;
-		u8 dev_num = dev_hdr->dev_num;
-		u8 pin = pci_hdr->irq_pin;
-		u8 irq = pci_hdr->irq_line;
+	/* CoVE VMs do not support pin based interrupts yet as APLIC isn't
+	 * supported.
+	 */
+	if (!kvm->cfg.arch.cove_vm) {
+		/* Generate the interrupt map ... */
+		dev_hdr = device__first_dev(DEVICE_BUS_PCI);
+		while (dev_hdr && nentries < ARRAY_SIZE(irq_map)) {
+			struct of_interrupt_map_entry *entry;
+			struct pci_device_header *pci_hdr = dev_hdr->data;
+			u8 dev_num = dev_hdr->dev_num;
+			u8 pin = pci_hdr->irq_pin;
+			u8 irq = pci_hdr->irq_line;
 
-		entry = ((void *)irq_map) + (nsize * nentries);
-		*entry = (struct of_interrupt_map_entry) {
-			.pci_irq_mask = {
-				.pci_addr = {
-					.hi	= cpu_to_fdt32(of_pci_b_ddddd(dev_num)),
-					.mid	= 0,
-					.lo	= 0,
+			entry = ((void *)irq_map) + (nsize * nentries);
+			*entry = (struct of_interrupt_map_entry) {
+				.pci_irq_mask = {
+					.pci_addr = {
+						.hi	= cpu_to_fdt32(of_pci_b_ddddd(dev_num)),
+						.mid	= 0,
+						.lo	= 0,
+					},
+					.pci_pin	= cpu_to_fdt32(pin),
 				},
-				.pci_pin	= cpu_to_fdt32(pin),
-			},
-			.irqchip_phandle	= cpu_to_fdt32(riscv_irqchip_phandle),
-			.irqchip_line		= cpu_to_fdt32(irq),
-		};
+				.irqchip_phandle	= cpu_to_fdt32(riscv_irqchip_phandle),
+				.irqchip_line		= cpu_to_fdt32(irq),
+			};
 
-		if (riscv_irqchip_line_sensing)
-			entry->irqchip_sense = cpu_to_fdt32(IRQ_TYPE_LEVEL_HIGH);
+			if (riscv_irqchip_line_sensing)
+				entry->irqchip_sense = cpu_to_fdt32(IRQ_TYPE_LEVEL_HIGH);
 
-		nentries++;
-		dev_hdr = device__next_dev(dev_hdr);
-	}
+			nentries++;
+			dev_hdr = device__next_dev(dev_hdr);
+		}
 
-	_FDT(fdt_property(fdt, "interrupt-map", irq_map, nsize * nentries));
+		_FDT(fdt_property(fdt, "interrupt-map", irq_map, nsize * nentries));
 
-	/* ... and the corresponding mask. */
-	if (nentries) {
-		struct of_pci_irq_mask irq_mask = {
-			.pci_addr = {
-				.hi	= cpu_to_fdt32(of_pci_b_ddddd(-1)),
-				.mid	= 0,
-				.lo	= 0,
-			},
-			.pci_pin	= cpu_to_fdt32(7),
-		};
+		/* ... and the corresponding mask. */
+		if (nentries) {
+			struct of_pci_irq_mask irq_mask = {
+				.pci_addr = {
+					.hi	= cpu_to_fdt32(of_pci_b_ddddd(-1)),
+					.mid	= 0,
+					.lo	= 0,
+				},
+				.pci_pin	= cpu_to_fdt32(7),
+			};
 
-		_FDT(fdt_property(fdt, "interrupt-map-mask", &irq_mask,
-				  sizeof(irq_mask)));
+			_FDT(fdt_property(fdt, "interrupt-map-mask", &irq_mask,
+					  sizeof(irq_mask)));
+		}
 	}
 
 	/* Set MSI parent if available */
-- 
2.25.1


