Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F217606A32F
	for <kvm-riscv@archiver.kernel.org>; Sat, 31 Oct 2026 08:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1hXkatab;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=Fgf1Ut1M
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=o9VArjuVNWSybT9AzQgXSkytYHeFI3W5noHCYVr0M78=; b=1hXkatabp3zGEgvOJlZFiQipgx
	d5G6hUFvbMGQoe224iIS/icT27z5m6yWAq6bD36drNkiyRqzLwLjtdV2nJsNkabeEEe4gR4ISnLDz
	XaZMjfRfw8zuhPgT+jw2Czr5cul8/Rdog9beyxtI97y7lCpsJ33hGJH9Uv5JW7OOBC65LQcV48Hrd
	C4ArwFkx/pMxcrEsu6yxS7pAqz5NYShwLj5Z/o+e2/XNINoY55VsMLRuW7Bb3Y53JFKDtUoDNbTV+
	Z5ss0kaaFACwNFgij0dtXZHK0Io+Q9Rp4Zna1qdXdu6LNdtgyJACcatKUPuKGw829MGgF5ZppL31C
	XAnPSGMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN4UH-0000000D3tS-2rHN;
	Sat, 31 Oct 2026 08:30:53 +0000
Received: from out30-113.freemail.mail.aliyun.com ([115.124.30.113])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN4U4-0000000D3au-2wYV;
	Sat, 31 Oct 2026 08:30:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793435437; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=11EZsZQc/6GCS8JBX6hOIFtCcJazynSKhMoTlW4DEkk=;
	b=Fgf1Ut1M55KuTVDf6TpnEqUbAfHX+vA9opzTWJBniyV7KFaraMzpObO6BoKNKmvVn1ZZQna6Sql1HySydL9w4eploM4+3VQyNSega74z8GxOYuEDTIWn4P+Kxjztreyn0lW7b5SMAzXyIJWhuhcS2Xi+CaQqbVdXAtPAOBwpR28=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R161e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=29;SR=0;TI=SMTPD_---0XDo-2nW_1793435433;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0XDo-2nW_1793435433 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sat, 31 Oct 2026 16:30:34 +0800
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
Subject: [PATCH v6 08/10] iommu/riscv: Pre-enable GADE for second-stage domains
Date: Sat, 31 Oct 2026 16:30:12 +0800
Message-Id: <20261031083014.15040-9-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20261031083014.15040-1-fangyu.yu@linux.alibaba.com>
References: <20261031083014.15040-1-fangyu.yu@linux.alibaba.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_013040_912176_98E25740 
X-CRM114-Status: UNSURE (   8.04  )
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
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	T_SPF_TEMPERROR,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Fangyu Yu <fangyu.yu@linux.alibaba.com>

Pre-enable RISCV_IOMMU_DC_TC_GADE in the device context when
attaching a second-stage domain, if the IOMMU supports AMO_HWAD.

Software pre-populates second-stage page tables with D set, so
enabling GADE by default does not change normal behavior. When
dirty tracking is enabled, iommufd clears the pre-set D bits and
GADE becomes necessary for hardware to update the dirty bit on
write access.

This avoids toggling GADE dynamically and keeps device context
setup consistent with second-stage domain attachment.

Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>
---
 drivers/iommu/riscv/iommu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 082f55c44d20..fc7a80393833 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -1237,6 +1237,8 @@ static void riscv_iommu_iodir_update(struct riscv_iommu_device *iommu,
 	for (i = 0; i < fwspec->num_ids; i++) {
 		dc = riscv_iommu_get_dc(iommu, fwspec->ids[i]);
 		tc = READ_ONCE(dc->tc);
+		tc &= ~RISCV_IOMMU_DC_TC_GADE;
+		tc |= new_dc->tc & RISCV_IOMMU_DC_TC_GADE;
 		tc |= new_dc->ta & RISCV_IOMMU_DC_TC_V;
 
 		WRITE_ONCE(dc->fsc, new_dc->fsc);
@@ -1353,6 +1355,8 @@ static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
 			FIELD_PREP(RISCV_IOMMU_DC_IOHGATP_MODE, pt_info.iohgatp_mode) |
 			FIELD_PREP(RISCV_IOMMU_DC_IOHGATP_GSCID, domain->gscid) |
 			FIELD_PREP(RISCV_IOMMU_DC_IOHGATP_PPN, pt_info.ppn);
+		if (iommu->caps & RISCV_IOMMU_CAPABILITIES_AMO_HWAD)
+			dc.tc |= RISCV_IOMMU_DC_TC_GADE;
 	} else {
 		if (!riscv_iommu_fsc_supported(iommu, pt_info.fsc_iosatp_mode))
 			return -ENODEV;
-- 
2.50.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
