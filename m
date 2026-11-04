Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5587606D80B
	for <kvm-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 09:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iCw2i2bP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=I62A4V8oKTWPbkp4Ibgmze2ngRzM+hkYzJ/TzosCotc=; b=iCw2i2bPhpGZgquDj56Wxr/ef5
	9E4XLWe4qxD1ewfhr+bJu2gINtRFZLPahs1tzExAUTb+Vssr4BA8KnDgH7YjmE0UNfhVF8E8iVmFq
	5XVhu8okhB0OMW0DIldK772YqDY/9JbiAxkHHO7Wj99bOTcVXMm5ONHHqQkVkpIMUTNpgPvwS77C4
	dLwvvD46L/zsiCiE8eZ/aTQV5d8u3IkV7aKhB9+sZrZnFPnLWFcDyIopDTz8xcQRjbZsFC1fIB40p
	YhsbwHHXhETASBMjQzFaSAIvpsiQWuHi5AfKFxHT6GTBsJY/sDHFCZQRyblVJzIxe+2eTddwfAT1t
	IJkEbhVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOXBf-00000004rPI-2V8d;
	Wed, 04 Nov 2026 09:21:43 +0000
Received: from mxct.zte.com.cn ([183.62.165.209])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOXBX-00000004rMg-3ejF;
	Wed, 04 Nov 2026 09:21:42 +0000
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4jKKgl3G1qz58fdJ;
	Wed, 04 Nov 2026 17:21:23 +0800 (CST)
Received: from szxl2zmapp06.zte.com.cn ([10.1.32.108])
	by mse-fl2.zte.com.cn with SMTP id 6A49LF4E026376;
	Wed, 4 Nov 2026 17:21:15 +0800 (+08)
	(envelope-from gong.shuai@sanechips.com.cn)
Received: from ubuntu-35-gs (unknown [10.230.214.35])
	by smtp (Zmail) with SMTP;
	Wed, 4 Nov 2026 17:21:17 +0800
X-Zmail-TransId: 3e816aeaf906029-d1e8b
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
Subject: Re: [PATCH v7 05/10] iommu/riscv: support GSCID and GVMA invalidation command
Date: Wed,  4 Nov 2026 17:21:11 +0800
Message-ID: <20261104092111.119394-1-gong.shuai@sanechips.com.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103120236.53474-6-fangyu.yu@linux.alibaba.com>
References: <20261103120236.53474-6-fangyu.yu@linux.alibaba.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ZMAIL-USEORIGINALEMLTOOUTBOUND: 1
X-MAIL: mse-fl2.zte.com.cn 6A49LF4E026376
X-TLS: YES
X-ENVELOPE-SENDER: gong.shuai@sanechips.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Wed, 04 Nov 2026 17:21:23 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AEAF913.001/4jKKgl3G1qz58fdJ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_012136_232552_6D719015 
X-CRM114-Status: GOOD (  26.95  )
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

Hi Fangyu,

> From: Zong Li <zong.li@sifive.com>
> 
> This patch adds a ID Allocator for GSCID and a wrap for setting up
> GSCID in IOTLB invalidation command.
> 
> Set up iohgatp to enable second stage table and flush stage-2 table if
> the GSCID is set.
> 
> The GSCID of domain should be freed when release domain. GSCID will be
> allocated for parent domain in nested IOMMU process.
> 
> Signed-off-by: Zong Li <zong.li@sifive.com>
> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>
> ---
>  drivers/iommu/riscv/iommu-bits.h |  7 ++++
>  drivers/iommu/riscv/iommu.c      | 62 ++++++++++++++++++++++++++------
>  2 files changed, 58 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/iommu/riscv/iommu-bits.h b/drivers/iommu/riscv/iommu-bits.h
> index f2ef9bd3cde9..65d1f2250011 100644
> --- a/drivers/iommu/riscv/iommu-bits.h
> +++ b/drivers/iommu/riscv/iommu-bits.h
> @@ -720,6 +720,13 @@ static inline void riscv_iommu_cmd_inval_vma(struct riscv_iommu_command *cmd)
>  	cmd->dword1 = 0;
>  }
>  
> +static inline void riscv_iommu_cmd_inval_gvma(struct riscv_iommu_command *cmd)
> +{
> +	cmd->dword0 = FIELD_PREP(RISCV_IOMMU_CMD0_OPCODE, RISCV_IOMMU_CMD_IOTINVAL_OPCODE) |
> +		      FIELD_PREP(RISCV_IOMMU_CMD0_FUNC, RISCV_IOMMU_CMD_IOTINVAL_FUNC_GVMA);
> +	cmd->dword1 = 0;
> +}
> +
>  static inline void riscv_iommu_cmd_inval_set_addr(struct riscv_iommu_command *cmd,
>  						  u64 addr)
>  {
> diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
> index 918fce4aa8c4..5546dfcd976c 100644
> --- a/drivers/iommu/riscv/iommu.c
> +++ b/drivers/iommu/riscv/iommu.c
> @@ -49,6 +49,10 @@
>  static DEFINE_IDA(riscv_iommu_pscids);
>  #define RISCV_IOMMU_MAX_PSCID		(BIT(20) - 1)
>  
> +/* IOMMU GSCID allocation namespace. */
> +static DEFINE_IDA(riscv_iommu_gscids);
> +#define RISCV_IOMMU_MAX_GSCID		(BIT(16) - 1)
> +
>  /* Device resource-managed allocations */
>  struct riscv_iommu_devres {
>  	void *addr;
> @@ -842,6 +846,7 @@ struct riscv_iommu_domain {
>  	struct list_head bonds;
>  	spinlock_t lock;		/* protect bonds list updates. */
>  	int pscid;
> +	int gscid;
>  };
>  PT_IOMMU_CHECK_DOMAIN(struct riscv_iommu_domain, riscvpt.iommu, domain);
>  
> @@ -1004,7 +1009,7 @@ static void riscv_iommu_tlbi_calc(struct riscv_iommu_tlbi *tlbi,
>  }
>  
>  static void riscv_iommu_iotlb_inval_iommu(struct riscv_iommu_device *iommu,
> -					  int pscid,
> +					  int pscid, int gscid,
>  					  struct riscv_iommu_tlbi *tlbi)
>  {
>  	bool use_nl = tlbi->non_leaf &&
> @@ -1012,8 +1017,13 @@ static void riscv_iommu_iotlb_inval_iommu(struct riscv_iommu_device *iommu,
>  	struct riscv_iommu_command cmd;
>  	unsigned int i;
>  
> -	riscv_iommu_cmd_inval_vma(&cmd);
> -	riscv_iommu_cmd_inval_set_pscid(&cmd, pscid);
> +	if (gscid) {
> +		riscv_iommu_cmd_inval_gvma(&cmd);
> +		riscv_iommu_cmd_inval_set_gscid(&cmd, gscid);
> +	} else {
> +		riscv_iommu_cmd_inval_vma(&cmd);
> +		riscv_iommu_cmd_inval_set_pscid(&cmd, pscid);
> +	}

As I understand it, the same choice is needed in
riscv_iommu_bond_unlink().

The missing GVMA command does not break anything today, because every
caller of bond_unlink() runs iodir_update() just before it, and that
already sends the GVMA for the old GSCID. But depending on that
ordering seems fragile, and the comment in bond_unlink(), "invalidate
all cached entries for domain's PSCID", is no longer true now that we
have S2 domains.

The change, if you think it is needed, fits better in the last patch,
"iommu/riscv: Add IOTINVAL.GVMA invalidations". I am replying here
only because the code is very similar.

Thanks,
Shuai

>  
>  	/*
>  	 * If non-leaf entries were changed and the IOMMU doesn't
> @@ -1097,7 +1107,7 @@ static void riscv_iommu_iotlb_inval(struct riscv_iommu_domain *domain,
>  		if (iommu == prev)
>  			continue;
>  
> -		riscv_iommu_iotlb_inval_iommu(iommu, domain->pscid, &tlbi);
> +		riscv_iommu_iotlb_inval_iommu(iommu, domain->pscid, domain->gscid, &tlbi);
>  		prev = iommu;
>  	}
>  
> @@ -1231,6 +1241,7 @@ static void riscv_iommu_iodir_update(struct riscv_iommu_device *iommu,
>  
>  		WRITE_ONCE(dc->fsc, new_dc->fsc);
>  		WRITE_ONCE(dc->ta, new_dc->ta & RISCV_IOMMU_PC_TA_PSCID);
> +		WRITE_ONCE(dc->iohgatp, new_dc->iohgatp);
>  		/* Update device context, write TC.V as the last step. */
>  		dma_wmb();
>  		WRITE_ONCE(dc->tc, tc);
> @@ -1281,16 +1292,19 @@ static void riscv_iommu_free_paging_domain(struct iommu_domain *iommu_domain)
>  
>  	WARN_ON(!list_empty(&domain->bonds));
>  
> -	if ((int)domain->pscid > 0)
> +	if (domain->pscid > 0)
>  		ida_free(&riscv_iommu_pscids, domain->pscid);
> +	if (domain->gscid > 0)
> +		ida_free(&riscv_iommu_gscids, domain->gscid);
>  
>  	pt_iommu_deinit(&domain->riscvpt.iommu);
>  	kfree(domain);
>  }
>  
> -static bool riscv_iommu_pt_supported(struct riscv_iommu_device *iommu, int pgd_mode)
> +static bool riscv_iommu_fsc_supported(struct riscv_iommu_device *iommu,
> +				      int mode)
>  {
> -	switch (pgd_mode) {
> +	switch (mode) {
>  	case RISCV_IOMMU_DC_FSC_IOSATP_MODE_SV39:
>  		return iommu->caps & RISCV_IOMMU_CAPABILITIES_SV39;
>  
> @@ -1303,6 +1317,22 @@ static bool riscv_iommu_pt_supported(struct riscv_iommu_device *iommu, int pgd_m
>  	return false;
>  }
>  
> +static bool riscv_iommu_iohgatp_supported(struct riscv_iommu_device *iommu,
> +					  int mode)
> +{
> +	switch (mode) {
> +	case RISCV_IOMMU_DC_IOHGATP_MODE_SV39X4:
> +		return iommu->caps & RISCV_IOMMU_CAPABILITIES_SV39X4;
> +
> +	case RISCV_IOMMU_DC_IOHGATP_MODE_SV48X4:
> +		return iommu->caps & RISCV_IOMMU_CAPABILITIES_SV48X4;
> +
> +	case RISCV_IOMMU_DC_IOHGATP_MODE_SV57X4:
> +		return iommu->caps & RISCV_IOMMU_CAPABILITIES_SV57X4;
> +	}
> +	return false;
> +}
> +
>  static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
>  					    struct device *dev,
>  					    struct iommu_domain *old)
> @@ -1315,11 +1345,21 @@ static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
>  
>  	pt_iommu_riscv_64_hw_info(&domain->riscvpt, &pt_info);
>  
> -	if (!riscv_iommu_pt_supported(iommu, pt_info.fsc_iosatp_mode))
> -		return -ENODEV;
> +	if (domain->gscid) {
> +		if (!riscv_iommu_iohgatp_supported(iommu, pt_info.iohgatp_mode))
> +			return -EINVAL;
> +
> +		dc.iohgatp =
> +			FIELD_PREP(RISCV_IOMMU_DC_IOHGATP_MODE, pt_info.iohgatp_mode) |
> +			FIELD_PREP(RISCV_IOMMU_DC_IOHGATP_GSCID, domain->gscid) |
> +			FIELD_PREP(RISCV_IOMMU_DC_IOHGATP_PPN, pt_info.ppn);
> +	} else {
> +		if (!riscv_iommu_fsc_supported(iommu, pt_info.fsc_iosatp_mode))
> +			return -ENODEV;
>  
> -	dc.fsc = FIELD_PREP(RISCV_IOMMU_PC_FSC_MODE, pt_info.fsc_iosatp_mode) |
> -	      FIELD_PREP(RISCV_IOMMU_PC_FSC_PPN, pt_info.ppn);
> +		dc.fsc = FIELD_PREP(RISCV_IOMMU_PC_FSC_MODE, pt_info.fsc_iosatp_mode) |
> +			 FIELD_PREP(RISCV_IOMMU_PC_FSC_PPN, pt_info.ppn);
> +	}
>  	dc.ta = FIELD_PREP(RISCV_IOMMU_PC_TA_PSCID, domain->pscid) |
>  	     RISCV_IOMMU_PC_TA_V;
>  
> -- 
> 2.50.1
> 

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
