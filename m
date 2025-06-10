Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 464E9C5B543
	for <kvm-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 06:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uKnoIks7hLiLwEHqVjkGwQfdajfjhOA3iOf/abJ9xIw=; b=4vPnV8pn4bJoBy
	laKctjjiiFvhN0WWaoJeMBaHLARO/KNycwkzmnh4fSC+9qIBbspdw5QMKZYez3YhcCsk4i8AfJCSx
	XVMGuq3c29CTaAsRp30Yfz0bijaxAk0AQ8INRemaH/+KDKFP3daz6bg0ZRbYMNp/o0elQl3Gbs2WS
	+Ok/1z0/PPDFaSuTmnuRbTyEGXIduvsobBBbVU5I4PZXlv5upn0y7IuEuqFmhSUSOlY/qh34FnDLx
	NKxjsulrZ+28uW1X8/N6fVnA/CEohXwEwvjnGwMUeRWJiMk9m4ZckpWMrc+15p5XpD/w88vaVX2k4
	D6S6hZ4tLHsMNVSXwXHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOsNb-00000005v6E-3mcb;
	Tue, 10 Jun 2025 06:22:39 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOsMA-00000005uzV-15DD
	for kvm-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 06:21:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749536471; x=1781072471;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=0PAdnlXmh5hKwjgU6sUS3J6AWlqP+z7tw2yaNPyNdOA=;
  b=Q6wCvyw1isnaGX2faGh/bZR6US5U1W1fxbOj+4F67vvSSxaSWgjMFbWq
   eBfibbzc9ICmT+d2FMrCDqoxuIIEuQfGgqMUw1JlFpjWziq0S75bsJvgn
   fGiGSCGG2ujRzJ5E6yzQb4/2QClLnuWJ8TYbRAAjMlew95hsR07/vX4hQ
   BO3E37PPqwLhmVbaDnJvw85af2RXkbEpXgv79U4Co6v2qjEorYML3tOre
   ZUiss9HUd270hoJIPto3muM9qi9g49gUtuFzfl3hi1AbYMoHnQ6GPd8Me
   thecgiBB4Z8S2gDgIDRHzTfAvCTLzB6ujNrpfkWuP0NN7CO6+tSsk5uoC
   Q==;
X-CSE-ConnectionGUID: 1u6pCGiXRg2uwtBaU7+Yew==
X-CSE-MsgGUID: KAhftjayRPmAOUF645IGVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="51771261"
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="51771261"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 23:21:10 -0700
X-CSE-ConnectionGUID: EvT91XccR8qL2MtfgcrCnQ==
X-CSE-MsgGUID: DP1cOW1pSV+4XWpQL/wpYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="146656509"
Received: from dapengmi-mobl1.ccr.corp.intel.com (HELO [10.124.245.144]) ([10.124.245.144])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 23:21:07 -0700
Message-ID: <92b737d4-4584-4e8c-89dc-e2a5308449ec@linux.intel.com>
Date: Tue, 10 Jun 2025 14:21:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH 06/16] x86: Add and use
 X86_PROPERTY_INTEL_PT_NR_RANGES
To: Sean Christopherson <seanjc@google.com>,
 Andrew Jones <andrew.jones@linux.dev>, Janosch Frank
 <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>,
 =?UTF-8?Q?Nico_B=C3=B6hr?= <nrb@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 kvm@vger.kernel.org
References: <20250529221929.3807680-1-seanjc@google.com>
 <20250529221929.3807680-7-seanjc@google.com>
Content-Language: en-US
From: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
In-Reply-To: <20250529221929.3807680-7-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_232110_345182_261570BE 
X-CRM114-Status: GOOD (  14.91  )
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
> Add a definition for X86_PROPERTY_INTEL_PT_NR_RANGES, and use it instead
> of open coding equivalent logic in the LA57 testcase that verifies the
> canonical address behavior of PT MSRs.
>
> No functional change intended.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  lib/x86/processor.h | 3 +++
>  x86/la57.c          | 2 +-
>  2 files changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/lib/x86/processor.h b/lib/x86/processor.h
> index cbfd2ee1..3b02a966 100644
> --- a/lib/x86/processor.h
> +++ b/lib/x86/processor.h
> @@ -370,6 +370,9 @@ struct x86_cpu_property {
>  
>  #define X86_PROPERTY_XSTATE_TILE_SIZE		X86_CPU_PROPERTY(0xd, 18, EAX,  0, 31)
>  #define X86_PROPERTY_XSTATE_TILE_OFFSET		X86_CPU_PROPERTY(0xd, 18, EBX,  0, 31)
> +
> +#define X86_PROPERTY_INTEL_PT_NR_RANGES		X86_CPU_PROPERTY(0x14, 1, EAX,  0, 2)
> +
>  #define X86_PROPERTY_AMX_MAX_PALETTE_TABLES	X86_CPU_PROPERTY(0x1d, 0, EAX,  0, 31)
>  #define X86_PROPERTY_AMX_TOTAL_TILE_BYTES	X86_CPU_PROPERTY(0x1d, 1, EAX,  0, 15)
>  #define X86_PROPERTY_AMX_BYTES_PER_TILE		X86_CPU_PROPERTY(0x1d, 1, EAX, 16, 31)
> diff --git a/x86/la57.c b/x86/la57.c
> index 41764110..1161a5bf 100644
> --- a/x86/la57.c
> +++ b/x86/la57.c
> @@ -288,7 +288,7 @@ static void __test_canonical_checks(bool force_emulation)
>  
>  	/* PT filter ranges */
>  	if (this_cpu_has(X86_FEATURE_INTEL_PT)) {
> -		int n_ranges = cpuid_indexed(0x14, 0x1).a & 0x7;
> +		int n_ranges = this_cpu_property(X86_PROPERTY_INTEL_PT_NR_RANGES);
>  		int i;
>  
>  		for (i = 0 ; i < n_ranges ; i++) {

Reviewed-by: Dapeng Mi <dapeng1.mi@linux.intel.com>



-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
