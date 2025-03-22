Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD7F8C35FFC
	for <kvm-riscv@archiver.kernel.org>; Sat, 22 Mar 2025 10:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EwbRHTVXAAwYbXuiq1QxnSmXaahKdsv33KI3hzqi81c=; b=N7F6FjbtU1dDhS
	hLzUklhr1+g/9MYE7aGHLOICk4OV5go1D/Ke6Ni1Ekp1uGrAaeXIFTqVH0v/DCC3DOHvEw4R3bXHO
	r91tfte1sdipua42cMiSnTj/79KUat0su6bvN/vVy2dbUAg/sHxZycm0s6jh0+qKEPf1AN6+zbU9L
	HG194zJr0tH+cE+HqEYKR7eupsXsCI+QU9zyWhVXsXcVGUnqnoRPsdY89CjLb1+z2A+n0+P4cuCPI
	1Qi6P7uXu9CuUAcY83/h/SJVbEPPSaNvzbbiTSlwJjSvrAqfM1LfYsvz+DJzKFwPBZ0VD/lH1sS9U
	pp4KwbfxhSU51WSvcRkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvwNv-0000000HIRn-2nmW;
	Sat, 22 Mar 2025 10:47:23 +0000
Received: from out-172.mta0.migadu.com ([2001:41d0:1004:224b::ac])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvwNs-0000000HIQW-2ft4
	for kvm-riscv@lists.infradead.org;
	Sat, 22 Mar 2025 10:47:21 +0000
Date: Sat, 22 Mar 2025 11:47:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1742640436;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qtWGS+cnaJZc69h7e8Nnmx/GjyNyfzHViayLLb7oOu4=;
	b=sluOk92jOKy8XuRGlckPPQfhvoO+7Xz7ry35lmhUmEeYa4ti413/EUid7YVRonz8YFKIR7
	4kWbKwUg6wSDnE8bgdzMRE5FNpr6TtySLQL3CzxxkZMRLb671GgEYNsHdGF8MKSstzhKX1
	/WoT8zJEv41Jdy/ENYuZj5FUxpDK3Ks=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org
Cc: cleger@rivosinc.com, atishp@rivosinc.com, akshaybehl231@gmail.com
Subject: Re: [kvm-unit-tests PATCH 0/3] riscv: sbi: Ensure we can pass with
 any opensbi
Message-ID: <20250322-58f9c16024c28e345fd7ed02@orel>
References: <20250321165403.57859-5-andrew.jones@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250321165403.57859-5-andrew.jones@linux.dev>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250322_034720_816822_70A36B43 
X-CRM114-Status: UNSURE (   9.53  )
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

On Fri, Mar 21, 2025 at 05:54:04PM +0100, Andrew Jones wrote:
> At some point CI will update the version of QEMU it uses. If the version
> selected includes an opensbi that doesn't have all the fixes for current
> tests, then CI will start failing for riscv. Guard against that by using
> kfail for known opensbi failures. We only kfail for opensbi and for its
> versions less than 1.7, though, as we expect everything to be fixed then.
> 
> Andrew Jones (3):
>   lib/riscv: Also provide sbiret impl functions
>   riscv: sbi: Add kfail versions of sbiret_report functions
>   riscv: sbi: Use kfail for known opensbi failures
> 
>  lib/riscv/asm/sbi.h |  6 ++++--
>  lib/riscv/sbi.c     | 18 ++++++++++++++----
>  riscv/sbi-fwft.c    | 20 +++++++++++++-------
>  riscv/sbi-sse.c     |  4 ++--
>  riscv/sbi-tests.h   | 20 +++++++++++++++-----
>  riscv/sbi.c         |  6 ++++--
>  6 files changed, 52 insertions(+), 22 deletions(-)
> 
> -- 
> 2.48.1
>

Merged.

Thanks,
drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
