Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D89DC5B552
	for <kvm-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 07:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6yZcH/r7w3ubZ0rsXn2GABbG0U7Ke5wImY2aTw43Ul4=; b=mCJh5lJS8ViC84
	pIDJCgdwfkVKw4pHMkPjjCASW8Aj8jFil/xmRa7SPymUgKmHk5VrX7bDfKe2okQy/ZMLAyMO4tF4a
	iGiB4FzQIA1ZBWmSlteQnr8Z8v9x/79ncIB58DlXp/2cCpAPxG1MtZp6gLjQEuUNOj53olaX2hsTE
	gC36sAy3ntrHL5A+GyoB1HOIch09I9nZhXLWNeKWFEp+VBzPPK4rANLnrR6bqlokySGkonbHYg3se
	XDPI4UBoAcC+8xijejOldNuakdqyRXcxNmpMe74NNdb6uowWn+/BoNj2XtFuCz1vc2gPH04JmP5+c
	XqLarpxKHmdnbGZpRP8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOtJm-0000000611z-3vR2;
	Tue, 10 Jun 2025 07:22:46 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOtJl-0000000611Y-0rWc
	for kvm-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 07:22:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749540165; x=1781076165;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=RNhwcUFQqmkSVPbYtaCqDacVJjQ0PSUeZTxQ8gxIzvY=;
  b=HEW+OTlwVHP8t81co4E8HwNGRS7qIb4XH14tkhLvZdMs6NdARp4TBVQQ
   NY1fXZjv/sKpNq/OA+jsfqepkX4LYgTNCD8wJkH4+3VpGtaTLsIIOTcCQ
   3fXmzq2Oy79ASxX3A2Iw7OnnGV8CR9FJ1bp98aU4ak4XWcVIVXAQc541V
   mx4RJmX2dADQUtfu8O3PDx9ZkZQBXw6ByIYyfFIdNfNO+YEHBhDEAc+fl
   InnwBQKg2FDkssa/piEfWcnIKrcR+LktWqn9u69OxXq5ZIi9cC3BSBHr9
   f1Ff3+yoxlKNHob14PboeKsuU5R9wgi6NzpmfhgowXjdMHtbEsF7HW4il
   A==;
X-CSE-ConnectionGUID: 4OecXJZpSReTSyvYjEb0zw==
X-CSE-MsgGUID: uG+NmAHbRs6ED7o/XHgCgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="62249558"
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="62249558"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 00:22:43 -0700
X-CSE-ConnectionGUID: AmQEKyYSQIWl7oY9hwpvqQ==
X-CSE-MsgGUID: IbFCF7mgQZW1Hj0QR7GqWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="151559407"
Received: from dapengmi-mobl1.ccr.corp.intel.com (HELO [10.124.245.144]) ([10.124.245.144])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 00:22:41 -0700
Message-ID: <303a9aaa-eb52-47b2-af05-32df320dc52b@linux.intel.com>
Date: Tue, 10 Jun 2025 15:22:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH 08/16] x86/pmu: Rename
 gp_counter_mask_length to arch_event_mask_length
To: Sean Christopherson <seanjc@google.com>,
 Andrew Jones <andrew.jones@linux.dev>, Janosch Frank
 <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>,
 =?UTF-8?Q?Nico_B=C3=B6hr?= <nrb@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 kvm@vger.kernel.org
References: <20250529221929.3807680-1-seanjc@google.com>
 <20250529221929.3807680-9-seanjc@google.com>
Content-Language: en-US
From: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
In-Reply-To: <20250529221929.3807680-9-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_002245_267173_7654D09E 
X-CRM114-Status: GOOD (  14.56  )
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
> Rename gp_counter_mask_length to arch_event_mask_length to reflect what
> the field actually tracks.  The availablity of architectural events has
> nothing to do with the GP counters themselves.
>
> No functional change intended.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  lib/x86/pmu.c | 4 ++--
>  lib/x86/pmu.h | 2 +-
>  x86/pmu.c     | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/lib/x86/pmu.c b/lib/x86/pmu.c
> index 599168ac..b97e2c4a 100644
> --- a/lib/x86/pmu.c
> +++ b/lib/x86/pmu.c
> @@ -18,7 +18,7 @@ void pmu_init(void)
>  
>  		pmu.nr_gp_counters = (cpuid_10.a >> 8) & 0xff;
>  		pmu.gp_counter_width = (cpuid_10.a >> 16) & 0xff;
> -		pmu.gp_counter_mask_length = (cpuid_10.a >> 24) & 0xff;
> +		pmu.arch_event_mask_length = (cpuid_10.a >> 24) & 0xff;
>  
>  		/* CPUID.0xA.EBX bit is '1' if a counter is NOT available. */
>  		pmu.arch_event_available = ~cpuid_10.b;

Better to change to "pmu.arch_event_available = ~cpuid_10.b &
(BIT(pmu.arch_event_mask_length) - 1)" to follow SDM. Some newly introduced
architectural events like topdown metrics events doesn't exist on older
platforms.


> @@ -50,7 +50,7 @@ void pmu_init(void)
>  			pmu.msr_gp_event_select_base = MSR_K7_EVNTSEL0;
>  		}
>  		pmu.gp_counter_width = PMC_DEFAULT_WIDTH;
> -		pmu.gp_counter_mask_length = pmu.nr_gp_counters;
> +		pmu.arch_event_mask_length = pmu.nr_gp_counters;
>  		pmu.arch_event_available = (1u << pmu.nr_gp_counters) - 1;
>  
>  		if (this_cpu_has_perf_global_status()) {
> diff --git a/lib/x86/pmu.h b/lib/x86/pmu.h
> index d0ad280a..c7dc68c1 100644
> --- a/lib/x86/pmu.h
> +++ b/lib/x86/pmu.h
> @@ -63,7 +63,7 @@ struct pmu_caps {
>  	u8 fixed_counter_width;
>  	u8 nr_gp_counters;
>  	u8 gp_counter_width;
> -	u8 gp_counter_mask_length;
> +	u8 arch_event_mask_length;
>  	u32 arch_event_available;
>  	u32 msr_gp_counter_base;
>  	u32 msr_gp_event_select_base;
> diff --git a/x86/pmu.c b/x86/pmu.c
> index 0ce34433..63eae3db 100644
> --- a/x86/pmu.c
> +++ b/x86/pmu.c
> @@ -992,7 +992,7 @@ int main(int ac, char **av)
>  	printf("PMU version:         %d\n", pmu.version);
>  	printf("GP counters:         %d\n", pmu.nr_gp_counters);
>  	printf("GP counter width:    %d\n", pmu.gp_counter_width);
> -	printf("Mask length:         %d\n", pmu.gp_counter_mask_length);
> +	printf("Event Mask length:   %d\n", pmu.arch_event_mask_length);
>  	printf("Fixed counters:      %d\n", pmu.nr_fixed_counters);
>  	printf("Fixed counter width: %d\n", pmu.fixed_counter_width);
>  

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
