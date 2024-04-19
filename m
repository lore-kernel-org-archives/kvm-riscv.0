From: Conor Dooley <conor@kernel.org>
Date: Fri, 19 Apr 2024 16:49:16 +0100
Subject: [PATCH v2 03/12] dt-bindings: riscv: add Zc* extension rules
 implied by C extension
In-Reply-To: <20240418124300.1387978-4-cleger@rivosinc.com>
References: <20240418124300.1387978-1-cleger@rivosinc.com>
 <20240418124300.1387978-4-cleger@rivosinc.com>
Message-ID: <20240419-blinked-timid-da722ec6ddc4@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Apr 18, 2024 at 02:42:26PM +0200, Cl?ment L?ger wrote:
> As stated by Zc* spec:
> 
> "As C defines the same instructions as Zca, Zcf and Zcd, the rule is that:
>  - C always implies Zca
>  - C+F implies Zcf (RV32 only)
>  - C+D implies Zcd"
> 
> Add additionnal validation rules to enforce this in dts.

I'll get it out of the way: NAK, and the dts patch is the perfect
example of why. I don't want us to have to continually update
devicetrees. If these are implied due to being subsets of other
extensions, then software should be able to enable them when that
other extension is present.

My fear is that, and a quick look at the "add probing" commit seemed to
confirm it, new subsets would require updates to the dts, even though
the existing extension is perfectly sufficient to determine presence.

I definitely want to avoid continual updates to the devicetree for churn
reasons whenever subsets are added, but not turning on the likes of Zca
when C is present because "the bindings were updated to enforce this"
is a complete blocker. I do concede that having two parents makes that
more difficult and will likely require some changes to how we probe - do
we need to have a "second round" type thing?
Taking Zcf as an example, maybe something like making both of C and F into
"standard" supersets and adding a case to riscv_isa_extension_check()
that would mandate that Zca and F are enabled before enabling it, and we
would ensure that C implies Zca before it implies Zcf?

Given we'd be relying on ordering, we have to perform the same implication
for both F and C and make sure that the "implies" struct has Zca before Zcf.
I don't really like that suggestion, hopefully there's a nicer way of doing
that, but I don't like the dt stuff here.

Thanks,
Conor.

> 
> Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
> ---
>  .../devicetree/bindings/riscv/cpus.yaml       |  8 +++--
>  .../devicetree/bindings/riscv/extensions.yaml | 34 +++++++++++++++++++
>  2 files changed, 39 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
> index d87dd50f1a4b..c4e2c65437b1 100644
> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> @@ -168,7 +168,7 @@ examples:
>                  i-cache-size = <16384>;
>                  reg = <0>;
>                  riscv,isa-base = "rv64i";
> -                riscv,isa-extensions = "i", "m", "a", "c";
> +                riscv,isa-extensions = "i", "m", "a", "c", "zca";
>  
>                  cpu_intc0: interrupt-controller {
>                          #interrupt-cells = <1>;
> @@ -194,7 +194,8 @@ examples:
>                  reg = <1>;
>                  tlb-split;
>                  riscv,isa-base = "rv64i";
> -                riscv,isa-extensions = "i", "m", "a", "f", "d", "c";
> +                riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zca",
> +                                       "zcd";
>  
>                  cpu_intc1: interrupt-controller {
>                          #interrupt-cells = <1>;
> @@ -215,7 +216,8 @@ examples:
>                  compatible = "riscv";
>                  mmu-type = "riscv,sv48";
>                  riscv,isa-base = "rv64i";
> -                riscv,isa-extensions = "i", "m", "a", "f", "d", "c";
> +                riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zca",
> +                                       "zcd";
>  
>                  interrupt-controller {
>                          #interrupt-cells = <1>;
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
> index db7daf22b863..0172cbaa13ca 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -549,6 +549,23 @@ properties:
>                  const: zca
>              - contains:
>                  const: f
> +      # C extension implies Zca
> +      - if:
> +          contains:
> +            const: c
> +        then:
> +          contains:
> +            const: zca
> +      # C extension implies Zcd if d
> +      - if:
> +          allOf:
> +            - contains:
> +                const: c
> +            - contains:
> +                const: d
> +        then:
> +          contains:
> +            const: zcd
>  
>  allOf:
>    # Zcf extension does not exists on rv64
> @@ -566,6 +583,23 @@ allOf:
>            not:
>              contains:
>                const: zcf
> +  # C extension implies Zcf if f on rv32 only
> +  - if:
> +      properties:
> +        riscv,isa-extensions:
> +          allOf:
> +            - contains:
> +                const: c
> +            - contains:
> +                const: f
> +        riscv,isa-base:
> +          contains:
> +            const: rv32i
> +    then:
> +      properties:
> +        riscv,isa-extensions:
> +          contains:
> +            const: zcf
>  
>  additionalProperties: true
>  ...
> -- 
> 2.43.0
> 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20240419/1c43385b/attachment.sig>
