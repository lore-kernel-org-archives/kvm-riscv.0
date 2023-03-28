From: Alexey Kardashevskiy <aik@ozlabs.ru>
Date: Tue, 28 Mar 2023 15:30:59 +1100
Subject: [PATCH kernel v4] KVM: PPC: Make KVM_CAP_IRQFD_RESAMPLE support
 platform dependent
In-Reply-To: <ZBH9fZ3aMnHKtrZj@google.com>
References: <20221003235722.2085145-1-aik@ozlabs.ru>
 <ZBH9fZ3aMnHKtrZj@google.com>
Message-ID: <67d99abd-19bd-8c01-2cac-80102878fa77@ozlabs.ru>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 16/03/2023 04:16, Sean Christopherson wrote:
> +Michael and KVM s390 maintainers
> 
> On Tue, Oct 04, 2022, Alexey Kardashevskiy wrote:
>> When introduced, IRQFD resampling worked on POWER8 with XICS. However
>> KVM on POWER9 has never implemented it - the compatibility mode code
>> ("XICS-on-XIVE") misses the kvm_notify_acked_irq() call and the native
>> XIVE mode does not handle INTx in KVM at all.
>>
>> This moved the capability support advertising to platforms and stops
>> advertising it on XIVE, i.e. POWER9 and later.
>>
>> This should cause no behavioural change for other architectures.
>>
>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>> Acked-by: Nicholas Piggin <npiggin@gmail.com>
>> Acked-by: Marc Zyngier <maz@kernel.org>
>> ---
> 
> If no one objects, I'll grab this for 6.4 and route it through kvm-x86/generic.
> >> diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
>> index fb1490761c87..908ce8bd91c9 100644
>> --- a/arch/powerpc/kvm/powerpc.c
>> +++ b/arch/powerpc/kvm/powerpc.c
>> @@ -593,6 +593,12 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>>                  break;
>>   #endif
>>
>> +#ifdef CONFIG_HAVE_KVM_IRQFD
>> +       case KVM_CAP_IRQFD_RESAMPLE:
>> +               r = !xive_enabled();
>> +               break;
>> +#endif
> 
> @PPC folks, do you want to avoid the #ifdef?  If so, I can tweak to this when
> applying.


I am not PPC folks anymore (this is just my backlog) but I do not see 
why not (get rid of ifdef), it is just that file uses #ifdef lot more 
than IS_ENABLED. Thanks,


> 	case KVM_CAP_IRQFD_RESAMPLE:
> 		r = IS_ENABLED(CONFIG_HAVE_KVM_IRQFD) && !xive_enabled();
> 		break;

-- 
Alexey

