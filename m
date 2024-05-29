From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 29 May 2024 15:10:32 -0700
Subject: [PATCH v5 01/16] dt-bindings: riscv: add Zimop ISA extension
 description
In-Reply-To: <20240517145302.971019-2-cleger@rivosinc.com>
References: <20240517145302.971019-1-cleger@rivosinc.com>
 <20240517145302.971019-2-cleger@rivosinc.com>
Message-ID: <Zlen2LmttEdaqAGm@ghost>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, May 17, 2024 at 04:52:41PM +0200, Cl?ment L?ger wrote:
> Add description for the Zimop (May-Be-Operations) ISA extension which
> was ratified in commit 58220614a5f of the riscv-isa-manual.
> 
> Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
> ---
>  Documentation/devicetree/bindings/riscv/extensions.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
> index 99d2a9e8c52d..b9100addeb90 100644
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
> 2.43.0
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>


