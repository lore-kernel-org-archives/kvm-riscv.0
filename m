From: Sean Christopherson <seanjc@google.com>
Date: Thu, 14 Mar 2024 16:26:33 -0700
Subject: [PATCH 14/18] KVM: selftests: Fold x86's descriptor tables helpers
 into vcpu_init_sregs()
In-Reply-To: <20240314232637.2538648-1-seanjc@google.com>
References: <20240314232637.2538648-1-seanjc@google.com>
Message-ID: <20240314232637.2538648-15-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Now that the per-VM, on-demand allocation logic in kvm_setup_gdt() and
vcpu_init_descriptor_tables() is gone, fold them into vcpu_init_sregs().

Note, both kvm_setup_gdt() and vcpu_init_descriptor_tables() configured the
GDT, which is why it looks like kvm_setup_gdt() disappears.

Opportunistically delete the pointless zeroing of the IDT limit (it was
being unconditionally overwritten by vcpu_init_descriptor_tables()).

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../selftests/kvm/lib/x86_64/processor.c      | 32 ++++---------------
 1 file changed, 6 insertions(+), 26 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/x86_64/processor.c b/tools/testing/selftests/kvm/lib/x86_64/processor.c
index 561c0aa93608..5cf845975f66 100644
--- a/tools/testing/selftests/kvm/lib/x86_64/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86_64/processor.c
@@ -516,12 +516,6 @@ vm_paddr_t addr_arch_gva2gpa(struct kvm_vm *vm, vm_vaddr_t gva)
 	return vm_untag_gpa(vm, PTE_GET_PA(*pte)) | (gva & ~HUGEPAGE_MASK(level));
 }
 
-static void kvm_setup_gdt(struct kvm_vm *vm, struct kvm_dtable *dt)
-{
-	dt->base = vm->arch.gdt;
-	dt->limit = getpagesize() - 1;
-}
-
 static void kvm_setup_tss_64bit(struct kvm_vm *vm, struct kvm_segment *segp,
 				int selector)
 {
@@ -537,32 +531,19 @@ static void kvm_setup_tss_64bit(struct kvm_vm *vm, struct kvm_segment *segp,
 	kvm_seg_fill_gdt_64bit(vm, segp);
 }
 
-static void vcpu_init_descriptor_tables(struct kvm_vcpu *vcpu)
+static void vcpu_init_sregs(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
 {
-	struct kvm_vm *vm = vcpu->vm;
 	struct kvm_sregs sregs;
 
+	TEST_ASSERT_EQ(vm->mode, VM_MODE_PXXV48_4K);
+
+	/* Set mode specific system register values. */
 	vcpu_sregs_get(vcpu, &sregs);
+
 	sregs.idt.base = vm->arch.idt;
 	sregs.idt.limit = NUM_INTERRUPTS * sizeof(struct idt_entry) - 1;
 	sregs.gdt.base = vm->arch.gdt;
 	sregs.gdt.limit = getpagesize() - 1;
-	kvm_seg_set_kernel_data_64bit(NULL, DEFAULT_DATA_SELECTOR, &sregs.gs);
-	vcpu_sregs_set(vcpu, &sregs);
-}
-
-static void vcpu_init_sregs(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
-{
-	struct kvm_sregs sregs;
-
-	TEST_ASSERT_EQ(vm->mode, VM_MODE_PXXV48_4K);
-
-	/* Set mode specific system register values. */
-	vcpu_sregs_get(vcpu, &sregs);
-
-	sregs.idt.limit = 0;
-
-	kvm_setup_gdt(vm, &sregs.gdt);
 
 	sregs.cr0 = X86_CR0_PE | X86_CR0_NE | X86_CR0_PG;
 	sregs.cr4 |= X86_CR4_PAE | X86_CR4_OSFXSR;
@@ -572,12 +553,11 @@ static void vcpu_init_sregs(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
 	kvm_seg_set_kernel_code_64bit(vm, DEFAULT_CODE_SELECTOR, &sregs.cs);
 	kvm_seg_set_kernel_data_64bit(vm, DEFAULT_DATA_SELECTOR, &sregs.ds);
 	kvm_seg_set_kernel_data_64bit(vm, DEFAULT_DATA_SELECTOR, &sregs.es);
+	kvm_seg_set_kernel_data_64bit(NULL, DEFAULT_DATA_SELECTOR, &sregs.gs);
 	kvm_setup_tss_64bit(vm, &sregs.tr, 0x18);
 
 	sregs.cr3 = vm->pgd;
 	vcpu_sregs_set(vcpu, &sregs);
-
-	vcpu_init_descriptor_tables(vcpu);
 }
 
 static void set_idt_entry(struct kvm_vm *vm, int vector, unsigned long addr,
-- 
2.44.0.291.gc1ea87d7ee-goog


