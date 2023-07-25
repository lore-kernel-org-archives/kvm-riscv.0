From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 25 Jul 2023 20:54:28 +0530
Subject: [kvmtool PATCH 4/6] riscv: Add IRQFD support for in-kernel AIA irqchip
In-Reply-To: <20230725152430.3351564-1-apatel@ventanamicro.com>
References: <20230725152430.3351564-1-apatel@ventanamicro.com>
Message-ID: <20230725152430.3351564-5-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

To use irqfd with in-kernel AIA irqchip, we add custom
irq__add_irqfd and irq__del_irqfd functions. This allows
us to defer actual KVM_IRQFD ioctl() until AIA irqchip
is initialized by KVMTOOL.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 riscv/include/kvm/kvm-arch.h | 11 ++++++
 riscv/irq.c                  | 73 ++++++++++++++++++++++++++++++++++++
 2 files changed, 84 insertions(+)

diff --git a/riscv/include/kvm/kvm-arch.h b/riscv/include/kvm/kvm-arch.h
index cd37fc6..1a8af6a 100644
--- a/riscv/include/kvm/kvm-arch.h
+++ b/riscv/include/kvm/kvm-arch.h
@@ -98,11 +98,22 @@ extern void (*riscv_irqchip_generate_fdt_node)(void *fdt, struct kvm *kvm);
 extern u32 riscv_irqchip_phandle;
 extern u32 riscv_irqchip_msi_phandle;
 extern bool riscv_irqchip_line_sensing;
+extern bool riscv_irqchip_irqfd_ready;
 
 void plic__create(struct kvm *kvm);
 
 void pci__generate_fdt_nodes(void *fdt);
 
+int riscv__add_irqfd(struct kvm *kvm, unsigned int gsi, int trigger_fd,
+		     int resample_fd);
+
+void riscv__del_irqfd(struct kvm *kvm, unsigned int gsi, int trigger_fd);
+
+#define irq__add_irqfd riscv__add_irqfd
+#define irq__del_irqfd riscv__del_irqfd
+
+int riscv__setup_irqfd_lines(struct kvm *kvm);
+
 void riscv__generate_irq_prop(void *fdt, u8 irq, enum irq_type irq_type);
 
 void riscv__irqchip_create(struct kvm *kvm);
diff --git a/riscv/irq.c b/riscv/irq.c
index b608a2f..e6c0939 100644
--- a/riscv/irq.c
+++ b/riscv/irq.c
@@ -12,6 +12,7 @@ void (*riscv_irqchip_generate_fdt_node)(void *fdt, struct kvm *kvm) = NULL;
 u32 riscv_irqchip_phandle = PHANDLE_RESERVED;
 u32 riscv_irqchip_msi_phandle = PHANDLE_RESERVED;
 bool riscv_irqchip_line_sensing = false;
+bool riscv_irqchip_irqfd_ready = false;
 
 void kvm__irq_line(struct kvm *kvm, int irq, int level)
 {
@@ -46,6 +47,78 @@ void kvm__irq_trigger(struct kvm *kvm, int irq)
 	}
 }
 
+struct riscv_irqfd_line {
+	unsigned int		gsi;
+	int			trigger_fd;
+	int			resample_fd;
+	struct list_head	list;
+};
+
+static LIST_HEAD(irqfd_lines);
+
+int riscv__add_irqfd(struct kvm *kvm, unsigned int gsi, int trigger_fd,
+		     int resample_fd)
+{
+	struct riscv_irqfd_line *line;
+
+	if (riscv_irqchip_irqfd_ready)
+		return irq__common_add_irqfd(kvm, gsi, trigger_fd,
+					     resample_fd);
+
+	/* Postpone the routing setup until we have a distributor */
+	line = malloc(sizeof(*line));
+	if (!line)
+		return -ENOMEM;
+
+	*line = (struct riscv_irqfd_line) {
+		.gsi		= gsi,
+		.trigger_fd	= trigger_fd,
+		.resample_fd	= resample_fd,
+	};
+	list_add(&line->list, &irqfd_lines);
+
+	return 0;
+}
+
+void riscv__del_irqfd(struct kvm *kvm, unsigned int gsi, int trigger_fd)
+{
+	struct riscv_irqfd_line *line;
+
+	if (riscv_irqchip_irqfd_ready) {
+		irq__common_del_irqfd(kvm, gsi, trigger_fd);
+		return;
+	}
+
+	list_for_each_entry(line, &irqfd_lines, list) {
+		if (line->gsi != gsi)
+			continue;
+
+		list_del(&line->list);
+		free(line);
+		break;
+	}
+}
+
+int riscv__setup_irqfd_lines(struct kvm *kvm)
+{
+	int ret;
+	struct riscv_irqfd_line *line, *tmp;
+
+	list_for_each_entry_safe(line, tmp, &irqfd_lines, list) {
+		ret = irq__common_add_irqfd(kvm, line->gsi, line->trigger_fd,
+					    line->resample_fd);
+		if (ret < 0) {
+			pr_err("Failed to register IRQFD");
+			return ret;
+		}
+
+		list_del(&line->list);
+		free(line);
+	}
+
+	return 0;
+}
+
 void riscv__generate_irq_prop(void *fdt, u8 irq, enum irq_type irq_type)
 {
 	u32 prop[2], size;
-- 
2.34.1


