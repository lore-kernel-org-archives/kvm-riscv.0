From: Anup Patel <anup@brainfault.org>
Date: Mon, 13 Dec 2021 09:42:18 +0530
Subject: [PATCH v11 kvmtool 0/8] KVMTOOL RISC-V Support
In-Reply-To: <87sfuz9q8p.wl-maz@kernel.org>
References: <20211119124515.89439-1-anup.patel@wdc.com>
 <CAAhSdy1pqS5PYdxuxx5RD8baeqfd07Vm1DM7_Eq9Mby37mS_ig@mail.gmail.com>
 <87sfuz9q8p.wl-maz@kernel.org>
Message-ID: <CAAhSdy1Lnbe8VhnFW2nhnCzs_74PzuAeyaADvnMfo7iY0qhxsQ@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Dec 11, 2021 at 7:51 PM Marc Zyngier <maz@kernel.org> wrote:
>
> On Sat, 11 Dec 2021 07:28:49 +0000,
> Anup Patel <anup@brainfault.org> wrote:
> >
> > Hi Marc, Hi Will,
> >
> > On Fri, Nov 19, 2021 at 6:15 PM Anup Patel <anup.patel@wdc.com> wrote:
> > >
> > > This series adds RISC-V support for KVMTOOL and it is based on the
> > > Linux-5.16-rc1. The KVM RISC-V patches have been merged in the Linux
> > > kernel since 5.16-rc1.
> > >
> > > The KVMTOOL RISC-V patches can be found in riscv_master branch at:
> > > https//github.com/kvm-riscv/kvmtool.git
> >
> > Ping ?
> > Do you have further comments on this series ?
>
> Not much on my side, apart that it is a bit annoying that some of the
> support is actually an almost exact copy of the arm code (PCI being a
> striking example). It would have been nice to see some effort to make
> the code common, although it isn't a blocker on my side.

Thanks Marc.

I agree with you. The code sharing between ARM and RISC-V support
needs to be improved. We have more stuff to be added after this series
so I will prioritize code sharing.

Regards,
Anup


>
> Thanks,
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.

