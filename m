Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 010A1D3ABEF
	for <kvm-riscv@archiver.kernel.org>; Mon,  8 Dec 2025 09:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W2FGec88HP3i5phTy9VDv0uEb+nqDXvtiRoWdMmHBso=; b=vaoNH2Lz2y8gZa
	q7lH7yrxmnRCzobE9egQmNwf1GLgWl50ybPq3q9/ONHAzLuaP7HJjjbcxJCCFjB7wTy4sGh5LuQNj
	BFu/Wp8e9P8nLYf7plzpU7VZLORieaCL9kNSGE2Re6b3nZyfgoqFkbxF5jo37tMiItuPHWgn3kfe6
	mrrYPnFQ81QtI91PdRrDmErsSe0wYisk+UuqIB1jriyrKa0ElhwJfc3SKsEydG2x332xEXG3s8umf
	61tx+y5q3/0vLsjEVn8h6ssakZ3bfoXph1qou9S/Zm2HgJ3aA895LVGRqYm2yU7Kd+qrsVrb0GHnL
	aQhuDhqGtlnsr9BllvPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSXiN-0000000Ctwx-37ob;
	Mon, 08 Dec 2025 09:39:31 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSXiL-0000000CtwL-23Mp;
	Mon, 08 Dec 2025 09:39:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765186770; x=1796722770;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=p82IBGZ4j1jkt4NBfcu7z7d/63zqeo9G4reT2I4uWDo=;
  b=bG6XJnnX+Nxb7n0oaV51zT1rfX+SYGcj9o2feEPxMCrKVgwOkuR/8cPU
   NfHabVf6goXRAMKk6MB2uTA4wxWIdbifAomscOO50ZJhYEINweqd9q9YX
   9TN+OsQQSsNp02Zbh3EOqnLp/liKYNljyVf3HmXeGN7zEzuPVtIq4Buok
   N5x54PejBfAbkwU7FyyfQ2lCqm5Th+NgKXj5OvHWW7BR2nB0U0QhmRSoY
   wAzLVtaU1HmmFTWbKa7qE/N+GfG3oVrnPcsmpypaLFjwMvCH4Jjtc/Y4g
   4NCSjwoqMele5Cjb3Shexi6CQQuLQUsyiDfoj3qeRgw0ej3Y1DYptHm+C
   g==;
X-CSE-ConnectionGUID: MwR2GeTNRx+gu3ByZ2txVg==
X-CSE-MsgGUID: 5YAtaV2MSFC56+BhDdLIxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="84532304"
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; 
   d="scan'208";a="84532304"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 01:39:29 -0800
X-CSE-ConnectionGUID: RUNkPscvTKK1RrxIzPPi5w==
X-CSE-MsgGUID: ZP9ZxvGjQRmDCWEnSrL+eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; 
   d="scan'208";a="200807599"
Received: from dapengmi-mobl1.ccr.corp.intel.com (HELO [10.124.240.12]) ([10.124.240.12])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 01:39:21 -0800
Message-ID: <ee30ed9c-6377-4d14-b930-f0e2c809df7c@linux.intel.com>
Date: Mon, 8 Dec 2025 17:39:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 44/44] KVM: VMX: Add mediated PMU support for CPUs
 without "save perf global ctrl"
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
Content-Language: en-US
From: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
In-Reply-To: <20251206001720.468579-45-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_013929_653671_9C2D4883 
X-CRM114-Status: GOOD (  28.03  )
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


On 12/6/2025 8:17 AM, Sean Christopherson wrote:
> Extend mediated PMU support for Intel CPUs without support for saving
> PERF_GLOBAL_CONTROL into the guest VMCS field on VM-Exit, e.g. for Skylake
> and its derivatives, as well as Icelake.  While supporting CPUs without
> VM_EXIT_SAVE_IA32_PERF_GLOBAL_CTRL isn't completely trivial, it's not that
> complex either.  And not supporting such CPUs would mean not supporting 7+
> years of Intel CPUs released in the past 10 years.
>
> On VM-Exit, immediately propagate the saved PERF_GLOBAL_CTRL to the VMCS
> as well as KVM's software cache so that KVM doesn't need to add full EXREG
> tracking of PERF_GLOBAL_CTRL.  In practice, the vast majority of VM-Exits
> won't trigger software writes to guest PERF_GLOBAL_CTRL, so deferring the
> VMWRITE to the next VM-Enter would only delay the inevitable without
> batching/avoiding VMWRITEs.
>
> Note!  Take care to refresh VM_EXIT_MSR_STORE_COUNT on nested VM-Exit, as
> it's unfortunately possible that KVM could recalculate MSR intercepts
> while L2 is active, e.g. if userspace loads nested state and _then_ sets
> PERF_CAPABILITIES.  Eating the VMWRITE on every nested VM-Exit is
> unfortunate, but that's a pre-existing problem and can/should be solved
> separately, e.g. modifying the number of auto-load entries while L2 is
> active is also uncommon on modern CPUs.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/kvm/vmx/nested.c    |  6 ++++-
>  arch/x86/kvm/vmx/pmu_intel.c |  7 -----
>  arch/x86/kvm/vmx/vmx.c       | 52 ++++++++++++++++++++++++++++++++----
>  3 files changed, 52 insertions(+), 13 deletions(-)
>
> diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
> index 614b789ecf16..1ee1edc8419d 100644
> --- a/arch/x86/kvm/vmx/nested.c
> +++ b/arch/x86/kvm/vmx/nested.c
> @@ -5142,7 +5142,11 @@ void __nested_vmx_vmexit(struct kvm_vcpu *vcpu, u32 vm_exit_reason,
>  
>  	kvm_nested_vmexit_handle_ibrs(vcpu);
>  
> -	/* Update any VMCS fields that might have changed while L2 ran */
> +	/*
> +	 * Update any VMCS fields that might have changed while vmcs02 was the
> +	 * active VMCS.  The tracking is per-vCPU, not per-VMCS.
> +	 */
> +	vmcs_write32(VM_EXIT_MSR_STORE_COUNT, vmx->msr_autostore.nr);
>  	vmcs_write32(VM_EXIT_MSR_LOAD_COUNT, vmx->msr_autoload.host.nr);
>  	vmcs_write32(VM_ENTRY_MSR_LOAD_COUNT, vmx->msr_autoload.guest.nr);
>  	vmcs_write64(TSC_OFFSET, vcpu->arch.tsc_offset);
> diff --git a/arch/x86/kvm/vmx/pmu_intel.c b/arch/x86/kvm/vmx/pmu_intel.c
> index 55249fa4db95..27eb76e6b6a0 100644
> --- a/arch/x86/kvm/vmx/pmu_intel.c
> +++ b/arch/x86/kvm/vmx/pmu_intel.c
> @@ -777,13 +777,6 @@ static bool intel_pmu_is_mediated_pmu_supported(struct x86_pmu_capability *host_
>  	if (WARN_ON_ONCE(!cpu_has_load_perf_global_ctrl()))
>  		return false;
>  
> -	/*
> -	 * KVM doesn't yet support mediated PMU on CPUs without support for
> -	 * saving PERF_GLOBAL_CTRL via a dedicated VMCS field.
> -	 */
> -	if (!cpu_has_save_perf_global_ctrl())
> -		return false;
> -
>  	return true;
>  }
>  
> diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
> index 6a17cb90eaf4..ba1262c3e3ff 100644
> --- a/arch/x86/kvm/vmx/vmx.c
> +++ b/arch/x86/kvm/vmx/vmx.c
> @@ -1204,6 +1204,17 @@ static bool update_transition_efer(struct vcpu_vmx *vmx)
>  	return true;
>  }
>  
> +static void vmx_add_autostore_msr(struct vcpu_vmx *vmx, u32 msr)
> +{
> +	vmx_add_auto_msr(&vmx->msr_autostore, msr, 0, VM_EXIT_MSR_STORE_COUNT,
> +			 vmx->vcpu.kvm);
> +}
> +
> +static void vmx_remove_autostore_msr(struct vcpu_vmx *vmx, u32 msr)
> +{
> +	vmx_remove_auto_msr(&vmx->msr_autostore, msr, VM_EXIT_MSR_STORE_COUNT);
> +}
> +
>  #ifdef CONFIG_X86_32
>  /*
>   * On 32-bit kernels, VM exits still load the FS and GS bases from the
> @@ -4225,6 +4236,8 @@ void pt_update_intercept_for_msr(struct kvm_vcpu *vcpu)
>  
>  static void vmx_recalc_pmu_msr_intercepts(struct kvm_vcpu *vcpu)
>  {
> +	u64 vm_exit_controls_bits = VM_EXIT_LOAD_IA32_PERF_GLOBAL_CTRL |
> +				    VM_EXIT_SAVE_IA32_PERF_GLOBAL_CTRL;
>  	bool has_mediated_pmu = kvm_vcpu_has_mediated_pmu(vcpu);
>  	struct kvm_pmu *pmu = vcpu_to_pmu(vcpu);
>  	struct vcpu_vmx *vmx = to_vmx(vcpu);
> @@ -4234,12 +4247,19 @@ static void vmx_recalc_pmu_msr_intercepts(struct kvm_vcpu *vcpu)
>  	if (!enable_mediated_pmu)
>  		return;
>  
> +	if (!cpu_has_save_perf_global_ctrl()) {
> +		vm_exit_controls_bits &= ~VM_EXIT_SAVE_IA32_PERF_GLOBAL_CTRL;
> +
> +		if (has_mediated_pmu)
> +			vmx_add_autostore_msr(vmx, MSR_CORE_PERF_GLOBAL_CTRL);
> +		else
> +			vmx_remove_autostore_msr(vmx, MSR_CORE_PERF_GLOBAL_CTRL);
> +	}
> +
>  	vm_entry_controls_changebit(vmx, VM_ENTRY_LOAD_IA32_PERF_GLOBAL_CTRL,
>  				    has_mediated_pmu);
>  
> -	vm_exit_controls_changebit(vmx, VM_EXIT_LOAD_IA32_PERF_GLOBAL_CTRL |
> -					VM_EXIT_SAVE_IA32_PERF_GLOBAL_CTRL,
> -				   has_mediated_pmu);
> +	vm_exit_controls_changebit(vmx, vm_exit_controls_bits, has_mediated_pmu);
>  
>  	for (i = 0; i < pmu->nr_arch_gp_counters; i++) {
>  		vmx_set_intercept_for_msr(vcpu, MSR_IA32_PERFCTR0 + i,
> @@ -7346,6 +7366,29 @@ static void atomic_switch_perf_msrs(struct vcpu_vmx *vmx)
>  					      msrs[i].host);
>  }
>  
> +static void vmx_refresh_guest_perf_global_control(struct kvm_vcpu *vcpu)
> +{
> +	struct kvm_pmu *pmu = vcpu_to_pmu(vcpu);
> +	struct vcpu_vmx *vmx = to_vmx(vcpu);
> +
> +	if (msr_write_intercepted(vmx, MSR_CORE_PERF_GLOBAL_CTRL))
> +		return;
> +
> +	if (!cpu_has_save_perf_global_ctrl()) {
> +		int slot = vmx_find_loadstore_msr_slot(&vmx->msr_autostore,
> +						       MSR_CORE_PERF_GLOBAL_CTRL);
> +
> +		if (WARN_ON_ONCE(slot < 0))
> +			return;
> +
> +		pmu->global_ctrl = vmx->msr_autostore.val[slot].value;
> +		vmcs_write64(GUEST_IA32_PERF_GLOBAL_CTRL, pmu->global_ctrl);
> +		return;
> +	}
> +
> +	pmu->global_ctrl = vmcs_read64(GUEST_IA32_PERF_GLOBAL_CTRL);
> +}
> +
>  static void vmx_update_hv_timer(struct kvm_vcpu *vcpu, bool force_immediate_exit)
>  {
>  	struct vcpu_vmx *vmx = to_vmx(vcpu);
> @@ -7631,8 +7674,7 @@ fastpath_t vmx_vcpu_run(struct kvm_vcpu *vcpu, u64 run_flags)
>  
>  	vmx->loaded_vmcs->launched = 1;
>  
> -	if (!msr_write_intercepted(vmx, MSR_CORE_PERF_GLOBAL_CTRL))
> -		vcpu_to_pmu(vcpu)->global_ctrl = vmcs_read64(GUEST_IA32_PERF_GLOBAL_CTRL);
> +	vmx_refresh_guest_perf_global_control(vcpu);
>  
>  	vmx_recover_nmi_blocking(vmx);
>  	vmx_complete_interrupts(vmx);

The change looks good to me, but I still have no bandwidth to test the code
on Ice lake, I would go back after I finish the tests. Thanks.



-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
