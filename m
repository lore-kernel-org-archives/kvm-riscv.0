From: Atish Patra <atishp@rivosinc.com>
Date: Mon, 8 Apr 2024 17:33:10 -0700
Subject: [PATCH v5 12/22] RISC-V: KVM: Implement SBI PMU Snapshot feature
In-Reply-To: <20240405-1060c986299eaac3528c7d4f@orel>
References: <20240403080452.1007601-1-atishp@rivosinc.com>
 <20240403080452.1007601-13-atishp@rivosinc.com>
 <20240405-1060c986299eaac3528c7d4f@orel>
Message-ID: <a50d426c-a7c0-49d9-8bdf-d15ba53ba40f@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 4/5/24 04:23, Andrew Jones wrote:
> On Wed, Apr 03, 2024 at 01:04:41AM -0700, Atish Patra wrote:
>> PMU Snapshot function allows to minimize the number of traps when the
>> guest access configures/access the hpmcounters. If the snapshot feature
>> is enabled, the hypervisor updates the shared memory with counter
>> data and state of overflown counters. The guest can just read the
>> shared memory instead of trap & emulate done by the hypervisor.
>>
>> This patch doesn't implement the counter overflow yet.
>>
>> Reviewed-by: Anup Patel <anup@brainfault.org>
>> Signed-off-by: Atish Patra <atishp@rivosinc.com>
>> ---
>>   arch/riscv/include/asm/kvm_vcpu_pmu.h |   7 ++
>>   arch/riscv/kvm/vcpu_pmu.c             | 121 +++++++++++++++++++++++++-
>>   arch/riscv/kvm/vcpu_sbi_pmu.c         |   3 +
>>   3 files changed, 130 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/riscv/include/asm/kvm_vcpu_pmu.h b/arch/riscv/include/asm/kvm_vcpu_pmu.h
>> index 395518a1664e..77a1fc4d203d 100644
>> --- a/arch/riscv/include/asm/kvm_vcpu_pmu.h
>> +++ b/arch/riscv/include/asm/kvm_vcpu_pmu.h
>> @@ -50,6 +50,10 @@ struct kvm_pmu {
>>   	bool init_done;
>>   	/* Bit map of all the virtual counter used */
>>   	DECLARE_BITMAP(pmc_in_use, RISCV_KVM_MAX_COUNTERS);
>> +	/* The address of the counter snapshot area (guest physical address) */
>> +	gpa_t snapshot_addr;
>> +	/* The actual data of the snapshot */
>> +	struct riscv_pmu_snapshot_data *sdata;
>>   };
>>   
>>   #define vcpu_to_pmu(vcpu) (&(vcpu)->arch.pmu_context)
>> @@ -85,6 +89,9 @@ int kvm_riscv_vcpu_pmu_ctr_cfg_match(struct kvm_vcpu *vcpu, unsigned long ctr_ba
>>   int kvm_riscv_vcpu_pmu_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
>>   				struct kvm_vcpu_sbi_return *retdata);
>>   void kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu);
>> +int kvm_riscv_vcpu_pmu_snapshot_set_shmem(struct kvm_vcpu *vcpu, unsigned long saddr_low,
>> +				      unsigned long saddr_high, unsigned long flags,
>> +				      struct kvm_vcpu_sbi_return *retdata);
>>   void kvm_riscv_vcpu_pmu_deinit(struct kvm_vcpu *vcpu);
>>   void kvm_riscv_vcpu_pmu_reset(struct kvm_vcpu *vcpu);
>>   
>> diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
>> index 2d9929bbc2c8..f706c688b338 100644
>> --- a/arch/riscv/kvm/vcpu_pmu.c
>> +++ b/arch/riscv/kvm/vcpu_pmu.c
>> @@ -14,6 +14,7 @@
>>   #include <asm/csr.h>
>>   #include <asm/kvm_vcpu_sbi.h>
>>   #include <asm/kvm_vcpu_pmu.h>
>> +#include <asm/sbi.h>
>>   #include <linux/bitops.h>
>>   
>>   #define kvm_pmu_num_counters(pmu) ((pmu)->num_hw_ctrs + (pmu)->num_fw_ctrs)
>> @@ -311,6 +312,80 @@ int kvm_riscv_vcpu_pmu_read_hpm(struct kvm_vcpu *vcpu, unsigned int csr_num,
>>   	return ret;
>>   }
>>   
>> +static void kvm_pmu_clear_snapshot_area(struct kvm_vcpu *vcpu)
>> +{
>> +	struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
>> +	int snapshot_area_size = sizeof(struct riscv_pmu_snapshot_data);
>> +
>> +	if (kvpmu->sdata) {
>> +		if (kvpmu->snapshot_addr != INVALID_GPA) {
>> +			memset(kvpmu->sdata, 0, snapshot_area_size);
>> +			kvm_vcpu_write_guest(vcpu, kvpmu->snapshot_addr,
>> +					     kvpmu->sdata, snapshot_area_size);
>> +		} else {
>> +			pr_warn("snapshot address invalid\n");
>> +		}
>> +		kfree(kvpmu->sdata);
>> +		kvpmu->sdata = NULL;
>> +	}
>> +	kvpmu->snapshot_addr = INVALID_GPA;
>> +}
>> +
>> +int kvm_riscv_vcpu_pmu_snapshot_set_shmem(struct kvm_vcpu *vcpu, unsigned long saddr_low,
>> +				      unsigned long saddr_high, unsigned long flags,
>> +				      struct kvm_vcpu_sbi_return *retdata)
>> +{
>> +	struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
>> +	int snapshot_area_size = sizeof(struct riscv_pmu_snapshot_data);
>> +	int sbiret = 0;
>> +	gpa_t saddr;
>> +	unsigned long hva;
>> +	bool writable;
>> +
>> +	if (!kvpmu || flags) {
>> +		sbiret = SBI_ERR_INVALID_PARAM;
>> +		goto out;
>> +	}
>> +
>> +	if (saddr_low == SBI_SHMEM_DISABLE && saddr_high == SBI_SHMEM_DISABLE) {
>> +		kvm_pmu_clear_snapshot_area(vcpu);
>> +		return 0;
>> +	}
>> +
>> +	saddr = saddr_low;
>> +
>> +	if (saddr_high != 0) {
>> +		if (IS_ENABLED(CONFIG_32BIT))
>> +			saddr |= ((gpa_t)saddr << 32);
> 
> saddr |= ((gpa_t)saddr_high << 32)
> 

Oops. Thanks for catching it. Fixed.


>> +		else
>> +			sbiret = SBI_ERR_INVALID_ADDRESS;
>> +		goto out;
>> +	}
>> +
> 
> Thanks,
> drew


