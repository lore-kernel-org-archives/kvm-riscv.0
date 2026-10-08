Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC1D5CA6012
	for <kvm-riscv@archiver.kernel.org>; Thu,  8 Oct 2026 14:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vgXs5R+1QpIAQjHLk1IYtOYmGNsrGi7ooiH5D3c+ZHY=; b=KEKi2mIqe7hbn+
	Y2OoVhFec7Qj/gkyrfoCvH9PP8arrLoOB6xWtKejM30Wr3pmMllGhJEXq2WfvrhR+dIHi7GEswuSQ
	Bj+OKgpvrCfYBBaucUCz/U7tjimvNwD/2EkyBnqqxHQpn2Og0SX8gP37E7AvZ5yBfQEPbFVJYJt4h
	oVWMW+X0faFiytM7n9eZ7GpnOWLr3Vgd7yfhpzAD6aHjl2BST3AUGxmQgBkmbUXAvB6wJHqvuRcgG
	UrPserTAKG1Z3tJkM0Wm8DubVm0DKTiFvUX1fzS7LhnU7ZdoywHb8JB4++n+Gyp4siKWY7e9lTLsy
	KceZ8bdGzBGnO0V12KsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEofg-00000004UwK-47Qb;
	Thu, 08 Oct 2026 14:00:32 +0000
Received: from out30-97.freemail.mail.aliyun.com ([115.124.30.97])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEofb-00000004UuF-39hw;
	Thu, 08 Oct 2026 14:00:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1791468021; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=rZAOc+mYe3cY1Z5TiO6j3GRrj0kPXBVOgAxhQWLGsmQ=;
	b=e1eLbpL19UWneGlOJyaJgIdHJnUTjOHRW+/24skkeDs4DsBaCNf+t8Mfbt70kPWBFBCH/gB9rWiJ7WwXxksBruj1sakeZunc/7sNooBHWF/CetZ6d9j8XOX3WBCVsfh1gvGAo1zKTqRFw32CCh718XrdRWDgsiYKqWGvKKz6YEE=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R161e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=19;SR=0;TI=SMTPD_---0XCQTvlb_1791468019;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0XCQTvlb_1791468019 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 08 Oct 2026 22:00:20 +0800
From: fangyu.yu@linux.alibaba.com
To: tomasz.jeznach@linux.dev,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	jroedel@suse.de,
	zong.li@sifive.com,
	andrew.jones@oss.qualcomm.com,
	jgg@nvidia.com,
	jgg@ziepe.ca
Cc: fangyu.yu@linux.alibaba.com,
	guoren@kernel.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org
Subject: [RFC PATCH 0/3] iommu/riscv: Add irqbypass support without MSI page table
Date: Thu,  8 Oct 2026 21:59:58 +0800
Message-Id: <20261008140001.94508-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_070028_559290_E45413A8 
X-CRM114-Status: UNSURE (   4.98  )
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

From: Fangyu Yu <fangyu.yu@linux.alibaba.com>

The MSI page table is an optional feature of the RISC-V IOMMU
specification. Hardware without the MSI_FLAT capability has no such
table, and MSI writes from devices are translated by the second-stage
page table like any other DMA.

Since the second-stage page table governs where those MSI writes land,
forwarding is still possible without an MSI page table: map the guest
IMSIC GPA to the host IMSIC HPA in the second-stage domain and device
MSI writes reach the vCPU's interrupt file directly, bypassing the host
MSI path entirely.

This patch implements irqbypass using second-stage page table, so it
is a functional supplement for IOMMU without MSI page table.

This series is based on Andrew Jones' v3 irqbypass support series [1]

[1] https://lore.kernel.org/linux-riscv/20260928143113.49838-1-andrew.jones@oss.qualcomm.com/

Fangyu Yu (3):
  iommu/riscv: Add guest IMSIC GPA mapping helpers
  iommu/riscv: Extract IRQ forwarding payload validation
  iommu/riscv: Support IRQ forwarding without MSI page tables

 drivers/iommu/riscv/iommu-ir.c | 179 +++++++++++++++++++++++++++++++--
 drivers/iommu/riscv/iommu.c    |  94 +++++++++++++++++
 drivers/iommu/riscv/iommu.h    |  12 +++
 3 files changed, 276 insertions(+), 9 deletions(-)

-- 
2.50.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
