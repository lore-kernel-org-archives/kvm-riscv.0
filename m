From: maobibo <maobibo@loongson.cn>
Date: Tue, 6 Aug 2024 09:16:30 +0800
Subject: [PATCH v12 64/84] KVM: LoongArch: Mark "struct page" pfns dirty
 only in "slow" page fault path
In-Reply-To: <ZrFezgVbCI3DRQH3@google.com>
References: <20240726235234.228822-1-seanjc@google.com>
 <20240726235234.228822-65-seanjc@google.com>
 <a039b758-d4e3-3798-806f-25bceb2f33a5@loongson.cn>
 <Zq00OYowF5kc9QFE@google.com>
 <345d89c1-4f31-6b49-2cd4-a0696210fa7c@loongson.cn>
 <ZrFezgVbCI3DRQH3@google.com>
Message-ID: <d673ec04-5445-6233-81e2-49863d044bf0@loongson.cn>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 2024/8/6 ??7:22, Sean Christopherson wrote:
> On Sat, Aug 03, 2024, maobibo wrote:
>> On 2024/8/3 ??3:32, Sean Christopherson wrote:
>>> On Fri, Aug 02, 2024, maobibo wrote:
>>>> On 2024/7/27 ??7:52, Sean Christopherson wrote:
>>>>> Mark pages/folios dirty only the slow page fault path, i.e. only when
>>>>> mmu_lock is held and the operation is mmu_notifier-protected, as marking a
>>>>> page/folio dirty after it has been written back can make some filesystems
>>>>> unhappy (backing KVM guests will such filesystem files is uncommon, and
>>>>> the race is minuscule, hence the lack of complaints).
>>>>>
>>>>> See the link below for details.
>>>>>
>>>>> Link: https://lore.kernel.org/all/cover.1683044162.git.lstoakes at gmail.com
>>>>> Signed-off-by: Sean Christopherson <seanjc@google.com>
>>>>> ---
>>>>>     arch/loongarch/kvm/mmu.c | 18 ++++++++++--------
>>>>>     1 file changed, 10 insertions(+), 8 deletions(-)
>>>>>
>>>>> diff --git a/arch/loongarch/kvm/mmu.c b/arch/loongarch/kvm/mmu.c
>>>>> index 2634a9e8d82c..364dd35e0557 100644
>>>>> --- a/arch/loongarch/kvm/mmu.c
>>>>> +++ b/arch/loongarch/kvm/mmu.c
>>>>> @@ -608,13 +608,13 @@ static int kvm_map_page_fast(struct kvm_vcpu *vcpu, unsigned long gpa, bool writ
>>>>>     		if (kvm_pte_young(changed))
>>>>>     			kvm_set_pfn_accessed(pfn);
>>>>> -		if (kvm_pte_dirty(changed)) {
>>>>> -			mark_page_dirty(kvm, gfn);
>>>>> -			kvm_set_pfn_dirty(pfn);
>>>>> -		}
>>>>>     		if (page)
>>>>>     			put_page(page);
>>>>>     	}
>>>>> +
>>>>> +	if (kvm_pte_dirty(changed))
>>>>> +		mark_page_dirty(kvm, gfn);
>>>>> +
>>>>>     	return ret;
>>>>>     out:
>>>>>     	spin_unlock(&kvm->mmu_lock);
>>>>> @@ -915,12 +915,14 @@ static int kvm_map_page(struct kvm_vcpu *vcpu, unsigned long gpa, bool write)
>>>>>     	else
>>>>>     		++kvm->stat.pages;
>>>>>     	kvm_set_pte(ptep, new_pte);
>>>>> -	spin_unlock(&kvm->mmu_lock);
>>>>> -	if (prot_bits & _PAGE_DIRTY) {
>>>>> -		mark_page_dirty_in_slot(kvm, memslot, gfn);
>>>>> +	if (writeable)
>>>> Is it better to use write or (prot_bits & _PAGE_DIRTY) here?  writable is
>>>> pte permission from function hva_to_pfn_slow(), write is fault action.
>>>
>>> Marking folios dirty in the slow/full path basically necessitates marking the
>>> folio dirty if KVM creates a writable SPTE, as KVM won't mark the folio dirty
>>> if/when _PAGE_DIRTY is set.
>>>
>>> Practically speaking, I'm 99.9% certain it doesn't matter.  The folio is marked
>>> dirty by core MM when the folio is made writable, and cleaning the folio triggers
>>> an mmu_notifier invalidation.  I.e. if the page is mapped writable in KVM's
>> yes, it is. Thanks for the explanation. kvm_set_pfn_dirty() can be put only
>> in slow page fault path. I only concern with fault type, read fault type can
>> set pte entry writable however not _PAGE_DIRTY at stage-2 mmu table.
>>
>>> stage-2 PTEs, then its folio has already been marked dirty.
>> Considering one condition although I do not know whether it exists actually.
>> user mode VMM writes the folio with hva address firstly, then VCPU thread
>> *reads* the folio. With primary mmu table, pte entry is writable and
>> _PAGE_DIRTY is set, with secondary mmu table(state-2 PTE table), it is
>> pte_none since the filio is accessed at first time, so there will be slow
>> page fault path for stage-2 mmu page table filling.
>>
>> Since it is read fault, stage-2 PTE will be created with _PAGE_WRITE(coming
>> from function hva_to_pfn_slow()), however _PAGE_DIRTY is not set. Do we need
>> call kvm_set_pfn_dirty() at this situation?
> 
> If KVM doesn't mark the folio dirty when the stage-2 _PAGE_DIRTY flag is set,
> i.e. as proposed in this series, then yes, KVM needs to call kvm_set_pfn_dirty()
> even though the VM hasn't (yet) written to the memory.  In practice, KVM calling
> kvm_set_pfn_dirty() is redundant the majority of the time, as the stage-1 PTE
> will have _PAGE_DIRTY set, and that will get propagated to the folio when the
> primary MMU does anything relevant with the PTE.  And for file systems that care
> about writeback, odds are very good that the folio was marked dirty even earlier,
> when MM invoked vm_operations_struct.page_mkwrite().
> 
> The reason I am pushing to have all architectures mark pages/folios dirty in the
> slow page fault path is that a false positive (marking a folio dirty without the
> folio ever being written in _any_ context since the last pte_mkclean()) is rare,
> and at worst results an unnecessary writeback.  On the other hand, marking folios
It does not influence the result. At worst there is one unnecessary 
kvm_set_pfn_dirty() before the last pte_mkclean(). That is ok for me, 
and thanks for your detailed explanation.

> dirty in fast page fault handlers (or anywhere else that isn't protected by
> mmu_notifiers) is technically unsafe.
yeap, moving marking folios dirty to slow fault handler makes logic 
clear and simple here, and technically safer.

Regards
Bibo Mao
> 
> In other words, the intent is to sacrifice accuracy to improve stability/robustness,
> because the vast majority of time the loss in accuracy has no effect, and the worst
> case scenario is that the kernel does I/O that wasn't necessary.
> 


