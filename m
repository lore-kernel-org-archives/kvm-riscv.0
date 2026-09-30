Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0B21CA5FAC
	for <kvm-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 11:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E6HlWH85+vnJ58BG55nbdxnHGSGOefA2qCUnSoGCOng=; b=zutDK5hbyjlaqs
	3YfMi6Jjea7LTY0Km+lYcAINzxkKln4g8bUP8pEUfLkW5mstDHAv87tDapDSGlzUkIIMx4Gso9EJx
	/xX5REhpsffNjxwFSKX3mVPMMrA7ZgSzx6buBHAqeMyPrXxgWzyVVNM6fBHhl3SdGMGv/YWYQQRuL
	0z7/AhrE05bx/hipePdZ7Sry4htaOr/VE/ZOGDLtHxxKvNcU7aHvmzlj2NLNz3wtO8TrXbzpyCyo0
	89oXFO6PYRNu60wmRTPMjR2VpylxFtzR7zRmtCBKr16GsjEc0TpsP6x7OLse0kmckmVwVg46tla4T
	qGIBbfX3qiceBod55GHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBsX1-00000005seO-1gEr;
	Wed, 30 Sep 2026 11:31:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBsWz-00000005sdP-2FKB
	for kvm-riscv@bombadil.infradead.org;
	Wed, 30 Sep 2026 11:31:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=D89i53a3EtAYpvOfv/V2plsrqHOBKEE6KpWD+HD339w=; b=aT0AcgjlFza1und+45ePuvoJSi
	m8isclxoDrOsfmSkmvueUQ4OGVal3kWsACO3gqXsPKUfoMqhCDz2M3LFd0Nl5XclmiBNjQaqJ5ZOz
	SLun5as8zbqIKMG2ORXVWWJf2qWMAUHqG3PCZDFVBqjtTpEiXF4UhlG59uGTtVBjY2V4jUN1j6Szv
	mVM5iY3gBYh9G92q6yNCMOL/OtOjzGMF5gm7irx/3a50lDyKBjzIkZMXFvI2/nOezEAdPyitqODDX
	DFFgKt+xEgcbS9VwNmYM1nwinIMV9fALfLZkleF9wSbAWhUZdWukIq8OCGo6ZcuFEZXaPGh9+5vQR
	BHL/PIbg==;
Received: from out-85.mta1.migadu.com ([95.215.58.85] helo=mta1.migadu.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBsWw-00000003isf-3Vdv
	for kvm-riscv@lists.infradead.org;
	Wed, 30 Sep 2026 11:31:24 +0000
X-Envelope-To: kvm-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=fA9a5p52fbpZZnjOtknYqWlMEppQvEzUSovaz1CMl8I=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790767880; v=1; x=1791372680;
 b=jdqoYWnKqA0dbdOMVzMqwt4hwMI7bl5fydvYkorHtvWg6ZVXdIsZFCsoNToQ7t0ng0NFI3rl
 H08/8HPr6gG2W41QCq8xrP3lob9YAARbib/2GC5nAAQb5mbhoOou5lGPEFCEYy597IDMzbkXfw7
 VPLixWQTkOnCkiI/8WZ/2EHQ=
X-Envelope-To: kvm-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id f841383894dd621f;
	Wed, 30 Sep 2026 11:31:20 +0000
X-Mizu-Trace-ID: f841383894dd621f
X-Migadu-Flow: FLOW_OUT
Date: Wed, 30 Sep 2026 13:31:15 +0200
From: Andrew Jones <andrew.jones@linux.dev>
To: Nicholas Piggin <npiggin@gmail.com>
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	opensbi@lists.infradead.org
Subject: Re: [kvm-unit-tests PATCH 1/2] riscv: sbi: dbtr: fix enable trigger
 return code check
Message-ID: <45hjpd7vkuxfz56lybc6umu5gtm6tjxcafmnxgivbreagy3ddz@k53zzk324hog>
References: <20260313050831.4016944-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260313050831.4016944-1-npiggin@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_123122_949669_A8B2A265 
X-CRM114-Status: GOOD (  14.32  )
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

On Fri, Mar 13, 2026 at 03:08:30PM +1000, Nicholas Piggin wrote:
> Enabling triggers that are not mapped to a HW debug trigger
> should return SBI_ERR_INVALID_PARAM.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  riscv/sbi-dbtr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/riscv/sbi-dbtr.c b/riscv/sbi-dbtr.c
> index 129f79b8..489242b0 100644
> --- a/riscv/sbi-dbtr.c
> +++ b/riscv/sbi-dbtr.c
> @@ -744,7 +744,7 @@ static void dbtr_test_uninstall_enable(struct sbi_dbtr_shmem_entry *shmem, enum
>  	dbtr_uninstall_trigger();
>  
>  	ret = sbi_debug_enable_triggers(0, 1);
> -	sbiret_report_error(&ret, SBI_SUCCESS, "sbi_debug_enable_triggers");
> +	sbiret_report_error(&ret, SBI_ERR_INVALID_PARAM, "sbi_debug_enable_triggers");
>  
>  	install_exception_handler(EXC_BREAKPOINT, dbtr_exception_handler);
>  
> -- 
> 2.51.0
>

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
