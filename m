From: Conor Dooley <conor@kernel.org>
Date: Fri, 28 Jun 2024 17:19:46 +0100
Subject: [PATCH v6 2/4] dt-bindings: riscv: Add Svade and Svadu Entries
In-Reply-To: <20240628093711.11716-3-yongxuan.wang@sifive.com>
References: <20240628093711.11716-1-yongxuan.wang@sifive.com>
 <20240628093711.11716-3-yongxuan.wang@sifive.com>
Message-ID: <20240628-clamp-vineyard-c7cdd40a6d50@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jun 28, 2024 at 05:37:06PM +0800, Yong-Xuan Wang wrote:
> Add entries for the Svade and Svadu extensions to the riscv,isa-extensions
> property.
> 
> Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
> ---
>  .../devicetree/bindings/riscv/extensions.yaml | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
> index 468c646247aa..c3d053ce7783 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -153,6 +153,34 @@ properties:
>              ratified at commit 3f9ed34 ("Add ability to manually trigger
>              workflow. (#2)") of riscv-time-compare.
>  
> +        - const: svade
> +          description: |
> +            The standard Svade supervisor-level extension for SW-managed PTE A/D
> +            bit updates as ratified in the 20240213 version of the privileged
> +            ISA specification.
> +
> +            Both Svade and Svadu extensions control the hardware behavior when
> +            the PTE A/D bits need to be set. The default behavior for the four
> +            possible combinations of these extensions in the device tree are:
> +            1) Neither Svade nor Svadu present in DT =>

>                 It is technically
> +               unknown whether the platform uses Svade or Svadu. Supervisor may
> +               assume Svade to be present and enabled or it can discover based
> +               on mvendorid, marchid, and mimpid.

I would just write "for backwards compatibility, if neither Svade nor
Svadu appear in the devicetree the supervisor may assume Svade to be
present and enabled". If there are systems that this behaviour causes
problems for, we can deal with them iff they appear. I don't think
looking at m*id would be sufficient here anyway, since the firmware can
have an impact. I'd just drop that part entirely.

> +            2) Only Svade present in DT => Supervisor must assume Svade to be
> +               always enabled. (Obvious)

nit: I'd drop the "(Obvious)" comments from here.

Cheers,
Conor.

> +            3) Only Svadu present in DT => Supervisor must assume Svadu to be
> +               always enabled. (Obvious)
> +            4) Both Svade and Svadu present in DT => Supervisor must assume
> +               Svadu turned-off at boot time. To use Svadu, supervisor must
> +               explicitly enable it using the SBI FWFT extension.
> +
> +        - const: svadu
> +          description: |
> +            The standard Svadu supervisor-level extension for hardware updating
> +            of PTE A/D bits as ratified at commit c1abccf ("Merge pull request
> +            #25 from ved-rivos/ratified") of riscv-svadu. Please refer to Svade
> +            dt-binding description for more details.
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
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20240628/4d2efcbb/attachment.sig>
