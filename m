From: Shuah Khan <skhan@linuxfoundation.org>
Date: Thu, 25 Apr 2024 10:22:11 -0600
Subject: [PATCH v13 25/35] KVM: selftests: Convert lib's mem regions to
 KVM_SET_USER_MEMORY_REGION2
In-Reply-To: <ZipyPYR8Nv_usoU4@google.com>
References: <20231027182217.3615211-1-seanjc@google.com>
 <20231027182217.3615211-26-seanjc@google.com>
 <69ae0694-8ca3-402c-b864-99b500b24f5d@moroto.mountain>
 <3848a9ad-07aa-48da-a2b7-264c4a990b5b@linuxfoundation.org>
 <ZipyPYR8Nv_usoU4@google.com>
Message-ID: <763ee03a-817d-4833-b42f-e5b4bd25dc7f@linuxfoundation.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 4/25/24 09:09, Sean Christopherson wrote:
> On Thu, Apr 25, 2024, Shuah Khan wrote:
>> On 4/25/24 08:12, Dan Carpenter wrote:
>>> On Fri, Oct 27, 2023 at 11:22:07AM -0700, Sean Christopherson wrote:
>>>> Use KVM_SET_USER_MEMORY_REGION2 throughout KVM's selftests library so that
>>>> support for guest private memory can be added without needing an entirely
>>>> separate set of helpers.
>>>>
>>>> Note, this obviously makes selftests backwards-incompatible with older KVM
>>>     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>>> versions from this point forward.
>>>     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>>
>>> Is there a way we could disable the tests on older kernels instead of
>>> making them fail?  Check uname or something?  There is probably a
>>> standard way to do this...  It's these tests which fail.
>>
>> They shouldn't fail - the tests should be skipped on older kernels.
> 
> Ah, that makes sense.  Except for a few outliers that aren't all that interesting,
> all KVM selftests create memslots, so I'm tempted to just make it a hard requirement
> to spare us headache, e.g.
> 
> diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
> index b2262b5fad9e..4b2038b1f11f 100644
> --- a/tools/testing/selftests/kvm/lib/kvm_util.c
> +++ b/tools/testing/selftests/kvm/lib/kvm_util.c
> @@ -2306,6 +2306,9 @@ void __attribute((constructor)) kvm_selftest_init(void)
>          /* Tell stdout not to buffer its content. */
>          setbuf(stdout, NULL);
>   
> +       __TEST_REQUIRE(kvm_has_cap(KVM_CAP_USER_MEMORY2),
> +                      "KVM selftests from v6.8+ require KVM_SET_USER_MEMORY_REGION2");
> +
>          kvm_selftest_arch_init();
>   }
> 
> --
> 
> but it's also easy enough to be more precise and skip only those that actually
> create memslots.

This is approach is what is recommended in kselfest document. Rubn as many tests
as possible and skip the ones that can't be run due to unmet dependencies.

> 
> diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
> index b2262b5fad9e..b21152adf448 100644
> --- a/tools/testing/selftests/kvm/lib/kvm_util.c
> +++ b/tools/testing/selftests/kvm/lib/kvm_util.c
> @@ -944,6 +944,9 @@ int __vm_set_user_memory_region2(struct kvm_vm *vm, uint32_t slot, uint32_t flag
>                  .guest_memfd_offset = guest_memfd_offset,
>          };
>   
> +       __TEST_REQUIRE(kvm_has_cap(KVM_CAP_USER_MEMORY2),
> +                      "KVM selftests from v6.8+ require KVM_SET_USER_MEMORY_REGION2");
> +
>          return ioctl(vm->fd, KVM_SET_USER_MEMORY_REGION2, &region);
>   }
>   
> @@ -970,6 +973,9 @@ void vm_mem_add(struct kvm_vm *vm, enum vm_mem_backing_src_type src_type,
>          size_t mem_size = npages * vm->page_size;
>          size_t alignment;
>   
> +       __TEST_REQUIRE(kvm_has_cap(KVM_CAP_USER_MEMORY2),
> +                      "KVM selftests from v6.8+ require KVM_SET_USER_MEMORY_REGION2");
> +
>          TEST_ASSERT(vm_adjust_num_guest_pages(vm->mode, npages) == npages,
>                  "Number of guest pages is not compatible with the host. "
>                  "Try npages=%d", vm_adjust_num_guest_pages(vm->mode, npages));
> --

thanks,
-- Shuah

