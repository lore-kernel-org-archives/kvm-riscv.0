Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03A4606D829
	for <kvm-riscv@archiver.kernel.org>; Tue,  3 Nov 2026 12:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NcOZ0uUN;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=PwoQat0r
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Ax/CS2Kch8xEErTxhhkLruI0KL9rFtWjVsdWb0zW+TQ=; b=NcOZ0uUNcCuDErPXOiiNnp0Cxg
	5nGKbRLxki4skyoOfNfd2yVp/9unMJlu4RGZJEm/3qkp8MJbNAdHhD9ezDTldbmEb9MJWAInnVwq8
	Ywy5CGCJ9qO1Cl5zyP5+S+cLgqR8VjrktQRmsltWMerCQ43QbVIdJE1TxPdlOD0ywHlMfhafYxFYa
	jT93oTpoaydwYiJtgZ9jukPpWWCNunAguAforTxa67Vep2nk5JaJZ57IGcrXGhqzfp39RUi7Z4COV
	zrpwnH2QSAFwxCxgnqOP0fgIR2+Qmaky6T3B0zBovceikrCReDbIi488Wch3pA8oM0KWfD+FtrlhJ
	C9SX6YsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xODEg-00000002JPD-2mk1;
	Tue, 03 Nov 2026 12:03:30 +0000
Received: from out30-119.freemail.mail.aliyun.com ([115.124.30.119])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xODEa-00000002JE5-03ri;
	Tue, 03 Nov 2026 12:03:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793707401; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=NOxToOaRCWHOshJgMcU31n+bkp0++VjZYWL+rK/hMio=;
	b=PwoQat0rStQKNniXm2CLGOpw/39cEiOdRNQClpTmPwSoSIewwVcxfqwI5DdAYMzEGDSIHdgwJoSap3iNUYAVzNJDr9Yrm/1Z1XJEL8SHPqOVgn658/FyUEHvwhnfeeuZl7C1DMvC+d148A+0roZS+CX8iiJtzxDVsVL5MgUTa80=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R861e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=29;SR=0;TI=SMTPD_---0XE2qH0l_1793707398;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0XE2qH0l_1793707398 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 03 Nov 2026 20:03:19 +0800
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
	andrew.jones@linux.dev,
	anup@brainfault.org,
	jgg@nvidia.com,
	jgg@ziepe.ca,
	kevin.tian@intel.com,
	atish.patra@linux.dev,
	skhawaja@google.com,
	vasant.hegde@amd.com,
	joerg.roedel@amd.com,
	tanchi25@mails.ucas.ac.cn,
	gong.shuai@sanechips.com.cn
Cc: fangyu.yu@linux.alibaba.com,
	guoren@kernel.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	Nutty Liu <nutty.liu@hotmail.com>
Subject: [PATCH v7 10/10] iommu/riscv: Add IOTINVAL.GVMA invalidations
Date: Tue,  3 Nov 2026 20:02:36 +0800
Message-Id: <20261103120236.53474-11-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20261103120236.53474-1-fangyu.yu@linux.alibaba.com>
References: <20261103120236.53474-1-fangyu.yu@linux.alibaba.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_040324_869641_BB93113E 
X-CRM114-Status: UNSURE (   7.42  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -17.6 (-----------------)
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Fangyu Yu <fangyu.yu@linux.alibaba.com>

Previously, only IOTINVAL.VMA was issued, which is insufficient for
second-stage address translation consistency.

Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>
---
 drivers/iommu/riscv/iommu.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index ff1043afe973..8c15710d60b6 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -831,6 +831,15 @@ static int riscv_iommu_iodir_set_mode(struct riscv_iommu_device *iommu,
 	riscv_iommu_cmd_inval_vma(&cmd);
 	riscv_iommu_cmd_send(iommu, &cmd);
 
+	/*
+	 * Per the RISC-V IOMMU spec (sec. 5.5), the IOMMU may retain
+	 * cached translations across mode switches. IOTINVAL.VMA only
+	 * covers first-stage leaf PTEs, so use a global IOTINVAL.GVMA
+	 * to flush stale second-stage translations.
+	 */
+	riscv_iommu_cmd_inval_gvma(&cmd);
+	riscv_iommu_cmd_send(iommu, &cmd);
+
 	/* IOFENCE.C */
 	riscv_iommu_cmd_sync(iommu, RISCV_IOMMU_IOTINVAL_TIMEOUT);
 
@@ -1176,12 +1185,15 @@ static void riscv_iommu_iodir_iotinval(struct riscv_iommu_device *iommu,
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
