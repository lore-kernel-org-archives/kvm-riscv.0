From: Conor Dooley <conor@kernel.org>
Date: Fri, 21 Jun 2024 15:04:47 +0100
Subject: [PATCH v5 2/4] dt-bindings: riscv: Add Svade and Svadu Entries
In-Reply-To: <20240621-9bf9365533a2f8f97cbf1f5e@orel>
References: <20240605121512.32083-1-yongxuan.wang@sifive.com>
 <20240605121512.32083-3-yongxuan.wang@sifive.com>
 <20240605-atrium-neuron-c2512b34d3da@spud>
 <CAK9=C2XH7-RdVpojX8GNW-WFTyChW=sTOWs8_kHgsjiFYwzg+g@mail.gmail.com>
 <40a7d568-3855-48fb-a73c-339e1790f12f@ghiti.fr>
 <20240621-viewless-mural-f5992a247992@wendy>
 <edcd3957-0720-4ab4-bdda-58752304a53a@ghiti.fr>
 <20240621-9bf9365533a2f8f97cbf1f5e@orel>
Message-ID: <20240621-glutton-platonic-2ec41021b81b@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jun 21, 2024 at 03:15:10PM +0200, Andrew Jones wrote:
> On Fri, Jun 21, 2024 at 02:42:15PM GMT, Alexandre Ghiti wrote:
> > 
> > On 21/06/2024 12:17, Conor Dooley wrote:
> > > On Fri, Jun 21, 2024 at 10:37:21AM +0200, Alexandre Ghiti wrote:
> > > > On 20/06/2024 08:25, Anup Patel wrote:
> > > > > On Wed, Jun 5, 2024 at 10:25?PM Conor Dooley <conor@kernel.org> wrote:
> > > > > > On Wed, Jun 05, 2024 at 08:15:08PM +0800, Yong-Xuan Wang wrote:
> > > > > > > Add entries for the Svade and Svadu extensions to the riscv,isa-extensions
> > > > > > > property.
> > > > > > > 
> > > > > > > Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
> > > > > > > ---
> > > > > > >    .../devicetree/bindings/riscv/extensions.yaml | 30 +++++++++++++++++++
> > > > > > >    1 file changed, 30 insertions(+)
> > > > > > > 
> > > > > > > diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > > > > > > index 468c646247aa..1e30988826b9 100644
> > > > > > > --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> > > > > > > +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > > > > > > @@ -153,6 +153,36 @@ properties:
> > > > > > >                ratified at commit 3f9ed34 ("Add ability to manually trigger
> > > > > > >                workflow. (#2)") of riscv-time-compare.
> > > > > > > 
> > > > > > > +        - const: svade
> > > > > > > +          description: |
> > > > > > > +            The standard Svade supervisor-level extension for raising page-fault
> > > > > > > +            exceptions when PTE A/D bits need be set as ratified in the 20240213
> > > > > > > +            version of the privileged ISA specification.
> > > > > > > +
> > > > > > > +            Both Svade and Svadu extensions control the hardware behavior when
> > > > > > > +            the PTE A/D bits need to be set. The default behavior for the four
> > > > > > > +            possible combinations of these extensions in the device tree are:
> > > > > > > +            1. Neither svade nor svadu in DT: default to svade.
> > > > > > I think this needs to be expanded on, as to why nothing means svade.
> > > > > Actually if both Svade and Svadu are not present in DT then
> > > > > it is left to the platform and OpenSBI does nothing.
> > > > > 
> > > > > > > +            2. Only svade in DT: use svade.
> > > > > > That's a statement of the obvious, right?
> > > > > > 
> > > > > > > +            3. Only svadu in DT: use svadu.
> > > > > > This is not relevant for Svade.
> > > > > > 
> > > > > > > +            4. Both svade and svadu in DT: default to svade (Linux can switch to
> > > > > > > +               svadu once the SBI FWFT extension is available).
> > > > > > "The privilege level to which this devicetree has been provided can switch to
> > > > > > Svadu if the SBI FWFT extension is available".
> > > > > > 
> > > > > > > +        - const: svadu
> > > > > > > +          description: |
> > > > > > > +            The standard Svadu supervisor-level extension for hardware updating
> > > > > > > +            of PTE A/D bits as ratified at commit c1abccf ("Merge pull request
> > > > > > > +            #25 from ved-rivos/ratified") of riscv-svadu.
> > > > > > > +
> > > > > > > +            Both Svade and Svadu extensions control the hardware behavior when
> > > > > > > +            the PTE A/D bits need to be set. The default behavior for the four
> > > > > > > +            possible combinations of these extensions in the device tree are:
> > > > > > @Anup/Drew/Alex, are we missing some wording in here about it only being
> > > > > > valid to have Svadu in isolation if the provider of the devicetree has
> > > > > > actually turned on Svadu? The binding says "the default behaviour", but
> > > > > > it is not the "default" behaviour, the behaviour is a must AFAICT. If
> > > > > > you set Svadu in isolation, you /must/ have turned it on. If you set
> > > > > > Svadu and Svade, you must have Svadu turned off?
> > > > > Yes, the wording should be more of requirement style using
> > > > > must or may.
> > > > > 
> > > > > How about this ?
> > > > > 1) Both Svade and Svadu not present in DT => Supervisor may
> > > > >       assume Svade to be present and enabled or it can discover
> > > > >       based on mvendorid, marchid, and mimpid.
> > > > > 2) Only Svade present in DT => Supervisor must assume Svade
> > > > >       to be always enabled. (Obvious)
> > > > > 3) Only Svadu present in DT => Supervisor must assume Svadu
> > > > >       to be always enabled. (Obvious)
> > > > 
> > > > I agree with all of that, but the problem is how can we guarantee that
> > > > openSBI actually enabled svadu?
> > > Conflation of an SBI implementation and OpenSBI aside, if the devicetree
> > > property is defined to mean that "the supervisor must assume svadu to be
> > > always enabled", then either it is, or the firmware's description of the
> > > hardware is broken and it's not the supervisor's problem any more. It's
> > > not the kernel's job to validate that the devicetree matches the
> > > hardware.
> > > 
> > > > This is not the case for now.
> > > What "is not the case for now"? My understanding was that, at the
> > > moment, nothing happens with Svadu in OpenSBI. In turn, this means that
> > > there should be no devicetrees containing Svadu (per this binding's
> > > description) and therefore no problem?
> > 
> > 
> > What prevents a dtb to be passed with svadu to an old version of opensbi
> > which does not support the enablement of svadu? The svadu extension will end
> > up being present in the kernel but not enabled right?

If you'll allow me use of my high horse, relying on undocumented
(or deprecated I suppose in this case) devicetree properties is always
going to leave people exposed to issues like this. If the property isn't
documented, then you shouldn't be passing it to the kernel.

> I understand the concern; old SBI implementations will leave svadu in the
> DT but not actually enable it. Then, since svade may not be in the DT if
> the platform doesn't support it or it was left out on purpose, Linux will
> only see svadu and get unexpected exceptions. This is something we could
> force easily with QEMU and an SBI implementation which doesn't do anything
> for svadu. I hope vendors of real platforms, which typically provide their
> own firmware and DTs, would get this right, though, especially since Linux
> should fail fast in their testing when they get it wrong.

I'll admit, I wasn't really thinking here about something like QEMU that
puts extensions into the dtb before their exact meanings are decided
upon. I almost only ever think about "real" systems, and in those cases
I would expect that if you can update the representation of the hardware
provided to (or by the firmware to Linux) with new properties, then updating
the firmware itself should be possible.

Does QEMU have the this exact problem at the moment? I know it puts
Svadu in the max cpu, but does it enable the behaviour by default, even
without the SBI implementation asking for it?

Sorta on a related note, I'm completely going head-in-sand here for ACPI,
cos I have no idea how that is being dealt with - other than that Linux
assumes that all ACPI properties have the same meaning as the DT ones. I
don't really think that that is sustainable, but it is what we are doing
at present. Maybe I should put that in boot.rst or in acpi.rst?

Also on the ACPI side of things, and I am going an uber devil's advocate
here, the version of the spec that we documented as defining our parsing
rules never mentions svade or svadu, so is it even valid to use them on
ACPI systems?



-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20240621/42ec1b9c/attachment-0001.sig>
