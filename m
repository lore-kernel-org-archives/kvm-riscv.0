From: Andrew Jones <ajones@ventanamicro.com>
Date: Fri, 5 Apr 2024 17:59:41 +0200
Subject: [PATCH RFC 02/11] dt-bindings: riscv: Add Sdtrig optional CSRs
 existence on DT
In-Reply-To: <20240329-affidavit-anatomist-1118a12c3e60@wendy>
References: <20240329-dev-maxh-lin-452-6-9-v1-0-1534f93b94a7@sifive.com>
 <20240329-dev-maxh-lin-452-6-9-v1-2-1534f93b94a7@sifive.com>
 <20240329-affidavit-anatomist-1118a12c3e60@wendy>
Message-ID: <20240405-ebdb2943657ab08d2d563c03@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Mar 29, 2024 at 10:31:10AM +0000, Conor Dooley wrote:
> On Fri, Mar 29, 2024 at 05:26:18PM +0800, Max Hsu wrote:
> > The mcontext/hcontext/scontext CSRs are optional in the Sdtrig extension,
> > to prevent RW operations to the missing CSRs, which will cause
> > illegal instructions.
> > 
> > As a solution, we have proposed the dt format for these CSRs.
> 
> As I mentioned in your other patch, I amn't sure what the actual value
> is in being told about "sdtrig" itself if so many of the CSRs are
> optional. I think we should define pseudo extensions that represent
> usable subsets that are allowed by riscv,isa-extensions, such as
> those you describe here: sdtrig + mcontext, sdtrig + scontext and
> sdtrig + hcontext. Probably also for strig + mscontext. What
> additional value does having a debug child node give us that makes
> it worth having over something like the above?

Yeah, Sdtrig, which doesn't tell you what you get, isn't nice at all.
I wonder if we can start with requiring Sdtrig to be accompanied by
Ssstrict in order to enable the context CSRs, i.e.

 Sdtrig          - support without optional CSRs
 Sdtrig+Ssstrict - probe for optional CSRs, support what's found

If there are platforms with Sdtrig and optional CSRs, but not Ssstrict,
then maybe the optional CSRs can be detected in some vendor-specific way,
where the decision as to whether or not that vendor-specific way is
acceptable is handled case-by-case.

Thanks,
drew

> 
> Thanks,
> Conor.
> 
> > 
> > Signed-off-by: Max Hsu <max.hsu@sifive.com>
> > ---
> >  Documentation/devicetree/bindings/riscv/cpus.yaml | 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
> > index d87dd50f1a4b..c713a48c5025 100644
> > --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> > +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> > @@ -137,6 +137,24 @@ properties:
> >        DMIPS/MHz, relative to highest capacity-dmips-mhz
> >        in the system.
> >  
> > +  debug:
> > +    type: object
> > +    properties:
> > +      compatible:
> > +        const: riscv,debug-v1.0.0
> > +      trigger-module:
> > +        type: object
> > +        description: |
> > +          An indication set of optional CSR existence from
> > +          riscv-debug-spec Sdtrig extension
> > +        properties:
> > +          mcontext-present:
> > +            type: boolean
> > +          hcontext-present:
> > +            type: boolean
> > +          scontext-present:
> > +            type: boolean
> > +
> >  anyOf:
> >    - required:
> >        - riscv,isa
> > 
> > -- 
> > 2.43.2
> > 



> -- 
> kvm-riscv mailing list
> kvm-riscv at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv


