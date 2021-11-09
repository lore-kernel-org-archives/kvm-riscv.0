From: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
Date: Tue, 9 Nov 2021 17:29:45 +0100
Subject: [PATCH v5.5 20/30] KVM: x86: Use nr_memslot_pages to avoid
 traversing the memslots array
In-Reply-To: <YYnQIYdsb3wwg86j@google.com>
References: <20211104002531.1176691-1-seanjc@google.com>
 <20211104002531.1176691-21-seanjc@google.com>
 <88d64cd0-4db1-34a8-96af-6661a55e971e@oracle.com>
 <YYnQIYdsb3wwg86j@google.com>
Message-ID: <cb2b3958-8d7c-9216-0751-c95ddbfee52e@oracle.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 09.11.2021 02:34, Sean Christopherson wrote:
> On Tue, Nov 09, 2021, Maciej S. Szmigiero wrote:
>> On 04.11.2021 01:25, Sean Christopherson wrote:
>>> From: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
>>>
>>> There is no point in recalculating from scratch the total number of pages
>>> in all memslots each time a memslot is created or deleted.  Use KVM's
>>> cached nr_memslot_pages to compute the default max number of MMU pages.
>>>
>>> Signed-off-by: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
>>> [sean: use common KVM field and rework changelog accordingly]
> 
> Heh, and I forgot to add "and introduce bugs"
> 
>>> Signed-off-by: Sean Christopherson <seanjc@google.com>
>>> ---
>>>    arch/x86/include/asm/kvm_host.h |  1 -
>>>    arch/x86/kvm/mmu/mmu.c          | 24 ------------------------
>>>    arch/x86/kvm/x86.c              | 11 ++++++++---
>>>    3 files changed, 8 insertions(+), 28 deletions(-)
>>>
>> (..)
>>> --- a/arch/x86/kvm/x86.c
>>> +++ b/arch/x86/kvm/x86.c
>>> @@ -11837,9 +11837,14 @@ void kvm_arch_commit_memory_region(struct kvm *kvm,
>>>    				enum kvm_mr_change change)
>>>    {
>>>    	if (!kvm->arch.n_requested_mmu_pages &&
>>> -	    (change == KVM_MR_CREATE || change == KVM_MR_DELETE))
>>> -		kvm_mmu_change_mmu_pages(kvm,
>>> -				kvm_mmu_calculate_default_mmu_pages(kvm));
>>> +	    (change == KVM_MR_CREATE || change == KVM_MR_DELETE)) {
>>> +		unsigned long nr_mmu_pages;
>>> +
>>> +		nr_mmu_pages = kvm->nr_memslot_pages * KVM_PERMILLE_MMU_PAGES;
>>
>> Unfortunately, even if kvm->nr_memslot_pages is capped at ULONG_MAX then
>> this value multiplied by 20 can still overflow an unsigned long variable.
> 
> Doh.  And that likely subtly avoided by the compiler collapsing the "* 20 / 1000"
> into "/ 50".

Unfortunately in this case (but fortunately in general) C has well-defined
unsigned overflow behavior so if this code has an overflow by its naive
reading the compiler is not allowed to transform it to a form which
doesn't have this overflow (as it will result in a different value).

> Any objection to adding a patch to cut out the multiplication entirely?  Well, cut
> it from the source code, looks like gcc generates some fancy SHR+MUL to do the
> divide.
> 
> I'm thinking this:
> 
> #define KVM_MEMSLOT_PAGES_TO_MMU_PAGES_RATIO 50
> 
> 
> 	...
> 
> 	nr_mmu_pages = nr_pages / KVM_MEMSLOT_PAGES_TO_MMU_PAGES_RATIO;
> 
> 

I agree this would be a good solution to our problem, since this macro is
unlikely to be converted into something user-configurable in the future.
So its units don't matter.

Thanks,
Maciej

