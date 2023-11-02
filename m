From: Zeng Guang <guang.zeng@intel.com>
Date: Thu,  2 Nov 2023 23:51:09 +0800
Subject: [RFC PATCH v1 6/8] KVM: selftests: x86: Allow user to access user-mode address and I/O address space
In-Reply-To: <20231102155111.28821-1-guang.zeng@intel.com>
References: <20231102155111.28821-1-guang.zeng@intel.com>
Message-ID: <20231102155111.28821-7-guang.zeng@intel.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Configure the U/S bit in paging-structure entries according to operation
mode and delimit user has user-mode access only to user-mode address
space.

Similarly set I/O privilege level as ring 3 in EFLAGS register to allow
user to access the I/O address space.

Signed-off-by: Zeng Guang <guang.zeng@intel.com>
---
 .../selftests/kvm/include/x86_64/processor.h   |  3 ++-
 .../selftests/kvm/lib/x86_64/processor.c       | 18 +++++++++++++++---
 2 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/x86_64/processor.h b/tools/testing/selftests/kvm/include/x86_64/processor.h
index 4b167e3e0370..9c8224c80664 100644
--- a/tools/testing/selftests/kvm/include/x86_64/processor.h
+++ b/tools/testing/selftests/kvm/include/x86_64/processor.h
@@ -24,7 +24,8 @@ extern bool host_cpu_is_amd;
 
 #define NMI_VECTOR		0x02
 
-#define X86_EFLAGS_FIXED	 (1u << 1)
+#define X86_EFLAGS_FIXED	(1u << 1)
+#define X86_EFLAGS_IOPL		(3u << 12)
 
 #define X86_CR4_VME		(1ul << 0)
 #define X86_CR4_PVI		(1ul << 1)
diff --git a/tools/testing/selftests/kvm/lib/x86_64/processor.c b/tools/testing/selftests/kvm/lib/x86_64/processor.c
index 487e1f829031..7647c3755ca2 100644
--- a/tools/testing/selftests/kvm/lib/x86_64/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86_64/processor.c
@@ -117,6 +117,14 @@ static void sregs_dump(FILE *stream, struct kvm_sregs *sregs, uint8_t indent)
 	}
 }
 
+static bool gva_is_kernel_addr(uint64_t gva)
+{
+	if (gva & BIT_ULL(63))
+		return true;
+
+	return false;
+}
+
 bool kvm_is_tdp_enabled(void)
 {
 	if (host_cpu_is_intel)
@@ -161,7 +169,8 @@ static uint64_t *virt_create_upper_pte(struct kvm_vm *vm,
 	uint64_t *pte = virt_get_pte(vm, parent_pte, vaddr, current_level);
 
 	if (!(*pte & PTE_PRESENT_MASK)) {
-		*pte = PTE_PRESENT_MASK | PTE_WRITABLE_MASK;
+		*pte = PTE_PRESENT_MASK | PTE_WRITABLE_MASK |
+		       (gva_is_kernel_addr(vaddr) ? 0 : PTE_USER_MASK);
 		if (current_level == target_level)
 			*pte |= PTE_LARGE_MASK | (paddr & PHYSICAL_PAGE_MASK);
 		else
@@ -224,7 +233,8 @@ void __virt_pg_map(struct kvm_vm *vm, uint64_t vaddr, uint64_t paddr, int level)
 	pte = virt_get_pte(vm, pde, vaddr, PG_LEVEL_4K);
 	TEST_ASSERT(!(*pte & PTE_PRESENT_MASK),
 		    "PTE already present for 4k page@vaddr: 0x%lx\n", vaddr);
-	*pte = PTE_PRESENT_MASK | PTE_WRITABLE_MASK | (paddr & PHYSICAL_PAGE_MASK);
+	*pte = PTE_PRESENT_MASK | PTE_WRITABLE_MASK | (paddr & PHYSICAL_PAGE_MASK) |
+	       (gva_is_kernel_addr(vaddr) ? 0 : PTE_USER_MASK);
 }
 
 void virt_arch_pg_map(struct kvm_vm *vm, uint64_t vaddr, uint64_t paddr)
@@ -630,7 +640,9 @@ struct kvm_vcpu *vm_arch_vcpu_add(struct kvm_vm *vm, uint32_t vcpu_id,
 
 	/* Setup guest general purpose registers */
 	vcpu_regs_get(vcpu, &regs);
-	regs.rflags = regs.rflags | 0x2;
+
+	/* Allow user privilege to access the I/O address space */
+	regs.rflags = regs.rflags | X86_EFLAGS_FIXED | X86_EFLAGS_IOPL;
 	regs.rsp = (unsigned long)KERNEL_ADDR(stack_vaddr);
 	regs.rip = (unsigned long)KERNEL_ADDR(guest_code);
 	vcpu_regs_set(vcpu, &regs);
-- 
2.21.3


