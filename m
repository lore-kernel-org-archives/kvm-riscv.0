From: Conor Dooley <conor@kernel.org>
Date: Wed, 19 Jun 2024 19:11:16 +0100
Subject: [PATCH v5 2/4] dt-bindings: riscv: Add Svade and Svadu Entries
In-Reply-To: <CAMWQL2gQpHPD=bPenjD+=NP47k8n26+6KP05zogxUtsD6zY6GQ@mail.gmail.com>
References: <20240605121512.32083-1-yongxuan.wang@sifive.com>
 <20240605121512.32083-3-yongxuan.wang@sifive.com>
 <20240605-atrium-neuron-c2512b34d3da@spud>
 <CAMWQL2gQpHPD=bPenjD+=NP47k8n26+6KP05zogxUtsD6zY6GQ@mail.gmail.com>
Message-ID: <20240619-shabby-smother-c482e771632a@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Anup, Drew, Alex,

On Tue, Jun 18, 2024 at 06:38:13PM +0800, Yong-Xuan Wang wrote:
> On Thu, Jun 6, 2024 at 12:55?AM Conor Dooley <conor@kernel.org> wrote:
> >
> > On Wed, Jun 05, 2024 at 08:15:08PM +0800, Yong-Xuan Wang wrote:
> > > Add entries for the Svade and Svadu extensions to the riscv,isa-extensions
> > > property.
> > >
> > > Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
> > > ---
> > >  .../devicetree/bindings/riscv/extensions.yaml | 30 +++++++++++++++++++
> > >  1 file changed, 30 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > > index 468c646247aa..1e30988826b9 100644
> > > --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> > > +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > > @@ -153,6 +153,36 @@ properties:
> > >              ratified at commit 3f9ed34 ("Add ability to manually trigger
> > >              workflow. (#2)") of riscv-time-compare.
> > >
> > > +        - const: svade
> > > +          description: |
> > > +            The standard Svade supervisor-level extension for raising page-fault
> > > +            exceptions when PTE A/D bits need be set as ratified in the 20240213
> > > +            version of the privileged ISA specification.
> > > +
> > > +            Both Svade and Svadu extensions control the hardware behavior when
> > > +            the PTE A/D bits need to be set. The default behavior for the four
> > > +            possible combinations of these extensions in the device tree are:
> > > +            1. Neither svade nor svadu in DT: default to svade.
> >
> > I think this needs to be expanded on, as to why nothing means svade.
> >
> > > +            2. Only svade in DT: use svade.
> >
> > That's a statement of the obvious, right?
> >
> > > +            3. Only svadu in DT: use svadu.
> >
> > This is not relevant for Svade.
> >
> > > +            4. Both svade and svadu in DT: default to svade (Linux can switch to
> > > +               svadu once the SBI FWFT extension is available).
> >
> > "The privilege level to which this devicetree has been provided can switch to
> > Svadu if the SBI FWFT extension is available".
> >
> > > +        - const: svadu
> > > +          description: |
> > > +            The standard Svadu supervisor-level extension for hardware updating
> > > +            of PTE A/D bits as ratified at commit c1abccf ("Merge pull request
> > > +            #25 from ved-rivos/ratified") of riscv-svadu.
> > > +
> > > +            Both Svade and Svadu extensions control the hardware behavior when
> > > +            the PTE A/D bits need to be set. The default behavior for the four
> > > +            possible combinations of these extensions in the device tree are:
> >
> > @Anup/Drew/Alex, are we missing some wording in here about it only being
> > valid to have Svadu in isolation if the provider of the devicetree has
> > actually turned on Svadu? The binding says "the default behaviour", but
> > it is not the "default" behaviour, the behaviour is a must AFAICT. If
> > you set Svadu in isolation, you /must/ have turned it on. If you set
> > Svadu and Svade, you must have Svadu turned off?
> >
> > > +            1. Neither svade nor svadu in DT: default to svade.
> > > +            2. Only svade in DT: use svade.
> >
> > These two are not relevant to Svadu, I'd leave them out.
> >
> > > +            3. Only svadu in DT: use svadu.
> >
> > Again, statement of the obvious?
> >
> > > +            4. Both svade and svadu in DT: default to svade (Linux can switch to
> > > +               svadu once the SBI FWFT extension is available).
> >
> > Same here as in the Svade entry.

> I will update the description. Thank you!

Before you do, I'd love if Anup, Drew or Alex could comment on my
question about default behaviours. They're the ones with Strong Opinions
here about how the SBI implementation should behave, and I want to make
sure it is correctly documented.

Thanks,
Conor.

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20240619/b6657ddc/attachment.sig>
