From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 17 May 2023 16:21:30 +0530
Subject: [PATCH 05/10] RISC-V: KVM: Skeletal in-kernel AIA irqchip support
In-Reply-To: <20230517105135.1871868-1-apatel@ventanamicro.com>
References: <20230517105135.1871868-1-apatel@ventanamicro.com>
Message-ID: <20230517105135.1871868-6-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

To incrementally implement in-kernel AIA irqchip support, we first
add minimal skeletal support which only compiles but does not provide
any functionality.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_aia.h  |  20 ++++++
 arch/riscv/include/asm/kvm_host.h |   4 ++
 arch/riscv/include/uapi/asm/kvm.h |   4 ++
 arch/riscv/kvm/Kconfig            |   4 ++
 arch/riscv/kvm/aia.c              |   8 +++
 arch/riscv/kvm/vm.c               | 115 ++++++++++++++++++++++++++++++
 6 files changed, 155 insertions(+)

diff --git a/arch/riscv/include/asm/kvm_aia.h b/arch/riscv/include/asm/kvm_aia.h
index 0938e0cadf80..3bc0a0e47a15 100644
--- a/arch/riscv/include/asm/kvm_aia.h
+++ b/arch/riscv/include/asm/kvm_aia.h
@@ -45,6 +45,7 @@ struct kvm_vcpu_aia {
 #define irqchip_in_kernel(k)		((k)->arch.aia.in_kernel)
 
 extern unsigned int kvm_riscv_aia_nr_hgei;
+extern unsigned int kvm_riscv_aia_max_ids;
 DECLARE_STATIC_KEY_FALSE(kvm_riscv_aia_available);
 #define kvm_riscv_aia_available() \
 	static_branch_unlikely(&kvm_riscv_aia_available)
@@ -116,6 +117,25 @@ static inline void kvm_riscv_vcpu_aia_deinit(struct kvm_vcpu *vcpu)
 {
 }
 
+static inline int kvm_riscv_aia_inject_msi_by_id(struct kvm *kvm,
+						 u32 hart_index,
+						 u32 guest_index, u32 iid)
+{
+	return 0;
+}
+
+static inline int kvm_riscv_aia_inject_msi(struct kvm *kvm,
+					   struct kvm_msi *msi)
+{
+	return 0;
+}
+
+static inline int kvm_riscv_aia_inject_irq(struct kvm *kvm,
+					   unsigned int irq, bool level)
+{
+	return 0;
+}
+
 static inline void kvm_riscv_aia_init_vm(struct kvm *kvm)
 {
 }
diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index ee0acccb1d3b..871432586a63 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -27,6 +27,8 @@
 
 #define KVM_VCPU_MAX_FEATURES		0
 
+#define KVM_IRQCHIP_NUM_PINS		1024
+
 #define KVM_REQ_SLEEP \
 	KVM_ARCH_REQ_FLAGS(0, KVM_REQUEST_WAIT | KVM_REQUEST_NO_WAKEUP)
 #define KVM_REQ_VCPU_RESET		KVM_ARCH_REQ(1)
@@ -318,6 +320,8 @@ int kvm_riscv_gstage_vmid_init(struct kvm *kvm);
 bool kvm_riscv_gstage_vmid_ver_changed(struct kvm_vmid *vmid);
 void kvm_riscv_gstage_vmid_update(struct kvm_vcpu *vcpu);
 
+int kvm_riscv_setup_default_irq_routing(struct kvm *kvm, u32 lines);
+
 void __kvm_riscv_unpriv_trap(void);
 
 unsigned long kvm_riscv_vcpu_unpriv_read(struct kvm_vcpu *vcpu,
diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index f92790c9481a..332d4a274891 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -15,6 +15,7 @@
 #include <asm/bitsperlong.h>
 #include <asm/ptrace.h>
 
+#define __KVM_HAVE_IRQ_LINE
 #define __KVM_HAVE_READONLY_MEM
 
 #define KVM_COALESCED_MMIO_PAGE_OFFSET 1
@@ -203,6 +204,9 @@ enum KVM_RISCV_SBI_EXT_ID {
 #define KVM_REG_RISCV_SBI_MULTI_REG_LAST	\
 		KVM_REG_RISCV_SBI_MULTI_REG(KVM_RISCV_SBI_EXT_MAX - 1)
 
+/* One single KVM irqchip, ie. the AIA */
+#define KVM_NR_IRQCHIPS			1
+
 #endif
 
 #endif /* __LINUX_KVM_RISCV_H */
diff --git a/arch/riscv/kvm/Kconfig b/arch/riscv/kvm/Kconfig
index 28891e583259..dfc237d7875b 100644
--- a/arch/riscv/kvm/Kconfig
+++ b/arch/riscv/kvm/Kconfig
@@ -21,6 +21,10 @@ config KVM
 	tristate "Kernel-based Virtual Machine (KVM) support (EXPERIMENTAL)"
 	depends on RISCV_SBI && MMU
 	select HAVE_KVM_EVENTFD
+	select HAVE_KVM_IRQCHIP
+	select HAVE_KVM_IRQFD
+	select HAVE_KVM_IRQ_ROUTING
+	select HAVE_KVM_MSI
 	select HAVE_KVM_VCPU_ASYNC_IOCTL
 	select KVM_GENERIC_DIRTYLOG_READ_PROTECT
 	select KVM_GENERIC_HARDWARE_ENABLING
diff --git a/arch/riscv/kvm/aia.c b/arch/riscv/kvm/aia.c
index 3f97575707eb..18c442c15ff2 100644
--- a/arch/riscv/kvm/aia.c
+++ b/arch/riscv/kvm/aia.c
@@ -26,6 +26,7 @@ static DEFINE_PER_CPU(struct aia_hgei_control, aia_hgei);
 static int hgei_parent_irq;
 
 unsigned int kvm_riscv_aia_nr_hgei;
+unsigned int kvm_riscv_aia_max_ids;
 DEFINE_STATIC_KEY_FALSE(kvm_riscv_aia_available);
 
 static int aia_find_hgei(struct kvm_vcpu *owner)
@@ -618,6 +619,13 @@ int kvm_riscv_aia_init(void)
 	 */
 	kvm_riscv_aia_nr_hgei = 0;
 
+	/*
+	 * Find number of guest MSI IDs
+	 *
+	 * TODO: To be updated later by AIA IMSIC HW guest file support
+	 */
+	kvm_riscv_aia_max_ids = IMSIC_MAX_ID;
+
 	/* Initialize guest external interrupt line management */
 	rc = aia_hgei_init();
 	if (rc)
diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
index 6ef15f78e80f..d2349326b2ce 100644
--- a/arch/riscv/kvm/vm.c
+++ b/arch/riscv/kvm/vm.c
@@ -55,6 +55,121 @@ void kvm_arch_destroy_vm(struct kvm *kvm)
 	kvm_riscv_aia_destroy_vm(kvm);
 }
 
+int kvm_vm_ioctl_irq_line(struct kvm *kvm, struct kvm_irq_level *irql,
+			  bool line_status)
+{
+	if (!irqchip_in_kernel(kvm))
+		return -ENXIO;
+
+	return kvm_riscv_aia_inject_irq(kvm, irql->irq, irql->level);
+}
+
+int kvm_set_msi(struct kvm_kernel_irq_routing_entry *e,
+		struct kvm *kvm, int irq_source_id,
+		int level, bool line_status)
+{
+	struct kvm_msi msi;
+
+	if (!level)
+		return -1;
+
+	msi.address_lo = e->msi.address_lo;
+	msi.address_hi = e->msi.address_hi;
+	msi.data = e->msi.data;
+	msi.flags = e->msi.flags;
+	msi.devid = e->msi.devid;
+
+	return kvm_riscv_aia_inject_msi(kvm, &msi);
+}
+
+static int kvm_riscv_set_irq(struct kvm_kernel_irq_routing_entry *e,
+			     struct kvm *kvm, int irq_source_id,
+			     int level, bool line_status)
+{
+	return kvm_riscv_aia_inject_irq(kvm, e->irqchip.pin, level);
+}
+
+int kvm_riscv_setup_default_irq_routing(struct kvm *kvm, u32 lines)
+{
+	struct kvm_irq_routing_entry *ents;
+	int i, rc;
+
+	ents = kcalloc(lines, sizeof(*ents), GFP_KERNEL);
+	if (!ents)
+		return -ENOMEM;
+
+	for (i = 0; i < lines; i++) {
+		ents[i].gsi = i;
+		ents[i].type = KVM_IRQ_ROUTING_IRQCHIP;
+		ents[i].u.irqchip.irqchip = 0;
+		ents[i].u.irqchip.pin = i;
+	}
+	rc = kvm_set_irq_routing(kvm, ents, lines, 0);
+	kfree(ents);
+
+	return rc;
+}
+
+bool kvm_arch_can_set_irq_routing(struct kvm *kvm)
+{
+	return irqchip_in_kernel(kvm);
+}
+
+int kvm_set_routing_entry(struct kvm *kvm,
+			  struct kvm_kernel_irq_routing_entry *e,
+			  const struct kvm_irq_routing_entry *ue)
+{
+	int r = -EINVAL;
+
+	switch (ue->type) {
+	case KVM_IRQ_ROUTING_IRQCHIP:
+		e->set = kvm_riscv_set_irq;
+		e->irqchip.irqchip = ue->u.irqchip.irqchip;
+		e->irqchip.pin = ue->u.irqchip.pin;
+		if ((e->irqchip.pin >= KVM_IRQCHIP_NUM_PINS) ||
+		    (e->irqchip.irqchip >= KVM_NR_IRQCHIPS))
+			goto out;
+		break;
+	case KVM_IRQ_ROUTING_MSI:
+		e->set = kvm_set_msi;
+		e->msi.address_lo = ue->u.msi.address_lo;
+		e->msi.address_hi = ue->u.msi.address_hi;
+		e->msi.data = ue->u.msi.data;
+		e->msi.flags = ue->flags;
+		e->msi.devid = ue->u.msi.devid;
+		break;
+	default:
+		goto out;
+	}
+	r = 0;
+out:
+	return r;
+}
+
+int kvm_arch_set_irq_inatomic(struct kvm_kernel_irq_routing_entry *e,
+			      struct kvm *kvm, int irq_source_id, int level,
+			      bool line_status)
+{
+	if (!level)
+		return -EWOULDBLOCK;
+
+	switch (e->type) {
+	case KVM_IRQ_ROUTING_MSI:
+		return kvm_set_msi(e, kvm, irq_source_id, level, line_status);
+
+	case KVM_IRQ_ROUTING_IRQCHIP:
+		return kvm_riscv_set_irq(e, kvm, irq_source_id,
+					 level, line_status);
+	}
+
+	return -EWOULDBLOCK;
+}
+
+bool kvm_arch_irqchip_in_kernel(struct kvm *kvm)
+{
+	return irqchip_in_kernel(kvm);
+}
+
 int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 {
 	int r;
-- 
2.34.1


