From: Clément Léger <cleger@rivosinc.com>
Date: Wed, 22 May 2024 09:20:09 +0200
Subject: [PATCH v5 08/16] riscv: add ISA parsing for Zca, Zcf, Zcd and Zcb
In-Reply-To: <20240521-spiny-undergrad-efa1a391ad3d@spud>
References: <20240517145302.971019-1-cleger@rivosinc.com>
 <20240517145302.971019-9-cleger@rivosinc.com>
 <20240521-spiny-undergrad-efa1a391ad3d@spud>
Message-ID: <de2c9064-bb01-42b2-9c0f-884dcabf7c40@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 21/05/2024 21:49, Conor Dooley wrote:
> On Fri, May 17, 2024 at 04:52:48PM +0200, Cl?ment L?ger wrote:
> 
>> +static int riscv_ext_zca_depends(const struct riscv_isa_ext_data *data,
>> +				 const unsigned long *isa_bitmap)
>> +{
>> +	return __riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_ZCA) ? 0 : -EPROBE_DEFER;
>> +}
>> +static int riscv_ext_zcd_validate(const struct riscv_isa_ext_data *data,
>> +				  const unsigned long *isa_bitmap)
>> +{
>> +	return __riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_ZCA) &&
>> +	       __riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_d) ? 0 : -EPROBE_DEFER;
>> +}
> 
> Could you write the logic in these out normally please? I think they'd
> be more understandable (particular this second one) broken down and with
> early return.

Yes sure. I'll probably make the same thing for zcf_validate as well as
removing the #ifdef and using IS_ENABLED():

static int riscv_ext_zcf_validate(const struct riscv_isa_ext_data *data,
				  const unsigned long *isa_bitmap)
{
	if (IS_ENABLED(CONFIG_64BIT))
		return -EINVAL;

	if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_ZCA) &&
	    __riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_f))
	       return 0;

	return -EPROBE_DEFER;
}

> 
> Otherwise,
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> 
> Cheers,
> Conor.

