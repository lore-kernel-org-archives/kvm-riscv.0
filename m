From: Conor Dooley <conor.dooley@microchip.com>
Date: Fri, 21 Jun 2024 11:11:56 +0100
Subject: [PATCH v5 2/4] dt-bindings: riscv: Add Svade and Svadu Entries
In-Reply-To: <20240621-10d503a9a2e7d54e67db102c@orel>
References: <20240605121512.32083-1-yongxuan.wang@sifive.com>
 <20240605121512.32083-3-yongxuan.wang@sifive.com>
 <20240605-atrium-neuron-c2512b34d3da@spud>
 <CAK9=C2XH7-RdVpojX8GNW-WFTyChW=sTOWs8_kHgsjiFYwzg+g@mail.gmail.com>
 <20240621-10d503a9a2e7d54e67db102c@orel>
Message-ID: <20240621-flanking-twiddling-c3b6c9108438@wendy>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jun 21, 2024 at 10:33:03AM +0200, Andrew Jones wrote:
> On Thu, Jun 20, 2024 at 11:55:44AM GMT, Anup Patel wrote:
> > On Wed, Jun 5, 2024 at 10:25?PM Conor Dooley <conor@kernel.org> wrote:
> > >
> > > On Wed, Jun 05, 2024 at 08:15:08PM +0800, Yong-Xuan Wang wrote:
> > > > Add entries for the Svade and Svadu extensions to the riscv,isa-extensions
> > > > property.
> > > >
> > > > Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
> > > > ---
> > > >  .../devicetree/bindings/riscv/extensions.yaml | 30 +++++++++++++++++++
> > > >  1 file changed, 30 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > > > index 468c646247aa..1e30988826b9 100644
> > > > --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> > > > +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > > > @@ -153,6 +153,36 @@ properties:
> > > >              ratified at commit 3f9ed34 ("Add ability to manually trigger
> > > >              workflow. (#2)") of riscv-time-compare.
> > > >
> > > > +        - const: svade
> > > > +          description: |
> > > > +            The standard Svade supervisor-level extension for raising page-fault
> > > > +            exceptions when PTE A/D bits need be set as ratified in the 20240213
> > > > +            version of the privileged ISA specification.
> > > > +
> > > > +            Both Svade and Svadu extensions control the hardware behavior when
> > > > +            the PTE A/D bits need to be set. The default behavior for the four
> > > > +            possible combinations of these extensions in the device tree are:
> > > > +            1. Neither svade nor svadu in DT: default to svade.
> > >
> > > I think this needs to be expanded on, as to why nothing means svade.
> > 
> > Actually if both Svade and Svadu are not present in DT then
> > it is left to the platform and OpenSBI does nothing.
> 
> This is a good point, and maybe it's worth integrating something that
> states this case is technically unknown into the final text. (Even though
> historically this has been assumed to mean svade.)

If that is assumed to mean svade at the moment, then that's what it has
to mean going forwards also.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20240621/98f05f12/attachment.sig>
