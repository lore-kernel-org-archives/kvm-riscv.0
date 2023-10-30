From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 30 Oct 2023 18:22:26 +0100
Subject: [PATCH v13 09/35] KVM: Add KVM_EXIT_MEMORY_FAULT exit to report
 faults to userspace
In-Reply-To: <20231027182217.3615211-10-seanjc@google.com>
References: <20231027182217.3615211-1-seanjc@google.com>
 <20231027182217.3615211-10-seanjc@google.com>
Message-ID: <904fd341-7bfd-4b63-a2ed-16c9249e698e@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 10/27/23 20:21, Sean Christopherson wrote:
> From: Chao Peng <chao.p.peng@linux.intel.com>
> 
> Add a new KVM exit type to allow userspace to handle memory faults that
> KVM cannot resolve, but that userspace *may* be able to handle (without
> terminating the guest).
> 
> KVM will initially use KVM_EXIT_MEMORY_FAULT to report implicit
> conversions between private and shared memory.  With guest private memory,
> there will be two kind of memory conversions:
> 
>    - explicit conversion: happens when the guest explicitly calls into KVM
>      to map a range (as private or shared)
> 
>    - implicit conversion: happens when the guest attempts to access a gfn
>      that is configured in the "wrong" state (private vs. shared)
> 
> On x86 (first architecture to support guest private memory), explicit
> conversions will be reported via KVM_EXIT_HYPERCALL+KVM_HC_MAP_GPA_RANGE,
> but reporting KVM_EXIT_HYPERCALL for implicit conversions is undesriable
> as there is (obviously) no hypercall, and there is no guarantee that the
> guest actually intends to convert between private and shared, i.e. what
> KVM thinks is an implicit conversion "request" could actually be the
> result of a guest code bug.
> 
> KVM_EXIT_MEMORY_FAULT will be used to report memory faults that appear to
> be implicit conversions.
> 
> Note!  To allow for future possibilities where KVM reports
> KVM_EXIT_MEMORY_FAULT and fills run->memory_fault on _any_ unresolved
> fault, KVM returns "-EFAULT" (-1 with errno == EFAULT from userspace's
> perspective), not '0'!  Due to historical baggage within KVM, exiting to
> userspace with '0' from deep callstacks, e.g. in emulation paths, is
> infeasible as doing so would require a near-complete overhaul of KVM,
> whereas KVM already propagates -errno return codes to userspace even when
> the -errno originated in a low level helper.
> 
> Report the gpa+size instead of a single gfn even though the initial usage
> is expected to always report single pages.  It's entirely possible, likely
> even, that KVM will someday support sub-page granularity faults, e.g.
> Intel's sub-page protection feature allows for additional protections at
> 128-byte granularity.
> 
> Link: https://lore.kernel.org/all/20230908222905.1321305-5-amoorthy at google.com
> Link: https://lore.kernel.org/all/ZQ3AmLO2SYv3DszH at google.com
> Cc: Anish Moorthy <amoorthy@google.com>
> Cc: David Matlack <dmatlack@google.com>
> Suggested-by: Sean Christopherson <seanjc@google.com>
> Co-developed-by: Yu Zhang <yu.c.zhang@linux.intel.com>
> Signed-off-by: Yu Zhang <yu.c.zhang@linux.intel.com>
> Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
> Co-developed-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

> ---
>   Documentation/virt/kvm/api.rst | 41 ++++++++++++++++++++++++++++++++++
>   arch/x86/kvm/x86.c             |  1 +
>   include/linux/kvm_host.h       | 11 +++++++++
>   include/uapi/linux/kvm.h       |  8 +++++++
>   4 files changed, 61 insertions(+)
> 
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index ace984acc125..860216536810 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -6723,6 +6723,26 @@ array field represents return values. The userspace should update the return
>   values of SBI call before resuming the VCPU. For more details on RISC-V SBI
>   spec refer, https://github.com/riscv/riscv-sbi-doc.
>   
> +::
> +
> +		/* KVM_EXIT_MEMORY_FAULT */
> +		struct {
> +			__u64 flags;
> +			__u64 gpa;
> +			__u64 size;
> +		} memory;
> +
> +KVM_EXIT_MEMORY_FAULT indicates the vCPU has encountered a memory fault that
> +could not be resolved by KVM.  The 'gpa' and 'size' (in bytes) describe the
> +guest physical address range [gpa, gpa + size) of the fault.  The 'flags' field
> +describes properties of the faulting access that are likely pertinent.
> +Currently, no flags are defined.
> +
> +Note!  KVM_EXIT_MEMORY_FAULT is unique among all KVM exit reasons in that it
> +accompanies a return code of '-1', not '0'!  errno will always be set to EFAULT
> +or EHWPOISON when KVM exits with KVM_EXIT_MEMORY_FAULT, userspace should assume
> +kvm_run.exit_reason is stale/undefined for all other error numbers.
> +
>   ::
>   
>       /* KVM_EXIT_NOTIFY */
> @@ -7757,6 +7777,27 @@ This capability is aimed to mitigate the threat that malicious VMs can
>   cause CPU stuck (due to event windows don't open up) and make the CPU
>   unavailable to host or other VMs.
>   
> +7.34 KVM_CAP_MEMORY_FAULT_INFO
> +------------------------------
> +
> +:Architectures: x86
> +:Returns: Informational only, -EINVAL on direct KVM_ENABLE_CAP.
> +
> +The presence of this capability indicates that KVM_RUN will fill
> +kvm_run.memory_fault if KVM cannot resolve a guest page fault VM-Exit, e.g. if
> +there is a valid memslot but no backing VMA for the corresponding host virtual
> +address.
> +
> +The information in kvm_run.memory_fault is valid if and only if KVM_RUN returns
> +an error with errno=EFAULT or errno=EHWPOISON *and* kvm_run.exit_reason is set
> +to KVM_EXIT_MEMORY_FAULT.
> +
> +Note: Userspaces which attempt to resolve memory faults so that they can retry
> +KVM_RUN are encouraged to guard against repeatedly receiving the same
> +error/annotated fault.
> +
> +See KVM_EXIT_MEMORY_FAULT for more information.
> +
>   8. Other capabilities.
>   ======================
>   
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index 6409914428ca..ee3cd8c3c0ef 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -4518,6 +4518,7 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>   	case KVM_CAP_ENABLE_CAP:
>   	case KVM_CAP_VM_DISABLE_NX_HUGE_PAGES:
>   	case KVM_CAP_IRQFD_RESAMPLE:
> +	case KVM_CAP_MEMORY_FAULT_INFO:
>   		r = 1;
>   		break;
>   	case KVM_CAP_EXIT_HYPERCALL:
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 4e741ff27af3..96aa930536b1 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -2327,4 +2327,15 @@ static inline void kvm_account_pgtable_pages(void *virt, int nr)
>   /* Max number of entries allowed for each kvm dirty ring */
>   #define  KVM_DIRTY_RING_MAX_ENTRIES  65536
>   
> +static inline void kvm_prepare_memory_fault_exit(struct kvm_vcpu *vcpu,
> +						 gpa_t gpa, gpa_t size)
> +{
> +	vcpu->run->exit_reason = KVM_EXIT_MEMORY_FAULT;
> +	vcpu->run->memory_fault.gpa = gpa;
> +	vcpu->run->memory_fault.size = size;
> +
> +	/* Flags are not (yet) defined or communicated to userspace. */
> +	vcpu->run->memory_fault.flags = 0;
> +}
> +
>   #endif
> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> index bd1abe067f28..7ae9987b48dd 100644
> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@ -274,6 +274,7 @@ struct kvm_xen_exit {
>   #define KVM_EXIT_RISCV_SBI        35
>   #define KVM_EXIT_RISCV_CSR        36
>   #define KVM_EXIT_NOTIFY           37
> +#define KVM_EXIT_MEMORY_FAULT     38
>   
>   /* For KVM_EXIT_INTERNAL_ERROR */
>   /* Emulate instruction failed. */
> @@ -520,6 +521,12 @@ struct kvm_run {
>   #define KVM_NOTIFY_CONTEXT_INVALID	(1 << 0)
>   			__u32 flags;
>   		} notify;
> +		/* KVM_EXIT_MEMORY_FAULT */
> +		struct {
> +			__u64 flags;
> +			__u64 gpa;
> +			__u64 size;
> +		} memory_fault;
>   		/* Fix the size of the union. */
>   		char padding[256];
>   	};
> @@ -1203,6 +1210,7 @@ struct kvm_ppc_resize_hpt {
>   #define KVM_CAP_ARM_EAGER_SPLIT_CHUNK_SIZE 228
>   #define KVM_CAP_ARM_SUPPORTED_BLOCK_SIZES 229
>   #define KVM_CAP_USER_MEMORY2 230
> +#define KVM_CAP_MEMORY_FAULT_INFO 231
>   
>   #ifdef KVM_CAP_IRQ_ROUTING
>   


