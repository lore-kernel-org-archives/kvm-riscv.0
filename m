From: Conor Dooley <conor@kernel.org>
Date: Wed, 17 Apr 2024 14:11:58 +0100
Subject: [PATCH 07/10] riscv: add ISA extension parsing for Zcmop
In-Reply-To: <1eab3b4f-0d46-4df5-b574-6a5f796d3bcf@rivosinc.com>
References: <20240410-jawless-cavalry-a3eaf9c562a4@spud>
 <20240410-judgingly-appease-5df493852b70@spud>
 <ZhcTiakvfbjb2hon@debug.ba.rivosinc.com>
 <1287e6e9-cb8e-4a78-9195-ce29f1c4bace@rivosinc.com>
 <20240411-superglue-errant-b32e5118695f@wendy>
 <c86f9fa8-e273-4509-83fa-f21d3265d5c9@rivosinc.com>
 <20240411-backwater-opal-00c9aed2231e@wendy>
 <5eda3278-24bc-4c17-a741-523ad5ff79f7@rivosinc.com>
 <20240416-gave-apron-3234098ce416@spud>
 <1eab3b4f-0d46-4df5-b574-6a5f796d3bcf@rivosinc.com>
Message-ID: <20240417-smelting-rascal-d19dec72e0a5@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Apr 16, 2024 at 05:23:51PM +0200, Cl?ment L?ger wrote:
> 
> 
> On 16/04/2024 16:54, Conor Dooley wrote:
> > On Mon, Apr 15, 2024 at 11:10:24AM +0200, Cl?ment L?ger wrote:
> >>
> >>
> >> On 11/04/2024 13:53, Conor Dooley wrote:
> >>> On Thu, Apr 11, 2024 at 11:08:21AM +0200, Cl?ment L?ger wrote:
> >>>>>> If we consider to have potentially broken isa string (ie extensions
> >>>>>> dependencies not correctly handled), then we'll need some way to
> >>>>>> validate this within the kernel.
> >>>>>
> >>>>> No, the DT passed to the kernel should be correct and we by and large we
> >>>>> should not have to do validation of it. What I meant above was writing
> >>>>> the binding so that something invalid will not pass dtbs_check.
> >>>>
> >>>> Acked, I was mainly answering Deepak question about dependencies wrt to
> >>>> using __RISCV_ISA_EXT_SUPERSET() which does not seems to be relevant
> >>>> since we expect a correct isa string to be passed.
> >>>
> >>> Ahh, okay.
> >>>
> >>>> But as you stated, DT
> >>>> validation clearly make sense. I think a lot of extensions strings would
> >>>> benefit such support (All the Zv* depends on V, etc).
> >>>
> >>> I think it is actually as simple something like this, which makes it
> >>> invalid to have "d" without "f":
> >>>
> >>> | diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
> >>> | index 468c646247aa..594828700cbe 100644
> >>> | --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> >>> | +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> >>> | @@ -484,5 +484,20 @@ properties:
> >>> |              Registers in the AX45MP datasheet.
> >>> |              https://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-5.0.0-Datasheet.pdf
> >>> |  
> >>> | +allOf:
> >>> | +  - if:
> >>> | +      properties:
> >>> | +        riscv,isa-extensions:
> >>> | +          contains:
> >>> | +            const: "d"
> >>> | +          not:
> >>> | +            contains:
> >>> | +              const: "f"
> >>> | +    then:
> >>> | +      properties:
> >>> | +        riscv,isa-extensions:
> >>> | +          false
> >>> | +
> >>> | +
> >>> |  additionalProperties: true
> >>> |  ...
> >>>
> >>> If you do have d without f, the checker will say:
> >>> cpu at 2: riscv,isa-extensions: False schema does not allow ['i', 'm', 'a', 'd', 'c']
> >>>
> >>> At least that's readable, even though not clear about what to do. I wish
> >>
> >> That looks really readable indeed but the messages that result from
> >> errors are not so informative.
> >>
> >> It tried playing with various constructs and found this one to yield a
> >> comprehensive message:
> >>
> >> +allOf:
> >> +  - if:
> >> +      properties:
> >> +        riscv,isa-extensions:
> >> +          contains:
> >> +            const: zcf
> >> +          not:
> >> +            contains:
> >> +              const: zca
> >> +    then:
> >> +      properties:
> >> +        riscv,isa-extensions:
> >> +          items:
> >> +            anyOf:
> >> +              - const: zca
> >>
> >> arch/riscv/boot/dts/allwinner/sun20i-d1-dongshan-nezha-stu.dtb: cpu at 0:
> >> riscv,isa-extensions:10: 'anyOf' conditional failed, one must be fixed:
> >>         'zca' was expected
> >>         from schema $id: http://devicetree.org/schemas/riscv/extensions.yaml
> >>
> >> Even though dt-bindings-check passed, not sure if this is totally a
> >> valid construct though...
> > 
> > I asked Rob about this yesterday, he suggested adding:
> > riscv,isa-extensions:
> >   if:
> >     contains:
> >       const: zcf
> >   then:
> >     contains:
> >       const: zca
> 
> That is way more readable and concise !
> 
> > to the existing property, not in an allOf. I think that is by far the
> > most readable version in terms of what goes into the binding. The output
> > would look like:
> > cpu at 0: riscv,isa-extensions: ['i', 'm', 'a', 'd', 'c'] does not contain items matching the given schema
> > (for d requiring f cos I am lazy)
> 
> Than fine by me. The error is at least a bit more understandable than
> the one with the false schema ;)
> 
> > 
> > Also, his comment about your one that gives the nice message was that it
> > would wrong as the anyOf was pointless and it says all items must be
> > "zca".
> 
> That's what I understood also.
> 
> > I didn't try it, but I have a feeling your nice output will be
> > rather less nice if several different deps are unmet - but hey, probably
> > will still be better than having an undocumented extension!
> > 
> 
> If you are ok with that, let's go with Rob suggestion. I'll resubmit a
> V2 with validation for these extensions and probably a followup for the
> other ones lacking dependency checking.

Also, Rob made some modifications to dt-schema yesterday, so now the
report about an undocumented extension looks like:
cpu at 1: riscv,isa-extensions:3: '0' is not one of ['i', 'm', 'a', 'f', 'd', 'q', 'c', 'v', 'h', 'smaia', 'smstateen', 'ssaia', 'sscofpmf', 'sstc', 'svinval', 'svnapot', 'svpbmt', 'zacas', 'zba', 'zbb', 'zbc', 'zbkb', 'zbkc', 'zbkx', 'zbs', 'zfa', 'zfh', 'zfhmin', 'zk', 'zkn', 'zknd', 'zkne', 'zknh', 'zkr', 'zks', 'zksed', 'zksh', 'zkt', 'zicbom', 'zicbop', 'zicboz', 'zicntr', 'zicond', 'zicsr', 'zifencei', 'zihintpause', 'zihintntl', 'zihpm', 'ztso', 'zvbb', 'zvbc', 'zvfh', 'zvfhmin', 'zvkb', 'zvkg', 'zvkn', 'zvknc', 'zvkned', 'zvkng', 'zvknha', 'zvknhb', 'zvks', 'zvksc', 'zvksed', 'zvksh', 'zvksg', 'zvkt', 'xandespmu']
instead of
cpu at 0: riscv,isa-extensions:4: 'anyOf' conditional failed, one must be fixed:
	'i' was expected
	'm' was expected
	'a' was expected
	'f' was expected
	'd' was expected
	'q' was expected
	'c' was expected
	'v' was expected
	'h' was expected
	'smaia' was expected
	'smstateen' was expected
	'ssaia' was expected
	'sscofpmf' was expected
	'sstc' was expected
	'svinval' was expected
	'svnapot' was expected
	'svpbmt' was expected
	'zacas' was expected
	'zba' was expected
	'zbb' was expected
	'zbc' was expected
	'zbkb' was expected
	'zbkc' was expected
	'zbkx' was expected
	'zbs' was expected
	'zfa' was expected
	'zfh' was expected
	'zfhmin' was expected
	'zk' was expected
	'zkn' was expected
	'zknd' was expected
	'zkne' was expected
	'zknh' was expected
	'zkr' was expected
	'zks' was expected
	'zksed' was expected
	'zksh' was expected
	'zkt' was expected
	'zicbom' was expected
	'zicbop' was expected
	'zicboz' was expected
	'zicntr' was expected
	'zicond' was expected
	'zicsr' was expected
	'zifencei' was expected
	'zihintpause' was expected
	'zihintntl' was expected
	'zihpm' was expected
	'ztso' was expected
	'zvbb' was expected
	'zvbc' was expected
	'zvfh' was expected
	'zvfhmin' was expected
	'zvkb' was expected
	'zvkg' was expected
	'zvkn' was expected
	'zvknc' was expected
	'zvkned' was expected
	'zvkng' was expected
	'zvknha' was expected
	'zvknhb' was expected
	'zvks' was expected
	'zvksc' was expected
	'zvksed' was expected
	'zvksh' was expected
	'zvksg' was expected
	'zvkt' was expected
	'xandespmu' was expected
	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml#

Which is really great from a readability pov. Not only is it compressed
to a single line, it actually points out which extension is the
offender.

Thanks,
Conor.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20240417/69127d0e/attachment-0001.sig>
