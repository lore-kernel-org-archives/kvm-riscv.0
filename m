From: Gavin Shan <gshan@redhat.com>
Date: Wed, 8 Feb 2023 09:16:36 +1100
Subject: [PATCH 6/7] KVM: arm64: Change return type of
 kvm_vm_ioctl_mte_copy_tags() to "int"
In-Reply-To: <7b32d58b-846f-b8d7-165b-9f505e5f00f0@redhat.com>
References: <20230203094230.266952-1-thuth@redhat.com>
 <20230203094230.266952-7-thuth@redhat.com>
 <c6e605fe-f251-d8b6-64ed-bd1e17e79512@redhat.com>
 <7b32d58b-846f-b8d7-165b-9f505e5f00f0@redhat.com>
Message-ID: <d0b3a1e7-0864-f169-cdea-60ad95951b3f@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2/7/23 9:09 PM, Thomas Huth wrote:
> On 07/02/2023 01.09, Gavin Shan wrote:
>> Hi Thomas,
>>
>> On 2/3/23 8:42 PM, Thomas Huth wrote:
>>> This function only returns normal integer values, so there is
>>> no need to declare its return value as "long".
>>>
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>> ? arch/arm64/include/asm/kvm_host.h | 4 ++--
>>> ? arch/arm64/kvm/guest.c??????????? | 4 ++--
>>> ? 2 files changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
>>> index 35a159d131b5..b1a16343767f 100644
>>> --- a/arch/arm64/include/asm/kvm_host.h
>>> +++ b/arch/arm64/include/asm/kvm_host.h
>>> @@ -963,8 +963,8 @@ int kvm_arm_vcpu_arch_get_attr(struct kvm_vcpu *vcpu,
>>> ? int kvm_arm_vcpu_arch_has_attr(struct kvm_vcpu *vcpu,
>>> ???????????????????? struct kvm_device_attr *attr);
>>> -long kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
>>> -??????????????? struct kvm_arm_copy_mte_tags *copy_tags);
>>> +int kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
>>> +?????????????????? struct kvm_arm_copy_mte_tags *copy_tags);
>>> ? /* Guest/host FPSIMD coordination helpers */
>>> ? int kvm_arch_vcpu_run_map_fp(struct kvm_vcpu *vcpu);
>>> diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
>>> index cf4c495a4321..80e530549c34 100644
>>> --- a/arch/arm64/kvm/guest.c
>>> +++ b/arch/arm64/kvm/guest.c
>>> @@ -1013,8 +1013,8 @@ int kvm_arm_vcpu_arch_has_attr(struct kvm_vcpu *vcpu,
>>> ????? return ret;
>>> ? }
>>> -long kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
>>> -??????????????? struct kvm_arm_copy_mte_tags *copy_tags)
>>> +int kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
>>> +?????????????????? struct kvm_arm_copy_mte_tags *copy_tags)
>>> ? {
>>> ????? gpa_t guest_ipa = copy_tags->guest_ipa;
>>> ????? size_t length = copy_tags->length;
>>>
>>
>> It's possible for the function to return number of bytes have been copied.
>> Its type is 'size_t', same to 'unsigned long'. So 'int' doesn't have sufficient
>> space for it if I'm correct.
>>
>> long kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
>> ???????????????????????????????? struct kvm_arm_copy_mte_tags *copy_tags)
>> {
>> ???????? gpa_t guest_ipa = copy_tags->guest_ipa;
>> ???????? size_t length = copy_tags->length;
>> ???????? :
>> ???????? :
>> out:
>> ???????? mutex_unlock(&kvm->slots_lock);
>> ???????? /* If some data has been copied report the number of bytes copied */
>> ???????? if (length != copy_tags->length)
>> ???????????????? return copy_tags->length - length;
>> ???????? return ret;
>> }
> 
> Oh, drat, I thought I had checked all return statements ... this must have fallen through the cracks, sorry!
> 
> Anyway, this is already a problem now: The function is called from kvm_arch_vm_ioctl() (which still returns a long), which in turn is called from kvm_vm_ioctl() in virt/kvm/kvm_main.c. And that functions stores the return value in an "int r" variable. So the upper bits are already lost there.
> 
> Also, how is this supposed to work from user space? The normal "ioctl()" libc function just returns an "int" ? Is this ioctl already used in a userspace application somewhere? ... at least in QEMU, I didn't spot it yet...
> 

The ioctl command KVM_ARM_MTE_COPY_TAGS was merged recently and not used
by QEMU yet. I think struct kvm_arm_copy_mte_tags::length needs to be
'__u32' instead of '__u64' in order to standardize the return value.
Something like below. Documentation/virt/kvm/api.rst::section-4.130
needs update accordingly.

    struct kvm_arm_copy_mte_tags {
         __u64 guest_ipa;
         __u32 pad;
         __u32 length;
         void __user *addr;
         __u64 flags;
         __u64 reserved[2];
   };

Thanks,
Gavin


