Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B94A1D3B7EA
	for <kvm-riscv@archiver.kernel.org>; Tue,  9 Dec 2025 06:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/+Wyy4swag5doi6wKrjDGVJDeDF8ngewQUG/+EFwtdw=; b=JCb31YHk7F8KCY
	y/1Zke34ijcKI3W+7BXR/CYRc0OmOSif2IH/ZlIHyIkquKbV14jtRXi7nTpn0/XVsX1xaDufRFqeo
	k08X3F8wnp+If2nJXRD+FEMCze7zdXW6EKbGCTn+fr55q3CiyF/h4KEHaDuBmRB8in0BLplFVTqY5
	iS/lIF0/U35RF/S9BO9emfhjnNHmcHcQX/ksIjvMj0lAdo+47M3hbhlt3h6RZ05DXVksQbaotqpdd
	FnDDxeE57lQcN/47Pv54XxEshr+xjv7jZKk5Pq13VUjMcfmNEyx9dGbjxO5dM8KVWflOuh1D2d6ay
	iIlGyIs+qh85ohH2acGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSrG0-0000000DtD1-0y1f;
	Tue, 09 Dec 2025 06:31:32 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSrFw-0000000DtCW-3vP3;
	Tue, 09 Dec 2025 06:31:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765261889; x=1796797889;
  h=message-id:date:mime-version:subject:from:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=3I2+FsbZXr1WnlAwsLrRK4zLjlcjjzCN2ZRMQ8uYaWE=;
  b=nhK3dbG5OT0LTWKpnk5nbwaFY1SPEzMYbaRFIQqk7ODrZL+eT8JjFyOW
   6iMhI+GZfViMdFDv6EWle4YLc4J0JHjIFOdsF48aRQGMhuhyHHYM+vhCt
   SjuF03S6kumsMVrIi5YQ/myLU0BXv7cW9p1eegUjC0dpvWH4BDheyiZhm
   g5PheeilxbwncQYB9kJeB0QzHhXnj3uO/ZNJWTleh3bUS9pPFLwVu220Y
   ekEpGyY5Rh3w0ahE6RzgJ8hS0MK+dxfI2Yh5/MQw22BrVr4m6j3D9QY3K
   C7zb+HfZedckS/WaSFBTI2BfNjHR3slJdzmkUdgfLa8lhW3Tzvy1fj6cU
   g==;
X-CSE-ConnectionGUID: 2kTCpqIoSNuwN9OkP5W0ng==
X-CSE-MsgGUID: vOhp+sw0RPuG0OUbYcbneQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="84621517"
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; 
   d="scan'208";a="84621517"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 22:31:28 -0800
X-CSE-ConnectionGUID: E0aTtjOiTQelMO5dDdd7mA==
X-CSE-MsgGUID: 9WXsel9CRiO4rC94VpUqXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; 
   d="scan'208";a="196601217"
Received: from dapengmi-mobl1.ccr.corp.intel.com (HELO [10.124.240.12]) ([10.124.240.12])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 22:31:20 -0800
Message-ID: <8365c5ca-637d-4bef-a404-eb2166d384f5@linux.intel.com>
Date: Tue, 9 Dec 2025 14:31:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 44/44] KVM: VMX: Add mediated PMU support for CPUs
 without "save perf global ctrl"
From: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oupton@kernel.org>, Tianrui Zhao <zhaotianrui@loongson.cn>,
 Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
 Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Xin Li <xin@zytor.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 kvm@vger.kernel.org, loongarch@lists.linux.dev,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 Mingwei Zhang <mizhang@google.com>, Xudong Hao <xudong.hao@intel.com>,
 Sandipan Das <sandipan.das@amd.com>,
 Xiong Zhang <xiong.y.zhang@linux.intel.com>,
 Manali Shukla <manali.shukla@amd.com>, Jim Mattson <jmattson@google.com>
References: <20251206001720.468579-1-seanjc@google.com>
 <20251206001720.468579-45-seanjc@google.com>
 <ee30ed9c-6377-4d14-b930-f0e2c809df7c@linux.intel.com>
Content-Language: en-US
In-Reply-To: <ee30ed9c-6377-4d14-b930-f0e2c809df7c@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_223129_076092_E6B6B260 
X-CRM114-Status: GOOD (  21.02  )
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org


On 12/8/2025 5:39 PM, Mi, Dapeng wrote:
> On 12/6/2025 8:17 AM, Sean Christopherson wrote:
>> Extend mediated PMU support for Intel CPUs without support for saving
>> PERF_GLOBAL_CONTROL into the guest VMCS field on VM-Exit, e.g. for Skylake
>> and its derivatives, as well as Icelake.  While supporting CPUs without
>> VM_EXIT_SAVE_IA32_PERF_GLOBAL_CTRL isn't completely trivial, it's not that
>> complex either.  And not supporting such CPUs would mean not supporting 7+
>> years of Intel CPUs released in the past 10 years.
>>
>> On VM-Exit, immediately propagate the saved PERF_GLOBAL_CTRL to the VMCS
>> as well as KVM's software cache so that KVM doesn't need to add full EXREG
>> tracking of PERF_GLOBAL_CTRL.  In practice, the vast majority of VM-Exits
>> won't trigger software writes to guest PERF_GLOBAL_CTRL, so deferring the
>> VMWRITE to the next VM-Enter would only delay the inevitable without
>> batching/avoiding VMWRITEs.
>>
>> Note!  Take care to refresh VM_EXIT_MSR_STORE_COUNT on nested VM-Exit, as
>> it's unfortunately possible that KVM could recalculate MSR intercepts
>> while L2 is active, e.g. if userspace loads nested state and _then_ sets
>> PERF_CAPABILITIES.  Eating the VMWRITE on every nested VM-Exit is
>> unfortunate, but that's a pre-existing problem and can/should be solved
>> separately, e.g. modifying the number of auto-load entries while L2 is
>> active is also uncommon on modern CPUs.
>>
>> Signed-off-by: Sean Christopherson <seanjc@google.com>
>> ---
>>  arch/x86/kvm/vmx/nested.c    |  6 ++++-
>>  arch/x86/kvm/vmx/pmu_intel.c |  7 -----
>>  arch/x86/kvm/vmx/vmx.c       | 52 ++++++++++++++++++++++++++++++++----
>>  3 files changed, 52 insertions(+), 13 deletions(-)
>>
>> diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
>> index 614b789ecf16..1ee1edc8419d 100644
>> --- a/arch/x86/kvm/vmx/nested.c
>> +++ b/arch/x86/kvm/vmx/nested.c
>> @@ -5142,7 +5142,11 @@ void __nested_vmx_vmexit(struct kvm_vcpu *vcpu, u32 vm_exit_reason,
>>  
>>  	kvm_nested_vmexit_handle_ibrs(vcpu);
>>  
>> -	/* Update any VMCS fields that might have changed while L2 ran */
>> +	/*
>> +	 * Update any VMCS fields that might have changed while vmcs02 was the
>> +	 * active VMCS.  The tracking is per-vCPU, not per-VMCS.
>> +	 */
>> +	vmcs_write32(VM_EXIT_MSR_STORE_COUNT, vmx->msr_autostore.nr);
>>  	vmcs_write32(VM_EXIT_MSR_LOAD_COUNT, vmx->msr_autoload.host.nr);
>>  	vmcs_write32(VM_ENTRY_MSR_LOAD_COUNT, vmx->msr_autoload.guest.nr);
>>  	vmcs_write64(TSC_OFFSET, vcpu->arch.tsc_offset);
>> diff --git a/arch/x86/kvm/vmx/pmu_intel.c b/arch/x86/kvm/vmx/pmu_intel.c
>> index 55249fa4db95..27eb76e6b6a0 100644
>> --- a/arch/x86/kvm/vmx/pmu_intel.c
>> +++ b/arch/x86/kvm/vmx/pmu_intel.c
>> @@ -777,13 +777,6 @@ static bool intel_pmu_is_mediated_pmu_supported(struct x86_pmu_capability *host_
>>  	if (WARN_ON_ONCE(!cpu_has_load_perf_global_ctrl()))
>>  		return false;
>>  
>> -	/*
>> -	 * KVM doesn't yet support mediated PMU on CPUs without support for
>> -	 * saving PERF_GLOBAL_CTRL via a dedicated VMCS field.
>> -	 */
>> -	if (!cpu_has_save_perf_global_ctrl())
>> -		return false;
>> -
>>  	return true;
>>  }
>>  
>> diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
>> index 6a17cb90eaf4..ba1262c3e3ff 100644
>> --- a/arch/x86/kvm/vmx/vmx.c
>> +++ b/arch/x86/kvm/vmx/vmx.c
>> @@ -1204,6 +1204,17 @@ static bool update_transition_efer(struct vcpu_vmx *vmx)
>>  	return true;
>>  }
>>  
>> +static void vmx_add_autostore_msr(struct vcpu_vmx *vmx, u32 msr)
>> +{
>> +	vmx_add_auto_msr(&vmx->msr_autostore, msr, 0, VM_EXIT_MSR_STORE_COUNT,
>> +			 vmx->vcpu.kvm);
>> +}
>> +
>> +static void vmx_remove_autostore_msr(struct vcpu_vmx *vmx, u32 msr)
>> +{
>> +	vmx_remove_auto_msr(&vmx->msr_autostore, msr, VM_EXIT_MSR_STORE_COUNT);
>> +}
>> +
>>  #ifdef CONFIG_X86_32
>>  /*
>>   * On 32-bit kernels, VM exits still load the FS and GS bases from the
>> @@ -4225,6 +4236,8 @@ void pt_update_intercept_for_msr(struct kvm_vcpu *vcpu)
>>  
>>  static void vmx_recalc_pmu_msr_intercepts(struct kvm_vcpu *vcpu)
>>  {
>> +	u64 vm_exit_controls_bits = VM_EXIT_LOAD_IA32_PERF_GLOBAL_CTRL |
>> +				    VM_EXIT_SAVE_IA32_PERF_GLOBAL_CTRL;
>>  	bool has_mediated_pmu = kvm_vcpu_has_mediated_pmu(vcpu);
>>  	struct kvm_pmu *pmu = vcpu_to_pmu(vcpu);
>>  	struct vcpu_vmx *vmx = to_vmx(vcpu);
>> @@ -4234,12 +4247,19 @@ static void vmx_recalc_pmu_msr_intercepts(struct kvm_vcpu *vcpu)
>>  	if (!enable_mediated_pmu)
>>  		return;
>>  
>> +	if (!cpu_has_save_perf_global_ctrl()) {
>> +		vm_exit_controls_bits &= ~VM_EXIT_SAVE_IA32_PERF_GLOBAL_CTRL;
>> +
>> +		if (has_mediated_pmu)
>> +			vmx_add_autostore_msr(vmx, MSR_CORE_PERF_GLOBAL_CTRL);
>> +		else
>> +			vmx_remove_autostore_msr(vmx, MSR_CORE_PERF_GLOBAL_CTRL);
>> +	}
>> +
>>  	vm_entry_controls_changebit(vmx, VM_ENTRY_LOAD_IA32_PERF_GLOBAL_CTRL,
>>  				    has_mediated_pmu);
>>  
>> -	vm_exit_controls_changebit(vmx, VM_EXIT_LOAD_IA32_PERF_GLOBAL_CTRL |
>> -					VM_EXIT_SAVE_IA32_PERF_GLOBAL_CTRL,
>> -				   has_mediated_pmu);
>> +	vm_exit_controls_changebit(vmx, vm_exit_controls_bits, has_mediated_pmu);
>>  
>>  	for (i = 0; i < pmu->nr_arch_gp_counters; i++) {
>>  		vmx_set_intercept_for_msr(vcpu, MSR_IA32_PERFCTR0 + i,
>> @@ -7346,6 +7366,29 @@ static void atomic_switch_perf_msrs(struct vcpu_vmx *vmx)
>>  					      msrs[i].host);
>>  }
>>  
>> +static void vmx_refresh_guest_perf_global_control(struct kvm_vcpu *vcpu)
>> +{
>> +	struct kvm_pmu *pmu = vcpu_to_pmu(vcpu);
>> +	struct vcpu_vmx *vmx = to_vmx(vcpu);
>> +
>> +	if (msr_write_intercepted(vmx, MSR_CORE_PERF_GLOBAL_CTRL))
>> +		return;
>> +
>> +	if (!cpu_has_save_perf_global_ctrl()) {
>> +		int slot = vmx_find_loadstore_msr_slot(&vmx->msr_autostore,
>> +						       MSR_CORE_PERF_GLOBAL_CTRL);
>> +
>> +		if (WARN_ON_ONCE(slot < 0))
>> +			return;
>> +
>> +		pmu->global_ctrl = vmx->msr_autostore.val[slot].value;
>> +		vmcs_write64(GUEST_IA32_PERF_GLOBAL_CTRL, pmu->global_ctrl);
>> +		return;
>> +	}
>> +
>> +	pmu->global_ctrl = vmcs_read64(GUEST_IA32_PERF_GLOBAL_CTRL);
>> +}
>> +
>>  static void vmx_update_hv_timer(struct kvm_vcpu *vcpu, bool force_immediate_exit)
>>  {
>>  	struct vcpu_vmx *vmx = to_vmx(vcpu);
>> @@ -7631,8 +7674,7 @@ fastpath_t vmx_vcpu_run(struct kvm_vcpu *vcpu, u64 run_flags)
>>  
>>  	vmx->loaded_vmcs->launched = 1;
>>  
>> -	if (!msr_write_intercepted(vmx, MSR_CORE_PERF_GLOBAL_CTRL))
>> -		vcpu_to_pmu(vcpu)->global_ctrl = vmcs_read64(GUEST_IA32_PERF_GLOBAL_CTRL);
>> +	vmx_refresh_guest_perf_global_control(vcpu);
>>  
>>  	vmx_recover_nmi_blocking(vmx);
>>  	vmx_complete_interrupts(vmx);
> The change looks good to me, but I still have no bandwidth to test the code
> on Ice lake, I would go back after I finish the tests. Thanks.

Tested below test cases on Skylake and Sapphire Rapids servers for both
mediated vPMU and Perf based emulated vPMU, no issue is found. Thanks.

Kselftests: pmu_counters_test/pmu_event_filter_test/vmx_pmu_caps_test

KVM-unit-tests: pmu/pmu_lbr/pmu_pebs

Reviewed-by: Dapeng Mi <dapeng1.mi@linux.intel.com>

Tested-by: Dapeng Mi <dapeng1.mi@linux.intel.com>


>
>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
