From: Conor Dooley <conor@kernel.org>
Date: Sat, 21 Sep 2024 23:05:53 +0100
Subject: [PATCH RFC 1/3] dt-bindings: riscv: Add Svukte entry
In-Reply-To: <20240920-dev-maxh-svukte-rebase-v1-1-7864a88a62bd@sifive.com>
References: <20240920-dev-maxh-svukte-rebase-v1-0-7864a88a62bd@sifive.com>
 <20240920-dev-maxh-svukte-rebase-v1-1-7864a88a62bd@sifive.com>
Message-ID: <20240921-shock-purge-d91482d191a1@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Sep 20, 2024 at 03:39:03PM +0800, Max Hsu wrote:
> Add an entry for the Svukte extension to the riscv,isa-extensions
> property.
> 
> Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
> Signed-off-by: Max Hsu <max.hsu@sifive.com>
> ---
>  Documentation/devicetree/bindings/riscv/extensions.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
> index a06dbc6b4928958704855c8993291b036e3d1a63..df96aea5e53a70b0cb8905332464a42a264e56e6 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -171,6 +171,13 @@ properties:
>              memory types as ratified in the 20191213 version of the privileged
>              ISA specification.
>  
> +        - const: svukte
> +          description:
> +            The standard Svukte supervisor-level extensions for making user-mode
> +            accesses to supervisor memory raise page faults in constant time,
> +            mitigating attacks that attempt to discover the supervisor
> +            software's address-space layout, as PR#1564 of riscv-isa-manual.

I'm surprised this doesn't fail dt_binding_check, with the # in it. I'd
like to see a commit hash here though, in the same format as the other
extensions using them.

> +
>          - const: zacas
>            description: |
>              The Zacas extension for Atomic Compare-and-Swap (CAS) instructions
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
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20240921/1fb81c71/attachment.sig>
