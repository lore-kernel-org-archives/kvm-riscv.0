From: Conor Dooley <conor@kernel.org>
Date: Thu, 09 Feb 2023 23:31:36 -0000
Subject: [PATCH v2 2/7] RISC-V: Detect AIA CSRs from ISA string
In-Reply-To: <CAK9=C2VeyJMHocZMQTZoULveAcH0kdH2vBKZYFt5kq9dMYP_Bw@mail.gmail.com>
References: <20230128072737.2995881-3-apatel@ventanamicro.com>
 <mhng-0f9bdf58-5289-4db4-8fd7-38898824c44f@palmer-ri-x1c9>
 <CAK9=C2X8C4yswGhDwe1OzQXTELXQxp8=ayiFxh1aVMk4TxeDjw@mail.gmail.com>
 <Y+KS16ZNXrDU+xun@spud>
 <CAOnJCUKKRRCrKN17ytczYXVLTcMkFaZsg6QXKjPUuSk=PqL6JQ@mail.gmail.com>
 <Y+K3FyGrNUQJZao8@spud>
 <CAK9=C2VnkK5GNO4D1AWpiNcTE=OrSueN9NAyhR7rj9csuUi4Mg@mail.gmail.com>
 <Y+OcId2PZ0pi5T08@wendy>
 <CAK9=C2VeyJMHocZMQTZoULveAcH0kdH2vBKZYFt5kq9dMYP_Bw@mail.gmail.com>
Message-ID: <Y+WCTDgtTwLB/8re@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hey all,

Just circling back to this one, since the reply from Palmer was to
another thread with a much smaller CC list.

On Wed, Feb 08, 2023 at 08:27:23PM +0530, Anup Patel wrote:
> On Wed, Feb 8, 2023 at 6:27 PM Conor Dooley <conor.dooley@microchip.com> wrote:
> > On Wed, Feb 08, 2023 at 09:24:28AM +0530, Anup Patel wrote:

> > > The presence of S*aia in ISA string only implies that AIA extended
> > > local interrupt CSRs are implemented by the underlying RISC-V
> > > implementation.
> >
> > Would you mind linking to where this is documented & explaining in your
> > commit message why it is okay operate on the basis of s*aia in the ISA
> > string only mandates the presence of the CSRs and nothing more.
> >
> > I think when I was reading it last night, I saw some commentary in this
> > vein in Section 1.6 of the rc2 spec. Although IIRC it noted changes in
> > interrupt behaviour there too, so I'm not sure if that section is what you
> > are referring to here.
> >
> > Perhaps this is all just a good argument for providing more information
> > in commit messages ;)
> 
> Sure, I am anyway going to send v3 after rebase so I will cite the
> Section 1.6 of AIA spec in the commit description.

We had a nice conversation about this on during the weekly patchwork
sync call :)
The end result of that one was "inconclusive" and the outcome appears to
be that we will wait until the entire spec is frozen before doing
anything here.
Palmer left a comment in response to another thread to that effect:
https://lore.kernel.org/linux-riscv/mhng-474f7ecd-65b8-4cfa-8b75-e51b896cc58e at palmer-ri-x1c9/

Cheers,
Conor.

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230209/39f3aed1/attachment-0001.sig>
