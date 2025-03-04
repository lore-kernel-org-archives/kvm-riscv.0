Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEFB6C021B8
	for <kvm-riscv@archiver.kernel.org>; Tue,  4 Mar 2025 09:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p3TCzUN6/mui0sBo7h5d+EqiJuhYhLUwcwtCRgdWOgc=; b=vDjlKuzEOHpkoa
	0ExnIdkt5bfjbVi2OMuvJ/vbxEbkdtpEvCl9RcQSqdoe1uw4Y4NFcL/QXj5SlTyRU1d9DGTi0UHsY
	ZANpXSRESiMsQIpAfza3QcaVau39XTAImePNNuwo7BuMzGtQeMqTwVGLmm8sX2gjwNgX+0tzi/4ZD
	fWY0abbbIvRuEfuwhzTizDCCiRb8kZnPRCWk1fD3zZjLdDRSFW5bwJdKrOONGqIHqrZrpB6FczDaQ
	rNRs2p/3TICR58fJL9vVzQKyCfpDwVbKO3LlFTWhGoO37nsMGL7Rsr3zUskmzv08XW9cn0stggbRp
	UouIwurL4o5o9vy0QfwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpOdX-00000003uA5-2Dj0;
	Tue, 04 Mar 2025 09:32:27 +0000
Received: from out-188.mta1.migadu.com ([95.215.58.188])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpOca-00000003tsW-1PD3
	for kvm-riscv@lists.infradead.org;
	Tue, 04 Mar 2025 09:31:29 +0000
Date: Tue, 4 Mar 2025 10:31:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1741080686;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4VJMGW1+tX87MMl7glkKCqpA8lXX7JKrtNvhQrZTlFk=;
	b=qQMoMwE+0Z8PUG+vN1Wfignwm7dBdJKo9CFdtl3TBN0NiP0QXlfpCJ4B+cAOgS07/NbrmX
	8Ak9s+A31X2PIoVt2SiZcP2zYjB/kncGwQVPMgeg0ljn9uNV7W3ZSPhGI6r5X6MmfRB8Nj
	ZG5BHwlJ3886cYJb09yvc7YH0bhISdI=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: kvm-riscv@lists.infradead.org
Cc: atishp@rivosinc.com, cleger@rivosinc.com, jamestiotio@gmail.com
Subject: Re: [kvm-unit-tests PATCH v2 00/11] riscv: sbi: Test improvements
 and a couple new
Message-ID: <20250304-d6467defdcdc60f372296de0@orel>
References: <20250227141946.91604-13-andrew.jones@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250227141946.91604-13-andrew.jones@linux.dev>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_013128_583043_D574384E 
X-CRM114-Status: UNSURE (   8.14  )
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

On Thu, Feb 27, 2025 at 03:19:24PM +0100, Andrew Jones wrote:
> Improvements:
>  - Ensure system suspend test won't hang
>  - Ensure HSM suspend tests won't hang
>  - Ensure state is cleaned up at the end of one extension's test before
>    starting another
>  - Probe SUSP and skip cleanly
>  - Minor SUSP test output improvement
>  - Dropped upper bits fwft test for misaligned_exc_deleg
> =

> New tests:
>  - Check bad FIDs for all extensions
>  - Check SUSP sleep_type upper bits are ignored on RV64
>  - FWFT pte-hw-ad-updating tests
> =

> v2:
>  - Dropped upper bits fwft test for misaligned_exc_deleg rather than
>    change to kfail
>  - Added FWFT pte-hw-ad-updating tests
>  - Added a couple Cl=E9ment tags
>

Merged.

Thanks,
drew

-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
