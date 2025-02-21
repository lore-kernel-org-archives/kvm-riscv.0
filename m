Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C93A2C021B5
	for <kvm-riscv@archiver.kernel.org>; Fri, 21 Feb 2025 15:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8r/Nd4gdjYueGtOmibDho9UEOdrI+VBEDwuUhoe/RcQ=; b=n8gB0WG6LwhaRJ
	Xlfqp225kGHA+owB8MjZ3Tz5u9NaKt0MZQeetkfHGgyv9BuHfqkwWWRQayOrTa9gfaAYnYCf6JnP9
	29XTXprkZ11TFiPcz/Ma8eUsd4uzOOdR0gOvk6o9yA8PiApmqYhArJOSqGDiWIoFYUXk8g1/lrT43
	Pbhax+NgALsbivYXGUDqRLMFHfa3pWPoQHKSFLCsN6KGB04AG3c1bNiBKa+j6aHhVG21I/jyhzrl/
	ylG7mmI2ROWnUissmgl1ZPEzPrUXTxOg6Q6JhJRGdkGcp6NfwUACaTJCgWArHUPqt+5XDOjGCQaXP
	aBT7GsS0L1XON8pAwwYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlVNT-000000063Zy-2PNG;
	Fri, 21 Feb 2025 15:55:47 +0000
Received: from out-178.mta1.migadu.com ([2001:41d0:203:375::b2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlVNQ-000000063Wi-27m6
	for kvm-riscv@lists.infradead.org;
	Fri, 21 Feb 2025 15:55:46 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1740153337;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VfL9PtSxND98vBjdy1jLKDGOkZw94WglR9QFvnsxHHI=;
	b=uF672vlaeN2/KVIiQvDb6pEtJ9KU8aj/xBXr+JsH4qN8phqEZvbZ/jlEkHNuHv+vIrUahE
	wXMt04dgbb6QNZQmpIaO3/JOO4jtHwGtTb2PczCGUk2+jz5R4BgiX6PkSD2dvO4YD0tv+n
	jnoHDAP+hlU6X/LLeMdxJ44eGsM65gM=
From: Andrew Jones <andrew.jones@linux.dev>
To: kvm-riscv@lists.infradead.org
Cc: atishp@rivosinc.com,
	cleger@rivosinc.com,
	jamestiotio@gmail.com
Subject: [kvm-unit-tests PATCH 00/10] riscv: sbi: Test improvements and a couple new
Date: Fri, 21 Feb 2025 16:55:34 +0100
Message-ID: <20250221155533.123418-12-andrew.jones@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_075544_781743_061370D0 
X-CRM114-Status: UNSURE (   4.84  )
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

Improvements:
 - Ensure system suspend test won't hang
 - Ensure HSM suspend tests won't hang
 - Ensure state is cleaned up at the end of one extension's test before
   starting another
 - Probe SUSP and skip cleanly
 - Minor SUSP test output improvement

New tests:
 - Check bad FIDs for all extensions
 - Check SUSP sleep_type upper bits are ignored on RV64

Other:
 - Use kfail for some FWFT fails to make CI happy

Based and available here:
https://gitlab.com/jones-drew/kvm-unit-tests/-/commits/riscv/sbi

Andrew Jones (10):
  riscv: sbi: Mark known fwft failures as kfails
  riscv: sbi: Ensure we have IPIs enabled for HSM suspend tests
  riscv: sbi: Ensure SUSP test gets an interrupt
  riscv: sbi: Improve susp expected error output
  riscv: sbi: Improve interrupt handling cleanup
  lib/cpumask: Add some operators
  riscv: sbi: HSM suspend may not be supported
  riscv: sbi: Probe/skip SUSP
  riscv: sbi: susp: Check upper bits of sleep_type are ignored
  riscv: sbi: Add bad fid tests

 lib/cpumask.h     |  56 +++++++++
 riscv/sbi-fwft.c  |  17 ++-
 riscv/sbi-tests.h |   4 +
 riscv/sbi.c       | 292 +++++++++++++++++++++++++++++++++-------------
 4 files changed, 284 insertions(+), 85 deletions(-)

-- 
2.48.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
