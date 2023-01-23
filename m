From: Conor Dooley <conor.dooley@microchip.com>
Date: Mon, 23 Jan 2023 08:10:35 +0000
Subject: [PATCH v2 2/6] dt-bindings: riscv: Document cboz-block-size
In-Reply-To: <20230122191328.1193885-3-ajones@ventanamicro.com>
References: <20230122191328.1193885-1-ajones@ventanamicro.com>
 <20230122191328.1193885-3-ajones@ventanamicro.com>
Message-ID: <Y85A+3MW2N/jPTHH@wendy>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hey,

On Sun, Jan 22, 2023 at 08:13:24PM +0100, Andrew Jones wrote:
> The Zicboz operates on a block-size defined for the cpu-core,
> which does not necessarily match other cache-sizes used.
> 
> So add the necessary property for the system to know the core's
> block-size.
> 
> Cc: Rob Herring <robh@kernel.org>

FYI bindings need to be CC Krzysztof & the devicetree list too.

> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
> index c6720764e765..f4ee70f8e1cf 100644
> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> @@ -72,6 +72,11 @@ properties:
>      description:
>        The blocksize in bytes for the Zicbom cache operations.
>  
> +  riscv,cboz-block-size:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      The blocksize in bytes for the Zicboz cache operations.

Do you think hardware that has different Zicboz versus Zicbom block
sizes is going to be common, or would we benefit from just defaulting
the Zicboz size to the Zicbom one?

Either way,
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230123/6a7fc562/attachment.sig>
