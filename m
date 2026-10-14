Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D60DCC6B1D
	for <kvm-riscv@archiver.kernel.org>; Wed, 14 Oct 2026 14:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9VMu5hUwE6soeW0R4v/56TyY6lx/jSd4YeQbRF1mE8M=; b=ef/75ZNNM8BkB0
	vXIrkeKM9ZbiPBprfZkRWUO0Qz11B01Yl5Bi8CU9vvHwvvynjxHbNP4rTzRhsLXm+DrB/AJu4woux
	4I2Hj0C4S7mMaiVjP7lwv6QRZBWimbUDmYYDBnHkT+5mZQckIeTlSIbdgW7GiXowal8O8GakqdeVo
	qabomT/p3f94JHZqEoU4TULQmKS+alW/1Bf0SAHVKQo6jNg3jODrAuObPF0IMBXh5yJfWZOYpG1xH
	/nQ+w68TnefbQQW2UsviYix3aOttePOfeyLlZYWYAAQ5HpRT948HkrhLcxiiW8gnX35A3YO34aRu+
	N5I1JKGki+M6EeaX4sjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGzht-0000000Fgfn-2jtv;
	Wed, 14 Oct 2026 14:11:49 +0000
Received: from out30-124.freemail.mail.aliyun.com ([115.124.30.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGzhp-0000000Fgej-1q2U;
	Wed, 14 Oct 2026 14:11:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1791987095; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=F4CY7eqCTmwF5gqCh81nQww38TakuMfoYmXy36eh0Uo=;
	b=Rtd6AJc7dRB4x0p2TvlDO//OfiKdeSagKwYnymU9OqQHy+LV/jy/6cFpRl2KLH+X3ex/xOii58vz746jyVjvQEEB+4SsMszFsY9V/DZSCmG0oBaAPCkmlfINGYblm/fHPEtlmdQes/jaqqYOTaxBy+K052OuyTaAaK0xl3HAudk=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R951e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=20;SR=0;TI=SMTPD_---0XCp41-T_1791987092;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0XCp41-T_1791987092 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 14 Oct 2026 22:11:34 +0800
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
	jgg@ziepe.ca,
	gsh517025@gmail.com
Cc: fangyu.yu@linux.alibaba.com,
	guoren@kernel.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org
Subject: [RFC PATCH v2 0/4] iommu/riscv: Add irqbypass support without MSI page table
Date: Wed, 14 Oct 2026 22:11:20 +0800
Message-Id: <20261014141124.48569-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_071146_398787_9C59F885 
X-CRM114-Status: UNSURE (   8.02  )
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

---
Changes in v2:
    - Following Jason's and Shuai's suggestion, the atomic PTE replace operation
      is moved into generic_pt as a new replace_leaf op (new patch 1), and the
      riscv driver now uses it to repoint the guest IMSIC GPA mapping instead of
      walking the second-stage page table in the driver (patch 3).
    - Link to v1:
      https://lore.kernel.org/linux-riscv/20261008140001.94508-1-fangyu.yu@linux.alibaba.com/

Fangyu Yu (4):
  iommupt: Add replace_leaf to atomically swap a leaf OA
  iommu/riscv: Extract IRQ forwarding payload validation
  iommu/riscv: Add guest IMSIC GPA mapping helpers
  iommu/riscv: Support IRQ forwarding without MSI page tables

 drivers/iommu/generic_pt/fmt/riscv.h      |  47 ++++++
 drivers/iommu/generic_pt/iommu_pt.h       |  65 ++++++++
 drivers/iommu/generic_pt/kunit_iommu.h    |   7 +
 drivers/iommu/generic_pt/kunit_iommu_pt.h |  54 +++++++
 drivers/iommu/riscv/iommu-ir.c            | 178 ++++++++++++++++++++--
 drivers/iommu/riscv/iommu.c               |  43 ++++++
 drivers/iommu/riscv/iommu.h               |  12 ++
 include/linux/generic_pt/iommu.h          |   4 +
 8 files changed, 401 insertions(+), 9 deletions(-)

-- 
2.50.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
