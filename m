From: Clément Léger <cleger@rivosinc.com>
Date: Thu, 26 Oct 2023 09:53:29 +0200
Subject: [PATCH v2 2/5] riscv: Use SYM_*() assembly macros instead of
 deprecated ones
In-Reply-To: <20231025-d21b7077ff99828bef7cfaa8@orel>
References: <20231024132655.730417-1-cleger@rivosinc.com>
 <20231024132655.730417-3-cleger@rivosinc.com>
 <20231024-e122c317599cd4c6db53c015@orel>
 <da308888-0e47-4ca4-b318-8f089421dc0b@rivosinc.com>
 <20231025-d21b7077ff99828bef7cfaa8@orel>
Message-ID: <db7ca9ba-27aa-482e-9986-67622b4cedb2@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 25/10/2023 08:50, Andrew Jones wrote:
> On Tue, Oct 24, 2023 at 08:03:52PM +0200, Cl?ment L?ger wrote:
>>
>>
>> On 24/10/2023 17:23, Andrew Jones wrote:
>>> On Tue, Oct 24, 2023 at 03:26:52PM +0200, Cl?ment L?ger wrote:
>>> ...
>>>> diff --git a/arch/riscv/lib/uaccess.S b/arch/riscv/lib/uaccess.S
>>>> index 09b47ebacf2e..3ab438f30d13 100644
>>>> --- a/arch/riscv/lib/uaccess.S
>>>> +++ b/arch/riscv/lib/uaccess.S
>>>> @@ -10,8 +10,7 @@
>>>>  	_asm_extable	100b, \lbl
>>>>  	.endm
>>>>  
>>>> -ENTRY(__asm_copy_to_user)
>>>> -ENTRY(__asm_copy_from_user)
>>>> +SYM_FUNC_START(__asm_copy_to_user)
>>>>  
>>>>  	/* Enable access to user memory */
>>>>  	li t6, SR_SUM
>>>> @@ -181,13 +180,13 @@ ENTRY(__asm_copy_from_user)
>>>>  	csrc CSR_STATUS, t6
>>>>  	sub a0, t5, a0
>>>>  	ret
>>>> -ENDPROC(__asm_copy_to_user)
>>>> -ENDPROC(__asm_copy_from_user)
>>>> +SYM_FUNC_END(__asm_copy_to_user)
>>>>  EXPORT_SYMBOL(__asm_copy_to_user)
>>>> +SYM_FUNC_ALIAS(__asm_copy_from_user, __asm_copy_to_user)
>>>>  EXPORT_SYMBOL(__asm_copy_from_user)
>>>
>>> I didn't see any comment about the sharing of debug info among both the
>>> from and to functions. Assuming it isn't confusing in some way, then
>>
>> Hi Andrew,
>>
>> I did some testing with gdb and it seems to correctly assume that
>> __asm_copy_to_user maps to __asm_copy_from_user for debugging. The basic
>> tests that I did (breakpoints, disasm, etc) seems to show no sign of
>> problems for debugging. Were you thinking about other things specifically ?
> 
> Mostly just backtrace symbols, but I suppose we can live with it, since
> it wouldn't be the only weird thing in a backtrace.

Oh yes, In that case, clearly, if backtraced through __asm_copy_to_user,
it will display __asm_copy_from_user. This is the case in gdb if you
disassemble __asm_copy_to_user, it display __asm_copy_from_user (which
is "quite" expected to say the least). But I'm not sure of what would
happen with the existing code since there are two symbols mapping to
same area of code. I'd expect the same I guess.

Cl?ment

> 
> Thanks,
> drew

