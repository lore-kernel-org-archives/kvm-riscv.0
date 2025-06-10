Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 918C9C5B552
	for <kvm-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 07:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yAFpGxNulqW6lE4fYIzHoP/Q4dXMEJ1R5X2xRNrex6k=; b=IByt9lt/GlcQF0
	6oiTZfEzdTntORnfd/rwlSkyt5riuMCnaDKzfYYnKjc4sVOxPGJcTcssB4edWNMgFwJuqhBFZtkI0
	AvqCP9gyW0bjFZse4jz9iPTG56blbiDVz6Cb8UGJjJYW2aK630bdY8P7xy78fwscnjy2x63os1ZT4
	4uty9lylGkBSYuAeSeT1UIoGtIHvDAPofNoPZxKs1l6Ir4VR4ngFDhE6EaUcrbw5iTOMd/bIzChef
	EjAwSzTFoxgOpNb80GgRt7DwFuJBJBt7ykmm3X3zrkSWvtTBpsECR6iho7tosymMXsnwBwTqjBHHk
	EKbOfFGvj7i5R12nGJvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOtQV-000000061ex-0xkU;
	Tue, 10 Jun 2025 07:29:43 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOtQS-000000061e0-3CrX
	for kvm-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 07:29:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749540580; x=1781076580;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=lAAtMSan3afQSwOuXOhzP3QPjgP54f8sQlMRzRkaed8=;
  b=MJWWUo2UvhkSoHxRBguU6hLWPzArwXuAKwtO6sI9oDDmgLtKkDclh62Z
   AhIAN7h4NBfJMD7qEoF0roR+pbf6v2FsDsdf8/RIr1Xd1/QYrnqBSVFe/
   Y0YDapkgOR+/oD7CN24+4V/JrEW9eHuup3xGXhbnn9GgHP7llM8mvFOUd
   MAbfsk/Eq0ApyHOcd746qCKhar7NBhzHs4gBuIs94iWCE/rEJamJD++ZB
   nyFR6zQXaweAn4tsKaFmrdlP9DAhFZz9iboxzuMnTa5Y5FC6pVLPpvJLa
   z+Qr7Gcpc9C84itytvcwCNFC7OMj+lw/lOsE35nbwcBQwrZNUPqbSEDGF
   Q==;
X-CSE-ConnectionGUID: HXq+DKlbR6KSbyAugwxalg==
X-CSE-MsgGUID: u3d1M3naTtqWo8DyFJynTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="63040640"
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="63040640"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 00:29:39 -0700
X-CSE-ConnectionGUID: YLgeloFCR52uw2jpg7GNVA==
X-CSE-MsgGUID: GWVg24xgTO6ptJ1pznfgfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="147718065"
Received: from dapengmi-mobl1.ccr.corp.intel.com (HELO [10.124.245.144]) ([10.124.245.144])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 00:29:37 -0700
Message-ID: <0072b2bd-5b3b-46b4-bd60-8b7579aba5c4@linux.intel.com>
Date: Tue, 10 Jun 2025 15:29:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH 10/16] x86/pmu: Use X86_PROPERTY_PMU_*
 macros to retrieve PMU information
To: Sean Christopherson <seanjc@google.com>,
 Andrew Jones <andrew.jones@linux.dev>, Janosch Frank
 <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>,
 =?UTF-8?Q?Nico_B=C3=B6hr?= <nrb@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 kvm@vger.kernel.org
References: <20250529221929.3807680-1-seanjc@google.com>
 <20250529221929.3807680-11-seanjc@google.com>
Content-Language: en-US
From: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
In-Reply-To: <20250529221929.3807680-11-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_002940_856378_198EB06F 
X-CRM114-Status: GOOD (  13.19  )
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
> Use the recently introduced X86_PROPERTY_PMU_* macros to get PMU
> information instead of open coding equivalent functionality.
>
> No functional change intended.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  lib/x86/pmu.c | 18 ++++++++----------
>  1 file changed, 8 insertions(+), 10 deletions(-)
>
> diff --git a/lib/x86/pmu.c b/lib/x86/pmu.c
> index 44449372..c7f7da14 100644
> --- a/lib/x86/pmu.c
> +++ b/lib/x86/pmu.c
> @@ -7,21 +7,19 @@ void pmu_init(void)
>  	pmu.is_intel = is_intel();
>  
>  	if (pmu.is_intel) {
> -		struct cpuid cpuid_10 = cpuid(10);
> -
> -		pmu.version = cpuid_10.a & 0xff;
> +		pmu.version = this_cpu_property(X86_PROPERTY_PMU_VERSION);
>  
>  		if (pmu.version > 1) {
> -			pmu.nr_fixed_counters = cpuid_10.d & 0x1f;
> -			pmu.fixed_counter_width = (cpuid_10.d >> 5) & 0xff;
> +			pmu.nr_fixed_counters = this_cpu_property(X86_PROPERTY_PMU_NR_FIXED_COUNTERS);
> +			pmu.fixed_counter_width = this_cpu_property(X86_PROPERTY_PMU_FIXED_COUNTERS_BIT_WIDTH);
>  		}
>  
> -		pmu.nr_gp_counters = (cpuid_10.a >> 8) & 0xff;
> -		pmu.gp_counter_width = (cpuid_10.a >> 16) & 0xff;
> -		pmu.arch_event_mask_length = (cpuid_10.a >> 24) & 0xff;
> +		pmu.nr_gp_counters = this_cpu_property(X86_PROPERTY_PMU_NR_GP_COUNTERS);
> +		pmu.gp_counter_width = this_cpu_property(X86_PROPERTY_PMU_GP_COUNTERS_BIT_WIDTH);
> +		pmu.arch_event_mask_length = this_cpu_property(X86_PROPERTY_PMU_EBX_BIT_VECTOR_LENGTH);
>  
>  		/* CPUID.0xA.EBX bit is '1' if a counter is NOT available. */
> -		pmu.arch_event_available = ~cpuid_10.b;
> +		pmu.arch_event_available = ~this_cpu_property(X86_PROPERTY_PMU_EVENTS_MASK);
>  
>  		if (this_cpu_has(X86_FEATURE_PDCM))
>  			pmu.perf_cap = rdmsr(MSR_IA32_PERF_CAPABILITIES);
> @@ -38,7 +36,7 @@ void pmu_init(void)
>  			/* Performance Monitoring Version 2 Supported */
>  			if (this_cpu_has(X86_FEATURE_AMD_PMU_V2)) {
>  				pmu.version = 2;
> -				pmu.nr_gp_counters = cpuid(0x80000022).b & 0xf;
> +				pmu.nr_gp_counters = this_cpu_property(X86_PROPERTY_NR_PERFCTR_CORE);
>  			} else {
>  				pmu.nr_gp_counters = AMD64_NUM_COUNTERS_CORE;
>  			}

Reviewed-by: Dapeng Mi <dapeng1.mi@linux.intel.com>



-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
