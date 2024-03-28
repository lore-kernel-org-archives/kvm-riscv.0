From: Ackerley Tng <ackerleytng@google.com>
Date: Thu, 28 Mar 2024 02:48:08 +0000
Subject: [PATCH 03/18] KVM: selftests: Move GDT, IDT, and TSS fields to
 x86's kvm_vm_arch
In-Reply-To: <20240314232637.2538648-4-seanjc@google.com>
References: <20240314232637.2538648-1-seanjc@google.com> <20240314232637.2538648-4-seanjc@google.com>
Message-ID: <diqzo7azkr6f.fsf@ctop-sg.c.googlers.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Sean Christopherson <seanjc@google.com> writes:

> Now that kvm_vm_arch exists, move the GDT, IDT, and TSS fields to x86's
> implementation, as the structures are firmly x86-only.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  .../testing/selftests/kvm/include/kvm_util.h  |  3 ---
>  .../kvm/include/x86_64/kvm_util_arch.h        |  6 +++++
>  .../selftests/kvm/lib/x86_64/processor.c      | 22 +++++++++----------
>  .../kvm/x86_64/svm_nested_shutdown_test.c     |  2 +-
>  .../kvm/x86_64/svm_nested_soft_inject_test.c  |  2 +-
>  5 files changed, 19 insertions(+), 16 deletions(-)
>
> diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
> index acdcddf78e3f..58d6a4d6ce4f 100644
> --- a/tools/testing/selftests/kvm/include/kvm_util.h
> +++ b/tools/testing/selftests/kvm/include/kvm_util.h
> @@ -94,9 +94,6 @@ struct kvm_vm {
>  	bool pgd_created;
>  	vm_paddr_t ucall_mmio_addr;
>  	vm_paddr_t pgd;
> -	vm_vaddr_t gdt;
> -	vm_vaddr_t tss;
> -	vm_vaddr_t idt;
>  	vm_vaddr_t handlers;
>  	uint32_t dirty_ring_size;
>  	uint64_t gpa_tag_mask;
> diff --git a/tools/testing/selftests/kvm/include/x86_64/kvm_util_arch.h b/tools/testing/selftests/kvm/include/x86_64/kvm_util_arch.h
> index 9f1725192aa2..b14ff3a88b4a 100644
> --- a/tools/testing/selftests/kvm/include/x86_64/kvm_util_arch.h
> +++ b/tools/testing/selftests/kvm/include/x86_64/kvm_util_arch.h
> @@ -5,7 +5,13 @@
>  #include <stdbool.h>
>  #include <stdint.h>
>  
> +#include "kvm_util_types.h"
> +
>  struct kvm_vm_arch {
> +	vm_vaddr_t gdt;
> +	vm_vaddr_t tss;
> +	vm_vaddr_t idt;
> +
>  	uint64_t c_bit;
>  	uint64_t s_bit;
>  	int sev_fd;
> diff --git a/tools/testing/selftests/kvm/lib/x86_64/processor.c b/tools/testing/selftests/kvm/lib/x86_64/processor.c
> index 74a4c736c9ae..45f965c052a1 100644
> --- a/tools/testing/selftests/kvm/lib/x86_64/processor.c
> +++ b/tools/testing/selftests/kvm/lib/x86_64/processor.c
> @@ -417,7 +417,7 @@ static void kvm_seg_set_unusable(struct kvm_segment *segp)
>  
>  static void kvm_seg_fill_gdt_64bit(struct kvm_vm *vm, struct kvm_segment *segp)
>  {
> -	void *gdt = addr_gva2hva(vm, vm->gdt);
> +	void *gdt = addr_gva2hva(vm, vm->arch.gdt);
>  	struct desc64 *desc = gdt + (segp->selector >> 3) * 8;
>  
>  	desc->limit0 = segp->limit & 0xFFFF;
> @@ -518,21 +518,21 @@ vm_paddr_t addr_arch_gva2gpa(struct kvm_vm *vm, vm_vaddr_t gva)
>  
>  static void kvm_setup_gdt(struct kvm_vm *vm, struct kvm_dtable *dt)
>  {
> -	if (!vm->gdt)
> -		vm->gdt = __vm_vaddr_alloc_page(vm, MEM_REGION_DATA);
> +	if (!vm->arch.gdt)
> +		vm->arch.gdt = __vm_vaddr_alloc_page(vm, MEM_REGION_DATA);
>  
> -	dt->base = vm->gdt;
> +	dt->base = vm->arch.gdt;
>  	dt->limit = getpagesize();
>  }
>  
>  static void kvm_setup_tss_64bit(struct kvm_vm *vm, struct kvm_segment *segp,
>  				int selector)
>  {
> -	if (!vm->tss)
> -		vm->tss = __vm_vaddr_alloc_page(vm, MEM_REGION_DATA);
> +	if (!vm->arch.tss)
> +		vm->arch.tss = __vm_vaddr_alloc_page(vm, MEM_REGION_DATA);
>  
>  	memset(segp, 0, sizeof(*segp));
> -	segp->base = vm->tss;
> +	segp->base = vm->arch.tss;
>  	segp->limit = 0x67;
>  	segp->selector = selector;
>  	segp->type = 0xb;
> @@ -1091,7 +1091,7 @@ static void set_idt_entry(struct kvm_vm *vm, int vector, unsigned long addr,
>  			  int dpl, unsigned short selector)
>  {
>  	struct idt_entry *base =
> -		(struct idt_entry *)addr_gva2hva(vm, vm->idt);
> +		(struct idt_entry *)addr_gva2hva(vm, vm->arch.idt);
>  	struct idt_entry *e = &base[vector];
>  
>  	memset(e, 0, sizeof(*e));
> @@ -1144,7 +1144,7 @@ void vm_init_descriptor_tables(struct kvm_vm *vm)
>  	extern void *idt_handlers;
>  	int i;
>  
> -	vm->idt = __vm_vaddr_alloc_page(vm, MEM_REGION_DATA);
> +	vm->arch.idt = __vm_vaddr_alloc_page(vm, MEM_REGION_DATA);
>  	vm->handlers = __vm_vaddr_alloc_page(vm, MEM_REGION_DATA);
>  	/* Handlers have the same address in both address spaces.*/
>  	for (i = 0; i < NUM_INTERRUPTS; i++)
> @@ -1158,9 +1158,9 @@ void vcpu_init_descriptor_tables(struct kvm_vcpu *vcpu)
>  	struct kvm_sregs sregs;
>  
>  	vcpu_sregs_get(vcpu, &sregs);
> -	sregs.idt.base = vm->idt;
> +	sregs.idt.base = vm->arch.idt;
>  	sregs.idt.limit = NUM_INTERRUPTS * sizeof(struct idt_entry) - 1;
> -	sregs.gdt.base = vm->gdt;
> +	sregs.gdt.base = vm->arch.gdt;
>  	sregs.gdt.limit = getpagesize() - 1;
>  	kvm_seg_set_kernel_data_64bit(NULL, DEFAULT_DATA_SELECTOR, &sregs.gs);
>  	vcpu_sregs_set(vcpu, &sregs);
> diff --git a/tools/testing/selftests/kvm/x86_64/svm_nested_shutdown_test.c b/tools/testing/selftests/kvm/x86_64/svm_nested_shutdown_test.c
> index d6fcdcc3af31..f4a1137e04ab 100644
> --- a/tools/testing/selftests/kvm/x86_64/svm_nested_shutdown_test.c
> +++ b/tools/testing/selftests/kvm/x86_64/svm_nested_shutdown_test.c
> @@ -53,7 +53,7 @@ int main(int argc, char *argv[])
>  
>  	vcpu_alloc_svm(vm, &svm_gva);
>  
> -	vcpu_args_set(vcpu, 2, svm_gva, vm->idt);
> +	vcpu_args_set(vcpu, 2, svm_gva, vm->arch.idt);
>  
>  	vcpu_run(vcpu);
>  	TEST_ASSERT_KVM_EXIT_REASON(vcpu, KVM_EXIT_SHUTDOWN);
> diff --git a/tools/testing/selftests/kvm/x86_64/svm_nested_soft_inject_test.c b/tools/testing/selftests/kvm/x86_64/svm_nested_soft_inject_test.c
> index 0c7ce3d4e83a..2478a9e50743 100644
> --- a/tools/testing/selftests/kvm/x86_64/svm_nested_soft_inject_test.c
> +++ b/tools/testing/selftests/kvm/x86_64/svm_nested_soft_inject_test.c
> @@ -166,7 +166,7 @@ static void run_test(bool is_nmi)
>  
>  		idt_alt_vm = vm_vaddr_alloc_page(vm);
>  		idt_alt = addr_gva2hva(vm, idt_alt_vm);
> -		idt = addr_gva2hva(vm, vm->idt);
> +		idt = addr_gva2hva(vm, vm->arch.idt);
>  		memcpy(idt_alt, idt, getpagesize());
>  	} else {
>  		idt_alt_vm = 0;
> -- 
> 2.44.0.291.gc1ea87d7ee-goog

Reviewed-by: Ackerley Tng <ackerleytng@google.com>

