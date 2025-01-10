Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2D81E7719C
	for <kvm-riscv@archiver.kernel.org>; Fri, 10 Jan 2025 14:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2iVMet838R4t++c8VAEnirKpmzaX0fEeW0ZAC98Rjk8=; b=N37eyS/X3BgJ24
	M6Cqr6XJ04KN+KXiyCg1O6+EUNvR1N4HgSabS/N80ZDAbDT1wjst13WmzaBaLIffWYU9ioMrRszXX
	TTzjl1e+SiBL8bfV84F/BmnYDdVz3DyvtTZa2NDxMsgmt/5jWxHC1BRecVVKec038dhSqqBBmiAo5
	0ppTvk9vvZ5ZkGmf6uYSujpvxBU2IoLaWpS6J+dWm2yDdGg6A6rxlf+W9bpYhEsnVA2TxS4odEtXU
	3i1elu8z7sCj6vDzMqu475EpggLpMWQoIMWoY+0AjKuyCNiuuoAt8Cjc/55hUfJcO4wMYEXwevj7a
	nNe8JStqFj9XQE/3JBOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWFfP-0000000FaIi-2G3s;
	Fri, 10 Jan 2025 14:07:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWFXp-0000000FYVD-0GxG
	for kvm-riscv@lists.infradead.org;
	Fri, 10 Jan 2025 13:59:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C754F1477;
	Fri, 10 Jan 2025 05:59:45 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5DDD93F59E;
	Fri, 10 Jan 2025 05:59:15 -0800 (PST)
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: andrew.jones@linux.dev,
	eric.auger@redhat.com,
	lvivier@redhat.com,
	thuth@redhat.com,
	frankja@linux.ibm.com,
	imbrenda@linux.ibm.com,
	nrb@linux.ibm.com,
	david@redhat.com,
	pbonzini@redhat.com
Cc: kvmarm@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	kvm-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	vladimir.murzin@arm.com
Subject: [kvm-unit-tests PATCH v1 0/5] arm64: Change the default --processor to max
Date: Fri, 10 Jan 2025 13:58:43 +0000
Message-ID: <20250110135848.35465-1-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_055925_148056_75921B54 
X-CRM114-Status: GOOD (  10.69  )
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

(CC'ing everyone from MAINTAINERS because I'm touching configure)

Vladimir sent a test for MTE [1], which didn't work on the default -cpu
model, cortex-a57, because that CPU didn't implement MTE. There were two
options to get it working:

1. Add -cpu max to the extra_params unittest parameter.
2. Make the default value for the configure --processor option 'max'.

We decided that the second option was preferable, so here it is.

The first patch might look unrelated, but when I was writing the function
to select the default processor based on the architecture I noticed that
for arm64, $arch is first equal to aarch64, then it gets changed to arm64.
My first instinct was to have it be arm64 from the start, but then I
realized that, despite the help text, --arch=aarch64 has been supported
ever since arm64 was added to kvm-unit-tests. So I decided that it might
more prudent to go with it and document it.

[1] https://lore.kernel.org/all/20241212103447.34593-1-vladimir.murzin@arm.com/

Alexandru Elisei (5):
  configure: Document that the architecture name 'aarch64' is also
    supported
  configure: Display the default processor for arm and arm64
  arm64: Implement the ./configure --processor option
  arm/arm64: Add support for --processor=max
  configure: arm64: Make 'max' the default for --processor

 arm/Makefile.arm    |  1 -
 arm/Makefile.common |  3 +++
 configure           | 35 ++++++++++++++++++++++++++---------
 3 files changed, 29 insertions(+), 10 deletions(-)


base-commit: 0ed2cdf3c80ee803b9150898e687e77e4d6f5db2
-- 
2.47.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
