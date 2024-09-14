From: Samuel Holland <samuel.holland@sifive.com>
Date: Sat, 14 Sep 2024 11:39:45 -0500
Subject: [PATCH] RISC-V: KVM: Redirect instruction access fault trap to
 guest
In-Reply-To: <CAAhSdy1zSTWuTW1KohUDXr9UXUx-QL1A30AUkTGoL7W2L7JWLQ@mail.gmail.com>
References: <83c2234d582b7e823ce9ac9b73a6bbcf63971a29.1724911120.git.zhouquan@iscas.ac.cn>
 <b5128162-278a-4284-8271-b2b91dc446e1@iscas.ac.cn>
 <380f4da9-50e9-4632-bdc8-b1723eb19ca5@sifive.com>
 <CAAhSdy1zSTWuTW1KohUDXr9UXUx-QL1A30AUkTGoL7W2L7JWLQ@mail.gmail.com>
Message-ID: <d161a6ea-6975-4427-8de8-93d4ee9e80fb@sifive.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Anup,

On 2024-09-12 11:32 PM, Anup Patel wrote:
> On Fri, Sep 13, 2024 at 6:09?AM Samuel Holland
> <samuel.holland@sifive.com> wrote:
>>
>> On 2024-09-12 4:03 AM, Quan Zhou wrote:
>>>
>>> On 2024/8/29 14:20, zhouquan at iscas.ac.cn wrote:
>>>> From: Quan Zhou <zhouquan@iscas.ac.cn>
>>>>
>>>> The M-mode redirects an unhandled instruction access
>>>> fault trap back to S-mode when not delegating it to
>>>> VS-mode(hedeleg). However, KVM running in HS-mode
>>>> terminates the VS-mode software when back from M-mode.
>>>>
>>>> The KVM should redirect the trap back to VS-mode, and
>>>> let VS-mode trap handler decide the next step.
>>>>
>>>> Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
>>>> ---
>>>>   arch/riscv/kvm/vcpu_exit.c | 1 +
>>>>   1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
>>>> index fa98e5c024b2..696b62850d0b 100644
>>>> --- a/arch/riscv/kvm/vcpu_exit.c
>>>> +++ b/arch/riscv/kvm/vcpu_exit.c
>>>> @@ -182,6 +182,7 @@ int kvm_riscv_vcpu_exit(struct kvm_vcpu *vcpu, struct
>>>> kvm_run *run,
>>>>       ret = -EFAULT;
>>>>       run->exit_reason = KVM_EXIT_UNKNOWN;
>>>>       switch (trap->scause) {
>>>> +    case EXC_INST_ACCESS:
>>>
>>> A gentle ping, the instruction access fault should be redirected to
>>> VS-mode for handling, is my understanding correct?
>>
>> Yes, this looks correct. However, I believe it would be equivalent (and more
>> efficient) to add EXC_INST_ACCESS to KVM_HEDELEG_DEFAULT in asm/kvm_host.h.
>>
>> I don't understand why some exceptions are delegated with hedeleg and others are
>> caught and redirected here with no further processing. Maybe someone thought
>> that it wasn't valid to set a bit in hedeleg if the corresponding bit was
>> cleared in medeleg? But this doesn't make sense, as S-mode cannot know which
>> bits are set in medeleg (maybe none are!).
>>
>> So the hypervisor must either:
>>  1) assume M-mode firmware checks hedeleg and redirects exceptions to VS-mode
>>     regardless of medeleg, in which case all four of these exceptions can be
>>     moved to KVM_HEDELEG_DEFAULT and removed from this switch statement, or
>>
>>  2) assume M-mode might not check hedeleg and redirect exceptions to VS-mode,
>>     and since no bits are guaranteed to be set in medeleg, any bit set in
>>     hedeleg must _also_ be handled in the switch case here.
>>
>> Anup, Atish, thoughts?
> 
> Any exception delegated to VS-mode via hedeleg means it is directly delivered
> to VS-mode without any intervention of HS-mode. This aligns with the RISC-V
> priv specification and there is no alternate semantics assumed by KVM RISC-V.
> 
> At the moment, for KVM RISC-V we are converging towards the following
> approach:
> 
> 1) Only delegate "supervisor expected" traps to VS-mode via hedeleg
> which supervisor software is generally expected to directly handle such
> as breakpoint, user syscall, inst page fault, load page fault, and store
> page fault.
> 
> 2) Other "supervisor unexpected" traps are redirected to VS-mode via
> software in HS-mode because these are not typically expected by supervisor
> software and KVM RISC-V should at least gather some stats for such traps.

Can you point me to where we collect stats for these traps? I don't see any code
in kvm_riscv_vcpu_exit() that does this.

> Previously, we were redirecting such unexpect traps to KVM user space
> where the KVM user space tool will simply dump the VCPU state and kill
> the Guest/VM.

Currently we have 5 exception types that go through software in HS-mode but
never kill the guest: EXC_INST_ILLEGAL, EXC_LOAD_MISALIGNED,
EXC_STORE_MISALIGNED, EXC_LOAD_ACCESS, and EXC_STORE_ACCESS. Are those
considered "expected" or "unexpected"?

> The inst misaligned trap was historically always set in hedeleg but we
> should update it based on the above approach.

What are the criteria for determining if a trap is "supervisor expected" or
"supervisor unexpected"? Certainly any trap that can be triggered by misbehaved
software in VU-mode should not kill the guest. Similarly, any trap that can be
triggered by a misbehaved nested VS-mode guest should not kill the outer guest
either.

So the only reason I see for not delegating them is to collect stats, but I
wonder if that is worth the performance cost. I would rather make misaligned
loads/stores (for example) faster in the guest than have a count of them at the
hypervisor level.

Regards,
Samuel


