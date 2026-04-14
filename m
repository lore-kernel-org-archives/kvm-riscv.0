Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 725DAED7BBC
	for <kvm-riscv@archiver.kernel.org>; Tue, 14 Apr 2026 11:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OC/OmZ80yGLQXsjIWIT7CXMdjPhOATHNA77JCUMLEck=; b=eqlj1wWTLjrVOX
	9ZeJJD4/z6j08KrtcH9fSvp0F5DILkdX5HFfrDQnNYzIQZKIFlN5VYIOp1T+Yl9n+eDGHO0EF3eRU
	nwfIE3kZSKk1SbdZrjN3P/ZsyikcLLkZpvtj/zOtHIFYS5XO1o1yWwluOKQH0tSBh+EwRRx7Bwlaq
	K/p8eNC9RkdCv83MbdOCaccqbnOZM46VrOY4XZRRaLUxQVWlKxMj5t+6gifRX+N7tDqY4lYPELaRs
	bQSzgVdN6hTlhYfb/xPk9RuA/SHn9tixvZq2QISFC8RNF838sy0mvQ2nj5kxAN0ETnIL8hG9SzgT0
	P2PkG994lEhm45+VwzeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCbXJ-0000000HBnB-0ZIA;
	Tue, 14 Apr 2026 11:02:29 +0000
Received: from out30-118.freemail.mail.aliyun.com ([115.124.30.118])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCbXE-0000000HBlU-3nPW;
	Tue, 14 Apr 2026 11:02:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1776164541; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=nQO0WEe8PRJEZNBo6ma9yL1pusW/StlSU4Ir3Mof4CQ=;
	b=rD6WN/6UcaT0Jp9LJSmXv7CBbnTqayydixUytro38OtACv5XXWyf9d/xNBySsdyfhu54jYEeCRWR2b0wdvoWzRKorntmZFhwXON0hAfVx6u/EUUCmKI0XXP1nj4skpncokk8xsVP/NcPMnH/PLhwQyDGm2sULESbk4QPEUD6WQg=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R751e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=21;SR=0;TI=SMTPD_---0X11DRSf_1776164534;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0X11DRSf_1776164534 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 14 Apr 2026 19:02:16 +0800
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
	vasant.hegde@amd.com,
	anup@brainfault.org,
	nutty.liu@hotmail.com,
	jgg@nvidia.com
Cc: guoren@kernel.org,
	iommu@lists.linux.dev,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fangyu Yu <fangyu.yu@linux.alibaba.com>
Subject: [PATCH v2 0/2] iommu/riscv: Support Svpbmt memory types in generic_pt
Date: Tue, 14 Apr 2026 19:02:10 +0800
Message-Id: <20260414110212.79526-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_040225_493866_3A8A4D75 
X-CRM114-Status: UNSURE (   4.92  )
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

---
Changes in v2:
    - Add a comment for PT_FEAT_RISCV_SVPBMT (per Kevin and Jason).
    - Clarify PBMT encoding condition, sort PBMT-related bits by
      position, and drop the redundant PBMT clear(per Kevin).
    - Link to v1:
      https://lore.kernel.org/linux-iommu/20260411022223.91029-1-fangyu.yu@linux.alibaba.com/

Fangyu Yu (2):
  iommu/riscv: Advertise Svpbmt support to generic page table
  iommupt: Encode IOMMU_MMIO/IOMMU_CACHE via RISC-V Svpbmt bits

 drivers/iommu/generic_pt/fmt/riscv.h | 8 ++++++++
 drivers/iommu/riscv/iommu.c          | 2 ++
 include/linux/generic_pt/common.h    | 4 ++++
 3 files changed, 14 insertions(+)

-- 
2.50.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
