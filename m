Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFB5FF45A1A
	for <kvm-riscv@archiver.kernel.org>; Sat, 11 Apr 2026 02:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=93S4hhgk+XglkiC2wKuYhSgDQOrXzhrChxbq6ILwfzY=; b=K3PD26EQYV7Xj2
	K9p1pyl3fROdGU1YT9EQKLPfWmMPZ7AORqmkgwY1UbhlZh+JjXfLktqNKEU2nT2ZP/ZVrPhrDbBMt
	ChoafTz6Oy335q9yTdiw6sorhTrsbg9qK1pJV0v603uWbjdzqZcs46w6HLL/BMLEgyV122v5fOfJm
	hUyp8OULqfORcNo5zwS5Pd2Ip9k77OE4R8gIbtwF5nYhMGQ068SgArYAVQjuduTt+7UPWxrSEpgjD
	PhacwpD+RY1ssA0SFuchdoV6TOXsfsHP0i8UDbNAV5XS9K0SKAAAyYy4EbDRPSoSKInQbKKmHDP33
	Rmt8xRfiAKra7AFze6pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBNze-0000000D3AG-3TVq;
	Sat, 11 Apr 2026 02:22:42 +0000
Received: from out30-97.freemail.mail.aliyun.com ([115.124.30.97])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBNza-0000000D396-2rbq;
	Sat, 11 Apr 2026 02:22:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1775874150; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=srznzHOaf7pJe5RveLZK1Z8x+0sCvPrzabLNg0ujS6M=;
	b=U5tpkMev2kRRX5MVj0RMn0Q8FaN6n8qpEhLoHwptxjZ7STj5dZ9g74xudaNycAa40oTfpan90WSH3Ya1n1uZldEYcPDCDj1nVray0tcgxYQRL8HE7u5LWvmen/zAvz7E7ieav4+z5iTTpGdEmkMPqZ8Hm3IMb2rlrICGhOtYC+s=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R201e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=18;SR=0;TI=SMTPD_---0X0miYQU_1775874145;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0X0miYQU_1775874145 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sat, 11 Apr 2026 10:22:28 +0800
From: fangyu.yu@linux.alibaba.com
To: joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	tjeznach@rivosinc.com,
	jgg@ziepe.ca,
	kevin.tian@intel.com,
	baolu.lu@linux.intel.com,
	vasant.hegde@amd.com
Cc: guoren@kernel.org,
	iommu@lists.linux.dev,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fangyu Yu <fangyu.yu@linux.alibaba.com>
Subject: [PATCH 0/2] iommu/riscv: Support Svpbmt memory types in generic_pt
Date: Sat, 11 Apr 2026 10:22:21 +0800
Message-Id: <20260411022223.91029-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_192239_431670_717941F6 
X-CRM114-Status: UNSURE (   3.71  )
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

RISC-V Svpbmt adds page-based memory types (PBMT) to PTEs, allowing
mappings to be tagged as e.g. normal memory, non-cacheable memory, or
I/O.

This series wires the RISC-V IOMMU Svpbmt capability into generic_pt
and uses PBMT to encode device memory attributes for IOMMU mappings.

This series builds on top of the new RISC-V IOMMU page table patches:
https://patch.msgid.link/r/0-v3-9dbf0a72a51c+302-iommu_pt_riscv_jgg@nvidia.com

Fangyu Yu (2):
  iommu/riscv: Advertise Svpbmt support to generic page table
  iommupt: Encode IOMMU_MMIO/IOMMU_CACHE via RISC-V Svpbmt bits

 drivers/iommu/generic_pt/fmt/riscv.h | 9 +++++++++
 drivers/iommu/riscv/iommu.c          | 2 ++
 include/linux/generic_pt/common.h    | 1 +
 3 files changed, 12 insertions(+)

-- 
2.50.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
