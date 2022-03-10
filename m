From: Palmer Dabbelt <palmer@dabbelt.com>
Date: Thu, 10 Mar 2022 10:43:18 -0800 (PST)
Subject: [PATCH v11 1/8] RISC-V: Enable CPU_IDLE drivers
In-Reply-To: <CAK9=C2VzzT=GDyuptuxQj0y++Rb0SaZXCuoL1+ncpGWcYHqr1g@mail.gmail.com>
Message-ID: <mhng-203b51aa-0594-403c-9b79-2eb763fabfd3@palmer-ri-x1c9>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, 12 Feb 2022 04:49:46 PST (-0800), apatel at ventanamicro.com wrote:
> On Sat, Feb 12, 2022 at 5:13 PM Pavel Machek <pavel@ucw.cz> wrote:
>>
>> Hi!
>>
>> > From: Anup Patel <anup.patel@wdc.com>
>> >
>> > We force select CPU_PM and provide asm/cpuidle.h so that we can
>> > use CPU IDLE drivers for Linux RISC-V kernel.
>> >
>> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
>> > Signed-off-by: Anup Patel <apatel@vetanamicro.com>
>>
>> This is quite... interesting. Normally we have one signoff per
>> person...
>
> I was working for Western Digital (WDC) when I first submitted this
> series and recently I joined Ventana Micro Systems.

IIUC that's the correct way to go about this, it's certainly what I'd 
do.

>
> Regards,
> Anup
>
>>
>> Best regards,
>>                                                         Pavel
>> --
>> http://www.livejournal.com/~pavelmachek

