From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 14 Nov 2024 17:18:55 +0100
Subject: [RFC PATCH 10/15] RISC-V: KVM: Add irqbypass skeleton
In-Reply-To: <20241114161845.502027-17-ajones@ventanamicro.com>
References: <20241114161845.502027-17-ajones@ventanamicro.com>
Message-ID: <20241114161845.502027-27-ajones@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add all the functions needed to wire up irqbypass support.
kvm_arch_update_irqfd_routing() is left unimplemented, so return
false from kvm_arch_has_irq_bypass().

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_host.h |  3 ++
 arch/riscv/kvm/Kconfig            |  1 +
 arch/riscv/kvm/aia_imsic.c        |  6 ++++
 arch/riscv/kvm/vm.c               | 60 +++++++++++++++++++++++++++++++
 4 files changed, 70 insertions(+)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 35eab6e0f4ae..fef7422939f6 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -114,6 +114,9 @@ struct kvm_arch {
 
 	/* AIA Guest/VM context */
 	struct kvm_aia aia;
+
+#define __KVM_HAVE_ARCH_ASSIGNED_DEVICE
+	atomic_t assigned_device_count;
 };
 
 struct kvm_cpu_trap {
diff --git a/arch/riscv/kvm/Kconfig b/arch/riscv/kvm/Kconfig
index 333d95da8ebe..9a4feb1e671d 100644
--- a/arch/riscv/kvm/Kconfig
+++ b/arch/riscv/kvm/Kconfig
@@ -21,6 +21,7 @@ config KVM
 	tristate "Kernel-based Virtual Machine (KVM) support (EXPERIMENTAL)"
 	depends on RISCV_SBI && MMU
 	select HAVE_KVM_IRQCHIP
+	select HAVE_KVM_IRQ_BYPASS
 	select HAVE_KVM_IRQ_ROUTING
 	select HAVE_KVM_MSI
 	select HAVE_KVM_VCPU_ASYNC_IOCTL
diff --git a/arch/riscv/kvm/aia_imsic.c b/arch/riscv/kvm/aia_imsic.c
index a8085cd8215e..64b1f3713dd5 100644
--- a/arch/riscv/kvm/aia_imsic.c
+++ b/arch/riscv/kvm/aia_imsic.c
@@ -727,6 +727,12 @@ void kvm_riscv_vcpu_aia_imsic_release(struct kvm_vcpu *vcpu)
 	kvm_riscv_aia_free_hgei(old_vsfile_cpu, old_vsfile_hgei);
 }
 
+int kvm_arch_update_irqfd_routing(struct kvm *kvm, unsigned int host_irq,
+				  uint32_t guest_irq, bool set)
+{
+	return -ENXIO;
+}
+
 int kvm_riscv_vcpu_aia_imsic_update(struct kvm_vcpu *vcpu)
 {
 	unsigned long flags;
diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
index 7396b8654f45..9c5837518c1a 100644
--- a/arch/riscv/kvm/vm.c
+++ b/arch/riscv/kvm/vm.c
@@ -11,6 +11,9 @@
 #include <linux/module.h>
 #include <linux/uaccess.h>
 #include <linux/kvm_host.h>
+#include <linux/kvm_irqfd.h>
+
+#include <asm/kvm_aia.h>
 
 const struct _kvm_stats_desc kvm_vm_stats_desc[] = {
 	KVM_GENERIC_VM_STATS()
@@ -55,6 +58,63 @@ void kvm_arch_destroy_vm(struct kvm *kvm)
 	kvm_riscv_aia_destroy_vm(kvm);
 }
 
+void kvm_arch_start_assignment(struct kvm *kvm)
+{
+	atomic_inc(&kvm->arch.assigned_device_count);
+}
+EXPORT_SYMBOL_GPL(kvm_arch_start_assignment);
+
+void kvm_arch_end_assignment(struct kvm *kvm)
+{
+	atomic_dec(&kvm->arch.assigned_device_count);
+}
+EXPORT_SYMBOL_GPL(kvm_arch_end_assignment);
+
+bool noinstr kvm_arch_has_assigned_device(struct kvm *kvm)
+{
+	return arch_atomic_read(&kvm->arch.assigned_device_count);
+}
+EXPORT_SYMBOL_GPL(kvm_arch_has_assigned_device);
+
+bool kvm_arch_has_irq_bypass(void)
+{
+	return false;
+}
+
+int kvm_arch_irq_bypass_add_producer(struct irq_bypass_consumer *cons,
+				     struct irq_bypass_producer *prod)
+{
+	struct kvm_kernel_irqfd *irqfd =
+		container_of(cons, struct kvm_kernel_irqfd, consumer);
+	int ret;
+
+	irqfd->producer = prod;
+	kvm_arch_start_assignment(irqfd->kvm);
+	ret = kvm_arch_update_irqfd_routing(irqfd->kvm, prod->irq, irqfd->gsi, true);
+	if (ret)
+		kvm_arch_end_assignment(irqfd->kvm);
+
+	return ret;
+}
+
+void kvm_arch_irq_bypass_del_producer(struct irq_bypass_consumer *cons,
+				      struct irq_bypass_producer *prod)
+{
+	struct kvm_kernel_irqfd *irqfd =
+		container_of(cons, struct kvm_kernel_irqfd, consumer);
+	int ret;
+
+	WARN_ON(irqfd->producer != prod);
+	irqfd->producer = NULL;
+
+	ret = kvm_arch_update_irqfd_routing(irqfd->kvm, prod->irq, irqfd->gsi, false);
+	if (ret)
+		pr_info("irq bypass consumer (token %p) unregistration fails: %d\n",
+			irqfd->consumer.token, ret);
+
+	kvm_arch_end_assignment(irqfd->kvm);
+}
+
 int kvm_vm_ioctl_irq_line(struct kvm *kvm, struct kvm_irq_level *irql,
 			  bool line_status)
 {
-- 
2.47.0


