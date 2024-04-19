From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 19 Apr 2024 12:40:01 -0400
Subject: [PATCH v2 2/6] dt-bindings: riscv: Add Zawrs ISA extension
 description
In-Reply-To: <20240419-disdain-litmus-82874cc4872e@spud>
References: <20240419135321.70781-8-ajones@ventanamicro.com>
 <20240419135321.70781-10-ajones@ventanamicro.com>
 <20240419-chafe-leotard-e5daee19b1c8@spud>
 <20240419-8c6af6a169a7aa0b9aa5cac5@orel>
 <20240419-disdain-litmus-82874cc4872e@spud>
Message-ID: <ZiKeYRnXxtLUtkkW@ghost>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Apr 19, 2024 at 04:19:52PM +0100, Conor Dooley wrote:
> On Fri, Apr 19, 2024 at 05:16:05PM +0200, Andrew Jones wrote:
> > On Fri, Apr 19, 2024 at 03:45:46PM +0100, Conor Dooley wrote:
> > > On Fri, Apr 19, 2024 at 03:53:24PM +0200, Andrew Jones wrote:
> > > > Add description for the Zawrs (Wait-on-Reservation-Set) ISA extension
> > > > which was ratified in commit 98918c844281 of riscv-isa-manual.
> > > > 
> > > > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > > > ---
> > > >  .../devicetree/bindings/riscv/extensions.yaml        | 12 ++++++++++++
> > > >  1 file changed, 12 insertions(+)
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > > > index 468c646247aa..584da2f539e5 100644
> > > > --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> > > > +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > > > @@ -177,6 +177,18 @@ properties:
> > > >              is supported as ratified at commit 5059e0ca641c ("update to
> > > >              ratified") of the riscv-zacas.
> > > >  
> > > > +        - const: zawrs
> > > > +          description: |
> > > > +            The Zawrs extension for entering a low-power state or for trapping
> > > > +            to a hypervisor while waiting on a store to a memory location, as
> > > > +            ratified in commit 98918c844281 ("Merge pull request #1217 from
> > > > +            riscv/zawrs") of riscv-isa-manual.
> > > 
> > > This part is fine...
> > > 
> > > 
> > > > Linux assumes that WRS.NTO will
> > > > +            either always eventually terminate the stall due to the reservation
> > > > +            set becoming invalid, implementation-specific other reasons, or
> > > > +            because a higher privilege level has configured it to cause an
> > > > +            illegal instruction exception after an implementation-specific
> > > > +            bounded time limit.
> > > 
> > > ...but I don't like this bit. The binding should just describe what the
> > > property means for the hardware, not discuss specifics about a
> > > particular OS.
> > > 
> > > And with my dt-bindings hat off and my kernel hat on, I think that if we
> > > want to have more specific requirements than the extension provides we
> > > either need to a) document that zawrs means that it will always
> > > terminate or b) additionally document a "zawrs-always-terminates" that
> > > has that meaning and look for it to enable the behaviour.
> > 
> > IIUC, the text above mostly just needs to remove 'Linux assumes' in order
> > to provide what we want for (a)? I'm not sure about (b). If Zawrs is
> > unusable as is, then we should probably just go back to the specs and get
> > a new standard extension name for a new version which includes the changes
> > we need.
> 
> An (official) new name for the behaviour that you actually want, especially
> if the patchset sent the other day does not have the more stringent
> requirement (I won't even pretend to understand Zawrs well enough to know
> whether it does or not), sounds like the ideal outcome. That way you're
> also sorted on the ACPI side.

What would be the purpose of a vendor implementing WRS.NTO (and putting
it in the DT) that never terminates? The spec says "Then a subsequent
WRS.NTO instruction would cause the hart to temporarily stall execution
in a low- power state until a store occurs to the reservation set or an
interrupt is observed." Why is this wording for WRS.NTO not sufficient
to assume that an implementation of this instruction would eventually
terminate?

- Charlie


