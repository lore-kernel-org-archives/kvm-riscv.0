Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 341ECC02183
	for <kvm-riscv@archiver.kernel.org>; Mon, 13 Jan 2025 17:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RIRoXCyv4zA2ufSJNrLjmfuDHuofBumhLhGdq/fdRy0=; b=ph8Pgcz736FcIw
	eBef8qoJE+iOtLusVbPIuFXaB8zmsF1bQwCre1tNC/6BsC/gCWYN7POmz38y1nh4vPh5oFBDpdGct
	zUjDiXmUGFFZJ47E1xueEZB2BbsHgsDL8CVXJ6xP4oC1pRKEEJKrBBbAt2RFdzfUdEMll+PkNoo1D
	oBv840CYtDBpYnkM6XqwoohJlVLkuwsscczixAVZZe4+B6/pD67ZQQcziOkxLJDF4MEMG1njtsirS
	fGp5hdgc2gKdBG0AIRZnQD0PLM6lCFmGmAcvaybT2Wh3I7b3f92EobUB9kdVdG55Q5Ygtfbsqbv8c
	rut+Nc/ooSmFG7ZaSFoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXO9H-000000061p3-40xH;
	Mon, 13 Jan 2025 17:22:47 +0000
Received: from out-184.mta0.migadu.com ([91.218.175.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXO9G-000000061ne-0w6k
	for kvm-riscv@lists.infradead.org;
	Mon, 13 Jan 2025 17:22:47 +0000
Date: Mon, 13 Jan 2025 18:22:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1736788963;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1SYhWMR//MH4q0r3Z+RTc17CbnTV2tHdPftxZGU3qAY=;
	b=CMea5KtwVtsNA7HrhG3mjvs3Hq/An8VkR3gR2aRVbTo/doG9a0Q2YWCx4laJFB03V/HIo/
	R3T9g/RBp6/fgIZSOcPNV4kkTbzHNj6pppFQ9b5WVutTH/p+ai4JLavhUuXpc3Rllb3Se7
	yADyIxz93ZvujsKQf5gJOSumIMHtcFo=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	Andrew Jones <ajones@ventanamicro.com>, Anup Patel <apatel@ventanamicro.com>, 
	Atish Patra <atishp@rivosinc.com>
Subject: Re: [kvm-unit-tests PATCH v4 5/5] riscv: sbi: Add SSE extension tests
Message-ID: <20250113-5f909e9cad611aa6b69c52fc@orel>
References: <20241125162200.1630845-1-cleger@rivosinc.com>
 <20241125162200.1630845-6-cleger@rivosinc.com>
 <20250108-162405687be625303572c303@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250108-162405687be625303572c303@orel>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_092246_402336_856FC613 
X-CRM114-Status: UNSURE (   3.96  )
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


I still haven't finished the review, I just hit send instead of
save-as-draft by mistake :-) However, sending now for you to take a look
at what I have so for in parallel with me finishing the review also makes
sense.

Thanks,
drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
