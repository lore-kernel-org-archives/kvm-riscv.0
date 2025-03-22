Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 552B7C35FFC
	for <kvm-riscv@archiver.kernel.org>; Sat, 22 Mar 2025 10:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NaDzIaOl9s5kPMV54f1maK+40RVusnrotjZt7BHGnqQ=; b=TT0xhlqgpY1DCC
	Cwxu99UljMYdcqkVe1mT68O0YxhxOB1XtQXA4mJnql/3tcGBvS4SD+0JiNVUnaBvTc5hQl+cCX5j2
	Om56kaFkLg5VwFHc0+6emottyNiyc/yDNLJu8GI7zA2Y7P/dS+4Ksn6QFfxX+Rf2z8mClXE32eUdJ
	msCatVyOUOpLeAaT3vQaLCx3IfnJuofclvWIOYSU3Xdxq7nxYmG3/zwXh8LdMQu2vym3JPLPdzYRT
	N9bHceEte0VVbDPP0JKCXBAhtvwQAhU1pySdpElabBdXmyBM+7LLhj5AVBdG2Bps4v3xFL2pr3swR
	hHY4vJoS4okLK9Nnby0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvwPe-0000000HIl4-0QRW;
	Sat, 22 Mar 2025 10:49:10 +0000
Received: from out-177.mta0.migadu.com ([2001:41d0:1004:224b::b1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvwPb-0000000HIkM-2Y2r
	for kvm-riscv@lists.infradead.org;
	Sat, 22 Mar 2025 10:49:08 +0000
Date: Sat, 22 Mar 2025 11:49:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1742640543;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gc81TdlPCS46y1srtvMJrC15R2MOqjB5zLj/eQcJNZA=;
	b=w+30INSUDLrihC8G2fObBnDjReiMFee5TyWhoFf2gOCrSHTkiEurOIWYSV7cml1WDSSSYt
	caSPkXqZfrP2onv1/Dxq2x9ZlL4HJNOpa6G+RIagrydsOujs1KPAa2yvtE4KHuVkyh8QQ0
	OScGoj2pHGNsDx/0kCSo2CN1pJy2MiI=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: kvm-riscv@lists.infradead.org
Cc: Anup Patel <apatel@ventanamicro.com>, 
	Atish Patra <atishp@rivosinc.com>, cleger@rivosinc.com
Subject: Re: [kvm-unit-tests PATCH] riscv: sbi: Add no target ipi test
Message-ID: <20250322-954bef7c21610bcc571560d2@orel>
References: <20250317120814.35241-2-andrew.jones@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250317120814.35241-2-andrew.jones@linux.dev>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250322_034907_786813_521E1A06 
X-CRM114-Status: UNSURE (   8.43  )
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

On Mon, Mar 17, 2025 at 01:08:15PM +0100, Andrew Jones wrote:
> While an hmask of zero without an hbase of -1 (which would mean
> broadcast) is pointless, since nothing is targeted, the spec
> doesn't say it should return an error. Maybe it should? Anyway,
> for now, just confirm that it "works".
> 
> Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
> ---
>  riscv/sbi.c | 4 ++++
>  1 file changed, 4 insertions(+)
>

Merged.

Thanks,
drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
