From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Tue, 25 Jun 2024 18:15:40 +0800
Subject: [PATCH v5 2/4] dt-bindings: riscv: Add Svade and Svadu Entries
In-Reply-To: <20240621-10d503a9a2e7d54e67db102c@orel>
References: <20240605121512.32083-1-yongxuan.wang@sifive.com>
 <20240605121512.32083-3-yongxuan.wang@sifive.com> <20240605-atrium-neuron-c2512b34d3da@spud>
 <CAK9=C2XH7-RdVpojX8GNW-WFTyChW=sTOWs8_kHgsjiFYwzg+g@mail.gmail.com> <20240621-10d503a9a2e7d54e67db102c@orel>
Message-ID: <CAMWQL2gGfpotAR_YmU05bciGV98r80PZ1GWDSk6A03YRxD8wug@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Anup/Andrew/Alexandre,

Thanks a lot! So the description of dt-binding of Svade would be:

The standard Svade supervisor-level extension for SW-managed PTE A/D
bit updates as ratified in the 20240213 version of the privileged
ISA specification.
1) Neither Svade nor Svadu present in DT => It is technically
    unknown whether the platform uses Svade or Svadu. Supervisor may
    assume Svade to be present and enabled or it can discover based
    on mvendorid, marchid, and mimpid.
2) Only Svade present in DT => Supervisor must assume Svade
    to be always enabled. (Obvious)
3) Only Svadu present in DT => Supervisor must assume Svadu
    to be always enabled. (Obvious)
4) Both Svade and Svadu present in DT => Supervisor must
    assume Svadu turned-off at boot time. To use Svadu, supervisor
    must explicitly enable it using the SBI FWFT extension.

Would you mind providing a Co-developed-by for this patch?

Regards,
Yong-Xuan


On Fri, Jun 21, 2024 at 4:33?PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
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
>
> >
> > >
> > > > +            2. Only svade in DT: use svade.
> > >
> > > That's a statement of the obvious, right?
> > >
> > > > +            3. Only svadu in DT: use svadu.
> > >
> > > This is not relevant for Svade.
> > >
> > > > +            4. Both svade and svadu in DT: default to svade (Linux can switch to
> > > > +               svadu once the SBI FWFT extension is available).
> > >
> > > "The privilege level to which this devicetree has been provided can switch to
> > > Svadu if the SBI FWFT extension is available".
> > >
> > > > +        - const: svadu
> > > > +          description: |
> > > > +            The standard Svadu supervisor-level extension for hardware updating
> > > > +            of PTE A/D bits as ratified at commit c1abccf ("Merge pull request
> > > > +            #25 from ved-rivos/ratified") of riscv-svadu.
> > > > +
> > > > +            Both Svade and Svadu extensions control the hardware behavior when
> > > > +            the PTE A/D bits need to be set. The default behavior for the four
> > > > +            possible combinations of these extensions in the device tree are:
> > >
> > > @Anup/Drew/Alex, are we missing some wording in here about it only being
> > > valid to have Svadu in isolation if the provider of the devicetree has
> > > actually turned on Svadu? The binding says "the default behaviour", but
> > > it is not the "default" behaviour, the behaviour is a must AFAICT. If
> > > you set Svadu in isolation, you /must/ have turned it on. If you set
> > > Svadu and Svade, you must have Svadu turned off?
> >
> > Yes, the wording should be more of requirement style using
> > must or may.
> >
> > How about this ?
>
> I'm mostly just +1'ing everything below, but with a minor wording change
> suggestion
>
> > 1) Both Svade and Svadu not present in DT => Supervisor may
>
> Neither Svade nor Svadu present...
>
> >     assume Svade to be present and enabled or it can discover
> >     based on mvendorid, marchid, and mimpid.
> > 2) Only Svade present in DT => Supervisor must assume Svade
> >     to be always enabled. (Obvious)
> > 3) Only Svadu present in DT => Supervisor must assume Svadu
> >     to be always enabled. (Obvious)
> > 4) Both Svade and Svadu present in DT => Supervisor must
> >     assume Svadu turned-off at boot time. To use Svadu, supervisor
> >     must explicitly enable it using the SBI FWFT extension.
> >
> > IMO, the #2 and #3 are definitely obvious but still worth mentioning.
>
> Thanks,
> drew

