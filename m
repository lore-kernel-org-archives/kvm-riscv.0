From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 19 Apr 2023 15:23:49 -0700
Subject: [RFC kvmtool 09/10] riscv: Don't emit MMIO devices for CoVE VM.
In-Reply-To: <20230419222350.3604274-1-atishp@rivosinc.com>
References: <20230419222350.3604274-1-atishp@rivosinc.com>
Message-ID: <20230419222350.3604274-10-atishp@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Rajnesh Kanwal <rkanwal@rivosinc.com>

The CoVE VMs do not support MMIO devices yet. Do not emit
MMIO device nodes for CoVE VMs.

Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
---
 riscv/fdt.c | 33 ++++++++++++++++++---------------
 1 file changed, 18 insertions(+), 15 deletions(-)

diff --git a/riscv/fdt.c b/riscv/fdt.c
index 07ec336..a7d32b3 100644
--- a/riscv/fdt.c
+++ b/riscv/fdt.c
@@ -210,22 +210,25 @@ static int setup_fdt(struct kvm *kvm)
 			       riscv_irqchip_phandle));
 	_FDT(fdt_property(fdt, "ranges", NULL, 0));
 
-	/* Virtio MMIO devices */
-	dev_hdr = device__first_dev(DEVICE_BUS_MMIO);
-	while (dev_hdr) {
-		generate_mmio_fdt_nodes = dev_hdr->data;
-		generate_mmio_fdt_nodes(fdt, dev_hdr,
-					riscv__generate_irq_prop);
-		dev_hdr = device__next_dev(dev_hdr);
-	}
+	/* CoVE VMs do not support MMIO devices yet */
+	if (!kvm->cfg.arch.cove_vm) {
+		/* Virtio MMIO devices */
+		dev_hdr = device__first_dev(DEVICE_BUS_MMIO);
+		while (dev_hdr) {
+			generate_mmio_fdt_nodes = dev_hdr->data;
+			generate_mmio_fdt_nodes(fdt, dev_hdr,
+						riscv__generate_irq_prop);
+			dev_hdr = device__next_dev(dev_hdr);
+		}
 
-	/* IOPORT devices */
-	dev_hdr = device__first_dev(DEVICE_BUS_IOPORT);
-	while (dev_hdr) {
-		generate_mmio_fdt_nodes = dev_hdr->data;
-		generate_mmio_fdt_nodes(fdt, dev_hdr,
-					riscv__generate_irq_prop);
-		dev_hdr = device__next_dev(dev_hdr);
+		/* IOPORT devices */
+		dev_hdr = device__first_dev(DEVICE_BUS_IOPORT);
+		while (dev_hdr) {
+			generate_mmio_fdt_nodes = dev_hdr->data;
+			generate_mmio_fdt_nodes(fdt, dev_hdr,
+						riscv__generate_irq_prop);
+			dev_hdr = device__next_dev(dev_hdr);
+		}
 	}
 
 	/* PCI host controller */
-- 
2.25.1


