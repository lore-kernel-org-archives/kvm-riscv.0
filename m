From: Zeng Guang <guang.zeng@intel.com>
Date: Thu,  2 Nov 2023 23:51:05 +0800
Subject: [RFC PATCH v1 2/8] KVM: selftests: x86: Support guest running on canonical linear-address organization
In-Reply-To: <20231102155111.28821-1-guang.zeng@intel.com>
References: <20231102155111.28821-1-guang.zeng@intel.com>
Message-ID: <20231102155111.28821-3-guang.zeng@intel.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Setup execution environment running on 64-bit linear addresses for
user and supervisor mode.

Define the linear address based on 48-bit canonical format in which
bits 63:47 of the address are identical. All addresses to system data
structure are shifted to supervisor-mode address space.

Extend page table mapping for supervisor mode to same guest physical
address. This allows guest in supervisor mode can run in the
corresponding canonical linear address space.

Signed-off-by: Zeng Guang <guang.zeng@intel.com>
---
 .../selftests/kvm/include/x86_64/processor.h  |  6 ++++
 tools/testing/selftests/kvm/lib/kvm_util.c    |  6 ++--
 .../selftests/kvm/lib/x86_64/processor.c      | 28 ++++++++++++-------
 3 files changed, 28 insertions(+), 12 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/x86_64/processor.h b/tools/testing/selftests/kvm/include/x86_64/processor.h
index 25bc61dac5fb..00f7337a520a 100644
--- a/tools/testing/selftests/kvm/include/x86_64/processor.h
+++ b/tools/testing/selftests/kvm/include/x86_64/processor.h
@@ -1256,4 +1256,10 @@ void virt_map_level(struct kvm_vm *vm, uint64_t vaddr, uint64_t paddr,
 #define PFERR_GUEST_PAGE_MASK	BIT_ULL(PFERR_GUEST_PAGE_BIT)
 #define PFERR_IMPLICIT_ACCESS	BIT_ULL(PFERR_IMPLICIT_ACCESS_BIT)
 
+/*
+ * X86 kernel linear address defines
+ */
+#define KERNEL_LNA_OFFSET 0xffff800000000000
+#define KERNEL_ADDR(x) ((void *)(x) + KERNEL_LNA_OFFSET)
+
 #endif /* SELFTEST_KVM_PROCESSOR_H */
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 7a8af1821f5d..584f111620f3 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -337,9 +337,11 @@ static uint64_t vm_nr_pages_required(enum vm_guest_mode mode,
 	 * smallest page size is used. Considering each page contains x page
 	 * table descriptors, the total extra size for page tables (for extra
 	 * N pages) will be: N/x+N/x^2+N/x^3+... which is definitely smaller
-	 * than N/x*2.
+	 * than N/x*2. To support mapping one set of physical addresses both
+	 * to user-mode addresses and supervisor-mode addresses, it's proper
+	 * to extend the page size to N/x*4.
 	 */
-	nr_pages += (nr_pages + extra_mem_pages) / PTES_PER_MIN_PAGE * 2;
+	nr_pages += (nr_pages + extra_mem_pages) / PTES_PER_MIN_PAGE * 4;
 
 	/* Account for the number of pages needed by ucall. */
 	nr_pages += ucall_nr_pages_required(page_size);
diff --git a/tools/testing/selftests/kvm/lib/x86_64/processor.c b/tools/testing/selftests/kvm/lib/x86_64/processor.c
index 9f4b8c47edce..6f4295a13d00 100644
--- a/tools/testing/selftests/kvm/lib/x86_64/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86_64/processor.c
@@ -227,6 +227,13 @@ void __virt_pg_map(struct kvm_vm *vm, uint64_t vaddr, uint64_t paddr, int level)
 void virt_arch_pg_map(struct kvm_vm *vm, uint64_t vaddr, uint64_t paddr)
 {
 	__virt_pg_map(vm, vaddr, paddr, PG_LEVEL_4K);
+
+	/*
+	 * Map same paddr to kernel linear address space. Make execution
+	 * environment supporting running both in user and kernel mode.
+	 */
+	if (!(vaddr & BIT_ULL(63)))
+		__virt_pg_map(vm, (uint64_t)KERNEL_ADDR(vaddr), paddr, PG_LEVEL_4K);
 }
 
 void virt_map_level(struct kvm_vm *vm, uint64_t vaddr, uint64_t paddr,
@@ -505,7 +512,7 @@ static void kvm_setup_gdt(struct kvm_vm *vm, struct kvm_dtable *dt)
 	if (!vm->gdt)
 		vm->gdt = __vm_vaddr_alloc_page(vm, MEM_REGION_DATA);
 
-	dt->base = vm->gdt;
+	dt->base = (unsigned long)KERNEL_ADDR(vm->gdt);
 	dt->limit = getpagesize();
 }
 
@@ -516,7 +523,7 @@ static void kvm_setup_tss_64bit(struct kvm_vm *vm, struct kvm_segment *segp,
 		vm->tss = __vm_vaddr_alloc_page(vm, MEM_REGION_DATA);
 
 	memset(segp, 0, sizeof(*segp));
-	segp->base = vm->tss;
+	segp->base = (unsigned long)KERNEL_ADDR(vm->tss);
 	segp->limit = 0x67;
 	segp->selector = selector;
 	segp->type = 0xb;
@@ -597,8 +604,8 @@ struct kvm_vcpu *vm_arch_vcpu_add(struct kvm_vm *vm, uint32_t vcpu_id,
 	/* Setup guest general purpose registers */
 	vcpu_regs_get(vcpu, &regs);
 	regs.rflags = regs.rflags | 0x2;
-	regs.rsp = stack_vaddr;
-	regs.rip = (unsigned long) guest_code;
+	regs.rsp = (unsigned long)KERNEL_ADDR(stack_vaddr);
+	regs.rip = (unsigned long)KERNEL_ADDR(guest_code);
 	vcpu_regs_set(vcpu, &regs);
 
 	/* Setup the MP state */
@@ -1103,8 +1110,9 @@ void vm_init_descriptor_tables(struct kvm_vm *vm)
 	vm->handlers = __vm_vaddr_alloc_page(vm, MEM_REGION_DATA);
 	/* Handlers have the same address in both address spaces.*/
 	for (i = 0; i < NUM_INTERRUPTS; i++)
-		set_idt_entry(vm, i, (unsigned long)(&idt_handlers)[i], 0,
-			DEFAULT_CODE_SELECTOR);
+		set_idt_entry(vm, i,
+			      (unsigned long)KERNEL_ADDR((unsigned long)(&idt_handlers)[i]),
+			      0, DEFAULT_CODE_SELECTOR);
 }
 
 void vcpu_init_descriptor_tables(struct kvm_vcpu *vcpu)
@@ -1113,13 +1121,13 @@ void vcpu_init_descriptor_tables(struct kvm_vcpu *vcpu)
 	struct kvm_sregs sregs;
 
 	vcpu_sregs_get(vcpu, &sregs);
-	sregs.idt.base = vm->idt;
+	sregs.idt.base = (unsigned long)KERNEL_ADDR(vm->idt);
 	sregs.idt.limit = NUM_INTERRUPTS * sizeof(struct idt_entry) - 1;
-	sregs.gdt.base = vm->gdt;
+	sregs.gdt.base = (unsigned long)KERNEL_ADDR(vm->gdt);
 	sregs.gdt.limit = getpagesize() - 1;
 	kvm_seg_set_kernel_data_64bit(NULL, DEFAULT_DATA_SELECTOR, &sregs.gs);
 	vcpu_sregs_set(vcpu, &sregs);
-	*(vm_vaddr_t *)addr_gva2hva(vm, (vm_vaddr_t)(&exception_handlers)) = vm->handlers;
+	*(vm_vaddr_t *)addr_gva2hva(vm, (vm_vaddr_t)(&exception_handlers)) = (vm_vaddr_t)KERNEL_ADDR(vm->handlers);
 }
 
 void vm_install_exception_handler(struct kvm_vm *vm, int vector,
@@ -1127,7 +1135,7 @@ void vm_install_exception_handler(struct kvm_vm *vm, int vector,
 {
 	vm_vaddr_t *handlers = (vm_vaddr_t *)addr_gva2hva(vm, vm->handlers);
 
-	handlers[vector] = (vm_vaddr_t)handler;
+	handlers[vector] = handler ? (vm_vaddr_t)KERNEL_ADDR(handler) : (vm_vaddr_t)NULL;
 }
 
 void assert_on_unhandled_exception(struct kvm_vcpu *vcpu)
-- 
2.21.3


