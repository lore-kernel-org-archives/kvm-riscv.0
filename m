Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B955BD3B7DD
	for <kvm-riscv@archiver.kernel.org>; Mon,  8 Dec 2025 09:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tKxvagDqiCVhvY20ZWmR4mGEOPNuT+5vtgOud+QnT/k=; b=d4Ao6v1uuGunLX
	Yo2EdOWjSFB9ESvI1f2xSTvRJLDf3H9gZWlMO0IebzghOtRQmZhXXBlAsyJT5LNV0lPusN1b1aJU/
	pRbZhq2ujEO99WjdNGRenVPL1JuldVpOZ+3Abno/xeaUmsgc60/4gKy+2MToX/HacESz4SBHF8vte
	7M7yobAmCfvfr4v6g13ftKw17P2C3tdswPxLoTlj95ulXGckiSNNNUV+R/M4CkKmGqpxMiLLBm4Rw
	owRU9M9u9EOJOSMpfrS3LTYwxXXB+dHIQrbdYRgwTS0uFXZJJqyM9rEdbRIp1c9i3jfuTivi3DLGT
	wxHy2II+YYsajfa+m8UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSXeR-0000000CtAj-2102;
	Mon, 08 Dec 2025 09:35:27 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSXeO-0000000Ct9O-1EjH;
	Mon, 08 Dec 2025 09:35:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765186525; x=1796722525;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=dxwlUYyotMAj1FOCT7HUPg377L9SdqVfiNdsHHzR+yM=;
  b=PuKCZyqOjReTjq8jEzdtw98j6Asvg3VBZVzEepHmgcG+kd/UdjB6DMm9
   QeWnVGXvXcBIOPzfRsOIIr8wNxdDJhHMLCzv/twpO9p/1W4dypsT6eo0U
   TR0oFBEqYdtXyuc+jTmKwWBnwrdynpk2rD3Vmroy1iT+OBm13TZoN86v8
   zzmg7PEL/6Fup2Fz+zsCk/KgHdUP+jovSbQjswyp4aTDQDPIdVCGMNHfC
   iJh65ND4f3shKVNknV7HpnZVrkfnLAcxcwZURDxVaCIF7JAF034NO21QR
   obQwZ7KhUom/eRoHQTdVp8OIAh1nKy9rpzqmyTDRkH0sbVzC/ssWWgoaX
   Q==;
X-CSE-ConnectionGUID: Pwj96jJJRUSpcR1/1p1Wag==
X-CSE-MsgGUID: vdytw3bLQomg0tgPjQydbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67288213"
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; 
   d="scan'208";a="67288213"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 01:35:24 -0800
X-CSE-ConnectionGUID: GvTBKVl5QN2hGFwHvhUlpA==
X-CSE-MsgGUID: UZpj0zMRTM69UjjLsI6NgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; 
   d="scan'208";a="196157405"
Received: from dapengmi-mobl1.ccr.corp.intel.com (HELO [10.124.240.12]) ([10.124.240.12])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 01:35:15 -0800
Message-ID: <c2562f0b-9d73-479d-acaf-27da2fbe0c1e@linux.intel.com>
Date: Mon, 8 Dec 2025 17:35:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 40/44] KVM: VMX: Set MSR index auto-load entry if and
 only if entry is "new"
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
 <20251206001720.468579-41-seanjc@google.com>
Content-Language: en-US
From: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
In-Reply-To: <20251206001720.468579-41-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_013524_373112_E5D636B2 
X-CRM114-Status: GOOD (  16.85  )
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
> When adding an MSR to the auto-load lists, update the MSR index in the
> list entry if and only if a new entry is being inserted, as 'i' can only
> be non-negative if vmx_find_loadstore_msr_slot() found an entry with the
> MSR's index.  Unnecessarily setting the index is benign, but it makes it
> harder to see that updating the value is necessary even when an existing
> entry for the MSR was found.
>
> No functional change intended.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/kvm/vmx/vmx.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
> index 2c50ebf4ff1b..be2a2580e8f1 100644
> --- a/arch/x86/kvm/vmx/vmx.c
> +++ b/arch/x86/kvm/vmx/vmx.c
> @@ -1141,16 +1141,16 @@ static void add_atomic_switch_msr(struct vcpu_vmx *vmx, unsigned msr,
>  
>  	if (i < 0) {
>  		i = m->guest.nr++;
> +		m->guest.val[i].index = msr;
>  		vmcs_write32(VM_ENTRY_MSR_LOAD_COUNT, m->guest.nr);
>  	}
> -	m->guest.val[i].index = msr;
>  	m->guest.val[i].value = guest_val;
>  
>  	if (j < 0) {
>  		j = m->host.nr++;
> +		m->host.val[j].index = msr;
>  		vmcs_write32(VM_EXIT_MSR_LOAD_COUNT, m->host.nr);
>  	}
> -	m->host.val[j].index = msr;
>  	m->host.val[j].value = host_val;
>  }
>  

Reviewed-by: Dapeng Mi <dapeng1.mi@linux.intel.com>



-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
