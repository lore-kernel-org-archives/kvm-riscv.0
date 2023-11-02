From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 2 Nov 2023 11:32:34 +0100
Subject: [PATCH v13 13/35] KVM: Introduce per-page memory attributes
In-Reply-To: <b486ed5036fab6d6d4e13a6c68abddcb9541d51b.camel@intel.com>
References: <20231027182217.3615211-1-seanjc@google.com>
 <20231027182217.3615211-14-seanjc@google.com>
 <b486ed5036fab6d6d4e13a6c68abddcb9541d51b.camel@intel.com>
Message-ID: <a03d0e36-7b38-4841-9c62-66c9029e388d@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 11/2/23 04:01, Huang, Kai wrote:
> On Fri, 2023-10-27 at 11:21 -0700, Sean Christopherson wrote:
>> From: Chao Peng <chao.p.peng@linux.intel.com>
>>
>> In confidential computing usages, whether a page is private or shared is
>> necessary information for KVM to perform operations like page fault
>> handling, page zapping etc. There are other potential use cases for
>> per-page memory attributes, e.g. to make memory read-only (or no-exec,
>> or exec-only, etc.) without having to modify memslots.
>>
>> Introduce two ioctls (advertised by KVM_CAP_MEMORY_ATTRIBUTES) to allow
>> userspace to operate on the per-page memory attributes.
>>    - KVM_SET_MEMORY_ATTRIBUTES to set the per-page memory attributes to
>>      a guest memory range.
>>    - KVM_GET_SUPPORTED_MEMORY_ATTRIBUTES to return the KVM supported
>>      memory attributes.
>>
>> Use an xarray to store the per-page attributes internally, with a naive,
>> not fully optimized implementation, i.e. prioritize correctness over
>> performance for the initial implementation.
>>
>> Use bit 3 for the PRIVATE attribute so that KVM can use bits 0-2 for RWX
>> attributes/protections in the future, e.g. to give userspace fine-grained
>> control over read, write, and execute protections for guest memory.
>>
>> Provide arch hooks for handling attribute changes before and after common
>> code sets the new attributes, e.g. x86 will use the "pre" hook to zap all
>> relevant mappings, and the "post" hook to track whether or not hugepages
>> can be used to map the range.
>>
>> To simplify the implementation wrap the entire sequence with
>> kvm_mmu_invalidate_{begin,end}() even though the operation isn't strictly
>> guaranteed to be an invalidation.  For the initial use case, x86 *will*
>> always invalidate memory, and preventing arch code from creating new
>> mappings while the attributes are in flux makes it much easier to reason
>> about the correctness of consuming attributes.
>>
>> It's possible that future usages may not require an invalidation, e.g.
>> if KVM ends up supporting RWX protections and userspace grants _more_
>> protections, but again opt for simplicity and punt optimizations to
>> if/when they are needed.
>>
>> Suggested-by: Sean Christopherson <seanjc@google.com>
>> Link: https://lore.kernel.org/all/Y2WB48kD0J4VGynX at google.com
>> Cc: Fuad Tabba <tabba@google.com>
>> Cc: Xu Yilun <yilun.xu@intel.com>
>> Cc: Micka?l Sala?n <mic@digikod.net>
>> Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
>> Co-developed-by: Sean Christopherson <seanjc@google.com>
>> Signed-off-by: Sean Christopherson <seanjc@google.com>
>>
> 
> [...]
> 
>> +Note, there is no "get" API.  Userspace is responsible for explicitly tracking
>> +the state of a gfn/page as needed.
>> +
>>
> 
> [...]
> 
>>   
>> +#ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
>> +static inline unsigned long kvm_get_memory_attributes(struct kvm *kvm, gfn_t gfn)
>> +{
>> +	return xa_to_value(xa_load(&kvm->mem_attr_array, gfn));
>> +}
> 
> Only call xa_to_value() when xa_load() returns !NULL?

This xarray does not store a pointer, therefore xa_load() actually 
returns an integer that is tagged with 1 in the low bit:

static inline unsigned long xa_to_value(const void *entry)
{
         return (unsigned long)entry >> 1;
}

Returning zero for an empty entry is okay, so the result of xa_load() 
can be used directly.


>> +
>> +bool kvm_range_has_memory_attributes(struct kvm *kvm, gfn_t start, gfn_t end,
>> +				     unsigned long attrs);
> 
> Seems it's not immediately clear why this function is needed in this patch,
> especially when you said there is no "get" API above.  Add some material to
> changelog?

It's used by later patches; even without a "get" API, it's a pretty 
fundamental functionality.

>> +bool kvm_arch_pre_set_memory_attributes(struct kvm *kvm,
>> +					struct kvm_gfn_range *range);
>> +bool kvm_arch_post_set_memory_attributes(struct kvm *kvm,
>> +					 struct kvm_gfn_range *range);
> 
> Looks if this Kconfig is on, the above two arch hooks won't have implementation.
> 
> Is it better to have two __weak empty versions here in this patch?
> 
> Anyway, from the changelog it seems it's not mandatory for some ARCH to provide
> the above two if one wants to turn this on, i.e., the two hooks can be empty and
> the ARCH can just use the __weak version.

I think this can be added by the first arch that needs memory attributes 
and also doesn't need one of these hooks.  Or perhaps the x86 
kvm_arch_pre_set_memory_attributes() could be made generic and thus that 
would be the __weak version.  It's too early to tell, so it's better to 
leave the implementation to the architectures for now.

Paolo


