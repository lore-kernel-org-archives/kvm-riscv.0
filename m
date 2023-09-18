From: Will Deacon <will@kernel.org>
Date: Mon, 18 Sep 2023 12:16:09 +0100
Subject: [kvmtool PATCH 0/6] RISC-V AIA irqchip and Svnapot support
In-Reply-To: <CAK9=C2WkkEpA3YM99HMNRk743mkhk2FDEpV_ffG3UWH9Vy3YkA@mail.gmail.com>
References: <20230725152430.3351564-1-apatel@ventanamicro.com>
 <CAK9=C2WkkEpA3YM99HMNRk743mkhk2FDEpV_ffG3UWH9Vy3YkA@mail.gmail.com>
Message-ID: <20230918111609.GB18214@willie-the-truck>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Sep 14, 2023 at 10:26:34PM +0530, Anup Patel wrote:
> On Tue, Jul 25, 2023 at 8:54?PM Anup Patel <apatel@ventanamicro.com> wrote:
> >
> > The latest KVM in Linux-6.5 has support for:
> > 1) Svnapot ISA extension support
> > 2) AIA in-kernel irqchip support
> >
> > This series adds corresponding changes in KVMTOOL to use the above
> > mentioned features for Guest/VM.
> >
> > These patches can also be found in the riscv_aia_v1 branch at:
> > https://github.com/avpatel/kvmtool.git
> >
> > Anup Patel (6):
> >   Sync-up header with Linux-6.5-rc3 for KVM RISC-V
> >   riscv: Add Svnapot extension support
> >   riscv: Make irqchip support pluggable
> >   riscv: Add IRQFD support for in-kernel AIA irqchip
> >   riscv: Use AIA in-kernel irqchip whenever KVM RISC-V supports
> >   riscv: Fix guest/init linkage for multilib toolchain
> 
> Friendly ping ?

It all looks pretty self-contained, but please send another version
importing the headers for v6.5 now that it has been released.

Cheers,

Will

