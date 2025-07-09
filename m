Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0FBCC83F12
	for <kvm-riscv@archiver.kernel.org>; Wed,  9 Jul 2025 12:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FwtF38DeSUm9JaTUXdFzybMwj2fh4yjEdiMZiO9XW5E=; b=LOsg87kbYt2aWd
	gQNBB7q+OfNtZLnmLNwBiDwTJX29wUsKOxG0S55rG+T7QnRieh8RR36SNH7Lj/+2zUkjwa035CPcn
	yGg42N0oDK+X5TGmWRohqlXSP/Nu3dZWpU8NM+9q1lKQVIHIDkdKAKkrLms2If1FDtx/ubnEifscu
	hxlN7czGLbWiHfz/N8ZOiYab2d2bE2ALr6SOn27xv4XjE+JkGdpQZx6MyN8ofTNxLjDwVfzaLRkr1
	sPtUj7N8Leg0ekKxXK7M0XCxGA/O3Lddrb0ppz4Iu9Rnzu+g5kwTyT+pAcCIBAqOZIG/IcDR9fe7H
	5CVnrD1iPNNlomks/9BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZTW3-00000008Zma-21To;
	Wed, 09 Jul 2025 12:03:11 +0000
Received: from out-180.mta1.migadu.com ([2001:41d0:203:375::b4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZRp3-00000008H99-3gTI
	for kvm-riscv@lists.infradead.org;
	Wed, 09 Jul 2025 10:14:43 +0000
Date: Wed, 9 Jul 2025 12:14:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1752056079;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GKEeOEkJgKa8SgaaGBKi6AgnPwQW6DS02b4hY16t4/U=;
	b=tHnLE4r2hNVILR7jbWLs+nVFNl/zCL4zo6R7QFE1rGFvNtXDbBlKOEBpSFCTHFVli9tOQh
	WWrgObcEnGxJoNsPbtNjWmvrmQPZmiVqwNkrD4jFWxDt9raqit0kzgLnyn0z9Nx3au9y+H
	i7L5YZs8CdX2qdb2KojPliu2OQ7An48=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Jesse Taube <jesse@rivosinc.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-kselftest@vger.kernel.org, =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, James Raphael Tiovalen <jamestiotio@gmail.com>, 
	Sean Christopherson <seanjc@google.com>, Cade Richard <cade.richard@gmail.com>
Subject: Re: [kvm-unit-tests PATCH v2 1/2] lib: Add STR_IS_Y and STR_IS_N for
 checking env vars
Message-ID: <20250709-146e598f21c7cc1fb99f88e0@orel>
References: <20250708154811.1888319-1-jesse@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250708154811.1888319-1-jesse@rivosinc.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_031442_058795_3D67C5BA 
X-CRM114-Status: GOOD (  19.85  )
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

This should be named GET_ENV_OR_CONFIG since the "first_or_second" naming
implies that if the first thing doesn't succeed, then try the second.

Thanks,
drew

> +	const char *s = getenv(#name);		\
> +	s ? STR_IS_Y(s) : CONFIG_##name;	\
> +})
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
> 
> -- 
> kvm-riscv mailing list
> kvm-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
