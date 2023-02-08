From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 8 Feb 2023 08:36:22 +0530
Subject: [PATCH v2 2/7] RISC-V: Detect AIA CSRs from ISA string
In-Reply-To: <CAOnJCUKKRRCrKN17ytczYXVLTcMkFaZsg6QXKjPUuSk=PqL6JQ@mail.gmail.com>
References: <20230128072737.2995881-3-apatel@ventanamicro.com>
 <mhng-0f9bdf58-5289-4db4-8fd7-38898824c44f@palmer-ri-x1c9>
 <CAK9=C2X8C4yswGhDwe1OzQXTELXQxp8=ayiFxh1aVMk4TxeDjw@mail.gmail.com>
 <Y+KS16ZNXrDU+xun@spud> <CAOnJCUKKRRCrKN17ytczYXVLTcMkFaZsg6QXKjPUuSk=PqL6JQ@mail.gmail.com>
Message-ID: <CAK9=C2XAaB0GXh1tO060dWxZR2pSAVJhejUaa+W=Q+9nk_gYKA@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Feb 7, 2023 at 11:45 PM Atish Patra <atishp@atishpatra.org> wrote:
>
> On Tue, Feb 7, 2023 at 10:05 AM Conor Dooley <conor@kernel.org> wrote:
> >
> > Hey Anup, Palmer,
> >
> > On Fri, Feb 03, 2023 at 05:31:01PM +0530, Anup Patel wrote:
> > > On Fri, Feb 3, 2023 at 5:54 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
> > > >
> > > > On Fri, 27 Jan 2023 23:27:32 PST (-0800), apatel at ventanamicro.com wrote:
> > > > > We have two extension names for AIA ISA support: Smaia (M-mode AIA CSRs)
> > > > > and Ssaia (S-mode AIA CSRs).
> > > >
> > > > This has pretty much the same problem that we had with the other
> > > > AIA-related ISA string patches, where there's that ambiguity with the
> > > > non-ratified chapters.  IIRC when this came up in GCC the rough idea was
> > > > to try and document that we're going to interpret the standard ISA
> > > > strings that way, but now that we're doing custom ISA extensions it
> > > > seems saner to just define on here that removes the ambiguity.
> > > >
> > > > I just sent
> > > > <https://lore.kernel.org/r/20230203001201.14770-1-palmer@rivosinc.com/>
> > > > which documents that.
> > >
> > > I am not sure why you say that these are custom extensions.
> > >
> > > Multiple folks have clarified that both Smaia and Ssaia are frozen
> > > ISA extensions as-per RVI process. The individual chapters which
> > > are in the draft state have nothing to do with Smaia and Ssaia CSRs.
> > >
> > > Please refer:
> > > https://github.com/riscv/riscv-aia/pull/36
> > > https://lists.riscv.org/g/tech-aia/message/336
> > > https://lists.riscv.org/g/tech-aia/message/337
> >
> > All of these links seem to discuss the draft chapters somehow being
> > incompatible with the non-draft ones. I would very expect that that,
> > as pointed out in several places there, that the draft chapters
> > finalisation would not lead to meaningful (and incompatible!) changes
> > being made to the non-draft chapters.
> >
>
> Here is the status of all RVI specs. It states that the Smaia, Ssaia
> extensions are frozen (i.e. public review complete).
> https://wiki.riscv.org/display/HOME/Specification+Status
>
> I have added stephano/Jeff to confirm the same.
>
> AFAIK, IOMMU spec is close to the public review phase and should be
> frozen in this or next quarter.
> IIRC, this chapter in AIA will be frozen along with IOMMU spec.
>
> Anup: Please correct me if that's not correct.

Yes, that's correct.

>
> > Maybe yourself and Palmer are looking at this from different
> > perspectives? Looking at his patch from Friday:
> > https://lore.kernel.org/linux-riscv/20230203001201.14770-1-palmer at rivosinc.com/
> > He specifically mentioned this aspect, as opposed to the aspect that
> > your links refer to.
> >
> > Surely a duo-plic, if that ever comes to be, could be detected from
> > compatible strings in DT or w/e - but how do you intend differentiating
> > between an implementation of S*aia that contains the IOMMU support in
> > Chapter 9 in a finalised form, versus an implementation that may make
> > "different decisions" when it comes to that chapter of the spec?
>
> We will most likely have an extension specific to iommu spec as well.
>
> > I thought that would be handled by extension versions, but I am told
> > that those are not a thing any more.
> > If that's not true, and there'll be a version number that we can pull in
> > from a DT and parse which will distinguish between the two, then please
> > correct my misunderstanding here!
> >
> > Thanks,
> > Conor.
> >
> > > > > We extend the ISA string parsing to detect Smaia and Ssaia extensions.
> > > > >
> > > > > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > > > > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> > > > > ---
> > > > >  arch/riscv/include/asm/hwcap.h | 2 ++
> > > > >  arch/riscv/kernel/cpu.c        | 2 ++
> > > > >  arch/riscv/kernel/cpufeature.c | 2 ++
> > > > >  3 files changed, 6 insertions(+)
> > > > >
> > > > > diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> > > > > index 86328e3acb02..341ef30a3718 100644
> > > > > --- a/arch/riscv/include/asm/hwcap.h
> > > > > +++ b/arch/riscv/include/asm/hwcap.h
> > > > > @@ -59,6 +59,8 @@ enum riscv_isa_ext_id {
> > > > >       RISCV_ISA_EXT_ZIHINTPAUSE,
> > > > >       RISCV_ISA_EXT_SSTC,
> > > > >       RISCV_ISA_EXT_SVINVAL,
> > > > > +     RISCV_ISA_EXT_SMAIA,
> > > > > +     RISCV_ISA_EXT_SSAIA,
> > > > >       RISCV_ISA_EXT_ID_MAX
> > > > >  };
> > > > >  static_assert(RISCV_ISA_EXT_ID_MAX <= RISCV_ISA_EXT_MAX);
> > > > > diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> > > > > index 1b9a5a66e55a..a215ec929160 100644
> > > > > --- a/arch/riscv/kernel/cpu.c
> > > > > +++ b/arch/riscv/kernel/cpu.c
> > > > > @@ -162,6 +162,8 @@ arch_initcall(riscv_cpuinfo_init);
> > > > >   *    extensions by an underscore.
> > > > >   */
> > > > >  static struct riscv_isa_ext_data isa_ext_arr[] = {
> > > > > +     __RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
> > > > > +     __RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
> > > >
> > > > This will conflict with that ISA string refactoring I just merged.  It
> > > > should be a pretty mechanical merge conflict, but if you want we can do
> > > > a shared tag with the first few patches and I can handle the merge
> > > > conflict locally.
> > >
> > > I am planning to send this series as a second PR for Linux-6.3 after your
> > > PR (which includes ISA string refactoring) is merged. Is that okay with you?
> > >
> > > With that said, it would request you to ACK this patch as well.
> > >
> > > >
> > > > >       __RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
> > > > >       __RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
> > > > >       __RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
> > > > > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > > > > index 93e45560af30..3c5b51f519d5 100644
> > > > > --- a/arch/riscv/kernel/cpufeature.c
> > > > > +++ b/arch/riscv/kernel/cpufeature.c
> > > > > @@ -228,6 +228,8 @@ void __init riscv_fill_hwcap(void)
> > > > >                               SET_ISA_EXT_MAP("zihintpause", RISCV_ISA_EXT_ZIHINTPAUSE);
> > > > >                               SET_ISA_EXT_MAP("sstc", RISCV_ISA_EXT_SSTC);
> > > > >                               SET_ISA_EXT_MAP("svinval", RISCV_ISA_EXT_SVINVAL);
> > > > > +                             SET_ISA_EXT_MAP("smaia", RISCV_ISA_EXT_SMAIA);
> > > > > +                             SET_ISA_EXT_MAP("ssaia", RISCV_ISA_EXT_SSAIA);
> > > > >                       }
> > > > >  #undef SET_ISA_EXT_MAP
> > > > >               }
> > >
> > > Thanks,
> > > Anup
>
>
>
> --
> Regards,
> Atish

Regards,
Anup

