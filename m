From: Conor Dooley <conor@kernel.org>
Date: Mon, 24 Jul 2023 17:27:08 +0100
Subject: [PATCH v3 2/7] dt-bindings: riscv: Add smstateen entry
In-Reply-To: <20230724142033.306538-3-mchitale@ventanamicro.com>
References: <20230724142033.306538-1-mchitale@ventanamicro.com>
 <20230724142033.306538-3-mchitale@ventanamicro.com>
Message-ID: <20230724-skeletal-magnify-dd76ad7aeacb@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jul 24, 2023 at 07:50:28PM +0530, Mayuresh Chitale wrote:
> Add an entry for the Smstateen extension to the riscv,isa-extensions
> property.
> 
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
>  Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
> index cc1f546fdbdc..36ff6749fbba 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -128,6 +128,12 @@ properties:
>              changes to interrupts as frozen at commit ccbddab ("Merge pull
>              request #42 from riscv/jhauser-2023-RC4") of riscv-aia.
>  
> +        - const: smstateen
> +          description: |
> +            The standard Smstateen extension for controlling access to CSRs
> +            added by other RISC-V extensions in H/S/VS/U/VU modes and as
> +            ratified at commit a28bfae (Ratified (#7)) of riscv-state-enable.
> +
>          - const: ssaia
>            description: |
>              The standard Ssaia supervisor-level extension for the advanced
> -- 
> 2.34.1
> 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230724/57ad6f6d/attachment-0001.sig>
