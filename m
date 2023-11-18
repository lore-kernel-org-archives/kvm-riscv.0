From: Anup Patel <apatel@ventanamicro.com>
Date: Sat, 18 Nov 2023 19:22:20 +0530
Subject: [kvmtool PATCH v2 0/6] RISC-V AIA irqchip and Svnapot support
In-Reply-To: <20231107111142.GA19291@willie-the-truck>
References: <20230918125730.1371985-1-apatel@ventanamicro.com>
 <CAK9=C2Vvu=kcR5CtzSFFh4DFvqxMsLrLNAHpMxoxrCf8nUixbw@mail.gmail.com> <20231107111142.GA19291@willie-the-truck>
Message-ID: <CAK9=C2VRNyzfOok8rx-BXujDvD9yqKdkwLcDJWzOzEZ1aAWhyw@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Nov 7, 2023 at 4:41?PM Will Deacon <will@kernel.org> wrote:
>
> On Thu, Oct 12, 2023 at 09:50:29AM +0530, Anup Patel wrote:
> > On Mon, Sep 18, 2023 at 6:27?PM Anup Patel <apatel@ventanamicro.com> wrote:
> > >
> > > The latest KVM in Linux-6.5 has support for:
> > > 1) Svnapot ISA extension support
> > > 2) AIA in-kernel irqchip support
> > >
> > > This series adds corresponding changes in KVMTOOL to use the above
> > > mentioned features for Guest/VM.
> > >
> > > These patches can also be found in the riscv_aia_v2 branch at:
> > > https://github.com/avpatel/kvmtool.git
> > >
> > > Changes since v1:
> > >  - Rebased on commit 9cb1b46cb765972326a46bdba867d441a842af56
> > >  - Updated PATCH1 to sync header with released Linux-6.5
> > >
> > > Anup Patel (6):
> > >   Sync-up header with Linux-6.5 for KVM RISC-V
> > >   riscv: Add Svnapot extension support
> > >   riscv: Make irqchip support pluggable
> > >   riscv: Add IRQFD support for in-kernel AIA irqchip
> > >   riscv: Use AIA in-kernel irqchip whenever KVM RISC-V supports
> > >   riscv: Fix guest/init linkage for multilib toolchain
> >
> > Friendly ping ?
>
> There are a bunch of open review comments from Drew that need to be
> addressed in a subsequent version.

I have sent-out v3 with Drew's comments addressed.

Thanks,
Anup

