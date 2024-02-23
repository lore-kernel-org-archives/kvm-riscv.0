From: Sean Christopherson <seanjc@google.com>
Date: Thu, 22 Feb 2024 16:42:54 -0800
Subject: [PATCH v9 07/11] KVM: selftests: Allow tagging protected memory in
 guest page tables
In-Reply-To: <20240223004258.3104051-1-seanjc@google.com>
References: <20240223004258.3104051-1-seanjc@google.com>
Message-ID: <20240223004258.3104051-8-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Peter Gonda <pgonda@google.com>

Add support for tagging and untagging guest physical address, e.g. to
allow x86's SEV and TDX guests to embed shared vs. private information in
the GPA.  SEV (encryption, a.k.a. C-bit) and TDX (shared, a.k.a. S-bit)
steal bits from the guest's physical address space that is consumed by the
CPU metadata, i.e. effectively aliases the "real" GPA.

Implement generic "tagging" so that the shared vs. private metadata can be
managed by x86 without bleeding too many details into common code.

Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Sean Christopherson <seanjc@google.com>
Cc: Vishal Annapurve <vannapurve@google.com>
Cc: Ackerly Tng <ackerleytng@google.com>
cc: Andrew Jones <andrew.jones@linux.dev>
Cc: Tom Lendacky <thomas.lendacky@amd.com>
Cc: Michael Roth <michael.roth@amd.com>
Tested-by: Carlos Bilbao <carlos.bilbao@amd.com>
Originally-by: Michael Roth <michael.roth@amd.com>
Signed-off-by: Peter Gonda <pgonda@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../kvm/include/aarch64/kvm_util_arch.h       |  7 +++++++
 .../selftests/kvm/include/kvm_util_base.h     | 13 ++++++++++++
 .../kvm/include/riscv/kvm_util_arch.h         |  7 +++++++
 .../kvm/include/s390x/kvm_util_arch.h         |  7 +++++++
 .../kvm/include/x86_64/kvm_util_arch.h        | 21 +++++++++++++++++++
 tools/testing/selftests/kvm/lib/kvm_util.c    | 17 +++++++++++++++
 .../selftests/kvm/lib/x86_64/processor.c      | 15 ++++++++++++-
 7 files changed, 86 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/kvm/include/aarch64/kvm_util_arch.h
 create mode 100644 tools/testing/selftests/kvm/include/riscv/kvm_util_arch.h
 create mode 100644 tools/testing/selftests/kvm/include/s390x/kvm_util_arch.h
 create mode 100644 tools/testing/selftests/kvm/include/x86_64/kvm_util_arch.h

diff --git a/tools/testing/selftests/kvm/include/aarch64/kvm_util_arch.h b/tools/testing/selftests/kvm/include/aarch64/kvm_util_arch.h
new file mode 100644
index 000000000000..218f5cdf0d86
--- /dev/null
+++ b/tools/testing/selftests/kvm/include/aarch64/kvm_util_arch.h
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _TOOLS_LINUX_ASM_ARM64_KVM_HOST_H
+#define _TOOLS_LINUX_ASM_ARM64_KVM_HOST_H
+
+struct kvm_vm_arch {};
+
+#endif  // _TOOLS_LINUX_ASM_ARM64_KVM_HOST_H
diff --git a/tools/testing/selftests/kvm/include/kvm_util_base.h b/tools/testing/selftests/kvm/include/kvm_util_base.h
index cb3159af6db3..4b266dc0c9bd 100644
--- a/tools/testing/selftests/kvm/include/kvm_util_base.h
+++ b/tools/testing/selftests/kvm/include/kvm_util_base.h
@@ -18,9 +18,11 @@
 #include <linux/types.h>
 
 #include <asm/atomic.h>
+#include <asm/kvm.h>
 
 #include <sys/ioctl.h>
 
+#include "kvm_util_arch.h"
 #include "sparsebit.h"
 
 /*
@@ -113,6 +115,9 @@ struct kvm_vm {
 	vm_vaddr_t idt;
 	vm_vaddr_t handlers;
 	uint32_t dirty_ring_size;
+	uint64_t gpa_tag_mask;
+
+	struct kvm_vm_arch arch;
 
 	/* Cache of information for binary stats interface */
 	int stats_fd;
@@ -605,6 +610,12 @@ void *addr_gva2hva(struct kvm_vm *vm, vm_vaddr_t gva);
 vm_paddr_t addr_hva2gpa(struct kvm_vm *vm, void *hva);
 void *addr_gpa2alias(struct kvm_vm *vm, vm_paddr_t gpa);
 
+
+static inline vm_paddr_t vm_untag_gpa(struct kvm_vm *vm, vm_paddr_t gpa)
+{
+	return gpa & ~vm->gpa_tag_mask;
+}
+
 void vcpu_run(struct kvm_vcpu *vcpu);
 int _vcpu_run(struct kvm_vcpu *vcpu);
 
@@ -1114,4 +1125,6 @@ void kvm_selftest_arch_init(void);
 
 void kvm_arch_vm_post_create(struct kvm_vm *vm);
 
+bool vm_is_gpa_protected(struct kvm_vm *vm, vm_paddr_t paddr);
+
 #endif /* SELFTEST_KVM_UTIL_BASE_H */
diff --git a/tools/testing/selftests/kvm/include/riscv/kvm_util_arch.h b/tools/testing/selftests/kvm/include/riscv/kvm_util_arch.h
new file mode 100644
index 000000000000..c8280d5659ce
--- /dev/null
+++ b/tools/testing/selftests/kvm/include/riscv/kvm_util_arch.h
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _TOOLS_LINUX_ASM_RISCV_KVM_HOST_H
+#define _TOOLS_LINUX_ASM_RISCV_KVM_HOST_H
+
+struct kvm_vm_arch {};
+
+#endif  // _TOOLS_LINUX_ASM_RISCV_KVM_HOST_H
diff --git a/tools/testing/selftests/kvm/include/s390x/kvm_util_arch.h b/tools/testing/selftests/kvm/include/s390x/kvm_util_arch.h
new file mode 100644
index 000000000000..4c4c1c1e4bf8
--- /dev/null
+++ b/tools/testing/selftests/kvm/include/s390x/kvm_util_arch.h
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _TOOLS_LINUX_ASM_S390_KVM_HOST_H
+#define _TOOLS_LINUX_ASM_S390_KVM_HOST_H
+
+struct kvm_vm_arch {};
+
+#endif  // _TOOLS_LINUX_ASM_S390_KVM_HOST_H
diff --git a/tools/testing/selftests/kvm/include/x86_64/kvm_util_arch.h b/tools/testing/selftests/kvm/include/x86_64/kvm_util_arch.h
new file mode 100644
index 000000000000..17bb38236d97
--- /dev/null
+++ b/tools/testing/selftests/kvm/include/x86_64/kvm_util_arch.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _TOOLS_LINUX_ASM_X86_KVM_HOST_H
+#define _TOOLS_LINUX_ASM_X86_KVM_HOST_H
+
+#include <stdbool.h>
+#include <stdint.h>
+
+struct kvm_vm_arch {
+	uint64_t c_bit;
+	uint64_t s_bit;
+};
+
+static inline bool __vm_arch_has_protected_memory(struct kvm_vm_arch *arch)
+{
+	return arch->c_bit || arch->s_bit;
+}
+
+#define vm_arch_has_protected_memory(vm) \
+	__vm_arch_has_protected_memory(&(vm)->arch)
+
+#endif  // _TOOLS_LINUX_ASM_X86_KVM_HOST_H
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index e7f4f84f2e68..19511137d1ae 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -1597,6 +1597,8 @@ void *addr_gpa2hva(struct kvm_vm *vm, vm_paddr_t gpa)
 {
 	struct userspace_mem_region *region;
 
+	gpa = vm_untag_gpa(vm, gpa);
+
 	region = userspace_mem_region_find(vm, gpa, gpa);
 	if (!region) {
 		TEST_FAIL("No vm physical memory at 0x%lx", gpa);
@@ -2305,3 +2307,18 @@ void __attribute((constructor)) kvm_selftest_init(void)
 
 	kvm_selftest_arch_init();
 }
+
+bool vm_is_gpa_protected(struct kvm_vm *vm, vm_paddr_t paddr)
+{
+	sparsebit_idx_t pg = 0;
+	struct userspace_mem_region *region;
+
+	if (!vm_arch_has_protected_memory(vm))
+		return false;
+
+	region = userspace_mem_region_find(vm, paddr, paddr);
+	TEST_ASSERT(region, "No vm physical memory at 0x%lx", paddr);
+
+	pg = paddr >> vm->page_shift;
+	return sparsebit_is_set(region->protected_phy_pages, pg);
+}
diff --git a/tools/testing/selftests/kvm/lib/x86_64/processor.c b/tools/testing/selftests/kvm/lib/x86_64/processor.c
index 615d05247470..6c1d2c0ec584 100644
--- a/tools/testing/selftests/kvm/lib/x86_64/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86_64/processor.c
@@ -157,6 +157,8 @@ static uint64_t *virt_create_upper_pte(struct kvm_vm *vm,
 {
 	uint64_t *pte = virt_get_pte(vm, parent_pte, vaddr, current_level);
 
+	paddr = vm_untag_gpa(vm, paddr);
+
 	if (!(*pte & PTE_PRESENT_MASK)) {
 		*pte = PTE_PRESENT_MASK | PTE_WRITABLE_MASK;
 		if (current_level == target_level)
@@ -200,6 +202,8 @@ void __virt_pg_map(struct kvm_vm *vm, uint64_t vaddr, uint64_t paddr, int level)
 		    "Physical address beyond maximum supported,\n"
 		    "  paddr: 0x%lx vm->max_gfn: 0x%lx vm->page_size: 0x%x",
 		    paddr, vm->max_gfn, vm->page_size);
+	TEST_ASSERT(vm_untag_gpa(vm, paddr) == paddr,
+		    "Unexpected bits in paddr: %lx", paddr);
 
 	/*
 	 * Allocate upper level page tables, if not already present.  Return
@@ -222,6 +226,15 @@ void __virt_pg_map(struct kvm_vm *vm, uint64_t vaddr, uint64_t paddr, int level)
 	TEST_ASSERT(!(*pte & PTE_PRESENT_MASK),
 		    "PTE already present for 4k page at vaddr: 0x%lx", vaddr);
 	*pte = PTE_PRESENT_MASK | PTE_WRITABLE_MASK | (paddr & PHYSICAL_PAGE_MASK);
+
+	/*
+	 * Neither SEV nor TDX supports shared page tables, so only the final
+	 * leaf PTE needs manually set the C/S-bit.
+	 */
+	if (vm_is_gpa_protected(vm, paddr))
+		*pte |= vm->arch.c_bit;
+	else
+		*pte |= vm->arch.s_bit;
 }
 
 void virt_arch_pg_map(struct kvm_vm *vm, uint64_t vaddr, uint64_t paddr)
@@ -496,7 +509,7 @@ vm_paddr_t addr_arch_gva2gpa(struct kvm_vm *vm, vm_vaddr_t gva)
 	 * No need for a hugepage mask on the PTE, x86-64 requires the "unused"
 	 * address bits to be zero.
 	 */
-	return PTE_GET_PA(*pte) | (gva & ~HUGEPAGE_MASK(level));
+	return vm_untag_gpa(vm, PTE_GET_PA(*pte)) | (gva & ~HUGEPAGE_MASK(level));
 }
 
 static void kvm_setup_gdt(struct kvm_vm *vm, struct kvm_dtable *dt)
-- 
2.44.0.rc0.258.g7320e95886-goog


