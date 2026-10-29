Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70AB606A323
	for <kvm-riscv@archiver.kernel.org>; Thu, 29 Oct 2026 06:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xd0czleK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=N8ZQLg04ZS2RaGJrpoE99s+RAvKlG5hXGGLIYk3OsCo=; b=xd0czleKDh6qhAgyKylQ2MKXEQ
	h9gLUfamuP9wJgm44KqQAH5Fb2NtrxjbdqIKvI+B4cEE76U8FionMkl7dX4y8jL2az4BDFYVjpFzl
	NJXhhUJuIR0ulD9j5oRRvZIsO+yvyyrYLijMT23SiQDQ63OK+3co62fvD+GPOAA9Q6lGshIN0hj4S
	z6adP2LdLNVuhy0vAH1BJJf7WXNFG0883iXB5j66jLhBzUbgVJFPSWoq5IROiBLyVqWOU14O3chIn
	tu5pCl4n61tX/Ox9yuyq1aGKsfuNzjBXuCeXf5OSgwJvr99W4njMUmVJbrmSWADzMn402Js2j6hyI
	Vet9waVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMJMu-00000008Rbh-2SS4;
	Thu, 29 Oct 2026 06:12:08 +0000
Received: from mxhk.zte.com.cn ([160.30.148.35])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMJMf-00000008RLY-2hVt;
	Thu, 29 Oct 2026 06:11:55 +0000
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4jFYll4fMvz8XrrZ;
	Thu, 29 Oct 2026 14:11:47 +0800 (CST)
Received: from szxl2zmapp06.zte.com.cn ([10.1.32.108])
	by mse-fl2.zte.com.cn with SMTP id 69T6BdP8044561;
	Thu, 29 Oct 2026 14:11:39 +0800 (+08)
	(envelope-from gong.shuai@sanechips.com.cn)
Received: from ubuntu-35-gs (unknown [10.230.214.35])
	by smtp (Zmail) with SMTP;
	Thu, 29 Oct 2026 14:11:41 +0800
X-Zmail-TransId: 3e816ae2e39c027-e7d9b
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
        Wu Fei <wu.fei9@sanechips.com.cn>,
        Zhao Qingye <zhao.qingye@sanechips.com.cn>,
        Gong Shuai <gong.shuai@sanechips.com.cn>,
        Gong Shuai <gsh517025@gmail.com>
Subject: [RFC PATCH v2 9/9] iommu/riscv: Add riscv_iommu_attach_dev_nested
Date: Thu, 29 Oct 2026 14:11:31 +0800
Message-ID: <20261029061131.584453-10-gong.shuai@sanechips.com.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261029061131.584453-1-gong.shuai@sanechips.com.cn>
References: <20261029061131.584453-1-gong.shuai@sanechips.com.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ZMAIL-USEORIGINALEMLTOOUTBOUND: 1
X-MAIL: mse-fl2.zte.com.cn 69T6BdP8044561
X-TLS: YES
X-ENVELOPE-SENDER: gong.shuai@sanechips.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Thu, 29 Oct 2026 14:11:47 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AE2E3A3.002/4jFYll4fMvz8XrrZ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_231153_887627_A9D0EB20 
X-CRM114-Status: GOOD (  10.83  )
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

From: Wu Fei <wu.fei9@sanechips.com.cn>

Attach a device to a nested domain by combining the guest provided
stage 1 context with the host-owned stage 2 context in the device
directory entry. This allows the physical IOMMU to translate device
DMA through both stages.

The device is bonded to the stage 2 parent domain so that it shares
the parent's invalidation state.

Signed-off-by: Wu Fei <wu.fei9@sanechips.com.cn>
Co-developed-by: Gong Shuai <gong.shuai@sanechips.com.cn>
Signed-off-by: Gong Shuai <gong.shuai@sanechips.com.cn>
---
 drivers/iommu/riscv/iommu.c | 41 +++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 44fab79110ac..a103c0465e62 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -1673,12 +1673,53 @@ struct riscv_iommu_nested_domain {
 #define to_riscv_iommu_nested_domain(domain) \
 	container_of(domain, struct riscv_iommu_nested_domain, domain)
 
+static int riscv_iommu_attach_dev_nested(struct iommu_domain *domain,
+					 struct device *dev,
+					 struct iommu_domain *old_domain)
+{
+	struct riscv_iommu_nested_domain *nested_domain =
+		to_riscv_iommu_nested_domain(domain);
+	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
+	struct riscv_iommu_domain *s2_parent = nested_domain->viommu->s2_parent;
+	struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
+	struct pt_iommu_riscv_64_hw_info pt_info;
+	struct riscv_iommu_dc dc = {0};
+
+	if (nested_domain->viommu->iommu != iommu)
+		return -EINVAL;
+
+	if (!s2_parent->nest_parent)
+		return -EINVAL;
+
+	pt_iommu_riscv_64_hw_info(&s2_parent->riscvpt, &pt_info);
+
+	dc.tc = nested_domain->tc;
+	dc.fsc = nested_domain->iosatp;
+
+	dc.iohgatp = FIELD_PREP(RISCV_IOMMU_DC_IOHGATP_MODE, pt_info.iohgatp_mode) |
+		     FIELD_PREP(RISCV_IOMMU_DC_IOHGATP_PPN, pt_info.ppn) |
+		     FIELD_PREP(RISCV_IOMMU_DC_IOHGATP_GSCID, s2_parent->gscid);
+
+	/* SVA/PASID are not supported now, keep PSCID at 0. */
+	dc.ta = FIELD_PREP(RISCV_IOMMU_DC_TA_PSCID, 0);
+
+	if (riscv_iommu_bond_link(s2_parent, dev))
+		return -ENOMEM;
+
+	riscv_iommu_iodir_update(iommu, dev, &dc);
+	riscv_iommu_bond_unlink(info->domain, dev);
+	info->domain = s2_parent;
+
+	return 0;
+}
+
 static void riscv_iommu_domain_nested_free(struct iommu_domain *domain)
 {
 	kfree(to_riscv_iommu_nested_domain(domain));
 }
 
 static const struct iommu_domain_ops riscv_iommu_nested_ops = {
+	.attach_dev = riscv_iommu_attach_dev_nested,
 	.free = riscv_iommu_domain_nested_free,
 };
 
-- 
2.53.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
