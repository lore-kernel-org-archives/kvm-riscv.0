From: Sean Christopherson <seanjc@google.com>
Date: Wed, 31 Jan 2024 14:45:46 -0800
Subject: [RFC PATCH v1 1/8] KVM: selftests: x86: Fix bug in addr_arch_gva2gpa()
In-Reply-To: <20231102155111.28821-2-guang.zeng@intel.com>
References: <20231102155111.28821-1-guang.zeng@intel.com> <20231102155111.28821-2-guang.zeng@intel.com>
Message-ID: <ZbrNmoSiufn4RM9K@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Nov 02, 2023, Zeng Guang wrote:
> Fix the approach to get page map from gva to gpa.
> 
> If gva maps a 4-KByte page, current implementation of addr_arch_gva2gpa()
> will obtain wrong page size and cannot derive correct offset from the guest
> virtual address.
> 
> Meanwhile using HUGEPAGE_MASK(x) to calculate the offset within page
> (1G/2M/4K) mistakenly incorporates the upper part of 64-bit canonical
> linear address. That will work out improper guest physical address if
> translating guest virtual address in supervisor-mode address space.

The "Meanwhile ..." is a huge clue that this should be two separate patches.

> Signed-off-by: Zeng Guang <guang.zeng@intel.com>
> ---
>  tools/testing/selftests/kvm/lib/x86_64/processor.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/kvm/lib/x86_64/processor.c b/tools/testing/selftests/kvm/lib/x86_64/processor.c
> index d8288374078e..9f4b8c47edce 100644
> --- a/tools/testing/selftests/kvm/lib/x86_64/processor.c
> +++ b/tools/testing/selftests/kvm/lib/x86_64/processor.c
> @@ -293,6 +293,7 @@ uint64_t *__vm_get_page_table_entry(struct kvm_vm *vm, uint64_t vaddr,
>  	if (vm_is_target_pte(pde, level, PG_LEVEL_2M))
>  		return pde;
>  
> +	*level = PG_LEVEL_4K;
>  	return virt_get_pte(vm, pde, vaddr, PG_LEVEL_4K);
>  }
>  
> @@ -496,7 +497,7 @@ vm_paddr_t addr_arch_gva2gpa(struct kvm_vm *vm, vm_vaddr_t gva)
>  	 * No need for a hugepage mask on the PTE, x86-64 requires the "unused"
>  	 * address bits to be zero.
>  	 */
> -	return PTE_GET_PA(*pte) | (gva & ~HUGEPAGE_MASK(level));
> +	return PTE_GET_PA(*pte) | (gva & (HUGEPAGE_SIZE(level) - 1));

I think I would prefer to "fix" HUGEPAGE_MASK() and drop its incorporation of
PHYSICAL_PAGE_MASK.  Regardless of anyone's personal views on whether or not
PAGE_MASK and HUGEPAGE_MASK should only cover physical address bits, (a) the
_one_ usage of HUGEPAGE_MASK is broken and (b) diverging from the kernel for
something like is a terrible idea, and the kernel does:

	#define PAGE_MASK		(~(PAGE_SIZE-1))
	#define HPAGE_MASK		(~(HPAGE_SIZE - 1))
	#define KVM_HPAGE_MASK(x)	(~(KVM_HPAGE_SIZE(x) - 1))

Luckily, there are barely any users in x86, so I think the entirety of the
conversion is this?

diff --git a/tools/testing/selftests/kvm/include/x86_64/processor.h b/tools/testing/selftests/kvm/include/x86_64/processor.h
index 0f4792083d01..ef895038c87f 100644
--- a/tools/testing/selftests/kvm/include/x86_64/processor.h
+++ b/tools/testing/selftests/kvm/include/x86_64/processor.h
@@ -352,11 +352,12 @@ static inline unsigned int x86_model(unsigned int eax)
 
 #define PAGE_SHIFT             12
 #define PAGE_SIZE              (1ULL << PAGE_SHIFT)
-#define PAGE_MASK              (~(PAGE_SIZE-1) & PHYSICAL_PAGE_MASK)
+#define PAGE_MASK              (~(PAGE_SIZE-1))
+kvm_static_assert((PHYSICAL_PAGE_MASK & PAGE_MASK) == PHYSICAL_PAGE_MASK);
 
 #define HUGEPAGE_SHIFT(x)      (PAGE_SHIFT + (((x) - 1) * 9))
 #define HUGEPAGE_SIZE(x)       (1UL << HUGEPAGE_SHIFT(x))
-#define HUGEPAGE_MASK(x)       (~(HUGEPAGE_SIZE(x) - 1) & PHYSICAL_PAGE_MASK)
+#define HUGEPAGE_MASK(x)       (~(HUGEPAGE_SIZE(x) - 1))
 
 #define PTE_GET_PA(pte)                ((pte) & PHYSICAL_PAGE_MASK)
 #define PTE_GET_PFN(pte)        (PTE_GET_PA(pte) >> PAGE_SHIFT)
diff --git a/tools/testing/selftests/kvm/x86_64/hyperv_tlb_flush.c b/tools/testing/selftests/kvm/x86_64/hyperv_tlb_flush.c
index 05b56095cf76..cc5730322072 100644
--- a/tools/testing/selftests/kvm/x86_64/hyperv_tlb_flush.c
+++ b/tools/testing/selftests/kvm/x86_64/hyperv_tlb_flush.c
@@ -623,7 +623,7 @@ int main(int argc, char *argv[])
        for (i = 0; i < NTEST_PAGES; i++) {
                pte = vm_get_page_table_entry(vm, data->test_pages + i * PAGE_SIZE);
                gpa = addr_hva2gpa(vm, pte);
-               __virt_pg_map(vm, gva + PAGE_SIZE * i, gpa & PAGE_MASK, PG_LEVEL_4K);
+               __virt_pg_map(vm, gva + PAGE_SIZE * i, gpa & PHYSICAL_PAGE_MASK, PG_LEVEL_4K);
                data->test_pages_pte[i] = gva + (gpa & ~PAGE_MASK);
        }
 


