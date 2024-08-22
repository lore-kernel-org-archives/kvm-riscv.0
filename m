From: Quan Zhou <zhouquan@iscas.ac.cn>
Date: Thu, 22 Aug 2024 14:38:44 +0800
Subject: [PATCH v2 1/2] riscv: perf: add guest vs host distinction
In-Reply-To: <20240821-f5e1d6afb0d2230c1256a75b@orel>
References: <cover.1723518282.git.zhouquan@iscas.ac.cn>
 <3729354b59658535c4370d3c1c7e2f162433807b.1723518282.git.zhouquan@iscas.ac.cn>
 <20240821-f5e1d6afb0d2230c1256a75b@orel>
Message-ID: <430f3d38-b12e-4ac8-8040-33bab40380ab@iscas.ac.cn>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


On 2024/8/21 20:48, Andrew Jones wrote:
> On Tue, Aug 13, 2024 at 09:23:54PM GMT, zhouquan at iscas.ac.cn wrote:
>> From: Quan Zhou <zhouquan@iscas.ac.cn>
>>
>> Introduce basic guest support in perf, enabling it to distinguish
>> between PMU interrupts in the host or guest, and collect
>> fundamental information.
>>
>> Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
>> ---
>>   arch/riscv/include/asm/perf_event.h |  7 ++++++
>>   arch/riscv/kernel/perf_callchain.c  | 38 +++++++++++++++++++++++++++++
>>   2 files changed, 45 insertions(+)
>>
>> diff --git a/arch/riscv/include/asm/perf_event.h b/arch/riscv/include/asm/perf_event.h
>> index 665bbc9b2f84..c2b73c3aefe4 100644
>> --- a/arch/riscv/include/asm/perf_event.h
>> +++ b/arch/riscv/include/asm/perf_event.h
>> @@ -8,13 +8,20 @@
>>   #ifndef _ASM_RISCV_PERF_EVENT_H
>>   #define _ASM_RISCV_PERF_EVENT_H
>>   
>> +#ifdef CONFIG_PERF_EVENTS
>>   #include <linux/perf_event.h>
>>   #define perf_arch_bpf_user_pt_regs(regs) (struct user_regs_struct *)regs
>>   
>> +extern unsigned long perf_instruction_pointer(struct pt_regs *regs);
>> +extern unsigned short perf_misc_flags(struct pt_regs *regs);
>> +#define perf_misc_flags(regs) perf_misc_flags(regs)
>> +
>>   #define perf_arch_fetch_caller_regs(regs, __ip) { \
>>   	(regs)->epc = (__ip); \
>>   	(regs)->s0 = (unsigned long) __builtin_frame_address(0); \
>>   	(regs)->sp = current_stack_pointer; \
>>   	(regs)->status = SR_PP; \
>>   }
>> +#endif
>> +
>>   #endif /* _ASM_RISCV_PERF_EVENT_H */
>> diff --git a/arch/riscv/kernel/perf_callchain.c b/arch/riscv/kernel/perf_callchain.c
>> index 3348a61de7d9..7af90a3bb373 100644
>> --- a/arch/riscv/kernel/perf_callchain.c
>> +++ b/arch/riscv/kernel/perf_callchain.c
>> @@ -58,6 +58,11 @@ void perf_callchain_user(struct perf_callchain_entry_ctx *entry,
>>   {
>>   	unsigned long fp = 0;
>>   
>> +	if (perf_guest_state()) {
>> +		/* TODO: We don't support guest os callchain now */
>> +		return;
>> +	}
>> +
>>   	fp = regs->s0;
>>   	perf_callchain_store(entry, regs->epc);
>>   
>> @@ -74,5 +79,38 @@ static bool fill_callchain(void *entry, unsigned long pc)
>>   void perf_callchain_kernel(struct perf_callchain_entry_ctx *entry,
>>   			   struct pt_regs *regs)
>>   {
>> +	if (perf_guest_state()) {
>> +		/* TODO: We don't support guest os callchain now */
>> +		return;
>> +	}
>> +
>>   	walk_stackframe(NULL, regs, fill_callchain, entry);
>>   }
>> +
>> +unsigned long perf_instruction_pointer(struct pt_regs *regs)
>> +{
>> +	if (perf_guest_state())
>> +		return perf_guest_get_ip();
>> +
>> +	return instruction_pointer(regs);
>> +}
>> +
>> +unsigned short perf_misc_flags(struct pt_regs *regs)
> 
> I see that the consumer of perf_misc_flags is only a u16, but all other
> architectures define this function as returning an unsigned long, and
> your last version did as well. My comment in the last version was that
> we should use an unsigned long for the 'misc' variable to match the
> return type of the function. I still think we should do that instead
> since the function should be consistent with the other architectures.
> 

I agree with your point that the type of `misc` should be consistent 
with other architectures.

However, one thing confuses me. The return value of perf_misc_flags
is assigned to the `misc` field of the perf_event_header structure,
and the field is defined as `u16`. I checked the return type of 
`perf_misc_flags` in other architectures, and I found that for 
x86/arm/s390, the type is `unsigned long`, while for powerpc, it is `u32`.
These do not match `u16`, which seems to pose a risk of type truncation 
and feels a bit unconventional. Or is there some other reasonable 
consideration behind this?

Thanks a lot!
Quan

>> +{
>> +	unsigned int guest_state = perf_guest_state();
>> +	unsigned short misc = 0;
>> +
>> +	if (guest_state) {
>> +		if (guest_state & PERF_GUEST_USER)
>> +			misc |= PERF_RECORD_MISC_GUEST_USER;
>> +		else
>> +			misc |= PERF_RECORD_MISC_GUEST_KERNEL;
>> +	} else {
>> +		if (user_mode(regs))
>> +			misc |= PERF_RECORD_MISC_USER;
>> +		else
>> +			misc |= PERF_RECORD_MISC_KERNEL;
>> +	}
>> +
>> +	return misc;
>> +}
>> -- 
>> 2.34.1
>>
> 
> Thanks,
> drew


