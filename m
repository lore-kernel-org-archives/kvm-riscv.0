From: Clément Léger <cleger@rivosinc.com>
Date: Tue, 4 Jun 2024 09:18:25 +0200
Subject: [PATCH v5 08/16] riscv: add ISA parsing for Zca, Zcf, Zcd and Zcb
In-Reply-To: <mhng-d5016935-99b6-4dc6-bbd2-ed84eb834f98@palmer-ri-x1c9a>
References: <mhng-d5016935-99b6-4dc6-bbd2-ed84eb834f98@palmer-ri-x1c9a>
Message-ID: <06d8ae43-4aad-4637-a33b-9bae91b23872@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 30/05/2024 23:13, Palmer Dabbelt wrote:
> On Wed, 22 May 2024 00:20:09 PDT (-0700), cleger at rivosinc.com wrote:
>>
>>
>> On 21/05/2024 21:49, Conor Dooley wrote:
>>> On Fri, May 17, 2024 at 04:52:48PM +0200, Cl?ment L?ger wrote:
>>>
>>>> +static int riscv_ext_zca_depends(const struct riscv_isa_ext_data
>>>> *data,
>>>> +???????????????? const unsigned long *isa_bitmap)
>>>> +{
>>>> +??? return __riscv_isa_extension_available(isa_bitmap,
>>>> RISCV_ISA_EXT_ZCA) ? 0 : -EPROBE_DEFER;
>>>> +}
>>>> +static int riscv_ext_zcd_validate(const struct riscv_isa_ext_data
>>>> *data,
>>>> +????????????????? const unsigned long *isa_bitmap)
>>>> +{
>>>> +??? return __riscv_isa_extension_available(isa_bitmap,
>>>> RISCV_ISA_EXT_ZCA) &&
>>>> +?????????? __riscv_isa_extension_available(isa_bitmap,
>>>> RISCV_ISA_EXT_d) ? 0 : -EPROBE_DEFER;
>>>> +}
>>>
>>> Could you write the logic in these out normally please? I think they'd
>>> be more understandable (particular this second one) broken down and with
>>> early return.
>>
>> Yes sure. I'll probably make the same thing for zcf_validate as well as
>> removing the #ifdef and using IS_ENABLED():
>>
>> static int riscv_ext_zcf_validate(const struct riscv_isa_ext_data *data,
>> ????????????????? const unsigned long *isa_bitmap)
>> {
>> ????if (IS_ENABLED(CONFIG_64BIT))
>> ??????? return -EINVAL;
>>
>> ????if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_ZCA) &&
>> ??????? __riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_f))
>> ?????????? return 0;
>>
>> ????return -EPROBE_DEFER;
>> }
> 
> Are you going to send a v6 (sorry if I missed it, I'm trying to untangle
> all these ISA parsing patch sets).

Yes, I was waiting for more feedback/Rb by it seems like I now have
everything I need. I'll send that.

Thanks,

Cl?ment

> 
>>
>>>
>>> Otherwise,
>>> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>>>
>>> Cheers,
>>> Conor.

