From: Anup Patel <anup@brainfault.org>
Date: Fri, 31 Mar 2023 18:23:11 +0530
Subject: [PATCH v2 2/7] RISC-V: Detect AIA CSRs from ISA string
In-Reply-To: <mhng-0f9bdf58-5289-4db4-8fd7-38898824c44f@palmer-ri-x1c9>
References: <20230128072737.2995881-3-apatel@ventanamicro.com> <mhng-0f9bdf58-5289-4db4-8fd7-38898824c44f@palmer-ri-x1c9>
Message-ID: <CAAhSdy3vPQw1OcRx3kQwt8UHgKa+18Ut-SzZkb8gQTHDRK7e2w@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Palmer

On Fri, Feb 3, 2023 at 5:54?AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Fri, 27 Jan 2023 23:27:32 PST (-0800), apatel at ventanamicro.com wrote:
> > We have two extension names for AIA ISA support: Smaia (M-mode AIA CSRs)
> > and Ssaia (S-mode AIA CSRs).
>
> This has pretty much the same problem that we had with the other
> AIA-related ISA string patches, where there's that ambiguity with the
> non-ratified chapters.  IIRC when this came up in GCC the rough idea was
> to try and document that we're going to interpret the standard ISA
> strings that way, but now that we're doing custom ISA extensions it
> seems saner to just define on here that removes the ambiguity.
>
> I just sent
> <https://lore.kernel.org/r/20230203001201.14770-1-palmer@rivosinc.com/>
> which documents that.

The IOMMU and AIA chapter8 are frozen and in public review.
Refer, https://lists.riscv.org/g/tech-aia/message/346

This means the entire AIA specification is now frozen (i.e. no
chapters in draft state).

I will rebase this series and send-out v3. It would be great if you
can ACK the PATCH2 of this series.

Thanks,
Anup

>
> > We extend the ISA string parsing to detect Smaia and Ssaia extensions.
> >
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> >  arch/riscv/include/asm/hwcap.h | 2 ++
> >  arch/riscv/kernel/cpu.c        | 2 ++
> >  arch/riscv/kernel/cpufeature.c | 2 ++
> >  3 files changed, 6 insertions(+)
> >
> > diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> > index 86328e3acb02..341ef30a3718 100644
> > --- a/arch/riscv/include/asm/hwcap.h
> > +++ b/arch/riscv/include/asm/hwcap.h
> > @@ -59,6 +59,8 @@ enum riscv_isa_ext_id {
> >       RISCV_ISA_EXT_ZIHINTPAUSE,
> >       RISCV_ISA_EXT_SSTC,
> >       RISCV_ISA_EXT_SVINVAL,
> > +     RISCV_ISA_EXT_SMAIA,
> > +     RISCV_ISA_EXT_SSAIA,
> >       RISCV_ISA_EXT_ID_MAX
> >  };
> >  static_assert(RISCV_ISA_EXT_ID_MAX <= RISCV_ISA_EXT_MAX);
> > diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> > index 1b9a5a66e55a..a215ec929160 100644
> > --- a/arch/riscv/kernel/cpu.c
> > +++ b/arch/riscv/kernel/cpu.c
> > @@ -162,6 +162,8 @@ arch_initcall(riscv_cpuinfo_init);
> >   *    extensions by an underscore.
> >   */
> >  static struct riscv_isa_ext_data isa_ext_arr[] = {
> > +     __RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
> > +     __RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
>
> This will conflict with that ISA string refactoring I just merged.  It
> should be a pretty mechanical merge conflict, but if you want we can do
> a shared tag with the first few patches and I can handle the merge
> conflict locally.
>
> >       __RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
> >       __RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
> >       __RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > index 93e45560af30..3c5b51f519d5 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -228,6 +228,8 @@ void __init riscv_fill_hwcap(void)
> >                               SET_ISA_EXT_MAP("zihintpause", RISCV_ISA_EXT_ZIHINTPAUSE);
> >                               SET_ISA_EXT_MAP("sstc", RISCV_ISA_EXT_SSTC);
> >                               SET_ISA_EXT_MAP("svinval", RISCV_ISA_EXT_SVINVAL);
> > +                             SET_ISA_EXT_MAP("smaia", RISCV_ISA_EXT_SMAIA);
> > +                             SET_ISA_EXT_MAP("ssaia", RISCV_ISA_EXT_SSAIA);
> >                       }
> >  #undef SET_ISA_EXT_MAP
> >               }

