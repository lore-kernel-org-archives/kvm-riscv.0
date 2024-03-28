From: Ackerley Tng <ackerleytng@google.com>
Date: Thu, 28 Mar 2024 02:47:23 +0000
Subject: [PATCH 08/18] KVM: selftests: Move x86's descriptor table helpers
 "up" in processor.c
In-Reply-To: <20240314232637.2538648-9-seanjc@google.com>
References: <20240314232637.2538648-1-seanjc@google.com> <20240314232637.2538648-9-seanjc@google.com>
Message-ID: <diqzr0fvkr7o.fsf@ctop-sg.c.googlers.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Sean Christopherson <seanjc@google.com> writes:

> Move x86's various descriptor table helpers in processor.c up above
> kvm_arch_vm_post_create() and vcpu_setup() so that the helpers can be
> made static and invoked from the aforementioned functions.
>
> No functional change intended.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  .../selftests/kvm/lib/x86_64/processor.c      | 191 +++++++++---------
>  1 file changed, 95 insertions(+), 96 deletions(-)
>
> diff --git a/tools/testing/selftests/kvm/lib/x86_64/processor.c b/tools/testing/selftests/kvm/lib/x86_64/processor.c
> index eaeba907bb53..3640d3290f0a 100644
> --- a/tools/testing/selftests/kvm/lib/x86_64/processor.c
> +++ b/tools/testing/selftests/kvm/lib/x86_64/processor.c
> @@ -540,6 +540,21 @@ static void kvm_setup_tss_64bit(struct kvm_vm *vm, struct kvm_segment *segp,
>  	kvm_seg_fill_gdt_64bit(vm, segp);
>  }
>  
> +void vcpu_init_descriptor_tables(struct kvm_vcpu *vcpu)
> +{
> +	struct kvm_vm *vm = vcpu->vm;
> +	struct kvm_sregs sregs;
> +
> +	vcpu_sregs_get(vcpu, &sregs);
> +	sregs.idt.base = vm->arch.idt;
> +	sregs.idt.limit = NUM_INTERRUPTS * sizeof(struct idt_entry) - 1;
> +	sregs.gdt.base = vm->arch.gdt;
> +	sregs.gdt.limit = getpagesize() - 1;
> +	kvm_seg_set_kernel_data_64bit(NULL, DEFAULT_DATA_SELECTOR, &sregs.gs);
> +	vcpu_sregs_set(vcpu, &sregs);
> +	*(vm_vaddr_t *)addr_gva2hva(vm, (vm_vaddr_t)(&exception_handlers)) = vm->handlers;
> +}
> +
>  static void vcpu_setup(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
>  {
>  	struct kvm_sregs sregs;
> @@ -572,6 +587,86 @@ static void vcpu_setup(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
>  	vcpu_sregs_set(vcpu, &sregs);
>  }
>  
> +static void set_idt_entry(struct kvm_vm *vm, int vector, unsigned long addr,
> +			  int dpl, unsigned short selector)
> +{
> +	struct idt_entry *base =
> +		(struct idt_entry *)addr_gva2hva(vm, vm->arch.idt);
> +	struct idt_entry *e = &base[vector];
> +
> +	memset(e, 0, sizeof(*e));
> +	e->offset0 = addr;
> +	e->selector = selector;
> +	e->ist = 0;
> +	e->type = 14;
> +	e->dpl = dpl;
> +	e->p = 1;
> +	e->offset1 = addr >> 16;
> +	e->offset2 = addr >> 32;
> +}
> +
> +static bool kvm_fixup_exception(struct ex_regs *regs)
> +{
> +	if (regs->r9 != KVM_EXCEPTION_MAGIC || regs->rip != regs->r10)
> +		return false;
> +
> +	if (regs->vector == DE_VECTOR)
> +		return false;
> +
> +	regs->rip = regs->r11;
> +	regs->r9 = regs->vector;
> +	regs->r10 = regs->error_code;
> +	return true;
> +}
> +
> +void route_exception(struct ex_regs *regs)
> +{
> +	typedef void(*handler)(struct ex_regs *);
> +	handler *handlers = (handler *)exception_handlers;
> +
> +	if (handlers && handlers[regs->vector]) {
> +		handlers[regs->vector](regs);
> +		return;
> +	}
> +
> +	if (kvm_fixup_exception(regs))
> +		return;
> +
> +	ucall_assert(UCALL_UNHANDLED,
> +		     "Unhandled exception in guest", __FILE__, __LINE__,
> +		     "Unhandled exception '0x%lx' at guest RIP '0x%lx'",
> +		     regs->vector, regs->rip);
> +}
> +
> +void vm_init_descriptor_tables(struct kvm_vm *vm)
> +{
> +	extern void *idt_handlers;
> +	int i;
> +
> +	vm->arch.idt = __vm_vaddr_alloc_page(vm, MEM_REGION_DATA);
> +	vm->handlers = __vm_vaddr_alloc_page(vm, MEM_REGION_DATA);
> +	/* Handlers have the same address in both address spaces.*/
> +	for (i = 0; i < NUM_INTERRUPTS; i++)
> +		set_idt_entry(vm, i, (unsigned long)(&idt_handlers)[i], 0,
> +			DEFAULT_CODE_SELECTOR);
> +}
> +
> +void vm_install_exception_handler(struct kvm_vm *vm, int vector,
> +			       void (*handler)(struct ex_regs *))
> +{
> +	vm_vaddr_t *handlers = (vm_vaddr_t *)addr_gva2hva(vm, vm->handlers);
> +
> +	handlers[vector] = (vm_vaddr_t)handler;
> +}
> +
> +void assert_on_unhandled_exception(struct kvm_vcpu *vcpu)
> +{
> +	struct ucall uc;
> +
> +	if (get_ucall(vcpu, &uc) == UCALL_UNHANDLED)
> +		REPORT_GUEST_ASSERT(uc);
> +}
> +
>  void kvm_arch_vm_post_create(struct kvm_vm *vm)
>  {
>  	vm_create_irqchip(vm);
> @@ -1087,102 +1182,6 @@ void kvm_init_vm_address_properties(struct kvm_vm *vm)
>  	}
>  }
>  
> -static void set_idt_entry(struct kvm_vm *vm, int vector, unsigned long addr,
> -			  int dpl, unsigned short selector)
> -{
> -	struct idt_entry *base =
> -		(struct idt_entry *)addr_gva2hva(vm, vm->arch.idt);
> -	struct idt_entry *e = &base[vector];
> -
> -	memset(e, 0, sizeof(*e));
> -	e->offset0 = addr;
> -	e->selector = selector;
> -	e->ist = 0;
> -	e->type = 14;
> -	e->dpl = dpl;
> -	e->p = 1;
> -	e->offset1 = addr >> 16;
> -	e->offset2 = addr >> 32;
> -}
> -
> -
> -static bool kvm_fixup_exception(struct ex_regs *regs)
> -{
> -	if (regs->r9 != KVM_EXCEPTION_MAGIC || regs->rip != regs->r10)
> -		return false;
> -
> -	if (regs->vector == DE_VECTOR)
> -		return false;
> -
> -	regs->rip = regs->r11;
> -	regs->r9 = regs->vector;
> -	regs->r10 = regs->error_code;
> -	return true;
> -}
> -
> -void route_exception(struct ex_regs *regs)
> -{
> -	typedef void(*handler)(struct ex_regs *);
> -	handler *handlers = (handler *)exception_handlers;
> -
> -	if (handlers && handlers[regs->vector]) {
> -		handlers[regs->vector](regs);
> -		return;
> -	}
> -
> -	if (kvm_fixup_exception(regs))
> -		return;
> -
> -	ucall_assert(UCALL_UNHANDLED,
> -		     "Unhandled exception in guest", __FILE__, __LINE__,
> -		     "Unhandled exception '0x%lx' at guest RIP '0x%lx'",
> -		     regs->vector, regs->rip);
> -}
> -
> -void vm_init_descriptor_tables(struct kvm_vm *vm)
> -{
> -	extern void *idt_handlers;
> -	int i;
> -
> -	vm->arch.idt = __vm_vaddr_alloc_page(vm, MEM_REGION_DATA);
> -	vm->handlers = __vm_vaddr_alloc_page(vm, MEM_REGION_DATA);
> -	/* Handlers have the same address in both address spaces.*/
> -	for (i = 0; i < NUM_INTERRUPTS; i++)
> -		set_idt_entry(vm, i, (unsigned long)(&idt_handlers)[i], 0,
> -			DEFAULT_CODE_SELECTOR);
> -}
> -
> -void vcpu_init_descriptor_tables(struct kvm_vcpu *vcpu)
> -{
> -	struct kvm_vm *vm = vcpu->vm;
> -	struct kvm_sregs sregs;
> -
> -	vcpu_sregs_get(vcpu, &sregs);
> -	sregs.idt.base = vm->arch.idt;
> -	sregs.idt.limit = NUM_INTERRUPTS * sizeof(struct idt_entry) - 1;
> -	sregs.gdt.base = vm->arch.gdt;
> -	sregs.gdt.limit = getpagesize() - 1;
> -	kvm_seg_set_kernel_data_64bit(NULL, DEFAULT_DATA_SELECTOR, &sregs.gs);
> -	vcpu_sregs_set(vcpu, &sregs);
> -	*(vm_vaddr_t *)addr_gva2hva(vm, (vm_vaddr_t)(&exception_handlers)) = vm->handlers;
> -}
> -
> -void vm_install_exception_handler(struct kvm_vm *vm, int vector,
> -			       void (*handler)(struct ex_regs *))
> -{
> -	vm_vaddr_t *handlers = (vm_vaddr_t *)addr_gva2hva(vm, vm->handlers);
> -
> -	handlers[vector] = (vm_vaddr_t)handler;
> -}
> -
> -void assert_on_unhandled_exception(struct kvm_vcpu *vcpu)
> -{
> -	struct ucall uc;
> -
> -	if (get_ucall(vcpu, &uc) == UCALL_UNHANDLED)
> -		REPORT_GUEST_ASSERT(uc);
> -}
> -
>  const struct kvm_cpuid_entry2 *get_cpuid_entry(const struct kvm_cpuid2 *cpuid,
>  					       uint32_t function, uint32_t index)
>  {
> -- 
> 2.44.0.291.gc1ea87d7ee-goog

Reviewed-by: Ackerley Tng <ackerleytng@google.com>

