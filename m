From: Conor Dooley <conor@kernel.org>
Date: Fri, 21 Jul 2023 10:07:37 +0100
Subject: [PATCH v2 1/6] RISC-V: Detect Smstateen extension
In-Reply-To: <20230721-72554b5197954b80af35a7bb@orel>
References: <20230721075439.454473-1-mchitale@ventanamicro.com>
 <20230721075439.454473-2-mchitale@ventanamicro.com>
 <20230721-72554b5197954b80af35a7bb@orel>
Message-ID: <20230721-gravy-sturdy-1555d952cfb9@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hey,

On Fri, Jul 21, 2023 at 10:49:54AM +0200, Andrew Jones wrote:
> On Fri, Jul 21, 2023 at 01:24:34PM +0530, Mayuresh Chitale wrote:
> > Extend the ISA string parsing to detect the Smstateen extension
> > 
> > Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> > ---
> >  Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
> >  arch/riscv/include/asm/hwcap.h                          | 1 +
> >  arch/riscv/kernel/cpu.c                                 | 1 +
> >  arch/riscv/kernel/cpufeature.c                          | 1 +
> >  4 files changed, 9 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > index cc1f546fdbdc..1e6d0e182be1 100644
> > --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> > +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > @@ -128,6 +128,12 @@ properties:
> >              changes to interrupts as frozen at commit ccbddab ("Merge pull
> >              request #42 from riscv/jhauser-2023-RC4") of riscv-aia.
> >  
> > +        - const: smstateen
> > +          description: |
> > +            The standard Smstateen extension for controlling accesss to CSRs
>                                                                 ^ access
> 
> > +            added by other Risc-V extensions in H/S/VS/U/VU modes and as

s/Risc-V/RISC-V/. Let's not invent new stylisations please.

> s/and//
> 
> > +            ratified at commit a28bfae (Ratified (#7)).

An "of riscv-state-enable" at the end might be helpful too.

Either way, neither checkpatch nor get_maintainer were run on this v2
patch, the former would have pointed out that dt-binding changes should
be made in their own patches.

The C stuff is fine, but this needs to be split in two.

Thanks,
Conor.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230721/4cb9343d/attachment.sig>
