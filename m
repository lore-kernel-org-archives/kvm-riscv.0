From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 5 Jun 2023 19:36:52 +0530
Subject: [PATCH kvmtool 1/8] Sync-up headers with Linux-6.4-rc1
In-Reply-To: <20230605134938.GA21212@willie-the-truck>
References: <20230510083748.1056704-1-apatel@ventanamicro.com>
 <20230510083748.1056704-2-apatel@ventanamicro.com> <20230605121221.GA20843@willie-the-truck>
 <CAK9=C2WfNSsW-OODnNVrrxq9YvxBqjT94tWp81pBiKj5e-jjVQ@mail.gmail.com> <20230605134938.GA21212@willie-the-truck>
Message-ID: <CAK9=C2VtB+usAivCiQFi37y=aRxwJpFRwSKk7Z=f1tY4LV4d+g@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jun 5, 2023 at 7:19?PM Will Deacon <will@kernel.org> wrote:
>
> On Mon, Jun 05, 2023 at 07:04:27PM +0530, Anup Patel wrote:
> > On Mon, Jun 5, 2023 at 5:42?PM Will Deacon <will@kernel.org> wrote:
> > > On Wed, May 10, 2023 at 02:07:41PM +0530, Anup Patel wrote:
> > > > We sync-up Linux headers to get latest KVM RISC-V headers having
> > > > SBI extension enable/disable, Zbb, Zicboz, and Ssaia support.
> > > >
> > > > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > > > ---
> > > >  arm/aarch64/include/asm/kvm.h |  38 ++++++++++++
> > > >  include/linux/kvm.h           |  57 +++++++++++-------
> > > >  include/linux/virtio_blk.h    | 105 ++++++++++++++++++++++++++++++++++
> > > >  include/linux/virtio_config.h |   6 ++
> > > >  include/linux/virtio_net.h    |   5 ++
> > > >  riscv/include/asm/kvm.h       |  56 +++++++++++++++++-
> > > >  x86/include/asm/kvm.h         |  50 ++++++++++++----
> > > >  7 files changed, 286 insertions(+), 31 deletions(-)
> > >
> > > This breaks the build for x86:
> > >
> > > Makefile:386: Skipping optional libraries: vncserver SDL
> > >   CC       builtin-balloon.o
> > > In file included from include/linux/kvm.h:15,
> > >                  from include/kvm/pci.h:5,
> > >                  from include/kvm/vfio.h:6,
> > >                  from include/kvm/kvm-config.h:5,
> > >                  from include/kvm/kvm.h:6,
> > >                  from builtin-balloon.c:9:
> > > x86/include/asm/kvm.h:511:17: error: expected specifier-qualifier-list before ?__DECLARE_FLEX_ARRAY?
> > >   511 |                 __DECLARE_FLEX_ARRAY(struct kvm_vmx_nested_state_data, vmx);
> > >       |                 ^~~~~~~~~~~~~~~~~~~~
> > > make: *** [Makefile:508: builtin-balloon.o] Error 1
> >
> > It seems __DECLARE_FLEX_ARRAY() is not defined in
> > include/linux/stddef.h header of KVMTOOL.
> >
> > I will send v2 series with this fixed.
>
> Alternatively, you could take a look at the series from Oliver which
> also pulls in the -rc1 headers (I've not had chance to test it out yet,
> though).
>
> https://lore.kernel.org/r/20230526221712.317287-1-oliver.upton at linux.dev


I did not try this series but I think we will get x86 compile error with this
series as well because this series does not add __DECLARE_FLEX_ARRAY()
define.

Regards,
Anup

>
> Will

