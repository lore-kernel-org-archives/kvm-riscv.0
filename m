From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 21 Jul 2023 17:09:40 +0200
Subject: [RFC PATCH v11 14/29] KVM: x86/mmu: Handle page fault for private
 memory
In-Reply-To: <20230718234512.1690985-15-seanjc@google.com>
References: <20230718234512.1690985-1-seanjc@google.com>
 <20230718234512.1690985-15-seanjc@google.com>
Message-ID: <68ce1eff-807c-d637-d992-f83e8af81514@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 7/19/23 01:44, Sean Christopherson wrote:
> From: Chao Peng <chao.p.peng@linux.intel.com>
> 
> A KVM_MEM_PRIVATE memslot can include both fd-based private memory and
> hva-based shared memory. Architecture code (like TDX code) can tell
> whether the on-going fault is private or not. This patch adds a
> 'is_private' field to kvm_page_fault to indicate this and architecture
> code is expected to set it.
> 
> To handle page fault for such memslot, the handling logic is different
> depending on whether the fault is private or shared. KVM checks if
> 'is_private' matches the host's view of the page (maintained in
> mem_attr_array).
>    - For a successful match, private pfn is obtained with
>      restrictedmem_get_page() and shared pfn is obtained with existing
>      get_user_pages().
>    - For a failed match, KVM causes a KVM_EXIT_MEMORY_FAULT exit to
>      userspace. Userspace then can convert memory between private/shared
>      in host's view and retry the fault.
> 
> Co-developed-by: Yu Zhang <yu.c.zhang@linux.intel.com>
> Signed-off-by: Yu Zhang <yu.c.zhang@linux.intel.com>
> Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
> Reviewed-by: Fuad Tabba <tabba@google.com>
> Tested-by: Fuad Tabba <tabba@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>   arch/x86/kvm/mmu/mmu.c          | 82 +++++++++++++++++++++++++++++++--
>   arch/x86/kvm/mmu/mmu_internal.h |  3 ++
>   arch/x86/kvm/mmu/mmutrace.h     |  1 +
>   3 files changed, 81 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> index aefe67185637..4cf73a579ee1 100644
> --- a/arch/x86/kvm/mmu/mmu.c
> +++ b/arch/x86/kvm/mmu/mmu.c
> @@ -3179,9 +3179,9 @@ static int host_pfn_mapping_level(struct kvm *kvm, gfn_t gfn,
>   	return level;
>   }
>   
> -int kvm_mmu_max_mapping_level(struct kvm *kvm,
> -			      const struct kvm_memory_slot *slot, gfn_t gfn,
> -			      int max_level)
> +static int __kvm_mmu_max_mapping_level(struct kvm *kvm,
> +				       const struct kvm_memory_slot *slot,
> +				       gfn_t gfn, int max_level, bool is_private)
>   {
>   	struct kvm_lpage_info *linfo;
>   	int host_level;
> @@ -3193,6 +3193,9 @@ int kvm_mmu_max_mapping_level(struct kvm *kvm,
>   			break;
>   	}
>   
> +	if (is_private)
> +		return max_level;
> +
>   	if (max_level == PG_LEVEL_4K)
>   		return PG_LEVEL_4K;
>   
> @@ -3200,6 +3203,16 @@ int kvm_mmu_max_mapping_level(struct kvm *kvm,
>   	return min(host_level, max_level);
>   }
>   
> +int kvm_mmu_max_mapping_level(struct kvm *kvm,
> +			      const struct kvm_memory_slot *slot, gfn_t gfn,
> +			      int max_level)
> +{
> +	bool is_private = kvm_slot_can_be_private(slot) &&
> +			  kvm_mem_is_private(kvm, gfn);
> +
> +	return __kvm_mmu_max_mapping_level(kvm, slot, gfn, max_level, is_private);
> +}
> +
>   void kvm_mmu_hugepage_adjust(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
>   {
>   	struct kvm_memory_slot *slot = fault->slot;
> @@ -3220,8 +3233,9 @@ void kvm_mmu_hugepage_adjust(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault
>   	 * Enforce the iTLB multihit workaround after capturing the requested
>   	 * level, which will be used to do precise, accurate accounting.
>   	 */
> -	fault->req_level = kvm_mmu_max_mapping_level(vcpu->kvm, slot,
> -						     fault->gfn, fault->max_level);
> +	fault->req_level = __kvm_mmu_max_mapping_level(vcpu->kvm, slot,
> +						       fault->gfn, fault->max_level,
> +						       fault->is_private);
>   	if (fault->req_level == PG_LEVEL_4K || fault->huge_page_disallowed)
>   		return;
>   
> @@ -4304,6 +4318,55 @@ void kvm_arch_async_page_ready(struct kvm_vcpu *vcpu, struct kvm_async_pf *work)
>   	kvm_mmu_do_page_fault(vcpu, work->cr2_or_gpa, 0, true, NULL);
>   }
>   
> +static inline u8 kvm_max_level_for_order(int order)
> +{
> +	BUILD_BUG_ON(KVM_MAX_HUGEPAGE_LEVEL > PG_LEVEL_1G);
> +
> +	MMU_WARN_ON(order != KVM_HPAGE_GFN_SHIFT(PG_LEVEL_1G) &&
> +		    order != KVM_HPAGE_GFN_SHIFT(PG_LEVEL_2M) &&
> +		    order != KVM_HPAGE_GFN_SHIFT(PG_LEVEL_4K));
> +
> +	if (order >= KVM_HPAGE_GFN_SHIFT(PG_LEVEL_1G))
> +		return PG_LEVEL_1G;
> +
> +	if (order >= KVM_HPAGE_GFN_SHIFT(PG_LEVEL_2M))
> +		return PG_LEVEL_2M;
> +
> +	return PG_LEVEL_4K;
> +}
> +
> +static int kvm_do_memory_fault_exit(struct kvm_vcpu *vcpu,
> +				    struct kvm_page_fault *fault)
> +{
> +	vcpu->run->exit_reason = KVM_EXIT_MEMORY_FAULT;
> +	if (fault->is_private)
> +		vcpu->run->memory.flags = KVM_MEMORY_EXIT_FLAG_PRIVATE;
> +	else
> +		vcpu->run->memory.flags = 0;
> +	vcpu->run->memory.gpa = fault->gfn << PAGE_SHIFT;
> +	vcpu->run->memory.size = PAGE_SIZE;
> +	return RET_PF_USER;
> +}
> +
> +static int kvm_faultin_pfn_private(struct kvm_vcpu *vcpu,
> +				   struct kvm_page_fault *fault)
> +{
> +	int max_order, r;
> +
> +	if (!kvm_slot_can_be_private(fault->slot))
> +		return kvm_do_memory_fault_exit(vcpu, fault);
> +
> +	r = kvm_gmem_get_pfn(vcpu->kvm, fault->slot, fault->gfn, &fault->pfn,
> +			     &max_order);
> +	if (r)
> +		return r;
> +
> +	fault->max_level = min(kvm_max_level_for_order(max_order),
> +			       fault->max_level);
> +	fault->map_writable = !(fault->slot->flags & KVM_MEM_READONLY);
> +	return RET_PF_CONTINUE;
> +}
> +
>   static int __kvm_faultin_pfn(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
>   {
>   	struct kvm_memory_slot *slot = fault->slot;
> @@ -4336,6 +4399,12 @@ static int __kvm_faultin_pfn(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault
>   			return RET_PF_EMULATE;
>   	}
>   
> +	if (fault->is_private != kvm_mem_is_private(vcpu->kvm, fault->gfn))
> +		return kvm_do_memory_fault_exit(vcpu, fault);
> +
> +	if (fault->is_private)
> +		return kvm_faultin_pfn_private(vcpu, fault);
> +
>   	async = false;
>   	fault->pfn = __gfn_to_pfn_memslot(slot, fault->gfn, false, false, &async,
>   					  fault->write, &fault->map_writable,
> @@ -5771,6 +5840,9 @@ int noinline kvm_mmu_page_fault(struct kvm_vcpu *vcpu, gpa_t cr2_or_gpa, u64 err
>   			return -EIO;
>   	}
>   
> +	if (r == RET_PF_USER)
> +		return 0;
> +
>   	if (r < 0)
>   		return r;
>   	if (r != RET_PF_EMULATE)
> diff --git a/arch/x86/kvm/mmu/mmu_internal.h b/arch/x86/kvm/mmu/mmu_internal.h
> index d39af5639ce9..268b517e88cb 100644
> --- a/arch/x86/kvm/mmu/mmu_internal.h
> +++ b/arch/x86/kvm/mmu/mmu_internal.h
> @@ -203,6 +203,7 @@ struct kvm_page_fault {
>   
>   	/* Derived from mmu and global state.  */
>   	const bool is_tdp;
> +	const bool is_private;
>   	const bool nx_huge_page_workaround_enabled;
>   
>   	/*
> @@ -259,6 +260,7 @@ int kvm_tdp_page_fault(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault);
>    * RET_PF_RETRY: let CPU fault again on the address.
>    * RET_PF_EMULATE: mmio page fault, emulate the instruction directly.
>    * RET_PF_INVALID: the spte is invalid, let the real page fault path update it.
> + * RET_PF_USER: need to exit to userspace to handle this fault.
>    * RET_PF_FIXED: The faulting entry has been fixed.
>    * RET_PF_SPURIOUS: The faulting entry was already fixed, e.g. by another vCPU.
>    *
> @@ -275,6 +277,7 @@ enum {
>   	RET_PF_RETRY,
>   	RET_PF_EMULATE,
>   	RET_PF_INVALID,
> +	RET_PF_USER,
>   	RET_PF_FIXED,
>   	RET_PF_SPURIOUS,
>   };
> diff --git a/arch/x86/kvm/mmu/mmutrace.h b/arch/x86/kvm/mmu/mmutrace.h
> index ae86820cef69..2d7555381955 100644
> --- a/arch/x86/kvm/mmu/mmutrace.h
> +++ b/arch/x86/kvm/mmu/mmutrace.h
> @@ -58,6 +58,7 @@ TRACE_DEFINE_ENUM(RET_PF_CONTINUE);
>   TRACE_DEFINE_ENUM(RET_PF_RETRY);
>   TRACE_DEFINE_ENUM(RET_PF_EMULATE);
>   TRACE_DEFINE_ENUM(RET_PF_INVALID);
> +TRACE_DEFINE_ENUM(RET_PF_USER);
>   TRACE_DEFINE_ENUM(RET_PF_FIXED);
>   TRACE_DEFINE_ENUM(RET_PF_SPURIOUS);
>   

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


