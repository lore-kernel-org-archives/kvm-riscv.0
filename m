Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C199606A31A
	for <kvm-riscv@archiver.kernel.org>; Fri, 23 Oct 2026 10:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Nqx2zTlp;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=GYV71AqB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=IzCiZ2f8Vk5o8krEVIJVdpQZWN11Cikv2/fKlKKnPqQ=; b=Nqx2zTlppG5AaAXK4EF7uwr2Vw
	WezbkPCUjeKVMcaNP02MDGFJTIY/zEXXxop932zrM5OICyEIh47Ph7r6woj4hKeyw2hcxMzf/NEF/
	F5+egKNSfOVQLhhtr/kXwg5alxRHoONrPFsluSTdfUncaHpUbrQbJs3hlyqU7e+dDaFnJEUC2UdP4
	oqmhn8KdRC1SitGfz1m1iPcgulK3QAen9ByiXtxhCjBuB9CG3wnpWxFGLgeH4qRbvo+T2GrK9nS18
	1cE3wKtVSExEIqenF9GLQubcXsuTxQoBlQ0EqBbkfAQEd9B7RYQM7NP8YwA8gyUxNEJ/7amVj4bU8
	AXbUkR7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKCHI-0000000G810-2dqb;
	Fri, 23 Oct 2026 10:13:36 +0000
Received: from out-90.mta1.migadu.com ([2001:41d0:203:375::5a] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKCHD-0000000G7zC-3ojk
	for kvm-riscv@lists.infradead.org;
	Fri, 23 Oct 2026 10:13:35 +0000
X-Envelope-To: kvm-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=fKBkHWnt456uHkkOHw4bPYUmVOV4SXwzeUkGlmGDAEA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792750408; v=1; x=1793355208;
 b=GYV71AqB/Uov+xYYdJtXYwYwR+qEXoz1X3SA5LbpBmyjJMaVLU6d60dnOgqGtreT/DIwgNyb
 UwIjrSg1sHHPQDkbT+JGa/GuyCxMVf6ebxyvT602WT1cCQu+BRzU1BNieRjEznr/lg1KxVXTvd0
 19/LBOCw2f0OmlZc93retEjQ=
X-Envelope-To: kvm-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 99fbb73a2f9b5088;
	Fri, 23 Oct 2026 10:13:28 +0000
X-Mizu-Trace-ID: 99fbb73a2f9b5088
X-Migadu-Flow: FLOW_OUT
Date: Fri, 23 Oct 2026 12:13:23 +0200
From: Andrew Jones <andrew.jones@linux.dev>
To: Qingwei Hu <qingwei.hu@bytedance.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	James Raphael Tiovalen <jamestiotio@gmail.com>
Subject: Re: [kvm-unit-tests PATCH] riscv: sbi: Fix timer delay measurement
 race
Message-ID: <atsy0DXLV-WNdi-c@orel>
References: <20261023030442.3709880-1-qingwei.hu@bytedance.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261023030442.3709880-1-qingwei.hu@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_031332_283503_4458F673 
X-CRM114-Status: GOOD (  19.89  )
X-Spam-Score: -2.1 (--)
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 23, 2026 at 11:04:42AM +0800, Qingwei Hu wrote:
> The timer test samples the counter before checking timer_works in the
> wait loop. If the timer interrupt arrives between these operations, the
> handler sets timer_works and the loop exits with a timestamp taken before
> the interrupt. That timestamp can precede the deadline, causing a false
> "timer delay honored" failure in both the normal and masked IRQ tests.
> 
> Record the counter at the start of timer_irq_handler() and use it to
> calculate the elapsed time. Keep the loop timestamp for timeout detection.
> 
> Fixes: 14fa12b1351c ("riscv: sbi: Add test for timer extension")
> Signed-off-by: Qingwei Hu <qingwei.hu@bytedance.com>
> ---
>  riscv/sbi.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/riscv/sbi.c b/riscv/sbi.c
> index 3b8aadce..a298228b 100644
> --- a/riscv/sbi.c
> +++ b/riscv/sbi.c
> @@ -245,6 +245,7 @@ struct timer_info {
>  	bool timer_irq_set;
>  	bool timer_irq_cleared;
>  	unsigned long timer_irq_count;
> +	unsigned long irq_cycles;
>  };
>  
>  static struct timer_info timer_info;
> @@ -256,6 +257,7 @@ static bool timer_irq_pending(void)
>  
>  static void timer_irq_handler(struct pt_regs *regs)
>  {
> +	timer_info.irq_cycles = timer_get_cycles();
>  	timer_info.timer_works = true;
>  
>  	if (timer_info.timer_irq_count < ULONG_MAX)
> @@ -304,7 +306,7 @@ static void timer_check_set_timer(bool mask_timer_irq)
>  	}
>  
>  	if (timer_info.timer_works) {
> -		duration = end - begin;
> +		duration = timer_info.irq_cycles - begin;
>  		report(duration >= d && duration <= (d + margin), "timer delay honored%s", mask_test_str);
>  	}
>  
> -- 
> 2.39.5
> 

Hi Qingwei,

Your patch is fine, but I think we could also just change the loop a bit

    while (!timer_info.timer_works && timer_get_cycles() <= begin + d + margin)
        cpu_relax();
    end = timer_get_cycles();

Thanks,
drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
