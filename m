From: Andrew Jones <ajones@ventanamicro.com>
Date: Mon, 23 Jan 2023 08:23:27 +0100
Subject: [PATCH v2 10/11] RISC-V: KVM: Implement perf support without
 sampling
In-Reply-To: <20230113114502.hiebgkujduwcmsuk@orel>
References: <20221215170046.2010255-1-atishp@rivosinc.com>
 <20221215170046.2010255-11-atishp@rivosinc.com>
 <20230113114502.hiebgkujduwcmsuk@orel>
Message-ID: <20230123072327.4k4ai6mwfy4uc6qq@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jan 13, 2023 at 12:45:02PM +0100, Andrew Jones wrote:
> On Thu, Dec 15, 2022 at 09:00:45AM -0800, Atish Patra wrote:
...
> > +	/* Start the counters that have been configured and requested by the guest */
> > +	for_each_set_bit(i, &ctr_mask, RISCV_MAX_COUNTERS) {
> > +		pmc_index = i + ctr_base;
> > +		if (!test_bit(pmc_index, kvpmu->pmc_in_use))
> > +			continue;
> > +		pmc = &kvpmu->pmc[pmc_index];
> > +		if (flag & SBI_PMU_START_FLAG_SET_INIT_VALUE)
> > +			pmc->counter_val = ival;
> > +		if (pmc->perf_event) {
> > +			if (unlikely(pmc->started)) {
> > +				sbiret = SBI_ERR_ALREADY_STARTED;
> > +				continue;
> > +			}
> > +			perf_event_period(pmc->perf_event, pmu_get_sample_period(pmc));
> > +			perf_event_enable(pmc->perf_event);
> > +			pmc->started = true;
> > +		} else {
> > +			kvm_debug("Can not start counter due to invalid confiugartion\n");
>                                    ^ Cannot                             ^ configuration
> 
> > +			sbiret = SBI_ERR_INVALID_PARAM;
> > +		}
> > +	}
> 
> Possibly a spec oversight is that we continue to try and start counters,
> even when we've seen errors. The problem with implementing that is that
> if we have both errors we only return the last one. I.e. one counter
> was already started and another counter resulted in invalid-param, we
> only return invalid-param. We also don't say anything about the number
> of failures / successes. I think we should bail on the first error and
> even stop counters that we started. Callers can then try again after
> correcting their input without potentially getting already-started errors.
> We'd need to change the spec to do that though.
>

Thinking about this some more, the spec doesn't prohibit implementations
from bailing on the first error, so we can do that. But maybe we don't
need to stop the counters we started. We can leave it to the driver to
sort out what got configured/started and what didn't when it gets an
error.

Thanks,
drew

