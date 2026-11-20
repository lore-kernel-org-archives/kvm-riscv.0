Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D551606A330
	for <kvm-riscv@archiver.kernel.org>; Fri, 20 Nov 2026 14:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=12cZxQ5K;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=v3Tlu4qd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tnex1EDelycRAF6AVRP70QimAMhbNBzaT8yYpMCtpus=; b=12cZxQ5KQry7BUGTIroB8KPLfg
	/DLX4Lq1pWBrstR7MK+pVTmbZdI9xvT4NIGxbLEPJIUF9H54C+qB6vrdqVbiTUs50WMrPJsGktTRF
	kWvNQXSpvQEqq9T0LOHWJJjpAROm+vJMJfdw0MQbfzOC4QHn/40RBGq3ZvAr9VsyKiZ10GLloDvwM
	c7jvWZWzawCmtaV3k1iTMcLKFsiVOs4yvutXlBmdwXENCZ1ae2hsxfiWGeWj7WCt5UIIAfOHExnXp
	LGVJWi+rBKNusA+gOZnCenXv6hl4430gXtZY3S/J5/ITgw63MlygLtjVEtNorG+UDcXonhYvKhed7
	N55Mc1Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUPx9-0000000FJKu-39UP;
	Fri, 20 Nov 2026 14:51:03 +0000
Received: from out-194.mta0.migadu.com ([2001:41d0:1004:224b::c2] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUPx7-0000000FJKG-2Xcf
	for kvm-riscv@lists.infradead.org;
	Fri, 20 Nov 2026 14:51:03 +0000
X-Envelope-To: kvm-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=CeSDvXB1FvcvX/1ttzO8WrGAbCq21rBYr7QIfpWmWiA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795186259; v=1; x=1795791059;
 b=v3Tlu4qdreQSXtgCqm7CW4AlGJeIr7iq1VCMSuILIFZvi8nJXezMBiBKtV5vkiKVKYxkH/vu
 JDVkql0nzeN87jPDiHi7QgTDQ/Xllhjjhu3tYhFogoSWW39hm082eojPjmAKKk+HFzrq/r6AzVE
 dJSMfAyxIk25Z2PhB9QjPwqM=
X-Envelope-To: kvm-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 2a1e500c4fd2258e;
	Fri, 20 Nov 2026 14:50:59 +0000
X-Mizu-Trace-ID: 2a1e500c4fd2258e
X-Migadu-Flow: FLOW_OUT
Date: Fri, 20 Nov 2026 15:50:28 +0100
From: Andrew Jones <andrew.jones@linux.dev>
To: Qingwei Hu <qingwei.hu@bytedance.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	James Raphael Tiovalen <jamestiotio@gmail.com>
Subject: Re: [kvm-unit-tests PATCH v2] riscv: sbi: Fix timer delay
 measurement race
Message-ID: <awBeIov4bo7vKhz3@orel>
References: <20261026033738.96294-1-qingwei.hu@bytedance.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261026033738.96294-1-qingwei.hu@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_065101_906054_D5FBBBDF 
X-CRM114-Status: GOOD (  18.89  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 26, 2026 at 11:37:38AM +0800, Qingwei Hu wrote:
> The timer test samples the counter before checking timer_works in the
> wait loop. If the timer interrupt arrives between these operations, the
> handler sets timer_works and the loop exits with a timestamp taken before
> the interrupt. That timestamp can precede the deadline, causing a false
> "timer delay honored" failure in both the normal and masked IRQ tests.
> 
> Check timer_works first in the wait loop and sample the counter again
> after the loop exits. Use this timestamp to calculate the elapsed time
> so that an interrupt cannot cause the test to use a stale timestamp.
> 
> Fixes: 14fa12b1351c ("riscv: sbi: Add test for timer extension")
> Suggested-by: Andrew Jones <andrew.jones@linux.dev>
> Signed-off-by: Qingwei Hu <qingwei.hu@bytedance.com>
> ---
> Changes in v2:
> - Check timer_works first and sample the counter after the wait loop,
>   as suggested by Andrew Jones.
> - Drop the timestamp field and counter read from the interrupt handler.
> 
> Testing:
> - Cross-built riscv/sbi.flat and built it natively on a RISC-V host.
> - Ran the SBI tests with KVM five times each with 1 and 32 vCPUs.
>   All runs passed, with 15 tests skipped per run. Both timer delay
>   checks passed in all runs.
> 
>  riscv/sbi.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/riscv/sbi.c b/riscv/sbi.c
> index 3b8aadce..5633b1f9 100644
> --- a/riscv/sbi.c
> +++ b/riscv/sbi.c
> @@ -292,8 +292,9 @@ static void timer_check_set_timer(bool mask_timer_irq)
>  	if (ret.error)
>  		report_info("set timer%s failed with %ld\n", mask_test_str, ret.error);
>  
> -	while ((end = timer_get_cycles()) <= (begin + d + margin) && !timer_info.timer_works)
> +	while (!timer_info.timer_works && timer_get_cycles() <= begin + d + margin)
>  		cpu_relax();
> +	end = timer_get_cycles();
>  
>  	report(timer_info.timer_works, "timer interrupt received%s", mask_test_str);
>  	report(timer_info.timer_irq_set, "pending timer interrupt bit set in irq handler%s", mask_test_str);
> -- 
> 2.39.5
>

Queued. https://gitlab.com/jones-drew/kvm-unit-tests/-/commits/riscv/queue

Thanks,
drew 

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
