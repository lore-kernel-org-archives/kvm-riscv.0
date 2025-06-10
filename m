Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E80C5B552
	for <kvm-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 06:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=62E7lWomUwSvSRAK6AT8ekh24geb9nwOouCTXnhUs+A=; b=bzk+DVZ+hNyb61
	6g+mLC6Jj5GNwG0d0jyEnaBgOuUrm5AfXABv/EPAlV2hdBZCJPvd44KFfZSw3j3K9P5e6vNrmpLJq
	8C1PTJmyNsy7EmvWldivkHztEu/xLwgWOsPvxCpFGAgJ4YCCz/a79a+WyV/hGpUgv8NgziL6QTbkQ
	iEyXvKu9GOQ047+2CQS9H6WKdIMWFbhd6TfYu2sdbgiqObPnPXCPqeS69705Q53aQyL20dJvkzZ8c
	wVoK71QH83F3eGYWxw6xSdUJ837FsprjDGe/4Kq9ZPuMIitnDvPqJbxQwKJICFG0KEZYbvnjdqbLS
	Opuh/ss1rG/GAv9JDgmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOsDm-00000005uBo-42Hp;
	Tue, 10 Jun 2025 06:12:30 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOsAD-00000005tsH-1Qc8
	for kvm-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 06:08:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749535729; x=1781071729;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ogrLek3pwCPDz2O9qrtRJBbN2YFOlbqEhcPUTRBBIyc=;
  b=iZkd6TENhn47mOuAN+9qpu/rl6fTR0FxVa/UrGGaC9CWRkNjGqdzgtmp
   3jf13ZyJZb29h8ZTwr95vAw86fkMkSUTDoQ4O3WLSnK+7gT36X8SNTVI0
   uV7z34rccze7+i5OilcverYLlf+4zLxBWFgVtXNEiUfoH8u2trGSPlIGG
   5oH0ho2GKivdLauLzMytHXFRmVAgpEwjdAhRq12A7lhNC4uKjZWRjhb8z
   i/OfN9E0hDV4W9oG5okeHPMmbFzDXvPqkvVRMTi8DrYAqitrrvJlyztHK
   bWGJYq62B30m+w3dggNd/SDOMxmZt2RI/nDxd2A1M73Qiv7jTOYUul2Lm
   A==;
X-CSE-ConnectionGUID: +5y0cvTfSEqDR/yMCf48IA==
X-CSE-MsgGUID: m8DaQNkYScm72JHrdntu+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="51770057"
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="51770057"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 23:08:49 -0700
X-CSE-ConnectionGUID: 9dJnUS8rSn2SSklN6Bn2Yg==
X-CSE-MsgGUID: 7EudKegqSdWPv5UjWY3TiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="177650336"
Received: from dapengmi-mobl1.ccr.corp.intel.com (HELO [10.124.245.144]) ([10.124.245.144])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 23:08:45 -0700
Message-ID: <27a6c2fe-8bdf-414f-a49c-19ad626cd131@linux.intel.com>
Date: Tue, 10 Jun 2025 14:08:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH 02/16] x86: Encode X86_FEATURE_*
 definitions using a structure
To: Sean Christopherson <seanjc@google.com>,
 Andrew Jones <andrew.jones@linux.dev>, Janosch Frank
 <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>,
 =?UTF-8?Q?Nico_B=C3=B6hr?= <nrb@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 kvm@vger.kernel.org
References: <20250529221929.3807680-1-seanjc@google.com>
 <20250529221929.3807680-3-seanjc@google.com>
Content-Language: en-US
From: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
In-Reply-To: <20250529221929.3807680-3-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_230849_432768_C7603EA5 
X-CRM114-Status: GOOD (  19.43  )
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
> Encode X86_FEATURE_* macros using a new "struct x86_cpu_feature" instead
> of manually packing the values into a u64.  Using a structure eliminates
> open code shifts and masks, and is largely self-documenting.
>
> Note, the code and naming scheme are stolen from KVM selftests.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  lib/x86/processor.h | 171 ++++++++++++++++++++++++--------------------
>  1 file changed, 95 insertions(+), 76 deletions(-)
>
> diff --git a/lib/x86/processor.h b/lib/x86/processor.h
> index a0be04c5..3ac6711d 100644
> --- a/lib/x86/processor.h
> +++ b/lib/x86/processor.h
> @@ -6,6 +6,7 @@
>  #include "msr.h"
>  #include <bitops.h>
>  #include <stdint.h>
> +#include <util.h>
>  
>  #define CANONICAL_48_VAL 0xffffaaaaaaaaaaaaull
>  #define CANONICAL_57_VAL 0xffaaaaaaaaaaaaaaull
> @@ -232,100 +233,118 @@ static inline bool is_intel(void)
>  	return strcmp((char *)name, "GenuineIntel") == 0;
>  }
>  
> -#define	CPUID(a, b, c, d) ((((unsigned long long) a) << 32) | (b << 16) | \
> -			  (c << 8) | d)
> -
>  /*
> - * Each X86_FEATURE_XXX definition is 64-bit and contains the following
> - * CPUID meta-data:
> - *
> - * 	[63:32] :  input value for EAX
> - * 	[31:16] :  input value for ECX
> - * 	[15:8]  :  output register
> - * 	[7:0]   :  bit position in output register
> + * Pack the information into a 64-bit value so that each X86_FEATURE_XXX can be
> + * passed by value with no overhead.
>   */
> +struct x86_cpu_feature {
> +	u32	function;
> +	u16	index;
> +	u8	reg;
> +	u8	bit;
> +};
> +
> +#define	X86_CPU_FEATURE(fn, idx, gpr, __bit)					\
> +({										\
> +	struct x86_cpu_feature feature = {					\
> +		.function = fn,							\
> +		.index = idx,							\
> +		.reg = gpr,							\
> +		.bit = __bit,							\
> +	};									\
> +										\
> +	static_assert((fn & 0xc0000000) == 0 ||					\
> +		      (fn & 0xc0000000) == 0x40000000 ||			\
> +		      (fn & 0xc0000000) == 0x80000000 ||			\
> +		      (fn & 0xc0000000) == 0xc0000000);				\
> +	static_assert(idx < BIT(sizeof(feature.index) * BITS_PER_BYTE));	\
> +	feature;								\
> +})
>  
>  /*
>   * Basic Leafs, a.k.a. Intel defined
>   */
> -#define	X86_FEATURE_MWAIT		(CPUID(0x1, 0, ECX, 3))
> -#define	X86_FEATURE_VMX			(CPUID(0x1, 0, ECX, 5))
> -#define	X86_FEATURE_PDCM		(CPUID(0x1, 0, ECX, 15))
> -#define	X86_FEATURE_PCID		(CPUID(0x1, 0, ECX, 17))
> -#define X86_FEATURE_X2APIC		(CPUID(0x1, 0, ECX, 21))
> -#define	X86_FEATURE_MOVBE		(CPUID(0x1, 0, ECX, 22))
> -#define	X86_FEATURE_TSC_DEADLINE_TIMER	(CPUID(0x1, 0, ECX, 24))
> -#define	X86_FEATURE_XSAVE		(CPUID(0x1, 0, ECX, 26))
> -#define	X86_FEATURE_OSXSAVE		(CPUID(0x1, 0, ECX, 27))
> -#define	X86_FEATURE_RDRAND		(CPUID(0x1, 0, ECX, 30))
> -#define	X86_FEATURE_MCE			(CPUID(0x1, 0, EDX, 7))
> -#define	X86_FEATURE_APIC		(CPUID(0x1, 0, EDX, 9))
> -#define	X86_FEATURE_CLFLUSH		(CPUID(0x1, 0, EDX, 19))
> -#define	X86_FEATURE_DS			(CPUID(0x1, 0, EDX, 21))
> -#define	X86_FEATURE_XMM			(CPUID(0x1, 0, EDX, 25))
> -#define	X86_FEATURE_XMM2		(CPUID(0x1, 0, EDX, 26))
> -#define	X86_FEATURE_TSC_ADJUST		(CPUID(0x7, 0, EBX, 1))
> -#define	X86_FEATURE_HLE			(CPUID(0x7, 0, EBX, 4))
> -#define	X86_FEATURE_SMEP		(CPUID(0x7, 0, EBX, 7))
> -#define	X86_FEATURE_INVPCID		(CPUID(0x7, 0, EBX, 10))
> -#define	X86_FEATURE_RTM			(CPUID(0x7, 0, EBX, 11))
> -#define	X86_FEATURE_SMAP		(CPUID(0x7, 0, EBX, 20))
> -#define	X86_FEATURE_PCOMMIT		(CPUID(0x7, 0, EBX, 22))
> -#define	X86_FEATURE_CLFLUSHOPT		(CPUID(0x7, 0, EBX, 23))
> -#define	X86_FEATURE_CLWB		(CPUID(0x7, 0, EBX, 24))
> -#define X86_FEATURE_INTEL_PT		(CPUID(0x7, 0, EBX, 25))
> -#define	X86_FEATURE_UMIP		(CPUID(0x7, 0, ECX, 2))
> -#define	X86_FEATURE_PKU			(CPUID(0x7, 0, ECX, 3))
> -#define	X86_FEATURE_LA57		(CPUID(0x7, 0, ECX, 16))
> -#define	X86_FEATURE_RDPID		(CPUID(0x7, 0, ECX, 22))
> -#define	X86_FEATURE_SHSTK		(CPUID(0x7, 0, ECX, 7))
> -#define	X86_FEATURE_IBT			(CPUID(0x7, 0, EDX, 20))
> -#define	X86_FEATURE_SPEC_CTRL		(CPUID(0x7, 0, EDX, 26))
> -#define	X86_FEATURE_FLUSH_L1D		(CPUID(0x7, 0, EDX, 28))
> -#define	X86_FEATURE_ARCH_CAPABILITIES	(CPUID(0x7, 0, EDX, 29))
> -#define	X86_FEATURE_PKS			(CPUID(0x7, 0, ECX, 31))
> -#define	X86_FEATURE_LAM			(CPUID(0x7, 1, EAX, 26))
> +#define	X86_FEATURE_MWAIT		X86_CPU_FEATURE(0x1, 0, ECX, 3)
> +#define	X86_FEATURE_VMX			X86_CPU_FEATURE(0x1, 0, ECX, 5)
> +#define	X86_FEATURE_PDCM		X86_CPU_FEATURE(0x1, 0, ECX, 15)
> +#define	X86_FEATURE_PCID		X86_CPU_FEATURE(0x1, 0, ECX, 17)
> +#define X86_FEATURE_X2APIC		X86_CPU_FEATURE(0x1, 0, ECX, 21)
> +#define	X86_FEATURE_MOVBE		X86_CPU_FEATURE(0x1, 0, ECX, 22)
> +#define	X86_FEATURE_TSC_DEADLINE_TIMER	X86_CPU_FEATURE(0x1, 0, ECX, 24)
> +#define	X86_FEATURE_XSAVE		X86_CPU_FEATURE(0x1, 0, ECX, 26)
> +#define	X86_FEATURE_OSXSAVE		X86_CPU_FEATURE(0x1, 0, ECX, 27)
> +#define	X86_FEATURE_RDRAND		X86_CPU_FEATURE(0x1, 0, ECX, 30)
> +#define	X86_FEATURE_MCE			X86_CPU_FEATURE(0x1, 0, EDX, 7)
> +#define	X86_FEATURE_APIC		X86_CPU_FEATURE(0x1, 0, EDX, 9)
> +#define	X86_FEATURE_CLFLUSH		X86_CPU_FEATURE(0x1, 0, EDX, 19)
> +#define	X86_FEATURE_DS			X86_CPU_FEATURE(0x1, 0, EDX, 21)
> +#define	X86_FEATURE_XMM			X86_CPU_FEATURE(0x1, 0, EDX, 25)
> +#define	X86_FEATURE_XMM2		X86_CPU_FEATURE(0x1, 0, EDX, 26)
> +#define	X86_FEATURE_TSC_ADJUST		X86_CPU_FEATURE(0x7, 0, EBX, 1)
> +#define	X86_FEATURE_HLE			X86_CPU_FEATURE(0x7, 0, EBX, 4)
> +#define	X86_FEATURE_SMEP		X86_CPU_FEATURE(0x7, 0, EBX, 7)
> +#define	X86_FEATURE_INVPCID		X86_CPU_FEATURE(0x7, 0, EBX, 10)
> +#define	X86_FEATURE_RTM			X86_CPU_FEATURE(0x7, 0, EBX, 11)
> +#define	X86_FEATURE_SMAP		X86_CPU_FEATURE(0x7, 0, EBX, 20)
> +#define	X86_FEATURE_PCOMMIT		X86_CPU_FEATURE(0x7, 0, EBX, 22)
> +#define	X86_FEATURE_CLFLUSHOPT		X86_CPU_FEATURE(0x7, 0, EBX, 23)
> +#define	X86_FEATURE_CLWB		X86_CPU_FEATURE(0x7, 0, EBX, 24)
> +#define X86_FEATURE_INTEL_PT		X86_CPU_FEATURE(0x7, 0, EBX, 25)
> +#define	X86_FEATURE_UMIP		X86_CPU_FEATURE(0x7, 0, ECX, 2)
> +#define	X86_FEATURE_PKU			X86_CPU_FEATURE(0x7, 0, ECX, 3)
> +#define	X86_FEATURE_LA57		X86_CPU_FEATURE(0x7, 0, ECX, 16)
> +#define	X86_FEATURE_RDPID		X86_CPU_FEATURE(0x7, 0, ECX, 22)
> +#define	X86_FEATURE_SHSTK		X86_CPU_FEATURE(0x7, 0, ECX, 7)
> +#define	X86_FEATURE_IBT			X86_CPU_FEATURE(0x7, 0, EDX, 20)
> +#define	X86_FEATURE_SPEC_CTRL		X86_CPU_FEATURE(0x7, 0, EDX, 26)
> +#define	X86_FEATURE_FLUSH_L1D		X86_CPU_FEATURE(0x7, 0, EDX, 28)
> +#define	X86_FEATURE_ARCH_CAPABILITIES	X86_CPU_FEATURE(0x7, 0, EDX, 29)
> +#define	X86_FEATURE_PKS			X86_CPU_FEATURE(0x7, 0, ECX, 31)
> +#define	X86_FEATURE_LAM			X86_CPU_FEATURE(0x7, 1, EAX, 26)
>  
>  /*
>   * KVM defined leafs
>   */
> -#define	KVM_FEATURE_ASYNC_PF		(CPUID(0x40000001, 0, EAX, 4))
> -#define	KVM_FEATURE_ASYNC_PF_INT	(CPUID(0x40000001, 0, EAX, 14))
> +#define	KVM_FEATURE_ASYNC_PF		X86_CPU_FEATURE(0x40000001, 0, EAX, 4)
> +#define	KVM_FEATURE_ASYNC_PF_INT	X86_CPU_FEATURE(0x40000001, 0, EAX, 14)
>  
>  /*
>   * Extended Leafs, a.k.a. AMD defined
>   */
> -#define	X86_FEATURE_SVM			(CPUID(0x80000001, 0, ECX, 2))
> -#define	X86_FEATURE_PERFCTR_CORE	(CPUID(0x80000001, 0, ECX, 23))
> -#define	X86_FEATURE_NX			(CPUID(0x80000001, 0, EDX, 20))
> -#define	X86_FEATURE_GBPAGES		(CPUID(0x80000001, 0, EDX, 26))
> -#define	X86_FEATURE_RDTSCP		(CPUID(0x80000001, 0, EDX, 27))
> -#define	X86_FEATURE_LM			(CPUID(0x80000001, 0, EDX, 29))
> -#define	X86_FEATURE_RDPRU		(CPUID(0x80000008, 0, EBX, 4))
> -#define	X86_FEATURE_AMD_IBPB		(CPUID(0x80000008, 0, EBX, 12))
> -#define	X86_FEATURE_NPT			(CPUID(0x8000000A, 0, EDX, 0))
> -#define	X86_FEATURE_LBRV		(CPUID(0x8000000A, 0, EDX, 1))
> -#define	X86_FEATURE_NRIPS		(CPUID(0x8000000A, 0, EDX, 3))
> -#define X86_FEATURE_TSCRATEMSR		(CPUID(0x8000000A, 0, EDX, 4))
> -#define X86_FEATURE_PAUSEFILTER		(CPUID(0x8000000A, 0, EDX, 10))
> -#define X86_FEATURE_PFTHRESHOLD		(CPUID(0x8000000A, 0, EDX, 12))
> -#define	X86_FEATURE_VGIF		(CPUID(0x8000000A, 0, EDX, 16))
> -#define X86_FEATURE_VNMI		(CPUID(0x8000000A, 0, EDX, 25))
> -#define	X86_FEATURE_AMD_PMU_V2		(CPUID(0x80000022, 0, EAX, 0))
> +#define	X86_FEATURE_SVM			X86_CPU_FEATURE(0x80000001, 0, ECX, 2)
> +#define	X86_FEATURE_PERFCTR_CORE	X86_CPU_FEATURE(0x80000001, 0, ECX, 23)
> +#define	X86_FEATURE_NX			X86_CPU_FEATURE(0x80000001, 0, EDX, 20)
> +#define	X86_FEATURE_GBPAGES		X86_CPU_FEATURE(0x80000001, 0, EDX, 26)
> +#define	X86_FEATURE_RDTSCP		X86_CPU_FEATURE(0x80000001, 0, EDX, 27)
> +#define	X86_FEATURE_LM			X86_CPU_FEATURE(0x80000001, 0, EDX, 29)
> +#define	X86_FEATURE_RDPRU		X86_CPU_FEATURE(0x80000008, 0, EBX, 4)
> +#define	X86_FEATURE_AMD_IBPB		X86_CPU_FEATURE(0x80000008, 0, EBX, 12)
> +#define	X86_FEATURE_NPT			X86_CPU_FEATURE(0x8000000A, 0, EDX, 0)
> +#define	X86_FEATURE_LBRV		X86_CPU_FEATURE(0x8000000A, 0, EDX, 1)
> +#define	X86_FEATURE_NRIPS		X86_CPU_FEATURE(0x8000000A, 0, EDX, 3)
> +#define X86_FEATURE_TSCRATEMSR		X86_CPU_FEATURE(0x8000000A, 0, EDX, 4)
> +#define X86_FEATURE_PAUSEFILTER		X86_CPU_FEATURE(0x8000000A, 0, EDX, 10)
> +#define X86_FEATURE_PFTHRESHOLD		X86_CPU_FEATURE(0x8000000A, 0, EDX, 12)
> +#define	X86_FEATURE_VGIF		X86_CPU_FEATURE(0x8000000A, 0, EDX, 16)
> +#define X86_FEATURE_VNMI		X86_CPU_FEATURE(0x8000000A, 0, EDX, 25)

The code looks good to me except the indent style (mixed tab and space).
Although it's not introduced by this patch, we'd better make them identical
by this chance.

Reviewed-by: Dapeng Mi <dapeng1.mi@linux.intel.com>


> +#define	X86_FEATURE_AMD_PMU_V2		X86_CPU_FEATURE(0x80000022, 0, EAX, 0)
>  
> -static inline bool this_cpu_has(u64 feature)
> +static inline u32 __this_cpu_has(u32 function, u32 index, u8 reg, u8 lo, u8 hi)
>  {
> -	u32 input_eax = feature >> 32;
> -	u32 input_ecx = (feature >> 16) & 0xffff;
> -	u32 output_reg = (feature >> 8) & 0xff;
> -	u8 bit = feature & 0xff;
> -	struct cpuid c;
> -	u32 *tmp;
> +	union {
> +		struct cpuid cpuid;
> +		u32 gprs[4];
> +	} c;
>  
> -	c = cpuid_indexed(input_eax, input_ecx);
> -	tmp = (u32 *)&c;
> +	c.cpuid = cpuid_indexed(function, index);
>  
> -	return ((*(tmp + (output_reg % 32))) & (1 << bit));
> +	return (c.gprs[reg] & GENMASK(hi, lo)) >> lo;
> +}
> +
> +static inline bool this_cpu_has(struct x86_cpu_feature feature)
> +{
> +	return __this_cpu_has(feature.function, feature.index,
> +			      feature.reg, feature.bit, feature.bit);
>  }
>  
>  struct far_pointer32 {

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
