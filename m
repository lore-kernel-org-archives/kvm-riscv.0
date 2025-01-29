Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BED6C0218D
	for <kvm-riscv@archiver.kernel.org>; Wed, 29 Jan 2025 17:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VOCT5diNBt19uLECEe+4jEzTam+LBe4u83lBgQm2hYk=; b=ctMzQLbxa1q3iq
	yTppbA3whZdtY64LNQ8HWa+BhUjxxmwYmz1RqMvJr1v64srSJE5tIqd3Wn8lS5vs0fcZJMs6w/cf+
	cc/M6mxzpTYHMFwSLo8U9ZCZHTaMHtGWQ7EULEKSkLkxI3zoq4uYwJe9GoR2AdsAGbet5S/HvV1au
	TQJX32ANbQT6FTT2Li4zlWYIW3/t6gOiqdAlPWuB7enCVTokIz8QXelCW8IW7TW9oyL4iAXG7O1h1
	zr8CH3jUbf35p9kZGM9WvZQmCYUOQxKrbd703RRKet1NISd6APsO+QCR7+RqhcVKwquGlTvxHO7ne
	K/tE1qlxE4kipXHRTiKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdBRi-00000007Rpz-35bf;
	Wed, 29 Jan 2025 17:01:46 +0000
Received: from out-170.mta1.migadu.com ([95.215.58.170])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdBRg-00000007Row-3nii
	for kvm-riscv@lists.infradead.org;
	Wed, 29 Jan 2025 17:01:46 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738170101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Rdozq1HP6HpXWD3Wt3hf8PSiB8dcb6X9DSH0AQSOJzs=;
	b=QJtwCsMqyrea0jamvoyy3wn63xQ0Rt2D17quPu37JPyUBh5s0bcdyIvXjAnTlhrCOyrovM
	A3Q45hRNqykKh5ZmQZBsAwBUug6wdKwu+9THYYSj86l+UAAEmViP/zYWD5dQO62FpNmWox
	52w8udFRuQipWlsWYsB9PI69wOX3rfc=
From: Andrew Jones <andrew.jones@linux.dev>
To: kvm-riscv@lists.infradead.org
Cc: jamestiotio@gmail.com,
	cleger@rivosinc.com,
	Atish Patra <atishp@rivosinc.com>
Subject: [kvm-unit-tests PATCH 0/3] riscv: sbi: Provide sbiret_report/check
Date: Wed, 29 Jan 2025 18:01:39 +0100
Message-ID: <20250129170138.174222-5-andrew.jones@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_090145_086778_21FE7901 
X-CRM114-Status: UNSURE (   5.63  )
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

It's commom for SBI tests to expect a particular error return (or no
error, which case it expects the returned error to be SBI_SUCCESS).
When we don't get the expected error it'd be nice to output what we
did get. gen_report() in the SBI tests were doing that for the BASE
tests, improve it and export it to be used by all SBI tests.

Andrew Jones (3):
  riscv: sbi: Improve gen_report
  riscv: sbi: Export sbiret_report/check
  riscv: sbi: Add sbiret_report_error

 riscv/sbi-tests.h | 30 ++++++++++++++++++++++++++++++
 riscv/sbi.c       | 30 ++++++++----------------------
 2 files changed, 38 insertions(+), 22 deletions(-)

-- 
2.48.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
