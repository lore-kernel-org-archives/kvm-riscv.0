From: Conor Dooley <conor.dooley@microchip.com>
Date: Mon, 30 Jan 2023 12:25:39 +0000
Subject: [PATCH v3 2/6] dt-bindings: riscv: Document cboz-block-size
In-Reply-To: <20230130120128.1349464-3-ajones@ventanamicro.com>
References: <20230130120128.1349464-1-ajones@ventanamicro.com>
 <20230130120128.1349464-3-ajones@ventanamicro.com>
Message-ID: <Y9e3Q5M8J8pTWZja@wendy>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hey!

On Mon, Jan 30, 2023 at 01:01:24PM +0100, Andrew Jones wrote:
> The Zicboz operation (cbo.zero) operates on a block-size defined
> for the cpu-core. While we already have the riscv,cbom-block-size
> property, it only provides the block size for Zicbom operations.
> Even though it's likely Zicboz and Zicbom will use the same size,
> that's not specified.

If you end up respinning for some other reason, perhaps:
s/that's not specified/that's not required by the specification/ or
some other wording to that effect?
I'm assuming by "specified" you're referring to the cmobase spec, but
that wording I don't think is particular clear.

> Create another property specifically for
> Zicboz.
> 
> Cc: Rob Herring <robh@kernel.org>
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
> +

I was happy with either keeping them apart entirely or a having this one
default to the value of cbom-block-size, so:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230130/7b887020/attachment-0001.sig>
