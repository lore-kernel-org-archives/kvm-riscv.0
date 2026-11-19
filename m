Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4DB60A5BCA
	for <kvm-riscv@archiver.kernel.org>; Thu, 19 Nov 2026 13:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4lIlxmt7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=v2ZOlWnP5RumfCYZ0NlRnazhITXDXeS4XbZwRj8NEoM=; b=4lIlxmt7kT8BGtebAnsEuwYMX/
	pbtgj4K/ZP8JNfhKC90xt4n8StQkwbclWBoxo61fGo+bv7VdVH+o8o1vg7qm9oExZBJ1U1k6cewMA
	jouqNfle7RIkz+FRUmfJvIA7EvluzFWKe3tut8ec862/C8LA8Qed9PHKVJvuv8+Ku1TzHv80BbaUG
	c6sN+Zr8EEM7L+oCOJYNXxGtU5Sn3eag9MN9Cpei2AXLk5JXnGGe/36+6VR5602YYZJa/UElQ+P3D
	ZIgraXgFTLF2TbbdjpY6VkeOaISwDc7XyU9L8l21NsYyVZv49xijDf4dZycjadEr1OnPVmgYlC9k5
	13RLZXiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU2Ba-0000000C2XS-1wvz;
	Thu, 19 Nov 2026 13:28:22 +0000
Received: from mxhk.zte.com.cn ([160.30.148.34])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU2BU-0000000C2Nf-3vPx;
	Thu, 19 Nov 2026 13:28:18 +0000
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4jVfRb27QCz4yjjW;
	Thu, 19 Nov 2026 21:28:11 +0800 (CST)
Received: from szxl2zmapp06.zte.com.cn ([10.1.32.108])
	by mse-fl2.zte.com.cn with SMTP id 6AJDRv0W070523;
	Thu, 19 Nov 2026 21:27:57 +0800 (+08)
	(envelope-from gong.shuai@sanechips.com.cn)
Received: from ubuntu-35-gs (unknown [10.230.214.35])
	by smtp (Zmail) with SMTP;
	Thu, 19 Nov 2026 21:28:00 +0800
X-Zmail-TransId: 3e816afef95f02f-56564
X-Zmail-LocalSMTP: 1
X-Zmail-RealSender: gong.shuai@sanechips.com.cn
From: Gong Shuai <gong.shuai@sanechips.com.cn>
To: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Tomasz Jeznach <tomasz.jeznach@linux.dev>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Sean Christopherson <seanjc@google.com>,
        Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Fangyu Yu <fangyu.yu@linux.alibaba.com>,
        Tan Chi <tanchi25@mails.ucas.ac.cn>, Wu Fei <wu.fei9@sanechips.com.cn>,
        Zhao Qingye <zhao.qingye@sanechips.com.cn>,
        Gong Shuai <gong.shuai@sanechips.com.cn>
Subject: [RFC PATCH v3 10/10] iommu/riscv: Flush the right address space on bond unlink
Date: Thu, 19 Nov 2026 21:27:44 +0800
Message-ID: <20261119132744.396426-11-gong.shuai@sanechips.com.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261119132744.396426-1-gong.shuai@sanechips.com.cn>
References: <20261119132744.396426-1-gong.shuai@sanechips.com.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ZMAIL-USEORIGINALEMLTOOUTBOUND: 1
X-MAIL: mse-fl2.zte.com.cn 6AJDRv0W070523
X-TLS: YES
X-ENVELOPE-SENDER: gong.shuai@sanechips.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Thu, 19 Nov 2026 21:28:11 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AFEF96B.000/4jVfRb27QCz4yjjW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_052817_147759_E41783C7 
X-CRM114-Status: GOOD (  12.87  )
X-Spam-Score: -1.9 (-)
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
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When the last bond to an IOMMU is removed, the entries cached for the
address space it used must be invalidated. Nested and second-stage bonds
are identified by GSCID, first-stage paging bonds by PSCID.

Signed-off-by: Gong Shuai <gong.shuai@sanechips.com.cn>
---
 drivers/iommu/riscv/iommu.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index e8d894f3e760..a106105bd31b 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -934,6 +934,7 @@ static void riscv_iommu_bond_unlink(struct riscv_iommu_domain *domain,
 	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
 	struct riscv_iommu_bond *bond, *found = NULL;
 	struct riscv_iommu_command cmd;
+	int gscid = 0;
 	int count = 0;
 
 	if (!domain)
@@ -948,18 +949,27 @@ static void riscv_iommu_bond_unlink(struct riscv_iommu_domain *domain,
 		else if (dev_to_iommu(bond->dev) == iommu)
 			count++;
 	}
-	if (found)
+	if (found) {
+		gscid = found->gscid;
 		list_del_rcu(&found->list);
+	}
 	spin_unlock(&domain->lock);
 	kfree_rcu(found, rcu);
 
 	/*
-	 * If this was the last bond between this domain and the IOMMU
-	 * invalidate all cached entries for domain's PSCID.
+	 * If this was the last bond between this domain and the IOMMU,
+	 * invalidate all cached entries for the address space used by that
+	 * bond. Nested and second-stage bonds are identified by GSCID,
+	 * first-stage paging bonds by PSCID.
 	 */
 	if (!count) {
-		riscv_iommu_cmd_inval_vma(&cmd);
-		riscv_iommu_cmd_inval_set_pscid(&cmd, domain->pscid);
+		if (gscid) {
+			riscv_iommu_cmd_inval_gvma(&cmd);
+			riscv_iommu_cmd_inval_set_gscid(&cmd, gscid);
+		} else {
+			riscv_iommu_cmd_inval_vma(&cmd);
+			riscv_iommu_cmd_inval_set_pscid(&cmd, domain->pscid);
+		}
 		riscv_iommu_cmd_send(iommu, &cmd);
 
 		riscv_iommu_cmd_sync(iommu, RISCV_IOMMU_IOTINVAL_TIMEOUT);
-- 
2.53.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
