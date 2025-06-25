Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CB2DC7EE30
	for <kvm-riscv@archiver.kernel.org>; Wed, 25 Jun 2025 09:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c+7pPejc/Df2vsoFnzqSWS8cE8FqVENKKZxtnFki9Dg=; b=ICj1GrWKzb5Vc1
	pQmpTNBVPTb8whNyIMUyEyHMne+VheKOpkp4STz4yLpRguYy9UVFXss6y41X5Mm9g41SXOnHexxcR
	j6sfaPJdrnyo0Uc8C1U3DFZugEsInwu1lixfL6nXaWyNrTfxxqRnPEPia2iaQG4aTo/3gTPP6jDYK
	/SOSY72Hq3uSqOvbOOrKQK27SaJN5MT+dfCKdkeiOwz93/AQlQgQYibURLe5mpAIjRyc6oghwdBc/
	gMub4bLRUX92/ao4QivSRdlF3ZmlbULKc0SczMz5AfKNarTJVx03MMPItYaRrIOJ4xLNjyIQZMhTe
	c3M9nssH/bgzgYD6ucZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUMDX-000000085jd-3tqp;
	Wed, 25 Jun 2025 09:14:55 +0000
Received: from out-186.mta1.migadu.com ([2001:41d0:203:375::ba])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uULZJ-00000007y6f-0VrQ
	for kvm-riscv@lists.infradead.org;
	Wed, 25 Jun 2025 08:33:22 +0000
Date: Wed, 25 Jun 2025 10:33:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750840386;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+RdDpK0Q/BrscCsHE2b67l2XshKAMI4QDH//eQ76vYQ=;
	b=H0nVjQMOiY4+H4PxAmGP2EbqofC0puApMp7X2a9Zc6REb298iwGRlvJJPjAgLypCPTWsNp
	7f7QvRn072mqsSsfxCtCtbFY7L0BXhf5bJByuEGW2xchIdFou7NKdBDNHgPFG30/Em4iCN
	BpYP7Dq1na3uBlU/rHsPuz/ti47HgSw=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Jesse Taube <jesse@rivosinc.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-kselftest@vger.kernel.org, =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, James Raphael Tiovalen <jamestiotio@gmail.com>, 
	Sean Christopherson <seanjc@google.com>, Cade Richard <cade.richard@gmail.com>
Subject: Re: [kvm-unit-tests PATCH v2] riscv: lib: sbi_shutdown add pass/fail
 exit code.
Message-ID: <20250625-fc81fec2cf6d7ee195c0eb6c@orel>
References: <20250624192317.278437-1-jesse@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250624192317.278437-1-jesse@rivosinc.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_013321_374853_EB296CA3 
X-CRM114-Status: GOOD (  20.26  )
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

On Tue, Jun 24, 2025 at 12:23:17PM -0700, Jesse Taube wrote:
> When exiting it may be useful for the sbi implementation to know if
> kvm-unit-tests passed or failed.
> Add exit code to sbi_shutdown, and use it in exit() to pass
> success/failure (0/1) to sbi.
> 
> Signed-off-by: Jesse Taube <jesse@rivosinc.com>
> ---
>  lib/riscv/asm/sbi.h | 2 +-
>  lib/riscv/io.c      | 2 +-
>  lib/riscv/sbi.c     | 4 ++--
>  3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/lib/riscv/asm/sbi.h b/lib/riscv/asm/sbi.h
> index a5738a5c..de11c109 100644
> --- a/lib/riscv/asm/sbi.h
> +++ b/lib/riscv/asm/sbi.h
> @@ -250,7 +250,7 @@ struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
>  			unsigned long arg3, unsigned long arg4,
>  			unsigned long arg5);
>  
> -void sbi_shutdown(void);
> +void sbi_shutdown(unsigned int code);
>  struct sbiret sbi_hart_start(unsigned long hartid, unsigned long entry, unsigned long sp);
>  struct sbiret sbi_hart_stop(void);
>  struct sbiret sbi_hart_get_status(unsigned long hartid);
> diff --git a/lib/riscv/io.c b/lib/riscv/io.c
> index fb40adb7..0bde25d4 100644
> --- a/lib/riscv/io.c
> +++ b/lib/riscv/io.c
> @@ -150,7 +150,7 @@ void halt(int code);
>  void exit(int code)
>  {
>  	printf("\nEXIT: STATUS=%d\n", ((code) << 1) | 1);
> -	sbi_shutdown();
> +	sbi_shutdown(!!code);
>  	halt(code);
>  	__builtin_unreachable();
>  }
> diff --git a/lib/riscv/sbi.c b/lib/riscv/sbi.c
> index 2959378f..9dd11e9d 100644
> --- a/lib/riscv/sbi.c
> +++ b/lib/riscv/sbi.c
> @@ -107,9 +107,9 @@ struct sbiret sbi_sse_inject(unsigned long event_id, unsigned long hart_id)
>  	return sbi_ecall(SBI_EXT_SSE, SBI_EXT_SSE_INJECT, event_id, hart_id, 0, 0, 0, 0);
>  }
>  
> -void sbi_shutdown(void)
> +void sbi_shutdown(unsigned int code)
>  {
> -	sbi_ecall(SBI_EXT_SRST, 0, 0, 0, 0, 0, 0, 0);
> +	sbi_ecall(SBI_EXT_SRST, 0, 0, code, 0, 0, 0, 0);
>  	puts("SBI shutdown failed!\n");
>  }
>  
> -- 
> 2.43.0
>

I enhanced the commit message, changed the parameter to a boolean, and
applied to riscv/sbi

https://gitlab.com/jones-drew/kvm-unit-tests/-/commits/riscv/sbi

but I'm having some second thoughts on it. It looks like opensbi and the
two KVM VMMs I looked at (QEMU and kvmtool) all currently ignore this
parameter and we don't know what they might choose to do if they stop
ignoring it. For example, they could choose to hang, rather than complete
the shutdown when they see a "system failure" reason. It may make sense
to indicate system failure if the test aborts, since, in those cases,
something unexpected with the testing occurred. However, successfully
running tests which find and report failures isn't unexpected, so it
shouldn't raise an alarm to the SBI implementation in those cases.

Do you already have a usecase for this in mind? If so, we could make
the behavior optional to enable that use case and use cases like it
but we'd keep that behavior off by default to avoid problems with SBI
implementations that do things with the "system failure" information we'd
rather they not do.

Thanks,
drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
