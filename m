From: Samuel Holland <samuel.holland@sifive.com>
Date: Wed, 4 Sep 2024 09:57:13 -0500
Subject: [PATCH v4 09/10] RISC-V: KVM: Allow Smnpm and Ssnpm extensions
 for guests
In-Reply-To: <CAAhSdy08SoDoZCii9R--BK7_NKLnRciW7V3mo2aQRKW1dbOgNg@mail.gmail.com>
References: <20240829010151.2813377-1-samuel.holland@sifive.com>
 <20240829010151.2813377-10-samuel.holland@sifive.com>
 <CAK9=C2WjraWjuQCeU2Y4Jhr-gKkOcP42Sza7wVp0FgeGaD923g@mail.gmail.com>
 <b6de8769-7e4e-4a19-b239-a39fd424e0c8@sifive.com>
 <CAAhSdy08SoDoZCii9R--BK7_NKLnRciW7V3mo2aQRKW1dbOgNg@mail.gmail.com>
Message-ID: <20ab0fa2-d5dd-446d-9fff-a3ef82e8db35@sifive.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Anup,

On 2024-09-04 9:45 AM, Anup Patel wrote:
> On Wed, Sep 4, 2024 at 8:01?PM Samuel Holland <samuel.holland@sifive.com> wrote:
>> On 2024-09-04 7:17 AM, Anup Patel wrote:
>>> On Thu, Aug 29, 2024 at 6:32?AM Samuel Holland
>>> <samuel.holland@sifive.com> wrote:
>>>>
>>>> The interface for controlling pointer masking in VS-mode is henvcfg.PMM,
>>>> which is part of the Ssnpm extension, even though pointer masking in
>>>> HS-mode is provided by the Smnpm extension. As a result, emulating Smnpm
>>>> in the guest requires (only) Ssnpm on the host.
>>>>
>>>> Since the guest configures Smnpm through the SBI Firmware Features
>>>> interface, the extension can be disabled by failing the SBI call. Ssnpm
>>>> cannot be disabled without intercepting writes to the senvcfg CSR.
>>>>
>>>> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
>>>> ---
>>>>
>>>> (no changes since v2)
>>>>
>>>> Changes in v2:
>>>>  - New patch for v2
>>>>
>>>>  arch/riscv/include/uapi/asm/kvm.h | 2 ++
>>>>  arch/riscv/kvm/vcpu_onereg.c      | 3 +++
>>>>  2 files changed, 5 insertions(+)
>>>>
>>>> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
>>>> index e97db3296456..4f24201376b1 100644
>>>> --- a/arch/riscv/include/uapi/asm/kvm.h
>>>> +++ b/arch/riscv/include/uapi/asm/kvm.h
>>>> @@ -175,6 +175,8 @@ enum KVM_RISCV_ISA_EXT_ID {
>>>>         KVM_RISCV_ISA_EXT_ZCF,
>>>>         KVM_RISCV_ISA_EXT_ZCMOP,
>>>>         KVM_RISCV_ISA_EXT_ZAWRS,
>>>> +       KVM_RISCV_ISA_EXT_SMNPM,
>>>> +       KVM_RISCV_ISA_EXT_SSNPM,
>>>>         KVM_RISCV_ISA_EXT_MAX,
>>>>  };
>>>>
>>>> diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
>>>> index b319c4c13c54..6f833ec2344a 100644
>>>> --- a/arch/riscv/kvm/vcpu_onereg.c
>>>> +++ b/arch/riscv/kvm/vcpu_onereg.c
>>>> @@ -34,9 +34,11 @@ static const unsigned long kvm_isa_ext_arr[] = {
>>>>         [KVM_RISCV_ISA_EXT_M] = RISCV_ISA_EXT_m,
>>>>         [KVM_RISCV_ISA_EXT_V] = RISCV_ISA_EXT_v,
>>>>         /* Multi letter extensions (alphabetically sorted) */
>>>> +       [KVM_RISCV_ISA_EXT_SMNPM] = RISCV_ISA_EXT_SSNPM,
>>>
>>> Why not use KVM_ISA_EXT_ARR() macro here ?
>>
>> Because the extension name in the host does not match the extension name in the
>> guest. Pointer masking for HS mode is provided by Smnpm. Pointer masking for VS
>> mode is provided by Ssnpm at the hardware level, but this needs to appear to the
>> guest as if Smnpm was implemented, since the guest thinks it is running on bare
>> metal.
> 
> Okay, makes sense.
> 
>>
>>>>         KVM_ISA_EXT_ARR(SMSTATEEN),
>>>>         KVM_ISA_EXT_ARR(SSAIA),
>>>>         KVM_ISA_EXT_ARR(SSCOFPMF),
>>>> +       KVM_ISA_EXT_ARR(SSNPM),
>>>>         KVM_ISA_EXT_ARR(SSTC),
>>>>         KVM_ISA_EXT_ARR(SVINVAL),
>>>>         KVM_ISA_EXT_ARR(SVNAPOT),
>>>> @@ -129,6 +131,7 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
>>>>         case KVM_RISCV_ISA_EXT_M:
>>>>         /* There is not architectural config bit to disable sscofpmf completely */
>>>>         case KVM_RISCV_ISA_EXT_SSCOFPMF:
>>>> +       case KVM_RISCV_ISA_EXT_SSNPM:
>>>
>>> Why not add KVM_RISCV_ISA_EXT_SMNPM here ?
>>>
>>> Disabling Smnpm from KVM user space is very different from
>>> disabling Smnpm from Guest using SBI FWFT extension.
>>
>> Until a successful SBI FWFT call to KVM to enable pointer masking for VS mode,
>> the existence of Smnpm has no visible effect on the guest. So failing the SBI
>> call is sufficient to pretend that the hardware does not support Smnpm.
>>
>>> The KVM user space should always add Smnpm in the
>>> Guest ISA string whenever the Host ISA string has it.
>>
>> I disagree. Allowing userspace to disable extensions is useful for testing and
>> to support migration to hosts which do not support those extensions. So I would
>> only add extensions to this list if there is no possible way to disable them.
> 
> I am not saying to disallow KVM user space disabling Smnpm.

Then I'm confused. This is the "return false;" switch case inside
kvm_riscv_vcpu_isa_disable_allowed(). If I add KVM_RISCV_ISA_EXT_SMNPM here,
then (unless I am misreading the code) I am disallowing KVM userspace from
disabling Smnpm in the guest (i.e. preventing KVM userspace from removing Smnpm
from the guest ISA string). If that is not desired, then why do you suggest I
add KVM_RISCV_ISA_EXT_SMNPM here?

> The presence of Smnpm in ISA only means that it is present in HW
> but it needs to be explicitly configured/enabled using SBI FWFT.
> 
> KVM user space can certainly disable extensions by not adding it to
> ISA string based on the KVMTOOL/QEMU-KVM command line option.
> Additionally, when SBI FWFT is added to KVM RISC-V. It will have its
> own way to explicitly disable firmware features from KVM user space.

I think we agree on this, but your explanation here appears to conflict with
your suggested code change. Apologies if I'm missing something.

Regards,
Samuel

>>> The Guest must explicitly use SBI FWFT to enable
>>> Smnpm only after it sees Smnpm in ISA string.
>>
>> Yes, exactly, and the purpose of not including Smnpm in the switch case here is
>> so that KVM user space can control whether or not it appears in the ISA string.
>>
>> Regards,
>> Samuel
>>
>>>>         case KVM_RISCV_ISA_EXT_SSTC:
>>>>         case KVM_RISCV_ISA_EXT_SVINVAL:
>>>>         case KVM_RISCV_ISA_EXT_SVNAPOT:
>>>> --
>>>> 2.45.1
>>>>
>>>>
>>>> _______________________________________________
>>>> linux-riscv mailing list
>>>> linux-riscv at lists.infradead.org
>>>> http://lists.infradead.org/mailman/listinfo/linux-riscv
>>>
>>> Regards,
>>> Anup
>>
> 
> Regards,
> Anup


