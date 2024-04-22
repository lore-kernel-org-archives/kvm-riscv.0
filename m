From: Andrew Jones <ajones@ventanamicro.com>
Date: Mon, 22 Apr 2024 10:36:02 +0200
Subject: [PATCH v2 3/6] riscv: Add Zawrs support for spinlocks
In-Reply-To: <ZiWCP6f6zZ3dKXfN@andrea>
References: <20240419135321.70781-8-ajones@ventanamicro.com>
 <20240419135321.70781-11-ajones@ventanamicro.com>
 <ZiWCP6f6zZ3dKXfN@andrea>
Message-ID: <20240422-97341bd5e6f69d54eeaba632@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Apr 21, 2024 at 11:16:47PM +0200, Andrea Parri wrote:
> On Fri, Apr 19, 2024 at 03:53:25PM +0200, Andrew Jones wrote:
> > From: Christoph M??llner <christoph.muellner@vrull.eu>
> > 
> > RISC-V code uses the generic ticket lock implementation, which calls
> > the macros smp_cond_load_relaxed() and smp_cond_load_acquire().
> > Introduce a RISC-V specific implementation of smp_cond_load_relaxed()
> > which applies WRS.NTO of the Zawrs extension in order to reduce power
> > consumption while waiting and allows hypervisors to enable guests to
> > trap while waiting. smp_cond_load_acquire() doesn't need a RISC-V
> > specific implementation as the generic implementation is based on
> > smp_cond_load_relaxed() and smp_acquire__after_ctrl_dep() sufficiently
> > provides the acquire semantics.
> > 
> > This implementation is heavily based on Arm's approach which is the
> > approach Andrea Parri also suggested.
> > 
> > The Zawrs specification can be found here:
> > https://github.com/riscv/riscv-zawrs/blob/main/zawrs.adoc
> > 
> > Signed-off-by: Christoph M??llner <christoph.muellner@vrull.eu>
> > Co-developed-by: Andrew Jones <ajones@ventanamicro.com>
> > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> >  arch/riscv/Kconfig                | 13 ++++++++
> >  arch/riscv/include/asm/barrier.h  | 45 ++++++++++++++++++---------
> >  arch/riscv/include/asm/cmpxchg.h  | 51 +++++++++++++++++++++++++++++++
> >  arch/riscv/include/asm/hwcap.h    |  1 +
> >  arch/riscv/include/asm/insn-def.h |  2 ++
> >  arch/riscv/kernel/cpufeature.c    |  1 +
> >  6 files changed, 98 insertions(+), 15 deletions(-)
> 
> Doesn't apply to riscv/for-next (due to, AFAIU,
> 
>   https://lore.kernel.org/all/171275883330.18495.10110341843571163280.git-patchwork-notify at kernel.org/ ).

I based it on -rc1. We recently discussed what we should base on, but
I couldn't recall the final decision, so I fell back to the old approach.
I can rebase on for-next or the latest rc if that's the new, improved
approach.

> 
> But other than that, this LGTM.  One nit below.
> 
> 
> > -#define __smp_store_release(p, v)					\
> > -do {									\
> > -	compiletime_assert_atomic_type(*p);				\
> > -	RISCV_FENCE(rw, w);						\
> > -	WRITE_ONCE(*p, v);						\
> > -} while (0)
> > -
> > -#define __smp_load_acquire(p)						\
> > -({									\
> > -	typeof(*p) ___p1 = READ_ONCE(*p);				\
> > -	compiletime_assert_atomic_type(*p);				\
> > -	RISCV_FENCE(r, rw);						\
> > -	___p1;								\
> > -})
> > -
> >  /*
> >   * This is a very specific barrier: it's currently only used in two places in
> >   * the kernel, both in the scheduler.  See include/linux/spinlock.h for the two
> > @@ -70,6 +56,35 @@ do {									\
> >   */
> >  #define smp_mb__after_spinlock()	RISCV_FENCE(iorw, iorw)
> >  
> > +#define __smp_store_release(p, v)					\
> > +do {									\
> > +	compiletime_assert_atomic_type(*p);				\
> > +	RISCV_FENCE(rw, w);						\
> > +	WRITE_ONCE(*p, v);						\
> > +} while (0)
> > +
> > +#define __smp_load_acquire(p)						\
> > +({									\
> > +	typeof(*p) ___p1 = READ_ONCE(*p);				\
> > +	compiletime_assert_atomic_type(*p);				\
> > +	RISCV_FENCE(r, rw);						\
> > +	___p1;								\
> > +})
> 
> Unrelated/unmotivated changes.

The relation/motivation was to get the load/store macros in one part of
the file with the barrier macros in another. With this change we have

 __mb
 __rmb
 __wmb

 __smp_mb
 __smp_rmb
 __smp_wmb

 smp_mb__after_spinlock

 __smp_store_release
 __smp_load_acquire
 smp_cond_load_relaxed

Without the change, smp_mb__after_spinlock is either after all the
load/stores or in between them.

I didn't think the reorganization was worth its own patch, but I could
split it out (or just drop it).

Thanks,
drew

