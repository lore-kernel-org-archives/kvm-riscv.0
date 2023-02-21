From: Conor Dooley <conor.dooley@microchip.com>
Date: Tue, 21 Feb 2023 11:22:45 -0000
Subject: [PATCH v2 2/7] RISC-V: Detect AIA CSRs from ISA string
In-Reply-To: <CAEg0e7i3=Zg5pxG4HCEfFkzpot5-u6yHoTSFKPBuCGU+djZ5uw@mail.gmail.com>
References: <20230128072737.2995881-3-apatel@ventanamicro.com>
 <mhng-0f9bdf58-5289-4db4-8fd7-38898824c44f@palmer-ri-x1c9>
 <CAEg0e7hrQFu+cdZy+3QO1ML9FNTPBehZwOOBnr1F-5ABYDnkGg@mail.gmail.com>
 <CAEg0e7hRjMSgYZbPTQztbQ3bGZf-r8wAfCK5ZnDXOcx27HcTCA@mail.gmail.com>
 <Y/Sfpb2c/LS0LCiA@wendy>
 <F80EBB4C-29C4-472D-B213-EFD220EF9B1F@jrtc27.com>
 <Y/SkES28TNBz02wM@wendy>
 <CAEg0e7i3=Zg5pxG4HCEfFkzpot5-u6yHoTSFKPBuCGU+djZ5uw@mail.gmail.com>
Message-ID: <Y/SpZHRdUXCiV4KT@wendy>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Feb 21, 2023 at 12:03:45PM +0100, Christoph M?llner wrote:
> On Tue, Feb 21, 2023 at 12:00 PM Conor Dooley
> <conor.dooley@microchip.com> wrote:
> >
> > On Tue, Feb 21, 2023 at 10:51:13AM +0000, Jessica Clarke wrote:
> > > On 21 Feb 2023, at 10:40, Conor Dooley <conor.dooley@microchip.com> wrote:
> > > > On Tue, Feb 21, 2023 at 08:12:58AM +0100, Christoph M?llner wrote:
> > > >> The full meeting minutes can be found here:
> > > >>  https://lists.riscv.org/g/tech-chairs/message/1381
> > > >
> > > > This link is non functional unfortunately :/
> > >
> > > tech-chairs is private, for (co-)chairs only... not sure why it went
> > > there rather than tech-privileged.
> >
> > Yah, that's what I was getting at.. This is a conversation on a public
> > ML, so it'd be annoying enough for some readers if it was gated around
> > RVI membership, but gating on membership of the inner circle makes it
> > kinda useless!
> 
> The mail was forwarded there as well (and to tech-unprivileged):
>   https://lists.riscv.org/g/tech-privileged/message/1294
>   https://lists.riscv.org/g/tech-unprivileged/message/430

Great, those I can actually read. Thanks for sharing with the unwashed!

Conor.

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230221/f0ef66d5/attachment-0001.sig>
