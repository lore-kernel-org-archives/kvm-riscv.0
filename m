Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D26D606A332
	for <kvm-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 08:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HNyMaKSi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=VSD0IQAXmrBElOnDOonoo0ASxxUT3WXxVFN7ApAvhiw=; b=HNyMaKSi97FAa5FkzxRsTg6QUN
	vpjQsPcOGy54LGZSncfy8F8RUTT3vFjg3ApVNrAWyLXxEKcG8Bp0fw98gXD5w1ojquy2kCVvXbi4A
	JwOII4W0yKDwTmy8ZSGmxlsEYJ4DEBrchMOxtExQFQ3HKj1KOTDBbuOQFKa0sLa4eYc7AO/WcWEQq
	tw4HL+RpUVgDh0nxBo2Yo9RzGi/4CTH6UNJcSI4URPy04/6sQbgmvG31/W8WQpy6Rk8ktTz56MjxE
	KCa71rnoqJCklOH/r+WcokeY0hPY9MKl3KMoOmF9NBkceX0dA0D/P9jZPTkYUpPW2opza61J/V1be
	oOFjHI9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOWcb-00000004kNi-1K3b;
	Wed, 04 Nov 2026 08:45:29 +0000
Received: from mxhk.zte.com.cn ([160.30.148.35])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOWcY-00000004kMn-3bk1;
	Wed, 04 Nov 2026 08:45:28 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4jKJt809b0z8Xrrr;
	Wed, 04 Nov 2026 16:45:20 +0800 (CST)
Received: from szxlzmapp03.zte.com.cn ([10.5.231.207])
	by mse-fl1.zte.com.cn with SMTP id 6A48j9Vc096993;
	Wed, 4 Nov 2026 16:45:09 +0800 (+08)
	(envelope-from gong.shuai@sanechips.com.cn)
Received: from ubuntu-35-gs (unknown [10.230.214.35])
	by smtp (Zmail) with SMTP;
	Wed, 4 Nov 2026 16:45:11 +0800
X-Zmail-TransId: 3e816aeaf08f029-ccf59
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
Subject: Re: [PATCH v7 09/10] iommu/riscv: Add dirty tracking support for second-stage domains
Date: Wed,  4 Nov 2026 16:45:03 +0800
Message-ID: <20261104084503.118083-1-gong.shuai@sanechips.com.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103120236.53474-10-fangyu.yu@linux.alibaba.com>
References: <20261103120236.53474-10-fangyu.yu@linux.alibaba.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ZMAIL-USEORIGINALEMLTOOUTBOUND: 1
X-MAIL: mse-fl1.zte.com.cn 6A48j9Vc096993
X-TLS: YES
X-ENVELOPE-SENDER: gong.shuai@sanechips.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Wed, 04 Nov 2026 16:45:20 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AEAF0A0.000/4jKJt809b0z8Xrrr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_004527_218713_5AB0F8F3 
X-CRM114-Status: GOOD (  23.40  )
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

Hi Fangyu,

> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> 
> Add hardware dirty tracking support for second-stage (iohgatp) domains
> used in KVM VFIO device pass-through.
> 
> The RISC-V IOMMU can automatically set the dirty bit in PTEs on write
> access when DC.tc.GADE is set and the hardware has AMO_HWAD capability.
> Wire this up to the iommufd dirty tracking interface:
> 
>   - riscv_iommu_set_dirty_tracking(): Return success without toggling GADE.
> 
>   - riscv_iommu_dirty_ops: Exposes set_dirty_tracking and the generic
>     page-table read_and_clear_dirty via IOMMU_PT_DIRTY_OPS(riscv_64).
> 
>   - domain_alloc_paging_flags: Assigns dirty_ops to second-stage domains
>     when IOMMU_HWPT_ALLOC_DIRTY_TRACKING is requested.
> 
>   - riscv_iommu_capable: Reports IOMMU_CAP_DIRTY_TRACKING when
>     AMO_HWAD is present.
> 
> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>
> ---
>  drivers/iommu/riscv/iommu.c | 32 ++++++++++++++++++++++++++++++--
>  1 file changed, 30 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
> index b3f05dfdf278..ff1043afe973 100644
> --- a/drivers/iommu/riscv/iommu.c
> +++ b/drivers/iommu/riscv/iommu.c
> @@ -1350,6 +1350,10 @@ static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
>  	if (domain->gscid) {
>  		if (!riscv_iommu_iohgatp_supported(iommu, pt_info.iohgatp_mode))
>  			return -EINVAL;
> +		/* Dirty tracking requires AMO_HWAD on every attached IOMMU */
> +		if (iommu_domain->dirty_ops &&
> +		    !(iommu->caps & RISCV_IOMMU_CAPABILITIES_AMO_HWAD))
> +			return -EINVAL;
>  
>  		dc.iohgatp =
>  			FIELD_PREP(RISCV_IOMMU_DC_IOHGATP_MODE, pt_info.iohgatp_mode) |
> @@ -1377,6 +1381,21 @@ static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
>  	return 0;
>  }
>  
> +static int riscv_iommu_set_dirty_tracking(struct iommu_domain *iommu_domain,
> +					  bool enable)
> +{
> +	/*
> +	 * Always enabled and the dirty bitmap is cleared prior to
> +	 * set_dirty_tracking().
> +	 */
> +	return 0;
> +}
> +
> +static const struct iommu_dirty_ops riscv_iommu_dirty_ops = {
> +	IOMMU_PT_DIRTY_OPS(riscv_64),
> +	.set_dirty_tracking = riscv_iommu_set_dirty_tracking,
> +};
> +
>  static const struct iommu_domain_ops riscv_iommu_paging_domain_ops = {
>  	IOMMU_PT_DOMAIN_OPS(riscv_64),
>  	.attach_dev = riscv_iommu_attach_paging_domain,
> @@ -1418,7 +1437,8 @@ static int riscv_iommu_init_domain_s1(struct device *dev,
>   */
>  static int riscv_iommu_init_domain_s2(struct device *dev,
>  				      struct riscv_iommu_domain *domain,
> -				      struct pt_iommu_riscv_64_cfg *cfg)
> +				      struct pt_iommu_riscv_64_cfg *cfg,
> +				      u32 flags)
>  {
>  	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
>  
> @@ -1439,6 +1459,10 @@ static int riscv_iommu_init_domain_s2(struct device *dev,
>  	if (domain->gscid < 0)
>  		return -ENOMEM;
>  
> +	/* AMO_HWAD is checked by iommufd via IOMMU_CAP_DIRTY_TRACKING */
> +	if (flags & IOMMU_HWPT_ALLOC_DIRTY_TRACKING)
> +		domain->domain.dirty_ops = &riscv_iommu_dirty_ops;
> +
>  	return 0;
>  }
>  
> @@ -1481,7 +1505,7 @@ riscv_iommu_domain_alloc_paging_flags(struct device *dev, u32 flags,
>  	case IOMMU_HWPT_ALLOC_NEST_PARENT:
>  	case IOMMU_HWPT_ALLOC_DIRTY_TRACKING:
>  	case IOMMU_HWPT_ALLOC_DIRTY_TRACKING | IOMMU_HWPT_ALLOC_NEST_PARENT:
> -		ret = riscv_iommu_init_domain_s2(dev, domain, &cfg);
> +		ret = riscv_iommu_init_domain_s2(dev, domain, &cfg, flags);
>  		break;
>  	default:
>  		ret = -EOPNOTSUPP;
> @@ -1559,9 +1583,13 @@ static struct iommu_group *riscv_iommu_device_group(struct device *dev)
>  
>  static bool riscv_iommu_capable(struct device *dev, enum iommu_cap cap)
>  {
> +	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
> +
>  	switch (cap) {
>  	case IOMMU_CAP_CACHE_COHERENCY:
>  		return dev_is_dma_coherent(dev);
> +	case IOMMU_CAP_DIRTY_TRACKING:
> +		return !!(iommu->caps & RISCV_IOMMU_CAPABILITIES_AMO_HWAD);

I'm not quite sure about this. Could there be a device that supports
AMO_HWAD but not any of the S2 modes? GET_HW_INFO would report
DIRTY_TRACKING as supported, but HWPT_ALLOC would then fail in
riscv_iommu_init_domain_s2(). Should this check also include the
S2 modes, like

    AMO_HWAD && (SV39X4|SV48X4|SV57X4) ?

BTW, in riscv_iommu_init_domain_s1/s2, why not return -EOPNOTSUPP
instead of -ENODEV for "cannot find supported page table mode"?

Thanks,
Shuai

>  	default:
>  		return false;
>  	}
> -- 
> 2.50.1
> 

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
