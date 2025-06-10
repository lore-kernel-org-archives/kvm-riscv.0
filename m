Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA9BC5B543
	for <kvm-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 06:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FrpU0ZDe/E3Pr+o8hNumqA+kagxwnz8MQoB/MLvnEU0=; b=qXkcV0DlUsn9UY
	kS2bOZWvMxs09lSTbSLPthjcq+vV49UpkOpAAtS/YzC0bsqr4pp+0uFSpenuGV3cbFWP2tME7j/mt
	2Ex/1OX0WqRcjX5KmwhxHkUHvt3wZdZbwRuE6fS0ApWpmMrU3XEnJVFxphNWyi+ff+JPL5ggTc4AM
	fx+yvUUxTWAvLQ+P0uOLo+ZMIHMC0t5nmWE6WQp5mLKJiA7pSp6K70XicU/yJiEZ6BN1n0kj4B8Ny
	Y7ylm3ikk1MCS9WAMX4NMRxPto1qjPzgf58arsE5W/A6zNSxdlV+FobK9c6AWOhAgMwkhsHyspZfb
	44Mp3kGDWkTMzLMWANOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOsFu-00000005uQo-1HPR;
	Tue, 10 Jun 2025 06:14:42 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOsFs-00000005uQS-12D7
	for kvm-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 06:14:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749536080; x=1781072080;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=HpF/6oC2249Ooazyo3O/KlF08L8pHzeGopHxN3WVlAQ=;
  b=jiyQF7dK5f3KSZK3Z68tv/OhvSomOf8xvJ1M9fqONdF3wSa5WHIsuIw1
   QvAQGX4tsvC5Z0+WZmdQLGp+B/vugr6EP4ggiHFWnYLPxGI50j8Zr/9qX
   rzstVwdLFGLE1Iz32UP0X0RbMew3U3Ivpm0x0AXOs0RjvM089SLGbfkcD
   mxS2ve3E4idDVAF09BL9d2kUX40AtU9+y/ATXnFza5E36GJDIBrY5ZDW5
   eU0AznUCllnXT7zdr/ylTogbeP4BdNWE1l9jy8S3Hk7fr6usSCIkTLVQr
   90GCN8Tw8ubHpGUqSQMPNRmy/KR2o7vdFEBWEOZ0iv7zLzR6Qyb/zdEU1
   g==;
X-CSE-ConnectionGUID: RR+03/x8QEi3wunx82Ycvg==
X-CSE-MsgGUID: 0Yi+R/oEQvirDNARGXFTdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="51773874"
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="51773874"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 23:14:40 -0700
X-CSE-ConnectionGUID: X4sHm9zgSVuDYxraTOHUyg==
X-CSE-MsgGUID: js8i342GRFa/Z9pwbyMF1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="151611163"
Received: from dapengmi-mobl1.ccr.corp.intel.com (HELO [10.124.245.144]) ([10.124.245.144])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 23:14:37 -0700
Message-ID: <32587e5d-d1d7-4a39-992e-f0b064cb96e3@linux.intel.com>
Date: Tue, 10 Jun 2025 14:14:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH 03/16] x86: Add X86_PROPERTY_* framework to
 retrieve CPUID values
To: Sean Christopherson <seanjc@google.com>,
 Andrew Jones <andrew.jones@linux.dev>, Janosch Frank
 <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>,
 =?UTF-8?Q?Nico_B=C3=B6hr?= <nrb@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 kvm@vger.kernel.org
References: <20250529221929.3807680-1-seanjc@google.com>
 <20250529221929.3807680-4-seanjc@google.com>
Content-Language: en-US
From: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
In-Reply-To: <20250529221929.3807680-4-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_231440_304792_396EFF09 
X-CRM114-Status: GOOD (  21.80  )
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
> Introduce X86_PROPERTY_* to allow retrieving values/properties from CPUID
> leafs, e.g. MAXPHYADDR from CPUID.0x80000008.  Use the same core code as
> X86_FEATURE_*, the primary difference is that properties are multi-bit
> values, whereas features enumerate a single bit.
>
> Add this_cpu_has_p() to allow querying whether or not a property exists
> based on the maximum leaf associated with the property, e.g. MAXPHYADDR
> doesn't exist if the max leaf for 0x8000_xxxx is less than 0x8000_0008.
>
> Use the new property infrastructure in cpuid_maxphyaddr() to prove that
> the code works as intended.  Future patches will convert additional code.
>
> Note, the code, nomenclature, changelog, etc. are all stolen from KVM
> selftests.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  lib/x86/processor.h | 109 +++++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 102 insertions(+), 7 deletions(-)
>
> diff --git a/lib/x86/processor.h b/lib/x86/processor.h
> index 3ac6711d..6b61a38b 100644
> --- a/lib/x86/processor.h
> +++ b/lib/x86/processor.h
> @@ -218,13 +218,6 @@ static inline struct cpuid cpuid(u32 function)
>  	return cpuid_indexed(function, 0);
>  }
>  
> -static inline u8 cpuid_maxphyaddr(void)
> -{
> -	if (raw_cpuid(0x80000000, 0).a < 0x80000008)
> -	return 36;
> -	return raw_cpuid(0x80000008, 0).a & 0xff;
> -}
> -
>  static inline bool is_intel(void)
>  {
>  	struct cpuid c = cpuid(0);
> @@ -329,6 +322,74 @@ struct x86_cpu_feature {
>  #define X86_FEATURE_VNMI		X86_CPU_FEATURE(0x8000000A, 0, EDX, 25)
>  #define	X86_FEATURE_AMD_PMU_V2		X86_CPU_FEATURE(0x80000022, 0, EAX, 0)
>  
> +/*
> + * Same idea as X86_FEATURE_XXX, but X86_PROPERTY_XXX retrieves a multi-bit
> + * value/property as opposed to a single-bit feature.  Again, pack the info
> + * into a 64-bit value to pass by value with no overhead on 64-bit builds.
> + */
> +struct x86_cpu_property {
> +	u32	function;
> +	u8	index;
> +	u8	reg;
> +	u8	lo_bit;
> +	u8	hi_bit;
> +};
> +#define	X86_CPU_PROPERTY(fn, idx, gpr, low_bit, high_bit)			\
> +({										\
> +	struct x86_cpu_property property = {					\
> +		.function = fn,							\
> +		.index = idx,							\
> +		.reg = gpr,							\
> +		.lo_bit = low_bit,						\
> +		.hi_bit = high_bit,						\
> +	};									\
> +										\
> +	static_assert(low_bit < high_bit);					\
> +	static_assert((fn & 0xc0000000) == 0 ||					\
> +		      (fn & 0xc0000000) == 0x40000000 ||			\
> +		      (fn & 0xc0000000) == 0x80000000 ||			\
> +		      (fn & 0xc0000000) == 0xc0000000);				\
> +	static_assert(idx < BIT(sizeof(property.index) * BITS_PER_BYTE));	\
> +	property;								\
> +})
> +
> +#define X86_PROPERTY_MAX_BASIC_LEAF		X86_CPU_PROPERTY(0, 0, EAX, 0, 31)
> +#define X86_PROPERTY_PMU_VERSION		X86_CPU_PROPERTY(0xa, 0, EAX, 0, 7)
> +#define X86_PROPERTY_PMU_NR_GP_COUNTERS		X86_CPU_PROPERTY(0xa, 0, EAX, 8, 15)
> +#define X86_PROPERTY_PMU_GP_COUNTERS_BIT_WIDTH	X86_CPU_PROPERTY(0xa, 0, EAX, 16, 23)
> +#define X86_PROPERTY_PMU_EBX_BIT_VECTOR_LENGTH	X86_CPU_PROPERTY(0xa, 0, EAX, 24, 31)
> +#define X86_PROPERTY_PMU_EVENTS_MASK		X86_CPU_PROPERTY(0xa, 0, EBX, 0, 7)
> +#define X86_PROPERTY_PMU_FIXED_COUNTERS_BITMASK	X86_CPU_PROPERTY(0xa, 0, ECX, 0, 31)
> +#define X86_PROPERTY_PMU_NR_FIXED_COUNTERS	X86_CPU_PROPERTY(0xa, 0, EDX, 0, 4)
> +#define X86_PROPERTY_PMU_FIXED_COUNTERS_BIT_WIDTH	X86_CPU_PROPERTY(0xa, 0, EDX, 5, 12)
> +
> +#define X86_PROPERTY_SUPPORTED_XCR0_LO		X86_CPU_PROPERTY(0xd,  0, EAX,  0, 31)
> +#define X86_PROPERTY_XSTATE_MAX_SIZE_XCR0	X86_CPU_PROPERTY(0xd,  0, EBX,  0, 31)
> +#define X86_PROPERTY_XSTATE_MAX_SIZE		X86_CPU_PROPERTY(0xd,  0, ECX,  0, 31)
> +#define X86_PROPERTY_SUPPORTED_XCR0_HI		X86_CPU_PROPERTY(0xd,  0, EDX,  0, 31)
> +
> +#define X86_PROPERTY_XSTATE_TILE_SIZE		X86_CPU_PROPERTY(0xd, 18, EAX,  0, 31)
> +#define X86_PROPERTY_XSTATE_TILE_OFFSET		X86_CPU_PROPERTY(0xd, 18, EBX,  0, 31)
> +#define X86_PROPERTY_AMX_MAX_PALETTE_TABLES	X86_CPU_PROPERTY(0x1d, 0, EAX,  0, 31)
> +#define X86_PROPERTY_AMX_TOTAL_TILE_BYTES	X86_CPU_PROPERTY(0x1d, 1, EAX,  0, 15)
> +#define X86_PROPERTY_AMX_BYTES_PER_TILE		X86_CPU_PROPERTY(0x1d, 1, EAX, 16, 31)
> +#define X86_PROPERTY_AMX_BYTES_PER_ROW		X86_CPU_PROPERTY(0x1d, 1, EBX, 0,  15)
> +#define X86_PROPERTY_AMX_NR_TILE_REGS		X86_CPU_PROPERTY(0x1d, 1, EBX, 16, 31)
> +#define X86_PROPERTY_AMX_MAX_ROWS		X86_CPU_PROPERTY(0x1d, 1, ECX, 0,  15)
> +
> +#define X86_PROPERTY_MAX_KVM_LEAF		X86_CPU_PROPERTY(0x40000000, 0, EAX, 0, 31)
> +
> +#define X86_PROPERTY_MAX_EXT_LEAF		X86_CPU_PROPERTY(0x80000000, 0, EAX, 0, 31)
> +#define X86_PROPERTY_MAX_PHY_ADDR		X86_CPU_PROPERTY(0x80000008, 0, EAX, 0, 7)
> +#define X86_PROPERTY_MAX_VIRT_ADDR		X86_CPU_PROPERTY(0x80000008, 0, EAX, 8, 15)
> +#define X86_PROPERTY_GUEST_MAX_PHY_ADDR		X86_CPU_PROPERTY(0x80000008, 0, EAX, 16, 23)
> +#define X86_PROPERTY_SEV_C_BIT			X86_CPU_PROPERTY(0x8000001F, 0, EBX, 0, 5)
> +#define X86_PROPERTY_PHYS_ADDR_REDUCTION	X86_CPU_PROPERTY(0x8000001F, 0, EBX, 6, 11)
> +#define X86_PROPERTY_NR_PERFCTR_CORE		X86_CPU_PROPERTY(0x80000022, 0, EBX, 0, 3)
> +#define X86_PROPERTY_NR_PERFCTR_NB		X86_CPU_PROPERTY(0x80000022, 0, EBX, 10, 15)
> +
> +#define X86_PROPERTY_MAX_CENTAUR_LEAF		X86_CPU_PROPERTY(0xC0000000, 0, EAX, 0, 31)
> +
>  static inline u32 __this_cpu_has(u32 function, u32 index, u8 reg, u8 lo, u8 hi)
>  {
>  	union {
> @@ -347,6 +408,40 @@ static inline bool this_cpu_has(struct x86_cpu_feature feature)
>  			      feature.reg, feature.bit, feature.bit);
>  }
>  
> +static inline uint32_t this_cpu_property(struct x86_cpu_property property)
> +{
> +	return __this_cpu_has(property.function, property.index,
> +			      property.reg, property.lo_bit, property.hi_bit);
> +}
> +
> +static __always_inline bool this_cpu_has_p(struct x86_cpu_property property)
> +{
> +	uint32_t max_leaf;
> +
> +	switch (property.function & 0xc0000000) {
> +	case 0:
> +		max_leaf = this_cpu_property(X86_PROPERTY_MAX_BASIC_LEAF);
> +		break;
> +	case 0x40000000:
> +		max_leaf = this_cpu_property(X86_PROPERTY_MAX_KVM_LEAF);
> +		break;
> +	case 0x80000000:
> +		max_leaf = this_cpu_property(X86_PROPERTY_MAX_EXT_LEAF);
> +		break;
> +	case 0xc0000000:
> +		max_leaf = this_cpu_property(X86_PROPERTY_MAX_CENTAUR_LEAF);
> +	}
> +	return max_leaf >= property.function;
> +}
> +
> +static inline u8 cpuid_maxphyaddr(void)
> +{
> +	if (!this_cpu_has_p(X86_PROPERTY_MAX_PHY_ADDR))
> +		return 36;
> +
> +	return this_cpu_property(X86_PROPERTY_MAX_PHY_ADDR);
> +}
> +
>  struct far_pointer32 {
>  	u32 offset;
>  	u16 selector;

LGTM.

Reviewed-by: Dapeng Mi <dapeng1.mi@linux.intel.com>



-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
