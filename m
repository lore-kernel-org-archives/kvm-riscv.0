From: Sean Christopherson <seanjc@google.com>
Date: Thu, 14 Mar 2024 16:26:32 -0700
Subject: [PATCH 13/18] KVM: selftests: Drop superfluous switch() on vm->mode
 in vcpu_init_sregs()
In-Reply-To: <20240314232637.2538648-1-seanjc@google.com>
References: <20240314232637.2538648-1-seanjc@google.com>
Message-ID: <20240314232637.2538648-14-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Replace the switch statement on vm->mode in x86's vcpu_init_sregs()'s with
a simple assert that the VM has a 48-bit virtual address space.  A switch
statement is both overkill and misleading, as the existing code incorrectly
implies that VMs with LA57 would need different to configuration for the
LDT, TSS, and flat segments.  In all likelihood, the only difference that
would be needed for selftests is CR4.LA57 itself.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../selftests/kvm/lib/x86_64/processor.c      | 25 ++++++++-----------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/x86_64/processor.c b/tools/testing/selftests/kvm/lib/x86_64/processor.c
index 8547833ffa26..561c0aa93608 100644
--- a/tools/testing/selftests/kvm/lib/x86_64/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86_64/processor.c
@@ -555,6 +555,8 @@ static void vcpu_init_sregs(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
 {
 	struct kvm_sregs sregs;
 
+	TEST_ASSERT_EQ(vm->mode, VM_MODE_PXXV48_4K);
+
 	/* Set mode specific system register values. */
 	vcpu_sregs_get(vcpu, &sregs);
 
@@ -562,22 +564,15 @@ static void vcpu_init_sregs(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
 
 	kvm_setup_gdt(vm, &sregs.gdt);
 
-	switch (vm->mode) {
-	case VM_MODE_PXXV48_4K:
-		sregs.cr0 = X86_CR0_PE | X86_CR0_NE | X86_CR0_PG;
-		sregs.cr4 |= X86_CR4_PAE | X86_CR4_OSFXSR;
-		sregs.efer |= (EFER_LME | EFER_LMA | EFER_NX);
+	sregs.cr0 = X86_CR0_PE | X86_CR0_NE | X86_CR0_PG;
+	sregs.cr4 |= X86_CR4_PAE | X86_CR4_OSFXSR;
+	sregs.efer |= (EFER_LME | EFER_LMA | EFER_NX);
 
-		kvm_seg_set_unusable(&sregs.ldt);
-		kvm_seg_set_kernel_code_64bit(vm, DEFAULT_CODE_SELECTOR, &sregs.cs);
-		kvm_seg_set_kernel_data_64bit(vm, DEFAULT_DATA_SELECTOR, &sregs.ds);
-		kvm_seg_set_kernel_data_64bit(vm, DEFAULT_DATA_SELECTOR, &sregs.es);
-		kvm_setup_tss_64bit(vm, &sregs.tr, 0x18);
-		break;
-
-	default:
-		TEST_FAIL("Unknown guest mode, mode: 0x%x", vm->mode);
-	}
+	kvm_seg_set_unusable(&sregs.ldt);
+	kvm_seg_set_kernel_code_64bit(vm, DEFAULT_CODE_SELECTOR, &sregs.cs);
+	kvm_seg_set_kernel_data_64bit(vm, DEFAULT_DATA_SELECTOR, &sregs.ds);
+	kvm_seg_set_kernel_data_64bit(vm, DEFAULT_DATA_SELECTOR, &sregs.es);
+	kvm_setup_tss_64bit(vm, &sregs.tr, 0x18);
 
 	sregs.cr3 = vm->pgd;
 	vcpu_sregs_set(vcpu, &sregs);
-- 
2.44.0.291.gc1ea87d7ee-goog


