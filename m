Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CE7BD3ABEF
	for <kvm-riscv@archiver.kernel.org>; Mon,  8 Dec 2025 09:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6876RgomO26UZZy6msGeGSpo4xJCx8NUi5ljz2Q0Bx4=; b=bYWWL0ejMOBXT5
	t8nPXLTsTxSvnhJck3N0D/Wy8suWoxUAdDgzump8CwGgmvWqHPcNyo5P2rBpBys+bPDpR8tg1rMgC
	jaLmghne0W6RYrdjsO5+FbKTtvJL9ZQ9NLtxyhTuKgrkNJ+loePtLpKZ0Vcr+OqKV0YXb2o9NAcSx
	jD/9cwGfuqZYYwAteQarZaY8Amgiu6xgbU438mGmJuxVP/nOZZM2lTZvtDmpJ2en7r94RXs6i8DyJ
	a4Y/jpRzPOztVFaR+ADow41IigNbR2azs6VH0S91wnX7c1BHQjnUJfgs8we/e6ac2+XNsYWu2jBGy
	ghHb3HmQvm7jAJIMor1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSXKt-0000000Cr6T-3LsR;
	Mon, 08 Dec 2025 09:15:15 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSXKq-0000000Cr5J-2S2M;
	Mon, 08 Dec 2025 09:15:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765185312; x=1796721312;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Op2nVfSeshtd/97y1F620bAyJ5slemNLwyBYIxH82c8=;
  b=LiMOua18mHIfmgSJn5GX5PkFB4awoYxWrbNgdcPaL9SfEba9vCSbECvn
   tKUDZXvaSvcV8zEzfzPiOO5pZjLvfZBOmqba5Fb8NlI2Yqq1+NHAZBVBG
   b2+WeixORZwAbbPOcoKIgbGSkaTpo3ybHjtmlcYH+kcbz5JPcssVzeCN2
   kWimUDtmsjb42e1yw44TAgt0N3961GKHmxge6xbmBqro89/pb3+Vud27W
   7D6C8hFvl6X/qYnn78gK3Y0UhfpkvT/sjTMLo+sbUygMKmUuqIiHsCAL+
   7fkgm4gU4SJhT4DLBuieLVHAl6HMfAcsY0kE9lWgU2U5mjqFR2/XQ/pOx
   g==;
X-CSE-ConnectionGUID: kgxTm+sgSFiK9VOq1d8xZQ==
X-CSE-MsgGUID: PWb1sxmpSSqvR3IwqYTdbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="66124380"
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; 
   d="scan'208";a="66124380"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 01:15:10 -0800
X-CSE-ConnectionGUID: 4H/pcwrXQVSjY8FUXqPV6w==
X-CSE-MsgGUID: j7p+D3AjRFu5Wm3XzOa1YQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; 
   d="scan'208";a="195945489"
Received: from dapengmi-mobl1.ccr.corp.intel.com (HELO [10.124.240.12]) ([10.124.240.12])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 01:14:59 -0800
Message-ID: <0237b3eb-87f5-4758-b704-9f8d525f1f15@linux.intel.com>
Date: Mon, 8 Dec 2025 17:14:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 35/44] KVM: VMX: Drop intermediate "guest" field from
 msr_autostore
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
 <20251206001720.468579-36-seanjc@google.com>
Content-Language: en-US
From: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
In-Reply-To: <20251206001720.468579-36-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_011512_679664_6E3FF101 
X-CRM114-Status: GOOD (  20.92  )
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
> Drop the intermediate "guest" field from vcpu_vmx.msr_autostore as the
> value saved on VM-Exit isn't guaranteed to be the guest's value, it's
> purely whatever is in hardware at the time of VM-Exit.  E.g. KVM's only
> use of the store list at the momemnt is to snapshot TSC at VM-Exit, and
> the value saved is always the raw TSC even if TSC-offseting and/or
> TSC-scaling is enabled for the guest.
>
> And unlike msr_autoload, there is no need differentiate between "on-entry"
> and "on-exit".
>
> No functional change intended.
>
> Cc: Jim Mattson <jmattson@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/kvm/vmx/nested.c | 10 +++++-----
>  arch/x86/kvm/vmx/vmx.c    |  2 +-
>  arch/x86/kvm/vmx/vmx.h    |  4 +---
>  3 files changed, 7 insertions(+), 9 deletions(-)
>
> diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
> index 729cc1f05ac8..486789dac515 100644
> --- a/arch/x86/kvm/vmx/nested.c
> +++ b/arch/x86/kvm/vmx/nested.c
> @@ -1076,11 +1076,11 @@ static bool nested_vmx_get_vmexit_msr_value(struct kvm_vcpu *vcpu,
>  	 * VM-exit in L0, use the more accurate value.
>  	 */
>  	if (msr_index == MSR_IA32_TSC) {
> -		int i = vmx_find_loadstore_msr_slot(&vmx->msr_autostore.guest,
> +		int i = vmx_find_loadstore_msr_slot(&vmx->msr_autostore,
>  						    MSR_IA32_TSC);
>  
>  		if (i >= 0) {
> -			u64 val = vmx->msr_autostore.guest.val[i].value;
> +			u64 val = vmx->msr_autostore.val[i].value;
>  
>  			*data = kvm_read_l1_tsc(vcpu, val);
>  			return true;
> @@ -1167,7 +1167,7 @@ static void prepare_vmx_msr_autostore_list(struct kvm_vcpu *vcpu,
>  					   u32 msr_index)
>  {
>  	struct vcpu_vmx *vmx = to_vmx(vcpu);
> -	struct vmx_msrs *autostore = &vmx->msr_autostore.guest;
> +	struct vmx_msrs *autostore = &vmx->msr_autostore;
>  	bool in_vmcs12_store_list;
>  	int msr_autostore_slot;
>  	bool in_autostore_list;
> @@ -2366,7 +2366,7 @@ static void prepare_vmcs02_constant_state(struct vcpu_vmx *vmx)
>  	 * addresses are constant (for vmcs02), the counts can change based
>  	 * on L2's behavior, e.g. switching to/from long mode.
>  	 */
> -	vmcs_write64(VM_EXIT_MSR_STORE_ADDR, __pa(vmx->msr_autostore.guest.val));
> +	vmcs_write64(VM_EXIT_MSR_STORE_ADDR, __pa(vmx->msr_autostore.val));
>  	vmcs_write64(VM_EXIT_MSR_LOAD_ADDR, __pa(vmx->msr_autoload.host.val));
>  	vmcs_write64(VM_ENTRY_MSR_LOAD_ADDR, __pa(vmx->msr_autoload.guest.val));
>  
> @@ -2704,7 +2704,7 @@ static void prepare_vmcs02_rare(struct vcpu_vmx *vmx, struct vmcs12 *vmcs12)
>  	 */
>  	prepare_vmx_msr_autostore_list(&vmx->vcpu, MSR_IA32_TSC);
>  
> -	vmcs_write32(VM_EXIT_MSR_STORE_COUNT, vmx->msr_autostore.guest.nr);
> +	vmcs_write32(VM_EXIT_MSR_STORE_COUNT, vmx->msr_autostore.nr);
>  	vmcs_write32(VM_EXIT_MSR_LOAD_COUNT, vmx->msr_autoload.host.nr);
>  	vmcs_write32(VM_ENTRY_MSR_LOAD_COUNT, vmx->msr_autoload.guest.nr);
>  
> diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
> index 62ba2a2b9e98..23c92c41fd83 100644
> --- a/arch/x86/kvm/vmx/vmx.c
> +++ b/arch/x86/kvm/vmx/vmx.c
> @@ -6567,7 +6567,7 @@ void dump_vmcs(struct kvm_vcpu *vcpu)
>  	if (vmcs_read32(VM_ENTRY_MSR_LOAD_COUNT) > 0)
>  		vmx_dump_msrs("guest autoload", &vmx->msr_autoload.guest);
>  	if (vmcs_read32(VM_EXIT_MSR_STORE_COUNT) > 0)
> -		vmx_dump_msrs("guest autostore", &vmx->msr_autostore.guest);
> +		vmx_dump_msrs("autostore", &vmx->msr_autostore);
>  
>  	if (vmentry_ctl & VM_ENTRY_LOAD_CET_STATE)
>  		pr_err("S_CET = 0x%016lx, SSP = 0x%016lx, SSP TABLE = 0x%016lx\n",
> diff --git a/arch/x86/kvm/vmx/vmx.h b/arch/x86/kvm/vmx/vmx.h
> index d7a96c84371f..4ce653d729ca 100644
> --- a/arch/x86/kvm/vmx/vmx.h
> +++ b/arch/x86/kvm/vmx/vmx.h
> @@ -245,9 +245,7 @@ struct vcpu_vmx {
>  		struct vmx_msrs host;
>  	} msr_autoload;
>  
> -	struct msr_autostore {
> -		struct vmx_msrs guest;
> -	} msr_autostore;
> +	struct vmx_msrs msr_autostore;
>  
>  	struct {
>  		int vm86_active;

LGTM.

Reviewed-by: Dapeng Mi <dapeng1.mi@linux.intel.com>



-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
