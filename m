From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Wed, 27 Sep 2023 19:44:32 +0100
Subject: [PATCH v2 2/3] dt-bindings: riscv: Add Svadu Entry
In-Reply-To: <d141062b-e3e0-45ce-bc61-3404417c7d7c@app.fastmail.com>
References: <20230922085701.3164-1-yongxuan.wang@sifive.com>
 <20230922085701.3164-3-yongxuan.wang@sifive.com>
 <d141062b-e3e0-45ce-bc61-3404417c7d7c@app.fastmail.com>
Message-ID: <55289FD5-55F7-4EE6-BBCC-933B32770A95@jrtc27.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 27 Sep 2023, at 18:24, Stefan O'Rear <sorear@fastmail.com> wrote:
> 
> On Fri, Sep 22, 2023, at 4:56 AM, Yong-Xuan Wang wrote:
>> Add an entry for the Svadu extension to the riscv,isa-extensions property.
>> 
>> Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
>> ---
>> Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
>> 1 file changed, 6 insertions(+)
>> 
>> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml 
>> b/Documentation/devicetree/bindings/riscv/extensions.yaml
>> index cc1f546fdbdc..b5a0aed0165b 100644
>> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
>> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
>> @@ -147,6 +147,12 @@ properties:
>>             ratified at commit 3f9ed34 ("Add ability to manually 
>> trigger
>>             workflow. (#2)") of riscv-time-compare.
>> 
>> +        - const: svadu
>> +          description: |
>> +            The standard Svadu supervisor-level extension for hardware updating
>> +            of PTE A/D bits as frozen at commit b65e07c ("move to Frozen
>> +            state") of riscv-svadu.
>> +
> 
> This is incomplete without a specification of the behavior of the HADE bit implied
> by svadu being present.
> 
> The ratified RVA20 requires page table accesses with A/D = 0 to trap, in other
> words HADE = 0 for RVA20 conformance.  If we are serious about compatibility,
> I think that we need platforms to be able to conform to both RVA20 and RVA23,
> which requires HADE = 0 at kernel entry with a SBI call to set HADE = 1.  For
> the same reason KVM should probably default to HADE = 0 so that the default
> configuration remains conformant to RVA20.

I?ve filed https://github.com/riscv/riscv-svadu/issues/21 to track this
broken ISA design, as discussed on IRC.

As a FreeBSD RISC-V developer, and sometime reviewer of Linux RISC-V
patches, this is a NAK from me for this ISA design. Which does beg the
question of how much sense the current RISC-V processes make, given for
freezing a spec you just need to send out the relevant RFC patches,
they don?t actually need to have any review from the project in
question that says it?s a sensible design, instead treating that as
part of the public review period, where it?s much harder to
fundamentally change the spec, despite being the first time most people
see it or take it seriously as a thing to look at. In my opinion there
is a serious need for knowledgeable people on the software side to
review the ISA extension and its interaction with software *before* it
can be frozen so that these things can be fixed. And of course, if they
do get fixed during/after public review, what good is the frozen state
anyway, because a spec that changes is not very frozen.

But I?m probably preaching to the choir here about RISC-V processes
being unfit for purpose.

Jess

>>         - const: svinval
>>           description:
>>             The standard Svinval supervisor-level extension for fine-grained
>> -- 
>> 2.17.1
>> 
>> 
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv at lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv



