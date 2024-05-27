From: Conor Dooley <conor@kernel.org>
Date: Mon, 27 May 2024 16:09:12 +0100
Subject: [RFC PATCH v4 2/5] dt-bindings: riscv: Add Svadu Entry
In-Reply-To: <20240524103307.2684-3-yongxuan.wang@sifive.com>
References: <20240524103307.2684-1-yongxuan.wang@sifive.com>
 <20240524103307.2684-3-yongxuan.wang@sifive.com>
Message-ID: <20240527-widely-goatskin-bb5575541aed@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, May 24, 2024 at 06:33:02PM +0800, Yong-Xuan Wang wrote:
> Add an entry for the Svadu extension to the riscv,isa-extensions property.
> 
> Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

I'm going to un-ack this, not because you did something wrong per se,
but because there's some discussion on the OpenSBI list about what is
and what is not backwards compatible and how an OS should interpret
svade and svadu:
https://lists.infradead.org/pipermail/opensbi/2024-May/006949.html

Thanks,
Conor.

> ---
>  Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
> index 468c646247aa..598a5841920f 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -153,6 +153,12 @@ properties:
>              ratified at commit 3f9ed34 ("Add ability to manually trigger
>              workflow. (#2)") of riscv-time-compare.
>  
> +        - const: svadu
> +          description: |
> +            The standard Svadu supervisor-level extension for hardware updating
> +            of PTE A/D bits as ratified at commit c1abccf ("Merge pull request
> +            #25 from ved-rivos/ratified") of riscv-svadu.
> +
>          - const: svinval
>            description:
>              The standard Svinval supervisor-level extension for fine-grained
> -- 
> 2.17.1
> 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20240527/d8aff872/attachment.sig>
