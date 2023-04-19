From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 19 Apr 2023 15:23:43 -0700
Subject: [RFC kvmtool 03/10] riscv: Define a measure region IOCTL
In-Reply-To: <20230419222350.3604274-1-atishp@rivosinc.com>
References: <20230419222350.3604274-1-atishp@rivosinc.com>
Message-ID: <20230419222350.3604274-4-atishp@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

CoVE VM images needs to be measured by the TSM. The VMM updates
the host about these images via a new IOCTL. The host makes appropriate
ecalls for TSM to perform the measurement.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 include/linux/kvm.h          |  2 ++
 riscv/include/asm/kvm.h      |  6 ++++++
 riscv/include/kvm/kvm-arch.h |  2 ++
 riscv/kvm.c                  | 21 +++++++++++++++++++++
 4 files changed, 31 insertions(+)

diff --git a/include/linux/kvm.h b/include/linux/kvm.h
index 000d2b9..d4969a0 100644
--- a/include/linux/kvm.h
+++ b/include/linux/kvm.h
@@ -1547,6 +1547,8 @@ struct kvm_s390_ucas_mapping {
 #define KVM_PPC_SVM_OFF		  _IO(KVMIO,  0xb3)
 #define KVM_ARM_MTE_COPY_TAGS	  _IOR(KVMIO,  0xb4, struct kvm_arm_copy_mte_tags)
 
+#define KVM_RISCV_COVE_MEASURE_REGION _IOR(KVMIO, 0xb5, struct kvm_riscv_cove_measure_region)
+
 /* ioctl for vm fd */
 #define KVM_CREATE_DEVICE	  _IOWR(KVMIO,  0xe0, struct kvm_create_device)
 
diff --git a/riscv/include/asm/kvm.h b/riscv/include/asm/kvm.h
index 1dce9a4..2bacc38 100644
--- a/riscv/include/asm/kvm.h
+++ b/riscv/include/asm/kvm.h
@@ -98,6 +98,12 @@ struct kvm_riscv_timer {
 	__u64 state;
 };
 
+struct kvm_riscv_cove_measure_region {
+	unsigned long user_addr;
+	unsigned long gpa;
+	unsigned long size;
+};
+
 /*
  * ISA extension IDs specific to KVM. This is not the same as the host ISA
  * extension IDs as that is internal to the host and should not be exposed
diff --git a/riscv/include/kvm/kvm-arch.h b/riscv/include/kvm/kvm-arch.h
index 9f2159f..08ac54a 100644
--- a/riscv/include/kvm/kvm-arch.h
+++ b/riscv/include/kvm/kvm-arch.h
@@ -120,4 +120,6 @@ void riscv__generate_irq_prop(void *fdt, u8 irq, enum irq_type irq_type);
 
 void riscv__irqchip_create(struct kvm *kvm);
 
+void kvm_cove_measure_region(struct kvm *kvm, unsigned long uaddr,
+			      unsigned long gpa, unsigned long rsize);
 #endif /* KVM__KVM_ARCH_H */
diff --git a/riscv/kvm.c b/riscv/kvm.c
index a9ade1f..99b253e 100644
--- a/riscv/kvm.c
+++ b/riscv/kvm.c
@@ -13,6 +13,27 @@ struct kvm_ext kvm_req_ext[] = {
 	{ 0, 0 },
 };
 
+void kvm_cove_measure_region(struct kvm *kvm, unsigned long uaddr,
+			      unsigned long gpa, unsigned long rsize)
+{
+	int ret;
+
+	if (!kvm->cfg.arch.cove_vm)
+		return;
+
+	struct kvm_riscv_cove_measure_region mr = {
+		.user_addr = uaddr,
+		.gpa = gpa,
+		.size = rsize,
+	};
+
+	ret = ioctl(kvm->vm_fd, KVM_RISCV_COVE_MEASURE_REGION, &mr);
+	if (ret < 0) {
+		ret = -errno;
+		die("Setting measure region failed for CoVE VM\n");
+	}
+}
+
 u64 kvm__arch_default_ram_address(void)
 {
 	return RISCV_RAM;
-- 
2.25.1


