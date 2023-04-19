From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 19 Apr 2023 15:16:36 -0700
Subject: [RFC 08/48] RISC-V: KVM: Add UABI to support static memory region attestation
In-Reply-To: <20230419221716.3603068-1-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
Message-ID: <20230419221716.3603068-9-atishp@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

To initialize a TVM, a TSM must ensure that all the static memory regions
that contain the device tree, the kernel image or initrd for the TVM
attested. Some of these information is not usually present with the host
and only VMM is aware of these.

Introduce an new ioctl which is part of the uABI to support this.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/uapi/asm/kvm.h | 12 ++++++++++++
 include/uapi/linux/kvm.h          |  2 ++
 2 files changed, 14 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 11440df..ac3def0 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -98,6 +98,18 @@ struct kvm_riscv_timer {
 	__u64 state;
 };
 
+/* Memory region details of a CoVE guest that is measured at boot time */
+struct kvm_riscv_cove_measure_region {
+	/* Address of the user space where the VM code/data resides */
+	unsigned long userspace_addr;
+
+	/* The guest physical address where VM code/data should be mapped */
+	unsigned long gpa;
+
+	/* Size of the region */
+	unsigned long size;
+};
+
 /*
  * ISA extension IDs specific to KVM. This is not the same as the host ISA
  * extension IDs as that is internal to the host and should not be exposed
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index a55a6a5..84a73b5 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -1552,6 +1552,8 @@ struct kvm_s390_ucas_mapping {
 #define KVM_PPC_SVM_OFF		  _IO(KVMIO,  0xb3)
 #define KVM_ARM_MTE_COPY_TAGS	  _IOR(KVMIO,  0xb4, struct kvm_arm_copy_mte_tags)
 
+#define KVM_RISCV_COVE_MEASURE_REGION  _IOR(KVMIO, 0xb5, struct kvm_riscv_cove_measure_region)
+
 /* ioctl for vm fd */
 #define KVM_CREATE_DEVICE	  _IOWR(KVMIO,  0xe0, struct kvm_create_device)
 
-- 
2.25.1


