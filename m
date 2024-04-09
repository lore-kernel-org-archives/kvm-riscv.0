From: Atish Patra <atishp@rivosinc.com>
Date: Mon, 8 Apr 2024 17:20:01 -0700
Subject: [PATCH v5 04/22] drivers/perf: riscv: Use BIT macro for shifting
 operations
In-Reply-To: <20240404-9a84f2090d00f6b994e1de7c@orel>
References: <20240403080452.1007601-1-atishp@rivosinc.com>
 <20240403080452.1007601-5-atishp@rivosinc.com>
 <20240404-9a84f2090d00f6b994e1de7c@orel>
Message-ID: <be088afd-923e-4aed-a786-5398e46c05f5@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 4/4/24 04:08, Andrew Jones wrote:
> On Wed, Apr 03, 2024 at 01:04:33AM -0700, Atish Patra wrote:
>> It is a good practice to use BIT() instead of (1UL << x).
> 
> (1UL << x) isn't generally a problem. The problem is with (1 << x).
> 

Yes. That's why, the commit message said it's good to have :)
I improved the commit message to specify about 1 << x as well.

>> Replace the current usages with BIT().
>>
>> Signed-off-by: Atish Patra <atishp@rivosinc.com>
>> ---
>>   arch/riscv/include/asm/sbi.h | 20 ++++++++++----------
>>   drivers/perf/riscv_pmu_sbi.c |  2 +-
>>   2 files changed, 11 insertions(+), 11 deletions(-)
>>
>> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
>> index ef8311dafb91..4afa2cd01bae 100644
>> --- a/arch/riscv/include/asm/sbi.h
>> +++ b/arch/riscv/include/asm/sbi.h
>> @@ -233,20 +233,20 @@ enum sbi_pmu_ctr_type {
>>   #define SBI_PMU_EVENT_IDX_INVALID 0xFFFFFFFF
>>   
>>   /* Flags defined for config matching function */
>> -#define SBI_PMU_CFG_FLAG_SKIP_MATCH	(1 << 0)
>> -#define SBI_PMU_CFG_FLAG_CLEAR_VALUE	(1 << 1)
>> -#define SBI_PMU_CFG_FLAG_AUTO_START	(1 << 2)
>> -#define SBI_PMU_CFG_FLAG_SET_VUINH	(1 << 3)
>> -#define SBI_PMU_CFG_FLAG_SET_VSINH	(1 << 4)
>> -#define SBI_PMU_CFG_FLAG_SET_UINH	(1 << 5)
>> -#define SBI_PMU_CFG_FLAG_SET_SINH	(1 << 6)
>> -#define SBI_PMU_CFG_FLAG_SET_MINH	(1 << 7)
>> +#define SBI_PMU_CFG_FLAG_SKIP_MATCH	BIT(0)
>> +#define SBI_PMU_CFG_FLAG_CLEAR_VALUE	BIT(1)
>> +#define SBI_PMU_CFG_FLAG_AUTO_START	BIT(2)
>> +#define SBI_PMU_CFG_FLAG_SET_VUINH	BIT(3)
>> +#define SBI_PMU_CFG_FLAG_SET_VSINH	BIT(4)
>> +#define SBI_PMU_CFG_FLAG_SET_UINH	BIT(5)
>> +#define SBI_PMU_CFG_FLAG_SET_SINH	BIT(6)
>> +#define SBI_PMU_CFG_FLAG_SET_MINH	BIT(7)
>>   
>>   /* Flags defined for counter start function */
>> -#define SBI_PMU_START_FLAG_SET_INIT_VALUE (1 << 0)
>> +#define SBI_PMU_START_FLAG_SET_INIT_VALUE BIT(0)
>>   
>>   /* Flags defined for counter stop function */
>> -#define SBI_PMU_STOP_FLAG_RESET (1 << 0)
>> +#define SBI_PMU_STOP_FLAG_RESET BIT(0)
>>   
>>   enum sbi_ext_dbcn_fid {
>>   	SBI_EXT_DBCN_CONSOLE_WRITE = 0,
>> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
>> index babf1b9a4dbe..a83ae82301e3 100644
>> --- a/drivers/perf/riscv_pmu_sbi.c
>> +++ b/drivers/perf/riscv_pmu_sbi.c
>> @@ -386,7 +386,7 @@ static int pmu_sbi_ctr_get_idx(struct perf_event *event)
>>   			cmask = 1;
>>   		} else if (event->attr.config == PERF_COUNT_HW_INSTRUCTIONS) {
>>   			cflags |= SBI_PMU_CFG_FLAG_SKIP_MATCH;
>> -			cmask = 1UL << (CSR_INSTRET - CSR_CYCLE);
>> +			cmask = BIT(CSR_INSTRET - CSR_CYCLE);
>>   		}
>>   	}
>>   
>> -- 
>> 2.34.1
>>
> 
> Other than the commit message,
> 
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> 
> Thanks,
> drew


