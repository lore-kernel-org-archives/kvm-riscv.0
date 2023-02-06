From: Conor Dooley <conor@kernel.org>
Date: Mon, 06 Feb 2023 14:40:16 +0100
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_-next_v13_10/19=5D_riscv=3A_Allocate?= =?US-ASCII?Q?_user=27s_vector_context_in_the_first-use_trap?=
In-Reply-To: <CABgGipW_3tBbc3G91dqiAZCGeN-PbUvLS3n=bU0nWz0rRX9T8Q@mail.gmail.com>
References: <20230125142056.18356-1-andy.chiu@sifive.com> <20230125142056.18356-11-andy.chiu@sifive.com> <Y9MIr2iR5rzlIGKQ@spud> <CABgGipW_3tBbc3G91dqiAZCGeN-PbUvLS3n=bU0nWz0rRX9T8Q@mail.gmail.com>
Message-ID: <36A0C855-5EA7-49B5-B92E-B28E684AC3D8@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 6 February 2023 13:00:00 GMT+01:00, Andy Chiu <andy.chiu@sifive.com> wrote:
>On Fri, Jan 27, 2023 at 7:11 AM Conor Dooley <conor@kernel.org> wrote:

>Changing it to a switch statement for better structuring.
>> I would like Heiko to take a look at this function!
>> I know we have the RISCV_INSN_FUNCS stuff that got newly added, but that's
>> for single, named instructions. I'm just curious if there may be a neater
>> way to go about doing this. AFAICT, the widths are all in funct3 - but it
>> is a shame that 0b100 is Q and 0 is vector, as the macro works for matches
>> and we can't use the upper bit for that.
>> There's prob something you could do with XORing and XNORing bits, but at
>> that point it'd not be adding any clarity at all & it'd not be a
>> RISCV_INSN_FUNCS anymore!
>> The actual opcode checks probably could be extracted though, but would
>> love to know what Heiko thinks, even if that is "leave it as is".
>I've checked the RISCV_INSN_FUNCS part recently. It seems good to
>match a single type of instruction, such as vector with OP-V opcode.
>However, I did not find an easy way of matching whole instructions
>introduced by RVV, which includes CSR operations on multiple CSRs and
>load/store with different widths. Yes, it would be great if we could
>distinguish VL and VS out by the upper bit of the width. Or even
>better if we could match CSR numbers for Vector this way. But I didn't
>find it.

Yup, I didn't see a straight forward way either.
I was hoping Heiko might have an idea!


>> > +     /* Sanity check. datap should be null by the time of the first-use trap */
>> > +     WARN_ON(current->thread.vstate.datap);
>>
>> Is a WARN_ON sufficient here? If on the first use trap, it's non-null
>> should we return false and trigger the trap error too?
>If we'd run into this warning message then there is a bug in kernel
>space. For example, if we did not properly free and clear the datap
>pointer. Or if we allocated datap somewhere else and did not set VS
>accordingly. Normally, current user space programs would not expect to
>run into this point, so I guess returning false here is not
>meaningful. This warning message is intended for kernel debugging
>only. Or, should we just strip out this check?

I suppose my question was "is it safe to warn and carry on, rather than disallow use of vector in this situation".

Thanks,
Conor.

