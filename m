From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 17 May 2023 16:21:35 +0530
Subject: [PATCH 10/10] RISC-V: KVM: Expose IMSIC registers as attributes of AIA irqchip
In-Reply-To: <20230517105135.1871868-1-apatel@ventanamicro.com>
References: <20230517105135.1871868-1-apatel@ventanamicro.com>
Message-ID: <20230517105135.1871868-11-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We expose IMSIC registers as KVM device attributes of the in-kernel
AIA irqchip device. This will allow KVM user-space to save/restore
IMISC state of each VCPU using KVM device ioctls().

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_aia.h  |   3 +
 arch/riscv/include/uapi/asm/kvm.h |  12 +++
 arch/riscv/kvm/aia_device.c       |  29 ++++-
 arch/riscv/kvm/aia_imsic.c        | 170 ++++++++++++++++++++++++++++++
 4 files changed, 212 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_aia.h b/arch/riscv/include/asm/kvm_aia.h
index a4f6ebf90e31..1f37b600ca47 100644
--- a/arch/riscv/include/asm/kvm_aia.h
+++ b/arch/riscv/include/asm/kvm_aia.h
@@ -97,6 +97,9 @@ int kvm_riscv_vcpu_aia_imsic_update(struct kvm_vcpu *vcpu);
 int kvm_riscv_vcpu_aia_imsic_rmw(struct kvm_vcpu *vcpu, unsigned long isel,
 				 unsigned long *val, unsigned long new_val,
 				 unsigned long wr_mask);
+int kvm_riscv_aia_imsic_rw_attr(struct kvm *kvm, unsigned long type,
+				bool write, unsigned long *val);
+int kvm_riscv_aia_imsic_has_attr(struct kvm *kvm, unsigned long type);
 void kvm_riscv_vcpu_aia_imsic_reset(struct kvm_vcpu *vcpu);
 int kvm_riscv_vcpu_aia_imsic_inject(struct kvm_vcpu *vcpu,
 				    u32 guest_index, u32 offset, u32 iid);
diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index e80210c2220b..624784bb21dd 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -242,6 +242,18 @@ enum KVM_RISCV_SBI_EXT_ID {
 
 #define KVM_DEV_RISCV_AIA_GRP_APLIC		3
 
+#define KVM_DEV_RISCV_AIA_GRP_IMSIC		4
+#define KVM_DEV_RISCV_AIA_IMSIC_ISEL_BITS	12
+#define KVM_DEV_RISCV_AIA_IMSIC_ISEL_MASK	\
+		((1U << KVM_DEV_RISCV_AIA_IMSIC_ISEL_BITS) - 1)
+#define KVM_DEV_RISCV_AIA_IMSIC_MKATTR(__vcpu, __isel)	\
+		(((__vcpu) << KVM_DEV_RISCV_AIA_IMSIC_ISEL_BITS) | \
+		 ((__isel) & KVM_DEV_RISCV_AIA_IMSIC_ISEL_MASK))
+#define KVM_DEV_RISCV_AIA_IMSIC_GET_ISEL(__attr)	\
+		((__attr) & KVM_DEV_RISCV_AIA_IMSIC_ISEL_MASK)
+#define KVM_DEV_RISCV_AIA_IMSIC_GET_VCPU(__attr)	\
+		((__attr) >> KVM_DEV_RISCV_AIA_IMSIC_ISEL_BITS)
+
 /* One single KVM irqchip, ie. the AIA */
 #define KVM_NR_IRQCHIPS			1
 
diff --git a/arch/riscv/kvm/aia_device.c b/arch/riscv/kvm/aia_device.c
index 17dba92a90e1..ac7bd98301a3 100644
--- a/arch/riscv/kvm/aia_device.c
+++ b/arch/riscv/kvm/aia_device.c
@@ -326,7 +326,7 @@ static int aia_set_attr(struct kvm_device *dev, struct kvm_device_attr *attr)
 	u32 nr;
 	u64 addr;
 	int nr_vcpus, r = -ENXIO;
-	unsigned long type = (unsigned long)attr->attr;
+	unsigned long v, type = (unsigned long)attr->attr;
 	void __user *uaddr = (void __user *)(long)attr->addr;
 
 	switch (attr->group) {
@@ -373,6 +373,15 @@ static int aia_set_attr(struct kvm_device *dev, struct kvm_device_attr *attr)
 		r = kvm_riscv_aia_aplic_set_attr(dev->kvm, type, nr);
 		mutex_unlock(&dev->kvm->lock);
 
+		break;
+	case KVM_DEV_RISCV_AIA_GRP_IMSIC:
+		if (copy_from_user(&v, uaddr, sizeof(v)))
+			return -EFAULT;
+
+		mutex_lock(&dev->kvm->lock);
+		r = kvm_riscv_aia_imsic_rw_attr(dev->kvm, type, true, &v);
+		mutex_unlock(&dev->kvm->lock);
+
 		break;
 	}
 
@@ -385,7 +394,7 @@ static int aia_get_attr(struct kvm_device *dev, struct kvm_device_attr *attr)
 	u64 addr;
 	int nr_vcpus, r = -ENXIO;
 	void __user *uaddr = (void __user *)(long)attr->addr;
-	unsigned long type = (unsigned long)attr->attr;
+	unsigned long v, type = (unsigned long)attr->attr;
 
 	switch (attr->group) {
 	case KVM_DEV_RISCV_AIA_GRP_CONFIG:
@@ -434,6 +443,20 @@ static int aia_get_attr(struct kvm_device *dev, struct kvm_device_attr *attr)
 		if (copy_to_user(uaddr, &nr, sizeof(nr)))
 			return -EFAULT;
 
+		break;
+	case KVM_DEV_RISCV_AIA_GRP_IMSIC:
+		if (copy_from_user(&v, uaddr, sizeof(v)))
+			return -EFAULT;
+
+		mutex_lock(&dev->kvm->lock);
+		r = kvm_riscv_aia_imsic_rw_attr(dev->kvm, type, false, &v);
+		mutex_unlock(&dev->kvm->lock);
+		if (r)
+			return r;
+
+		if (copy_to_user(uaddr, &v, sizeof(v)))
+			return -EFAULT;
+
 		break;
 	}
 
@@ -472,6 +495,8 @@ static int aia_has_attr(struct kvm_device *dev, struct kvm_device_attr *attr)
 		break;
 	case KVM_DEV_RISCV_AIA_GRP_APLIC:
 		return kvm_riscv_aia_aplic_has_attr(dev->kvm, attr->attr);
+	case KVM_DEV_RISCV_AIA_GRP_IMSIC:
+		return kvm_riscv_aia_imsic_has_attr(dev->kvm, attr->attr);
 	}
 
 	return -ENXIO;
diff --git a/arch/riscv/kvm/aia_imsic.c b/arch/riscv/kvm/aia_imsic.c
index 2dc09dcb8ab5..8f108cfa80e5 100644
--- a/arch/riscv/kvm/aia_imsic.c
+++ b/arch/riscv/kvm/aia_imsic.c
@@ -277,6 +277,33 @@ static u32 imsic_mrif_topei(struct imsic_mrif *mrif, u32 nr_eix, u32 nr_msis)
 	return 0;
 }
 
+static int imsic_mrif_isel_check(u32 nr_eix, unsigned long isel)
+{
+	u32 num = 0;
+
+	switch (isel) {
+	case IMSIC_EIDELIVERY:
+	case IMSIC_EITHRESHOLD:
+		break;
+	case IMSIC_EIP0 ... IMSIC_EIP63:
+		num = isel - IMSIC_EIP0;
+		break;
+	case IMSIC_EIE0 ... IMSIC_EIE63:
+		num = isel - IMSIC_EIE0;
+		break;
+	default:
+		return -ENOENT;
+	};
+#ifndef CONFIG_32BIT
+	if (num & 0x1)
+		return -EINVAL;
+#endif
+	if ((num / 2) >= nr_eix)
+		return -EINVAL;
+
+	return 0;
+}
+
 static int imsic_mrif_rmw(struct imsic_mrif *mrif, u32 nr_eix,
 			  unsigned long isel, unsigned long *val,
 			  unsigned long new_val, unsigned long wr_mask)
@@ -407,6 +434,86 @@ static void imsic_vsfile_read(int vsfile_hgei, int vsfile_cpu, u32 nr_eix,
 			 imsic_vsfile_local_read, &idata, 1);
 }
 
+struct imsic_vsfile_rw_data {
+	int hgei;
+	int isel;
+	bool write;
+	unsigned long val;
+};
+
+static void imsic_vsfile_local_rw(void *data)
+{
+	struct imsic_vsfile_rw_data *idata = data;
+	unsigned long new_hstatus, old_hstatus, old_vsiselect;
+
+	old_vsiselect = csr_read(CSR_VSISELECT);
+	old_hstatus = csr_read(CSR_HSTATUS);
+	new_hstatus = old_hstatus & ~HSTATUS_VGEIN;
+	new_hstatus |= ((unsigned long)idata->hgei) << HSTATUS_VGEIN_SHIFT;
+	csr_write(CSR_HSTATUS, new_hstatus);
+
+	switch (idata->isel) {
+	case IMSIC_EIDELIVERY:
+		if (idata->write)
+			imsic_vs_csr_write(IMSIC_EIDELIVERY, idata->val);
+		else
+			idata->val = imsic_vs_csr_read(IMSIC_EIDELIVERY);
+		break;
+	case IMSIC_EITHRESHOLD:
+		if (idata->write)
+			imsic_vs_csr_write(IMSIC_EITHRESHOLD, idata->val);
+		else
+			idata->val = imsic_vs_csr_read(IMSIC_EITHRESHOLD);
+		break;
+	case IMSIC_EIP0 ... IMSIC_EIP63:
+	case IMSIC_EIE0 ... IMSIC_EIE63:
+#ifndef CONFIG_32BIT
+		if (idata->isel & 0x1)
+			break;
+#endif
+		if (idata->write)
+			imsic_eix_write(idata->isel, idata->val);
+		else
+			idata->val = imsic_eix_read(idata->isel);
+		break;
+	default:
+		break;
+	}
+
+	csr_write(CSR_HSTATUS, old_hstatus);
+	csr_write(CSR_VSISELECT, old_vsiselect);
+}
+
+static int imsic_vsfile_rw(int vsfile_hgei, int vsfile_cpu, u32 nr_eix,
+			   unsigned long isel, bool write,
+			   unsigned long *val)
+{
+	int rc;
+	struct imsic_vsfile_rw_data rdata;
+
+	/* We can only access register if we have a IMSIC VS-file */
+	if (vsfile_cpu < 0 || vsfile_hgei <= 0)
+		return -EINVAL;
+
+	/* Check IMSIC register iselect */
+	rc = imsic_mrif_isel_check(nr_eix, isel);
+	if (rc)
+		return rc;
+
+	/* We can only access register on local CPU */
+	rdata.hgei = vsfile_hgei;
+	rdata.isel = isel;
+	rdata.write = write;
+	rdata.val = (write) ? *val : 0;
+	on_each_cpu_mask(cpumask_of(vsfile_cpu),
+			 imsic_vsfile_local_rw, &rdata, 1);
+
+	if (!write)
+		*val = rdata.val;
+
+	return 0;
+}
+
 static void imsic_vsfile_local_clear(int vsfile_hgei, u32 nr_eix)
 {
 	u32 i;
@@ -758,6 +865,69 @@ int kvm_riscv_vcpu_aia_imsic_rmw(struct kvm_vcpu *vcpu, unsigned long isel,
 	return rc;
 }
 
+int kvm_riscv_aia_imsic_rw_attr(struct kvm *kvm, unsigned long type,
+				bool write, unsigned long *val)
+{
+	u32 isel, vcpu_id;
+	unsigned long flags;
+	struct imsic *imsic;
+	struct kvm_vcpu *vcpu;
+	int rc, vsfile_hgei, vsfile_cpu;
+
+	if (!kvm_riscv_aia_initialized(kvm))
+		return -ENODEV;
+
+	vcpu_id = KVM_DEV_RISCV_AIA_IMSIC_GET_VCPU(type);
+	vcpu = kvm_get_vcpu_by_id(kvm, vcpu_id);
+	if (!vcpu)
+		return -ENODEV;
+
+	isel = KVM_DEV_RISCV_AIA_IMSIC_GET_ISEL(type);
+	imsic = vcpu->arch.aia_context.imsic_state;
+
+	read_lock_irqsave(&imsic->vsfile_lock, flags);
+
+	rc = 0;
+	vsfile_hgei = imsic->vsfile_hgei;
+	vsfile_cpu = imsic->vsfile_cpu;
+	if (vsfile_cpu < 0) {
+		if (write) {
+			rc = imsic_mrif_rmw(imsic->swfile, imsic->nr_eix,
+					    isel, NULL, *val, -1UL);
+			imsic_swfile_extirq_update(vcpu);
+		} else
+			rc = imsic_mrif_rmw(imsic->swfile, imsic->nr_eix,
+					    isel, val, 0, 0);
+	}
+
+	read_unlock_irqrestore(&imsic->vsfile_lock, flags);
+
+	if (!rc && vsfile_cpu >= 0)
+		rc = imsic_vsfile_rw(vsfile_hgei, vsfile_cpu, imsic->nr_eix,
+				     isel, write, val);
+
+	return rc;
+}
+
+int kvm_riscv_aia_imsic_has_attr(struct kvm *kvm, unsigned long type)
+{
+	u32 isel, vcpu_id;
+	struct imsic *imsic;
+	struct kvm_vcpu *vcpu;
+
+	if (!kvm_riscv_aia_initialized(kvm))
+		return -ENODEV;
+
+	vcpu_id = KVM_DEV_RISCV_AIA_IMSIC_GET_VCPU(type);
+	vcpu = kvm_get_vcpu_by_id(kvm, vcpu_id);
+	if (!vcpu)
+		return -ENODEV;
+
+	isel = KVM_DEV_RISCV_AIA_IMSIC_GET_ISEL(type);
+	imsic = vcpu->arch.aia_context.imsic_state;
+	return imsic_mrif_isel_check(imsic->nr_eix, isel);
+}
+
 void kvm_riscv_vcpu_aia_imsic_reset(struct kvm_vcpu *vcpu)
 {
 	struct imsic *imsic = vcpu->arch.aia_context.imsic_state;
-- 
2.34.1


