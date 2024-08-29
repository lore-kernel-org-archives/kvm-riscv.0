From: Andrew Jones <andrew.jones@linux.dev>
Date: Thu, 29 Aug 2024 18:00:33 +0200
Subject: [kvm-unit-tests PATCH v2 4/4] riscv: sbi: Add tests for HSM
 extension
In-Reply-To: <20240829-8860b495f7e50336fd8a2b90@orel>
References: <20240825170824.107467-1-jamestiotio@gmail.com>
 <20240825170824.107467-5-jamestiotio@gmail.com>
 <20240829-8860b495f7e50336fd8a2b90@orel>
Message-ID: <20240829-0f48e6c15a505fbb9fa1bae2@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Aug 29, 2024 at 03:30:26PM GMT, Andrew Jones wrote:
> On Mon, Aug 26, 2024 at 01:08:24AM GMT, James Raphael Tiovalen wrote:
...
> > +.section .data
> > +.balign PAGE_SIZE
> > +.global sbi_hsm_hart_start_checks
> > +sbi_hsm_hart_start_checks:			.space CONFIG_NR_CPUS
> > +.global sbi_hsm_non_retentive_hart_suspend_checks
> > +sbi_hsm_non_retentive_hart_suspend_checks:	.space CONFIG_NR_CPUS
> > +.global sbi_hsm_stop_hart
> > +sbi_hsm_stop_hart:				.space CONFIG_NR_CPUS
> 
> I don't think it should be necessary to create these arrays in assembly.
> We should be able to make global arrays in C in riscv/sbi.c and still
> access them from the assembly as you've done.
> 
> CONFIG_NR_CPUS will support all possible cpuids, but hartids have their
> own range and the code above is indexing these arrays by hartid. Since
> we should be able to define the arrays in C, then we could also either
> 
>  1) assert that max_hartid + 1 <= NR_CPUS
>  2) dynamically allocate the arrays using max_hartid + 1 for the size
>     and then assign global variables the physical addresses of those
>     allocated regions to use in the assembly
> 
> (1) is probably good enough

Actually we have to do (1) unless we want to open a big can of worms
because we're currently shoehorning hartids into cpumasks, but cpumasks
are based on NR_CPUS for size. To do it right, we should have hartmasks,
but they may be very large and/or sparse.

> 
> Seems on-cpus is missing an API for "all, but ...". How about, as a
> separate patch, adding
> 
>  void on_cpus_async(cpumask_t *mask, void (*func)(void *data), void *data)
> 
> to lib/on-cpus.c
> 
> Then here you'd copy the present mask to your own mask and clear 'me' from
> it for an 'all present, but me' mask.

I'll write a patch for on_cpus_async() now.

> but, instead, let's provide the following (untested) function in lib/riscv/sbi.c
> 
>    struct sbiret sbi_send_ipi_cpumask(cpumask_t *mask)
>    {
>         struct sbiret ret;
> 
> 	for (int i = 0; i < CPUMASK_NR_LONGS; ++i) {
> 	    if (cpumask_bits(mask)[i]) {
> 	       ret = sbi_send_ipi(cpumask_bits(mask)[i], i * BITS_PER_LONG);
> 	       if (ret.error)
> 	          break;
> 	    }
> 	}
> 
> 	return ret;
>    }
>

I'll write a patch adding this now too.

Thanks,
drew

