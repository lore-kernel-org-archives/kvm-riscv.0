From: Andrew Jones <andrew.jones@linux.dev>
Date: Tue, 20 Aug 2024 18:24:13 +0200
Subject: [kvm-unit-tests PATCH] riscv: sbi: Add IPI extension tests.
In-Reply-To: <20240819020129.26095-1-cade.richard@berkeley.edu>
References: <20240819020129.26095-1-cade.richard@berkeley.edu>
Message-ID: <20240820-e5197fe04581b3c03e24c681@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Aug 18, 2024 at 07:01:29PM GMT, Cade Richard wrote:
> Add tests for the RISC-V OpenSBI inter-processor interrupt extension.
> 
> Signed-off-by: Cade Richard <cade.richard@berkeley.edu>
> ---
>  lib/riscv/asm/sbi.h |   5 ++
>  riscv/sbi.c         | 138 ++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 143 insertions(+)
> 
> diff --git a/lib/riscv/asm/sbi.h b/lib/riscv/asm/sbi.h
> index 47e91025..d0abeefc 100644
> --- a/lib/riscv/asm/sbi.h
> +++ b/lib/riscv/asm/sbi.h
> @@ -20,6 +20,7 @@ enum sbi_ext_id {
>  	SBI_EXT_HSM = 0x48534d,
>  	SBI_EXT_SRST = 0x53525354,
>  	SBI_EXT_DBCN = 0x4442434E,
> +	SBI_EXT_IPI = 0x735049,

We're trying to list these in spec chapter order, so IPI should come
before HSM.

>  };
>  
>  enum sbi_ext_base_fid {
> @@ -49,6 +50,10 @@ enum sbi_ext_dbcn_fid {
>  	SBI_EXT_DBCN_CONSOLE_WRITE_BYTE,
>  };
>  
> +enum sbi_ext_ipi_fid {
> +	SBI_EXT_IPI_SEND = 0,
> +};
> +
>  struct sbiret {
>  	long error;
>  	long value;
> diff --git a/riscv/sbi.c b/riscv/sbi.c
> index 36ddfd48..c339b330 100644
> --- a/riscv/sbi.c
> +++ b/riscv/sbi.c
> @@ -6,11 +6,14 @@
>   */
>  #include <libcflat.h>
>  #include <alloc_page.h>
> +#include <cpumask.h>
>  #include <stdlib.h>
>  #include <string.h>
>  #include <limits.h>
>  #include <vmalloc.h>
>  #include <memregions.h>
> +#include <on-cpus.h>
> +#include <rand.h>
>  #include <asm/barrier.h>
>  #include <asm/csr.h>
>  #include <asm/delay.h>
> @@ -23,6 +26,9 @@
>  #include <asm/timer.h>
>  
>  #define	HIGH_ADDR_BOUNDARY	((phys_addr_t)1 << 32)
> +static prng_state ps;
> +static bool ipi_received[__riscv_xlen];
> +static bool ipi_timeout[__riscv_xlen];
>  
>  static void help(void)
>  {
> @@ -45,6 +51,11 @@ static struct sbiret __dbcn_sbi_ecall(int fid, unsigned long arg0, unsigned long
>  	return sbi_ecall(SBI_EXT_DBCN, fid, arg0, arg1, arg2, 0, 0, 0);
>  }
>  
> +static struct sbiret __ipi_sbi_ecall(unsigned long arg0, unsigned long arg1)

This function is specific to IPI so we should use specific parameter
names: hart_mask, hart_mask_base

> +{
> +	return sbi_ecall(SBI_EXT_IPI, SBI_EXT_IPI_SEND, arg0, arg1, 0, 0, 0, 0);
> +}
> +
>  static void split_phys_addr(phys_addr_t paddr, unsigned long *hi, unsigned long *lo)
>  {
>  	*lo = (unsigned long)paddr;
> @@ -420,6 +431,132 @@ static void check_dbcn(void)
>  	report_prefix_pop();
>  }
>  
> +static int rand_online_cpu(prng_state* ps) {

'{' on its own line. Same comment for other functions below.

> +	int me = smp_processor_id();
> +	int num_iters = prng32(ps);

Do we really want to iterate up to 4294967295 times? I guess you want
apply a mod with some max number of iterations to this.

> +	int rand_cpu = cpumask_next(me, &cpu_online_mask);

If me was the last cpu ID, then rand_cpu will be 'nr_cpus'

> +
> +	for (int i = 0; i < num_iters; i++) {
> +		rand_cpu = cpumask_next(me, &cpu_online_mask);
> +	}

This must be incomplete. It does the exact same thing over and over for no
reason.

> +
> +	return rand_cpu;
> +}
> +
> +static void ipi_timeout_handler(struct pt_regs *regs) {
> +	int me = smp_processor_id();
> +	ipi_timeout[me] = true;
> +	report_fail("ipi timed out on hart %d", me);

Let's not call stuff like report* from interrupt handlers. Just
setting the boolean is enough. We can check that boolean and
call report somewhere else which is outside interrupt context.

> +}
> +
> +static void ipi_irq_handler(struct pt_regs *regs) {
> +	int me = smp_processor_id();
> +	ipi_received[me] = true;
> +	report_pass("ipi received on hart %d", me);

Same comment as above about no report calls in interrupt context.

> +	

extra blank line here

> +}
> +
> +static void ipi_hart_init(void *irq_func) {
> +	int me = smp_processor_id();
> +	printf("Installing IPI IRQ handler on hart %d", me);

Drop this print message since it's not useful.

> +	install_irq_handler(IRQ_S_IPI, (void *)ipi_irq_handler);

IRQ_S_IPI is not defined anywhere so this can't compile.

> +	install_irq_handler(IRQ_S_TIMER, (void *)ipi_timeout_handler);
> +	timer_irq_enable();
> +	while (!ipi_received[me] && !ipi_timeout[me]) {
> +		cpu_relax();
> +	}

I don't think this loop will ever end because I don't see where
local_irq_enable() is called.

No {} around single statements.

> +}
> +
> +static int offline_cpu(void) {
> +	for (int i = 0; i < __riscv_xlen; i++) {

Looking ahead it looks like you want to find a cpu number which
isn't valid. You should probably be looking@the cpu_present_mask
instead in that case. Also there's no need to try cpus < nr_cpus
since those should all be present.

> +		if (!cpumask_test_cpu(i, &cpu_online_mask)) {
> +			return i;
> +		}
> +	}
> +	return -1;
> +}
> +
> +static void print_bits(size_t const size, void const * const ptr)
> +{
> +    unsigned char *b = (unsigned char*) ptr;
                                          ^ no space here
> +    unsigned char byte;
> +    int i, j;
> +    
> +    for (i = size-1; i >= 0; i--) {
> +        for (j = 7; j >= 0; j--) {
> +            byte = (b[i] >> j) & 1;

s/byte/bit/

> +            printf("%u", byte);
> +        }
> +    }
> +    puts("");
> +}
> +
> +static void set_flags_false(bool arr[])
> +{
> +	for (int i = 0; i < __riscv_xlen; i++) {
> +		arr[i] = 0;
> +	}
> +}

We don't need this function. We have memset().

> +
> +static void check_ipi(void)
> +{
> +	int cpu = smp_processor_id();
> +	unsigned long me = (unsigned long)cpu;
> +	struct sbiret ret;
> +	ps = prng_init(0xDEADBEEF);
> +
> +	report_prefix_push("ipi");
> +
> +	if (!sbi_probe(SBI_EXT_IPI)) {
> +		report_skip("ipi extension not available");
> +		report_prefix_pop();
> +		return;
> +	}
> +
> +	if (cpu_has_extension(smp_processor_id(), ISA_SSTC)) {
> +		csr_write(CSR_STIMECMP, ULONG_MAX);
> +		if (__riscv_xlen == 32)
> +			csr_write(CSR_STIMECMPH, ULONG_MAX);
> +	}
> +
> +	report_prefix_push("send to one random hart");
> +	set_flags_false(ipi_received);
> +	set_flags_false(ipi_timeout);

memset(ipi_received, 0, sizeof(ipi_received));
memset(ipi_timeout, 0, sizeof(ipi_timeout));

> +	int rand_hartid = rand_online_cpu(&ps);
> +	on_cpu(rand_hartid, (void *)ipi_hart_init, NULL);
> +	unsigned long ipi_rand_mask = 1 << rand_hartid;

If rand_hartid > xlen then this shift will overflow. We use use a cpumask.

We should be setting the timeout here before doing the test below.

> +
> +	ret = __ipi_sbi_ecall(ipi_rand_mask, me);

rand_hartid is relative to zero, but 'me' doesn't have to be zero, so we
can't use 'me' for the base, we need to use zero or, if trying to specify
harts with IDs larger than xlen, we need some other multiple of xlen here.

> +	report(ret.error == SBI_SUCCESS, "send to one randomly chosen hart");
> +	report_prefix_pop();
> +
> +	report_prefix_push("broadcast");
> +	set_flags_false(ipi_received);
> +	set_flags_false(ipi_timeout);
> +	on_cpus((void *)ipi_hart_init, NULL);
> +	unsigned long ipi_broadcast_mask = (unsigned long)(cpumask_bits(&cpu_online_mask)[me]);

I'm not sure what this is trying to do, but since we should be using
actual cpumasks instead of unsigned longs called masks, then, if
we want a mask of all online harts, just do

cpumask_copy(&ipi_broadcast_mask, &cpu_online_mask);

> +	puts("online cpu mask: ");
> +	print_bits(CPUMASK_NR_LONGS*sizeof(long), &ipi_broadcast_mask);

Let's drop print_bits. I'll provide a cpumask_to_list() function which
returns a cpumask as cpu-list, e.g. 0,2,3-5,7-9 type of format.

> +	puts("\n");
> +
> +	ret = __ipi_sbi_ecall(ipi_broadcast_mask, me);

This is fine to test broadcasting to a subset of all harts, but we should
also have a test using (0, -1) for the parameters. See section 3.1 of the
SBI spec.

> +	report(ret.error == SBI_SUCCESS, "send to all available harts");
> +	report_prefix_pop();
> +
> +	report_prefix_push("invalid parameters");
> +	unsigned long invalid_hart_mask_base = offline_cpu();
> +	ret = __ipi_sbi_ecall(ipi_rand_mask, invalid_hart_mask_base);
> +	report(ret.error == SBI_ERR_INVALID_PARAM, "hart_mask_base");
> +
> +	unsigned long invalid_cpu_mask = 1 << invalid_hart_mask_base;
> +	ret = __ipi_sbi_ecall(invalid_cpu_mask, me);

This may work to construct an invalid mask, if we don't have an xlen
multiple of harts available. Another test might be to use a mask
of zero with a mask-base that is *not* -1.

> +	report(ret.error == SBI_ERR_INVALID_PARAM, "hart_mask");
> +	report_prefix_pop();
> +
> +	report_prefix_pop();
> +	report_prefix_pop();
> +}
> +
>  int main(int argc, char **argv)
>  {
>  	if (argc > 1 && !strcmp(argv[1], "-h")) {
> @@ -431,6 +568,7 @@ int main(int argc, char **argv)
>  	check_base();
>  	check_time();
>  	check_dbcn();
> +	check_ipi();
>  
>  	return report_summary();
>  }
> -- 
> 2.43.0
>

Thanks,
drew

