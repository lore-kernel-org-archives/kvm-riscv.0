From: Clément Léger <cleger@rivosinc.com>
Date: Wed, 24 Apr 2024 09:20:35 +0200
Subject: [RFC PATCH 2/7] dt-bindings: riscv: add Ssdbltrp ISA extension
 description
In-Reply-To: <20240423-poser-splashed-56ab5340af48@spud>
References: <20240418142701.1493091-1-cleger@rivosinc.com>
 <20240418142701.1493091-3-cleger@rivosinc.com>
 <20240423-poser-splashed-56ab5340af48@spud>
Message-ID: <e39f2fea-868a-4a79-b7a5-bef8f15de688@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 23/04/2024 18:30, Conor Dooley wrote:
> On Thu, Apr 18, 2024 at 04:26:41PM +0200, Cl?ment L?ger wrote:
>> Add description for the Ssdbltrp ISA extension which is not yet
>> ratified.
>>
>> Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
>> ---
>>  Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
>> index 63d81dc895e5..ce7021dbb556 100644
>> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
>> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
>> @@ -147,6 +147,12 @@ properties:
>>              and mode-based filtering as ratified at commit 01d1df0 ("Add ability
>>              to manually trigger workflow. (#2)") of riscv-count-overflow.
>>  
>> +        - const: ssdbltrp
>> +          description: |
>> +            The standard Ssdbltrp supervisor-level extension for double trap
>> +            handling as currently defined by commit e85847b ("Merge pull request
>> +            #32 from ved-rivos/0415_1 ") of riscv-double-trap.
> 
> I see the proposed ratification for this is Sept 2024, and is marked as
> "Freeze Approved". Do you know when it is going to be frozen? Until
> this, I can't ack this patch. I had a look in the RVI JIRA
> https://jira.riscv.org/browse/RVS-2291?src=confmacro
> and it looks imminent, but it's unclear to me whether it actually has
> been or not.

Hi Conor,

Yeah, this series is a RFC since the spec is not yet ratified nor frozen
and its purpose is actually to get to a frozen state. As to when this
will be ratified, I guess Ved can probably answer that.

Cl?ment

> 
>> +
>>          - const: sstc
>>            description: |
>>              The standard Sstc supervisor-level extension for time compare as
>> -- 
>> 2.43.0
>>

