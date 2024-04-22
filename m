From: Clément Léger <cleger@rivosinc.com>
Date: Mon, 22 Apr 2024 10:53:10 +0200
Subject: [PATCH v2 04/12] riscv: add ISA parsing for Zca, Zcf, Zcd and Zcb
In-Reply-To: <20240419-clinic-amusing-d23b1b6d2af2@spud>
References: <20240418124300.1387978-1-cleger@rivosinc.com>
 <20240418124300.1387978-5-cleger@rivosinc.com>
 <20240419-clinic-amusing-d23b1b6d2af2@spud>
Message-ID: <6ab9e591-f2f2-4267-8bdd-169ef0243e14@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 19/04/2024 17:51, Conor Dooley wrote:
> On Thu, Apr 18, 2024 at 02:42:27PM +0200, Cl?ment L?ger wrote:
>> The Zc* standard extension for code reduction introduces new extensions.
>> This patch adds support for Zca, Zcf, Zcd and Zcb. Zce, Zcmt and Zcmp
>> are left out of this patch since they are targeting microcontrollers/
>> embedded CPUs instead of application processors.
>>
>> Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
>> ---
>>  arch/riscv/include/asm/hwcap.h | 4 ++++
>>  arch/riscv/kernel/cpufeature.c | 4 ++++
>>  2 files changed, 8 insertions(+)
>>
>> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
>> index 543e3ea2da0e..b7551bad341b 100644
>> --- a/arch/riscv/include/asm/hwcap.h
>> +++ b/arch/riscv/include/asm/hwcap.h
>> @@ -82,6 +82,10 @@
>>  #define RISCV_ISA_EXT_ZACAS		73
>>  #define RISCV_ISA_EXT_XANDESPMU		74
>>  #define RISCV_ISA_EXT_ZIMOP		75
>> +#define RISCV_ISA_EXT_ZCA		76
>> +#define RISCV_ISA_EXT_ZCB		77
>> +#define RISCV_ISA_EXT_ZCD		78
>> +#define RISCV_ISA_EXT_ZCF		79
>>  
>>  #define RISCV_ISA_EXT_XLINUXENVCFG	127
>>  
>> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
>> index 115ba001f1bc..09dee071274d 100644
>> --- a/arch/riscv/kernel/cpufeature.c
>> +++ b/arch/riscv/kernel/cpufeature.c
>> @@ -261,6 +261,10 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
>>  	__RISCV_ISA_EXT_DATA(zfa, RISCV_ISA_EXT_ZFA),
>>  	__RISCV_ISA_EXT_DATA(zfh, RISCV_ISA_EXT_ZFH),
>>  	__RISCV_ISA_EXT_DATA(zfhmin, RISCV_ISA_EXT_ZFHMIN),
>> +	__RISCV_ISA_EXT_DATA(zca, RISCV_ISA_EXT_ZCA),
>> +	__RISCV_ISA_EXT_DATA(zcb, RISCV_ISA_EXT_ZCB),
>> +	__RISCV_ISA_EXT_DATA(zcd, RISCV_ISA_EXT_ZCD),
>> +	__RISCV_ISA_EXT_DATA(zcf, RISCV_ISA_EXT_ZCF),
>>  	__RISCV_ISA_EXT_DATA(zba, RISCV_ISA_EXT_ZBA),
>>  	__RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
>>  	__RISCV_ISA_EXT_DATA(zbc, RISCV_ISA_EXT_ZBC),
> 
> Ye, this looks exactly like what I "feared".

Ok but for instance, Qemu actually set Zc* based on C/F/D. So the ISA
string containing theses dependencies should actually also be allowed.
So should we simply ignore them in the ISA string and always do our own
"post-processing" based on C/F/D ?

Thanks,

Cl?ment

