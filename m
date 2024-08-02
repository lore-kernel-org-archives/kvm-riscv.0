From: James R T <jamestiotio@gmail.com>
Date: Fri, 2 Aug 2024 20:23:37 +0800
Subject: [kvm-unit-tests PATCH v6 5/5] riscv: sbi: Add test for timer extension
In-Reply-To: <20240802-e1bd80fc34bfd2caaf52d0b8@orel>
References: <20240730061821.43811-1-jamestiotio@gmail.com> <20240730061821.43811-6-jamestiotio@gmail.com>
 <20240802-e1bd80fc34bfd2caaf52d0b8@orel>
Message-ID: <CAA_Li+uGHLsAzW_Ba1TVQZVoAmM7MWec3Bi5W1ms5Vnh05xbgQ@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Aug 2, 2024 at 4:36?PM Andrew Jones <andrew.jones@linux.dev> wrote:
>
> On Tue, Jul 30, 2024 at 02:18:20PM GMT, James Raphael Tiovalen wrote:
> > Add a test for the set_timer function of the time extension. The test
> > checks that:
> > - The time extension is available
> > - The installed timer interrupt handler is called
> > - The timer interrupt is received within a reasonable time interval
> > - The timer interrupt pending bit is cleared after the set_timer SBI
> >   call is made
> > - The timer interrupt can be cleared either by requesting a timer
> >   interrupt infinitely far into the future or by masking the timer
> >   interrupt
>
> I've modified the "or by masking the timer interrupt" test to work as I'd
> expect it to based on a bit more thought about what the SBI TIME extension
> spec is trying to say (we should clarify the spec with the PR you've
> written). I also added a test for ensuring a timer is pending immediately
> when setting the time with a value of zero. All tests pass.
>

Sure, I will reopen the clarification PR and work on it.

> I also moved some code around a bit and a couple other minor cleanups.
>
> And (drum roll, please), it's now merged!

Awesome, thanks Andrew!

>
> Thanks,
> drew

Best regards,
James Raphael Tiovalen

