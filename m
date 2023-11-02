From: Zeng Guang <guang.zeng@intel.com>
Date: Thu,  2 Nov 2023 23:51:06 +0800
Subject: [RFC PATCH v1 3/8] KVM: selftests: Add virt_arch_ucall_prealloc() arch specific implementation
In-Reply-To: <20231102155111.28821-1-guang.zeng@intel.com>
References: <20231102155111.28821-1-guang.zeng@intel.com>
Message-ID: <20231102155111.28821-4-guang.zeng@intel.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add virt_arch_ucall_prealloc() which allows to preprocess the memory
allocated to ucall_pool as per arch specific requirement.

For X86 platform, it needs to adjust the address to corresponding
address space based on the operation mode, i.e. user or supervisor
mode, at runtime.

There is no change for other platforms(aarch64/riscv/s390x).

Signed-off-by: Zeng Guang <guang.zeng@intel.com>
---
 .../selftests/kvm/include/kvm_util_base.h       | 17 +++++++++++++++++
 .../selftests/kvm/lib/aarch64/processor.c       |  5 +++++
 .../testing/selftests/kvm/lib/riscv/processor.c |  5 +++++
 .../testing/selftests/kvm/lib/s390x/processor.c |  5 +++++
 tools/testing/selftests/kvm/lib/ucall_common.c  |  2 ++
 .../selftests/kvm/lib/x86_64/processor.c        | 12 ++++++++++++
 6 files changed, 46 insertions(+)

diff --git a/tools/testing/selftests/kvm/include/kvm_util_base.h b/tools/testing/selftests/kvm/include/kvm_util_base.h
index a18db6a7b3cf..dbaa2cf83c1c 100644
--- a/tools/testing/selftests/kvm/include/kvm_util_base.h
+++ b/tools/testing/selftests/kvm/include/kvm_util_base.h
@@ -917,6 +917,23 @@ static inline void virt_dump(FILE *stream, struct kvm_vm *vm, uint8_t indent)
 	virt_arch_dump(stream, vm, indent);
 }
 
+/*
+ * Virtual UCALL memory pre-processing
+ *
+ * Input Args:
+ *   ucall_gva - Guest virtual address point to memory of ucall pool
+ *
+ * Output Args: None
+ *
+ * Return:
+ *   Processed guest virtual address point to memory of ucall pool
+ */
+void *virt_arch_ucall_prealloc(uint64_t ucall_gva);
+
+static inline void *virt_ucall_prealloc(uint64_t ucall_gva)
+{
+	return virt_arch_ucall_prealloc(ucall_gva);
+}
 
 static inline int __vm_disable_nx_huge_pages(struct kvm_vm *vm)
 {
diff --git a/tools/testing/selftests/kvm/lib/aarch64/processor.c b/tools/testing/selftests/kvm/lib/aarch64/processor.c
index 3a0259e25335..3a1827cce615 100644
--- a/tools/testing/selftests/kvm/lib/aarch64/processor.c
+++ b/tools/testing/selftests/kvm/lib/aarch64/processor.c
@@ -238,6 +238,11 @@ void virt_arch_dump(FILE *stream, struct kvm_vm *vm, uint8_t indent)
 	}
 }
 
+void *virt_arch_ucall_prealloc(uint64_t ucall_gva)
+{
+	return (void *)ucall_gva;
+}
+
 void aarch64_vcpu_setup(struct kvm_vcpu *vcpu, struct kvm_vcpu_init *init)
 {
 	struct kvm_vcpu_init default_init = { .target = -1, };
diff --git a/tools/testing/selftests/kvm/lib/riscv/processor.c b/tools/testing/selftests/kvm/lib/riscv/processor.c
index d146ca71e0c0..d3f7eed84195 100644
--- a/tools/testing/selftests/kvm/lib/riscv/processor.c
+++ b/tools/testing/selftests/kvm/lib/riscv/processor.c
@@ -180,6 +180,11 @@ void virt_arch_dump(FILE *stream, struct kvm_vm *vm, uint8_t indent)
 	}
 }
 
+void *virt_arch_ucall_prealloc(uint64_t ucall_gva)
+{
+	return (void *)ucall_gva;
+}
+
 void riscv_vcpu_mmu_setup(struct kvm_vcpu *vcpu)
 {
 	struct kvm_vm *vm = vcpu->vm;
diff --git a/tools/testing/selftests/kvm/lib/s390x/processor.c b/tools/testing/selftests/kvm/lib/s390x/processor.c
index 15945121daf1..b7c86649807d 100644
--- a/tools/testing/selftests/kvm/lib/s390x/processor.c
+++ b/tools/testing/selftests/kvm/lib/s390x/processor.c
@@ -155,6 +155,11 @@ void virt_arch_dump(FILE *stream, struct kvm_vm *vm, uint8_t indent)
 	virt_dump_region(stream, vm, indent, vm->pgd);
 }
 
+void *virt_arch_ucall_prealloc(uint64_t ucall_gva)
+{
+	return (void *)ucall_gva;
+}
+
 struct kvm_vcpu *vm_arch_vcpu_add(struct kvm_vm *vm, uint32_t vcpu_id,
 				  void *guest_code)
 {
diff --git a/tools/testing/selftests/kvm/lib/ucall_common.c b/tools/testing/selftests/kvm/lib/ucall_common.c
index 816a3fa109bf..5afa32d77427 100644
--- a/tools/testing/selftests/kvm/lib/ucall_common.c
+++ b/tools/testing/selftests/kvm/lib/ucall_common.c
@@ -51,6 +51,8 @@ static struct ucall *ucall_alloc(void)
 	if (!ucall_pool)
 		goto ucall_failed;
 
+	ucall_pool = (struct ucall_header *)virt_ucall_prealloc((uint64_t)ucall_pool);
+
 	for (i = 0; i < KVM_MAX_VCPUS; ++i) {
 		if (!test_and_set_bit(i, ucall_pool->in_use)) {
 			uc = &ucall_pool->ucalls[i];
diff --git a/tools/testing/selftests/kvm/lib/x86_64/processor.c b/tools/testing/selftests/kvm/lib/x86_64/processor.c
index 6f4295a13d00..525b714ee13c 100644
--- a/tools/testing/selftests/kvm/lib/x86_64/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86_64/processor.c
@@ -388,6 +388,18 @@ void virt_arch_dump(FILE *stream, struct kvm_vm *vm, uint8_t indent)
 	}
 }
 
+void *virt_arch_ucall_prealloc(uint64_t ucall_gva)
+{
+	unsigned short desc_cs;
+
+	asm volatile ("mov %%cs,%0" :  "=r" (desc_cs));
+
+	if (desc_cs & 0x3)
+		return (void *)(ucall_gva & ~KERNEL_LNA_OFFSET);
+	else
+		return (void *)(ucall_gva | KERNEL_LNA_OFFSET);
+}
+
 /*
  * Set Unusable Segment
  *
-- 
2.21.3


