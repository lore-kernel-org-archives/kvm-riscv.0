From: Zeng Guang <guang.zeng@intel.com>
Date: Thu,  2 Nov 2023 23:51:04 +0800
Subject: [RFC PATCH v1 1/8] KVM: selftests: x86: Fix bug in addr_arch_gva2gpa()
In-Reply-To: <20231102155111.28821-1-guang.zeng@intel.com>
References: <20231102155111.28821-1-guang.zeng@intel.com>
Message-ID: <20231102155111.28821-2-guang.zeng@intel.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Fix the approach to get page map from gva to gpa.

If gva maps a 4-KByte page, current implementation of addr_arch_gva2gpa()
will obtain wrong page size and cannot derive correct offset from the guest
virtual address.

Meanwhile using HUGEPAGE_MASK(x) to calculate the offset within page
(1G/2M/4K) mistakenly incorporates the upper part of 64-bit canonical
linear address. That will work out improper guest physical address if
translating guest virtual address in supervisor-mode address space.

Signed-off-by: Zeng Guang <guang.zeng@intel.com>
---
 tools/testing/selftests/kvm/lib/x86_64/processor.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/lib/x86_64/processor.c b/tools/testing/selftests/kvm/lib/x86_64/processor.c
index d8288374078e..9f4b8c47edce 100644
--- a/tools/testing/selftests/kvm/lib/x86_64/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86_64/processor.c
@@ -293,6 +293,7 @@ uint64_t *__vm_get_page_table_entry(struct kvm_vm *vm, uint64_t vaddr,
 	if (vm_is_target_pte(pde, level, PG_LEVEL_2M))
 		return pde;
 
+	*level = PG_LEVEL_4K;
 	return virt_get_pte(vm, pde, vaddr, PG_LEVEL_4K);
 }
 
@@ -496,7 +497,7 @@ vm_paddr_t addr_arch_gva2gpa(struct kvm_vm *vm, vm_vaddr_t gva)
 	 * No need for a hugepage mask on the PTE, x86-64 requires the "unused"
 	 * address bits to be zero.
 	 */
-	return PTE_GET_PA(*pte) | (gva & ~HUGEPAGE_MASK(level));
+	return PTE_GET_PA(*pte) | (gva & (HUGEPAGE_SIZE(level) - 1));
 }
 
 static void kvm_setup_gdt(struct kvm_vm *vm, struct kvm_dtable *dt)
-- 
2.21.3


