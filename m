Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28FCB606AA51
	for <kvm-riscv@archiver.kernel.org>; Thu, 19 Nov 2026 13:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oe2hd+yZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qjemxJpQgRLo8J8fmPW653apt51VFUBdevfEx3AVebw=; b=oe2hd+yZGZSQRNAWz1r1n8cryo
	gF/OXE6bdkDVFFFo1RD9owLXtL1On3TCzI2n9z9+jOCwLbRw0UbemHlsrHmOKz3g8fbi/1AHQCmLD
	UXwHR8B/KKg+UVZ0JhOjdrsyni65NKgUt70NyFAloOd6RXxjYrfITQwgBe26evpKDDUVOb3clM3Pw
	fYOQMM5oZO4z+COd76lz6Q9I4q0DwOwWOqiU6H4WYOjkU9rnJFqFSC3B7K4a50FBoX1sPzzGswu2y
	Ffxkx6b2IIf27EjS4OnBO6rn1P5PT6bQU2mFJSK1O4k4aw2v6c/9cLJcOaivf+tdq7xpdNW+LQ1LU
	PKpHg4Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU2Bg-0000000C2eN-2p4u;
	Thu, 19 Nov 2026 13:28:28 +0000
Received: from mxct.zte.com.cn ([183.62.165.209])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU2BU-0000000C2N8-2VzG;
	Thu, 19 Nov 2026 13:28:18 +0000
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4jVfRQ3Cr7z52SGK;
	Thu, 19 Nov 2026 21:28:02 +0800 (CST)
Received: from szxl2zmapp06.zte.com.cn ([10.1.32.108])
	by mse-fl2.zte.com.cn with SMTP id 6AJDRrRi070477;
	Thu, 19 Nov 2026 21:27:53 +0800 (+08)
	(envelope-from gong.shuai@sanechips.com.cn)
Received: from ubuntu-35-gs (unknown [10.230.214.35])
	by smtp (Zmail) with SMTP;
	Thu, 19 Nov 2026 21:27:56 +0800
X-Zmail-TransId: 3e816afef95b02f-564cc
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
Subject: [RFC PATCH v3 05/10] iommu/riscv: Add nested domain allocation
Date: Thu, 19 Nov 2026 21:27:39 +0800
Message-ID: <20261119132744.396426-6-gong.shuai@sanechips.com.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261119132744.396426-1-gong.shuai@sanechips.com.cn>
References: <20261119132744.396426-1-gong.shuai@sanechips.com.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ZMAIL-USEORIGINALEMLTOOUTBOUND: 1
X-MAIL: mse-fl2.zte.com.cn 6AJDRrRi070477
X-TLS: YES
X-ENVELOPE-SENDER: gong.shuai@sanechips.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Thu, 19 Nov 2026 21:28:02 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AFEF962.000/4jVfRQ3Cr7z52SGK
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_052817_005077_0ABC03E9 
X-CRM114-Status: GOOD (  16.04  )
X-Spam-Score: -4.2 (----)
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

A nested domain describes two-stage translation through guest and
host page tables. Iommufd exposes this domain as a nested hwpt.

User space needs to provide the guest stage 1 configuration when
allocating a nested hwpt. Validate the configuration before storing
it for use in a physical device context.

Signed-off-by: Wu Fei <wu.fei9@sanechips.com.cn>
Co-developed-by: Gong Shuai <gong.shuai@sanechips.com.cn>
Signed-off-by: Gong Shuai <gong.shuai@sanechips.com.cn>
---
 drivers/iommu/riscv/iommu.c | 153 ++++++++++++++++++++++++++++++++++++
 1 file changed, 153 insertions(+)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index f2305b953f71..4f8ce579ef08 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -1698,8 +1698,161 @@ static void riscv_viommu_destroy(struct iommufd_viommu *viommu)
 	ida_free(&riscv_iommu_gscids, rv_viommu->gscid);
 }
 
+struct riscv_iommu_nested_domain {
+	struct iommu_domain domain;
+	struct riscv_viommu *viommu;
+
+	u64 tc;
+	u64 ta;
+	u64 iosatp;
+};
+
+#define to_riscv_iommu_nested_domain(domain) \
+	container_of(domain, struct riscv_iommu_nested_domain, domain)
+
+static void riscv_iommu_domain_nested_free(struct iommu_domain *domain)
+{
+	kfree(to_riscv_iommu_nested_domain(domain));
+}
+
+static const struct iommu_domain_ops riscv_iommu_nested_ops = {
+	.free = riscv_iommu_domain_nested_free,
+};
+
+static int riscv_iommu_validate_vdc(struct riscv_iommu_device *iommu,
+				    struct iommu_hwpt_riscv *arg)
+{
+	u64 tc = arg->dc[0];
+	u64 fsc = arg->dc[3];
+	u64 mode;
+
+	if (!(tc & RISCV_IOMMU_DC_TC_V)) {
+		arg->dc[0] = 0;
+		arg->dc[3] = 0;
+		return 0;
+	}
+
+	/*
+	 * Reject reserved/custom bits, the physical IOMMU may treat the
+	 * DC as misconfigured.
+	 */
+	if (tc & ~RISCV_IOMMU_DC_TC_DEFINED)
+		return -EINVAL;
+	if (fsc & ~(RISCV_IOMMU_DC_FSC_PPN | RISCV_IOMMU_DC_FSC_MODE))
+		return -EINVAL;
+
+	/* Process directory tables are not supported now. */
+	if (tc & RISCV_IOMMU_DC_TC_PDTV)
+		return -EOPNOTSUPP;
+
+	/* With PDTV=0 the DPE bit is reserved for future use. */
+	if (tc & RISCV_IOMMU_DC_TC_DPE)
+		return -EINVAL;
+
+	/* Only 64-bit (SXL=0) stage-1 is supported. */
+	if (tc & RISCV_IOMMU_DC_TC_SXL)
+		return -EOPNOTSUPP;
+
+	/* ATS/PRI/T2GPA/PRPR consistency. */
+	if (!(iommu->caps & RISCV_IOMMU_CAPABILITIES_ATS) &&
+	    (tc & (RISCV_IOMMU_DC_TC_EN_ATS | RISCV_IOMMU_DC_TC_EN_PRI |
+		   RISCV_IOMMU_DC_TC_PRPR)))
+		return -EINVAL;
+	if ((tc & RISCV_IOMMU_DC_TC_EN_PRI) &&
+	    !(tc & RISCV_IOMMU_DC_TC_EN_ATS))
+		return -EINVAL;
+	if ((tc & RISCV_IOMMU_DC_TC_PRPR) &&
+	    !(tc & RISCV_IOMMU_DC_TC_EN_PRI))
+		return -EINVAL;
+	if ((tc & RISCV_IOMMU_DC_TC_T2GPA) &&
+	    (!(iommu->caps & RISCV_IOMMU_CAPABILITIES_T2GPA) ||
+	     !(tc & RISCV_IOMMU_DC_TC_EN_ATS)))
+		return -EINVAL;
+
+	/*
+	 * A/D update behavior on stage-2 PTEs is owned by the host,
+	 * decide it's value from the AMO_HWAD capability.
+	 */
+	tc &= ~RISCV_IOMMU_DC_TC_GADE;
+	if (iommu->caps & RISCV_IOMMU_CAPABILITIES_AMO_HWAD)
+		tc |= RISCV_IOMMU_DC_TC_GADE;
+
+	/*
+	 * A/D update behavior on stage-1 PTEs is owned by the guest but
+	 * needs AMO_HWAD support.
+	 */
+	if ((tc & RISCV_IOMMU_DC_TC_SADE) &&
+	    !(iommu->caps & RISCV_IOMMU_CAPABILITIES_AMO_HWAD))
+		return -EOPNOTSUPP;
+
+	/* SBE must match the IOMMU byte order unless END is supported. */
+	if (!(iommu->caps & RISCV_IOMMU_CAPABILITIES_END) &&
+	    (!!(tc & RISCV_IOMMU_DC_TC_SBE) !=
+	     !!(iommu->fctl & RISCV_IOMMU_FCTL_BE)))
+		return -EINVAL;
+
+	/* Validate the stage-1 mode. */
+	mode = FIELD_GET(RISCV_IOMMU_DC_FSC_MODE, fsc);
+	if (mode == RISCV_IOMMU_DC_FSC_MODE_BARE) {
+		/* No stage-1 translation, root pointer is unused. */
+		fsc = 0;
+	} else {
+		switch (mode) {
+		case RISCV_IOMMU_DC_FSC_IOSATP_MODE_SV39:
+		case RISCV_IOMMU_DC_FSC_IOSATP_MODE_SV48:
+		case RISCV_IOMMU_DC_FSC_IOSATP_MODE_SV57:
+			break;
+		default:
+			return -EINVAL;
+		}
+		if (!riscv_iommu_fsc_supported(iommu, mode))
+			return -EOPNOTSUPP;
+	}
+
+	arg->dc[0] = tc;
+	arg->dc[3] = fsc;
+
+	return 0;
+}
+
+static struct iommu_domain *
+riscv_viommu_alloc_domain_nested(struct iommufd_viommu *viommu, u32 flags,
+				 const struct iommu_user_data *user_data)
+{
+	struct riscv_viommu *rv_viommu = container_of(viommu, struct riscv_viommu, core);
+	struct riscv_iommu_nested_domain *nested_domain;
+	struct iommu_hwpt_riscv arg;
+	int ret;
+
+	if (flags)
+		return ERR_PTR(-EOPNOTSUPP);
+
+	ret = iommu_copy_struct_from_user(&arg, user_data,
+					  IOMMU_HWPT_DATA_RISCV_S1, dc);
+	if (ret)
+		return ERR_PTR(ret);
+
+	ret = riscv_iommu_validate_vdc(rv_viommu->iommu, &arg);
+	if (ret)
+		return ERR_PTR(ret);
+
+	nested_domain = kzalloc_obj(*nested_domain, GFP_KERNEL_ACCOUNT);
+	if (!nested_domain)
+		return ERR_PTR(-ENOMEM);
+
+	nested_domain->domain.type = IOMMU_DOMAIN_NESTED;
+	nested_domain->domain.ops = &riscv_iommu_nested_ops;
+	nested_domain->viommu = rv_viommu;
+	nested_domain->tc = arg.dc[0];
+	nested_domain->ta = arg.dc[2] & RISCV_IOMMU_DC_TA_PSCID;
+	nested_domain->iosatp = arg.dc[3];
+
+	return &nested_domain->domain;
+}
+
 static const struct iommufd_viommu_ops riscv_viommu_ops = {
 	.destroy = riscv_viommu_destroy,
+	.alloc_domain_nested = riscv_viommu_alloc_domain_nested,
 };
 
 static size_t riscv_iommu_get_viommu_size(struct device *dev,
-- 
2.53.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
