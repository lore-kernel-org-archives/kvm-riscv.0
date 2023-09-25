From: Andrew Jones <ajones@ventanamicro.com>
Date: Mon, 25 Sep 2023 16:12:10 +0200
Subject: [PATCH v2 3/9] dt-bindings: riscv: Add Zicond extension entry
In-Reply-To: <20230925133859.1735879-4-apatel@ventanamicro.com>
References: <20230925133859.1735879-1-apatel@ventanamicro.com>
 <20230925133859.1735879-4-apatel@ventanamicro.com>
Message-ID: <20230925-4a65c32623adcdf50c496005@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Sep 25, 2023 at 07:08:53PM +0530, Anup Patel wrote:
> Add an entry for the Zicond extension to the riscv,isa-extensions property.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
> index cad8ef68eca7..3f0b47686080 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -225,6 +225,12 @@ properties:
>              ratified in the 20191213 version of the unprivileged ISA
>              specification.
>  
> +        - const: zicond
> +          description:
> +            The standard Zicond extension for conditional arithmetic and
> +            conditional-select/move operations as ratified in commit 95cf1f9
> +            ("Add changes requested by Ved during signoff") of riscv-zicond.
> +
>          - const: zicsr
>            description: |
>              The standard Zicsr extension for control and status register
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>


