From: Clément Léger <cleger@rivosinc.com>
Date: Mon, 25 Nov 2024 11:29:38 +0100
Subject: [kvm-unit-tests PATCH v2 2/3] riscv: lib: Add SSE assembly entry
 handling
In-Reply-To: <20241125-a56b5a8b8a80cdd2e9598fee@orel>
References: <20241122140459.566306-1-cleger@rivosinc.com>
 <20241122140459.566306-3-cleger@rivosinc.com>
 <20241122-a7e54373559727e1e296b8c4@orel>
 <90b8e2d2-1fc6-4166-a3bf-3cd8af3b5b8d@rivosinc.com>
 <20241125-a56b5a8b8a80cdd2e9598fee@orel>
Message-ID: <c174b3bb-5839-4396-9c5e-68b56fbd1bce@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 25/11/2024 10:38, Andrew Jones wrote:
> On Mon, Nov 25, 2024 at 09:46:48AM +0100, Cl?ment L?ger wrote:
>>
>>
>> On 22/11/2024 17:20, Andrew Jones wrote:
>>> On Fri, Nov 22, 2024 at 03:04:56PM +0100, Cl?ment L?ger wrote:
>>>> Add a SSE entry assembly code to handle SSE events. Events should be
>>>> registered with a struct sse_handler_arg containing a correct stack and
>>>> handler function.
>>>>
>>>> Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
>>>> ---
>>>>  riscv/Makefile          |   1 +
>>>>  lib/riscv/asm/sse.h     |  16 +++++++
>>>>  lib/riscv/sse-entry.S   | 100 ++++++++++++++++++++++++++++++++++++++++
>>>
>>> Let's just add the entry function to riscv/sbi-asm.S and the
>>> sse_handler_arg struct definition to riscv/sbi-tests.h
>>
>> Hi drew,
>>
>> I need to have some offset generated using asm-offsets.c which is in
>> lib/riscv. If I move the sse_handler_arg in riscv/sbi-tests.h, that will
>> be really off to include that file in the lib/riscv/asm-offsets.c.
> 
> That's true, but it's also not great to put a test-specific definition of
> an arg structure in lib code. It seems like we'll eventually want a neater
> solution to this, though, since using asm-offsets for test-specific
> structures makes sense. However, we could put it off for now, since each
> member of the structure that SSE tests need is the same size,
> sizeof(long), so we can do the same thing that HSM and SUSP do, which is
> to define some indices and access with ASMARR().

The struct sse_handler_arg isn't actually test-specific as well as the
assembly code. Test data are actually specified in the handler and
handler_data field of the sse_handler_arg. But maybe the part that uses
the sse_handler data should actually be hidden from the test layer. I
can add some function to wrap that.

> 
>> Except if you have some other solution.
> 
> ASMARR(), even though I'm not a huge fan of that approach either...
> 
>>
>>>
>>>>  lib/riscv/asm-offsets.c |   9 ++++
>>>>  4 files changed, 126 insertions(+)
>>>>  create mode 100644 lib/riscv/asm/sse.h
>>>>  create mode 100644 lib/riscv/sse-entry.S
>>>>
>>>> diff --git a/riscv/Makefile b/riscv/Makefile
>>>> index 28b04156..e50621ad 100644
>>>> --- a/riscv/Makefile
>>>> +++ b/riscv/Makefile
>>>> @@ -39,6 +39,7 @@ cflatobjs += lib/riscv/sbi.o
>>>>  cflatobjs += lib/riscv/setjmp.o
>>>>  cflatobjs += lib/riscv/setup.o
>>>>  cflatobjs += lib/riscv/smp.o
>>>> +cflatobjs += lib/riscv/sse-entry.o
>>>>  cflatobjs += lib/riscv/stack.o
>>>>  cflatobjs += lib/riscv/timer.o
>>>>  ifeq ($(ARCH),riscv32)
>>>> diff --git a/lib/riscv/asm/sse.h b/lib/riscv/asm/sse.h
>>>> new file mode 100644
>>>> index 00000000..557f6680
>>>> --- /dev/null
>>>> +++ b/lib/riscv/asm/sse.h
>>>> @@ -0,0 +1,16 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>>> +#ifndef _ASMRISCV_SSE_H_
>>>> +#define _ASMRISCV_SSE_H_
>>>> +
>>>> +typedef void (*sse_handler_fn)(void *data, struct pt_regs *regs, unsigned int hartid);
>>>> +
>>>> +struct sse_handler_arg {
>>>> +	unsigned long reg_tmp;
>>>> +	sse_handler_fn handler;
>>>> +	void *handler_data;
>>>> +	void *stack;
>>>> +};
>>>> +
>>>> +extern void sse_entry(void);
>>>> +
>>>> +#endif /* _ASMRISCV_SSE_H_ */
>>>> diff --git a/lib/riscv/sse-entry.S b/lib/riscv/sse-entry.S
>>>> new file mode 100644
>>>> index 00000000..bedc47e9
>>>> --- /dev/null
>>>> +++ b/lib/riscv/sse-entry.S
>>>> @@ -0,0 +1,100 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>>> +/*
>>>> + * SBI SSE entry code
>>>> + *
>>>> + * Copyright (C) 2024, Rivos Inc., Cl?ment L?ger <cleger@rivosinc.com>
>>>> + */
>>>> +#include <asm/asm.h>
>>>> +#include <asm/asm-offsets.h>
>>>> +#include <asm/csr.h>
>>>> +
>>>> +.global sse_entry
>>>> +sse_entry:
>>>> +	/* Save stack temporarily */
>>>> +	REG_S sp, SSE_REG_TMP(a6)
> 
> While thinking about the asm-offsets issue, I took a closer look at this
> and noticed that this should be a7, since ENTRY_ARG is specified to be
> set to A7. It looks like we have A6 (hartid) and A7 (arg) swapped. The
> opensbi implementation also has them swapped, allowing this test to pass.
> Both need to be fixed.

Ouch, nice catch, I'll fix that up.

> 
> Thanks,
> drew


