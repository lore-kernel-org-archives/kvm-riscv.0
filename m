From: Conor Dooley <conor.dooley@microchip.com>
Date: Mon, 22 Apr 2024 12:19:36 +0100
Subject: [PATCH v2 03/12] dt-bindings: riscv: add Zc* extension rules
 implied by C extension
In-Reply-To: <f89c79f7-a09e-4fcf-8e16-0875202ade4a@rivosinc.com>
References: <20240418124300.1387978-1-cleger@rivosinc.com>
 <20240418124300.1387978-4-cleger@rivosinc.com>
 <20240419-blinked-timid-da722ec6ddc4@spud>
 <f89c79f7-a09e-4fcf-8e16-0875202ade4a@rivosinc.com>
Message-ID: <20240422-stumbling-aliens-b408eebe1f32@wendy>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Apr 22, 2024 at 10:53:04AM +0200, Cl?ment L?ger wrote:
> On 19/04/2024 17:49, Conor Dooley wrote:
> > On Thu, Apr 18, 2024 at 02:42:26PM +0200, Cl?ment L?ger wrote:
> >> As stated by Zc* spec:
> >>
> >> "As C defines the same instructions as Zca, Zcf and Zcd, the rule is that:
> >>  - C always implies Zca
> >>  - C+F implies Zcf (RV32 only)
> >>  - C+D implies Zcd"
> >>
> >> Add additionnal validation rules to enforce this in dts.
> > 
> > I'll get it out of the way: NAK, and the dts patch is the perfect
> > example of why. I don't want us to have to continually update
> > devicetrees. If these are implied due to being subsets of other
> > extensions, then software should be able to enable them when that
> > other extension is present.
> 
> Acked.
> 
> > 
> > My fear is that, and a quick look at the "add probing" commit seemed to
> > confirm it, new subsets would require updates to the dts, even though
> > the existing extension is perfectly sufficient to determine presence.
> > 
> > I definitely want to avoid continual updates to the devicetree for churn
> > reasons whenever subsets are added, but not turning on the likes of Zca
> > when C is present because "the bindings were updated to enforce this"
> > is a complete blocker. I do concede that having two parents makes that
> > more difficult and will likely require some changes to how we probe - do
> > we need to have a "second round" type thing?
> 
> Yeah, I understand. At first, I actually did the modifications in the
> ISA probing loop with some dependency probing (ie loop while we don't
> have a stable extension state). But I thought that it was not actually
> our problem but rather the ISA string provider. For instance, Qemu
> provides them.


A newer version of QEMU might, but not all do, so I'm not sure that using
it is a good example. My expectations is that a devicetree will be written
to the standards of the day and not be updated as subsets are released.

If this were the first instance of a superset/bundle I'd be prepared to
accept an argument that we should not infer anything - but it's not and
we'd be introducing inconsistency with the crypto stuff. I know that both
scenarios are different in terms of extension history given that this is
splitting things into a subset and that was a superset/bundle created at
the same time, but they're not really that different in terms of the
DT/ACPI to user "interface".

> > Taking Zcf as an example, maybe something like making both of C and F into
> > "standard" supersets and adding a case to riscv_isa_extension_check()
> > that would mandate that Zca and F are enabled before enabling it, and we
> > would ensure that C implies Zca before it implies Zcf?
> 
> I'm afraid that riscv_isa_extension_check() will become a rat nest so
> rather than going that way, I would be in favor of adding a validation
> callback for the extensions if needed.

IOW, extension check split out per extension moving to be a callback?

> > Given we'd be relying on ordering, we have to perform the same implication
> > for both F and C and make sure that the "implies" struct has Zca before Zcf.
> > I don't really like that suggestion, hopefully there's a nicer way of doing
> > that, but I don't like the dt stuff here.
> 
> I guess the "cleanest" way would be to have some "defered-like"
> mechanism in ISA probing which would allow to handle ordering as well as
> dependencies/implies for extensions. For Zca, Zcf, we actually do not
> have ordering problems but I think it would be a bit broken not to
> support that as well.

We could, I suppose, enable all detected extensions on a CPU and run the
aforemention callback, disabling them if conditions are not met?

Is that something like what you're suggesting?
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20240422/e59472a7/attachment.sig>
