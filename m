From: Sean Christopherson <seanjc@google.com>
Date: Wed, 31 Jan 2024 15:03:48 -0800
Subject: [RFC PATCH v1 2/8] KVM: selftests: x86: Support guest running on
 canonical linear-address organization
In-Reply-To: <20231102155111.28821-3-guang.zeng@intel.com>
References: <20231102155111.28821-1-guang.zeng@intel.com> <20231102155111.28821-3-guang.zeng@intel.com>
Message-ID: <ZbrR1BJROP4O9eGx@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Nov 02, 2023, Zeng Guang wrote:
> Setup execution environment running on 64-bit linear addresses for
> user and supervisor mode.
> 
> Define the linear address based on 48-bit canonical format in which
> bits 63:47 of the address are identical. All addresses to system data
> structure are shifted to supervisor-mode address space.
> 
> Extend page table mapping for supervisor mode to same guest physical
> address. This allows guest in supervisor mode can run in the
> corresponding canonical linear address space.
> 
> Signed-off-by: Zeng Guang <guang.zeng@intel.com>
> ---
>  .../selftests/kvm/include/x86_64/processor.h  |  6 ++++
>  tools/testing/selftests/kvm/lib/kvm_util.c    |  6 ++--
>  .../selftests/kvm/lib/x86_64/processor.c      | 28 ++++++++++++-------
>  3 files changed, 28 insertions(+), 12 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/include/x86_64/processor.h b/tools/testing/selftests/kvm/include/x86_64/processor.h
> index 25bc61dac5fb..00f7337a520a 100644
> --- a/tools/testing/selftests/kvm/include/x86_64/processor.h
> +++ b/tools/testing/selftests/kvm/include/x86_64/processor.h
> @@ -1256,4 +1256,10 @@ void virt_map_level(struct kvm_vm *vm, uint64_t vaddr, uint64_t paddr,
>  #define PFERR_GUEST_PAGE_MASK	BIT_ULL(PFERR_GUEST_PAGE_BIT)
>  #define PFERR_IMPLICIT_ACCESS	BIT_ULL(PFERR_IMPLICIT_ACCESS_BIT)
>  
> +/*
> + * X86 kernel linear address defines
> + */
> +#define KERNEL_LNA_OFFSET 0xffff800000000000

Please don't make up acronyms, I can more or less glean what LNA is from the
context _here_, but in other usage I would truly have no idea.

> diff --git a/tools/testing/selftests/kvm/lib/x86_64/processor.c b/tools/testing/selftests/kvm/lib/x86_64/processor.c
> index 9f4b8c47edce..6f4295a13d00 100644
> --- a/tools/testing/selftests/kvm/lib/x86_64/processor.c
> +++ b/tools/testing/selftests/kvm/lib/x86_64/processor.c
> @@ -227,6 +227,13 @@ void __virt_pg_map(struct kvm_vm *vm, uint64_t vaddr, uint64_t paddr, int level)
>  void virt_arch_pg_map(struct kvm_vm *vm, uint64_t vaddr, uint64_t paddr)
>  {
>  	__virt_pg_map(vm, vaddr, paddr, PG_LEVEL_4K);
> +
> +	/*
> +	 * Map same paddr to kernel linear address space. Make execution
> +	 * environment supporting running both in user and kernel mode.
> +	 */
> +	if (!(vaddr & BIT_ULL(63)))
> +		__virt_pg_map(vm, (uint64_t)KERNEL_ADDR(vaddr), paddr, PG_LEVEL_4K);

I really don't like the idea of piling hacks on top of selftests' misguided
infrastructure.  Letting tests control virtual addresses is all kinds of stupid.
Except for ARM's ucall_arch_init(), I don't think there's a single user of
virt_map() that _needs_ a specific address, e.g. most tests just identity map
the GPA.

So rather than fudge things by stuffing two mappings, which is wasteful for 99%
of mappings and will likely be a maintenance nightmare, I think we should go
straight to getting x86's kernel mappings setup correctly from time zero.

From KUT experience, using USER mappings for kernel accesses is explosions waiting
to happen due to SMAP and SMEP.  And expecting developers to remember to sprinkle
KERNEL_ADDR() everywhere is not remotely maintainable.

In other words, give virt_arch_pg_map() (or ideally, the common virt_map()) over
picking the virtual address, and then plumb in information as to whether the
allocation is USER vs. SUPERVISOR.

