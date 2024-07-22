From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Mon, 22 Jul 2024 10:14:11 +0800
Subject: [PATCH v7 2/4] dt-bindings: riscv: Add Svade and Svadu Entries
In-Reply-To: <20240719-flatten-elixir-d4476977ab95@spud>
References: <20240712083850.4242-1-yongxuan.wang@sifive.com>
 <20240712083850.4242-3-yongxuan.wang@sifive.com> <727b966a-a8c4-4021-acf6-3c031ccd843a@sifive.com>
 <CAMWQL2g-peSYJQaxeJtyOzGdEmDQ6cnkRBdFQvLr2NQA1+mv2g@mail.gmail.com> <20240719-flatten-elixir-d4476977ab95@spud>
Message-ID: <CAMWQL2iWsxLJZZ3H59csJ376Hdtq+ZKjD92BtM9zhdXm+fh2=A@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Conor,

On Fri, Jul 19, 2024 at 9:17?PM Conor Dooley <conor@kernel.org> wrote:
>
> On Fri, Jul 19, 2024 at 02:58:59PM +0800, Yong-Xuan Wang wrote:
> > Hi Samuel,
> >
> > On Fri, Jul 19, 2024 at 7:38?AM Samuel Holland
> > <samuel.holland@sifive.com> wrote:
> > >
> > > On 2024-07-12 3:38 AM, Yong-Xuan Wang wrote:
> > > > Add entries for the Svade and Svadu extensions to the riscv,isa-extensions
> > > > property.
> > > >
> > > > Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
> > > > ---
> > > >  .../devicetree/bindings/riscv/extensions.yaml | 28 +++++++++++++++++++
> > > >  1 file changed, 28 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > > > index 468c646247aa..e91a6f4ede38 100644
> > > > --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> > > > +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > > > @@ -153,6 +153,34 @@ properties:
> > > >              ratified at commit 3f9ed34 ("Add ability to manually trigger
> > > >              workflow. (#2)") of riscv-time-compare.
> > > >
> > > > +        - const: svade
> > > > +          description: |
> > > > +            The standard Svade supervisor-level extension for SW-managed PTE A/D
> > > > +            bit updates as ratified in the 20240213 version of the privileged
> > > > +            ISA specification.
> > > > +
> > > > +            Both Svade and Svadu extensions control the hardware behavior when
> > > > +            the PTE A/D bits need to be set. The default behavior for the four
> > > > +            possible combinations of these extensions in the device tree are:
> > > > +            1) Neither Svade nor Svadu present in DT => It is technically
> > > > +               unknown whether the platform uses Svade or Svadu. Supervisor
> > > > +               software should be prepared to handle either hardware updating
> > > > +               of the PTE A/D bits or page faults when they need updated.
> > > > +            2) Only Svade present in DT => Supervisor must assume Svade to be
> > > > +               always enabled.
> > > > +            3) Only Svadu present in DT => Supervisor must assume Svadu to be
> > > > +               always enabled.
> > > > +            4) Both Svade and Svadu present in DT => Supervisor must assume
> > > > +               Svadu turned-off at boot time. To use Svadu, supervisor must
> > > > +               explicitly enable it using the SBI FWFT extension.
> > > > +
> > > > +        - const: svadu
> > > > +          description: |
> > > > +            The standard Svadu supervisor-level extension for hardware updating
> > > > +            of PTE A/D bits as ratified at commit c1abccf ("Merge pull request
> > > > +            #25 from ved-rivos/ratified") of riscv-svadu. Please refer to Svade
> > >
> > > Should we be referencing the archived riscv-svadu repository now that Svadu has
> > > been merged to the main privileged ISA manual? Either way:
> > >
> > > Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
> > >
> >
> > Yes, this commit is from the archived riscv-svadu repo. Or should I update it to
> > "commit c1abccf ("Merge pull request  #25 from ved-rivos/ratified") of
> > riscvarchive/riscv-svadu."?
>
> I think Samuel was saying that we should use the commit where it was
> merged into riscv-isa-manual instead.

Got it. I will update the description in the next version. Thank you!

