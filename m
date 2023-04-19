From: Andrew Jones <ajones@ventanamicro.com>
Date: Wed, 19 Apr 2023 14:14:15 +0200
Subject: [RFC PATCH 03/14] RISC-V: paravirt: Implement steal-time support
In-Reply-To: <245mmbzeqcap7i6cjmoaaitpmecefjo2ul63qjmodjv77uz54e@tizorx3p64fz>
References: <20230417103402.798596-1-ajones@ventanamicro.com>
 <20230417103402.798596-4-ajones@ventanamicro.com>
 <245mmbzeqcap7i6cjmoaaitpmecefjo2ul63qjmodjv77uz54e@tizorx3p64fz>
Message-ID: <jhgx3in3mkv3jrurvwn3jvv2qgg3avb5gdo2wrxto6xzrllhaf@5q4efxh44lqv>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Apr 19, 2023 at 10:42:16AM +0200, Andrew Jones wrote:
> On Mon, Apr 17, 2023 at 12:33:51PM +0200, Andrew Jones wrote:
> > When the SBI STA extension exists we can use it to implement
> > paravirt steal-time support. Fill in the empty pv-time functions
> > with an SBI STA implementation.
> > 
> > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> >  arch/riscv/kernel/paravirt.c | 56 ++++++++++++++++++++++++++++++++++--
> >  1 file changed, 53 insertions(+), 3 deletions(-)
> > 
> > diff --git a/arch/riscv/kernel/paravirt.c b/arch/riscv/kernel/paravirt.c
> > index 141dbcc36fa2..5f8d96b919e4 100644
> > --- a/arch/riscv/kernel/paravirt.c
> > +++ b/arch/riscv/kernel/paravirt.c
> > @@ -6,12 +6,21 @@
> >  #define pr_fmt(fmt) "riscv-pv: " fmt
> >  
> >  #include <linux/cpuhotplug.h>
> > +#include <linux/compiler.h>
> > +#include <linux/errno.h>
> >  #include <linux/init.h>
> >  #include <linux/jump_label.h>
> > +#include <linux/kconfig.h>
> > +#include <linux/kernel.h>
> > +#include <linux/percpu-defs.h>
> >  #include <linux/printk.h>
> >  #include <linux/static_call.h>
> >  #include <linux/types.h>
> >  
> > +#include <asm/barrier.h>
> > +#include <asm/page.h>
> > +#include <asm/sbi.h>
> > +
> >  struct static_key paravirt_steal_enabled;
> >  struct static_key paravirt_steal_rq_enabled;
> >  
> > @@ -31,24 +40,65 @@ static int __init parse_no_stealacc(char *arg)
> >  
> >  early_param("no-steal-acc", parse_no_stealacc);
> >  
> > +DEFINE_PER_CPU(struct sbi_sta_struct, steal_time) __aligned(64);
> > +
> >  static bool __init has_pv_steal_clock(void)
> >  {
> > +	if (sbi_probe_extension(SBI_EXT_STA) > 0) {
> > +		pr_info("SBI STA extension detected\n");
> > +		return true;
> > +	}
> > +
> >  	return false;
> >  }
> >  
> > -static int pv_time_cpu_online(unsigned int cpu)
> > +static int sbi_sta_set_steal_time_shmem(unsigned long lo, unsigned long hi,
> > +					unsigned long flags)
> >  {
> > +	struct sbiret ret;
> > +
> > +	ret = sbi_ecall(SBI_EXT_STA, SBI_EXT_STA_SET_STEAL_TIME_SHMEM,
> > +			lo, hi, flags, 0, 0, 0);
> > +	if (ret.error) {
> > +		if (lo == -1 && hi == -1)
> > +			pr_warn("Failed to disable steal-time shmem");
> > +		else
> > +			pr_warn("Failed to set steal-time shmem");
> > +		return -ENOMEM;
> > +	}
> > +
> >  	return 0;
> >  }
> >  
> > +static int pv_time_cpu_online(unsigned int cpu)
> > +{
> > +	struct sbi_sta_struct *st = this_cpu_ptr(&steal_time);
> > +	phys_addr_t pa = __pa(st);
> > +	unsigned long lo = (unsigned long)pa;
> > +	unsigned long hi = IS_ENABLED(CONFIG_32BIT) ? upper_32_bits((u64)pa) : 0;
> > +
> > +	return sbi_sta_set_steal_time_shmem(lo, hi, 0);
> > +}
> > +
> >  static int pv_time_cpu_down_prepare(unsigned int cpu)
> >  {
> > -	return 0;
> > +	return sbi_sta_set_steal_time_shmem(-1, -1, 0);
> >  }
> >  
> >  static u64 pv_time_steal_clock(int cpu)
> >  {
> > -	return 0;
> > +	struct sbi_sta_struct *st = per_cpu_ptr(&steal_time, cpu);
> > +	u32 sequence;
> > +	u64 steal;
> > +
> > +	do {
> > +		sequence = st->sequence;
> > +		virt_rmb();
> > +		steal = st->steal;
> > +		virt_rmb();
> > +	} while ((sequence & 1) || (sequence != st->sequence));
> > +
> > +	return steal;
> >  }
> 
> So anybody poking around the implementations for other architectures will
> see that I shamelessly ripped this off from x86's implementation. However,
> looking at it again, I think all the references to the steal-time info
> should be wrapped in READ_ONCE(). I'll write a patch for x86/kvm to
> add READ_ONCE's and also update this patch for rfc-v2.
>

After rereading "COMPILER BARRIER" of Documentation/memory-barriers.txt, I
no longer believe we need the READ_ONCE wrappers for x86 nor riscv, unless
we add them "for documentation purposes", as suggested by that section.
The reason is that the virt_rmb() barriers also act as compiler barriers,
which not only ensures program access order, but also "Within a loop,
forces the compiler to load the variables used in that loop's conditional
on each pass through that loop."

That said, my preference would be to add them, though, so I'll at least
add them for riscv for rfc-v2. Maybe I'll still send the x86 patch too.

Thanks,
drew

