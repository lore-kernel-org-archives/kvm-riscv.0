From: Fuad Tabba <tabba@google.com>
Date: Mon, 6 Nov 2023 11:24:54 +0000
Subject: [PATCH 25/34] KVM: selftests: Add helpers to convert guest memory
 b/w private and shared
In-Reply-To: <20231105163040.14904-26-pbonzini@redhat.com>
References: <20231105163040.14904-1-pbonzini@redhat.com> <20231105163040.14904-26-pbonzini@redhat.com>
Message-ID: <CA+EHjTxy6TWM3oBG0Q6v5090XTrs+M8_m5=6Z2E1P-HyTkrGWg@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Nov 5, 2023 at 4:34?PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> From: Vishal Annapurve <vannapurve@google.com>
>
> Add helpers to convert memory between private and shared via KVM's
> memory attributes, as well as helpers to free/allocate guest_memfd memory
> via fallocate().  Userspace, i.e. tests, is NOT required to do fallocate()
> when converting memory, as the attributes are the single source of true.

nit: true->truth

> Provide allocate() helpers so that tests can mimic a userspace that frees
> private memory on conversion, e.g. to prioritize memory usage over
> performance.
>
> Signed-off-by: Vishal Annapurve <vannapurve@google.com>
> Co-developed-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> Message-Id: <20231027182217.3615211-28-seanjc@google.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  .../selftests/kvm/include/kvm_util_base.h     | 48 +++++++++++++++++++
>  tools/testing/selftests/kvm/lib/kvm_util.c    | 28 +++++++++++
>  2 files changed, 76 insertions(+)
>
> diff --git a/tools/testing/selftests/kvm/include/kvm_util_base.h b/tools/testing/selftests/kvm/include/kvm_util_base.h
> index 9f861182c02a..1441fca6c273 100644
> --- a/tools/testing/selftests/kvm/include/kvm_util_base.h
> +++ b/tools/testing/selftests/kvm/include/kvm_util_base.h
> @@ -333,6 +333,54 @@ static inline void vm_enable_cap(struct kvm_vm *vm, uint32_t cap, uint64_t arg0)
>         vm_ioctl(vm, KVM_ENABLE_CAP, &enable_cap);
>  }
>
> +static inline void vm_set_memory_attributes(struct kvm_vm *vm, uint64_t gpa,
> +                                           uint64_t size, uint64_t attributes)
> +{
> +       struct kvm_memory_attributes attr = {
> +               .attributes = attributes,
> +               .address = gpa,
> +               .size = size,
> +               .flags = 0,
> +       };
> +
> +       /*
> +        * KVM_SET_MEMORY_ATTRIBUTES overwrites _all_ attributes.  These flows
> +        * need significant enhancements to support multiple attributes.
> +        */
> +       TEST_ASSERT(!attributes || attributes == KVM_MEMORY_ATTRIBUTE_PRIVATE,
> +                   "Update me to support multiple attributes!");
> +
> +       vm_ioctl(vm, KVM_SET_MEMORY_ATTRIBUTES, &attr);
> +}
> +
> +
> +static inline void vm_mem_set_private(struct kvm_vm *vm, uint64_t gpa,
> +                                     uint64_t size)
> +{
> +       vm_set_memory_attributes(vm, gpa, size, KVM_MEMORY_ATTRIBUTE_PRIVATE);
> +}
> +
> +static inline void vm_mem_set_shared(struct kvm_vm *vm, uint64_t gpa,
> +                                    uint64_t size)
> +{
> +       vm_set_memory_attributes(vm, gpa, size, 0);
> +}
> +
> +void vm_guest_mem_fallocate(struct kvm_vm *vm, uint64_t gpa, uint64_t size,
> +                           bool punch_hole);
> +
> +static inline void vm_guest_mem_punch_hole(struct kvm_vm *vm, uint64_t gpa,
> +                                          uint64_t size)
> +{
> +       vm_guest_mem_fallocate(vm, gpa, size, true);
> +}
> +
> +static inline void vm_guest_mem_allocate(struct kvm_vm *vm, uint64_t gpa,
> +                                        uint64_t size)
> +{
> +       vm_guest_mem_fallocate(vm, gpa, size, false);
> +}
> +
>  void vm_enable_dirty_ring(struct kvm_vm *vm, uint32_t ring_size);
>  const char *vm_guest_mode_string(uint32_t i);
>
> diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
> index b63500fca627..95a553400ea9 100644
> --- a/tools/testing/selftests/kvm/lib/kvm_util.c
> +++ b/tools/testing/selftests/kvm/lib/kvm_util.c
> @@ -1167,6 +1167,34 @@ void vm_mem_region_delete(struct kvm_vm *vm, uint32_t slot)
>         __vm_mem_region_delete(vm, memslot2region(vm, slot), true);
>  }
>
> +void vm_guest_mem_fallocate(struct kvm_vm *vm, uint64_t base, uint64_t size,
> +                           bool punch_hole)
> +{
> +       const int mode = FALLOC_FL_KEEP_SIZE | (punch_hole ? FALLOC_FL_PUNCH_HOLE : 0);
> +       struct userspace_mem_region *region;
> +       uint64_t end = base + size;
> +       uint64_t gpa, len;
> +       off_t fd_offset;
> +       int ret;
> +
> +       for (gpa = base; gpa < end; gpa += len) {
> +               uint64_t offset;
> +
> +               region = userspace_mem_region_find(vm, gpa, gpa);
> +               TEST_ASSERT(region && region->region.flags & KVM_MEM_GUEST_MEMFD,
> +                           "Private memory region not found for GPA 0x%lx", gpa);
> +
> +               offset = (gpa - region->region.guest_phys_addr);

nit: why the parentheses?

> +               fd_offset = region->region.guest_memfd_offset + offset;
> +               len = min_t(uint64_t, end - gpa, region->region.memory_size - offset);
> +
> +               ret = fallocate(region->region.guest_memfd, mode, fd_offset, len);
> +               TEST_ASSERT(!ret, "fallocate() failed to %s at %lx (len = %lu), fd = %d, mode = %x, offset = %lx\n",
> +                           punch_hole ? "punch hole" : "allocate", gpa, len,
> +                           region->region.guest_memfd, mode, fd_offset);
> +       }
> +}
> +
>  /* Returns the size of a vCPU's kvm_run structure. */
>  static int vcpu_mmap_sz(void)
>  {

Nits aside:

Reviewed-by: Fuad Tabba <tabba@google.com>
Tested-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> --
> 2.39.1
>
>

