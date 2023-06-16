From: Ben Dooks <ben.dooks@codethink.co.uk>
Date: Fri, 16 Jun 2023 13:55:13 +0100
Subject: [PATCH] riscv: kvm: define vcpu_sbi_ext_pmu in header
In-Reply-To: <20230616-founder-speech-6f57f22e1412@wendy>
References: <20230616115410.166244-1-ben.dooks@codethink.co.uk>
 <20230616-founder-speech-6f57f22e1412@wendy>
Message-ID: <f0026ebc-aa35-6242-fab2-02ee35afa8b2@codethink.co.uk>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 16/06/2023 13:22, Conor Dooley wrote:
> Hey Ben,
> 
> On Fri, Jun 16, 2023 at 12:54:10PM +0100, Ben Dooks wrote:
>> Sparse is giving a warning about vcpu_sbi_ext_pmu not being
>> defined, so add a definition to the relevant header to fix
>> the following:
>>
>> arch/riscv/kvm/vcpu_sbi_pmu.c:81:37: warning: symbol 'vcpu_sbi_ext_pmu' was not declared. Should it be static?
>>
>> Fixes: 3e5e56c60a1477 ("riscv: kvm: move extern sbi_ext declarations to a header")
> 
> You sure this is the right fixes tag? This code didn't exist when I
> wrote that commit, should the fixes tag not be
> 	Fixes: cbddc4c4cb9e ("RISC-V: KVM: Add SBI PMU extension support")
> instead?

I think you're right there.

> Cheers,
> Conor.
> 
>> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
>> ---
>>   arch/riscv/include/asm/kvm_vcpu_sbi.h | 3 +++
>>   arch/riscv/kvm/vcpu_sbi.c             | 4 +---
>>   2 files changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
>> index 4278125a38a5..b94c7e958da7 100644
>> --- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
>> +++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
>> @@ -66,4 +66,7 @@ extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_hsm;
>>   extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_experimental;
>>   extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_vendor;
>>   
>> +#ifdef CONFIG_RISCV_PMU_SBI
>> +extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_pmu;
>> +#endif
>>   #endif /* __RISCV_KVM_VCPU_SBI_H__ */
>> diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
>> index e52fde504433..c973d92a0ba5 100644
>> --- a/arch/riscv/kvm/vcpu_sbi.c
>> +++ b/arch/riscv/kvm/vcpu_sbi.c
>> @@ -20,9 +20,7 @@ static const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_v01 = {
>>   };
>>   #endif
>>   
>> -#ifdef CONFIG_RISCV_PMU_SBI
>> -extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_pmu;
>> -#else
>> +#ifndef CONFIG_RISCV_PMU_SBI
>>   static const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_pmu = {
>>   	.extid_start = -1UL,
>>   	.extid_end = -1UL,
>> -- 
>> 2.39.2
>>

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html


