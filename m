From: Samuel Holland <samuel.holland@sifive.com>
Date: Thu, 12 Sep 2024 19:39:10 -0500
Subject: [PATCH] RISC-V: KVM: Redirect instruction access fault trap to
 guest
In-Reply-To: <b5128162-278a-4284-8271-b2b91dc446e1@iscas.ac.cn>
References: <83c2234d582b7e823ce9ac9b73a6bbcf63971a29.1724911120.git.zhouquan@iscas.ac.cn>
 <b5128162-278a-4284-8271-b2b91dc446e1@iscas.ac.cn>
Message-ID: <380f4da9-50e9-4632-bdc8-b1723eb19ca5@sifive.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2024-09-12 4:03 AM, Quan Zhou wrote:
> 
> On 2024/8/29 14:20, zhouquan at iscas.ac.cn wrote:
>> From: Quan Zhou <zhouquan@iscas.ac.cn>
>>
>> The M-mode redirects an unhandled instruction access
>> fault trap back to S-mode when not delegating it to
>> VS-mode(hedeleg). However, KVM running in HS-mode
>> terminates the VS-mode software when back from M-mode.
>>
>> The KVM should redirect the trap back to VS-mode, and
>> let VS-mode trap handler decide the next step.
>>
>> Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
>> ---
>> ? arch/riscv/kvm/vcpu_exit.c | 1 +
>> ? 1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
>> index fa98e5c024b2..696b62850d0b 100644
>> --- a/arch/riscv/kvm/vcpu_exit.c
>> +++ b/arch/riscv/kvm/vcpu_exit.c
>> @@ -182,6 +182,7 @@ int kvm_riscv_vcpu_exit(struct kvm_vcpu *vcpu, struct
>> kvm_run *run,
>> ????? ret = -EFAULT;
>> ????? run->exit_reason = KVM_EXIT_UNKNOWN;
>> ????? switch (trap->scause) {
>> +??? case EXC_INST_ACCESS:
> 
> A gentle ping, the instruction access fault should be redirected to
> VS-mode for handling, is my understanding correct?

Yes, this looks correct. However, I believe it would be equivalent (and more
efficient) to add EXC_INST_ACCESS to KVM_HEDELEG_DEFAULT in asm/kvm_host.h.

I don't understand why some exceptions are delegated with hedeleg and others are
caught and redirected here with no further processing. Maybe someone thought
that it wasn't valid to set a bit in hedeleg if the corresponding bit was
cleared in medeleg? But this doesn't make sense, as S-mode cannot know which
bits are set in medeleg (maybe none are!).

So the hypervisor must either:
 1) assume M-mode firmware checks hedeleg and redirects exceptions to VS-mode
    regardless of medeleg, in which case all four of these exceptions can be
    moved to KVM_HEDELEG_DEFAULT and removed from this switch statement, or

 2) assume M-mode might not check hedeleg and redirect exceptions to VS-mode,
    and since no bits are guaranteed to be set in medeleg, any bit set in
    hedeleg must _also_ be handled in the switch case here.

Anup, Atish, thoughts?

Regards,
Samuel

> 
>> ????? case EXC_INST_ILLEGAL:
>> ????? case EXC_LOAD_MISALIGNED:
>> ????? case EXC_STORE_MISALIGNED:
>>
>> base-commit: 7c626ce4bae1ac14f60076d00eafe71af30450ba
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


