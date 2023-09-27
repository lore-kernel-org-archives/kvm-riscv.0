From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 27 Sep 2023 20:56:35 +0530
Subject: [PATCH v2 0/9] KVM RISC-V Conditional Operations
In-Reply-To: <mhng-ed1b5d0a-469c-43e3-a0fe-b8e498cde538@palmer-ri-x1c9>
References: <20230927-snowcap-stadium-2f6aeffac59e@spud> <mhng-ed1b5d0a-469c-43e3-a0fe-b8e498cde538@palmer-ri-x1c9>
Message-ID: <CAK9=C2Xx76i-FmTm2Qt_9PssLrLL3zUDvxOUZRyyEQZzDV7JDw@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Sep 27, 2023 at 8:31?PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Wed, 27 Sep 2023 07:45:28 PDT (-0700), Conor Dooley wrote:
> > On Wed, Sep 27, 2023 at 07:54:49PM +0530, Anup Patel wrote:
> >> On Mon, Sep 25, 2023 at 9:07?PM Conor Dooley <conor@kernel.org> wrote:
> >> >
> >> > On Mon, Sep 25, 2023 at 04:33:15PM +0100, Conor Dooley wrote:
> >> > > On Mon, Sep 25, 2023 at 07:08:50PM +0530, Anup Patel wrote:
> >> > > > This series extends KVM RISC-V to allow Guest/VM discover and use
> >> > > > conditional operations related ISA extensions (namely XVentanaCondOps
> >> > > > and Zicond).
> >> > > >
> >> > > > To try these patches, use KVMTOOL from riscv_zbx_zicntr_smstateen_condops_v1
> >> > > > branch at: https://github.com/avpatel/kvmtool.git
> >> > > >
> >> > > > These patches are based upon the latest riscv_kvm_queue and can also be
> >> > > > found in the riscv_kvm_condops_v2 branch at:
> >> > > > https://github.com/avpatel/linux.git
> >> > > >
> >> > > > Changes since v1:
> >> > > >  - Rebased the series on riscv_kvm_queue
> >> > > >  - Split PATCH1 and PATCH2 of v1 series into two patches
> >> > > >  - Added separate test configs for XVentanaCondOps and Zicond in PATCH7
> >> > > >    of v1 series.
> >> > > >
> >> > > > Anup Patel (9):
> >> > > >   dt-bindings: riscv: Add XVentanaCondOps extension entry
> >> > > >   RISC-V: Detect XVentanaCondOps from ISA string
> >> > > >   dt-bindings: riscv: Add Zicond extension entry
> >> > > >   RISC-V: Detect Zicond from ISA string
> >> > >
> >> > > For these 4:
> >> > > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> >> >
> >> > Actually, now that I think of it, I'm going to temporarily un-review this.
> >> > From patch-acceptance.rst:
> >> > | Additionally, the RISC-V specification allows implementers to create
> >> > | their own custom extensions.  These custom extensions aren't required
> >> > | to go through any review or ratification process by the RISC-V
> >> > | Foundation.  To avoid the maintenance complexity and potential
> >> > | performance impact of adding kernel code for implementor-specific
> >> > | RISC-V extensions, we'll only consider patches for extensions that either:
> >> > |
> >> > | - Have been officially frozen or ratified by the RISC-V Foundation, or
> >> > | - Have been implemented in hardware that is widely available, per standard
> >> > |   Linux practice.
> >> >
> >> > The xventanacondops bits don't qualify under the first entry, and I
> >> > don't think they qualify under the second yet. Am I wrong?
> >>
> >> The Ventana Veyron V1 was announced in Dec 2022 at RISC-V summit
> >> followed by press releases:
> >> https://www.ventanamicro.com/ventana-introduces-veyron-worlds-first-data-center-class-risc-v-cpu-product-family/
> >> https://www.embedded.com/ventana-reveals-risc-v-cpu-compute-chiplet-for-data-center/
> >> https://www.prnewswire.com/news-releases/ventana-introduces-veyron-worlds-first-data-center-class-risc-v-cpu-product-family-301700985.html
> >>
> >> @Palmer if the above looks good to you then please ack PATCH1-to-4
> >
> > These are announcements AFAICT & not an indication of "being implemented
> > in hardware that is widely available".
>
> The second two look to just be news articles quoting the first without
> any real new information, at least just from skimming them -- sorry if I
> missed something, though.
>
> The article says "SDK released with necessary software already ported to
> Veyron" and "Veyron V1 Development Platform available", but aside from
> quotes of the press release I can't find information on either of those
> (or anything VT1 related, as there were some naming ambiguities).
>
> Anup said during the call that they're still bringing up the chip and
> haven't started sampling yet, which usually means things are far from
> publicly availiable.  I thought I heard him say that these press
> releases would say the chip is sampling 2H23, but I can't find anything
> in them about sampling.
>
> Anup also said it's availiable as IP and I remember something at Hot
> Chips talking about an example place and route for a VT1, which also
> sounds very much like a chip that's not availiable yet -- usually if
> there's a chip folks are a lot more concrete about that sort of thing.
>
> So is there you can point to about this chip actually being publicly
> availiable?

The Veyron V1 chiplet samples are not available publicly at the
moment. Being available as an IP is not the same as chiplet
samples being available.

If this does not satisfy patch acceptance criteria then I will
defer/drop the XVentanaCondOps related patches for now.

Can you ack PATCH2 and PATCH3 which deals with Zicond ?

Regards,
Anup

