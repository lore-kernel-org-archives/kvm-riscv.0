From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 4 Apr 2024 15:19:41 +0200
Subject: [PATCH v4 08/15] RISC-V: KVM: Implement SBI PMU Snapshot feature
In-Reply-To: <a75fa96e-2f26-49a7-a7f7-4a397c4a4513@rivosinc.com>
References: <20240229010130.1380926-1-atishp@rivosinc.com>
 <20240229010130.1380926-9-atishp@rivosinc.com>
 <20240302-6ae8fe37b90f127bc9be737f@orel>
 <CAOnJCUKjZWnS_SaR78Fy5AUOxrd+4gBx=_YrA=FQCa20iwifNQ@mail.gmail.com>
 <a75fa96e-2f26-49a7-a7f7-4a397c4a4513@rivosinc.com>
Message-ID: <20240404-0eb0261d56c48ac9472dfe5a@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Apr 03, 2024 at 12:36:41AM -0700, Atish Patra wrote:
> On 4/1/24 15:36, Atish Patra wrote:
> > On Sat, Mar 2, 2024 at 1:49?AM Andrew Jones <ajones@ventanamicro.com> wrote:
> > > 
> > > On Wed, Feb 28, 2024 at 05:01:23PM -0800, Atish Patra wrote:
...
> > > > +
> > > >                if (flags & SBI_PMU_STOP_FLAG_RESET) {
> > > >                        pmc->event_idx = SBI_PMU_EVENT_IDX_INVALID;
> > > >                        clear_bit(pmc_index, kvpmu->pmc_in_use);
> > > > +                     if (snap_flag_set) {
> > > > +                             /* Clear the snapshot area for the upcoming deletion event */
> > > > +                             kvpmu->sdata->ctr_values[i] = 0;
> > > > +                             kvm_vcpu_write_guest(vcpu, kvpmu->snapshot_addr, kvpmu->sdata,
> > > > +                                                  sizeof(struct riscv_pmu_snapshot_data));
> > > 
> > > The spec isn't clear on this (so we should clarify it), but I'd expect
> > > that a caller who set both the reset and the snapshot flag would want
> > > the snapshot from before the reset when this call completes and then
> > > assume that when they start counting again, and look at the snapshot
> > > again, that those new counts would be from the reset values. Or maybe
> > > not :-) Maybe they want to do a reset and take a snapshot in order to
> > > look at the snapshot and confirm the reset happened? Either way, it
> > > seems we should only do one of the two here. Either update the snapshot
> > > before resetting, and not again after reset, or reset and then update
> > > the snapshot (with no need to update before).
> > > 
> > 
> > The reset call should happen when the event is deleted by the perf
> > framework in supervisor.
> > If we don't clear the values, the shared memory may have stale data of
> > last read counters
> > which is not ideal. That's why, I am clearing it upon resetting.
> 
> Thinking about it more, I think having stale values in the shared memory
> would be similar expected behavior to hardware counters after reset. We
> don't need to clear the shared memory during the reset.
> 
> If both SBI_PMU_STOP_FLAG_TAKE_SNAPSHOT and SBI_PMU_STOP_FLAG_RESET are set,
> may be we should just write it to the shared memory again without assuming
> the intention of the caller ?
>

Either way, we just need to ensure it's clear in the spec.

Thanks,
drew

