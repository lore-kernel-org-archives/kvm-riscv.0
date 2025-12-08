Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08112D3ABEF
	for <kvm-riscv@archiver.kernel.org>; Mon,  8 Dec 2025 09:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PmCXZXxe8Pb0mv8mKWKiDdsDPoU6/weUQqVnkBlCCdI=; b=d9Ju+Tiq7rdO0Y
	NkdwYems/3Lz9L5P3KY4goTBN+1/2a4cWR/752OcRxI3l5pFJdhth0TEXVAn1f7TfWZYXnoz21ZuK
	jN0W9FCuPe+TqirLG88QuVAcDlaDJI1+GmbpNgARFdNJNx2Z648M358Iq2VxVCVIv7nZAiQDNEi2l
	C2qmtbot3tTvj4cxHlw3WgCfmD22Pex+EHWRu33YZuPDWqpfB6oEXnJzMBFq1aakI8UK3pd1sVZwR
	yfEmMItSyNBWKey2P582VSGoLrC+8E8YTFu93lkhhqOa8/o3EXrSpfSGGmnFskHC/9edg8NgY4YPW
	reERKyN4IyZ00sHsLCyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSXfn-0000000CtRb-2XYU;
	Mon, 08 Dec 2025 09:36:51 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSXfl-0000000CtQs-0q5k;
	Mon, 08 Dec 2025 09:36:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765186610; x=1796722610;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=10zHr1SKSV4NU1wJMxeh9bCQVTkfIemMgU27+u6iC/0=;
  b=PP7dzO0evI4UAjcZxKUHfLu3IaqCmD6XnlIaBOqa8Fc0WA0RZ3gG5vbx
   n2AeZjmYIZENMnh5X0RJblsgSSlOwEkqqqLCkeXlHJ7aqhNsg9StR8mSF
   Rstjsg1Z4dbkrGjE9Ts2xCV7l3fam/v7CZO/r742VMOp/eycHMEGuAPqq
   El+2/ecbojZxgVm5JhBo0Cqwy7hYdeoK2Yl0p5TXkgwZ3zPVDVjc5HK2U
   yeU4NCPO62vI3XdHRqL4CKbMu9LQi0Vq8xZuuhu6dPt42UtcwTJaKQQje
   AqpecE32HoPkfXzh0k0knHlkyEemZM65xZHCytRuQ8vSCl8O5tGgCuU2c
   A==;
X-CSE-ConnectionGUID: 7Kay4eSCStmMe4Vo01B2cA==
X-CSE-MsgGUID: wBvmKIheT1ey6ZcEuHfBmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67288451"
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; 
   d="scan'208";a="67288451"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 01:36:49 -0800
X-CSE-ConnectionGUID: bsfJ0l67RQmzvo/wRHYFCA==
X-CSE-MsgGUID: d+3gSK50QVqn044E2530nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; 
   d="scan'208";a="196157499"
Received: from dapengmi-mobl1.ccr.corp.intel.com (HELO [10.124.240.12]) ([10.124.240.12])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 01:36:40 -0800
Message-ID: <78fb04ca-59a2-493a-a82b-d59aaf6b557a@linux.intel.com>
Date: Mon, 8 Dec 2025 17:36:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 41/44] KVM: VMX: Compartmentalize adding MSRs to host
 vs. guest auto-load list
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
 <20251206001720.468579-42-seanjc@google.com>
Content-Language: en-US
From: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
In-Reply-To: <20251206001720.468579-42-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_013649_281090_2C06C3EB 
X-CRM114-Status: GOOD (  18.00  )
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
> Undo the bundling of the "host" and "guest" MSR auto-load list logic so
> that the code can be deduplicated by factoring out the logic to a separate
> helper.  Now that "list full" situations are treated as fatal to the VM,
> there is no need to pre-check both lists.
>
> For all intents and purposes, this reverts the add_atomic_switch_msr()
> changes made by commit 3190709335dd ("x86/KVM/VMX: Separate the VMX
> AUTOLOAD guest/host number accounting").
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/kvm/vmx/vmx.c | 23 ++++++++++++-----------
>  1 file changed, 12 insertions(+), 11 deletions(-)
>
> diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
> index be2a2580e8f1..018e01daab68 100644
> --- a/arch/x86/kvm/vmx/vmx.c
> +++ b/arch/x86/kvm/vmx/vmx.c
> @@ -1096,9 +1096,9 @@ static __always_inline void add_atomic_switch_msr_special(struct vcpu_vmx *vmx,
>  static void add_atomic_switch_msr(struct vcpu_vmx *vmx, unsigned msr,
>  				  u64 guest_val, u64 host_val)
>  {
> -	int i, j = 0;
>  	struct msr_autoload *m = &vmx->msr_autoload;
>  	struct kvm *kvm = vmx->vcpu.kvm;
> +	int i;
>  
>  	switch (msr) {
>  	case MSR_EFER:
> @@ -1133,25 +1133,26 @@ static void add_atomic_switch_msr(struct vcpu_vmx *vmx, unsigned msr,
>  	}
>  
>  	i = vmx_find_loadstore_msr_slot(&m->guest, msr);
> -	j = vmx_find_loadstore_msr_slot(&m->host, msr);
> -
> -	if (KVM_BUG_ON(i < 0 && m->guest.nr == MAX_NR_LOADSTORE_MSRS, kvm) ||
> -	    KVM_BUG_ON(j < 0 &&  m->host.nr == MAX_NR_LOADSTORE_MSRS, kvm))
> -		return;
> -
>  	if (i < 0) {
> +		if (KVM_BUG_ON(m->guest.nr == MAX_NR_LOADSTORE_MSRS, kvm))
> +			return;
> +
>  		i = m->guest.nr++;
>  		m->guest.val[i].index = msr;
>  		vmcs_write32(VM_ENTRY_MSR_LOAD_COUNT, m->guest.nr);
>  	}
>  	m->guest.val[i].value = guest_val;
>  
> -	if (j < 0) {
> -		j = m->host.nr++;
> -		m->host.val[j].index = msr;
> +	i = vmx_find_loadstore_msr_slot(&m->host, msr);
> +	if (i < 0) {
> +		if (KVM_BUG_ON(m->host.nr == MAX_NR_LOADSTORE_MSRS, kvm))
> +			return;
> +
> +		i = m->host.nr++;
> +		m->host.val[i].index = msr;
>  		vmcs_write32(VM_EXIT_MSR_LOAD_COUNT, m->host.nr);
>  	}
> -	m->host.val[j].value = host_val;
> +	m->host.val[i].value = host_val;
>  }
>  
>  static bool update_transition_efer(struct vcpu_vmx *vmx)

Reviewed-by: Dapeng Mi <dapeng1.mi@linux.intel.com>



-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
