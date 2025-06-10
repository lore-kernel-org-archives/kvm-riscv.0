Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36AA4C5B552
	for <kvm-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 06:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1CGXofFbnRM90PJ0OakcjqgDJ6LfipHHxf24yzfBt0A=; b=w3S7bQI+CPMEn1
	s6L+YEtC/HBK0h1J7REtEo69aVA/I3JpigyhYMrm9+oPeqM7PvwpbGMqDH/nJ17gOOn0uKpKeCq/b
	mmJu81+3WMMDNurAAKBi3KPGv3ZNOQTOZIHHluY5HwiJqCBtVPuOarcGIJVS92QjE4h86yvAc8ve2
	B5ix7dxnETykUEeCMfoAPRtDemOFosqTk9/cuVfl4enCsvkdF5yh5cdQ8J1SJyiR7vennaEIO5Ir6
	2TcuSs7d09pXiV4ytzZPj8cDvTZDLsdnzBTjoh8HIp362fdCnp4FHDcXS2O7cn5rYr/InM39Bdiji
	SfELm6Ckx0V9vLdhuJVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOsBf-00000005tzS-3pAv;
	Tue, 10 Jun 2025 06:10:19 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOs6E-00000005tWn-19q5
	for kvm-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 06:04:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749535482; x=1781071482;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=36UM9scINuSxOcq71r1D+EjNcNuwMHJaxBerjlV5uvw=;
  b=cSmWrm2s++5uzzFcIPCODzV+DBjco7KfjD0vGqXPg4n/81aAyDeNJnIz
   gejQ38xh/xVik0/aRY8UaeRvkHQSAT0h/FJ9l3ZF5/NzL5SGVsGtBSyHC
   TdL77HWZKATRjYpmVA8y0N8GC3+jtn4d6lC/UYVI+8YWjoTDF9FLagmyK
   xKOfxRK3ZxvvhN8QPXdQeDGYHc61Lq3oVy09vQyKxmHFqSfn4GW+6udGv
   3zp1Q39c9IAGH8VvBcrCP75+avZCSSCMiFGYVLIw8+n5W2/tRF43jBECU
   Ke8pQ3x6C/2SiLGffcHAHs9WzrRYYA0c9Dk7RJPrXLrw7QGW2NEbVAydY
   g==;
X-CSE-ConnectionGUID: c6Ri+G1aQPe6M8m86k82iA==
X-CSE-MsgGUID: JUk+74XES9CDZ+Nu5l2CPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="51769387"
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="51769387"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 23:04:40 -0700
X-CSE-ConnectionGUID: rrwtHIuOT5Kh/SrxVy6GTw==
X-CSE-MsgGUID: k7yHa89ORIeV1yvV3umy/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="146651956"
Received: from dapengmi-mobl1.ccr.corp.intel.com (HELO [10.124.245.144]) ([10.124.245.144])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 23:04:39 -0700
Message-ID: <04c70eb3-4323-45b5-9a07-020d627c64a4@linux.intel.com>
Date: Tue, 10 Jun 2025 14:04:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH 01/16] lib: Add and use static_assert()
 convenience wrappers
To: Sean Christopherson <seanjc@google.com>,
 Andrew Jones <andrew.jones@linux.dev>, Janosch Frank
 <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>,
 =?UTF-8?Q?Nico_B=C3=B6hr?= <nrb@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 kvm@vger.kernel.org
References: <20250529221929.3807680-1-seanjc@google.com>
 <20250529221929.3807680-2-seanjc@google.com>
Content-Language: en-US
From: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
In-Reply-To: <20250529221929.3807680-2-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_230442_364442_AFB696E1 
X-CRM114-Status: GOOD (  18.56  )
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
> Add static_assert() to wrap _Static_assert() with stringification of the
> tested expression as the assert message.  In most cases, the failed
> expression is far more helpful than a human-generated message (usually
> because the developer is forced to add _something_ for the message).
>
> For API consistency, provide a double-underscore variant for specifying a
> custom message.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  lib/riscv/asm/isa.h      | 4 +++-
>  lib/s390x/asm/arch_def.h | 6 ++++--
>  lib/s390x/fault.c        | 3 ++-
>  lib/util.h               | 3 +++
>  x86/lam.c                | 4 ++--
>  5 files changed, 14 insertions(+), 6 deletions(-)
>
> diff --git a/lib/riscv/asm/isa.h b/lib/riscv/asm/isa.h
> index df874173..fb3af67d 100644
> --- a/lib/riscv/asm/isa.h
> +++ b/lib/riscv/asm/isa.h
> @@ -1,7 +1,9 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
>  #ifndef _ASMRISCV_ISA_H_
>  #define _ASMRISCV_ISA_H_
> +
>  #include <bitops.h>
> +#include <util.h>
>  #include <asm/setup.h>
>  
>  /*
> @@ -14,7 +16,7 @@ enum {
>  	ISA_SSTC,
>  	ISA_MAX,
>  };
> -_Static_assert(ISA_MAX <= __riscv_xlen, "Need to increase thread_info.isa");
> +__static_assert(ISA_MAX <= __riscv_xlen, "Need to increase thread_info.isa");
>  
>  static inline bool cpu_has_extension(int cpu, int ext)
>  {
> diff --git a/lib/s390x/asm/arch_def.h b/lib/s390x/asm/arch_def.h
> index 03adcd3c..4c11df74 100644
> --- a/lib/s390x/asm/arch_def.h
> +++ b/lib/s390x/asm/arch_def.h
> @@ -8,6 +8,8 @@
>  #ifndef _ASMS390X_ARCH_DEF_H_
>  #define _ASMS390X_ARCH_DEF_H_
>  
> +#include <util.h>
> +
>  struct stack_frame {
>  	struct stack_frame *back_chain;
>  	uint64_t reserved;
> @@ -62,7 +64,7 @@ struct psw {
>  	};
>  	uint64_t	addr;
>  };
> -_Static_assert(sizeof(struct psw) == 16, "PSW size");
> +static_assert(sizeof(struct psw) == 16);
>  
>  #define PSW(m, a) ((struct psw){ .mask = (m), .addr = (uint64_t)(a) })
>  
> @@ -194,7 +196,7 @@ struct lowcore {
>  	uint8_t		pad_0x1400[0x1800 - 0x1400];	/* 0x1400 */
>  	uint8_t		pgm_int_tdb[0x1900 - 0x1800];	/* 0x1800 */
>  } __attribute__ ((__packed__));
> -_Static_assert(sizeof(struct lowcore) == 0x1900, "Lowcore size");
> +static_assert(sizeof(struct lowcore) == 0x1900);
>  
>  extern struct lowcore lowcore;
>  
> diff --git a/lib/s390x/fault.c b/lib/s390x/fault.c
> index a882d5d9..ad5a5f66 100644
> --- a/lib/s390x/fault.c
> +++ b/lib/s390x/fault.c
> @@ -9,6 +9,7 @@
>   */
>  #include <libcflat.h>
>  #include <bitops.h>
> +#include <util.h>
>  #include <asm/arch_def.h>
>  #include <asm/page.h>
>  #include <fault.h>
> @@ -40,7 +41,7 @@ static void print_decode_pgm_prot(union teid teid)
>  			"LAP",
>  			"IEP",
>  		};
> -		_Static_assert(ARRAY_SIZE(prot_str) == PROT_NUM_CODES, "ESOP2 prot codes");
> +		static_assert(ARRAY_SIZE(prot_str) == PROT_NUM_CODES);
>  		int prot_code = teid_esop2_prot_code(teid);
>  
>  		printf("Type: %s\n", prot_str[prot_code]);
> diff --git a/lib/util.h b/lib/util.h
> index f86af6d3..00d0b47d 100644
> --- a/lib/util.h
> +++ b/lib/util.h
> @@ -8,6 +8,9 @@
>   * This work is licensed under the terms of the GNU LGPL, version 2.
>   */
>  
> +#define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
> +#define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
> +
>  /*
>   * parse_keyval extracts the integer from a string formatted as
>   * string=integer. This is useful for passing expected values to
> diff --git a/x86/lam.c b/x86/lam.c
> index a1c98949..ad91deaf 100644
> --- a/x86/lam.c
> +++ b/x86/lam.c
> @@ -13,6 +13,7 @@
>  #include "libcflat.h"
>  #include "processor.h"
>  #include "desc.h"
> +#include <util.h>
>  #include "vmalloc.h"
>  #include "alloc_page.h"
>  #include "vm.h"
> @@ -236,8 +237,7 @@ static void test_lam_user(void)
>  	 * address for both LAM48 and LAM57.
>  	 */
>  	vaddr = alloc_pages_flags(0, AREA_NORMAL);
> -	_Static_assert((AREA_NORMAL_PFN & GENMASK(63, 47)) == 0UL,
> -			"Identical mapping range check");
> +	static_assert((AREA_NORMAL_PFN & GENMASK(63, 47)) == 0UL);
>  
>  	/*
>  	 * Note, LAM doesn't have a global control bit to turn on/off LAM

Reviewed-by: Dapeng Mi <dapeng1.mi@linux.intel.com>



-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
