From: Thomas Huth <thuth@redhat.com>
Date: Tue, 7 Feb 2023 10:26:39 +0100
Subject: [PATCH 2/7] KVM: x86: Improve return type handling in
 kvm_vm_ioctl_get_nr_mmu_pages()
In-Reply-To: <Y91JAb0kKBYQjO8a@google.com>
References: <20230203094230.266952-1-thuth@redhat.com>
 <20230203094230.266952-3-thuth@redhat.com> <Y91JAb0kKBYQjO8a@google.com>
Message-ID: <579f432d-6100-0ba1-5ba4-f72349ec9173@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 03/02/2023 18.48, Sean Christopherson wrote:
> On Fri, Feb 03, 2023, Thomas Huth wrote:
>> kvm_vm_ioctl_get_nr_mmu_pages() tries to return a "unsigned long" value,
>> but its caller only stores ther return value in an "int" - which is also
>> what all the other kvm_vm_ioctl_*() functions are returning. So returning
>> values that do not fit into a 32-bit integer anymore does not work here.
>> It's better to adjust the return type, add a sanity check and return an
>> error instead if the value is too big.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   arch/x86/kvm/x86.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
>> index da4bbd043a7b..caa2541833dd 100644
>> --- a/arch/x86/kvm/x86.c
>> +++ b/arch/x86/kvm/x86.c
>> @@ -6007,8 +6007,11 @@ static int kvm_vm_ioctl_set_nr_mmu_pages(struct kvm *kvm,
>>   	return 0;
>>   }
>>   
>> -static unsigned long kvm_vm_ioctl_get_nr_mmu_pages(struct kvm *kvm)
>> +static int kvm_vm_ioctl_get_nr_mmu_pages(struct kvm *kvm)
>>   {
>> +	if (kvm->arch.n_max_mmu_pages > INT_MAX)
>> +		return -EOVERFLOW;
>> +
>>   	return kvm->arch.n_max_mmu_pages;
>>   }
> 
> My vote is to skip this patch, skip deprecation, and go straight to deleting
> KVM_GET_NR_MMU_PAGES.  The ioctl() has never worked[*], and none of the VMMs I
> checked use it (QEMU, Google's internal VMM, kvmtool, CrosVM).

I guess I'm living too much in the QEMU world where things need to be 
deprecated first before removing them ;-)
But sure, if everybody agrees that removing this directly is fine, too, I 
can do this in v2.

  Thomas


PS: Has there ever been a discussion about the other deprecated interfaces 
in include/uapi/linux/kvm.h ? Most of the stuff there seems to be from 2009 
... so maybe it's time now to remove that, too?


