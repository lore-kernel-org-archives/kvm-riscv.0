From: Atish Patra <atishp@rivosinc.com>
Date: Mon, 8 Apr 2024 17:37:19 -0700
Subject: [PATCH v5 20/22] KVM: riscv: selftests: Add SBI PMU selftest
In-Reply-To: <20240405-d1a4cb9a441a05a9d2f8b1c8@orel>
References: <20240403080452.1007601-1-atishp@rivosinc.com>
 <20240403080452.1007601-21-atishp@rivosinc.com>
 <20240405-d1a4cb9a441a05a9d2f8b1c8@orel>
Message-ID: <976411ab-6ddf-4b10-8e13-1575928415ce@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 4/5/24 05:50, Andrew Jones wrote:
> On Wed, Apr 03, 2024 at 01:04:49AM -0700, Atish Patra wrote:
> ...
>> +static void test_pmu_basic_sanity(void)
>> +{
>> +	long out_val = 0;
>> +	bool probe;
>> +	struct sbiret ret;
>> +	int num_counters = 0, i;
>> +	union sbi_pmu_ctr_info ctrinfo;
>> +
>> +	probe = guest_sbi_probe_extension(SBI_EXT_PMU, &out_val);
>> +	GUEST_ASSERT(probe && out_val == 1);
>> +
>> +	num_counters = get_num_counters();
>> +
>> +	for (i = 0; i < num_counters; i++) {
>> +		ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_GET_INFO, i,
>> +				0, 0, 0, 0, 0);
>> +
>> +		/* There can be gaps in logical counter indicies*/
>> +		if (ret.error)
>> +			continue;
>> +		GUEST_ASSERT_NE(ret.value, 0);
>> +
>> +		ctrinfo.value = ret.value;
>> +
>> +		/**
>> +		 * Accesibillity check of hardware and read capability of firmware counters.
> 
> Accessibility
> 

Fixed it.

>> +		 * The spec doesn't mandate any initial value. No need to check any value.
>> +		 */
>> +		read_counter(i, ctrinfo);
>> +	}
>> +
>> +	GUEST_DONE();
>> +}
>> +
>> +static void run_vcpu(struct kvm_vcpu *vcpu)
>> +{
>> +	struct ucall uc;
>> +
>> +	vcpu_run(vcpu);
>> +	switch (get_ucall(vcpu, &uc)) {
>> +	case UCALL_ABORT:
>> +		REPORT_GUEST_ASSERT(uc);
>> +		break;
>> +	case UCALL_DONE:
>> +	case UCALL_SYNC:
>> +		break;
>> +	default:
>> +		TEST_FAIL("Unknown ucall %lu", uc.cmd);
>> +		break;
>> +	}
>> +}
>> +
>> +void test_vm_destroy(struct kvm_vm *vm)
>> +{
>> +	memset(ctrinfo_arr, 0, sizeof(union sbi_pmu_ctr_info) * RISCV_MAX_PMU_COUNTERS);
>> +	counter_mask_available = 0;
>> +	kvm_vm_free(vm);
>> +}
>> +
>> +static void test_vm_basic_test(void *guest_code)
>> +{
>> +	struct kvm_vm *vm;
>> +	struct kvm_vcpu *vcpu;
>> +
>> +	vm = vm_create_with_one_vcpu(&vcpu, guest_code);
>> +	__TEST_REQUIRE(__vcpu_has_sbi_ext(vcpu, KVM_RISCV_SBI_EXT_PMU),
>> +				   "SBI PMU not available, skipping test");
>> +	vm_init_vector_tables(vm);
>> +	/* Illegal instruction handler is required to verify read access without configuration */
>> +	vm_install_exception_handler(vm, EXC_INST_ILLEGAL, guest_illegal_exception_handler);
> 
> I still don't see where the "verify" part is. The handler doesn't record
> that it had to handle anything.
> 

The objective of the test is to ensure that we get an illegal 
instruction without configuration. The presence of the registered 
exception handler is sufficient for that.

The verify part is that the test doesn't end up in a illegal instruction 
exception when you try to access a counter without configuring.

Let me know if you think we should more verbose comment to explain the 
scenario.


>> +
>> +	vcpu_init_vector_tables(vcpu);
>> +	run_vcpu(vcpu);
>> +
>> +	test_vm_destroy(vm);
>> +}
>> +
>> +static void test_vm_events_test(void *guest_code)
>> +{
>> +	struct kvm_vm *vm = NULL;
>> +	struct kvm_vcpu *vcpu = NULL;
>> +
>> +	vm = vm_create_with_one_vcpu(&vcpu, guest_code);
>> +	__TEST_REQUIRE(__vcpu_has_sbi_ext(vcpu, KVM_RISCV_SBI_EXT_PMU),
>> +				   "SBI PMU not available, skipping test");
>> +	run_vcpu(vcpu);
>> +
>> +	test_vm_destroy(vm);
>> +}
>> +
>> +int main(void)
>> +{
>> +	test_vm_basic_test(test_pmu_basic_sanity);
>> +	pr_info("SBI PMU basic test : PASS\n");
>> +
>> +	test_vm_events_test(test_pmu_events);
>> +	pr_info("SBI PMU event verification test : PASS\n");
>> +
>> +	return 0;
>> +}
>> -- 
>> 2.34.1
>>
> 
> Thanks,
> drew


