From: Sean Christopherson <seanjc@google.com>
Date: Thu, 14 Mar 2024 16:26:37 -0700
Subject: [PATCH 18/18] KVM: selftests: Drop @selector from segment helpers
In-Reply-To: <20240314232637.2538648-1-seanjc@google.com>
References: <20240314232637.2538648-1-seanjc@google.com>
Message-ID: <20240314232637.2538648-19-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Drop the @selector from the kernel code, data, and TSS builders and
instead hardcode the respective selector in the helper.  Accepting a
selector but not a base makes the selector useless, e.g. the data helper
can't create per-vCPU for FS or GS, and so loading GS with KERNEL_DS is
the only logical choice.

And for code and TSS, there is no known reason to ever want multiple
segments, e.g. there are zero plans to support 32-bit kernel code (and
again, that would require more than just the selector).

If KVM selftests ever do add support for per-vCPU segments, it'd arguably
be more readable to add a dedicated helper for building/setting the
per-vCPU segment, and move the common data segment code to an inner
helper.

Lastly, hardcoding the selector reduces the probability of setting the
wrong selector in the vCPU versus what was created by the VM in the GDT.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../selftests/kvm/lib/x86_64/processor.c      | 29 +++++++++----------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/x86_64/processor.c b/tools/testing/selftests/kvm/lib/x86_64/processor.c
index dab719ee7734..6abd50d6e59d 100644
--- a/tools/testing/selftests/kvm/lib/x86_64/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86_64/processor.c
@@ -438,10 +438,10 @@ static void kvm_seg_fill_gdt_64bit(struct kvm_vm *vm, struct kvm_segment *segp)
 		desc->base3 = segp->base >> 32;
 }
 
-static void kvm_seg_set_kernel_code_64bit(uint16_t selector, struct kvm_segment *segp)
+static void kvm_seg_set_kernel_code_64bit(struct kvm_segment *segp)
 {
 	memset(segp, 0, sizeof(*segp));
-	segp->selector = selector;
+	segp->selector = KERNEL_CS;
 	segp->limit = 0xFFFFFFFFu;
 	segp->s = 0x1; /* kTypeCodeData */
 	segp->type = 0x08 | 0x01 | 0x02; /* kFlagCode | kFlagCodeAccessed
@@ -452,10 +452,10 @@ static void kvm_seg_set_kernel_code_64bit(uint16_t selector, struct kvm_segment
 	segp->present = 1;
 }
 
-static void kvm_seg_set_kernel_data_64bit(uint16_t selector, struct kvm_segment *segp)
+static void kvm_seg_set_kernel_data_64bit(struct kvm_segment *segp)
 {
 	memset(segp, 0, sizeof(*segp));
-	segp->selector = selector;
+	segp->selector = KERNEL_DS;
 	segp->limit = 0xFFFFFFFFu;
 	segp->s = 0x1; /* kTypeCodeData */
 	segp->type = 0x00 | 0x01 | 0x02; /* kFlagData | kFlagDataAccessed
@@ -480,13 +480,12 @@ vm_paddr_t addr_arch_gva2gpa(struct kvm_vm *vm, vm_vaddr_t gva)
 	return vm_untag_gpa(vm, PTE_GET_PA(*pte)) | (gva & ~HUGEPAGE_MASK(level));
 }
 
-static void kvm_seg_set_tss_64bit(vm_vaddr_t base, struct kvm_segment *segp,
-				  int selector)
+static void kvm_seg_set_tss_64bit(vm_vaddr_t base, struct kvm_segment *segp)
 {
 	memset(segp, 0, sizeof(*segp));
 	segp->base = base;
 	segp->limit = 0x67;
-	segp->selector = selector;
+	segp->selector = KERNEL_TSS;
 	segp->type = 0xb;
 	segp->present = 1;
 }
@@ -510,11 +509,11 @@ static void vcpu_init_sregs(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
 	sregs.efer |= (EFER_LME | EFER_LMA | EFER_NX);
 
 	kvm_seg_set_unusable(&sregs.ldt);
-	kvm_seg_set_kernel_code_64bit(KERNEL_CS, &sregs.cs);
-	kvm_seg_set_kernel_data_64bit(KERNEL_DS, &sregs.ds);
-	kvm_seg_set_kernel_data_64bit(KERNEL_DS, &sregs.es);
-	kvm_seg_set_kernel_data_64bit(KERNEL_DS, &sregs.gs);
-	kvm_seg_set_tss_64bit(vm->arch.tss, &sregs.tr, KERNEL_TSS);
+	kvm_seg_set_kernel_code_64bit(&sregs.cs);
+	kvm_seg_set_kernel_data_64bit(&sregs.ds);
+	kvm_seg_set_kernel_data_64bit(&sregs.es);
+	kvm_seg_set_kernel_data_64bit(&sregs.gs);
+	kvm_seg_set_tss_64bit(vm->arch.tss, &sregs.tr);
 
 	sregs.cr3 = vm->pgd;
 	vcpu_sregs_set(vcpu, &sregs);
@@ -588,13 +587,13 @@ static void vm_init_descriptor_tables(struct kvm_vm *vm)
 
 	*(vm_vaddr_t *)addr_gva2hva(vm, (vm_vaddr_t)(&exception_handlers)) = vm->handlers;
 
-	kvm_seg_set_kernel_code_64bit(KERNEL_CS, &seg);
+	kvm_seg_set_kernel_code_64bit(&seg);
 	kvm_seg_fill_gdt_64bit(vm, &seg);
 
-	kvm_seg_set_kernel_data_64bit(KERNEL_DS, &seg);
+	kvm_seg_set_kernel_data_64bit(&seg);
 	kvm_seg_fill_gdt_64bit(vm, &seg);
 
-	kvm_seg_set_tss_64bit(vm->arch.tss, &seg, KERNEL_TSS);
+	kvm_seg_set_tss_64bit(vm->arch.tss, &seg);
 	kvm_seg_fill_gdt_64bit(vm, &seg);
 }
 
-- 
2.44.0.291.gc1ea87d7ee-goog


