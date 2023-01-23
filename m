From: Andrew Jones <ajones@ventanamicro.com>
Date: Mon, 23 Jan 2023 10:44:05 +0100
Subject: [PATCH v2 2/6] dt-bindings: riscv: Document cboz-block-size
In-Reply-To: <Y85A+3MW2N/jPTHH@wendy>
References: <20230122191328.1193885-1-ajones@ventanamicro.com>
 <20230122191328.1193885-3-ajones@ventanamicro.com>
 <Y85A+3MW2N/jPTHH@wendy>
Message-ID: <20230123094405.2ageo63zauqt6g2n@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jan 23, 2023 at 08:10:35AM +0000, Conor Dooley wrote:
> Hey,
> 
> On Sun, Jan 22, 2023 at 08:13:24PM +0100, Andrew Jones wrote:
> > The Zicboz operates on a block-size defined for the cpu-core,
> > which does not necessarily match other cache-sizes used.
> > 
> > So add the necessary property for the system to know the core's
> > block-size.
> > 
> > Cc: Rob Herring <robh@kernel.org>
> 
> FYI bindings need to be CC Krzysztof & the devicetree list too.

Thanks, hopefully CC'ing them now is OK (I just added them). If not,
I can repost.

> 
> > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> >  Documentation/devicetree/bindings/riscv/cpus.yaml | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
> > index c6720764e765..f4ee70f8e1cf 100644
> > --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> > +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> > @@ -72,6 +72,11 @@ properties:
> >      description:
> >        The blocksize in bytes for the Zicbom cache operations.
> >  
> > +  riscv,cboz-block-size:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      The blocksize in bytes for the Zicboz cache operations.
> 
> Do you think hardware that has different Zicboz versus Zicbom block
> sizes is going to be common, or would we benefit from just defaulting
> the Zicboz size to the Zicbom one?

I'm not sure. If it turns out the block size will be the same in most
cases, then we could add another property named cbo-block-size, which,
when present, would be parsed first and used to populate all CBO-related
block sizes. Then, these specific properties would only serve to override
that general size for their respective block sizes when they're present.

> 
> Either way,
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
drew

> 
> Thanks,
> Conor.
> 



