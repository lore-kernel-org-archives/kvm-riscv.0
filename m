From: Andy Chiu <andy.chiu@sifive.com>
Date: Tue, 31 Jan 2023 20:34:00 +0800
Subject: [PATCH -next v13 14/19] riscv: signal: Report signal frame size
 to userspace via auxv
In-Reply-To: <Y9MKeqtT+PEe7KTY@spud>
References: <20230125142056.18356-1-andy.chiu@sifive.com> <20230125142056.18356-15-andy.chiu@sifive.com>
 <Y9MKeqtT+PEe7KTY@spud>
Message-ID: <CABgGipW1E3922+TM6tgWEeAsDbogrNxB1rBxFdshqjdP3oO=Mw@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jan 27, 2023 at 7:19 AM Conor Dooley <conor@kernel.org> wrote:
>
> On Wed, Jan 25, 2023 at 02:20:51PM +0000, Andy Chiu wrote:
> > diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
> > index 44d2eb381ca6..4f36c553605e 100644
> > --- a/arch/riscv/include/asm/processor.h
> > +++ b/arch/riscv/include/asm/processor.h
> > @@ -7,6 +7,7 @@
> >  #define _ASM_RISCV_PROCESSOR_H
> >
> >  #include <linux/const.h>
> > +#include <linux/cache.h>
>
> What have I missed that is the reason for adding this header?
>
__ro_after_init is defined in linux/cache.h, so we need that header.
> >  #include <vdso/processor.h>
> >
> > @@ -203,8 +205,10 @@ static size_t cal_rt_frame_size(void)
> >
> >       frame_size = sizeof(*frame);
> >
> > -     if (has_vector() && vstate_query(task_pt_regs(current)))
> > -             total_context_size += rvv_sc_size;
>
> Usual naming comment here about rvv.
Ok, changing it to riscv_v_
>
> Thanks,
> Conor.
>

