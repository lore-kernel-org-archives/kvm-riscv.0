Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C71AC7115B
	for <kvm-riscv@archiver.kernel.org>; Mon, 23 Jun 2025 21:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JoCF08dUnhGUR4O4LiDmXo6zSAk+v8sMs80CqpdwG1c=; b=dcfpIRGZohMPpK
	Wlg+8gJurMZfzD2CB0a/89lfHjvZo6omej3GlfHwJigIYWikeCt5LKf4ml51UFV4Zmm6BJ04FjX94
	sJTp6ToJ8PoYtZU+gR1OQRk9zdw6TxyM35vkCvQVSM0v/9X0BFLDmyYmDzXVARR5xhjukryxaZ0jy
	Kblj1TEzWnBftCyK/2PEX3XNYGsv6e2usRuMajUKw2IRFQ1h3ZbKvcxV3byCribcemBvHdlCiqJ6L
	HcAEWkNZNSL/W3OOX86EwwyS+lfD7uspo0ahtbAt1BUZCeSDsVG9uM5lnc8Uuu+Z86/k+7UWbFqhL
	r1PpxM4BsAOEhkGl2WXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTosl-000000041hA-17LR;
	Mon, 23 Jun 2025 21:39:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTkMw-00000003U3b-3AO0
	for kvm-riscv@bombadil.infradead.org;
	Mon, 23 Jun 2025 16:50:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=HqRjLcZdOZFq89doRZdoZM2ySs8Gc+mIIvErbU8ZPgg=; b=RMAuciodzVhrjzeM9RslOeDUjU
	28M6NxdDf+q/4ORlbEemuqRzjZgA5jAzx6PxMnOqdRRl7zH3c/NhDVHMy3SnzRi3g9Od2htQtl346
	fDfc+9ZCYLqBjQB8IcGGHt14Z4nAL1VwDit83qYm37bwk/04SzQybBKpZrDtMQdFvl+JCu7hxT4vR
	w7fFrn+/f1qeZLl1FZF6gAlt1KgXQcGoy9utH+H/ZEwzYHfAXv+VwDE6lYnGdfyaYVdytQKm8Sp+C
	Qik3Qfj8dUABmTyCl1rzBENKi3Apm2G1PZw1daQd1rLY/Yf/9GU2WWVX2lFeGFHb1qg12ZcRMogPC
	9DYFCC/w==;
Received: from out-174.mta1.migadu.com ([95.215.58.174])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTkMt-00000005GRB-3QvZ
	for kvm-riscv@lists.infradead.org;
	Mon, 23 Jun 2025 16:50:05 +0000
Date: Mon, 23 Jun 2025 18:49:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750697383;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HqRjLcZdOZFq89doRZdoZM2ySs8Gc+mIIvErbU8ZPgg=;
	b=HwVoKr7Jw0gxN9sXK+UUnD8GtqhWcljktu/GM0k9LZDh8pSGgZTVCEeYsvt9ViR+4ex630
	kZNlalWYAf9d5VBruVzGq+BocugxQbZ1LMO19GtZn84FTgus+sJYGxmZd9YiVH6Kto4QcY
	XwibfQ2PL+1vXOw3TC/SleCN2SX5xDE=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	Andrew Jones <ajones@ventanamicro.com>, Charlie Jenkins <charlie@rivosinc.com>
Subject: Re: [kvm-unit-tests PATCH 0/3] riscv: sbi: sse: Fix some potential
 crashes
Message-ID: <20250623-67f9a093878a1062f19067a0@orel>
References: <20250623131127.531783-1-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250623131127.531783-1-cleger@rivosinc.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_175003_965786_437C1C23 
X-CRM114-Status: UNSURE (   7.43  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jun 23, 2025 at 03:11:22PM +0200, Cl=E9ment L=E9ger wrote:
> While validating another SBI, we encountered a few crashes and errors in
> the SSE tests. Fix SSE stack freeing as well as handler call checking.
> Also add READ_ONCE()/WRITE_ONCE() for some shared variable.
> =

> Cl=E9ment L=E9ger (3):
>   riscv: sbi: sse: Fix wrong sse stack initialization
>   riscv: sbi: sse: Add missing index for handler call check
>   riscv: sbi: sse: Use READ_ONCE()/WRITE_ONCE() for shared variables
> =

>  riscv/sbi-sse.c | 20 ++++++++++++--------
>  1 file changed, 12 insertions(+), 8 deletions(-)
> =

> -- =

> 2.50.0
>

Applied to riscv/sbi

https://gitlab.com/jones-drew/kvm-unit-tests/-/commits/riscv/sbi

Thanks,
drew

-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
