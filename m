From: Ackerley Tng <ackerleytng@google.com>
Date: Mon, 07 Aug 2023 23:17:49 +0000
Subject: [RFC PATCH v11 27/29] KVM: selftests: Expand set_memory_region_test
 to validate guest_memfd()
In-Reply-To: <20230718234512.1690985-28-seanjc@google.com> (message from Sean
 Christopherson on Tue, 18 Jul 2023 16:45:10 -0700)
Message-ID: <diqzr0oe30iq.fsf@ackerleytng-ctop.c.googlers.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Sean Christopherson <seanjc@google.com> writes:

> From: Chao Peng <chao.p.peng@linux.intel.com>
>
> Expand set_memory_region_test to exercise various positive and negative
> testcases for private memory.
>
>  - Non-guest_memfd() file descriptor for private memory
>  - guest_memfd() from different VM
>  - Overlapping bindings
>  - Unaligned bindings
>
> Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
> Co-developed-by: Ackerley Tng <ackerleytng@google.com>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> [sean: trim the testcases to remove duplicate coverage]
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  .../selftests/kvm/include/kvm_util_base.h     | 10 ++
>  .../selftests/kvm/set_memory_region_test.c    | 99 +++++++++++++++++++
>  2 files changed, 109 insertions(+)
>
> diff --git a/tools/testing/selftests/kvm/include/kvm_util_base.h b/tools/testing/selftests/kvm/include/kvm_util_base.h
> index 334df27a6f43..39b38c75b99c 100644
> --- a/tools/testing/selftests/kvm/include/kvm_util_base.h
> +++ b/tools/testing/selftests/kvm/include/kvm_util_base.h
> @@ -789,6 +789,16 @@ static inline struct kvm_vm *vm_create_barebones(void)
>  	return ____vm_create(VM_SHAPE_DEFAULT);
>  }
>  

> <snip>

> +
> +static void test_add_private_memory_region(void)
> +{
> +	struct kvm_vm *vm, *vm2;
> +	int memfd, i;
> +
> +	pr_info("Testing ADD of KVM_MEM_PRIVATE memory regions\n");
> +
> +	vm = vm_create_barebones_protected_vm();
> +
> +	test_invalid_guest_memfd(vm, vm->kvm_fd, 0, "KVM fd should fail");
> +	test_invalid_guest_memfd(vm, vm->fd, 0, "VM's fd should fail");
> +
> +	memfd = kvm_memfd_alloc(MEM_REGION_SIZE, false);
> +	test_invalid_guest_memfd(vm, vm->fd, 0, "Regular memfd() should fail");

This should be

test_invalid_guest_memfd(vm, memfd, 0, "Regular memfd() should fail");

> +	close(memfd);
> +
> +	vm2 = vm_create_barebones_protected_vm();
> +	memfd = vm_create_guest_memfd(vm2, MEM_REGION_SIZE, 0);
> +	test_invalid_guest_memfd(vm, memfd, 0, "Other VM's guest_memfd() should fail");
> +
> +	vm_set_user_memory_region2(vm2, MEM_REGION_SLOT, KVM_MEM_PRIVATE,
> +				   MEM_REGION_GPA, MEM_REGION_SIZE, 0, memfd, 0);
> +	close(memfd);
> +	kvm_vm_free(vm2);
> +
> +	memfd = vm_create_guest_memfd(vm, MEM_REGION_SIZE, 0);
> +	for (i = 1; i < PAGE_SIZE; i++)
> +		test_invalid_guest_memfd(vm, memfd, i, "Unaligned offset should fail");
> +
> +	vm_set_user_memory_region2(vm, MEM_REGION_SLOT, KVM_MEM_PRIVATE,
> +				   MEM_REGION_GPA, MEM_REGION_SIZE, 0, memfd, 0);
> +	close(memfd);
> +
> +	kvm_vm_free(vm);
> +}
> +

> <snip>

