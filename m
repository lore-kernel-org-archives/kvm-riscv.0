From: Max Hsu <max.hsu@sifive.com>
Date: Fri, 27 Sep 2024 17:23:02 +0800
Subject: [PATCH RFC 1/3] dt-bindings: riscv: Add Svukte entry
In-Reply-To: <20240921-shock-purge-d91482d191a1@spud>
References: <20240920-dev-maxh-svukte-rebase-v1-0-7864a88a62bd@sifive.com>
 <20240920-dev-maxh-svukte-rebase-v1-1-7864a88a62bd@sifive.com> <20240921-shock-purge-d91482d191a1@spud>
Message-ID: <CAHibDyxcxe87mTLMkWZ9Ko3v7uyEbJd_BP7GSTpZFFO1nfmn0A@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Thanks, Conor,
I will modify the format and send it as RFC v2.

Since the Svukte extension is still in the review stage, I will put
the latest commit of the PR in the riscv-isa-manual as an indication,
Once the Svukte extension is ratified, I will modify it and send it as
a formal patch.

Best,
Max Hsu



On Sun, Sep 22, 2024 at 6:05?AM Conor Dooley <conor@kernel.org> wrote:
>
> On Fri, Sep 20, 2024 at 03:39:03PM +0800, Max Hsu wrote:
> > Add an entry for the Svukte extension to the riscv,isa-extensions
> > property.
> >
> > Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
> > Signed-off-by: Max Hsu <max.hsu@sifive.com>
> > ---
> >  Documentation/devicetree/bindings/riscv/extensions.yaml | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > index a06dbc6b4928958704855c8993291b036e3d1a63..df96aea5e53a70b0cb8905332464a42a264e56e6 100644
> > --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> > +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > @@ -171,6 +171,13 @@ properties:
> >              memory types as ratified in the 20191213 version of the privileged
> >              ISA specification.
> >
> > +        - const: svukte
> > +          description:
> > +            The standard Svukte supervisor-level extensions for making user-mode
> > +            accesses to supervisor memory raise page faults in constant time,
> > +            mitigating attacks that attempt to discover the supervisor
> > +            software's address-space layout, as PR#1564 of riscv-isa-manual.
>
> I'm surprised this doesn't fail dt_binding_check, with the # in it. I'd
> like to see a commit hash here though, in the same format as the other
> extensions using them.
>
> > +
> >          - const: zacas
> >            description: |
> >              The Zacas extension for Atomic Compare-and-Swap (CAS) instructions
> >
> > --
> > 2.43.2
> >

