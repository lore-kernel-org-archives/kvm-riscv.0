Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3625FC5AE59
	for <kvm-riscv@archiver.kernel.org>; Thu,  5 Jun 2025 10:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZEu3stD9uslkBSrGg74jznehOwJ3cHNX7ndCHOeWasg=; b=nYKQnXAOWmDvG1
	PdmhbF+HbzaG1BPIN1B4fADJBudE7XJni+GQA9trpQTozKwM/joAlGPxBLYxxsCWhPYTBlonlrfjD
	QIstPC7pkGRZ3XYs7379Q6TfyG7kjSsybZZngo+vWj+j3o/VIcfnxCkDrCK+ytj7RB0LEDjIfqI3o
	yoL90env4RLHLKbnDimuy89l+0CzelqN9rmpjeCzDAFKYxODhpO7hma/7f84BpoEzmAKS8qPFw5p8
	xM8aIDRczhA8TaaAell/TzhMhbW25ziFeGW6RNqdfgFGJBs/Xh+rmVy20tB2f6BVIeBU7oUDbb/EX
	9BLrErDWg7obsjeWDJUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN7wj-0000000FGQ6-3M3b;
	Thu, 05 Jun 2025 10:35:42 +0000
Received: from out-170.mta0.migadu.com ([91.218.175.170])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN7vd-0000000FGF7-1kTG
	for kvm-riscv@lists.infradead.org;
	Thu, 05 Jun 2025 10:34:34 +0000
Date: Thu, 5 Jun 2025 12:34:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749119670;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5LvxkDopGogQM6V5tHY5SCNcHoKvu6McPGJuxgeMFrU=;
	b=LOo8s37PkCutFOdQT6wYtTTpquluxzfvRpYTVBANNif/CakKn4hFgJoqhx0zHAsnl2VFq3
	t/Ex4jGfGxRQ0Dj74YCTy9L2KDsgnZeXAjvHGpaN+ZJAOSIdKzFyIpPoJhwyzII5/4kqQA
	Tz1MNbVNLT4FNG/wiAVIOhvwUXNT/74=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	Andrew Jones <ajones@ventanamicro.com>, Ved Shanbhogue <ved@rivosinc.com>
Subject: Re: [kvm-unit-tests v2 2/2] riscv: Add ISA double trap extension
 testing
Message-ID: <20250605-804fba12f792b0f8cde255d3@orel>
References: <20250603154652.1712459-1-cleger@rivosinc.com>
 <20250603154652.1712459-3-cleger@rivosinc.com>
 <20250603-1e175dd9e60c1bf2a52dbfc9@orel>
 <f8acf479-4a80-4128-bdd3-4ae69e0c215c@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f8acf479-4a80-4128-bdd3-4ae69e0c215c@rivosinc.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_033433_605991_753F2421 
X-CRM114-Status: UNSURE (   9.10  )
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

On Thu, Jun 05, 2025 at 11:52:14AM +0200, Cl=E9ment L=E9ger wrote:
...
> >> +	if (sbi_probe(SBI_EXT_SSE)) {
> >> +		if (sse_double_trap()) {
> >> +			report_skip("Could not correctly unregister SSE event, skipping la=
st test");
> >> +			return;
> >> +		}
> >> +	} else {
> >> +		report_skip("SSE double trap event will not be tested, extension is=
 not available");
> > =

> > Missing return
> =

> That's actually telling us it skipped the SSE + double trap test, not
> the rest of this function. So that should be kept without any return or
> we will skip the last test.
>

Ah, yes.

Thanks,
drew

-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
