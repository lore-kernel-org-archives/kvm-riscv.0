From: Conor Dooley <conor@kernel.org>
Date: Fri, 19 Apr 2024 15:45:46 +0100
Subject: [PATCH v2 2/6] dt-bindings: riscv: Add Zawrs ISA extension
 description
In-Reply-To: <20240419135321.70781-10-ajones@ventanamicro.com>
References: <20240419135321.70781-8-ajones@ventanamicro.com>
 <20240419135321.70781-10-ajones@ventanamicro.com>
Message-ID: <20240419-chafe-leotard-e5daee19b1c8@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Apr 19, 2024 at 03:53:24PM +0200, Andrew Jones wrote:
> Add description for the Zawrs (Wait-on-Reservation-Set) ISA extension
> which was ratified in commit 98918c844281 of riscv-isa-manual.
> 
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  .../devicetree/bindings/riscv/extensions.yaml        | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
> index 468c646247aa..584da2f539e5 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -177,6 +177,18 @@ properties:
>              is supported as ratified at commit 5059e0ca641c ("update to
>              ratified") of the riscv-zacas.
>  
> +        - const: zawrs
> +          description: |
> +            The Zawrs extension for entering a low-power state or for trapping
> +            to a hypervisor while waiting on a store to a memory location, as
> +            ratified in commit 98918c844281 ("Merge pull request #1217 from
> +            riscv/zawrs") of riscv-isa-manual.

This part is fine...


> Linux assumes that WRS.NTO will
> +            either always eventually terminate the stall due to the reservation
> +            set becoming invalid, implementation-specific other reasons, or
> +            because a higher privilege level has configured it to cause an
> +            illegal instruction exception after an implementation-specific
> +            bounded time limit.

...but I don't like this bit. The binding should just describe what the
property means for the hardware, not discuss specifics about a
particular OS.

And with my dt-bindings hat off and my kernel hat on, I think that if we
want to have more specific requirements than the extension provides we
either need to a) document that zawrs means that it will always
terminate or b) additionally document a "zawrs-always-terminates" that
has that meaning and look for it to enable the behaviour.

Documenting something and immediately turning around and saying "this
isn't sufficient, let's assume it means more than it does" just seems
like we should make firmware tell us exactly what we want.

Cheers,
Conor.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20240419/7cc99d58/attachment.sig>
