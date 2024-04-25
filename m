From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 25 Apr 2024 13:22:08 -0700
Subject: [kvm-riscv/for-next 1/2] drivers/perf: riscv: Remove the warning
 from stop function
In-Reply-To: <d2742ee1-7e3c-4c0d-8172-d3543fe78e5e@sifive.com>
References: <20240425232933.4111680-1-atishp@rivosinc.com> <20240425232933.4111680-2-atishp@rivosinc.com>
 <d2742ee1-7e3c-4c0d-8172-d3543fe78e5e@sifive.com>
Message-ID: <CAOnJCUKtEZxK4TdL7G6zXBWDibFUwHMNz9cDcMMRT3p9jTrXkQ@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Apr 25, 2024 at 1:08?PM Samuel Holland
<samuel.holland@sifive.com> wrote:
>
> On 2024-04-25 6:29 PM, Atish Patra wrote:
> > The warning message was initially added just to indicate that counter
> > stop function is being called while the event is already stopped.
> >
> > However, we update the state to stopped case now in an overflow handler
> > after stopping the counter. If there is another child overflow handler
> > is registered (e.g kvm) it may call stop again which will trigger the
> > warning.
> >
> > Fixes : commit 22f5dac41004d ("drivers/perf: riscv: Implement SBI PMU snapshot function")
>
> This may be intentional, since you wanted these to be squashed, but this isn't
> the right format for a Fixes: tag (no space before ":" and no "commit"). Otherwise,
>

Yeah. Just wanted to be explicit as the commit is based on kvm-riscv
queue and not based on upstream commit.

> Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
>
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > ---
> >  drivers/perf/riscv_pmu.c | 2 --
> >  1 file changed, 2 deletions(-)
> >
> > diff --git a/drivers/perf/riscv_pmu.c b/drivers/perf/riscv_pmu.c
> > index 36d348753d05..78c490e0505a 100644
> > --- a/drivers/perf/riscv_pmu.c
> > +++ b/drivers/perf/riscv_pmu.c
> > @@ -191,8 +191,6 @@ void riscv_pmu_stop(struct perf_event *event, int flags)
> >       struct hw_perf_event *hwc = &event->hw;
> >       struct riscv_pmu *rvpmu = to_riscv_pmu(event->pmu);
> >
> > -     WARN_ON_ONCE(hwc->state & PERF_HES_STOPPED);
> > -
> >       if (!(hwc->state & PERF_HES_STOPPED)) {
> >               if (rvpmu->ctr_stop) {
> >                       rvpmu->ctr_stop(event, 0);
>


-- 
Regards,
Atish

