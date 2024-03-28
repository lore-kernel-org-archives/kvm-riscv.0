From: Ackerley Tng <ackerleytng@google.com>
Date: Thu, 28 Mar 2024 02:33:36 +0000
Subject: [PATCH 12/18] KVM: selftests: Allocate x86's GDT during VM creation
In-Reply-To: <20240314232637.2538648-13-seanjc@google.com>
References: <20240314232637.2538648-1-seanjc@google.com> <20240314232637.2538648-13-seanjc@google.com>
Message-ID: <diqz4jcrm6f3.fsf@ctop-sg.c.googlers.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Sean Christopherson <seanjc@google.com> writes:

> Allocate the GDT during creation of non-barebones VMs instead of waiting
> until the first vCPU is created, as the whole point of non-barebones VMs
> is to be able to run vCPUs, i.e. the GDT is going to get allocated no
> matter what.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  tools/testing/selftests/kvm/lib/x86_64/processor.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/tools/testing/selftests/kvm/lib/x86_64/processor.c b/tools/testing/selftests/kvm/lib/x86_64/processor.c
> index f4046029f168..8547833ffa26 100644
> --- a/tools/testing/selftests/kvm/lib/x86_64/processor.c
> +++ b/tools/testing/selftests/kvm/lib/x86_64/processor.c
> @@ -518,9 +518,6 @@ vm_paddr_t addr_arch_gva2gpa(struct kvm_vm *vm, vm_vaddr_t gva)
>  
>  static void kvm_setup_gdt(struct kvm_vm *vm, struct kvm_dtable *dt)
>  {
> -	if (!vm->arch.gdt)
> -		vm->arch.gdt = __vm_vaddr_alloc_page(vm, MEM_REGION_DATA);
> -
>  	dt->base = vm->arch.gdt;
>  	dt->limit = getpagesize() - 1;
>  }
> @@ -644,6 +641,7 @@ static void vm_init_descriptor_tables(struct kvm_vm *vm)
>  	extern void *idt_handlers;
>  	int i;
>  
> +	vm->arch.gdt = __vm_vaddr_alloc_page(vm, MEM_REGION_DATA);
>  	vm->arch.idt = __vm_vaddr_alloc_page(vm, MEM_REGION_DATA);
>  	vm->handlers = __vm_vaddr_alloc_page(vm, MEM_REGION_DATA);
>  	/* Handlers have the same address in both address spaces.*/
> -- 
> 2.44.0.291.gc1ea87d7ee-goog

Reviewed-by: Ackerley Tng <ackerleytng@google.com>

