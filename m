From: Conor Dooley <conor@kernel.org>
Date: Tue, 7 Feb 2023 20:39:51 +0000
Subject: [PATCH v2 2/7] RISC-V: Detect AIA CSRs from ISA string
In-Reply-To: <CAOnJCUKKRRCrKN17ytczYXVLTcMkFaZsg6QXKjPUuSk=PqL6JQ@mail.gmail.com>
References: <20230128072737.2995881-3-apatel@ventanamicro.com>
 <mhng-0f9bdf58-5289-4db4-8fd7-38898824c44f@palmer-ri-x1c9>
 <CAK9=C2X8C4yswGhDwe1OzQXTELXQxp8=ayiFxh1aVMk4TxeDjw@mail.gmail.com>
 <Y+KS16ZNXrDU+xun@spud>
 <CAOnJCUKKRRCrKN17ytczYXVLTcMkFaZsg6QXKjPUuSk=PqL6JQ@mail.gmail.com>
Message-ID: <Y+K3FyGrNUQJZao8@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Feb 07, 2023 at 10:15:22AM -0800, Atish Patra wrote:
> On Tue, Feb 7, 2023 at 10:05 AM Conor Dooley <conor@kernel.org> wrote:
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

Right, but unless I am misunderstanding you, that is an extension for the
IOMMU spec, not for Chapter 9 of the AIA spec?

I would say that it is likely that if you have AIA and IOMMU that you'd
want to be implementing Chapter 9, but that would not appear sufficient to
draw a conclusion from.

Maybe the RVI lads that you've added (or Anup for that matter!) can
clarify if there is a requirement that if you do AIA and IOMMU that you
must do Chapter 9.
If not, my prior question about a differentiation mechanism still applies
I think!

> > I thought that would be handled by extension versions, but I am told
> > that those are not a thing any more.
> > If that's not true, and there'll be a version number that we can pull in
> > from a DT and parse which will distinguish between the two, then please
> > correct my misunderstanding here!
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230207/82dcf185/attachment-0001.sig>
