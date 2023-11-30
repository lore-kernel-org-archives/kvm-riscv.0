From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 30 Nov 2023 09:46:33 +0530
Subject: [kvmtool PATCH] riscv: Fix guest poweroff when using PLIC emulation
Message-ID: <20231130041633.78725-1-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Recently due to commit 74af1456dfa0, the virtio device emulation
in KVMTOOL now calls irq__update_msix_route() upon guest poweroff
which results in KVMTOOL crash when Guest uses PLIC emulation in
user space. This is because irq__update_msix_route() expects the
irq_routing table to be available but the KVMTOOL PLIC emulation
does not populate any irq_routing entries.

Fixes: 74af1456dfa0 ("virtio: Cancel and join threads when exiting devices devices")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 riscv/plic.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/riscv/plic.c b/riscv/plic.c
index ab7c574..6bd13ac 100644
--- a/riscv/plic.c
+++ b/riscv/plic.c
@@ -95,6 +95,8 @@
 
 #define REG_SIZE		0x1000000
 
+#define IRQCHIP_PLIC_NR		0
+
 struct plic_state;
 
 struct plic_context {
@@ -500,6 +502,33 @@ static void plic__generate_fdt_node(void *fdt, struct kvm *kvm)
 	free(irq_cells);
 }
 
+static int plic__irq_routing_init(struct kvm *kvm)
+{
+	int r;
+
+	/*
+	 * This describes the default routing that the kernel uses without
+	 * any routing explicitly set up via KVM_SET_GSI_ROUTING. So we
+	 * don't need to commit these setting right now. The first actual
+	 * user (MSI routing) will engage these mappings then.
+	 */
+	for (next_gsi = 0; next_gsi < MAX_DEVICES; next_gsi++) {
+		r = irq__allocate_routing_entry();
+		if (r)
+			return r;
+
+		irq_routing->entries[irq_routing->nr++] =
+			(struct kvm_irq_routing_entry) {
+				.gsi = next_gsi,
+				.type = KVM_IRQ_ROUTING_IRQCHIP,
+				.u.irqchip.irqchip = IRQCHIP_PLIC_NR,
+				.u.irqchip.pin = next_gsi,
+		};
+	}
+
+	return 0;
+}
+
 static int plic__init(struct kvm *kvm)
 {
 	u32 i;
@@ -535,6 +564,9 @@ static int plic__init(struct kvm *kvm)
 	if (ret)
 		return ret;
 
+	/* Setup default IRQ routing */
+	plic__irq_routing_init(kvm);
+
 	plic.ready = true;
 
 	return 0;
-- 
2.34.1


