From: Max Hsu <max.hsu@sifive.com>
Date: Wed, 20 Nov 2024 21:55:18 +0800
Subject: [PATCH RFC 1/3] dt-bindings: riscv: Add Svukte entry
In-Reply-To: <eb8f399b-fa09-47fd-8102-9b65b0839dd5@ghiti.fr>
References: <20240920-dev-maxh-svukte-rebase-v1-0-7864a88a62bd@sifive.com>
 <20240920-dev-maxh-svukte-rebase-v1-1-7864a88a62bd@sifive.com> <eb8f399b-fa09-47fd-8102-9b65b0839dd5@ghiti.fr>
Message-ID: <CAHibDyzOWrKwEZ_7K2f2MY9DFn4sD5QjDEQ42u8DTaftN6Fuvw@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Alexandre,

Thanks for the suggestion.
I will send a typo fix in the RFC v3 patches

Best regards,
Max Hsu

On Thu, Nov 14, 2024 at 12:15?AM Alexandre Ghiti <alex@ghiti.fr> wrote:
>
> Hi Max,
>
> On 20/09/2024 09:39, Max Hsu wrote:
> > Add an entry for the Svukte extension to the riscv,isa-extensions
> > property.
> >
> > Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
> > Signed-off-by: Max Hsu <max.hsu@sifive.com>
> > ---
> >   Documentation/devicetree/bindings/riscv/extensions.yaml | 7 +++++++
> >   1 file changed, 7 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > index a06dbc6b4928958704855c8993291b036e3d1a63..df96aea5e53a70b0cb8905332464a42a264e56e6 100644
> > --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> > +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > @@ -171,6 +171,13 @@ properties:
> >               memory types as ratified in the 20191213 version of the privileged
> >               ISA specification.
> >
> > +        - const: svukte
> > +          description:
> > +            The standard Svukte supervisor-level extensions for making user-mode
>
>
> s/extensions/extension
>
>
> > +            accesses to supervisor memory raise page faults in constant time,
> > +            mitigating attacks that attempt to discover the supervisor
> > +            software's address-space layout, as PR#1564 of riscv-isa-manual.
> > +
> >           - const: zacas
> >             description: |
> >               The Zacas extension for Atomic Compare-and-Swap (CAS) instructions
> >
>
> You'll need a new version for the proper commit sha1 once it gets
> ratified anyway, so with the typo fixed, you can add:
>
> Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
>
> Thanks,
>
> Alex
>

