Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06D62F436AC
	for <kvm-riscv@archiver.kernel.org>; Fri, 17 Apr 2026 14:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DGUmJsg3LBKnW4d+jQh1duWCNo5e7qhlKuLRI7/P10g=; b=FGZilVB5gsJFs7
	YmB3d82tdj/Y8/GKadoXf/Kfw7wL6FrOPHRO32eTPLuSPhvQ8SjKBZ+6eaZYwTw0JIYXY69ppsDRL
	GY0isl4ttWBTzshK92AdBp0jzfKQkxrCUbL/5rEd4PE6w8Syi5cXUQwGvVGC7cBt25zH0AibEIAk9
	F3pjG//nddKPxrSy3DCrASQZWcq+uMrSFw8tL//Fa3YGvLhXpskTYzzzRmnWl1VErmN+twyv+AjcG
	wpZpvrj/EtdJD+Z0uO2IspV99eKAwZHxZyOmrG4al/7ijeRALoo7moVTaCBvAWJ6QXnZeLpUP4mwb
	hkj1fMmjYOSMJaY+8SKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDjrp-000000046sO-3GPB;
	Fri, 17 Apr 2026 14:08:21 +0000
Received: from out30-97.freemail.mail.aliyun.com ([115.124.30.97])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDjrk-000000046ok-37hT;
	Fri, 17 Apr 2026 14:08:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1776434886; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=JxadIha1lW8Xw4rX95A+w2xRIU9Sj1dceq09MZ3+JCA=;
	b=Sa9q6TWManWmM+o9ui8n6cil8TlyMwX/S11+y/H+Fz11lcODaE6+xVMMkOpYJdE1ZIScAuEaVPsT5586YDro+seghMBAMyAhyomIlto1X7Q18UprkWkX6AbVlF+FtKbGOLUcfWXlCUbGoB5VNQ8Uq7MXvJhouKrRCJJiMzOYv5A=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R171e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=21;SR=0;TI=SMTPD_---0X1BSP8P_1776434881;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0X1BSP8P_1776434881 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 17 Apr 2026 22:08:03 +0800
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
Subject: [PATCH v3 0/2] iommu/riscv: Support Svpbmt memory types in generic_pt
Date: Fri, 17 Apr 2026 22:07:44 +0800
Message-Id: <20260417140746.97817-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_070817_563325_0CD5F593 
X-CRM114-Status: UNSURE (   4.43  )
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
Changes in v3:
    - Include RISCVPT_NC and RISCVPT_IO in riscvpt_attr_from_entry()
      to keep iommupt KUnit tests in sync.
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
