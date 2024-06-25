From: Conor Dooley <conor@kernel.org>
Date: Tue, 25 Jun 2024 15:50:59 +0100
Subject: [PATCH v7 01/16] dt-bindings: riscv: add Zimop ISA extension
 description
In-Reply-To: <20240619113529.676940-2-cleger@rivosinc.com>
References: <20240619113529.676940-1-cleger@rivosinc.com>
 <20240619113529.676940-2-cleger@rivosinc.com>
Message-ID: <20240625-blimp-richly-f5828cbfe6a6@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jun 19, 2024 at 01:35:11PM +0200, Cl?ment L?ger wrote:
> Add description for the Zimop (May-Be-Operations) ISA extension which
> was ratified in commit 58220614a5f of the riscv-isa-manual.
> 
> Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
> Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  Documentation/devicetree/bindings/riscv/extensions.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
> index cfed80ad5540..e214679ab6da 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -363,6 +363,11 @@ properties:
>              ratified in the 20191213 version of the unprivileged ISA
>              specification.
>  
> +        - const: zimop
> +          description:
> +            The standard Zimop extension version 1.0, as ratified in commit
> +            58220614a5f ("Zimop is ratified/1.0") of the riscv-isa-manual.
> +
>          - const: ztso
>            description:
>              The standard Ztso extension for total store ordering, as ratified
> -- 
> 2.45.2
> 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20240625/481cb18b/attachment.sig>
