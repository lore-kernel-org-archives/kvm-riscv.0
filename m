From: Thomas Huth <thuth@redhat.com>
Date: Wed, 8 Feb 2023 13:16:38 +0100
Subject: [PATCH 6/7] KVM: arm64: Change return type of
 kvm_vm_ioctl_mte_copy_tags() to "int"
In-Reply-To: <ce11001e-dbe5-8694-71a5-841f4d614456@arm.com>
References: <20230203094230.266952-1-thuth@redhat.com>
 <20230203094230.266952-7-thuth@redhat.com>
 <c6e605fe-f251-d8b6-64ed-bd1e17e79512@redhat.com>
 <7b32d58b-846f-b8d7-165b-9f505e5f00f0@redhat.com>
 <d0b3a1e7-0864-f169-cdea-60ad95951b3f@redhat.com> <87zg9oleyb.fsf@redhat.com>
 <ce11001e-dbe5-8694-71a5-841f4d614456@arm.com>
Message-ID: <ac8073a3-868f-a923-4cb8-fda4785e7484@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 08/02/2023 12.51, Steven Price wrote:
> On 08/02/2023 08:49, Cornelia Huck wrote:
>> On Wed, Feb 08 2023, Gavin Shan <gshan@redhat.com> wrote:
>>
>>> On 2/7/23 9:09 PM, Thomas Huth wrote:
>>>> Oh, drat, I thought I had checked all return statements ... this must have fallen through the cracks, sorry!
>>>>
>>>> Anyway, this is already a problem now: The function is called from kvm_arch_vm_ioctl() (which still returns a long), which in turn is called from kvm_vm_ioctl() in virt/kvm/kvm_main.c. And that functions stores the return value in an "int r" variable. So the upper bits are already lost there.
> 
> Sorry about that, I was caught out by kvm_arch_vm_ioctl() returning long...

That's why I'm trying to fix that return type mess with my series, to avoid 
such problems in the future :-)

>>>> Also, how is this supposed to work from user space? The normal "ioctl()" libc function just returns an "int" ? Is this ioctl already used in a userspace application somewhere? ... at least in QEMU, I didn't spot it yet...
>>>>
>>
>> We will need it in QEMU to implement migration with MTE (the current
>> proposal simply adds a migration blocker when MTE is enabled, as there
>> are various other things that need to be figured out for this to work.)
>> But maybe other VMMs already use it (and have been lucky because they
>> always dealt with shorter lengths?)
>>
>>>
>>> The ioctl command KVM_ARM_MTE_COPY_TAGS was merged recently and not used
>>> by QEMU yet. I think struct kvm_arm_copy_mte_tags::length needs to be
>>> '__u32' instead of '__u64' in order to standardize the return value.
>>> Something like below. Documentation/virt/kvm/api.rst::section-4.130
>>> needs update accordingly.
>>>
>>>      struct kvm_arm_copy_mte_tags {
>>>           __u64 guest_ipa;
>>>           __u32 pad;
>>>           __u32 length;
>>>           void __user *addr;
>>>           __u64 flags;
>>>           __u64 reserved[2];
>>>     };
>>
>> Can we do this in a more compatible way, as we are dealing with an API?
>> Like returning -EINVAL if length is too big?
>>
> 
> I agree the simplest fix for the problem is simply to reject any
> lengths>INT_MAX:
> 
> diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
> index cf4c495a4321..94aed7ce85c4 100644
> --- a/arch/arm64/kvm/guest.c
> +++ b/arch/arm64/kvm/guest.c
> @@ -1032,6 +1032,13 @@ long kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
>   	if (copy_tags->flags & ~KVM_ARM_TAGS_FROM_GUEST)
>   		return -EINVAL;
> 
> +	/*
> +	 * ioctl returns int, so lengths above INT_MAX cannot be
> +	 * represented in the return value
> +	 */
> +	if (length > INT_MAX)
> +		return -EINVAL;
> +
>   	if (length & ~PAGE_MASK || guest_ipa & ~PAGE_MASK)
>   		return -EINVAL;
> 
> This could also be fixed in a useable way by including a new flag which
> returns the length in an output field of the ioctl structure. I'm
> guessing a 2GB limit would be annoying to work around.

I agree that checking for length > INT_MAX is likely the best thing to do 
here right now. I'll add that in v2 of my series.

But actually, this might even be a good thing from another point of view (so 
I'm not sure whether your idea with the flag should really be pursued): The 
code here takes a mutex and then runs a while loop that depends on the 
length - which could cause the lock to be held for a rather long time if 
length is a 64-bit value. Forcing the user space to limit the length here 
could help to avoid taking the lock for too long.

  Thomas


