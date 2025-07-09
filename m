Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68450C83F0A
	for <kvm-riscv@archiver.kernel.org>; Wed,  9 Jul 2025 12:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eXeVixmK88SUQKte9RfrEy1Ug7ssMXHqpFZy0MH1pKM=; b=RJFgHk7uyy8/t/
	W0m4MRv5E9ZYN6PRwh2WgRL8dZb8L27mKoRWtVvXSsjmg+51L0S6I8NZqocI95etkad3Y5dFHZujE
	pjrE4S4BCQmAn9EWr0LVPCGgYNKiQ+6ikSeKVI3PVFIobMPPENQhWLbyFfM4QKMSaOlib5RM6aFW1
	Mn2XZwg3wymMQLRqjAkAnajM6S7z5GbR9Bf9/uNEMFQMb7tm3BPvv5PrmwxKxEXz6BBUK7jZzUjv8
	85W6H6l5LB6nNxt2IBSwUJ1x9F6XpKkLd0XyUY5V3szdIHF104xAuPabYznER+8wDs96ueLDNgDBE
	CrRVJtiuvK43msQ7K0IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZTW1-00000008Zlc-325x;
	Wed, 09 Jul 2025 12:03:09 +0000
Received: from out-179.mta0.migadu.com ([91.218.175.179])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZRkG-00000008Fsi-2n3j
	for kvm-riscv@lists.infradead.org;
	Wed, 09 Jul 2025 10:09:46 +0000
Date: Wed, 9 Jul 2025 12:09:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1752055779;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=T/m36q47DzH0sZai6UBloJIaV9zTL7B9oaqtL4C7wzU=;
	b=mD+1PGqtDf42qbyO1yo0DC3cSlUh9yJBWScJ/iE5gE0yjCggTZ3XEAVOFz0mp9OgGKi9RK
	HhXXex9A+nWWC4qQHOGekyAXg4sckQUeXKPQot9BXqTg/pdQYLOw12LZE4PJGBitM+cx8M
	iU/2fynj3fbKnrE8sjKOQMwoENGNZgw=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Jesse Taube <jesse@rivosinc.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-kselftest@vger.kernel.org, =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, James Raphael Tiovalen <jamestiotio@gmail.com>, 
	Sean Christopherson <seanjc@google.com>, Cade Richard <cade.richard@gmail.com>
Subject: Re: [kvm-unit-tests PATCH v2 1/2] lib: Add STR_IS_Y and STR_IS_N for
 checking env vars
Message-ID: <20250709-a6dd287628433e8bdf5ea51c@orel>
References: <20250708154811.1888319-1-jesse@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250708154811.1888319-1-jesse@rivosinc.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_030945_151686_D44E79FD 
X-CRM114-Status: GOOD (  19.66  )
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

On Tue, Jul 08, 2025 at 08:48:10AM -0700, Jesse Taube wrote:
> the line:
> (s && (*s == '1' || *s == 'y' || *s == 'Y'))
> is used in a few places add a macro for it and it's 'n' counterpart.
                                                 ^ its
> 
> Add GET_CONFIG_OR_ENV for CONFIG values which can be overridden by
> the environment.
> 
> Signed-off-by: Jesse Taube <jesse@rivosinc.com>
> ---
>  lib/argv.h        | 13 +++++++++++++
>  lib/errata.h      |  7 ++++---
>  riscv/sbi-tests.h |  3 ++-
>  3 files changed, 19 insertions(+), 4 deletions(-)
> 
> diff --git a/lib/argv.h b/lib/argv.h
> index 0fa77725..ecbb40d7 100644
> --- a/lib/argv.h
> +++ b/lib/argv.h
> @@ -14,4 +14,17 @@ extern void setup_args_progname(const char *args);
>  extern void setup_env(char *env, int size);
>  extern void add_setup_arg(const char *arg);
>  
> +#define STR_IS_Y(s) (s && (*s == '1' || *s == 'y' || *s == 'Y'))
> +#define STR_IS_N(s) (s && (*s == '0' || *s == 'n' || *s == 'N'))
> +
> +/*
> + * Get the boolean value of CONFIG_{name}
> + * which can be overridden by the {name}
> + * variable in the environment if present.
> + */
> +#define GET_CONFIG_OR_ENV(name) ({		\
> +	const char *s = getenv(#name);		\
> +	s ? STR_IS_Y(s) : CONFIG_##name;	\
> +})

This requires CONFIG_##name to be defined, even if it's a 'no'. That's
probably OK, but a solution that allows it to be undefined, which then
means 'no' would be nice.

> +
>  #endif
> diff --git a/lib/errata.h b/lib/errata.h
> index de8205d8..78007243 100644
> --- a/lib/errata.h
> +++ b/lib/errata.h
> @@ -7,6 +7,7 @@
>  #ifndef _ERRATA_H_
>  #define _ERRATA_H_
>  #include <libcflat.h>
> +#include <argv.h>
>  
>  #include "config.h"
>  
> @@ -28,7 +29,7 @@ static inline bool errata_force(void)
>  		return true;
>  
>  	s = getenv("ERRATA_FORCE");
> -	return s && (*s == '1' || *s == 'y' || *s == 'Y');
> +	return STR_IS_Y(s);
>  }
>  
>  static inline bool errata(const char *erratum)
> @@ -40,7 +41,7 @@ static inline bool errata(const char *erratum)
>  
>  	s = getenv(erratum);
>  
> -	return s && (*s == '1' || *s == 'y' || *s == 'Y');
> +	return STR_IS_Y(s);
>  }
>  
>  static inline bool errata_relaxed(const char *erratum)
> @@ -52,7 +53,7 @@ static inline bool errata_relaxed(const char *erratum)
>  
>  	s = getenv(erratum);
>  
> -	return !(s && (*s == '0' || *s == 'n' || *s == 'N'));
> +	return !STR_IS_N(s);
>  }
>  
>  #endif
> diff --git a/riscv/sbi-tests.h b/riscv/sbi-tests.h
> index c1ebf016..4e051dca 100644
> --- a/riscv/sbi-tests.h
> +++ b/riscv/sbi-tests.h
> @@ -37,6 +37,7 @@
>  
>  #ifndef __ASSEMBLER__
>  #include <libcflat.h>
> +#include <argv.h>
>  #include <asm/sbi.h>
>  
>  #define __sbiret_report(kfail, ret, expected_error, expected_value,						\
> @@ -94,7 +95,7 @@ static inline bool env_enabled(const char *env)
>  {
>  	char *s = getenv(env);
>  
> -	return s && (*s == '1' || *s == 'y' || *s == 'Y');
> +	return STR_IS_Y(s);
>  }
>  
>  void split_phys_addr(phys_addr_t paddr, unsigned long *hi, unsigned long *lo);
> -- 
> 2.43.0
>

Besides the typo, LGTM

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
