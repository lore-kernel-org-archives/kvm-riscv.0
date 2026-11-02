Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4942A606A324
	for <kvm-riscv@archiver.kernel.org>; Mon,  2 Nov 2026 09:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Jhpakzw0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=46rv5PVjT6DrA1hYtGQIespX2gfMSnwSeoGWSICstOY=; b=Jhpakzw0Be40Q70n+BwQxPVaBL
	htciy8qT9HTEB8e7t1d018+eYOvj0iOjYmcAei6qsF7EM7OoapqOONIoRi14zHNJixUE91iWcz1Yi
	6/uO3WZdOz0emt/kIFQ4OOlIKA9AAOZMO9JFb2Bk0Zml6iJ2Mazrqk7FJu+TOGXL7v1Yq+dl5cYlh
	uq+i8YI1KYESzsnv2kLkO4Rdsp2BMcaDnDvWzT+N6cNrO/KtQ+n1+dWsJgJ1IUSAZatCD0CyxA87G
	3DLLZePELRv5BgkoB/We1S6oWQoKO5zp4JXf8+CLjBcMaDSKXUCWJklVD5D/Nn0K9q3CoRABZjtkh
	mJkjS05w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNoC1-0000000Fyi7-42i1;
	Mon, 02 Nov 2026 09:19:05 +0000
Received: from mxhk.zte.com.cn ([160.30.148.35])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNoBy-0000000FygR-3kMH;
	Mon, 02 Nov 2026 09:19:04 +0000
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4jJ5jh6ZLjz8Xrrl;
	Mon, 02 Nov 2026 17:18:48 +0800 (CST)
Received: from szxl2zmapp06.zte.com.cn ([10.1.32.108])
	by mse-fl2.zte.com.cn with SMTP id 6A29Ic4i018555;
	Mon, 2 Nov 2026 17:18:38 +0800 (+08)
	(envelope-from gong.shuai@sanechips.com.cn)
Received: from ubuntu-35-gs (unknown [10.230.214.35])
	by smtp (Zmail) with SMTP;
	Mon, 2 Nov 2026 17:18:40 +0800
X-Zmail-TransId: 3e816ae85560029-030da
X-Zmail-LocalSMTP: 1
X-Zmail-RealSender: gong.shuai@sanechips.com.cn
From: Gong Shuai <gong.shuai@sanechips.com.cn>
To: fangyu.yu@linux.alibaba.com
Cc: alex@ghiti.fr, andrew.jones@linux.dev, anup@brainfault.org,
        aou@eecs.berkeley.edu, atish.patra@linux.dev, baolu.lu@linux.intel.com,
        gong.shuai@sanechips.com.cn, guoren@kernel.org, iommu@lists.linux.dev,
        jgg@nvidia.com, jgg@ziepe.ca, joerg.roedel@amd.com, joro@8bytes.org,
        jroedel@suse.de, kevin.tian@intel.com, kvm-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        nutty.liu@hotmail.com, palmer@dabbelt.com, pjw@kernel.org,
        robin.murphy@arm.com, skhawaja@google.com, tanchi25@mails.ucas.ac.cn,
        tomasz.jeznach@linux.dev, vasant.hegde@amd.com, will@kernel.org,
        zong.li@sifive.com
Subject: Re: [PATCH v6 09/10] iommu/riscv: Add dirty tracking support for second-stage domains
Date: Mon,  2 Nov 2026 17:18:23 +0800
Message-ID: <20261102091823.54287-1-gong.shuai@sanechips.com.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261031083014.15040-10-fangyu.yu@linux.alibaba.com>
References: <20261031083014.15040-10-fangyu.yu@linux.alibaba.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ZMAIL-USEORIGINALEMLTOOUTBOUND: 1
X-MAIL: mse-fl2.zte.com.cn 6A29Ic4i018555
X-TLS: YES
X-ENVELOPE-SENDER: gong.shuai@sanechips.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Mon, 02 Nov 2026 17:18:48 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AE85578.000/4jJ5jh6ZLjz8Xrrl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_011903_264583_8C016595 
X-CRM114-Status: GOOD (  13.41  )
X-Spam-Score: -2.9 (--)
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

Hi Fangyu,

>From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
>
>Add hardware dirty tracking support for second-stage (iohgatp) domains
>used in KVM VFIO device pass-through.
>
>The RISC-V IOMMU can automatically set the dirty bit in PTEs on write
>access when DC.tc.GADE is set and the hardware has AMO_HWAD capability.
>Wire this up to the iommufd dirty tracking interface:
>
>  - riscv_iommu_set_dirty_tracking(): Always enabled dirty tracking for
>    second-stage domain.
>
>  - riscv_iommu_dirty_ops: Exposes set_dirty_tracking and the generic
>    page-table read_and_clear_dirty via IOMMU_PT_DIRTY_OPS(riscv_64).
>
>  - domain_alloc_paging_flags: Assigns dirty_ops to second-stage domains
>    when AMO_HWAD is advertised in hardware capabilities.
>
>  - riscv_iommu_capable: Reports IOMMU_CAP_DIRTY_TRACKING when
>    AMO_HWAD is present.
>
>Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
>Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>
>---
> drivers/iommu/riscv/iommu.c | 22 ++++++++++++++++++++++
> 1 file changed, 22 insertions(+)
>
>diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
>index fc7a80393833..9f572baeca74 100644
>--- a/drivers/iommu/riscv/iommu.c
>+++ b/drivers/iommu/riscv/iommu.c
>@@ -1377,6 +1377,21 @@ static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
> 	return 0;
> }
> 
>+static int riscv_iommu_set_dirty_tracking(struct iommu_domain *iommu_domain,
>+					  bool enable)
>+{
>+	/*
>+	 * Always enabled and the dirty bitmap is cleared prior to
>+	 * set_dirty_tracking().
>+	 */
>+	return 0;
>+}
>+
>+static const struct iommu_dirty_ops riscv_iommu_dirty_ops = {
>+	IOMMU_PT_DIRTY_OPS(riscv_64),
>+	.set_dirty_tracking = riscv_iommu_set_dirty_tracking,
>+};
>+
> static const struct iommu_domain_ops riscv_iommu_paging_domain_ops = {
> 	IOMMU_PT_DOMAIN_OPS(riscv_64),
> 	.attach_dev = riscv_iommu_attach_paging_domain,
>@@ -1439,6 +1454,9 @@ static int riscv_iommu_init_domain_s2(struct device *dev,
> 	if (domain->gscid < 0)
> 		return -ENOMEM;
> 
>+	if (iommu->caps & RISCV_IOMMU_CAPABILITIES_AMO_HWAD)
>+		domain->domain.dirty_ops = &riscv_iommu_dirty_ops;

This sets dirty_ops based on whether the allocating device's IOMMU
supports AMO_HWAD. As I understand it, the domain/HWPT is not tied
to that IOMMU instance. A later attach may target a device behind
another instance without AMO_HWAD, and the attach can still succeed
with GADE disabled, potentially causing guest page faults.

Shouldn't we therefore revalidate AMO_HWAD cap for domains with
dirty_ops and reject this combination?

FYI, both AMD and Intel have attach-time dirty-tracking checks. See
drivers/iommu/intel/iommu.c:3195 and drivers/iommu/amd/iommu.c:3221.

Thanks,
Shuai

>+
> 	return 0;
> }
> 
>@@ -1559,9 +1577,13 @@ static struct iommu_group *riscv_iommu_device_group(struct device *dev)
> 
> static bool riscv_iommu_capable(struct device *dev, enum iommu_cap cap)
> {
>+	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
>+
> 	switch (cap) {
> 	case IOMMU_CAP_CACHE_COHERENCY:
> 		return dev_is_dma_coherent(dev);
>+	case IOMMU_CAP_DIRTY_TRACKING:
>+		return !!(iommu->caps & RISCV_IOMMU_CAPABILITIES_AMO_HWAD);
> 	default:
> 		return false;
> 	}
>-- 
>2.50.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
