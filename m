From: Clément Léger <cleger@rivosinc.com>
Date: Tue, 16 Apr 2024 17:23:51 +0200
Subject: [PATCH 07/10] riscv: add ISA extension parsing for Zcmop
In-Reply-To: <20240416-gave-apron-3234098ce416@spud>
References: <20240410091106.749233-8-cleger@rivosinc.com>
 <ZhcFeVYUQJmBAKuv@debug.ba.rivosinc.com>
 <20240410-jawless-cavalry-a3eaf9c562a4@spud>
 <20240410-judgingly-appease-5df493852b70@spud>
 <ZhcTiakvfbjb2hon@debug.ba.rivosinc.com>
 <1287e6e9-cb8e-4a78-9195-ce29f1c4bace@rivosinc.com>
 <20240411-superglue-errant-b32e5118695f@wendy>
 <c86f9fa8-e273-4509-83fa-f21d3265d5c9@rivosinc.com>
 <20240411-backwater-opal-00c9aed2231e@wendy>
 <5eda3278-24bc-4c17-a741-523ad5ff79f7@rivosinc.com>
 <20240416-gave-apron-3234098ce416@spud>
Message-ID: <1eab3b4f-0d46-4df5-b574-6a5f796d3bcf@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 16/04/2024 16:54, Conor Dooley wrote:
> On Mon, Apr 15, 2024 at 11:10:24AM +0200, Cl?ment L?ger wrote:
>>
>>
>> On 11/04/2024 13:53, Conor Dooley wrote:
>>> On Thu, Apr 11, 2024 at 11:08:21AM +0200, Cl?ment L?ger wrote:
>>>>>> If we consider to have potentially broken isa string (ie extensions
>>>>>> dependencies not correctly handled), then we'll need some way to
>>>>>> validate this within the kernel.
>>>>>
>>>>> No, the DT passed to the kernel should be correct and we by and large we
>>>>> should not have to do validation of it. What I meant above was writing
>>>>> the binding so that something invalid will not pass dtbs_check.
>>>>
>>>> Acked, I was mainly answering Deepak question about dependencies wrt to
>>>> using __RISCV_ISA_EXT_SUPERSET() which does not seems to be relevant
>>>> since we expect a correct isa string to be passed.
>>>
>>> Ahh, okay.
>>>
>>>> But as you stated, DT
>>>> validation clearly make sense. I think a lot of extensions strings would
>>>> benefit such support (All the Zv* depends on V, etc).
>>>
>>> I think it is actually as simple something like this, which makes it
>>> invalid to have "d" without "f":
>>>
>>> | diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
>>> | index 468c646247aa..594828700cbe 100644
>>> | --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
>>> | +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
>>> | @@ -484,5 +484,20 @@ properties:
>>> |              Registers in the AX45MP datasheet.
>>> |              https://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-5.0.0-Datasheet.pdf
>>> |  
>>> | +allOf:
>>> | +  - if:
>>> | +      properties:
>>> | +        riscv,isa-extensions:
>>> | +          contains:
>>> | +            const: "d"
>>> | +          not:
>>> | +            contains:
>>> | +              const: "f"
>>> | +    then:
>>> | +      properties:
>>> | +        riscv,isa-extensions:
>>> | +          false
>>> | +
>>> | +
>>> |  additionalProperties: true
>>> |  ...
>>>
>>> If you do have d without f, the checker will say:
>>> cpu at 2: riscv,isa-extensions: False schema does not allow ['i', 'm', 'a', 'd', 'c']
>>>
>>> At least that's readable, even though not clear about what to do. I wish
>>
>> That looks really readable indeed but the messages that result from
>> errors are not so informative.
>>
>> It tried playing with various constructs and found this one to yield a
>> comprehensive message:
>>
>> +allOf:
>> +  - if:
>> +      properties:
>> +        riscv,isa-extensions:
>> +          contains:
>> +            const: zcf
>> +          not:
>> +            contains:
>> +              const: zca
>> +    then:
>> +      properties:
>> +        riscv,isa-extensions:
>> +          items:
>> +            anyOf:
>> +              - const: zca
>>
>> arch/riscv/boot/dts/allwinner/sun20i-d1-dongshan-nezha-stu.dtb: cpu at 0:
>> riscv,isa-extensions:10: 'anyOf' conditional failed, one must be fixed:
>>         'zca' was expected
>>         from schema $id: http://devicetree.org/schemas/riscv/extensions.yaml
>>
>> Even though dt-bindings-check passed, not sure if this is totally a
>> valid construct though...
> 
> I asked Rob about this yesterday, he suggested adding:
> riscv,isa-extensions:
>   if:
>     contains:
>       const: zcf
>   then:
>     contains:
>       const: zca

That is way more readable and concise !

> to the existing property, not in an allOf. I think that is by far the
> most readable version in terms of what goes into the binding. The output
> would look like:
> cpu at 0: riscv,isa-extensions: ['i', 'm', 'a', 'd', 'c'] does not contain items matching the given schema
> (for d requiring f cos I am lazy)

Than fine by me. The error is at least a bit more understandable than
the one with the false schema ;)

> 
> Also, his comment about your one that gives the nice message was that it
> would wrong as the anyOf was pointless and it says all items must be
> "zca".

That's what I understood also.

> I didn't try it, but I have a feeling your nice output will be
> rather less nice if several different deps are unmet - but hey, probably
> will still be better than having an undocumented extension!
> 

If you are ok with that, let's go with Rob suggestion. I'll resubmit a
V2 with validation for these extensions and probably a followup for the
other ones lacking dependency checking.

Thanks,

Cl?ment

