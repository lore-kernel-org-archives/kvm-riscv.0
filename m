From: Ackerley Tng <ackerleytng@google.com>
Date: Thu, 28 Mar 2024 02:51:32 +0000
Subject: [PATCH 17/18] KVM: selftests: Init x86's segments during VM creation
In-Reply-To: <20240314232637.2538648-18-seanjc@google.com>
References: <20240314232637.2538648-1-seanjc@google.com> <20240314232637.2538648-18-seanjc@google.com>
Message-ID: <diqz7chnkr0r.fsf@ctop-sg.c.googlers.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Sean Christopherson <seanjc@google.com> writes:

> Initialize x86's various segments in the GDT during creation of relevant
> VMs instead of waiting until vCPUs come along.  Re-installing the segments
> for every vCPU is both wasteful and confusing, as is installing KERNEL_DS
> multiple times; NOT installing KERNEL_DS for GS is icing on the cake.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  .../selftests/kvm/lib/x86_64/processor.c      | 68 ++++++-------------
>  1 file changed, 20 insertions(+), 48 deletions(-)
>
> diff --git a/tools/testing/selftests/kvm/lib/x86_64/processor.c b/tools/testing/selftests/kvm/lib/x86_64/processor.c
> index 67235013f6f9..dab719ee7734 100644
> --- a/tools/testing/selftests/kvm/lib/x86_64/processor.c
> +++ b/tools/testing/selftests/kvm/lib/x86_64/processor.c
> @@ -438,24 +438,7 @@ static void kvm_seg_fill_gdt_64bit(struct kvm_vm *vm, struct kvm_segment *segp)
>  		desc->base3 = segp->base >> 32;
>  }
>  
> -
> -/*
> - * Set Long Mode Flat Kernel Code Segment
> - *
> - * Input Args:
> - *   vm - VM whose GDT is being filled, or NULL to only write segp
> - *   selector - selector value
> - *
> - * Output Args:
> - *   segp - Pointer to KVM segment
> - *
> - * Return: None
> - *
> - * Sets up the KVM segment pointed to by @segp, to be a code segment
> - * with the selector value given by @selector.
> - */
> -static void kvm_seg_set_kernel_code_64bit(struct kvm_vm *vm, uint16_t selector,
> -	struct kvm_segment *segp)
> +static void kvm_seg_set_kernel_code_64bit(uint16_t selector, struct kvm_segment *segp)
>  {
>  	memset(segp, 0, sizeof(*segp));
>  	segp->selector = selector;
> @@ -467,27 +450,9 @@ static void kvm_seg_set_kernel_code_64bit(struct kvm_vm *vm, uint16_t selector,
>  	segp->g = true;
>  	segp->l = true;
>  	segp->present = 1;
> -	if (vm)
> -		kvm_seg_fill_gdt_64bit(vm, segp);
>  }
>  
> -/*
> - * Set Long Mode Flat Kernel Data Segment
> - *
> - * Input Args:
> - *   vm - VM whose GDT is being filled, or NULL to only write segp
> - *   selector - selector value
> - *
> - * Output Args:
> - *   segp - Pointer to KVM segment
> - *
> - * Return: None
> - *
> - * Sets up the KVM segment pointed to by @segp, to be a data segment
> - * with the selector value given by @selector.
> - */
> -static void kvm_seg_set_kernel_data_64bit(struct kvm_vm *vm, uint16_t selector,
> -	struct kvm_segment *segp)
> +static void kvm_seg_set_kernel_data_64bit(uint16_t selector, struct kvm_segment *segp)
>  {
>  	memset(segp, 0, sizeof(*segp));
>  	segp->selector = selector;
> @@ -498,8 +463,6 @@ static void kvm_seg_set_kernel_data_64bit(struct kvm_vm *vm, uint16_t selector,
>  					  */
>  	segp->g = true;
>  	segp->present = true;
> -	if (vm)
> -		kvm_seg_fill_gdt_64bit(vm, segp);
>  }
>  
>  vm_paddr_t addr_arch_gva2gpa(struct kvm_vm *vm, vm_vaddr_t gva)
> @@ -517,16 +480,15 @@ vm_paddr_t addr_arch_gva2gpa(struct kvm_vm *vm, vm_vaddr_t gva)
>  	return vm_untag_gpa(vm, PTE_GET_PA(*pte)) | (gva & ~HUGEPAGE_MASK(level));
>  }
>  
> -static void kvm_setup_tss_64bit(struct kvm_vm *vm, struct kvm_segment *segp,
> -				int selector)
> +static void kvm_seg_set_tss_64bit(vm_vaddr_t base, struct kvm_segment *segp,
> +				  int selector)
>  {
>  	memset(segp, 0, sizeof(*segp));
> -	segp->base = vm->arch.tss;
> +	segp->base = base;
>  	segp->limit = 0x67;
>  	segp->selector = selector;
>  	segp->type = 0xb;
>  	segp->present = 1;
> -	kvm_seg_fill_gdt_64bit(vm, segp);
>  }
>  
>  static void vcpu_init_sregs(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
> @@ -548,11 +510,11 @@ static void vcpu_init_sregs(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
>  	sregs.efer |= (EFER_LME | EFER_LMA | EFER_NX);
>  
>  	kvm_seg_set_unusable(&sregs.ldt);
> -	kvm_seg_set_kernel_code_64bit(vm, KERNEL_CS, &sregs.cs);
> -	kvm_seg_set_kernel_data_64bit(vm, KERNEL_DS, &sregs.ds);
> -	kvm_seg_set_kernel_data_64bit(vm, KERNEL_DS, &sregs.es);
> -	kvm_seg_set_kernel_data_64bit(NULL, KERNEL_DS, &sregs.gs);
> -	kvm_setup_tss_64bit(vm, &sregs.tr, KERNEL_TSS);
> +	kvm_seg_set_kernel_code_64bit(KERNEL_CS, &sregs.cs);
> +	kvm_seg_set_kernel_data_64bit(KERNEL_DS, &sregs.ds);
> +	kvm_seg_set_kernel_data_64bit(KERNEL_DS, &sregs.es);
> +	kvm_seg_set_kernel_data_64bit(KERNEL_DS, &sregs.gs);
> +	kvm_seg_set_tss_64bit(vm->arch.tss, &sregs.tr, KERNEL_TSS);
>  
>  	sregs.cr3 = vm->pgd;
>  	vcpu_sregs_set(vcpu, &sregs);
> @@ -612,6 +574,7 @@ void route_exception(struct ex_regs *regs)
>  static void vm_init_descriptor_tables(struct kvm_vm *vm)
>  {
>  	extern void *idt_handlers;
> +	struct kvm_segment seg;
>  	int i;
>  
>  	vm->arch.gdt = __vm_vaddr_alloc_page(vm, MEM_REGION_DATA);
> @@ -624,6 +587,15 @@ static void vm_init_descriptor_tables(struct kvm_vm *vm)
>  		set_idt_entry(vm, i, (unsigned long)(&idt_handlers)[i], 0, KERNEL_CS);
>  
>  	*(vm_vaddr_t *)addr_gva2hva(vm, (vm_vaddr_t)(&exception_handlers)) = vm->handlers;
> +
> +	kvm_seg_set_kernel_code_64bit(KERNEL_CS, &seg);
> +	kvm_seg_fill_gdt_64bit(vm, &seg);
> +
> +	kvm_seg_set_kernel_data_64bit(KERNEL_DS, &seg);
> +	kvm_seg_fill_gdt_64bit(vm, &seg);
> +
> +	kvm_seg_set_tss_64bit(vm->arch.tss, &seg, KERNEL_TSS);
> +	kvm_seg_fill_gdt_64bit(vm, &seg);
>  }
>  
>  void vm_install_exception_handler(struct kvm_vm *vm, int vector,
> -- 
> 2.44.0.291.gc1ea87d7ee-goog

Reviewed-by: Ackerley Tng <ackerleytng@google.com>

