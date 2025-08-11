Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F029C87FDA
	for <kvm-riscv@archiver.kernel.org>; Mon, 11 Aug 2025 06:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+vfbWeBKrQ51DHw1QKjjtOBPEqyITNRRnerjF4BVVZg=; b=bbTzg93RlEUIPo
	kw5o1FClsgPWGftHy4PPApqvhK1Xzqr+BUMobX2jhpetdYFCEuPHZcIJLWbvhY877ZahYD0llovmK
	3QofXGIK4SsmUfVx3Z2q8PCnk2DcLAr3mzU8eBj3uFuA9d7IJ4ZaZoLc1bJU/xl9I+4uNg3j5OjVr
	+60TBEwKYw329JsmF4ryNSbWgV9EoIMyeuqjS7fGatDxYG2T0MJxwTaY8DPV2a4UmVWcAjmOU0z/C
	JkXhP/MAuIvU/o5mZK6JeQxn+xM+/biZZlVDZoyhcOI11hj9GVprBf9GyGo1GxQeDdPlQb+t29SK3
	i6y4PW82UOOQWspJVq0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulLkf-00000006ZJr-0v6q;
	Mon, 11 Aug 2025 06:11:21 +0000
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulLkd-00000006ZIY-0oyI;
	Mon, 11 Aug 2025 06:11:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1754892674; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=DZN23X/8T7TOOtz+3clkVBeibPzLGB2AE7hvZ+c8lTI=;
	b=RQMCiWazZkjRBfkrm4R5mnNG0eILoX1oCYhn/IzXEVnwH5ABGgbmWYo7pu6pC4ojelT+9b/4xBQvC+eJ1MusVbKD4qMX3EFpruF+LfiVRZipdoSJ2QL1eqz/1urCrM08X7CvZWlk/2HZHBClfVn19bKKYUaJs8sXzSNvaXvGhDM=
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0WlP-v89_1754892670 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 11 Aug 2025 14:11:11 +0800
From: fangyu.yu@linux.alibaba.com
To: anup@brainfault.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	atishp@atishpatra.org,
	tjeznach@rivosinc.com,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	sunilvl@ventanamicro.com,
	rafael.j.wysocki@intel.com,
	tglx@linutronix.de,
	ajones@ventanamicro.com
Cc: guoren@linux.alibaba.com,
	guoren@kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev,
	Fangyu Yu <fangyu.yu@linux.alibaba.com>
Subject: [RFC PATCH 1/6] RISC-V: Add more elements to irqbypass vcpu_info
Date: Mon, 11 Aug 2025 14:10:59 +0800
Message-Id: <20250811061104.10326-2-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250811061104.10326-1-fangyu.yu@linux.alibaba.com>
References: <20250811061104.10326-1-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_231119_688065_C96043B3 
X-CRM114-Status: UNSURE (   6.25  )
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

To support MRIF mode, we need to add more elements to
let the iommu driver get the ppn of MRIF.

Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
---
 arch/riscv/include/asm/irq.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/include/asm/irq.h b/arch/riscv/include/asm/irq.h
index 8588667cbb5f..6293ac00e051 100644
--- a/arch/riscv/include/asm/irq.h
+++ b/arch/riscv/include/asm/irq.h
@@ -30,6 +30,9 @@ struct riscv_iommu_vcpu_info {
 	u32 group_index_shift;
 	u64 gpa;
 	u64 hpa;
+	u32 host_irq;
+	bool mrif;
+	struct msi_msg *host_msg;
 };
 
 #ifdef CONFIG_ACPI
-- 
2.49.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
