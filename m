From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Sun, 17 Dec 2023 16:57:42 -0800
Subject: [RFC 6/9] drivers/perf: riscv: Implement SBI PMU snapshot function
In-Reply-To: <20231217-navigate-thirsty-03509850a683@spud>
References: <20231205024310.1593100-1-atishp@rivosinc.com> <20231205024310.1593100-7-atishp@rivosinc.com>
 <20231207-daycare-manager-2f4817171422@wendy> <CAHBxVyE3xAAj=Z_Cu33tEKjXEAcnOV_=Jpkpn-+j5MoLj1FPWw@mail.gmail.com>
 <20231217-navigate-thirsty-03509850a683@spud>
Message-ID: <CAHBxVyFQ2+NYeb77zqMofHQC0zD5_Ye2cGk6Zsc+KHKm4zE5mw@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Dec 17, 2023 at 4:10?AM Conor Dooley <conor@kernel.org> wrote:
>
> On Sat, Dec 16, 2023 at 05:39:12PM -0800, Atish Kumar Patra wrote:
> > On Thu, Dec 7, 2023 at 5:06?AM Conor Dooley <conor.dooley@microchip.com> wrote:
> > > On Mon, Dec 04, 2023 at 06:43:07PM -0800, Atish Patra wrote:
>
> > > > +static void pmu_sbi_snapshot_free(struct riscv_pmu *pmu)
> > > > +{
> > > > +     int cpu;
> > >
> > > > +     struct cpu_hw_events *cpu_hw_evt;
> > >
> > > This is only used inside the scope of the for loop.
> > >
> >
> > Do you intend to suggest using mixed declarations ? Personally, I
> > prefer all the declarations upfront for readability.
> > Let me know if you think that's an issue or violates coding style.
>
> I was suggesting
>
> int cpu;
>
> for_each_possible_cpu(cpu)
>         struct cpu_hw_events *cpu_hw_evt = per....()
>

That's what I meant by mixed declarations.

> I've been asked to do this in some subsystems I submitted code to,
> and checkpatch etc do not complain about it. I don't think there is any
> specific commentary in the coding style about minimising the scope of
> variables however.
>

I didn't know any subsystem which prefers mixed declaration vs upfront.

> > > > +     /* Free up the snapshot area memory and fall back to default SBI */
> > >
> > > What does "fall back to the default SBI mean"? SBI is an interface so I
> > > don't understand what it means in this context. Secondly,
> >
> > In absence of SBI PMU snapshot, the driver would try to read the
> > counters directly and end up traps.
> > Also, it would not use the SBI PMU snapshot flags in the SBI start/stop calls.
> > Snapshot is an alternative mechanism to minimize the traps. I just
> > wanted to highlight that.
> >
> > How about this ?
> > "Free up the snapshot area memory and fall back to default SBI PMU
> > calls without snapshot */
>
> Yeah, that's fine (modulo the */ placement). The original comment just
> seemed truncated.
>

ok.

> > > > +     if (ret.error) {
> > > > +             if (ret.error != SBI_ERR_NOT_SUPPORTED)
> > > > +                     pr_warn("%s: pmu snapshot setup failed with error %ld\n", __func__,
> > > > +                             ret.error);
> > >
> > > Why is the function relevant here? Is the error message in-and-of-itself
> > > not sufficient here? Where else would one be setting up the snapshots
> > > other than the setup function?
> > >
> >
> > The SBI implementation (i.e OpenSBI) may or may not provide a snapshot
> > feature. This error message indicates
> > that SBI implementation supports PMU snapshot but setup failed for
> > some other error.
>
> I don't see what this has to do with printing out the function. This is
> a unique error message, and there is no other place where the setup is
> done AFAICT.
>

Ahh you were concerned about the function name in the log. I
misunderstood it at first.
The function name is not relevant and has been already removed.

> > > > +             /* Snapshot is taken relative to the counter idx base. Apply a fixup. */
> > > > +             if (hwc->idx > 0) {
> > > > +                     sdata->ctr_values[hwc->idx] = sdata->ctr_values[0];
> > > > +                     sdata->ctr_values[0] = 0;
> > >
> > > Why is this being zeroed in this manner? Why is zeroing it not required
> > > if hwc->idx == 0? You've got a comment there that could probably do with
> > > elaboration.
> > >
> >
> > hwc->idx is the counter_idx_base here. If it is zero, that means the
> > counter0 value is updated
> > in the shared memory. However, if the base > 0, we need to update the
> > relative counter value
> > from the shared memory. Does it make sense ?
>
> Please expand on the comment so that it contains this information.
>

Sure.

> > > > +             ret = pmu_sbi_snapshot_setup(pmu, smp_processor_id());
> > > > +             if (!ret) {
> > > > +                     pr_info("SBI PMU snapshot is available to optimize the PMU traps\n");
> > >
> > > Why the verbose message? Could we standardise on one wording for the SBI
> > > function probing stuff? Most users seem to be "SBI FOO extension detected".
> > > Only IPI has additional wording and PMU differs slightly.
> >
> > Additional information is for users to understand PMU functionality
> > uses less traps on this system.
> > We can just resort to and expect users to read upon the purpose of the
> > snapshot from the spec.
> > "SBI PMU snapshot available"
>
> What I was asking for was alignment with the majority of other SBI
> extensions that use the format I mentioned above.
>

PMU snapshot is a function and my previous suggestion aligns PMU
extension availability log message.
I can change it to "SBI PMU snapshot detected"

> >
> > >
> > > > +                     /* We enable it once here for the boot cpu. If snapshot shmem fails during
> > >
> > > Again, comment style here. What does "snapshot shmem" mean? I think
> > > there's a missing action here. Registration? Allocation?
> > >
> >
> > Fixed it. It is supposed to be "snapshot shmem setup"
> >
> > > > +                      * cpu hotplug on, it should bail out.
> > >
> > > Should or will? What action does "bail out" correspond to?
> > >
> >
> > bail out the cpu hotplug process. We don't support heterogeneous pmus
> > for snapshot.
> > If the SBI implementation returns success for SBI_EXT_PMU_SNAPSHOT_SET_SHMEM
> > boot cpu but fails for other cpus while bringing them up, it is
> > problematic to handle that.
>
> "bail out" should be replaced by a more technical explanation of what is
> going to happen. "should" is a weird word to use, either the cpuhotplug
> code does or does not deal with this case, and since that code is also
> in the kernel, this patchset should ensure that it does handle the case,
> no? If the kernel does handle it "should" should be replaced with more
> definitive wording.
>

ok. I will improve the comment to explain a bit more.

> Thanks,
> Conor.

