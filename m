From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 13 Jul 2022 09:27:38 +0200
Subject: [GIT PULL] KVM/riscv fixes for 5.19, take #2
In-Reply-To: <CAAhSdy2gR3dtBHO0Q7+1xgMCytYkJgmuT6xiQ+WQiorQPMRUXA@mail.gmail.com>
References: <CAAhSdy1CAtr=mAVFtduTcED_Sjp2=4duQwgL5syxZ-sYM6SoWQ@mail.gmail.com>
 <01ec025d-fbde-5e58-2221-a368d4e1bb3a@redhat.com>
 <CAAhSdy2gR3dtBHO0Q7+1xgMCytYkJgmuT6xiQ+WQiorQPMRUXA@mail.gmail.com>
Message-ID: <5610de7f-5a28-288a-b6bc-9ad7a36e27be@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 7/13/22 09:17, Anup Patel wrote:
> On Wed, Jul 13, 2022 at 11:30 AM Paolo Bonzini <pbonzini@redhat.com> wrote:
>>
>> On 7/13/22 07:47, Anup Patel wrote:
>>> Hi Paolo,
>>>
>>> We have two more fixes for 5.19 which were discovered recently:
>>> 1) Fix missing PAGE_PFN_MASK
>>> 2) Fix SRCU deadlock caused by kvm_riscv_check_vcpu_requests()
>>
>> Pulled, thanks.
>>
>> For the latter, my suggestion is to remove KVM_REQ_SLEEP completely and
>> key the waiting on kvm_arch_vcpu_runnable using kvm_vcpu_halt or
>> kvm_vcpu_block.
> 
> We are using KVM_REQ_SLEEP for VCPU hotplug. The secondary
> VCPUs will block until woken-up by using an SBI call from other VCPU.
> This is different from blocking on WFI where VCPU will wake-up upon
> any interrupt.

Yes, I understand.  The idea is to have something like

	if (kvm_arch_vcpu_runnable())
		vcpu_enter_guest(vcpu);
	else
		kvm_vcpu_block(vcpu);

instead of using KVM_REQ_SLEEP to enter the blocking loop.  This works 
for both WFI and hotplug, the only difference between the two cases is 
the event that changes kvm_arch_vcpu_runnable() to true.

Paolo

> I agree with your suggestion, we should definitely use kvm_vcpu_block()
> here.
> 
>>
>> Also, I only had a quick look but it seems like vcpu->arch.pause is
>> never written?
> 
> Yes, the vcpu->arch.pause is redundant. I will remove it.
> 
>>
>> Paolo
>>
> 
> Thanks,
> Anup
> 


