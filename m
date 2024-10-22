From: Quan Zhou <zhouquan@iscas.ac.cn>
Date: Tue, 22 Oct 2024 17:11:10 +0800
Subject: [PATCH v5 1/2] riscv: perf: add guest vs host distinction
In-Reply-To: <mhng-c9ba919e-b4a4-4bb9-bdba-f4d3295a930b@palmer-ri-x1c9a>
References: <mhng-c9ba919e-b4a4-4bb9-bdba-f4d3295a930b@palmer-ri-x1c9a>
Message-ID: <a5eb1373-1935-4290-9658-3234359aebe7@iscas.ac.cn>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2024/10/19 03:55, Palmer Dabbelt wrote:
> On Tue, 15 Oct 2024 01:42:50 PDT (-0700), zhouquan at iscas.ac.cn wrote:
>> From: Quan Zhou <zhouquan@iscas.ac.cn>
>>
>> Introduce basic guest support in perf, enabling it to distinguish
>> between PMU interrupts in the host or guest, and collect
>> fundamental information.
>>
>> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
>> Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
>> ---
>> ?arch/riscv/include/asm/perf_event.h |? 6 +++++
>> ?arch/riscv/kernel/perf_callchain.c? | 38 +++++++++++++++++++++++++++++
>> ?2 files changed, 44 insertions(+)
>>
>> diff --git a/arch/riscv/include/asm/perf_event.h 
>> b/arch/riscv/include/asm/perf_event.h
>> index 665bbc9b2f84..38926b4a902d 100644
>> --- a/arch/riscv/include/asm/perf_event.h
>> +++ b/arch/riscv/include/asm/perf_event.h
>> @@ -8,7 +8,11 @@
>> ?#ifndef _ASM_RISCV_PERF_EVENT_H
>> ?#define _ASM_RISCV_PERF_EVENT_H
>>
>> +#ifdef CONFIG_PERF_EVENTS
>> ?#include <linux/perf_event.h>
>> +extern unsigned long perf_instruction_pointer(struct pt_regs *regs);
>> +extern unsigned long perf_misc_flags(struct pt_regs *regs);
>> +#define perf_misc_flags(regs) perf_misc_flags(regs)
>> ?#define perf_arch_bpf_user_pt_regs(regs) (struct user_regs_struct *)regs
>>
>> ?#define perf_arch_fetch_caller_regs(regs, __ip) { \
>> @@ -17,4 +21,6 @@
>> ???? (regs)->sp = current_stack_pointer; \
>> ???? (regs)->status = SR_PP; \
>> ?}
>> +#endif
>> +
>> ?#endif /* _ASM_RISCV_PERF_EVENT_H */
>> diff --git a/arch/riscv/kernel/perf_callchain.c 
>> b/arch/riscv/kernel/perf_callchain.c
>> index c7468af77c66..c2c81a80f816 100644
>> --- a/arch/riscv/kernel/perf_callchain.c
>> +++ b/arch/riscv/kernel/perf_callchain.c
>> @@ -28,11 +28,49 @@ static bool fill_callchain(void *entry, unsigned 
>> long pc)
>> ?void perf_callchain_user(struct perf_callchain_entry_ctx *entry,
>> ????????????? struct pt_regs *regs)
>> ?{
>> +??? if (perf_guest_state()) {
>> +??????? /* TODO: We don't support guest os callchain now */
>> +??????? return;
> 
> That seems kind of weird, but it looks like almost exactly the same 
> thing Marc did in 75e424620a4f ("arm64: perf: add guest vs host 
> discrimination").? I think it's safe, as we'll basically just silently 
> display no backtrace and we can always just fail to backtrace.
> 
> That said: I don't understand why we can't backtrace inside a guest?? If 
> we can get the registers and memory it seems like we should be able to. 
> Maybe I'm missing something?
> 

 From the community's discussion history, there are two reasons:

1) For backtracing, we must traverse the structures within the guest's 
virtual address space. These structures can change at any time while the 
guest is running. The page table data we obtain might be corrupted, 
making it impossible to complete the traversal of the page tables or 
leading to incorrect data [1].

2) For security reasons, a significant number of cloud vendors wish to 
make accessing customer data almost impossible [2].

Currently, community prefer to implement this functionality in user 
space and access the guest through the KVM API, interrupting the guest 
to perform the unwind operation.

As with the x86/ARM architectures, stubs are still retained here for 
RISC-V. If `guest os callchain` is introduced in the future, they can 
indicate that additional work needs to be done.

[1] 
https://lore.kernel.org/all/ZSlNsn-f1j2bB8pW at FVFF77S0Q05N.cambridge.arm.com/
[2] https://lore.kernel.org/all/ZXeTvCLURmwzpDkP at google.com/

Regards,
Quan

>> +??? }
>> +
>> ???? arch_stack_walk_user(fill_callchain, entry, regs);
>> ?}
>>
>> ?void perf_callchain_kernel(struct perf_callchain_entry_ctx *entry,
>> ??????????????? struct pt_regs *regs)
>> ?{
>> +??? if (perf_guest_state()) {
>> +??????? /* TODO: We don't support guest os callchain now */
>> +??????? return;
>> +??? }
>> +
>> ???? walk_stackframe(NULL, regs, fill_callchain, entry);
>> ?}
>> +
>> +unsigned long perf_instruction_pointer(struct pt_regs *regs)
>> +{
>> +??? if (perf_guest_state())
>> +??????? return perf_guest_get_ip();
>> +
>> +??? return instruction_pointer(regs);
>> +}
>> +
>> +unsigned long perf_misc_flags(struct pt_regs *regs)
>> +{
>> +??? unsigned int guest_state = perf_guest_state();
>> +??? unsigned long misc = 0;
>> +
>> +??? if (guest_state) {
>> +??????? if (guest_state & PERF_GUEST_USER)
>> +??????????? misc |= PERF_RECORD_MISC_GUEST_USER;
>> +??????? else
>> +??????????? misc |= PERF_RECORD_MISC_GUEST_KERNEL;
>> +??? } else {
>> +??????? if (user_mode(regs))
>> +??????????? misc |= PERF_RECORD_MISC_USER;
>> +??????? else
>> +??????????? misc |= PERF_RECORD_MISC_KERNEL;
>> +??? }
>> +
>> +??? return misc;
>> +}


