Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F444C5B552
	for <kvm-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 06:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nd7RvbUKbfJLXRBuaWMcD+gbOAKIy3LTLZRsglGzVYo=; b=ZHm65kR8AAifaQ
	28SVUC15AwphE0/zZpxfZA48kTXaF/HnBEVTBxKjiIKtG2ogCqPi3wn2K9IQyfdtoqj9iv323lITr
	kjxS2LeeDZHIvvdAizkLsH5f7wM0YTwgjQi58EnOgVMdh1MYTTNgp86SqnO/FPCyRpSwsIYPmbIBK
	JRivmNeraWCgjituA2l6d0ctXlEhP7VLS4IwQowq2TrUw/h0WDsugkzPuPW+Pu1SdfkG+91b8D7sN
	4hRowyzP9yxBpUTjazEE46KjvhWm7XZgkKi4er2DllnlEdd+ieXx/TX5ZsDBsCtbPFRPIgGHd0rZm
	slHWCISqDDnek0+t9qSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOsK5-00000005um9-3OYa;
	Tue, 10 Jun 2025 06:19:01 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOsJq-00000005ujx-2lHX
	for kvm-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 06:18:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749536327; x=1781072327;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=aqaF2FH8CbMEb7CF0tc3Ez2NC3jhnDqME0bWTPyhxqg=;
  b=Tgw2BpLmC7SlE2iqWtiZ5PU5fC9Vl9tXNSQD20oOym7ARgsGKrxOHwOm
   GKPgZ4gFE/AyR2AXhlKPHCht4ZhMKfZjjFuIy8Rdkvq2DEFf72vbOzZ65
   JNhZPPU4EDDHBmmbcy37SYDbS54TOCRWOZHjMhK0XL2pFvaA6kVmiRSHV
   Ao8jdt9U/2uU5ElI4FH2ifNcekYZmr1mjJbkADQsThXwdbFN55AG2K+Wz
   51H6ttUjHVBfKtlDb0n0FE2PGc6/7MSt0R+JcWxInALU9qa3yesoUur0x
   lH+Nee6d3am3tnus+GvcjvPNZFe1ymLejsyzX+4YhPAwa5Gvc0BUrGMWt
   A==;
X-CSE-ConnectionGUID: TiGYy93CQGCK0KmhEHDpwg==
X-CSE-MsgGUID: T+TCxtjCTH+FVzT3BzuR/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="51487129"
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="51487129"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 23:18:46 -0700
X-CSE-ConnectionGUID: ANAFZMdBRW+xc9QcNP75aw==
X-CSE-MsgGUID: 7eTE/kRZScapcKfNoDAhxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="151743551"
Received: from dapengmi-mobl1.ccr.corp.intel.com (HELO [10.124.245.144]) ([10.124.245.144])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 23:18:43 -0700
Message-ID: <e48708a0-d7d8-41bd-8d90-d7f7482489f3@linux.intel.com>
Date: Tue, 10 Jun 2025 14:18:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH 05/16] x86: Implement get_supported_xcr0()
 using X86_PROPERTY_SUPPORTED_XCR0_{LO,HI}
To: Sean Christopherson <seanjc@google.com>,
 Andrew Jones <andrew.jones@linux.dev>, Janosch Frank
 <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>,
 =?UTF-8?Q?Nico_B=C3=B6hr?= <nrb@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 kvm@vger.kernel.org
References: <20250529221929.3807680-1-seanjc@google.com>
 <20250529221929.3807680-6-seanjc@google.com>
Content-Language: en-US
From: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
In-Reply-To: <20250529221929.3807680-6-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_231846_747043_9618848A 
X-CRM114-Status: GOOD (  13.65  )
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


On 5/30/2025 6:19 AM, Sean Christopherson wrote:
> Use X86_PROPERTY_SUPPORTED_XCR0_{LO,HI} to implement get_supported_xcr0().
>
> Opportunistically rename the helper and move it to processor.h.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  lib/x86/processor.h |  9 +++++++++
>  x86/xsave.c         | 11 +----------
>  2 files changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/lib/x86/processor.h b/lib/x86/processor.h
> index 8c6f28a3..cbfd2ee1 100644
> --- a/lib/x86/processor.h
> +++ b/lib/x86/processor.h
> @@ -442,6 +442,15 @@ static inline u8 cpuid_maxphyaddr(void)
>  	return this_cpu_property(X86_PROPERTY_MAX_PHY_ADDR);
>  }
>  
> +static inline u64 this_cpu_supported_xcr0(void)
> +{
> +	if (!this_cpu_has_p(X86_PROPERTY_SUPPORTED_XCR0_LO))
> +		return 0;
> +
> +	return (u64)this_cpu_property(X86_PROPERTY_SUPPORTED_XCR0_LO) |
> +	       ((u64)this_cpu_property(X86_PROPERTY_SUPPORTED_XCR0_HI) << 32);
> +}
> +
>  struct far_pointer32 {
>  	u32 offset;
>  	u16 selector;
> diff --git a/x86/xsave.c b/x86/xsave.c
> index 5d80f245..cc8e3a0a 100644
> --- a/x86/xsave.c
> +++ b/x86/xsave.c
> @@ -8,15 +8,6 @@
>  #define uint64_t unsigned long long
>  #endif
>  
> -static uint64_t get_supported_xcr0(void)
> -{
> -    struct cpuid r;
> -    r = cpuid_indexed(0xd, 0);
> -    printf("eax %x, ebx %x, ecx %x, edx %x\n",
> -            r.a, r.b, r.c, r.d);
> -    return r.a + ((u64)r.d << 32);
> -}
> -
>  #define XCR_XFEATURE_ENABLED_MASK       0x00000000
>  #define XCR_XFEATURE_ILLEGAL_MASK       0x00000010
>  
> @@ -33,7 +24,7 @@ static void test_xsave(void)
>  
>      printf("Legal instruction testing:\n");
>  
> -    supported_xcr0 = get_supported_xcr0();
> +    supported_xcr0 = this_cpu_supported_xcr0();
>      printf("Supported XCR0 bits: %#lx\n", supported_xcr0);
>  
>      test_bits = XSTATE_FP | XSTATE_SSE;

Reviewed-by: Dapeng Mi <dapeng1.mi@linux.intel.com>



-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
