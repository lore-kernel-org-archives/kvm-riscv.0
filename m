From: Andrew Jones <andrew.jones@linux.dev>
Date: Mon, 12 Aug 2024 14:45:24 +0200
Subject: [kvm-unit-tests PATCH 3/3] riscv: sbi: Add tests for HSM
 extension
In-Reply-To: <20240810175744.166503-4-jamestiotio@gmail.com>
References: <20240810175744.166503-1-jamestiotio@gmail.com>
 <20240810175744.166503-4-jamestiotio@gmail.com>
Message-ID: <20240812-32c3763741ce6ac66c7b50eb@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Aug 11, 2024 at 01:57:44AM GMT, James Raphael Tiovalen wrote:
> Add some tests for all of the HSM extension functions.
> 
> Signed-off-by: James Raphael Tiovalen <jamestiotio@gmail.com>
> ---
>  riscv/Makefile  |   7 +-
>  riscv/sbi-asm.S |  38 +++++++
>  riscv/sbi.c     | 280 ++++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 322 insertions(+), 3 deletions(-)
>  create mode 100644 riscv/sbi-asm.S
> 
> diff --git a/riscv/Makefile b/riscv/Makefile
> index b0cd613f..c0fd8684 100644
> --- a/riscv/Makefile
> +++ b/riscv/Makefile
> @@ -21,6 +21,7 @@ all: $(tests)
>  $(TEST_DIR)/sieve.$(exe): AUXFLAGS = 0x1
>  
>  cstart.o = $(TEST_DIR)/cstart.o
> +sbi-asm.o = $(TEST_DIR)/sbi-asm.o

We should be able to just add sbi-asm.o to cflatobjs. It doesn't need
special treatment.

>  
>  cflatobjs += lib/alloc.o
>  cflatobjs += lib/alloc_page.o
> @@ -97,7 +98,7 @@ cflatobjs += lib/efi.o
>  .PRECIOUS: %.so
>  
>  %.so: EFI_LDFLAGS += -defsym=EFI_SUBSYSTEM=0xa --no-undefined
> -%.so: %.o $(FLATLIBS) $(SRCDIR)/riscv/efi/elf_riscv64_efi.lds $(cstart.o) %.aux.o
> +%.so: %.o $(FLATLIBS) $(SRCDIR)/riscv/efi/elf_riscv64_efi.lds $(cstart.o) $(sbi-asm.o) %.aux.o
>  	$(LD) $(EFI_LDFLAGS) -o $@ -T $(SRCDIR)/riscv/efi/elf_riscv64_efi.lds \
>  		$(filter %.o, $^) $(FLATLIBS) $(EFI_LIBS)
>  
> @@ -113,7 +114,7 @@ cflatobjs += lib/efi.o
>  		-O binary $^ $@
>  else
>  %.elf: LDFLAGS += -pie -n -z notext
> -%.elf: %.o $(FLATLIBS) $(SRCDIR)/riscv/flat.lds $(cstart.o) %.aux.o
> +%.elf: %.o $(FLATLIBS) $(SRCDIR)/riscv/flat.lds $(cstart.o) $(sbi-asm.o) %.aux.o
>  	$(LD) $(LDFLAGS) -o $@ -T $(SRCDIR)/riscv/flat.lds \
>  		$(filter %.o, $^) $(FLATLIBS)
>  	@chmod a-x $@
> @@ -125,7 +126,7 @@ else
>  endif
>  
>  generated-files = $(asm-offsets)
> -$(tests:.$(exe)=.o) $(cstart.o) $(cflatobjs): $(generated-files)
> +$(tests:.$(exe)=.o) $(cstart.o) $(sbi-asm.o) $(cflatobjs): $(generated-files)
>  
>  arch_clean: asm_offsets_clean
>  	$(RM) $(TEST_DIR)/*.{o,flat,elf,so,efi,debug} \
> diff --git a/riscv/sbi-asm.S b/riscv/sbi-asm.S
> new file mode 100644
> index 00000000..6d348c88
> --- /dev/null
> +++ b/riscv/sbi-asm.S
> @@ -0,0 +1,38 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Helper assembly code routines for RISC-V SBI extension tests.
> + *
> + * Copyright (C) 2024, James Raphael Tiovalen <jamestiotio@gmail.com>
> + */
> +#define __ASSEMBLY__
> +#include <asm/asm.h>
> +#include <asm/asm-offsets.h>

Don't need to include asm-offsets.h

> +#include <asm/csr.h>
> +#include <asm/page.h>

Don't need to include page.h

> +
> +.section .text
> +.balign 4
> +.global check_hart_start
> +check_hart_start:
> +	csrr t0, CSR_SATP
> +	bnez t0, hart_start_checks_failed
> +	csrr t0, CSR_SSTATUS
> +	andi t1, t0, SR_SIE
> +	bnez t1, hart_start_checks_failed
> +	bne a0, a1, hart_start_checks_failed
> +	la t0, hart_start_works
> +	li t1, 1
> +	sb t1, 0(t0)
> +hart_start_checks_failed:
> +	la t0, stop_test_hart
> +	lb t1, 0(t0)
> +	beqz t1, hart_start_checks_failed
> +	call sbi_hart_stop

We can't call C code unless we setup the stack.

> +	j halt

I think we want a variable named 'sbi_hsm_hart_start_checks' which is a bitmap,
where each bit represents the result of a single test. Something like

#define SBI_HSM_START_TEST_DONE       (1 << 0)
#define SBI_HSM_START_TEST_SATP       (1 << 1)
#define SBI_HSM_START_TEST_SIE        (1 << 2)
#define SBI_HSM_START_TEST_HARTID_A1  (1 << 4)

sbi_hsm_check_hart_start:
    li     t0, 0
    csrr   t1, CSR_SATP
    bnez   t1, 1f
    li     t0, SBI_HSM_START_TEST_SATP
1:  csrr   t1, CSR_STATUS
    andi   t1, t1, SR_SIE
    bnez   t1, 2f
    orr    t0, t0, SBI_HSM_START_TEST_SIE
2:  bne    a0, a1, 3f
    orr    t0, t0, SBI_HSM_START_TEST_HARTID_A1
3:  orr    t0, t0, SBI_HSM_START_TEST_DONE
    la     t1, sbi_hsm_hart_start_checks
    REG_S  t0, 0(t1)
4:  la     t0, sbi_hsm_stop_hart
    REG_L  t0, 0(t0)
    pause
    beqz   t0, 4b
    li     a7, 0x48534d		/* HSM extension ID */
    li     a6, 1		/* hart stop FID */
    ecall
    j      halt

> +
> +.section .data
> +.balign PAGE_SIZE
> +.global hart_start_works
> +hart_start_works:	.byte 0
> +.global stop_test_hart
> +stop_test_hart:		.byte 0
> diff --git a/riscv/sbi.c b/riscv/sbi.c
> index 08bd6a95..53986c9e 100644
> --- a/riscv/sbi.c
> +++ b/riscv/sbi.c
> @@ -5,6 +5,7 @@
>   * Copyright (C) 2023, Ventana Micro Systems Inc., Andrew Jones <ajones@ventanamicro.com>
>   */
>  #include <libcflat.h>
> +#include <cpumask.h>
>  #include <stdlib.h>
>  #include <limits.h>
>  #include <asm/barrier.h>
> @@ -15,6 +16,9 @@
>  #include <asm/sbi.h>
>  #include <asm/smp.h>
>  #include <asm/timer.h>
> +#include <asm/io.h>
> +#include <asm/page.h>
> +#include <asm/setup.h>

nit: prefer alphabetic order unless order matters (but we should fix
it if order does matter, except for libcflat.h needing to be first)

>  
>  static void help(void)
>  {
> @@ -253,6 +257,281 @@ static void check_time(void)
>  	report_prefix_pop();
>  }
>  
> +struct hsm_info {
> +	bool stages[2];

Please write a comment explaining the stages of the test(s).

> +	bool retentive_suspend_hart;
> +	bool stop_hart;
> +};
> +
> +static struct hsm_info hsm_info[NR_CPUS];
> +extern void check_hart_start(void);
> +extern unsigned char stop_test_hart;
> +extern unsigned char hart_start_works;
> +
> +static void hart_execute(void)
> +{
> +	struct sbiret ret;
> +	unsigned long hartid = current_thread_info()->hartid;
> +
> +	hsm_info[hartid].stages[0] = true;
> +
> +	while (true) {
> +		if (hsm_info[hartid].retentive_suspend_hart) {

We need to use READ_ONCE() when using data in this way to ensure the
compiler doesn't generate code that either loops forever or never
loops.

> +			hsm_info[hartid].retentive_suspend_hart = false;
> +			ret = sbi_hart_suspend(SBI_EXT_HSM_HART_SUSPEND_RETENTIVE, __pa(NULL), __pa(NULL));
> +			if (ret.error)
> +				report_fail("failed to retentive suspend hart %ld", hartid);
> +			else
> +				hsm_info[hartid].stages[1] = true;
> +

nit: stray blank line

> +		} else if (hsm_info[hartid].stop_hart) {

Also needs READ_ONCE

Why all the separate booleans for this state machine instead of enum
with different command IDs.

> +			break;
> +		} else {
> +			cpu_relax();
> +		}
> +	}
> +
> +	ret = sbi_hart_stop();
> +	if (ret.error)
> +		report_fail("failed to stop hart %ld", hartid);

If we failed to stop we should call halt() here.

> +}
> +
> +static void check_hsm(void)
> +{
> +	struct sbiret ret;
> +	unsigned long hartid;
> +	int cpu;
> +	unsigned long hart_mask = 0;
> +	bool ipi_failed = false;
> +	unsigned int stage = 0;
> +
> +	report_prefix_push("hsm");
> +
> +	if (!sbi_probe(SBI_EXT_HSM)) {
> +		report_skip("hsm extension not available");
> +		report_prefix_pop();
> +		return;
> +	}
> +
> +	report_prefix_push("hart_get_status");
> +
> +	hartid = current_thread_info()->hartid;
> +	ret = sbi_hart_get_status(hartid);
> +
> +	if (ret.error) {
> +		report_fail("current hartid is invalid");

Need to check/output error, not assume that it's invalid-param

> +		report_prefix_pop();
> +		report_prefix_pop();

As a separate patch, we should add a

 void report_prefix_popn(int n)
 {
	while (n--)
		report_prefix_pop();
 }

and / or

 void report_prefix_clear(void)
 {
 	spin_lock(&lock);
	prefixes[0] = '\0';
	spin_unlock(&lock);
 }

function to lib/report.c and then use it in places like this.

> +		return;
> +	} else if (ret.value != SBI_EXT_HSM_STARTED) {
> +		report_fail("current hart is not started");
> +		report_prefix_pop();
> +		report_prefix_pop();
> +		return;
> +	}
> +
> +	report_pass("status of current hart is started");
> +
> +	report_prefix_pop();
> +
> +	report_prefix_push("hart_start");
> +
> +	ret = sbi_hart_start(hartid, virt_to_phys(&hart_execute), __pa(NULL));
> +	report(ret.error == SBI_ERR_ALREADY_AVAILABLE, "boot hart is already started");
> +
> +	ret = sbi_hart_start(ULONG_MAX, virt_to_phys(&hart_execute), __pa(NULL));
> +	report(ret.error == SBI_ERR_INVALID_PARAM, "invalid hartid check");
> +
> +	if (nr_cpus < 2) {
> +		report_skip("no other cpus to run the remaining hsm tests on");
> +		report_prefix_pop();
> +		report_prefix_pop();
> +		return;
> +	}
> +
> +	for_each_present_cpu(cpu) {
> +		if (cpu != smp_processor_id()) {
> +			hartid = cpus[cpu].hartid;
> +			break;
> +		}
> +	}
> +
> +	ret = sbi_hart_start(hartid, virt_to_phys(&check_hart_start), hartid);
> +

nit: remove this blank line

> +	if (ret.error) {
> +		report_fail("failed to start test hart");

output the error

> +		report_prefix_pop();
> +		report_prefix_pop();
> +		return;
> +	}
> +
> +	ret = sbi_hart_get_status(hartid);
> +
> +	while (!ret.error && (ret.value == SBI_EXT_HSM_STOPPED))

nit: unnecessary (), same comment for similar conditions below

> +		ret = sbi_hart_get_status(hartid);

Need to check if we broke out of the loop due to error here and
report the error if we did. I just a helper function to use for
all these

 static void hart_wait_on_status(unsigned long hartid, enum sbi_ext_hsm_sid status)
 {
    sbiret ret = sbi_hart_get_status(hartid);
    while (!ret.error && ret.value == status)
        ret = sbi_hart_get_status(hartid);
    if (ret.error)
        report_fail("got %ld while waiting on status %u for hart %lx\n", ret.error, status, hartid);
 }

> +
> +	while (!ret.error && (ret.value == SBI_EXT_HSM_START_PENDING))
> +		ret = sbi_hart_get_status(hartid);
> +
> +	report(!ret.error && (ret.value == SBI_EXT_HSM_STARTED),
> +	       "test hart with hartid %ld successfully started", hartid);
> +
> +	while (!hart_start_works)

while (!(READ_ONCE(sbi_hsm_hart_start_checks) & SBI_HSM_START_TEST_DONE))

> +		cpu_relax();
> +
> +	report(hart_start_works,
> +	       "test hart %ld successfully executed code", hartid);

report(sbi_hsm_hart_start_checks & SBI_HSM_START_TEST_SATP, "satp is zero");
report(sbi_hsm_hart_start_checks & ...
report(sbi_hsm_hart_start_checks & ...


> +
> +	stop_test_hart = true;

WRITE_ONCE(sbi_hsm_stop_hart, 1);

> +
> +	ret = sbi_hart_get_status(hartid);
> +
> +	while (!ret.error && (ret.value == SBI_EXT_HSM_STARTED))
> +		ret = sbi_hart_get_status(hartid);
> +
> +	while (!ret.error && (ret.value == SBI_EXT_HSM_STOP_PENDING))
> +		ret = sbi_hart_get_status(hartid);
> +
> +	report(!ret.error && (ret.value == SBI_EXT_HSM_STOPPED),
> +	       "test hart %ld successfully stopped", hartid);
> +
> +	for_each_present_cpu(cpu) {
> +		if (cpu != smp_processor_id())
> +			smp_boot_secondary(cpu, hart_execute);
> +	}
> +	for_each_present_cpu(cpu) {
> +		if (cpu != smp_processor_id()) {
> +			hartid = cpus[cpu].hartid;
> +			ret = sbi_hart_get_status(hartid);
> +
> +			while (!ret.error && (ret.value == SBI_EXT_HSM_STOPPED))
> +				ret = sbi_hart_get_status(hartid);
> +
> +			while (!ret.error && (ret.value == SBI_EXT_HSM_START_PENDING))
> +				ret = sbi_hart_get_status(hartid);
> +
> +			report(!ret.error && (ret.value == SBI_EXT_HSM_STARTED),
> +			       "new hart with hartid %ld successfully started", hartid);
> +		}
> +	}

Instead of the two for loops, we can use on_cpus(hart_execute, NULL) and
then wait on a cpumask for each to report that they've entered
hart_execute and then check their HSM status. (See riscv/selftest.c for
some inspiration.)
        
> +
> +
> +	for_each_present_cpu(cpu) {
> +		if (cpu != smp_processor_id()) {
> +			hartid = cpus[cpu].hartid;
> +
> +			while (!hsm_info[hartid].stages[stage])
> +				cpu_relax();

You probably want cpumasks instead of these arrays. You won't need
READ_ONCE with cpumasks.

> +
> +			report(hsm_info[hartid].stages[stage],
> +			       "hart %ld successfully executed stage %d code", hartid, stage + 1);
> +		}
> +	}
> +
> +	stage++;
> +
> +	report_prefix_pop();
> +
> +	report_prefix_push("hart_suspend");
> +
> +	if (sbi_probe(SBI_EXT_IPI)) {
> +		for_each_present_cpu(cpu) {
> +			if (cpu != smp_processor_id()) {

Reduce indentation and CSR reads by saving smp_processor_id() once at the
top of this function into a variable, e.g. 'me', and then using continue
in the loops

   for_each_present_cpu(cpu) {
       if (cpu == me)
          continue;
       ...
   }

> +				hartid = cpus[cpu].hartid;
> +				hsm_info[hartid].retentive_suspend_hart = true;
> +				hart_mask |= 1UL << hartid;
> +			}
> +		}
> +
> +		for_each_present_cpu(cpu) {
> +			if (cpu != smp_processor_id()) {
> +				hartid = cpus[cpu].hartid;
> +				ret = sbi_hart_get_status(hartid);
> +
> +				while (!ret.error && (ret.value == SBI_EXT_HSM_STARTED))
> +					ret = sbi_hart_get_status(hartid);
> +
> +				while (!ret.error && (ret.value == SBI_EXT_HSM_SUSPEND_PENDING))
> +					ret = sbi_hart_get_status(hartid);
> +
> +				report(!ret.error && (ret.value == SBI_EXT_HSM_SUSPENDED),
> +				       "hart %ld successfully retentive suspended", hartid);
> +			}
> +		}
> +
> +		ret = __ipi_sbi_ecall(hart_mask, 0UL);

no need for the UL

> +		if (ret.error) {
> +			ipi_failed = true;
> +			report_fail("failed to send ipi to retentive suspended harts");

output the error number

> +		} else {
> +			for_each_present_cpu(cpu) {
> +				if (cpu != smp_processor_id()) {
> +					hartid = cpus[cpu].hartid;
> +					ret = sbi_hart_get_status(hartid);
> +
> +					while (!ret.error && (ret.value == SBI_EXT_HSM_SUSPENDED))
> +						ret = sbi_hart_get_status(hartid);
> +
> +					while (!ret.error && (ret.value == SBI_EXT_HSM_RESUME_PENDING))
> +						ret = sbi_hart_get_status(hartid);
> +
> +					report(!ret.error && (ret.value == SBI_EXT_HSM_STARTED),
> +					       "hart %ld successfully retentive resumed", hartid);
> +				}
> +			}
> +
> +			for_each_present_cpu(cpu) {
> +				if (cpu != smp_processor_id()) {
> +					hartid = cpus[cpu].hartid;
> +
> +					while (!hsm_info[hartid].stages[stage])
> +						cpu_relax();
> +
> +					report(hsm_info[hartid].stages[stage],
> +					       "hart %ld successfully executed stage %d code",
> +					       hartid, stage + 1);
> +				}
> +			}
> +		}
> +	} else {
> +		report_skip("skipping tests since ipi extension is unavailable");
                                     ^ suspension

> +	}
> +
> +	report_prefix_pop();
> +
> +	report_prefix_push("hart_stop");
> +
> +	if (!ipi_failed) {
> +		for_each_present_cpu(cpu) {
> +			if (cpu != smp_processor_id()) {
> +				hartid = cpus[cpu].hartid;
> +				hsm_info[hartid].stop_hart = true;
> +			}
> +		}
> +
> +		for_each_present_cpu(cpu) {
> +			if (cpu != smp_processor_id()) {
> +				hartid = cpus[cpu].hartid;
> +				ret = sbi_hart_get_status(hartid);
> +
> +				while (!ret.error && (ret.value == SBI_EXT_HSM_STARTED))
> +					ret = sbi_hart_get_status(hartid);
> +
> +				while (!ret.error && (ret.value == SBI_EXT_HSM_STOP_PENDING))
> +					ret = sbi_hart_get_status(hartid);
> +
> +				report(!ret.error && (ret.value == SBI_EXT_HSM_STOPPED),
> +				       "hart %ld successfully stopped", hartid);
> +			}
> +		}
> +	} else {
> +		report_skip("skipping tests since ipi failed to be sent");
> +	}

What about non-retentive suspend tests?a


I think we can model these tests by breaking them into functions and then
using on_cpus() for each rather than have the stages stuff.

Thanks,
drew


> +
> +	report_prefix_pop();
> +	report_prefix_pop();
> +}
> +
>  int main(int argc, char **argv)
>  {
>  
> @@ -264,6 +543,7 @@ int main(int argc, char **argv)
>  	report_prefix_push("sbi");
>  	check_base();
>  	check_time();
> +	check_hsm();
>  
>  	return report_summary();
>  }
> -- 
> 2.43.0
> 
> 
> -- 
> kvm-riscv mailing list
> kvm-riscv at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

