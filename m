Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3892AC8303D
	for <kvm-riscv@archiver.kernel.org>; Fri,  4 Jul 2025 15:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9qYD0rWex9YKCzL89vq4G/M4m+EsDFzPnZgzG9veOsY=; b=BDNoKCsDZB61DJ
	gTCvLMvg4elx9q2BJWL4tjQb8pngFUgkArv7OCDdG0/jT5PBUI0dSPW2LYZ4Uu1KeK5NwTjs9zq6t
	iYfEvjECC+C/BokM0cJyEVuI1qkiRKjewTWh6tkjOtC9R9IAUNh+9UNM3D0bz4JoglovjZGZXHp+H
	Wwf2G04SdkWLmckpJNQXketYcnxWkPMZki4ZNPyKEDTMkgIX57Sc0+pN6xf3WVTAvKyJY6hBmm4+4
	aYtGhx5uO3E7o6jeLW8hKFSkWbHm4NsHoF0r8Wq0DV41HC4JXGonw3HcRDEqa91oXrJbq/wXEh7BH
	/f/KMIorZEVrV+N0Z+vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXiEl-0000000Eo5q-3Org;
	Fri, 04 Jul 2025 15:22:03 +0000
Received: from out-183.mta0.migadu.com ([91.218.175.183])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXi5y-0000000EmlX-47LZ
	for kvm-riscv@lists.infradead.org;
	Fri, 04 Jul 2025 15:13:00 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751641976;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=muPd8ALb5wcmT6P5lEUElOFpEadSmXSUQz2XkdW4i10=;
	b=cPVq4pasQ4CgcqfXj7bto9SHoNcU2IB5CFsvqnCCfvBph9UqAHPr+IwSpBKHDBU7HYE/6C
	5DFpU9IgZspaKhaRXVePObGfr2yLvFnV5eRlJgHqWZS8ld/lGN488jkUMdgLuf28MG5ZRU
	xBFnh3r8Ez8MFJv4EBrw5DUs/bZ/Cck=
From: Andrew Jones <andrew.jones@linux.dev>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev,
	kvm-riscv@lists.infradead.org
Cc: alexandru.elisei@arm.com,
	cleger@rivosinc.com,
	jesse@rivosinc.com,
	jamestiotio@gmail.com,
	Atish Patra <atishp@rivosinc.com>
Subject: [kvm-unit-tests PATCH 0/2] riscv: Add kvmtool support
Date: Fri,  4 Jul 2025 17:12:55 +0200
Message-ID: <20250704151254.100351-4-andrew.jones@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_081259_463021_9DD6326F 
X-CRM114-Status: UNSURE (   5.77  )
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

The first patch is for arm's scripts. It adds a check that I found
useful on the riscv side. The second patch enables riscv to use
kvmtool too.

Andrew Jones (2):
  arm/arm64: Ensure proper host arch with kvmtool
  riscv: Add kvmtool support

 README.md     |   7 ++--
 arm/run       |   5 +++
 configure     |  12 ++++--
 riscv/efi/run |   6 +++
 riscv/run     | 110 +++++++++++++++++++++++++++++++++++---------------
 5 files changed, 101 insertions(+), 39 deletions(-)

-- 
2.49.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
