From: Sean Christopherson <seanjc@google.com>
Date: Thu, 14 Mar 2024 16:26:34 -0700
Subject: [PATCH 15/18] KVM: selftests: Allocate x86's TSS at VM creation
In-Reply-To: <20240314232637.2538648-1-seanjc@google.com>
References: <20240314232637.2538648-1-seanjc@google.com>
Message-ID: <20240314232637.2538648-16-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Allocate x86's per-VM TSS at creation of a non-barebones VM.  Like the
GDT, the TSS is needed to actually run vCPUs, i.e. every non-barebones VM
is all but guaranteed to allocate the TSS sooner or later.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/lib/x86_64/processor.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/x86_64/processor.c b/tools/testing/selftests/kvm/lib/x86_64/processor.c
index 5cf845975f66..03b9387a1d2e 100644
--- a/tools/testing/selftests/kvm/lib/x86_64/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86_64/processor.c
@@ -519,9 +519,6 @@ vm_paddr_t addr_arch_gva2gpa(struct kvm_vm *vm, vm_vaddr_t gva)
 static void kvm_setup_tss_64bit(struct kvm_vm *vm, struct kvm_segment *segp,
 				int selector)
 {
-	if (!vm->arch.tss)
-		vm->arch.tss = __vm_vaddr_alloc_page(vm, MEM_REGION_DATA);
-
 	memset(segp, 0, sizeof(*segp));
 	segp->base = vm->arch.tss;
 	segp->limit = 0x67;
@@ -619,6 +616,8 @@ static void vm_init_descriptor_tables(struct kvm_vm *vm)
 	vm->arch.gdt = __vm_vaddr_alloc_page(vm, MEM_REGION_DATA);
 	vm->arch.idt = __vm_vaddr_alloc_page(vm, MEM_REGION_DATA);
 	vm->handlers = __vm_vaddr_alloc_page(vm, MEM_REGION_DATA);
+	vm->arch.tss = __vm_vaddr_alloc_page(vm, MEM_REGION_DATA);
+
 	/* Handlers have the same address in both address spaces.*/
 	for (i = 0; i < NUM_INTERRUPTS; i++)
 		set_idt_entry(vm, i, (unsigned long)(&idt_handlers)[i], 0,
-- 
2.44.0.291.gc1ea87d7ee-goog


