Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FB37C282EC
	for <kvm-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 14:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GQtqbZRdq2+fRumtQM7GksxPO5z2wJyxFlGow49Ggqo=; b=ix7BSxdRHmyo1A
	FhMezhKW+WafKgOob4WRi9ot8WKVSQtY7sP5u3BC4KS8ReHBkw+6U7mFY7N0tW1xglqk0DqClQXuB
	nTtH22uyzFOb87L4r+SA5mtB8X7lgM/OLX7+rX7AOtQOXbrT7DE40zCqtlhMDbVu1AI95f+8KG5Qn
	pH3DYkPixH7GEbi1qU0IhQXZKGOFKpW7HhzNjePIn3Pf1cOwfYJitwfTcNL27MuSGostXFvbd7x0u
	hWayiX4dtEMm5ef+wuXvsNrBLNu4ZMVSzY4y8PZGHmc9phYR6Gh3CTKdrBrg4+Tq35Lf+Oj/6dvs/
	2/69W8Un/FvCKwnnfj+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt67S-0000000EPXF-2bRo;
	Fri, 14 Mar 2025 14:34:38 +0000
Received: from out-183.mta1.migadu.com ([2001:41d0:203:375::b7])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt67P-0000000EPW8-2MQG
	for kvm-riscv@lists.infradead.org;
	Fri, 14 Mar 2025 14:34:37 +0000
Date: Fri, 14 Mar 2025 15:34:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1741962873;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yQtXn7EfOwi88ok7c8Xwpnh/hZw+xkgnM8G54+S4Ae8=;
	b=lOu1BjIu03QWispt+Xs/80b17zsC4eW/Zjf78alvB71TRKZk4VIL1JkSt+KxLoChEIhr0Y
	z/bftBI0MrVBShwhdGTsGTj2T5sHFTEgv0XV7xtXFfjEmzG6dxr6CyjseU9otn+1EW+KYL
	4XdAz7AsgP2qgEqBQC1dF8uqtdbGvmw=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	Andrew Jones <ajones@ventanamicro.com>, Anup Patel <apatel@ventanamicro.com>, 
	Atish Patra <atishp@rivosinc.com>
Subject: Re: [kvm-unit-tests PATCH v9 0/6] riscv: add SBI SSE extension tests
Message-ID: <20250314-2452599f59b82e53e99100e7@orel>
References: <20250314111030.3728671-1-cleger@rivosinc.com>
 <20250314-eb8cf0b719942c912e254ab2@orel>
 <eaf88dbb-39bb-4755-830a-7c801099c790@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <eaf88dbb-39bb-4755-830a-7c801099c790@rivosinc.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_073435_803172_C8917272 
X-CRM114-Status: GOOD (  19.71  )
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

On Fri, Mar 14, 2025 at 03:23:39PM +0100, Cl=E9ment L=E9ger wrote:
> =

> =

> On 14/03/2025 15:19, Andrew Jones wrote:
> > On Fri, Mar 14, 2025 at 12:10:23PM +0100, Cl=E9ment L=E9ger wrote:
> >> This series adds tests for SBI SSE extension as well as needed
> >> infrastructure for SSE support. It also adds test specific asm-offsets
> >> generation to use custom OFFSET and DEFINE from the test directory.
> > =

> > Is there an opensbi branch I should be using to test this? There are
> > currently 54 failures reported with opensbi's master branch, and, with
> > opensbi v1.5.1, which is the version provided by qemu's master branch,
> > I get a crash which leads to a recursive stack walk. The crash occurs
> > in what I'm guessing is sbi_sse_inject() by the last successful output.
> =

> Yeah that's due to a6/a7 being inverted at injection time.
> =

> > =

> > I can't merge this without it skipping/kfailing with qemu's opensbi,
> > otherwise it'll fail CI. We could change CI to be more tolerant, but I'd
> > rather use kfail instead, and of course not crash.
> =

> Yes, the branch dev/cleger/sse on github can be used:
> =

> https://github.com/rivosinc/opensbi/tree/dev/cleger/sse
> =

> I'm waiting for the specification error changes to be merged before
> sending this one.

While ugly, I'm not opposed to doing an SBI implementation ID and
version check at the entry of the SSE tests and then just SKIP
when we detect opensbi and not a late enough version of it. If we
go that route, then please create a separate patch that adds a
couple functions in lib/riscv/sbi allowing all sbi unit tests to
easily check for specific SBI implementations and versions. (We'll
probably want to steal the kernel's sbi_mk_version and add an enum
or defines for the SBI implementation IDs.)

Thanks,
drew

-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
