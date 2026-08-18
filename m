Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BED21C5DF7D
	for <kvm-riscv@archiver.kernel.org>; Tue, 18 Aug 2026 13:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oTghzoQoE+9EjNMYK2kY4l+AoPjr6uTGRa6a+tu6CNE=; b=PNHI/w+pJzpDZR
	CUvClDeyAtU6QuWB3rELPqzm+proJ+w7N0ePNkJi9TsP4XUwzLfhih/iX9+ZSkQoNaJWsGmlD+ozx
	AZoCOFpV7iLp25EGwPvUWE04S+Qddk566aZFvIs6MaF8s4S/fkm957ReWdPH0n2fxU3XXJdkHMSTG
	5SEsa5aEODnwqRnM51AYOdVmgftqeNxcMLafc3VDPoLOeC2bPmnGsuyFJQxYwzB/VygWjQH5aV1d8
	OGK1Ae5NKnknddAl32PzS1t5JKxJ3okQPB2uM1A4p8GNVFMJGer3oBG//tnz6zhhQTgyVXfQld1mK
	bS3kN/jwbyWp1eVfvDfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwJxx-000000083Xv-440y;
	Tue, 18 Aug 2026 13:34:57 +0000
Received: from out30-97.freemail.mail.aliyun.com ([115.124.30.97])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwJxu-000000083XY-33oJ;
	Tue, 18 Aug 2026 13:34:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1787060091; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=AMqQhPIVZVTnz+mlp2yD/CiRqzqmyuR3oAehC/dra64=;
	b=lsZStvsaoLHQN8Aa1nu82caTa3AzGcaunhJ6Tvn1qdV93pF2qOoi4AH5oskl2rdZrOIDpE2wHQtHDdibAr+vcYjvjKXC2SX++bivIVPRMpOee8YgL+c1xKsCQ6H8Fq+5lTzmJ3WGTGEygV6wGhJPLRfKTfPqvET1xuQ3ajcXbbo=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R171e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=25;SR=0;TI=SMTPD_---0X9DUoVH_1787060087;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0X9DUoVH_1787060087 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 18 Aug 2026 21:34:49 +0800
From: fangyu.yu@linux.alibaba.com
To: andrew.jones@oss.qualcomm.com
Cc: alex@ghiti.fr,
	anup@brainfault.org,
	aou@eecs.berkeley.edu,
	atish.patra@linux.dev,
	baolu.lu@linux.intel.com,
	fangyu.yu@linux.alibaba.com,
	guoren@kernel.org,
	iommu@lists.linux.dev,
	jgg@nvidia.com,
	jgg@ziepe.ca,
	joro@8bytes.org,
	kevin.tian@intel.com,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	robin.murphy@arm.com,
	skhawaja@google.com,
	tjeznach@rivosinc.com,
	vasant.hegde@amd.com,
	will@kernel.org,
	zong.li@sifive.com
Subject: Re: [RFC PATCH v2 05/10] iommu/riscv: support GSCID and GVMA invalidation command
Date: Tue, 18 Aug 2026 21:34:47 +0800
Message-Id: <20260818133447.44426-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <4mcwrlk7yc4kozsqbrumf5gbknydquzwdb4g7lv6bgjk7m6ob2@alld2yusipnq>
References: <4mcwrlk7yc4kozsqbrumf5gbknydquzwdb4g7lv6bgjk7m6ob2@alld2yusipnq>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_063455_540136_7CF64BF2 
X-CRM114-Status: UNSURE (   8.85  )
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

>> @@ -1212,8 +1225,15 @@ static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
>>  	if (!riscv_iommu_pt_supported(iommu, pt_info.fsc_iosatp_mode))
>>  		return -ENODEV;
>
>This needs something like the below diff squashed in.
>
>Thanks,
>drew
>

Thanks, agreed.
I'll split the helper into fsc/iohgatp variants and squash this into
patch 5 for next version.

>>
>> -	dc.fsc = FIELD_PREP(RISCV_IOMMU_PC_FSC_MODE, pt_info.fsc_iosatp_mode) |
>> -	      FIELD_PREP(RISCV_IOMMU_PC_FSC_PPN, pt_info.ppn);
>> +	if (domain->gscid) {
>> +		dc.iohgatp = FIELD_PREP(RISCV_IOMMU_DC_IOHGATP_MODE, pt_info.iohgatp_mode) |
>> +			     FIELD_PREP(RISCV_IOMMU_DC_IOHGATP_GSCID, domain->gscid) |
>> +			     FIELD_PREP(RISCV_IOMMU_DC_IOHGATP_PPN, pt_info.ppn);
>> +	} else {
>> +		dc.fsc = FIELD_PREP(RISCV_IOMMU_PC_FSC_MODE, pt_info.fsc_iosatp_mode) |
>> +		      FIELD_PREP(RISCV_IOMMU_PC_FSC_PPN, pt_info.ppn);
>> +	}
>> +
>>  	dc.ta = FIELD_PREP(RISCV_IOMMU_PC_TA_PSCID, domain->pscid) |
>>  	     RISCV_IOMMU_PC_TA_V;
>>
>
>diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
>index 307baf33c646..434d2d4f26f5 100644
>--- a/drivers/iommu/riscv/iommu.c
>+++ b/drivers/iommu/riscv/iommu.c
>@@ -1262,9 +1262,9 @@ static void riscv_iommu_free_paging_domain(struct iommu_domain *iommu_domain)
> 	kfree(domain);
> }
>
>-static bool riscv_iommu_pt_supported(struct riscv_iommu_device *iommu, int pgd_mode)
>+static bool riscv_iommu_fsc_supported(struct riscv_iommu_device *iommu, int mode)
> {
>-	switch (pgd_mode) {
>+	switch (mode) {
> 	case RISCV_IOMMU_DC_FSC_IOSATP_MODE_SV39:
> 		return iommu->caps & RISCV_IOMMU_CAPABILITIES_SV39;
>
>@@ -1277,6 +1277,21 @@ static bool riscv_iommu_pt_supported(struct riscv_iommu_device *iommu, int pgd_m
> 	return false;
> }
>
>+static bool riscv_iommu_iohgatp_supported(struct riscv_iommu_device *iommu, int mode)
>+{
>+	switch (mode) {
>+	case RISCV_IOMMU_DC_IOHGATP_MODE_SV39X4:
>+		return iommu->caps & RISCV_IOMMU_CAPABILITIES_SV39X4;
>+
>+	case RISCV_IOMMU_DC_IOHGATP_MODE_SV48X4:
>+		return iommu->caps & RISCV_IOMMU_CAPABILITIES_SV48X4;
>+
>+	case RISCV_IOMMU_DC_IOHGATP_MODE_SV57X4:
>+		return iommu->caps & RISCV_IOMMU_CAPABILITIES_SV57X4;
>+	}
>+	return false;
>+}
>+
> static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
> 					    struct device *dev,
> 					    struct iommu_domain *old)
>@@ -1294,14 +1309,17 @@ static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
>
> 	pt_iommu_riscv_64_hw_info(&domain->riscvpt, &pt_info);
>
>-	if (!riscv_iommu_pt_supported(iommu, pt_info.fsc_iosatp_mode))
>-		return -ENODEV;
>-
> 	if (domain->gscid) {
>+		if (!riscv_iommu_iohgatp_supported(iommu, pt_info.iohgatp_mode))
>+			return -ENODEV;
>+
> 		dc.iohgatp = FIELD_PREP(RISCV_IOMMU_DC_IOHGATP_MODE, pt_info.iohgatp_mode) |
> 			     FIELD_PREP(RISCV_IOMMU_DC_IOHGATP_GSCID, domain->gscid) |
> 			     FIELD_PREP(RISCV_IOMMU_DC_IOHGATP_PPN, pt_info.ppn);
> 	} else {
>+		if (!riscv_iommu_fsc_supported(iommu, pt_info.fsc_iosatp_mode))
>+			return -ENODEV;
>+
> 		dc.fsc = FIELD_PREP(RISCV_IOMMU_PC_FSC_MODE, pt_info.fsc_iosatp_mode) |
> 			 FIELD_PREP(RISCV_IOMMU_PC_FSC_PPN, pt_info.ppn);
> 	}

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
