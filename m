Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAC0DC35FFC
	for <kvm-riscv@archiver.kernel.org>; Sat, 22 Mar 2025 10:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ww8xmta0pfeSHx1jG8sMKURlsqhcOCb+eSXBGBSh6T4=; b=igEBs2awBJkam3
	4ptLd0BfdHtlrvd0BqOOYDPYfge2J2oY4kkgZ2MYgHJnbhoULrVcjHMy9yHXmWjWNF1fs9x3+FI4X
	VnlzqPWSBsWzShbCeCYsqb4zTfCK6/DoGRven8BHpxQ4KNzYVT4whgywm+fkIWH1QWJoCxV9RSYfz
	l4xBlnH2hMaFWfsQPGuYb0/GsT7WkrQiSWdWsluNi56YbPmI4FRi64Y3MUPgk19QJpiOftMKircjM
	qAAmXyeR42C59T/WXnu1nuQuJna9bK9/zM4SZmxvmY9VIs/OYdS5cEglgK+1NMJJGw7+KePCy5xFh
	lqFEFc/Mld4DbCjm27Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvwN8-0000000HIEG-1OIY;
	Sat, 22 Mar 2025 10:46:34 +0000
Received: from out-188.mta1.migadu.com ([95.215.58.188])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvwN5-0000000HIDC-3iAJ
	for kvm-riscv@lists.infradead.org;
	Sat, 22 Mar 2025 10:46:33 +0000
Date: Sat, 22 Mar 2025 11:46:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1742640388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Aq4lPivi9PmV469UbUNcJtpLaFoa1nsoqqrqthUmtJU=;
	b=SBSLVQMLKxhHDzVJWB71hS5dvREPWq1dWyCM4O3NH3inOkcliCXGnzidA5OxXjDP5kgs7S
	3pFEuuRjmKvU+FKBtpg0JzERpDKD6S1zVYQvPv/mFi4EhlZ2l4HpwO9WQszBB9vOr7gb32
	Wsg68qD9LmlqW/hIQ9fTzv0MjL+ZSJA=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	Andrew Jones <ajones@ventanamicro.com>, Anup Patel <apatel@ventanamicro.com>, 
	Atish Patra <atishp@rivosinc.com>
Subject: Re: [kvm-unit-tests PATCH v11 0/8] riscv: add SBI SSE extension tests
Message-ID: <20250322-2b07672652d6ce2c0972a62d@orel>
References: <20250317164655.1120015-1-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250317164655.1120015-1-cleger@rivosinc.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250322_034632_060508_A88DA888 
X-CRM114-Status: UNSURE (   6.40  )
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

On Mon, Mar 17, 2025 at 05:46:45PM +0100, Cl=E9ment L=E9ger wrote:
> This series adds tests for SBI SSE extension as well as needed
> infrastructure for SSE support. It also adds test specific asm-offsets
> generation to use custom OFFSET and DEFINE from the test directory.
> =

> These tests can be run using an OpenSBI version that implements latest
> specifications modification [1]
> =

> Link: https://github.com/rivosinc/opensbi/tree/dev/cleger/sse [1]

Merged.

Thanks,
drew

-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
