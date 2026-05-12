Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76247CD4F35
	for <kvm-riscv@archiver.kernel.org>; Tue, 12 May 2026 07:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oj1D1u5L2Vr8S2wLaO6OWQp7uOT4QV3wr8mSWLNiqeQ=; b=bOnUYu/VRCcCxC
	gt5JI0LZqxqt349luxlShoL3eGq8GRLXKBPWp/K8jrJ3hdhK+dmGDwP7XaUNZNz/16/2566fYcy0/
	A8mh8FoBc1uKUzYWfftp3Ejqsb80iAmrgMIIXLYpGUSVQvJ2Qi+NLVxcd+OzNWdfAO94gqUm7nlEj
	us1bw+9gAARMEVVn1mYlEh7FxDZD4NO+NE9vAHTCZO9ZMZJ+eeaHXPC9wh80VUxr/k3ptrOAEWr3+
	jkiInBvuyC6uYvZmGe+OEmwEpWO0evxWwVICTs1O2MCMGsMnSaKqtpQhwOEuX/KcftmZaxhcoagOk
	5mGM2HZ+39LDKpR1FE5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMhkj-0000000Fxkd-0UPE;
	Tue, 12 May 2026 07:42:05 +0000
Received: from out30-111.freemail.mail.aliyun.com ([115.124.30.111])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMhkf-0000000Fxi9-27cK;
	Tue, 12 May 2026 07:42:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1778571714; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=iGZ65kdo1hvMwcfP8gimQwDdAcnQW+BXaCkGVek8pE8=;
	b=TZveadkpXBaqpbar0jPXZvudLkohH8hnYerOoBGFDsnWjz04goPqaGHIeOC9AitXuqg47EqOknO8IMViO5ELkdWFNUPD+YVnwKrWfqCeBbj9v8KNLET/507s8aZqjuCrt/5C+k23Z3qKDxVSgU1D9FAyWmT7zdUaQxP9ADJHQ4o=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R721e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=25;SR=0;TI=SMTPD_---0X2puQM0_1778571710;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0X2puQM0_1778571710 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 12 May 2026 15:41:52 +0800
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
	atish.patra@linux.dev,
	skhawaja@google.com,
	jgg@nvidia.com,
	nutty.liu@hotmail.com
Cc: guoren@kernel.org,
	andrew.jones@oss.qualcomm.com,
	kvm@vger.kernel.org,
	iommu@lists.linux.dev,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fangyu Yu <fangyu.yu@linux.alibaba.com>
Subject: [PATCH v4 0/2] iommu/riscv: Support Svpbmt memory types in generic_pt
Date: Tue, 12 May 2026 15:41:40 +0800
Message-Id: <20260512074142.16356-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_004202_400649_E4207906 
X-CRM114-Status: UNSURE (   5.57  )
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

---
Changes in v4:
    - Fix build warning on 32-bit configurations by using BIT_ULL() for RISCVPT_NC and RISCVPT_IO. 
    - Link to v3:
      https://lore.kernel.org/linux-riscv/20260417140746.97817-1-fangyu.yu@linux.alibaba.com/
---
Changes in v3:
    - Include RISCVPT_NC and RISCVPT_IO in riscvpt_attr_from_entry()
      so iommupt KUnit tests preserve these descriptor bits..
    - Link to v2:
      https://lore.kernel.org/linux-riscv/20260414110212.79526-1-fangyu.yu@linux.alibaba.com
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

 drivers/iommu/generic_pt/fmt/riscv.h | 11 ++++++++++-
 drivers/iommu/riscv/iommu.c          |  2 ++
 include/linux/generic_pt/common.h    |  4 ++++
 3 files changed, 16 insertions(+), 1 deletion(-)

-- 
2.50.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
