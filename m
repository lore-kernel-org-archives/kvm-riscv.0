From: Cornelia Huck <cohuck@redhat.com>
Date: Wed, 08 Feb 2023 09:49:16 +0100
Subject: [PATCH 6/7] KVM: arm64: Change return type of
 kvm_vm_ioctl_mte_copy_tags() to "int"
In-Reply-To: <d0b3a1e7-0864-f169-cdea-60ad95951b3f@redhat.com>
References: <20230203094230.266952-1-thuth@redhat.com>
 <20230203094230.266952-7-thuth@redhat.com>
 <c6e605fe-f251-d8b6-64ed-bd1e17e79512@redhat.com>
 <7b32d58b-846f-b8d7-165b-9f505e5f00f0@redhat.com>
 <d0b3a1e7-0864-f169-cdea-60ad95951b3f@redhat.com>
Message-ID: <87zg9oleyb.fsf@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Feb 08 2023, Gavin Shan <gshan@redhat.com> wrote:

> On 2/7/23 9:09 PM, Thomas Huth wrote:
>> Oh, drat, I thought I had checked all return statements ... this must have fallen through the cracks, sorry!
>> 
>> Anyway, this is already a problem now: The function is called from kvm_arch_vm_ioctl() (which still returns a long), which in turn is called from kvm_vm_ioctl() in virt/kvm/kvm_main.c. And that functions stores the return value in an "int r" variable. So the upper bits are already lost there.
>> 
>> Also, how is this supposed to work from user space? The normal "ioctl()" libc function just returns an "int" ? Is this ioctl already used in a userspace application somewhere? ... at least in QEMU, I didn't spot it yet...
>> 

We will need it in QEMU to implement migration with MTE (the current
proposal simply adds a migration blocker when MTE is enabled, as there
are various other things that need to be figured out for this to work.)
But maybe other VMMs already use it (and have been lucky because they
always dealt with shorter lengths?)

>
> The ioctl command KVM_ARM_MTE_COPY_TAGS was merged recently and not used
> by QEMU yet. I think struct kvm_arm_copy_mte_tags::length needs to be
> '__u32' instead of '__u64' in order to standardize the return value.
> Something like below. Documentation/virt/kvm/api.rst::section-4.130
> needs update accordingly.
>
>     struct kvm_arm_copy_mte_tags {
>          __u64 guest_ipa;
>          __u32 pad;
>          __u32 length;
>          void __user *addr;
>          __u64 flags;
>          __u64 reserved[2];
>    };

Can we do this in a more compatible way, as we are dealing with an API?
Like returning -EINVAL if length is too big?


