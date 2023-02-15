From: Björn Töpel <bjorn@kernel.org>
Date: Wed, 15 Feb 2023 08:14:08 +0100
Subject: [PATCH -next v13 10/19] riscv: Allocate user's vector context
 in the first-use trap
In-Reply-To: <5e440cfa-27c5-f216-5529-350ac19c07ff@rivosinc.com>
References: <20230125142056.18356-1-andy.chiu@sifive.com>
 <20230125142056.18356-11-andy.chiu@sifive.com>
 <875ycdy22c.fsf@all.your.base.are.belong.to.us>
 <82551518-7b7e-8ac9-7325-5d99d3be0406@rivosinc.com>
 <87sff8ags6.fsf@all.your.base.are.belong.to.us>
 <CABgGipXSsqgtTx9bCy-gt7CTBkXN--t1wHgLfCxA3=vs6y+qUw@mail.gmail.com>
 <873578faxg.fsf@all.your.base.are.belong.to.us>
 <5e440cfa-27c5-f216-5529-350ac19c07ff@rivosinc.com>
Message-ID: <87wn4jjt8f.fsf@all.your.base.are.belong.to.us>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Vineet Gupta <vineetg@rivosinc.com> writes:

> On 2/14/23 08:50, Bj?rn T?pel wrote:
>> Andy Chiu <andy.chiu@sifive.com> writes:
>>
>>> Hey Bj?rn,
>>>
>>> On Tue, Feb 14, 2023 at 2:43 PM Bj?rn T?pel <bjorn@kernel.org> wrote:
>>>> So, two changes:
>>>>
>>>> 1. Disallow V-enablement if the existing altstack does not fit a V-sized
>>>>     frame.
>>> This could potentially break old programs (non-V) that load new system
>>> libraries (with V), If the program sets a small alt stack and takes
>>> the fault in some libraries that use V. However, existing
>>> implementation will also kill the process when the signal arrives,
>>> finding insufficient stack frame in such cases. I'd choose the second
>>> one if we only have these two options, because there is a chance that
>>> the signal handler may not even run.
>> I think we might have different views here. A process has a pre-V, a and
>> post-V state. Is allowing a process to enter V without the correct
>> preconditions a good idea? Allow to run with V turned on, but not able
>> to correctly handle a signal (the stack is too small)?
>
> The requirement is sane, but the issue is user experience: User trying 
> to bring up some V code has no clue that deep in some startup code some 
> alt stack had been setup and causing his process to be terminated on 
> first V code.
>
>>
>> This was the same argument that the Intel folks had when enabling
>> AMX. Sure, AMX requires *explicit* enablement, but same rules should
>> apply, no?
>>
>>>> 2. Sanitize altstack changes when V is enabled.
>>> Yes, I'd like to have this. But it may be tricky when it comes to
>>> deciding whether V is enabled, due to the first-use trap. If V is
>>> commonly used in system libraries then it is likely that V will be
>>> enabled before an user set an altstack. Sanitizing this case would be
>>> easy and straightforward.
>
> Good. Lets have this in v14 as it seems reasonably easy to implement.
>
>>> But what if the user sets an altstack before
>>> enabling V in the first-use trap? This could happen on a statically
>>> program that has hand-written V routines. This takes us to the 1st
>>> question above, should we fail the user program immediately if the
>>> altstack is set too small?
>
> Please lets not cross threads. We discussed this already at top. While 
> ideally required, seems tricky so lets start with post-V alt stack check.
>
>> For me it's obvious to fail (always) "if the altstack is too small to
>> enable V", because it allows to execute V without proper preconditions.
>>
>> Personally, I prefer a stricter model. Only enter V if you can, and
>> after entering it disallow changing the altstack.
>>
>> Then again, this is *my* opinion and concern. What do other people
>> think? I don't want to stall the series.
>
> I concur that the alt stack checking requirements are sensible in the 
> long run. We can add the obvious check for post-V case and see if there 
> is a sane way to flag pre-V case to.

Reasonable. @Andy does this resonate with you as well?


Bj?rn

