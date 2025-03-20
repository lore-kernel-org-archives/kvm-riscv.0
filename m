Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 828D5C28B30
	for <kvm-riscv@archiver.kernel.org>; Thu, 20 Mar 2025 13:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E4Bgu8LDk/UC0Ia3fYq3KMSqC3d3hA9QtK0B9cmQPm4=; b=lFCgJgPyeuBsMh
	GbLhaU23a053oTF3Sch5plAV7zffORQ2z1MaQI2jmsq1IK2le0hevg/n1rCuXNzTsQYISAyckztT1
	lne8xDBygEeCplwjAyCLQ0SmhwlEj5p5p8leUdMBRXPVdmP93oJhSQ7O31+0fxTVEwEZbCXJIIC4F
	RPsvhGE/jBNCVnuyaDI/9Vj7nLA0ipgafAkMDXPLDoLD93H4ZPzK665PqCYrmWd+zzV5cwp1IKBuJ
	/HCPrSPXqE3TSw8L5/3jWgytHFGxnXTURASz+l1jgiMYB3ga8XE7XLNQIRHGMrP3xObDnuDnnS+EJ
	shOOgNAuW+X9PYoIaZ+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvGEh-0000000CHnr-1A8t;
	Thu, 20 Mar 2025 13:47:03 +0000
Received: from out-172.mta1.migadu.com ([95.215.58.172])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvGEd-0000000CHmk-3nk4
	for kvm-riscv@lists.infradead.org;
	Thu, 20 Mar 2025 13:47:01 +0000
Date: Thu, 20 Mar 2025 14:46:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1742478417;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=46D2P77DBtjFb7Wuj1uG9v4TuAsKB5wVdzf8FSrE/zw=;
	b=s4Kuds6BDNv1Zh6U/DsYXx7tBEGVwB64MIVaHNzOhrmjkiRjNtMvqUWlNp145pV//sVr05
	rWpMNTnapkIfewXmKc45pDovhjjT2NSTm4UoNQexAApQn2O2tjP1SmLoBo9ZwYxuiqKTdz
	LBoRZ8CUDczC444/lPx54Mm4rxbRTJU=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	Andrew Jones <ajones@ventanamicro.com>, Anup Patel <apatel@ventanamicro.com>, 
	Atish Patra <atishp@rivosinc.com>
Subject: Re: [kvm-unit-tests PATCH v11 8/8] riscv: sbi: Add SSE extension
 tests
Message-ID: <20250320-48e2478cb96a804bfb1008e3@orel>
References: <20250317164655.1120015-1-cleger@rivosinc.com>
 <20250317164655.1120015-9-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250317164655.1120015-9-cleger@rivosinc.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_064700_339698_AFC99ABD 
X-CRM114-Status: UNSURE (   6.19  )
X-CRM114-Notice: Please train this message.
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

...
> +cleanup:
> +	switch (state) {
> +	case SBI_SSE_STATE_ENABLED:
> +		ret = sbi_sse_disable(event_id);
> +		if (ret.error) {
> +			sbiret_report_error(&ret, SBI_SUCCESS, "disable event 0x%x", event_id);
> +			break;
> +		}
> +	case SBI_SSE_STATE_REGISTERED:
> +		sbi_sse_unregister(event_id);
> +		if (ret.error)
> +			sbiret_report_error(&ret, SBI_SUCCESS, "unregister event 0x%x", event_id);
> +	default:

I had to add break here to make clang happy (and same for the other two
defaults without statements).

Thanks,
drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
