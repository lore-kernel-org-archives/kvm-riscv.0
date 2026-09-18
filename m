Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD701C982D8
	for <kvm-riscv@archiver.kernel.org>; Fri, 18 Sep 2026 16:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KSLpuD01lWTLIh4084LamTksmhZBxIPStfGl/eKeOfc=; b=popTgOcAipRzpH
	yvPouAfZf+5KqRzjt34ORyE4R7RGTVy+xASyBFrHB5wrRZyPfI5993rWA696aw/H4rOHQTBnkfv8E
	jcU9YVw6toWU6mrOYvG+JiiVRI38HdbTBFxu7vLZDeTiIbPMILHWQxM7fnPXwVrYmzulbo0O9czUJ
	v53bBZZb205C2LT5t5N9/k+dQUEVNriTw3I1G3xEYL53pYswUNwmBHyyh83mf+Clqc0G4WkkATrmq
	7eIb6TgZWTxD5FBLJQDTIQmJ8PsRJJ1IbsYmGHuKlAneYEjk2bXsK4KNkUH6AAR2fHaSawL7UMjIn
	rou2GXZCRyc/8iWk9eaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7b9A-0000000Ey9d-0NYQ;
	Fri, 18 Sep 2026 16:09:08 +0000
Received: from mail-pj2-x01.google.com ([2607:f8b0:4864:39::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7b96-0000000Ey8t-3qw0
	for kvm-riscv@lists.infradead.org;
	Fri, 18 Sep 2026 16:09:06 +0000
Received: by mail-pj2-x01.google.com with SMTP id d9443c01a7336-2dae660f31bso6720795ad.1
        for <kvm-riscv@lists.infradead.org>; Fri, 18 Sep 2026 09:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789747743; x=1790352543; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sTFwCwuuJBdUqXmrDgIcnP3ObUsaQ9UCrGTYomH04hg=;
        b=T+XpI8ONZpw9nbk9e/1fnwVIPTldXbTmcMchqQoxXSL4+zCPCEAFhG10L980AMFs6j
         W+vrjvdYSOYf4/PyhD+iWP9qdKyEhMgfJZBeZET29pV8cYaWWzGdNVCD77wt//uQGaQP
         7dgX6oWAq9YCaNQis/y/iOxPKmpwzy2X3cDAPxxkaDpxzBvKMblbJkbTnII01j4jU7lA
         ZSDaXQUUCi8eEyZFZAJWK9zACNaEPVux4iQtGLDiHgB7ByIAiorJ06mWpP043v5xEshL
         EkRkxSXBdx1jfS38fdcHncuAn2+U/E4gNyVrM2ZsK1PhMocWhSGc6koyDW/OliF83GR9
         0OOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789747743; x=1790352543;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sTFwCwuuJBdUqXmrDgIcnP3ObUsaQ9UCrGTYomH04hg=;
        b=Hd9PRnzrVZUGdPMpIhenKwG/wPhTNU0Jms1ciaBNoYv5i/ctp1vJpTjQxvP6HDkHDk
         UX+KFDctUexg8VsxkO+T4dcSc5bOX6GfzdbcINsAl5W2qwjVvRV8vIJmgKDOYeQUMWj/
         i/3JRllYFINiVHPjF9VGGsJWjbbjrGVK2/wd8S0N7j99VhrSouHUzlRrk4M/G6jLPD+O
         5QmYGzXMGDRbZaQjEnMJ9ErsYpQpMFU5+o4BkkSnO4xjaKThpfV7zioElAa+4DBiFnwC
         z54dmK7z77Sb9sWnjRWa8/Jkr9AOwlajX65ttS2U5RhpQNg0kfBBOddAtNL4PaldjJnj
         XZnQ==
X-Forwarded-Encrypted: i=1; AKwUvBzzb10GsTk+W9oWfkeQJcMczSLz5BUHf7vpfUrze00pTTnhMjhCrNVru5AkbeW9ju3vkc42JevNhc4=@lists.infradead.org
X-Gm-Message-State: AFuF++n3Wb/a2/ilsjxmDTEUJeF2dfecska7GNngRfeclqbZ2kgcSIJS
	XtX2fqMPdWdpeVIYVmEg5tZgG5DtQjnVq5iU3rZvSHMG2jK++1yErxGg
X-Gm-Gg: AYBFou07jyqHOjR+cnkM4IUf0YEH9NJ9Imp40ZJb9sSAfFs/vBFNLfWv8N8y0vDeNwn
	wp5p14S3lFtJgZJBZ9o9IFNclI8GtQnk7nmnz9pAq8fOLxXYs+yYACFW28YTfAbWpe2VXvlyPks
	pu66+5Kud/cfLka8L0TuuISXzGF5dZiNfUw/9HSa/xEsDeI4pql9DnrQHuZPN1lzsfFWQy4hnW9
	ZE1/dwIBQIsfj0E/UgIpVyfriIFBpNB4mIEXE28eWiNH5rjeQK1xp23V8uVIvWkzXmKJBJUs7zw
	ZEmZfZK8sO0MfZpPClyH3qtGHntOmYZviaQYc1jJeioUn5SnuGDT0ml3i7U0bvD0zUMphZlyU6O
	nYvkS1AkA7lmvLF0lGEs0Xw9omQr2fZ0DDDh3xgJCzy1jvDDbDN+8PjxK00wNLGATqIqcStNHPL
	QC+WkD4oxV+2chDAnxI5VGqUpXnBeATtOpdJ/Ur4gLO3DJ2gDyMPKI/6kLHpqOriP1ydNMyvLJY
	e9e47oPG741rj0bNA==
X-Received: by 2002:a17:902:ea0c:b0:2dd:c100:7ccb with SMTP id d9443c01a7336-2ddc1007e5cmr1279195ad.71.1789747742619;
        Fri, 18 Sep 2026 09:09:02 -0700 (PDT)
Received: from [192.168.50.100] ([111.199.57.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddb76025afsm10835745ad.73.2026.09.18.09.08.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 09:09:01 -0700 (PDT)
Message-ID: <6d1bfb10-fd04-4e4e-895d-55c16fcea13f@gmail.com>
Date: Sat, 19 Sep 2026 00:08:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v4 04/10] iommu/riscv: use data structure instead of
 individual values
To: fangyu.yu@linux.alibaba.com
Cc: guoren@kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
 tomasz.jeznach@linux.dev, joro@8bytes.org, will@kernel.org,
 robin.murphy@arm.com, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, baolu.lu@linux.intel.com,
 jroedel@suse.de, zong.li@sifive.com, andrew.jones@oss.qualcomm.com,
 anup@brainfault.org, jgg@nvidia.com, jgg@ziepe.ca, kevin.tian@intel.com,
 atish.patra@linux.dev, skhawaja@google.com, vasant.hegde@amd.com,
 joerg.roedel@amd.com, gong.shuai@sanechips.com.cn
References: <20260915032828.11250-1-fangyu.yu@linux.alibaba.com>
 <20260915032828.11250-5-fangyu.yu@linux.alibaba.com>
From: Gong Shuai <gsh517025@gmail.com>
In-Reply-To: <20260915032828.11250-5-fangyu.yu@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_090904_978193_682B3CBD 
X-CRM114-Status: GOOD (  20.92  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

Hi Fangyu,

On 9/15/2026 11:28 AM, fangyu.yu@linux.alibaba.com wrote:
> From: Zong Li <zong.li@sifive.com>
> 
> The parameter will be increased when we need to set up more
> bit fields in the device context. Use a data structure to
> wrap them up.
> 
> Signed-off-by: Zong Li <zong.li@sifive.com>
> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> ---
>   drivers/iommu/riscv/iommu.c | 27 +++++++++++++++++----------
>   1 file changed, 17 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
> index a6c8307e82ea..c5b6214ee672 100644
> --- a/drivers/iommu/riscv/iommu.c
> +++ b/drivers/iommu/riscv/iommu.c
> @@ -1165,7 +1165,7 @@ static void riscv_iommu_iodir_iotinval(struct riscv_iommu_device *iommu,
>    * interim translation faults.
>    */
>   static void riscv_iommu_iodir_update(struct riscv_iommu_device *iommu,
> -				     struct device *dev, u64 fsc, u64 ta)
> +				     struct device *dev, struct riscv_iommu_dc *new_dc)
>   {
>   	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
>   	struct riscv_iommu_dc *dc;
> @@ -1204,10 +1204,10 @@ static void riscv_iommu_iodir_update(struct riscv_iommu_device *iommu,
>   	for (i = 0; i < fwspec->num_ids; i++) {
>   		dc = riscv_iommu_get_dc(iommu, fwspec->ids[i]);
>   		tc = READ_ONCE(dc->tc);
> -		tc |= ta & RISCV_IOMMU_DC_TC_V;
> +		tc |= new_dc->ta & RISCV_IOMMU_DC_TC_V;

According to SPEC 3.1.3.3, the "V bit" does not exist in DC.ta.
This should be a convention from when the iodir_update() function
did not yet use `struct riscv_iommu_dc` as a parameter, using bit 0
of DC.ta to indicate that the DC is valid. Now that iodir_update()
receives the complete dc, it can directly access DC.tc.V, so this
convention should no longer be necessary and will cause confusion.

>   
> -		WRITE_ONCE(dc->fsc, fsc);
> -		WRITE_ONCE(dc->ta, ta & RISCV_IOMMU_PC_TA_PSCID);
> +		WRITE_ONCE(dc->fsc, new_dc->fsc);
> +		WRITE_ONCE(dc->ta, new_dc->ta & RISCV_IOMMU_PC_TA_PSCID);

`RISCV_IOMMU_PC_*` should be replaced with `RISCV_IOMMU_DC_*` for
readability. There are several other similar places in this file
that are unrelated to Process Context or PASID but use the *PC* macros.


Thanks,
Shuai

>   		/* Update device context, write TC.V as the last step. */
>   		dma_wmb();
>   		WRITE_ONCE(dc->tc, tc);
> @@ -1288,22 +1288,22 @@ static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
>   	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
>   	struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
>   	struct pt_iommu_riscv_64_hw_info pt_info;
> -	u64 fsc, ta;
> +	struct riscv_iommu_dc dc = {0};
>   
>   	pt_iommu_riscv_64_hw_info(&domain->riscvpt, &pt_info);
>   
>   	if (!riscv_iommu_pt_supported(iommu, pt_info.fsc_iosatp_mode))
>   		return -ENODEV;
>   
> -	fsc = FIELD_PREP(RISCV_IOMMU_PC_FSC_MODE, pt_info.fsc_iosatp_mode) |
> +	dc.fsc = FIELD_PREP(RISCV_IOMMU_PC_FSC_MODE, pt_info.fsc_iosatp_mode) |
>   	      FIELD_PREP(RISCV_IOMMU_PC_FSC_PPN, pt_info.ppn);
> -	ta = FIELD_PREP(RISCV_IOMMU_PC_TA_PSCID, domain->pscid) |
> +	dc.ta = FIELD_PREP(RISCV_IOMMU_PC_TA_PSCID, domain->pscid) |
>   	     RISCV_IOMMU_PC_TA_V;
>   
>   	if (riscv_iommu_bond_link(domain, dev))
>   		return -ENOMEM;
>   
> -	riscv_iommu_iodir_update(iommu, dev, fsc, ta);
> +	riscv_iommu_iodir_update(iommu, dev, &dc);
>   	riscv_iommu_bond_unlink(info->domain, dev);
>   	info->domain = domain;
>   
> @@ -1378,9 +1378,12 @@ static int riscv_iommu_attach_blocking_domain(struct iommu_domain *iommu_domain,
>   {
>   	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
>   	struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
> +	struct riscv_iommu_dc dc = {0};
> +
> +	dc.fsc = RISCV_IOMMU_FSC_BARE;
>   
>   	/* Make device context invalid, translation requests will fault w/ #258 */
> -	riscv_iommu_iodir_update(iommu, dev, RISCV_IOMMU_FSC_BARE, 0);
> +	riscv_iommu_iodir_update(iommu, dev, &dc);
>   	riscv_iommu_bond_unlink(info->domain, dev);
>   	info->domain = NULL;
>   
> @@ -1400,8 +1403,12 @@ static int riscv_iommu_attach_identity_domain(struct iommu_domain *iommu_domain,
>   {
>   	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
>   	struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
> +	struct riscv_iommu_dc dc = {0};
> +
> +	dc.fsc = RISCV_IOMMU_FSC_BARE;
> +	dc.ta = RISCV_IOMMU_PC_TA_V;
>   
> -	riscv_iommu_iodir_update(iommu, dev, RISCV_IOMMU_FSC_BARE, RISCV_IOMMU_PC_TA_V);
> +	riscv_iommu_iodir_update(iommu, dev, &dc);
>   	riscv_iommu_bond_unlink(info->domain, dev);
>   	info->domain = NULL;
>   


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
