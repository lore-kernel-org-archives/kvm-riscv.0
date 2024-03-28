From: Ackerley Tng <ackerleytng@google.com>
Date: Thu, 28 Mar 2024 02:52:39 +0000
Subject: [PATCH 16/18] KVM: selftests: Add macro for TSS selector, rename
 up code/data macros
In-Reply-To: <20240314232637.2538648-17-seanjc@google.com>
References: <20240314232637.2538648-1-seanjc@google.com> <20240314232637.2538648-17-seanjc@google.com>
Message-ID: <diqz4jcrkqyw.fsf@ctop-sg.c.googlers.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Sean Christopherson <seanjc@google.com> writes:

> Add a proper #define for the TSS selector instead of open coding 0x18 and
> hoping future developers don't use that selector for something else.
>
> Opportunistically rename the code and data selector macros to shorten the
> names, align the naming with the kernel's scheme, and capture that they
> are *kernel* segments.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  .../selftests/kvm/lib/x86_64/processor.c       | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/tools/testing/selftests/kvm/lib/x86_64/processor.c b/tools/testing/selftests/kvm/lib/x86_64/processor.c
> index 03b9387a1d2e..67235013f6f9 100644
> --- a/tools/testing/selftests/kvm/lib/x86_64/processor.c
> +++ b/tools/testing/selftests/kvm/lib/x86_64/processor.c
> @@ -15,8 +15,9 @@
>  #define NUM_INTERRUPTS 256
>  #endif
>  
> -#define DEFAULT_CODE_SELECTOR 0x8
> -#define DEFAULT_DATA_SELECTOR 0x10
> +#define KERNEL_CS	0x8
> +#define KERNEL_DS	0x10
> +#define KERNEL_TSS	0x18
>  
>  #define MAX_NR_CPUID_ENTRIES 100
>  
> @@ -547,11 +548,11 @@ static void vcpu_init_sregs(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
>  	sregs.efer |= (EFER_LME | EFER_LMA | EFER_NX);
>  
>  	kvm_seg_set_unusable(&sregs.ldt);
> -	kvm_seg_set_kernel_code_64bit(vm, DEFAULT_CODE_SELECTOR, &sregs.cs);
> -	kvm_seg_set_kernel_data_64bit(vm, DEFAULT_DATA_SELECTOR, &sregs.ds);
> -	kvm_seg_set_kernel_data_64bit(vm, DEFAULT_DATA_SELECTOR, &sregs.es);
> -	kvm_seg_set_kernel_data_64bit(NULL, DEFAULT_DATA_SELECTOR, &sregs.gs);
> -	kvm_setup_tss_64bit(vm, &sregs.tr, 0x18);
> +	kvm_seg_set_kernel_code_64bit(vm, KERNEL_CS, &sregs.cs);
> +	kvm_seg_set_kernel_data_64bit(vm, KERNEL_DS, &sregs.ds);
> +	kvm_seg_set_kernel_data_64bit(vm, KERNEL_DS, &sregs.es);
> +	kvm_seg_set_kernel_data_64bit(NULL, KERNEL_DS, &sregs.gs);
> +	kvm_setup_tss_64bit(vm, &sregs.tr, KERNEL_TSS);
>  
>  	sregs.cr3 = vm->pgd;
>  	vcpu_sregs_set(vcpu, &sregs);
> @@ -620,8 +621,7 @@ static void vm_init_descriptor_tables(struct kvm_vm *vm)
>  
>  	/* Handlers have the same address in both address spaces.*/
>  	for (i = 0; i < NUM_INTERRUPTS; i++)
> -		set_idt_entry(vm, i, (unsigned long)(&idt_handlers)[i], 0,
> -			DEFAULT_CODE_SELECTOR);
> +		set_idt_entry(vm, i, (unsigned long)(&idt_handlers)[i], 0, KERNEL_CS);
>  
>  	*(vm_vaddr_t *)addr_gva2hva(vm, (vm_vaddr_t)(&exception_handlers)) = vm->handlers;
>  }
> -- 
> 2.44.0.291.gc1ea87d7ee-goog

Reviewed-by: Ackerley Tng <ackerleytng@google.com>

