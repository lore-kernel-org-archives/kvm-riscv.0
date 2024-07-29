From: Alexandre Ghiti <alex@ghiti.fr>
Date: Mon, 29 Jul 2024 16:30:00 +0200
Subject: [PATCH v3 3/6] riscv: Add Zawrs support for spinlocks
In-Reply-To: <20240729-b6707d037c0546c2c2f8da25@orel>
References: <20240426100820.14762-8-ajones@ventanamicro.com>
 <20240426100820.14762-11-ajones@ventanamicro.com>
 <4de22b20-8a6a-47d0-a4e9-74343c45411c@ghiti.fr>
 <20240729-b6707d037c0546c2c2f8da25@orel>
Message-ID: <51043fe4-297b-4f2e-9e67-669ea53cf273@ghiti.fr>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 29/07/2024 16:01, Andrew Jones wrote:
> On Mon, Jul 29, 2024 at 03:43:30PM GMT, Alexandre Ghiti wrote:
> ...
>>> +static __always_inline void __cmpwait(volatile void *ptr,
>>> +				      unsigned long val,
>>> +				      int size)
>>> +{
>>> +	unsigned long tmp;
>>> +
>>> +	asm goto(ALTERNATIVE("j %l[no_zawrs]", "nop",
>>> +			     0, RISCV_ISA_EXT_ZAWRS, 1)
>>> +		 : : : : no_zawrs);
>>> +
>>> +	switch (size) {
>>> +	case 4:
>>> +		asm volatile(
>>> +		"	lr.w	%0, %1\n"
>>> +		"	xor	%0, %0, %2\n"
>>> +		"	bnez	%0, 1f\n"
>>> +			ZAWRS_WRS_NTO "\n"
>>> +		"1:"
>>> +		: "=&r" (tmp), "+A" (*(u32 *)ptr)
>>> +		: "r" (val));
>>> +		break;
>>> +#if __riscv_xlen == 64
>>> +	case 8:
>>> +		asm volatile(
>>> +		"	lr.d	%0, %1\n"
>>> +		"	xor	%0, %0, %2\n"
>>> +		"	bnez	%0, 1f\n"
>>> +			ZAWRS_WRS_NTO "\n"
>>> +		"1:"
>>> +		: "=&r" (tmp), "+A" (*(u64 *)ptr)
>>> +		: "r" (val));
>>> +		break;
>>> +#endif
>>> +	default:
>>> +		BUILD_BUG();
>>> +	}
>>> +
>>> +	return;
>>> +
>>> +no_zawrs:
>>> +	asm volatile(RISCV_PAUSE : : : "memory");
>>
>> Shouldn't we fallback to the previous implementation (cpu_relax()) here? Not
>> sure this is really important, but I want to make sure it was not an
>> oversight.
>>
> Hi Alex,
>
> It was intentional. We can't easily call cpu_relax() from here because
> asm/vdso/processor.h includes asm/barrier.h which includes asm/cmpxchg.h.
> We've mostly reproduced cpu_relax() here since we're only skipping the
> div, and, as __cmpwait will be used in loops which load memory for the
> comparison, I didn't think we needed the extra div stalls.


Ok thanks for your quick answer. Actually I'm asking because I fell onto 
the issue with the headers and I managed to fix it by replacing 
asm/barrier.h with linux/compiler.h, which is actually where is defined 
barrier().

But anyway, it makes sense.

Thanks,

Alex


> Thanks,
> drew

