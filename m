Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35F50C77B7C
	for <kvm-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 16:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mS0AsxlCPra4IIMBeFsDgsUX/7WxYBPAXOanJl30mKw=; b=t2sRAve4bBxLcY
	pfsInq+Wg2fnul6WlHO7dYHDdrgE7186Bf7/rqDHrypwyTacp3dL4/62OjSQcy2ClWwkzQbILRR2H
	tLsS21vvGm5CwJ/Ty4T0zdJ2rn4mnpjpWGVpa3j1ri0gxjHhkjDR7IkD6a10SR4+HH2zS6LpeufWN
	6wjMfzraOXjWS4PaGgNSeNV6LhV1EoyEbuH9eZzALlkPYGHj/J4xpWHXOniS2MsL2g7kSwCoIaI53
	uJue8wT6NUJGta5A1gl1+AujFCfDr2qgnejIGOs0hIPmtVaYKbgg8+ri1M8QFyg47GghntUFFHoZS
	x3iM9Ip054hVSKgoiPBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX0fy-000000091gE-47d7;
	Wed, 02 Jul 2025 16:51:14 +0000
Received: from out-179.mta1.migadu.com ([2001:41d0:203:375::b3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWyj1-00000008fSL-3e5u
	for kvm-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 14:46:17 +0000
Date: Wed, 2 Jul 2025 16:46:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751467573;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hWVk+mWXjNoWAcO7yRaMljb1CdNmQ9EOBU3D+Ap2Yw8=;
	b=R7tVbKS0GuZdnm4Um1TDnU4JRqJ2BW+VpknYouN4TZ9qbKamZnbJ+ORstVhvpmq+D8UBAt
	JfC+mSgjoFVJGQiVFd+izGlmoar7YiPdHtU9QdvpVDm+cah9o1JkRZRK0y3iqpz2P2OQKG
	sAY0xc130ftLxucS9M3rVvQWIgVc9eM=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Jesse Taube <jesse@rivosinc.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-kselftest@vger.kernel.org, Atish Patra <atish.patra@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, Himanshu Chauhan <hchauhan@ventanamicro.com>, 
	Charlie Jenkins <charlie@rivosinc.com>
Subject: Re: [kvm-unit-tests PATCH v2] riscv: Allow SBI_CONSOLE with no uart
 in device tree
Message-ID: <20250702-7efa8f9a74c2014fc94f35c3@orel>
References: <20250613150313.2042132-1-jesse@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250613150313.2042132-1-jesse@rivosinc.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_074616_048412_2138F308 
X-CRM114-Status: GOOD (  10.53  )
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

On Fri, Jun 13, 2025 at 08:03:13AM -0700, Jesse Taube wrote:
> When CONFIG_SBI_CONSOLE is enabled and there is no uart defined in the
> device tree kvm-unit-tests fails to start.
> 
> Only abort when uart is not found in device tree if SBI_CONSOLE is false
> 
> Signed-off-by: Jesse Taube <jesse@rivosinc.com>
> ---
>  lib/riscv/io.c | 25 +++++++++++++++++++------
>  1 file changed, 19 insertions(+), 6 deletions(-)
>

Merged. Thanks

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
