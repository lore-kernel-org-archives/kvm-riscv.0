From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 14 Nov 2024 17:18:58 +0100
Subject: [RFC PATCH 13/15] RISC-V: KVM: Add guest file irqbypass support
In-Reply-To: <20241114161845.502027-17-ajones@ventanamicro.com>
References: <20241114161845.502027-17-ajones@ventanamicro.com>
Message-ID: <20241114161845.502027-30-ajones@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Implement kvm_arch_update_irqfd_routing() which makes
irq_set_vcpu_affinity() calls whenever the assigned device updates
its target addresses and whenever the hypervisor has migrated a
VCPU to another CPU (which requires changing the guest interrupt
file).

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kvm/aia_imsic.c | 132 ++++++++++++++++++++++++++++++++++++-
 arch/riscv/kvm/vm.c        |   2 +-
 2 files changed, 130 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kvm/aia_imsic.c b/arch/riscv/kvm/aia_imsic.c
index 64b1f3713dd5..6a7c23e25f79 100644
--- a/arch/riscv/kvm/aia_imsic.c
+++ b/arch/riscv/kvm/aia_imsic.c
@@ -11,11 +11,13 @@
 #include <linux/bitmap.h>
 #include <linux/irqchip/riscv-imsic.h>
 #include <linux/kvm_host.h>
+#include <linux/kvm_irqfd.h>
 #include <linux/math.h>
 #include <linux/spinlock.h>
 #include <linux/swab.h>
 #include <kvm/iodev.h>
 #include <asm/csr.h>
+#include <asm/irq.h>
 
 #define IMSIC_MAX_EIX	(IMSIC_MAX_ID / BITS_PER_TYPE(u64))
 
@@ -676,6 +678,14 @@ static void imsic_swfile_update(struct kvm_vcpu *vcpu,
 	imsic_swfile_extirq_update(vcpu);
 }
 
+static u64 kvm_riscv_aia_msi_addr_mask(struct kvm_aia *aia)
+{
+	u64 group_mask = BIT(aia->nr_group_bits) - 1;
+
+	return (group_mask << (aia->nr_group_shift - IMSIC_MMIO_PAGE_SHIFT)) |
+	       (BIT(aia->nr_hart_bits + aia->nr_guest_bits) - 1);
+}
+
 void kvm_riscv_vcpu_aia_imsic_release(struct kvm_vcpu *vcpu)
 {
 	unsigned long flags;
@@ -730,7 +740,120 @@ void kvm_riscv_vcpu_aia_imsic_release(struct kvm_vcpu *vcpu)
 int kvm_arch_update_irqfd_routing(struct kvm *kvm, unsigned int host_irq,
 				  uint32_t guest_irq, bool set)
 {
-	return -ENXIO;
+	struct irq_data *irqdata = irq_get_irq_data(host_irq);
+	struct kvm_irq_routing_table *irq_rt;
+	struct kvm_vcpu *vcpu;
+	unsigned long tmp, flags;
+	int idx, ret = -ENXIO;
+
+	if (!set)
+		return irq_set_vcpu_affinity(host_irq, NULL);
+
+	idx = srcu_read_lock(&kvm->irq_srcu);
+	irq_rt = srcu_dereference(kvm->irq_routing, &kvm->irq_srcu);
+	if (guest_irq >= irq_rt->nr_rt_entries ||
+	    hlist_empty(&irq_rt->map[guest_irq])) {
+		pr_warn_once("no route for guest_irq %u/%u (broken user space?)\n",
+			     guest_irq, irq_rt->nr_rt_entries);
+		goto out;
+	}
+
+	kvm_for_each_vcpu(tmp, vcpu, kvm) {
+		struct imsic *imsic = vcpu->arch.aia_context.imsic_state;
+		gpa_t ippn = vcpu->arch.aia_context.imsic_addr >> IMSIC_MMIO_PAGE_SHIFT;
+		struct kvm_aia *aia = &kvm->arch.aia;
+		struct kvm_kernel_irq_routing_entry *e;
+
+		hlist_for_each_entry(e, &irq_rt->map[guest_irq], link) {
+			struct msi_msg msg[2] = {
+			{
+				.address_hi = e->msi.address_hi,
+				.address_lo = e->msi.address_lo,
+				.data = e->msi.data,
+			},
+			};
+			struct riscv_iommu_vcpu_info vcpu_info = {
+				.msi_addr_mask = kvm_riscv_aia_msi_addr_mask(aia),
+				.group_index_bits = aia->nr_group_bits,
+				.group_index_shift = aia->nr_group_shift,
+			};
+			gpa_t target, tppn;
+
+			if (e->type != KVM_IRQ_ROUTING_MSI)
+				continue;
+
+			target = ((gpa_t)e->msi.address_hi << 32) | e->msi.address_lo;
+			tppn = target >> IMSIC_MMIO_PAGE_SHIFT;
+
+			WARN_ON(target & (IMSIC_MMIO_PAGE_SZ - 1));
+
+			if (ippn != tppn)
+				continue;
+
+			vcpu_info.msi_addr_pattern = tppn & ~vcpu_info.msi_addr_mask;
+			vcpu_info.gpa = target;
+
+			read_lock_irqsave(&imsic->vsfile_lock, flags);
+
+			if (WARN_ON_ONCE(imsic->vsfile_cpu < 0)) {
+				read_unlock_irqrestore(&imsic->vsfile_lock, flags);
+				goto out;
+			}
+
+			vcpu_info.hpa = imsic->vsfile_pa;
+
+			ret = irq_set_vcpu_affinity(host_irq, &vcpu_info);
+			if (ret) {
+				read_unlock_irqrestore(&imsic->vsfile_lock, flags);
+				goto out;
+			}
+
+			irq_data_get_irq_chip(irqdata)->irq_write_msi_msg(irqdata, msg);
+
+			read_unlock_irqrestore(&imsic->vsfile_lock, flags);
+		}
+	}
+
+	ret = 0;
+out:
+	srcu_read_unlock(&kvm->irq_srcu, idx);
+	return ret;
+}
+
+static int kvm_riscv_vcpu_irq_update(struct kvm_vcpu *vcpu)
+{
+	struct kvm *kvm = vcpu->kvm;
+	struct imsic *imsic = vcpu->arch.aia_context.imsic_state;
+	struct kvm_aia *aia = &kvm->arch.aia;
+	u64 mask = kvm_riscv_aia_msi_addr_mask(aia);
+	u64 target = vcpu->arch.aia_context.imsic_addr;
+	struct riscv_iommu_vcpu_info vcpu_info = {
+		.msi_addr_pattern = (target >> IMSIC_MMIO_PAGE_SHIFT) & ~mask,
+		.msi_addr_mask = mask,
+		.group_index_bits = aia->nr_group_bits,
+		.group_index_shift = aia->nr_group_shift,
+		.gpa = target,
+		.hpa = imsic->vsfile_pa,
+	};
+	struct kvm_kernel_irqfd *irqfd;
+	int host_irq, ret;
+
+	spin_lock_irq(&kvm->irqfds.lock);
+
+	list_for_each_entry(irqfd, &kvm->irqfds.items, list) {
+		if (!irqfd->producer)
+			continue;
+		host_irq = irqfd->producer->irq;
+		ret = irq_set_vcpu_affinity(host_irq, &vcpu_info);
+		if (ret) {
+			spin_unlock_irq(&kvm->irqfds.lock);
+			return ret;
+		}
+	}
+
+	spin_unlock_irq(&kvm->irqfds.lock);
+
+	return 0;
 }
 
 int kvm_riscv_vcpu_aia_imsic_update(struct kvm_vcpu *vcpu)
@@ -797,14 +920,17 @@ int kvm_riscv_vcpu_aia_imsic_update(struct kvm_vcpu *vcpu)
 	if (ret)
 		goto fail_free_vsfile_hgei;
 
-	/* TODO: Update the IOMMU mapping ??? */
-
 	/* Update new IMSIC VS-file details in IMSIC context */
 	write_lock_irqsave(&imsic->vsfile_lock, flags);
+
 	imsic->vsfile_hgei = new_vsfile_hgei;
 	imsic->vsfile_cpu = vcpu->cpu;
 	imsic->vsfile_va = new_vsfile_va;
 	imsic->vsfile_pa = new_vsfile_pa;
+
+	/* Update the IOMMU mapping */
+	kvm_riscv_vcpu_irq_update(vcpu);
+
 	write_unlock_irqrestore(&imsic->vsfile_lock, flags);
 
 	/*
diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
index 9c5837518c1a..5f697d9a37da 100644
--- a/arch/riscv/kvm/vm.c
+++ b/arch/riscv/kvm/vm.c
@@ -78,7 +78,7 @@ EXPORT_SYMBOL_GPL(kvm_arch_has_assigned_device);
 
 bool kvm_arch_has_irq_bypass(void)
 {
-	return false;
+	return true;
 }
 
 int kvm_arch_irq_bypass_add_producer(struct irq_bypass_consumer *cons,
-- 
2.47.0


