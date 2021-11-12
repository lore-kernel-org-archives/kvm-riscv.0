From: Vitaly Kuznetsov <vkuznets@redhat.com>
Date: Fri, 12 Nov 2021 10:51:10 +0100
Subject: [PATCH 1/5] KVM: arm64: Cap KVM_CAP_NR_VCPUS by KVM_CAP_MAX_VCPUS
In-Reply-To: <a5cdff6878b7157587e92ebe4d5af362@kernel.org>
References: <20211111162746.100598-1-vkuznets@redhat.com>
 <20211111162746.100598-2-vkuznets@redhat.com>
 <a5cdff6878b7157587e92ebe4d5af362@kernel.org>
Message-ID: <875ysxg0s1.fsf@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Marc Zyngier <maz@kernel.org> writes:

> Hi Vitaly,
>
> On 2021-11-11 16:27, Vitaly Kuznetsov wrote:
>> It doesn't make sense to return the recommended maximum number of
>> vCPUs which exceeds the maximum possible number of vCPUs.
>> 
>> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
>> ---
>>  arch/arm64/kvm/arm.c | 7 ++++++-
>>  1 file changed, 6 insertions(+), 1 deletion(-)
>> 
>> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
>> index 7838e9fb693e..391dc7a921d5 100644
>> --- a/arch/arm64/kvm/arm.c
>> +++ b/arch/arm64/kvm/arm.c
>> @@ -223,7 +223,12 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, 
>> long ext)
>>  		r = 1;
>>  		break;
>>  	case KVM_CAP_NR_VCPUS:
>> -		r = num_online_cpus();
>> +		if (kvm)
>> +			r = min_t(unsigned int, num_online_cpus(),
>> +				  kvm->arch.max_vcpus);
>> +		else
>> +			r = min_t(unsigned int, num_online_cpus(),
>> +				  kvm_arm_default_max_vcpus());
>>  		break;
>>  	case KVM_CAP_MAX_VCPUS:
>>  	case KVM_CAP_MAX_VCPU_ID:
>
> This looks odd. This means that depending on the phase userspace is
> in while initialising the VM, KVM_CAP_NR_VCPUS can return one thing
> or the other.
>
> For example, I create a VM on a 32 CPU system, NR_VCPUS says 32.
> I create a GICv2 interrupt controller, it now says 8.
>
> That's a change in behaviour that is visible by userspace

Yes, I realize this is a userspace visible change. The reason I suggest
it is that logically, it seems very odd that the maximum recommended
number of vCPUs (KVM_CAP_NR_VCPUS) can be higher, than the maximum
supported number of vCPUs (KVM_CAP_MAX_VCPUS). All userspaces which use
this information somehow should already contain some workaround for this
case. (maybe it's a rare one and nobody hit it yet or maybe there are no
userspaces using KVM_CAP_NR_VCPUS for anything besides complaining --
like QEMU).

I'd like KVM to be consistent across architectures and have the same
(similar) meaning for KVM_CAP_NR_VCPUS.

> which I'm keen on avoiding. I'd rather have the kvm and !kvm cases
> return the same thing.

Forgive me my (ARM?) ignorance but what would it be then? If we go for
min(num_online_cpus(), kvm_arm_default_max_vcpus()) in both cases, cat
this can still go above KVM_CAP_MAX_VCPUS after vGIC is created?

Thanks for the feedback!

-- 
Vitaly


