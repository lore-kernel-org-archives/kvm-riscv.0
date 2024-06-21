From: Alexandre Ghiti <alex@ghiti.fr>
Date: Fri, 21 Jun 2024 09:56:05 +0200
Subject: [PATCH v5 2/4] dt-bindings: riscv: Add Svade and Svadu Entries
In-Reply-To: <20240605121512.32083-3-yongxuan.wang@sifive.com>
References: <20240605121512.32083-1-yongxuan.wang@sifive.com>
 <20240605121512.32083-3-yongxuan.wang@sifive.com>
Message-ID: <1ade7f97-d837-428d-b056-f0a3121b0c71@ghiti.fr>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 05/06/2024 14:15, Yong-Xuan Wang wrote:
> Add entries for the Svade and Svadu extensions to the riscv,isa-extensions
> property.
>
> Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
> ---
>   .../devicetree/bindings/riscv/extensions.yaml | 30 +++++++++++++++++++
>   1 file changed, 30 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
> index 468c646247aa..1e30988826b9 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -153,6 +153,36 @@ properties:
>               ratified at commit 3f9ed34 ("Add ability to manually trigger
>               workflow. (#2)") of riscv-time-compare.
>   
> +        - const: svade
> +          description: |
> +            The standard Svade supervisor-level extension for raising page-fault
> +            exceptions when PTE A/D bits need be set


Maybe something like:

"The standard Svade supervisor-level extension for SW-managed PTE A/D 
bit updates as ratified..."

would be better, WDYT?


> as ratified in the 20240213
> +            version of the privileged ISA specification.
> +
> +            Both Svade and Svadu extensions control the hardware behavior when
> +            the PTE A/D bits need to be set. The default behavior for the four
> +            possible combinations of these extensions in the device tree are:
> +            1. Neither svade nor svadu in DT: default to svade.
> +            2. Only svade in DT: use svade.
> +            3. Only svadu in DT: use svadu.
> +            4. Both svade and svadu in DT: default to svade (Linux can switch to
> +               svadu once the SBI FWFT extension is available).
> +
> +        - const: svadu
> +          description: |
> +            The standard Svadu supervisor-level extension for hardware updating
> +            of PTE A/D bits as ratified at commit c1abccf ("Merge pull request
> +            #25 from ved-rivos/ratified") of riscv-svadu.
> +
> +            Both Svade and Svadu extensions control the hardware behavior when
> +            the PTE A/D bits need to be set. The default behavior for the four
> +            possible combinations of these extensions in the device tree are:
> +            1. Neither svade nor svadu in DT: default to svade.
> +            2. Only svade in DT: use svade.
> +            3. Only svadu in DT: use svadu.
> +            4. Both svade and svadu in DT: default to svade (Linux can switch to
> +               svadu once the SBI FWFT extension is available).


I would not duplicate this text, but rather say something like "Please 
refer to Svade dt-binding description for more details.".


> +
>           - const: svinval
>             description:
>               The standard Svinval supervisor-level extension for fine-grained

