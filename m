Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB9F8CCF9E3
	for <kvm-riscv@archiver.kernel.org>; Tue,  4 Nov 2025 06:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lhD/ifuIYEu1lnCEkt2r28q0bxxx8jIZbFV6g3JSXcE=; b=1Vs9/SK2/yoUNe
	NghDp3SMT3P3LqfroJncrv5INU3hwdt9ysyU4jU7Z/bHl0nT7jFAYICBBgSju3Ydn50WAClVuMZv4
	W/KbUU/GpiPrxkgP+WGx29Ou/5Qh7fQ1beKwhdUXAsnQxykPYNzRBYxpItKmZRqg7N9dvg9XUprgV
	J9ECRD6FU7fXO3sxHr8P7Lod4mQbesjfKG9hH1ak2uZICP0hNEyfMJdiPLDyonOO3hZCB0mrccMlA
	hPEuL20kTYxqmHvP2SFdKuZpXn1txqSgkrgRjztEOHkiUQzmZ9T1CPIs2Tvz7D+bs174D51dZ5NVy
	5N2ql+6wuBh2HNxaVliQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGALr-0000000BE00-0279;
	Tue, 04 Nov 2025 06:17:07 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGALp-0000000BDzR-0eoO;
	Tue, 04 Nov 2025 06:17:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762237025; x=1793773025;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=mSKoZmGkcXW407B8mNGjY9EejInAopsSE39gAyEUn9k=;
  b=Rfor26ryKck7JikmMrZaDlMjd8DS0Y0HIGDiL+9NLdlh2m+8722zaPj8
   jnVHUd+xibkBOSc5fWmGwAI6KCXdacwMWo5322j81qXhaWrCHeEV7pIuL
   RTK/P5zHLljo24bQjXEcfRrw0bxYIJ6aI2fNnV4dO1oHfEYlGFCM0xBQ/
   psG8ObHs722naTnIdXbGBt04ntiPHaa2J//N1N19Fx3nNS5aI5kR/iizE
   dmwoyt0kpumq562P1da93yHfsNbN1bhQWN7nIoDGobEP/onOMWWUZqook
   Hm5NsfNbkjL8YysNLY3ozdOXRDq9ZlKnilO++uQNKTxYJ5GzlpqgbYaOb
   w==;
X-CSE-ConnectionGUID: VuLhlPnCRiqXi5WMEzMLmg==
X-CSE-MsgGUID: CvDUfFj6TyeVYOw4t/rvwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="63528091"
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; 
   d="scan'208";a="63528091"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 22:17:02 -0800
X-CSE-ConnectionGUID: IL8VAT68RkmI5IbPyY1fNw==
X-CSE-MsgGUID: u8bxLoPYS/KxoreV4M7Dmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; 
   d="scan'208";a="210576877"
Received: from yinghaoj-desk.ccr.corp.intel.com (HELO [10.238.1.225]) ([10.238.1.225])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 22:16:56 -0800
Message-ID: <31da959f-d004-4ae0-a6a7-d5d31b646b70@linux.intel.com>
Date: Tue, 4 Nov 2025 14:16:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 27/28] KVM: TDX: Bug the VM if extending the initial
 measurement fails
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>,
 Huacai Chen <chenhuacai@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Kirill A. Shutemov" <kas@kernel.org>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, x86@kernel.org, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 Kai Huang <kai.huang@intel.com>, Michael Roth <michael.roth@amd.com>,
 Yan Zhao <yan.y.zhao@intel.com>, Vishal Annapurve <vannapurve@google.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Ackerley Tng <ackerleytng@google.com>
References: <20251030200951.3402865-1-seanjc@google.com>
 <20251030200951.3402865-28-seanjc@google.com>
Content-Language: en-US
From: Binbin Wu <binbin.wu@linux.intel.com>
In-Reply-To: <20251030200951.3402865-28-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_221705_217258_BCB09C08 
X-CRM114-Status: GOOD (  29.20  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org



On 10/31/2025 4:09 AM, Sean Christopherson wrote:
> WARN and terminate the VM if TDH_MR_EXTEND fails, as extending the
> measurement should fail if and only if there is a KVM bug, or if the S-EPT
> mapping is invalid.  Now that KVM makes all state transitions mutually
> exclusive via tdx_vm_state_guard, it should be impossible for S-EPT
> mappings to be removed between kvm_tdp_mmu_map_private_pfn() and
> tdh_mr_extend().
>
> Holding slots_lock prevents zaps due to memslot updates,
> filemap_invalidate_lock() prevents zaps due to guest_memfd PUNCH_HOLE,
> vcpu->mutex locks prevents updates from other vCPUs, kvm->lock prevents
> VM-scoped ioctls from creating havoc (e.g. by creating new vCPUs), and all
> usage of kvm_zap_gfn_range() is mutually exclusive with S-EPT entries that
> can be used for the initial image.
>
> For kvm_zap_gfn_range(), the call from sev.c is obviously mutually
> exclusive, TDX disallows KVM_X86_QUIRK_IGNORE_GUEST_PAT so the same goes
> for kvm_noncoherent_dma_assignment_start_or_stop(), and
> __kvm_set_or_clear_apicv_inhibit() is blocked by virtue of holding all
> VM and vCPU mutexes (and the APIC page has its own non-guest_memfd memslot

Nit:
It sounds like TDX is using the memslot for the APIC page, but for a TD, the
memslot for the APIC page is never initialized or used?

> and so can't be used for the initial image, which means that too is
> mutually exclusive irrespective of locking).
>
> Opportunistically return early if the region doesn't need to be measured
> in order to reduce line lengths and avoid wraps.  Similarly, immediately
> and explicitly return if TDH_MR_EXTEND fails to make it clear that KVM
> needs to bail entirely if extending the measurement fails.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>

> ---
>   arch/x86/kvm/vmx/tdx.c | 24 +++++++++++++-----------
>   1 file changed, 13 insertions(+), 11 deletions(-)
>
> diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
> index 8bcdec049ac6..762f2896547f 100644
> --- a/arch/x86/kvm/vmx/tdx.c
> +++ b/arch/x86/kvm/vmx/tdx.c
> @@ -3123,21 +3123,23 @@ static int tdx_gmem_post_populate(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn,
>   
>   	put_page(src_page);
>   
> -	if (ret)
> +	if (ret || !(arg->flags & KVM_TDX_MEASURE_MEMORY_REGION))
>   		return ret;
>   
> -	if (arg->flags & KVM_TDX_MEASURE_MEMORY_REGION) {
> -		for (i = 0; i < PAGE_SIZE; i += TDX_EXTENDMR_CHUNKSIZE) {
> -			err = tdh_mr_extend(&kvm_tdx->td, gpa + i, &entry,
> -					    &level_state);
> -			if (err) {
> -				ret = -EIO;
> -				break;
> -			}
> -		}
> +	/*
> +	 * Note, MR.EXTEND can fail if the S-EPT mapping is somehow removed
> +	 * between mapping the pfn and now, but slots_lock prevents memslot
> +	 * updates, filemap_invalidate_lock() prevents guest_memfd updates,
> +	 * mmu_notifier events can't reach S-EPT entries, and KVM's internal
> +	 * zapping flows are mutually exclusive with S-EPT mappings.
> +	 */
> +	for (i = 0; i < PAGE_SIZE; i += TDX_EXTENDMR_CHUNKSIZE) {
> +		err = tdh_mr_extend(&kvm_tdx->td, gpa + i, &entry, &level_state);
> +		if (TDX_BUG_ON_2(err, TDH_MR_EXTEND, entry, level_state, kvm))
> +			return -EIO;
>   	}
>   
> -	return ret;
> +	return 0;
>   }
>   
>   static int tdx_vcpu_init_mem_region(struct kvm_vcpu *vcpu, struct kvm_tdx_cmd *cmd)


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
