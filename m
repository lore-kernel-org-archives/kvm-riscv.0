From: Stefan O'Rear <sorear@fastmail.com>
Date: Wed, 27 Sep 2023 13:24:03 -0400
Subject: [PATCH v2 2/3] dt-bindings: riscv: Add Svadu Entry
In-Reply-To: <20230922085701.3164-3-yongxuan.wang@sifive.com>
References: <20230922085701.3164-1-yongxuan.wang@sifive.com>
 <20230922085701.3164-3-yongxuan.wang@sifive.com>
Message-ID: <d141062b-e3e0-45ce-bc61-3404417c7d7c@app.fastmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Sep 22, 2023, at 4:56 AM, Yong-Xuan Wang wrote:
> Add an entry for the Svadu extension to the riscv,isa-extensions property.
>
> Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
> ---
>  Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml 
> b/Documentation/devicetree/bindings/riscv/extensions.yaml
> index cc1f546fdbdc..b5a0aed0165b 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -147,6 +147,12 @@ properties:
>              ratified at commit 3f9ed34 ("Add ability to manually 
> trigger
>              workflow. (#2)") of riscv-time-compare.
> 
> +        - const: svadu
> +          description: |
> +            The standard Svadu supervisor-level extension for hardware updating
> +            of PTE A/D bits as frozen at commit b65e07c ("move to Frozen
> +            state") of riscv-svadu.
> +

This is incomplete without a specification of the behavior of the HADE bit implied
by svadu being present.

The ratified RVA20 requires page table accesses with A/D = 0 to trap, in other
words HADE = 0 for RVA20 conformance.  If we are serious about compatibility,
I think that we need platforms to be able to conform to both RVA20 and RVA23,
which requires HADE = 0 at kernel entry with a SBI call to set HADE = 1.  For
the same reason KVM should probably default to HADE = 0 so that the default
configuration remains conformant to RVA20.

-s

>          - const: svinval
>            description:
>              The standard Svinval supervisor-level extension for fine-grained
> -- 
> 2.17.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

