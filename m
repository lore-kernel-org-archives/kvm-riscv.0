Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F25FBC5B552
	for <kvm-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 06:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6awOVI6bR6jhw1G/XpbOnsxGPBlL8SLQxT9NKstb0yQ=; b=kOMPgmJlLxwcTh
	K19qfN9+Y6O5wMrLAiaYZpuBR/qayZ3N+D8ruh6POPy7RyuWGE8Qv80ECvajByDWrBeWL38Gx2YFt
	5//v+ehqmhnGa/X2H0mu58ONgaDXIMrL9g91yXBgDfuWO3lF6BhCFkkSRyou7B6N0H2AtVnKiNCbE
	tAGSMkhVygc6e5UmMsOZuP2JqYHWWBg+mYxQ2Z1pB2Fy+kk3K2mYweDFjHzc2hDZyj04qP+7/nuuN
	57n4Ub+8aXIXR9tsvFp1yRe+tCVoYbZrkwhOGHSsbX/tjR405XQ+RYw1q+JcGLNbFaQXdeIwxAT5A
	A5bD3mGyftYBxVt91XeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOsHQ-00000005uX2-2vma;
	Tue, 10 Jun 2025 06:16:16 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOsHO-00000005uWf-3eyp
	for kvm-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 06:16:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749536175; x=1781072175;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=g4LjuN3moKRTUytYrxH847zYyyNOlBUZBBeSd8RwcXI=;
  b=bG0lfx/wH9gpPE87UHDsO5U+kRyCPuuBKwgPGfVWvunTxcXzTdnSFfqb
   WTtuIAkjhWKhObgIdVVKh+axl8xMvK7qjpo9z30bksRLDJWPUjzs1+zQR
   d7HV1WBHHsDyvTb/jVIhlmf49web0B9850iBukG4skrRE2VdyQIPDBWWz
   bgEx+XGx7JwhCTsBmStBeh+WjpGLNL4FbJ53Cd4WvGnOcHuJ76FmyUVAy
   6R88Hv27IlBHLQ9BHaj+vx4wBXJvirYnvAf7LXS7aChz7TVJp8YtypywK
   d+cHIuirGIN+CnY1F5TY0o3UvSzZl9IDe3BZ+PN/g9iJEkGcfEwJboOgo
   g==;
X-CSE-ConnectionGUID: T3ssAMy7RvW5yZyqqBNaVQ==
X-CSE-MsgGUID: bT6ghQ5ATtmoA/87av2dxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="77029419"
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="77029419"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 23:16:14 -0700
X-CSE-ConnectionGUID: NU3kUdWXRdCQrihdNyn8Pw==
X-CSE-MsgGUID: kwkA/DNSRU+vkuvSU9FiEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="146713085"
Received: from dapengmi-mobl1.ccr.corp.intel.com (HELO [10.124.245.144]) ([10.124.245.144])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 23:16:11 -0700
Message-ID: <8fdebefa-b6b1-44d5-b804-46a08bf23e11@linux.intel.com>
Date: Tue, 10 Jun 2025 14:16:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH 04/16] x86: Use X86_PROPERTY_MAX_VIRT_ADDR
 in is_canonical()
To: Sean Christopherson <seanjc@google.com>,
 Andrew Jones <andrew.jones@linux.dev>, Janosch Frank
 <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>,
 =?UTF-8?Q?Nico_B=C3=B6hr?= <nrb@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 kvm@vger.kernel.org
References: <20250529221929.3807680-1-seanjc@google.com>
 <20250529221929.3807680-5-seanjc@google.com>
Content-Language: en-US
From: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
In-Reply-To: <20250529221929.3807680-5-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_231614_929336_9DFF4176 
X-CRM114-Status: GOOD (  12.13  )
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
> Use X86_PROPERTY_MAX_VIRT_ADDR in is_canonical() instead of open coding a
> *very* rough equivalent.  Default to a maximum virtual address width of
> 48 bits instead of 64 bits to better match real x86 CPUs (and Intel and
> AMD architectures).
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  lib/x86/processor.h | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/lib/x86/processor.h b/lib/x86/processor.h
> index 6b61a38b..8c6f28a3 100644
> --- a/lib/x86/processor.h
> +++ b/lib/x86/processor.h
> @@ -1022,9 +1022,14 @@ static inline void write_pkru(u32 pkru)
>  
>  static inline bool is_canonical(u64 addr)
>  {
> -	int va_width = (raw_cpuid(0x80000008, 0).a & 0xff00) >> 8;
> -	int shift_amt = 64 - va_width;
> +	int va_width, shift_amt;
>  
> +	if (this_cpu_has_p(X86_PROPERTY_MAX_VIRT_ADDR))
> +		va_width = this_cpu_property(X86_PROPERTY_MAX_VIRT_ADDR);
> +	else
> +		va_width = 48;
> +
> +	shift_amt = 64 - va_width;
>  	return (s64)(addr << shift_amt) >> shift_amt == addr;
>  }
>  

Reviewed-by: Dapeng Mi <dapeng1.mi@linux.intel.com>



-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
