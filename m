From: Raghavendra Rao Ananta <rananta@google.com>
Date: Mon, 31 Jul 2023 10:36:47 -0700
Subject: [PATCH v7 06/12] arm64: tlb: Refactor the core flush algorithm of __flush_tlb_range
In-Reply-To: <87r0otr579.wl-maz@kernel.org>
References: <20230722022251.3446223-1-rananta@google.com> <20230722022251.3446223-7-rananta@google.com>
 <87r0otr579.wl-maz@kernel.org>
Message-ID: <CAJHc60zqOeWXf3kh5hKL6DL3g4znmHaH-TqC0QDcBrWPsHAEXQ@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jul 27, 2023 at 3:58?AM Marc Zyngier <maz@kernel.org> wrote:
>
> On Sat, 22 Jul 2023 03:22:45 +0100,
> Raghavendra Rao Ananta <rananta@google.com> wrote:
> >
> > Currently, the core TLB flush functionality of __flush_tlb_range()
> > hardcodes vae1is (and variants) for the flush operation. In the
> > upcoming patches, the KVM code reuses this core algorithm with
> > ipas2e1is for range based TLB invalidations based on the IPA.
> > Hence, extract the core flush functionality of __flush_tlb_range()
> > into its own macro that accepts an 'op' argument to pass any
> > TLBI operation, such that other callers (KVM) can benefit.
> >
> > No functional changes intended.
> >
> > Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
> > Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> > Reviewed-by: Gavin Shan <gshan@redhat.com>
> > Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
> > ---
> >  arch/arm64/include/asm/tlbflush.h | 109 +++++++++++++++---------------
> >  1 file changed, 56 insertions(+), 53 deletions(-)
> >
> > diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
> > index 412a3b9a3c25..f7fafba25add 100644
> > --- a/arch/arm64/include/asm/tlbflush.h
> > +++ b/arch/arm64/include/asm/tlbflush.h
> > @@ -278,14 +278,62 @@ static inline void flush_tlb_page(struct vm_area_struct *vma,
> >   */
> >  #define MAX_TLBI_OPS PTRS_PER_PTE
> >
> > +/* When the CPU does not support TLB range operations, flush the TLB
> > + * entries one by one at the granularity of 'stride'. If the TLB
> > + * range ops are supported, then:
>
> Comment format (the original was correct).
>
Isn't the format the same as original? Or are you referring to the
fact that it needs to be placed inside the macro definition?
> > + *
> > + * 1. If 'pages' is odd, flush the first page through non-range
> > + *    operations;
> > + *
> > + * 2. For remaining pages: the minimum range granularity is decided
> > + *    by 'scale', so multiple range TLBI operations may be required.
> > + *    Start from scale = 0, flush the corresponding number of pages
> > + *    ((num+1)*2^(5*scale+1) starting from 'addr'), then increase it
> > + *    until no pages left.
> > + *
> > + * Note that certain ranges can be represented by either num = 31 and
> > + * scale or num = 0 and scale + 1. The loop below favours the latter
> > + * since num is limited to 30 by the __TLBI_RANGE_NUM() macro.
> > + */
> > +#define __flush_tlb_range_op(op, start, pages, stride,                       \
> > +                             asid, tlb_level, tlbi_user)             \
>
> If you make this a common macro, please document the parameters, and
> what the constraints are. For example, what does tlbi_user mean for an
> IPA invalidation?
>
Sure, I'll document the parameters. That'll be helpful.

- Raghavendra
>         M.
>
> --
> Without deviation from the norm, progress is not possible.

