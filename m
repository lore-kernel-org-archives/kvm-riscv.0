From: Raghavendra Rao Ananta <rananta@google.com>
Date: Wed, 2 Aug 2023 16:31:18 -0700
Subject: [PATCH v7 06/12] arm64: tlb: Refactor the core flush algorithm of __flush_tlb_range
In-Reply-To: <875y5xqvvm.wl-maz@kernel.org>
References: <20230722022251.3446223-1-rananta@google.com> <20230722022251.3446223-7-rananta@google.com>
 <87r0otr579.wl-maz@kernel.org> <CAJHc60zqOeWXf3kh5hKL6DL3g4znmHaH-TqC0QDcBrWPsHAEXQ@mail.gmail.com>
 <875y5xqvvm.wl-maz@kernel.org>
Message-ID: <CAJHc60zujOMwGUzc=yGeioy5Vz+wzx2HkcJpF=2aLDPZ-mVMEA@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Aug 2, 2023 at 8:58?AM Marc Zyngier <maz@kernel.org> wrote:
>
> On Mon, 31 Jul 2023 18:36:47 +0100,
> Raghavendra Rao Ananta <rananta@google.com> wrote:
> >
> > On Thu, Jul 27, 2023 at 3:58?AM Marc Zyngier <maz@kernel.org> wrote:
> > >
> > > On Sat, 22 Jul 2023 03:22:45 +0100,
> > > Raghavendra Rao Ananta <rananta@google.com> wrote:
> > > >
> > > > Currently, the core TLB flush functionality of __flush_tlb_range()
> > > > hardcodes vae1is (and variants) for the flush operation. In the
> > > > upcoming patches, the KVM code reuses this core algorithm with
> > > > ipas2e1is for range based TLB invalidations based on the IPA.
> > > > Hence, extract the core flush functionality of __flush_tlb_range()
> > > > into its own macro that accepts an 'op' argument to pass any
> > > > TLBI operation, such that other callers (KVM) can benefit.
> > > >
> > > > No functional changes intended.
> > > >
> > > > Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
> > > > Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> > > > Reviewed-by: Gavin Shan <gshan@redhat.com>
> > > > Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
> > > > ---
> > > >  arch/arm64/include/asm/tlbflush.h | 109 +++++++++++++++---------------
> > > >  1 file changed, 56 insertions(+), 53 deletions(-)
> > > >
> > > > diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
> > > > index 412a3b9a3c25..f7fafba25add 100644
> > > > --- a/arch/arm64/include/asm/tlbflush.h
> > > > +++ b/arch/arm64/include/asm/tlbflush.h
> > > > @@ -278,14 +278,62 @@ static inline void flush_tlb_page(struct vm_area_struct *vma,
> > > >   */
> > > >  #define MAX_TLBI_OPS PTRS_PER_PTE
> > > >
> > > > +/* When the CPU does not support TLB range operations, flush the TLB
> > > > + * entries one by one at the granularity of 'stride'. If the TLB
> > > > + * range ops are supported, then:
> > >
> > > Comment format (the original was correct).
> > >
> > Isn't the format the same as original? Or are you referring to the
> > fact that it needs to be placed inside the macro definition?
>
> No, I'm referring to the multiline comment that starts with:
>
>         /*  When the CPU does not support TLB range operations...
>
> instead of the required:
>
>         /*
>          * When the CPU does not support TLB range operations
>
> which was correct before the coment was moved.
>
Oh I see! I'll fix it in v8.

Thanks,
Raghavendra
> Thanks,
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.

