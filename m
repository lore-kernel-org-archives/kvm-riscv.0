Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DCFAC982CC
	for <kvm-riscv@archiver.kernel.org>; Thu, 17 Sep 2026 02:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EzMXICDrCEpA0oFcRDfg+mt8nRIH5cfXcX0j7Uk0RbY=; b=wJJsP9iAGbixAz
	+CnPehTW56z8wdeHASeCdJvLQ55NKb5EzengypH5U8zNrUSYY1odKhXgcNPWTb9Jgp1aA8Ej4T9eU
	xCGnmvVy1L9HRpKOwx42Bhk2qFC2OGkab8cFLsf7TLH5brisfV+B2arHh2Hf3/mR15YU4aYdjRSx4
	4uRtdJ/T1zyv6Bd4Lu6Hg0op1Io3S+hYEMQ3tyGZNx5izg+cdk5rmlxicdOVvSvqyvOPaYfXpfcXp
	WMn94+Uz/gAtOb6ECZGzrGgsX4HVmKtfs4NW5lsWiWyCMmU6b8EpQ2d9UqH034cIj0P6pl5mB/ooM
	Ix/lNGj52KyMT8RvAM8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x72IG-0000000AV3D-0pBU;
	Thu, 17 Sep 2026 02:56:12 +0000
Received: from out30-100.freemail.mail.aliyun.com ([115.124.30.100])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x72ID-0000000AV2V-1M0z;
	Thu, 17 Sep 2026 02:56:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1789613765; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=/Y6Uh+LvQ8rP9w60VuF19J58tyBySgKuwMUmFXQ+Wl4=;
	b=OhVB0CubxpRG0Y2QQbwTMPsB0Odqwur3OCA/XBo3iCb7Ar81Z02dkCC1x2CIJNW2A7Xmg7FpmMIyf/FkjLeFRid+Db4rc175hgbLSmqveYtfU0Dln9cWvmpAKJ7lR+NesXiSI9AU4TYXmvMa7Ut/HYK3icWgv0suMNGpS8UPKXc=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R291e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=27;SR=0;TI=SMTPD_---0XB6NTcz_1789613759;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0XB6NTcz_1789613759 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 17 Sep 2026 10:56:02 +0800
From: fangyu.yu@linux.alibaba.com
To: tomasz.jeznach@linux.dev,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	baolu.lu@linux.intel.com,
	jroedel@suse.de,
	zong.li@sifive.com,
	andrew.jones@oss.qualcomm.com,
	anup@brainfault.org,
	jgg@nvidia.com,
	jgg@ziepe.ca,
	kevin.tian@intel.com,
	atish.patra@linux.dev,
	skhawaja@google.com,
	vasant.hegde@amd.com,
	gsh517025@gmail.com,
	joerg.roedel@amd.com
Cc: fangyu.yu@linux.alibaba.com,
	guoren@kernel.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org
Subject: [RFC PATCH v4 10/10] iommu/riscv: Add IOTINVAL.GVMA after updating DDT/PDT entries
Date: Thu, 17 Sep 2026 10:54:46 +0800
Message-Id: <20260917025446.4070-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20260915032828.11250-1-fangyu.yu@linux.alibaba.com>
References: <20260915032828.11250-1-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_195609_655635_B0CA2160 
X-CRM114-Status: UNSURE (   7.16  )
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

Previously, only IOTINVAL.VMA was issued, which is insufficient for
second-stage address translation consistency.

Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
---
 drivers/iommu/riscv/iommu.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 41b593def1f5..e848a7f97771 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -1153,12 +1153,15 @@ static void riscv_iommu_iodir_iotinval(struct riscv_iommu_device *iommu,
 		/*
 		 * else: IOTINVAL.VMA with GV=1,AV=PSCV=0,and
 		 * GSCID=DC.iohgatp.GSCID
-		 *
+		 */
+		riscv_iommu_cmd_send(iommu, &cmd);
+		/*
 		 * IOTINVAL.GVMA with GV=1,AV=0,and
 		 * GSCID=DC.iohgatp.GSCID
-		 * TODO: For now, the Second-Stage feature have not yet been merged,
-		 * also issue IOTINVAL.GVMA once second-stage support is merged.
 		 */
+		riscv_iommu_cmd_inval_gvma(&cmd);
+		riscv_iommu_cmd_inval_set_gscid(&cmd,
+			FIELD_GET(RISCV_IOMMU_DC_IOHGATP_GSCID, iohgatp));
 	}
 	riscv_iommu_cmd_send(iommu, &cmd);
 }
-- 
2.50.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
