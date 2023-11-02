From: Zeng Guang <guang.zeng@intel.com>
Date: Thu,  2 Nov 2023 23:51:08 +0800
Subject: [RFC PATCH v1 5/8] KVM: selftests: x86: Prepare setup for user mode support
In-Reply-To: <20231102155111.28821-1-guang.zeng@intel.com>
References: <20231102155111.28821-1-guang.zeng@intel.com>
Message-ID: <20231102155111.28821-6-guang.zeng@intel.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Extend the page size of stack memory that can be shared for user mode.
And configure the canonical linear address of the stack point(RSP0) for
privilege level 0 in TSS segment which processor will use to switch task,
e.g. from user mode back to supervisor mode triggered by interrupt.

Refactor KVM segment set API to support user mode setup.

No functional change intended.

Signed-off-by: Zeng Guang <guang.zeng@intel.com>
---
 .../selftests/kvm/include/kvm_util_base.h     |  3 +-
 .../selftests/kvm/include/x86_64/processor.h  | 18 +++++++++
 .../selftests/kvm/lib/x86_64/processor.c      | 37 +++++++++++++------
 3 files changed, 46 insertions(+), 12 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util_base.h b/tools/testing/selftests/kvm/include/kvm_util_base.h
index dbaa2cf83c1c..6f580bc519f4 100644
--- a/tools/testing/selftests/kvm/include/kvm_util_base.h
+++ b/tools/testing/selftests/kvm/include/kvm_util_base.h
@@ -71,6 +71,7 @@ struct kvm_vcpu {
 	struct kvm_dirty_gfn *dirty_gfns;
 	uint32_t fetch_index;
 	uint32_t dirty_gfns_count;
+	uint64_t stack_vaddr;
 };
 
 struct userspace_mem_regions {
@@ -167,7 +168,7 @@ static inline struct userspace_mem_region *vm_get_mem_region(struct kvm_vm *vm,
 #define KVM_GUEST_PAGE_TABLE_MIN_PADDR	0x180000
 
 #define DEFAULT_GUEST_STACK_VADDR_MIN	0xab6000
-#define DEFAULT_STACK_PGS		5
+#define DEFAULT_STACK_PGS		10
 
 enum vm_guest_mode {
 	VM_MODE_P52V48_4K,
diff --git a/tools/testing/selftests/kvm/include/x86_64/processor.h b/tools/testing/selftests/kvm/include/x86_64/processor.h
index 00f7337a520a..4b167e3e0370 100644
--- a/tools/testing/selftests/kvm/include/x86_64/processor.h
+++ b/tools/testing/selftests/kvm/include/x86_64/processor.h
@@ -1072,6 +1072,24 @@ struct ex_regs {
 	uint64_t rflags;
 };
 
+struct tss64_t {
+	uint32_t res1;
+	uint64_t rsp0;
+	uint64_t rsp1;
+	uint64_t rsp2;
+	uint64_t res2;
+	uint64_t ist1;
+	uint64_t ist2;
+	uint64_t ist3;
+	uint64_t ist4;
+	uint64_t ist5;
+	uint64_t ist6;
+	uint64_t ist7;
+	uint64_t res3;
+	uint16_t res4;
+	uint16_t iomap_base;
+} __attribute__((packed));
+
 struct idt_entry {
 	uint16_t offset0;
 	uint16_t selector;
diff --git a/tools/testing/selftests/kvm/lib/x86_64/processor.c b/tools/testing/selftests/kvm/lib/x86_64/processor.c
index 525b714ee13c..487e1f829031 100644
--- a/tools/testing/selftests/kvm/lib/x86_64/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86_64/processor.c
@@ -16,6 +16,9 @@
 
 #define DEFAULT_CODE_SELECTOR 0x8
 #define DEFAULT_DATA_SELECTOR 0x10
+#define DEFAULT_TSS_SELECTOR 0x18
+#define USER_CODE_SELECTOR 0x23
+#define USER_DATA_SELECTOR 0x2B
 
 #define MAX_NR_CPUID_ENTRIES 100
 
@@ -442,7 +445,7 @@ static void kvm_seg_fill_gdt_64bit(struct kvm_vm *vm, struct kvm_segment *segp)
 
 
 /*
- * Set Long Mode Flat Kernel Code Segment
+ * Set Long Mode Flat Code Segment
  *
  * Input Args:
  *   vm - VM whose GDT is being filled, or NULL to only write segp
@@ -454,14 +457,16 @@ static void kvm_seg_fill_gdt_64bit(struct kvm_vm *vm, struct kvm_segment *segp)
  * Return: None
  *
  * Sets up the KVM segment pointed to by @segp, to be a code segment
- * with the selector value given by @selector.
+ * with the selector value given by @selector. The @selector.dpl
+ * decides the descriptor privilege level, user or kernel.
  */
-static void kvm_seg_set_kernel_code_64bit(struct kvm_vm *vm, uint16_t selector,
+static void kvm_seg_set_code_64bit(struct kvm_vm *vm, uint16_t selector,
 	struct kvm_segment *segp)
 {
 	memset(segp, 0, sizeof(*segp));
 	segp->selector = selector;
 	segp->limit = 0xFFFFFFFFu;
+	segp->dpl = selector & 0x3;
 	segp->s = 0x1; /* kTypeCodeData */
 	segp->type = 0x08 | 0x01 | 0x02; /* kFlagCode | kFlagCodeAccessed
 					  * | kFlagCodeReadable
@@ -474,7 +479,7 @@ static void kvm_seg_set_kernel_code_64bit(struct kvm_vm *vm, uint16_t selector,
 }
 
 /*
- * Set Long Mode Flat Kernel Data Segment
+ * Set Long Mode Flat Data Segment
  *
  * Input Args:
  *   vm - VM whose GDT is being filled, or NULL to only write segp
@@ -486,14 +491,16 @@ static void kvm_seg_set_kernel_code_64bit(struct kvm_vm *vm, uint16_t selector,
  * Return: None
  *
  * Sets up the KVM segment pointed to by @segp, to be a data segment
- * with the selector value given by @selector.
+ * with the selector value given by @selector. The @selector.dpl
+ * decides the descriptor privilege level, user or kernel.
  */
-static void kvm_seg_set_kernel_data_64bit(struct kvm_vm *vm, uint16_t selector,
+static void kvm_seg_set_data_64bit(struct kvm_vm *vm, uint16_t selector,
 	struct kvm_segment *segp)
 {
 	memset(segp, 0, sizeof(*segp));
 	segp->selector = selector;
 	segp->limit = 0xFFFFFFFFu;
+	segp->dpl = selector & 0x3;
 	segp->s = 0x1; /* kTypeCodeData */
 	segp->type = 0x00 | 0x01 | 0x02; /* kFlagData | kFlagDataAccessed
 					  * | kFlagDataWritable
@@ -561,10 +568,10 @@ static void vcpu_setup(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
 		sregs.efer |= (EFER_LME | EFER_LMA | EFER_NX);
 
 		kvm_seg_set_unusable(&sregs.ldt);
-		kvm_seg_set_kernel_code_64bit(vm, DEFAULT_CODE_SELECTOR, &sregs.cs);
-		kvm_seg_set_kernel_data_64bit(vm, DEFAULT_DATA_SELECTOR, &sregs.ds);
-		kvm_seg_set_kernel_data_64bit(vm, DEFAULT_DATA_SELECTOR, &sregs.es);
-		kvm_setup_tss_64bit(vm, &sregs.tr, 0x18);
+		kvm_seg_set_code_64bit(vm, DEFAULT_CODE_SELECTOR, &sregs.cs);
+		kvm_seg_set_data_64bit(vm, DEFAULT_DATA_SELECTOR, &sregs.ds);
+		kvm_seg_set_data_64bit(vm, DEFAULT_DATA_SELECTOR, &sregs.es);
+		kvm_setup_tss_64bit(vm, &sregs.tr, DEFAULT_TSS_SELECTOR);
 		break;
 
 	default:
@@ -589,6 +596,7 @@ struct kvm_vcpu *vm_arch_vcpu_add(struct kvm_vm *vm, uint32_t vcpu_id,
 	struct kvm_regs regs;
 	vm_vaddr_t stack_vaddr;
 	struct kvm_vcpu *vcpu;
+	struct tss64_t *tss_hva;
 
 	stack_vaddr = __vm_vaddr_alloc(vm, DEFAULT_STACK_PGS * getpagesize(),
 				       DEFAULT_GUEST_STACK_VADDR_MIN,
@@ -613,6 +621,13 @@ struct kvm_vcpu *vm_arch_vcpu_add(struct kvm_vm *vm, uint32_t vcpu_id,
 	vcpu_init_cpuid(vcpu, kvm_get_supported_cpuid());
 	vcpu_setup(vm, vcpu);
 
+	/* Save address of stack pool used for vCPU */
+	vcpu->stack_vaddr = stack_vaddr;
+
+	/* Setup canonical linear address form of the RSP0 for task switch */
+	tss_hva = (struct tss64_t *)addr_gva2hva(vm, vm->tss);
+	tss_hva->rsp0 = (uint64_t)KERNEL_ADDR(stack_vaddr);
+
 	/* Setup guest general purpose registers */
 	vcpu_regs_get(vcpu, &regs);
 	regs.rflags = regs.rflags | 0x2;
@@ -1137,7 +1152,7 @@ void vcpu_init_descriptor_tables(struct kvm_vcpu *vcpu)
 	sregs.idt.limit = NUM_INTERRUPTS * sizeof(struct idt_entry) - 1;
 	sregs.gdt.base = (unsigned long)KERNEL_ADDR(vm->gdt);
 	sregs.gdt.limit = getpagesize() - 1;
-	kvm_seg_set_kernel_data_64bit(NULL, DEFAULT_DATA_SELECTOR, &sregs.gs);
+	kvm_seg_set_data_64bit(NULL, DEFAULT_DATA_SELECTOR, &sregs.gs);
 	vcpu_sregs_set(vcpu, &sregs);
 	*(vm_vaddr_t *)addr_gva2hva(vm, (vm_vaddr_t)(&exception_handlers)) = (vm_vaddr_t)KERNEL_ADDR(vm->handlers);
 }
-- 
2.21.3


