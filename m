From: Conor Dooley <conor.dooley@microchip.com>
Date: Thu, 11 Apr 2024 12:53:43 +0100
Subject: [PATCH 07/10] riscv: add ISA extension parsing for Zcmop
In-Reply-To: <c86f9fa8-e273-4509-83fa-f21d3265d5c9@rivosinc.com>
References: <20240410091106.749233-1-cleger@rivosinc.com>
 <20240410091106.749233-8-cleger@rivosinc.com>
 <ZhcFeVYUQJmBAKuv@debug.ba.rivosinc.com>
 <20240410-jawless-cavalry-a3eaf9c562a4@spud>
 <20240410-judgingly-appease-5df493852b70@spud>
 <ZhcTiakvfbjb2hon@debug.ba.rivosinc.com>
 <1287e6e9-cb8e-4a78-9195-ce29f1c4bace@rivosinc.com>
 <20240411-superglue-errant-b32e5118695f@wendy>
 <c86f9fa8-e273-4509-83fa-f21d3265d5c9@rivosinc.com>
Message-ID: <20240411-backwater-opal-00c9aed2231e@wendy>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Apr 11, 2024 at 11:08:21AM +0200, Cl?ment L?ger wrote:
> >> If we consider to have potentially broken isa string (ie extensions
> >> dependencies not correctly handled), then we'll need some way to
> >> validate this within the kernel.
> > 
> > No, the DT passed to the kernel should be correct and we by and large we
> > should not have to do validation of it. What I meant above was writing
> > the binding so that something invalid will not pass dtbs_check.
> 
> Acked, I was mainly answering Deepak question about dependencies wrt to
> using __RISCV_ISA_EXT_SUPERSET() which does not seems to be relevant
> since we expect a correct isa string to be passed.

Ahh, okay.

> But as you stated, DT
> validation clearly make sense. I think a lot of extensions strings would
> benefit such support (All the Zv* depends on V, etc).

I think it is actually as simple something like this, which makes it
invalid to have "d" without "f":

| diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
| index 468c646247aa..594828700cbe 100644
| --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
| +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
| @@ -484,5 +484,20 @@ properties:
|              Registers in the AX45MP datasheet.
|              https://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-5.0.0-Datasheet.pdf
|  
| +allOf:
| +  - if:
| +      properties:
| +        riscv,isa-extensions:
| +          contains:
| +            const: "d"
| +          not:
| +            contains:
| +              const: "f"
| +    then:
| +      properties:
| +        riscv,isa-extensions:
| +          false
| +
| +
|  additionalProperties: true
|  ...

If you do have d without f, the checker will say:
cpu at 2: riscv,isa-extensions: False schema does not allow ['i', 'm', 'a', 'd', 'c']

At least that's readable, even though not clear about what to do. I wish
the former could be said about the wall of text you get for /each/
undocumented entry in the string.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20240411/2a9bef48/attachment.sig>
