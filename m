From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 10 Jan 2023 11:47:29 +0530
Subject: Expected rdpmc behavior during context swtich and a RISC-V conundrum
In-Reply-To: <CAOnJCU+qsJk9oL-2L8fJuGvpaJsyfwQ5+wFXA1L1jM6Fe=FK6A@mail.gmail.com>
References: <CAOnJCUKNFNRs6WkPNWV94BuLmT3KSPWK2FYCiD4PxPCxRs76PA@mail.gmail.com>
 <Y7wLa7I2hlz3rKw/@hirez.programming.kicks-ass.net> <CAOnJCU+qsJk9oL-2L8fJuGvpaJsyfwQ5+wFXA1L1jM6Fe=FK6A@mail.gmail.com>
Message-ID: <CAK9=C2W+WapkbiXE+b_6Gc4rN0mfMx6NUBcXk0p=f_VzhObZiw@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

+linux-riscv +kvm-riscv

On Tue, Jan 10, 2023 at 1:26 AM Atish Patra <atishp@atishpatra.org> wrote:
>
> On Mon, Jan 9, 2023 at 4:41 AM Peter Zijlstra <peterz@infradead.org> wrote:
> >
> > On Thu, Jan 05, 2023 at 11:59:24AM -0800, Atish Patra wrote:
> > > Hi All,
> > > There was a recent uabi update[1] for RISC-V that allows the users to
> > > read cycle and instruction count without any checks.
> > > We tried to restrict that behavior to address security concerns
> > > earlier but it resulted in breakage for some user space
> > > applications[2].
> > > Thus, previous behavior was restored where a user on RISC-V platforms
> > > can directly read cycle or instruction count[3].
> > >
> > > Comparison with other ISAs w.r.t user space access of counters:
> > > ARM64
> > >   -- Enabled/Disabled via (/proc/sys/kernel/perf_user_access)
> > >   -- Only for task bound events configured via perf.
> > >
> > > X86
> > >  --- rdpmc instruction
> > >  --- Enable/Disable via ?/sys/devices/cpu/rdpmc?
> > > -- Before v4.0
> > >  -- any process (even without active perf event) rdpmc
> > > After v4.0
> > > -- Default behavior changed to support only active events in a
> > > process?s context.
> > > -- Configured through perf similar to ARM64
> > > -- Continue to maintain backward compatibility for unrestricted access
> > > by writing 2 to ?/sys/devices/cpu/rdpmc?
> > >
> > > IMO, RISC-V should only enable user space access through perf similar
> > > to ARM64 and x86 (post v4.0).
> > > However, we do have to support the legacy behavior to avoid
> > > application breakage.
> > > As per my understanding a direct user space access can lead to the
> > > following problems:
> > >
> > > 1) There is no context switch support, so counts from other contexts are exposed
> > > 2) If a perf user is allocated one of these counters, the counter
> > > value will be written
> > >
> > > Looking at the x86 code as it continues to allow the above behavior,
> > > rdpmc_always_available_key is enabled in the above case. However,
> > > during the context switch (cr4_update_pce_mm)
> > > only dirty counters are cleared. It only prevents leakage from perf
> > > task to rdpmc task.
> > >
> > > How does the context switch of counters work for users who enable
> > > unrestricted access by writing 2 to ?/sys/devices/cpu/rdpmc? ?
> > > Otherwise, rdpmc users likely get noise from other applications. Is
> > > that expected ?
> > > This can be a security concern also where a rogue rdpmc user
> > > application can monitor other critical applications to initiate side
> > > channel attack.
> > >
> > > Am I missing something? Please correct my understanding of the x86
> > > implementation if it is wrong.
> >
> > So on x86 we have RDTSC and RDPMC instructions. RDTSC reads the
> > Time-Stamp-Counter which is a globally synchronized monotonic increasing
> > counter at some 'random' rate (idealized, don't ask). This thing is used
> > for time-keeping etc..
> >
> > And then there's RDPMC which (optionally) allows reading the PMU
> > counters which are normally disabled and all 0.
> >
> > Even if RDPMC is unconditionally allowed from userspace (the 2 option
> > you refer to) userspace will only be able to read these 0s unless
> > someone also programs the PMU. Linux only supports a single means of
> > doing so: perf (some people use /dev/msr to poke directly to the MSRs
> > but they get to keep all pieces).
> >
>
> It makes sense now. Thanks!!
>
> AFAIK, the /dev/msr interface is also allowed for root users only. So that
> covers the security concerns I was asking about.
>
> > RDPMC is only useful if you read counters you own on yourself -- IOW
> > selfmonitoring, using the interface outlined in uapi/linux/perf_events.h
> > near struct perf_event_mmap_page.
> >
> > Any other usage -- you get to keep the pieces.
> >
> > Can you observe random other counters, yes, unavoidably so. The sysfs
> > control you mention was instituted to restrict this somewhat.
> >
> > If the RISC-V counters are fundamentally the PMU counters that need to
> > be reset to trigger events, then you've managed to paint yourself into a
> > tight spot :/
> >
> > Either you must dis-allow userspace access to these things (and break
> > them) or limit the PMU usage -- both options suck.
> >
> >
> > Now, I'm thinking that esp. something like instruction count is not
> > synchronized between cores (seems fundamentally impossible) and can only
> > be reasonably be consumed (and compared) when strictly affine to a
> > particular CPU, you can argue that applications doing this without also
> > strictly managing their affinity mask are broken anyway and therefore
> > your breakage is not in fact a breaking them -- you can't break
> > something that's already broken.
> >
>
> I think most broken applications were using rdcycle to measure time
> which was wrong anyways.
> It probably happened because there was no "time" CSR in the early
> hardwares. Thus, the rdtime would
> trap & emulated by the firmware which was slow. This lead to user
> space application to use rdcycle which
> was not correct either. So the existing applications are broken for
> using rdcycle as well.
>
> Since both cycle & instret behave similarly (fixed counters), they get
> enabled/disabled together.
>
> >
> > Anyway, given RISC-V being a very young platform, I would try really
> > *really* *REALLY* hard to stomp on these applications and get them to
> > change in order to reclaim the PMU usage.
>
> Yes. Thanks for your valuable input.

I agree with Peter Z. We had a similar discussion in the
Performance Analysis SIG of RISC-V international as well.

This also forces KVM (and other hypervisors) to save-n-restore
CYCLE and INSTRUCTION counters so that one Guest/VM
can't see cycle/instruction counts from another Guest/VM.

Only a few applications are affected and RISC-V ecosystem
is young so it is better to change these applications rather
than making CYCLE and INSTRUCTION counters as part
of uABI.

Regards,
Anup

