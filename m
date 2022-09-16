From: Marc Zyngier <maz@misterjones.org>
Date: Fri, 16 Sep 2022 10:00:45 +0100
Subject: [PATCH kernel] KVM: PPC: Make KVM_CAP_IRQFD_RESAMPLE platform
 dependent
In-Reply-To: <59dfb450-5a91-f27b-6edf-0adfa89729b7@ozlabs.ru>
References: <20220504074807.3616813-1-aik@ozlabs.ru>
 <0d4bb0fa-10c6-3f5a-34c8-293144b3fdbb@ozlabs.ru>
 <59dfb450-5a91-f27b-6edf-0adfa89729b7@ozlabs.ru>
Message-ID: <4884805567a0288ab1dbefb8aec819a2@misterjones.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2022-09-13 13:50, Alexey Kardashevskiy wrote:
> Ping? It's been a while and probably got lost :-/
> 
> On 18/05/2022 16:27, Alexey Kardashevskiy wrote:
>> 
>> 
>> On 5/4/22 17:48, Alexey Kardashevskiy wrote:
>>> When introduced, IRQFD resampling worked on POWER8 with XICS. However
>>> KVM on POWER9 has never implemented it - the compatibility mode code
>>> ("XICS-on-XIVE") misses the kvm_notify_acked_irq() call and the 
>>> native
>>> XIVE mode does not handle INTx in KVM at all.
>>> 
>>> This moved the capability support advertising to platforms and stops
>>> advertising it on XIVE, i.e. POWER9 and later.
>>> 
>>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>>> ---
>>> 
>>> 
>>> Or I could move this one together with KVM_CAP_IRQFD. Thoughts?
>> 
>> 
>> Ping?
>> 
>>> 
>>> ---
>>> ? arch/arm64/kvm/arm.c?????? | 3 +++
>>> ? arch/mips/kvm/mips.c?????? | 3 +++
>>> ? arch/powerpc/kvm/powerpc.c | 6 ++++++
>>> ? arch/riscv/kvm/vm.c??????? | 3 +++
>>> ? arch/s390/kvm/kvm-s390.c?? | 3 +++
>>> ? arch/x86/kvm/x86.c???????? | 3 +++
>>> ? virt/kvm/kvm_main.c??????? | 1 -
>>> ? 7 files changed, 21 insertions(+), 1 deletion(-)
>>> 
>>> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
>>> index 523bc934fe2f..092f0614bae3 100644
>>> --- a/arch/arm64/kvm/arm.c
>>> +++ b/arch/arm64/kvm/arm.c
>>> @@ -210,6 +210,9 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, 
>>> long ext)
>>> ????? case KVM_CAP_SET_GUEST_DEBUG:
>>> ????? case KVM_CAP_VCPU_ATTRIBUTES:
>>> ????? case KVM_CAP_PTP_KVM:
>>> +#ifdef CONFIG_HAVE_KVM_IRQFD
>>> +??? case KVM_CAP_IRQFD_RESAMPLE:
>>> +#endif

I don't mind moving this around, but I object to the #ifdefery.

This option is always selected on arm64, so it can safely be added
to the list without any condition.

Thanks,

         M.
-- 
Who you jivin' with that Cosmik Debris?

