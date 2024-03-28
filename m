From: Ackerley Tng <ackerleytng@google.com>
Date: Thu, 28 Mar 2024 02:47:05 +0000
Subject: [PATCH 09/18] KVM: selftests: Rename x86's vcpu_setup() to vcpu_init_sregs()
In-Reply-To: <20240314232637.2538648-10-seanjc@google.com>
References: <20240314232637.2538648-1-seanjc@google.com> <20240314232637.2538648-10-seanjc@google.com>
Message-ID: <diqzttkrkr86.fsf@ctop-sg.c.googlers.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Sean Christopherson <seanjc@google.com> writes:

> Rename vcpu_setup() to be more descriptive and precise, there is a whole
> lot of "setup" that is done for a vCPU that isn't in said helper.
>
> No functional change intended.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  tools/testing/selftests/kvm/lib/x86_64/processor.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tools/testing/selftests/kvm/lib/x86_64/processor.c b/tools/testing/selftests/kvm/lib/x86_64/processor.c
> index 3640d3290f0a..d6bfe96a6a77 100644
> --- a/tools/testing/selftests/kvm/lib/x86_64/processor.c
> +++ b/tools/testing/selftests/kvm/lib/x86_64/processor.c
> @@ -555,7 +555,7 @@ void vcpu_init_descriptor_tables(struct kvm_vcpu *vcpu)
>  	*(vm_vaddr_t *)addr_gva2hva(vm, (vm_vaddr_t)(&exception_handlers)) = vm->handlers;
>  }
>  
> -static void vcpu_setup(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
> +static void vcpu_init_sregs(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
>  {
>  	struct kvm_sregs sregs;
>  
> @@ -716,7 +716,7 @@ struct kvm_vcpu *vm_arch_vcpu_add(struct kvm_vm *vm, uint32_t vcpu_id)
>  
>  	vcpu = __vm_vcpu_add(vm, vcpu_id);
>  	vcpu_init_cpuid(vcpu, kvm_get_supported_cpuid());
> -	vcpu_setup(vm, vcpu);
> +	vcpu_init_sregs(vm, vcpu);
>  
>  	/* Setup guest general purpose registers */
>  	vcpu_regs_get(vcpu, &regs);
> -- 
> 2.44.0.291.gc1ea87d7ee-goog

Reviewed-by: Ackerley Tng <ackerleytng@google.com>

