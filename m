From: Conor Dooley <conor@kernel.org>
Date: Sun, 18 Feb 2024 12:47:39 +0000
Subject: [PATCH RFC 04/20] dt-bindings: riscv: add Sxcsrind ISA extension
 description
In-Reply-To: <20240217005738.3744121-5-atishp@rivosinc.com>
References: <20240217005738.3744121-1-atishp@rivosinc.com>
 <20240217005738.3744121-5-atishp@rivosinc.com>
Message-ID: <20240218-struggle-grumble-43efdfb9515d@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Feb 16, 2024 at 04:57:22PM -0800, Atish Patra wrote:
> Add the S[m|s]csrind ISA extension description.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  .../devicetree/bindings/riscv/extensions.yaml      | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
> index 63d81dc895e5..77a9f867e36b 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -134,6 +134,20 @@ properties:
>              added by other RISC-V extensions in H/S/VS/U/VU modes and as
>              ratified at commit a28bfae (Ratified (#7)) of riscv-state-enable.
>  
> +	- const: smcsrind
> +          description: |
> +            The standard Smcsrind supervisor-level extension extends the

The indentation here looks weird.

> +	    indirect CSR access mechanism defined by the Smaia extension. This
> +	    extension allows other ISA extension to use indirect CSR access
> +	    mechanism in M-mode.

For this, and the other patches in the series, I want a reference to the
frozen/ratified point for these extensions. See the rest of this file
for examples.

Cheers,
Conor.

> +
> +	- const: sscsrind
> +          description: |
> +            The standard Sscsrind supervisor-level extension extends the
> +	    indirect CSR access mechanism defined by the Ssaia extension. This
> +	    extension allows other ISA extension to use indirect CSR access
> +	    mechanism in S-mode.
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
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20240218/ebfbbc24/attachment.sig>
