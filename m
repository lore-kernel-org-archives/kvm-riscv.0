From: Christoph Müllner <christoph.muellner@vrull.eu>
Date: Tue, 21 Feb 2023 08:12:58 +0100
Subject: [PATCH v2 2/7] RISC-V: Detect AIA CSRs from ISA string
In-Reply-To: <CAEg0e7hrQFu+cdZy+3QO1ML9FNTPBehZwOOBnr1F-5ABYDnkGg@mail.gmail.com>
References: <20230128072737.2995881-3-apatel@ventanamicro.com>
 <mhng-0f9bdf58-5289-4db4-8fd7-38898824c44f@palmer-ri-x1c9> <CAEg0e7hrQFu+cdZy+3QO1ML9FNTPBehZwOOBnr1F-5ABYDnkGg@mail.gmail.com>
Message-ID: <CAEg0e7hRjMSgYZbPTQztbQ3bGZf-r8wAfCK5ZnDXOcx27HcTCA@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi all,

The RISC-V Architectural Review Committee has discussed the concerns
regarding the non-ratified chapters in the AIA specification.

Here is the relevant quote from the meeting minutes:
"""
Although the Advanced Interrupt Architecture (AIA) has already passed
Architecture Review (with a minor edit still pending), the committee
has some suggestions about its final steps to ratification, to avoid
the AIA document having a mixture of ratified and non-ratified content:

- The AIA document's remaining draft chapter on the Duo-PLIC, which is
  not currently on a path to ratification, can be removed to a separate
  document.

- Ratification of the full AIA (without Duo-PLIC) can be postponed to
  coincide with ratification of the IOMMU specification, given that
  the latter is now expected in a reasonable time, and the AIA's last
  chapter concerning IOMMUs is already scheduled to go through public
  review and be ratified only together with the IOMMU specification.
"""

The full meeting minutes can be found here:
  https://lists.riscv.org/g/tech-chairs/message/1381

BR
Christoph

On Wed, Feb 15, 2023 at 4:41 PM Christoph M?llner
<christoph.muellner@vrull.eu> wrote:
>
> On Fri, Feb 3, 2023 at 1:25 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
> >
> > On Fri, 27 Jan 2023 23:27:32 PST (-0800), apatel at ventanamicro.com wrote:
> > > We have two extension names for AIA ISA support: Smaia (M-mode AIA CSRs)
> > > and Ssaia (S-mode AIA CSRs).
> >
> > This has pretty much the same problem that we had with the other
> > AIA-related ISA string patches, where there's that ambiguity with the
> > non-ratified chapters.  IIRC when this came up in GCC the rough idea was
> > to try and document that we're going to interpret the standard ISA
> > strings that way, but now that we're doing custom ISA extensions it
> > seems saner to just define on here that removes the ambiguity.
>
>
> To avoid the impression that I did not work on that, here is the v2
> from November,
> that attempts to document this:
>   https://gcc.gnu.org/pipermail/gcc-patches/2022-November/607326.html
>
> My proposed text was:
> +Note, that AIA support (@samp{Smaia} and @samp{Ssaia}) is based on an AIA
> +specification, which is frozen but contains draft chapters ("Duo-PLIC" and
> +"IOMMU Support").
>
> Btw, I did not get any feedback on that patch.
>
> I also tried to address this on spec level (the PR has been linked) and raised
> that to tech-aia (the conversation has been linked).
>
> Another thing that I want to highlight, since it was discussed a lot recently
> (e.g. just a few minutes ago in tech-chairs).
> There is a chance of a last-minute spec change of AIA:
>   https://github.com/riscv/riscv-aia/pull/37
>
> BR
> Christoph
>
>
>
> >
> >
> > I just sent
> > <https://lore.kernel.org/r/20230203001201.14770-1-palmer@rivosinc.com/>
> > which documents that.
> >
> > > We extend the ISA string parsing to detect Smaia and Ssaia extensions.
> > >
> > > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> > > ---
> > >  arch/riscv/include/asm/hwcap.h | 2 ++
> > >  arch/riscv/kernel/cpu.c        | 2 ++
> > >  arch/riscv/kernel/cpufeature.c | 2 ++
> > >  3 files changed, 6 insertions(+)
> > >
> > > diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> > > index 86328e3acb02..341ef30a3718 100644
> > > --- a/arch/riscv/include/asm/hwcap.h
> > > +++ b/arch/riscv/include/asm/hwcap.h
> > > @@ -59,6 +59,8 @@ enum riscv_isa_ext_id {
> > >       RISCV_ISA_EXT_ZIHINTPAUSE,
> > >       RISCV_ISA_EXT_SSTC,
> > >       RISCV_ISA_EXT_SVINVAL,
> > > +     RISCV_ISA_EXT_SMAIA,
> > > +     RISCV_ISA_EXT_SSAIA,
> > >       RISCV_ISA_EXT_ID_MAX
> > >  };
> > >  static_assert(RISCV_ISA_EXT_ID_MAX <= RISCV_ISA_EXT_MAX);
> > > diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> > > index 1b9a5a66e55a..a215ec929160 100644
> > > --- a/arch/riscv/kernel/cpu.c
> > > +++ b/arch/riscv/kernel/cpu.c
> > > @@ -162,6 +162,8 @@ arch_initcall(riscv_cpuinfo_init);
> > >   *    extensions by an underscore.
> > >   */
> > >  static struct riscv_isa_ext_data isa_ext_arr[] = {
> > > +     __RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
> > > +     __RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
> >
> > This will conflict with that ISA string refactoring I just merged.  It
> > should be a pretty mechanical merge conflict, but if you want we can do
> > a shared tag with the first few patches and I can handle the merge
> > conflict locally.
> >
> > >       __RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
> > >       __RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
> > >       __RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
> > > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > > index 93e45560af30..3c5b51f519d5 100644
> > > --- a/arch/riscv/kernel/cpufeature.c
> > > +++ b/arch/riscv/kernel/cpufeature.c
> > > @@ -228,6 +228,8 @@ void __init riscv_fill_hwcap(void)
> > >                               SET_ISA_EXT_MAP("zihintpause", RISCV_ISA_EXT_ZIHINTPAUSE);
> > >                               SET_ISA_EXT_MAP("sstc", RISCV_ISA_EXT_SSTC);
> > >                               SET_ISA_EXT_MAP("svinval", RISCV_ISA_EXT_SVINVAL);
> > > +                             SET_ISA_EXT_MAP("smaia", RISCV_ISA_EXT_SMAIA);
> > > +                             SET_ISA_EXT_MAP("ssaia", RISCV_ISA_EXT_SSAIA);
> > >                       }
> > >  #undef SET_ISA_EXT_MAP
> > >               }
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv

