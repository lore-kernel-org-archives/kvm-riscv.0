From: Conor Dooley <conor.dooley@microchip.com>
Date: Fri, 29 Mar 2024 10:31:10 +0000
Subject: [PATCH RFC 02/11] dt-bindings: riscv: Add Sdtrig optional CSRs
 existence on DT
In-Reply-To: <20240329-dev-maxh-lin-452-6-9-v1-2-1534f93b94a7@sifive.com>
References: <20240329-dev-maxh-lin-452-6-9-v1-0-1534f93b94a7@sifive.com>
 <20240329-dev-maxh-lin-452-6-9-v1-2-1534f93b94a7@sifive.com>
Message-ID: <20240329-affidavit-anatomist-1118a12c3e60@wendy>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Mar 29, 2024 at 05:26:18PM +0800, Max Hsu wrote:
> The mcontext/hcontext/scontext CSRs are optional in the Sdtrig extension,
> to prevent RW operations to the missing CSRs, which will cause
> illegal instructions.
> 
> As a solution, we have proposed the dt format for these CSRs.

As I mentioned in your other patch, I amn't sure what the actual value
is in being told about "sdtrig" itself if so many of the CSRs are
optional. I think we should define pseudo extensions that represent
usable subsets that are allowed by riscv,isa-extensions, such as
those you describe here: sdtrig + mcontext, sdtrig + scontext and
sdtrig + hcontext. Probably also for strig + mscontext. What
additional value does having a debug child node give us that makes
it worth having over something like the above?

Thanks,
Conor.

> 
> Signed-off-by: Max Hsu <max.hsu@sifive.com>
> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
> index d87dd50f1a4b..c713a48c5025 100644
> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> @@ -137,6 +137,24 @@ properties:
>        DMIPS/MHz, relative to highest capacity-dmips-mhz
>        in the system.
>  
> +  debug:
> +    type: object
> +    properties:
> +      compatible:
> +        const: riscv,debug-v1.0.0
> +      trigger-module:
> +        type: object
> +        description: |
> +          An indication set of optional CSR existence from
> +          riscv-debug-spec Sdtrig extension
> +        properties:
> +          mcontext-present:
> +            type: boolean
> +          hcontext-present:
> +            type: boolean
> +          scontext-present:
> +            type: boolean
> +
>  anyOf:
>    - required:
>        - riscv,isa
> 
> -- 
> 2.43.2
> 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20240329/53c40f5d/attachment-0001.sig>
