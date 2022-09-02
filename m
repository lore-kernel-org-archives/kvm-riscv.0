From: Conor.Dooley@microchip.com <Conor.Dooley@microchip.com>
Date: Fri, 2 Sep 2022 13:29:23 +0000
Subject: [PATCH v2 0/5] riscv: add PREEMPT_RT support
In-Reply-To: <YxIAmT2X9TU1CZhC@xhacker>
References: <20220831175920.2806-1-jszhang@kernel.org>
 <4488b1ec-aa34-4be5-3b9b-c65f052f5270@microchip.com>
 <YxIAmT2X9TU1CZhC@xhacker>
Message-ID: <ea5cdba4-7a79-56b3-f8d7-7785569dedd6@microchip.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 02/09/2022 14:09, Jisheng Zhang wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On Thu, Sep 01, 2022 at 04:41:52PM +0000, Conor.Dooley at microchip.com wrote:
>> On 31/08/2022 18:59, Jisheng Zhang wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> This series is to add PREEMPT_RT support to riscv:
>>> patch1 adds the missing number of signal exits in vCPU stat
>>> patch2 switches to the generic guest entry infrastructure
>>> patch3 select HAVE_POSIX_CPU_TIMERS_TASK_WORK which is a requirement for
>>> RT
>>> patch4 adds lazy preempt support
>>> patch5 allows to enable PREEMPT_RT
>>>
>>
>> What version of the preempt_rt patch did you test this with?
> 
> v6.0-rc1 + v6.0-rc1-rt patch
> 
>>
>> Maybe I am missing something, but I gave this a whirl with
>> v6.0-rc3 + v6.0-rc3-rt5 & was meant by a bunch of complaints.
>> I am not familiar with the preempt_rt patch, so I am not sure what
>> level of BUG()s or WARNING()s are to be expected, but I saw a fair
>> few...
> 
> Could you please provide corresponding log? Usually, this means there's
> a bug in related drivers, so it's better to fix them now rather than
> wait for RT patches mainlined.

I tried it on PolarFire SoC. I know that at least one of the problems
I found is down to drivers - specifically the system controller & hwrng.

The first issue that comes up is in early smp setup code - we call out
to update_siblings_masks() which does an alloc with preemption. It's
the same backtrace from here:

https://lore.kernel.org/all/0abd0acf-70a1-d546-a517-19efe60042d1 at microchip.com/

I'll give it a run through tonight or tomorrow & give you a full log
of what I saw. There's some splats all over the place for me, but I
can't tell if that's just knock-on from the other issues.

Thanks,
Conor.


