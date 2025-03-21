Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACDF1C36002
	for <kvm-riscv@archiver.kernel.org>; Fri, 21 Mar 2025 16:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+alNXLp4oHxoI3UrWzyxQGObhjjvyn2nZAJIrna8U68=; b=OA8a9bEI3qodFA
	B4aAjNOFeCV0WNQW+H8wE66d06eg0QdjhuIQqfZRnt4MyK3ppaF0amlwX7iS4d1hjEpQ2PRuH9V3K
	yUqUWJgTMoJ4JlwqD/cfmDGyus9MNeK+ooFAE0pDTdQrt8lNyCLm4UzIuB+Wm8k28rc0nh5UCMTGv
	UZidKIkUk0f0b96SC1KM/6N9XbQG4aNLe4pZ5igutjoOaeoEKuocOapYlFaG+YTxSKEWDnJ1q2ifQ
	Q+EvpYbztVg17tJmxd9RbLJuzpZGXu/sScjTD6/PFR9Sm4o/RWFIErqYz8uVavDftIolxaJY8zsH8
	Y+jxqo4rv5xEK7Yi59TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvfdR-0000000FbI3-1ltq;
	Fri, 21 Mar 2025 16:54:17 +0000
Received: from out-188.mta0.migadu.com ([91.218.175.188])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvfdP-0000000FbFe-0h9R
	for kvm-riscv@lists.infradead.org;
	Fri, 21 Mar 2025 16:54:16 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1742576047;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=L3tpVZTaN9sVjI7OLORjQOfubtoVtkOjlP2FWLr44QQ=;
	b=WODrA0koflENMXWf1U+GKQnX0dwxABSkeCNbSX9qDFyX00GsjoYfkvcp3Gnzn6d1K7eEaH
	7qt5/cnuWivGVH1KPd+Cq/VQ6cYOpWwc4X0u2jRqa13lSW6X5yUzKDh/qWZSXBNxhxZnQ5
	vvsazHvXLvjl6V4cmXaD1hAn7hk31Ho=
From: Andrew Jones <andrew.jones@linux.dev>
To: kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: cleger@rivosinc.com,
	atishp@rivosinc.com,
	akshaybehl231@gmail.com
Subject: [kvm-unit-tests PATCH 0/3] riscv: sbi: Ensure we can pass with any opensbi
Date: Fri, 21 Mar 2025 17:54:04 +0100
Message-ID: <20250321165403.57859-5-andrew.jones@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_095415_550042_CF1B66D7 
X-CRM114-Status: UNSURE (   4.99  )
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

At some point CI will update the version of QEMU it uses. If the version
selected includes an opensbi that doesn't have all the fixes for current
tests, then CI will start failing for riscv. Guard against that by using
kfail for known opensbi failures. We only kfail for opensbi and for its
versions less than 1.7, though, as we expect everything to be fixed then.

Andrew Jones (3):
  lib/riscv: Also provide sbiret impl functions
  riscv: sbi: Add kfail versions of sbiret_report functions
  riscv: sbi: Use kfail for known opensbi failures

 lib/riscv/asm/sbi.h |  6 ++++--
 lib/riscv/sbi.c     | 18 ++++++++++++++----
 riscv/sbi-fwft.c    | 20 +++++++++++++-------
 riscv/sbi-sse.c     |  4 ++--
 riscv/sbi-tests.h   | 20 +++++++++++++++-----
 riscv/sbi.c         |  6 ++++--
 6 files changed, 52 insertions(+), 22 deletions(-)

-- 
2.48.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
