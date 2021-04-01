From: Anup Patel <anup.patel@wdc.com>
Date: Thu,  1 Apr 2021 19:10:56 +0530
Subject: [PATCH v7 8/8] riscv: Generate PCI host DT node
In-Reply-To: <20210401134056.384038-1-anup.patel@wdc.com>
References: <20210401134056.384038-1-anup.patel@wdc.com>
Message-ID: <20210401134056.384038-9-anup.patel@wdc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patch extends FDT generation to generate PCI host DT node.

Of course, PCI host for Guest/VM is not useful at the moment
because it's mostly for PCI pass-through and we don't have
IOMMU and interrupt routing available for KVM RISC-V. In future,
we might be able to use PCI host for VirtIO PCI transport or
other software emulated PCI devices.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 Makefile                     |   1 +
 riscv/fdt.c                  |   3 +
 riscv/include/kvm/kvm-arch.h |   2 +
 riscv/pci.c                  | 109 +++++++++++++++++++++++++++++++++++
 4 files changed, 115 insertions(+)
 create mode 100644 riscv/pci.c

diff --git a/Makefile b/Makefile
index e4e1184..6920d7f 100644
--- a/Makefile
+++ b/Makefile
@@ -204,6 +204,7 @@ ifeq ($(ARCH),riscv)
 	OBJS		+= riscv/irq.o
 	OBJS		+= riscv/kvm.o
 	OBJS		+= riscv/kvm-cpu.o
+	OBJS		+= riscv/pci.o
 	OBJS		+= riscv/plic.o
 	ifeq ($(RISCV_XLEN),32)
 		CFLAGS	+= -mabi=ilp32d -march=rv32gc
diff --git a/riscv/fdt.c b/riscv/fdt.c
index 6527ef7..de15bfe 100644
--- a/riscv/fdt.c
+++ b/riscv/fdt.c
@@ -167,6 +167,9 @@ static int setup_fdt(struct kvm *kvm)
 		dev_hdr = device__next_dev(dev_hdr);
 	}
 
+	/* PCI host controller */
+	pci__generate_fdt_nodes(fdt);
+
 	_FDT(fdt_end_node(fdt));
 
 	if (fdt_stdout_path) {
diff --git a/riscv/include/kvm/kvm-arch.h b/riscv/include/kvm/kvm-arch.h
index 02825cd..d9a072e 100644
--- a/riscv/include/kvm/kvm-arch.h
+++ b/riscv/include/kvm/kvm-arch.h
@@ -80,4 +80,6 @@ void plic__generate_irq_prop(void *fdt, u8 irq, enum irq_type irq_type);
 
 void plic__irq_trig(struct kvm *kvm, int irq, int level, bool edge);
 
+void pci__generate_fdt_nodes(void *fdt);
+
 #endif /* KVM__KVM_ARCH_H */
diff --git a/riscv/pci.c b/riscv/pci.c
new file mode 100644
index 0000000..666a452
--- /dev/null
+++ b/riscv/pci.c
@@ -0,0 +1,109 @@
+#include "kvm/devices.h"
+#include "kvm/fdt.h"
+#include "kvm/kvm.h"
+#include "kvm/of_pci.h"
+#include "kvm/pci.h"
+#include "kvm/util.h"
+
+/*
+ * An entry in the interrupt-map table looks like:
+ * <pci unit address> <pci interrupt pin> <plic phandle> <plic interrupt>
+ */
+
+struct of_interrupt_map_entry {
+	struct of_pci_irq_mask		pci_irq_mask;
+	u32				plic_phandle;
+	u32				plic_irq;
+} __attribute__((packed));
+
+void pci__generate_fdt_nodes(void *fdt)
+{
+	struct device_header *dev_hdr;
+	struct of_interrupt_map_entry irq_map[OF_PCI_IRQ_MAP_MAX];
+	unsigned nentries = 0;
+	/* Bus range */
+	u32 bus_range[] = { cpu_to_fdt32(0), cpu_to_fdt32(1), };
+	/* Configuration Space */
+	u64 cfg_reg_prop[] = { cpu_to_fdt64(KVM_PCI_CFG_AREA),
+			       cpu_to_fdt64(RISCV_PCI_CFG_SIZE), };
+	/* Describe the memory ranges */
+	struct of_pci_ranges_entry ranges[] = {
+		{
+			.pci_addr = {
+				.hi	= cpu_to_fdt32(of_pci_b_ss(OF_PCI_SS_IO)),
+				.mid	= 0,
+				.lo	= 0,
+			},
+			.cpu_addr	= cpu_to_fdt64(KVM_IOPORT_AREA),
+			.length		= cpu_to_fdt64(RISCV_IOPORT_SIZE),
+		},
+		{
+			.pci_addr = {
+				.hi	= cpu_to_fdt32(of_pci_b_ss(OF_PCI_SS_M32)),
+				.mid	= cpu_to_fdt32(KVM_PCI_MMIO_AREA >> 32),
+				.lo	= cpu_to_fdt32(KVM_PCI_MMIO_AREA),
+			},
+			.cpu_addr	= cpu_to_fdt64(KVM_PCI_MMIO_AREA),
+			.length		= cpu_to_fdt64(RISCV_PCI_MMIO_SIZE),
+		},
+	};
+
+	/* Boilerplate PCI properties */
+	_FDT(fdt_begin_node(fdt, "pci"));
+	_FDT(fdt_property_string(fdt, "device_type", "pci"));
+	_FDT(fdt_property_cell(fdt, "#address-cells", 0x3));
+	_FDT(fdt_property_cell(fdt, "#size-cells", 0x2));
+	_FDT(fdt_property_cell(fdt, "#interrupt-cells", 0x1));
+	_FDT(fdt_property_string(fdt, "compatible", "pci-host-cam-generic"));
+	_FDT(fdt_property(fdt, "dma-coherent", NULL, 0));
+
+	_FDT(fdt_property(fdt, "bus-range", bus_range, sizeof(bus_range)));
+	_FDT(fdt_property(fdt, "reg", &cfg_reg_prop, sizeof(cfg_reg_prop)));
+	_FDT(fdt_property(fdt, "ranges", ranges, sizeof(ranges)));
+
+	/* Generate the interrupt map ... */
+	dev_hdr = device__first_dev(DEVICE_BUS_PCI);
+	while (dev_hdr && nentries < ARRAY_SIZE(irq_map)) {
+		struct of_interrupt_map_entry *entry = &irq_map[nentries];
+		struct pci_device_header *pci_hdr = dev_hdr->data;
+		u8 dev_num = dev_hdr->dev_num;
+		u8 pin = pci_hdr->irq_pin;
+		u8 irq = pci_hdr->irq_line;
+
+		*entry = (struct of_interrupt_map_entry) {
+			.pci_irq_mask = {
+				.pci_addr = {
+					.hi	= cpu_to_fdt32(of_pci_b_ddddd(dev_num)),
+					.mid	= 0,
+					.lo	= 0,
+				},
+				.pci_pin	= cpu_to_fdt32(pin),
+			},
+			.plic_phandle	= cpu_to_fdt32(PHANDLE_PLIC),
+			.plic_irq	= cpu_to_fdt32(irq),
+		};
+
+		nentries++;
+		dev_hdr = device__next_dev(dev_hdr);
+	}
+
+	_FDT(fdt_property(fdt, "interrupt-map", irq_map,
+			  sizeof(struct of_interrupt_map_entry) * nentries));
+
+	/* ... and the corresponding mask. */
+	if (nentries) {
+		struct of_pci_irq_mask irq_mask = {
+			.pci_addr = {
+				.hi	= cpu_to_fdt32(of_pci_b_ddddd(-1)),
+				.mid	= 0,
+				.lo	= 0,
+			},
+			.pci_pin	= cpu_to_fdt32(7),
+		};
+
+		_FDT(fdt_property(fdt, "interrupt-map-mask", &irq_mask,
+				  sizeof(irq_mask)));
+	}
+
+	_FDT(fdt_end_node(fdt));
+}
-- 
2.25.1


