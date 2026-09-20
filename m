Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF261C982CC
	for <kvm-riscv@archiver.kernel.org>; Sun, 20 Sep 2026 05:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NPuFEQSede7UvdFMvIlxdE0vigOo7FmCxtXVYIEHN0o=; b=L1qUgQTkTQ0wHE
	lx3lCKCxXhn9nFazHup/vA3/jX2CTHEyPlqDoD9nASZqKsQKPdB6fJU8E7dzOGdnBMqteHj8FF3j7
	1+Jmj1v14PliNngZJJjjwu1JyxynuBsnXsHVdOXp3Vp6H0V4C5MgL9bat6iZSjb0uJryhjpHsXMWB
	L0SSA5c2fvfM9F05+tWGO3Kdn9ZVf2059/2+fmJS+Qn1VnYxWQNf1EJlcuM/EiS9IJvvJAlV0tuBI
	UbhyxPiA3YMxjqNNvAeo8ZFJBgukU6eheolCL1uQct7FH/dyKALIQn6uEwuvo5e5BWA3CPwRA2dS7
	jhQDz1IqFkHIx7zCntZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8A5t-0000000GvyD-1Qbn;
	Sun, 20 Sep 2026 05:28:05 +0000
Received: from mail-pj2-x08.google.com ([2607:f8b0:4864:39::8])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8A5p-0000000GvxF-3S3t
	for kvm-riscv@lists.infradead.org;
	Sun, 20 Sep 2026 05:28:04 +0000
Received: by mail-pj2-x08.google.com with SMTP id 98e67ed59e1d1-398b9f722abso1091488a91.0
        for <kvm-riscv@lists.infradead.org>; Sat, 19 Sep 2026 22:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789882081; x=1790486881; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kRdyhVbDbtwWbg31SSUY067XkC3mS81pEbCoqok50kg=;
        b=It9dLZaZkpzkfZkUpnGcarpzm3xRuxJdapfsVckFDaruFkk9goB2c61Hqxo/b4Lriw
         Gv+I9gvCok+okPzp/VMoWoKygnHJufWmWo6jdYhaWNaCs71J4Wph9BhOvkFi5Nxvjw2+
         LCN2RCo5gDW670TmDDH0no2vbPOv7cE6nfuUNTp692rOiTnOhYSpnyS6n846pDczpef7
         Jyb1ErOL5/k2qFkC71KoOWkbCeMvy6alOGYxj82nlWkZlXJu5iyhdfehFLuMnwv/JtQH
         34QV5jtOwZZj927Fi790Tj5/7U4FQ006r+g1Q1Xi9bckAkICooVrBETjO4yKSILiSm5h
         0E0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789882081; x=1790486881;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kRdyhVbDbtwWbg31SSUY067XkC3mS81pEbCoqok50kg=;
        b=taKx2zRZiFTXWNTAhzwsk9+2D8LKKjAO2jolbP/6yzvRwU1DkD20e6W1yKGPqQq2PQ
         CNhHRSM1nfHMtECRCiN77oRQdDD5R3EIXTMmENpM6tup7fh7bKhlZFjgjTcj7/qTSFgR
         zodr41OCtlZYa96SkvtNyIqW9wddT4HWPJ+DybAyLp8RG557NZLUBL+JHTl1HkZz1Q+d
         WznlpRIqp2WJbEhpC3bm7ypva486/phZ6LJlsadJIuDVJbGcnGLv6JHXTwz3OV5PENzU
         Ibf9qCsTPcTfBCYiXgnBpSm7xWX33t+u9/W7GtQaiA6YX+q/4nt+RR9NY7vwBvwtiHEY
         Dc6g==
X-Forwarded-Encrypted: i=1; AKwUvBwCEZe0Zl0K3n5JqxJrgzd0banNwQ4VWvYgP79VCNp5LLssWDc6XUFWN85Po5XQyh0eeUrbrvGtis0=@lists.infradead.org
X-Gm-Message-State: AFuF++lcujaDrk1Z3VD6POOkT0QGlmfG+9vBWyCN5wwcxtSPNlzfy7GM
	nvIgrfDTPnpe53Ny0tT7Gwy/gxJQns+CR6eHaJVQ/soXRJzYQl969wyQDZvwXq0/5X82S5To
X-Gm-Gg: AYBFou1nF2xKLIS5SQjCOeztBlM/zgLR50dBWFzQiUOudlxXxL7Ef69dERdE/NIbieG
	SdXDC2B/VHCCsmrBqGmbaFvFh37rKUmZ6+ZB5ZCvYW0y1dj5KlUwEVYx8rmRN1ffJg9Y8rZhiRN
	u3a1EhUOTxg8t+FTHoVpjw32/faLlHFjs5aDO8dTTeiPjd/vKGMzBBplB4rnUZnfWcLkwbRHqNO
	ACd2sZeUyQ2sV48SueUdcleVP4gAEwMYWQXcvyRPZCkSDtzhaWI5SrwbPLNfmTCWXflSSXkyarf
	5fPcVm3zCmR4yLJD9uq64LMrOud5yfwCCU7KY+fMUwL+xKCGN14V2/wDR61Bybj4Q1epKU8I9o5
	vtZSyxRnGkFnnbWnWtTaZ3goitz1ggXOKythwR2JFNClcvlVuaftL6ZrO3J/yExaRCDjZCEhyu/
	7Z0+DfZOnSIM5fbNiBb3EhGDrAvoKJ0mI7cO4J7qZqm8p/qiPRlXja9XeA3PNokRFZ3+kci62fc
	TmMkqxp6aeESdYz
X-Received: by 2002:a17:90b:2b8e:b0:39d:f024:c7ee with SMTP id 98e67ed59e1d1-39e5500a842mr11856295a91.25.1789882080607;
        Sat, 19 Sep 2026 22:28:00 -0700 (PDT)
Received: from [192.168.50.174] ([124.64.19.40])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6cabafbasm7603098a91.10.2026.09.19.22.27.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2026 22:28:00 -0700 (PDT)
Message-ID: <229a6c7c-f320-40a5-b9c6-06b31a5de28a@gmail.com>
Date: Sun, 20 Sep 2026 13:27:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v4 04/10] iommu/riscv: use data structure instead of
 individual values
To: fangyu.yu@linux.alibaba.com
Cc: alex@ghiti.fr, andrew.jones@oss.qualcomm.com, anup@brainfault.org,
 aou@eecs.berkeley.edu, atish.patra@linux.dev, baolu.lu@linux.intel.com,
 gong.shuai@sanechips.com.cn, guoren@kernel.org, iommu@lists.linux.dev,
 jgg@nvidia.com, jgg@ziepe.ca, joerg.roedel@amd.com, joro@8bytes.org,
 jroedel@suse.de, kevin.tian@intel.com, kvm-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com, pjw@kernel.org, robin.murphy@arm.com,
 skhawaja@google.com, tomasz.jeznach@linux.dev, vasant.hegde@amd.com,
 will@kernel.org, zong.li@sifive.com
References: <6d1bfb10-fd04-4e4e-895d-55c16fcea13f@gmail.com>
 <20260920030846.20403-1-fangyu.yu@linux.alibaba.com>
From: Gong Shuai <gsh517025@gmail.com>
In-Reply-To: <20260920030846.20403-1-fangyu.yu@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_222801_874087_C264DD3E 
X-CRM114-Status: GOOD (  29.02  )
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

On 9/20/2026 11:08 AM, fangyu.yu@linux.alibaba.com wrote:
>>Hi Fangyu,
>>
>>On 9/15/2026 11:28 AM, fangyu.yu@linux.alibaba.com wrote:
>>> From: Zong Li <zong.li@sifive.com>
>>>
>>> The parameter will be increased when we need to set up more
>>> bit fields in the device context. Use a data structure to
>>> wrap them up.
>>>
>>> Signed-off-by: Zong Li <zong.li@sifive.com>
>>> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
>>> ---
>>>   drivers/iommu/riscv/iommu.c | 27 +++++++++++++++++----------
>>>   1 file changed, 17 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
>>> index a6c8307e82ea..c5b6214ee672 100644
>>> --- a/drivers/iommu/riscv/iommu.c
>>> +++ b/drivers/iommu/riscv/iommu.c
>>> @@ -1165,7 +1165,7 @@ static void riscv_iommu_iodir_iotinval(struct riscv_iommu_device *iommu,
>>>    * interim translation faults.
>>>    */
>>>   static void riscv_iommu_iodir_update(struct riscv_iommu_device *iommu,
>>> -				     struct device *dev, u64 fsc, u64 ta)
>>> +				     struct device *dev, struct riscv_iommu_dc *new_dc)
>>>   {
>>>   	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
>>>   	struct riscv_iommu_dc *dc;
>>> @@ -1204,10 +1204,10 @@ static void riscv_iommu_iodir_update(struct riscv_iommu_device *iommu,
>>>   	for (i = 0; i < fwspec->num_ids; i++) {
>>>   		dc = riscv_iommu_get_dc(iommu, fwspec->ids[i]);
>>>   		tc = READ_ONCE(dc->tc);
>>> -		tc |= ta & RISCV_IOMMU_DC_TC_V;
>>> +		tc |= new_dc->ta & RISCV_IOMMU_DC_TC_V;
>>
>>According to SPEC 3.1.3.3, the "V bit" does not exist in DC.ta.
>>This should be a convention from when the iodir_update() function
>>did not yet use `struct riscv_iommu_dc` as a parameter, using bit 0
>>of DC.ta to indicate that the DC is valid. Now that iodir_update()
>>receives the complete dc, it can directly access DC.tc.V, so this
>>convention should no longer be necessary and will cause confusion.
>>
> 
> Hi Shuai:
> 
> Thanks for the clarification.
> 
> My understanding is that `ta` here is used as a
> combined concept, not only for `DC.ta`, but also
> for `PC.ta` in this flow.
> 
> The `V` bit is only initialized when `ta` is first
> set up, so the current usage still follows the
> original design, without changing most of the
> existing logic.
> 
> The original code also has comments describing
> this behavior.

I got your point.

When fsc and ta were passed as separate raw parameters, treating
them as a combined concept was arguably reasonable, since the same
bit layout is shared between DC and PC in this path. But now that
iodir_update() takes a struct riscv_iommu_dc, I think it would be
better to keep the semantics explicit.

If PDT/PC support is added later, we can introduce a separate
struct riscv_iommu_pc parameter for the PC context, instead of
trying to make one ta/fsc cover both cases.


> Thanks,
> Fangyu
> 
>>>
>>> -		WRITE_ONCE(dc->fsc, fsc);
>>> -		WRITE_ONCE(dc->ta, ta & RISCV_IOMMU_PC_TA_PSCID);
>>> +		WRITE_ONCE(dc->fsc, new_dc->fsc);
>>> +		WRITE_ONCE(dc->ta, new_dc->ta & RISCV_IOMMU_PC_TA_PSCID);
>>
>>`RISCV_IOMMU_PC_*` should be replaced with `RISCV_IOMMU_DC_*` for
>>readability. There are several other similar places in this file
>>that are unrelated to Process Context or PASID but use the *PC* macros.
>>
> 
> My understanding is similar to the `ta` case: `fsc`
> likely refers to both `dc.fsc` and `pc.fsc` in this
> path, since some of their fields share the same bit
> layout.
Yeah, exactly, they share the same layout, so logically it's fine.

> 
> If we want to rename these for readability, I think
> that should be done in a separate patch set, rather
> than as part of this one.

Agree that it should be done in a separate patch.

Thanks,
Shuai

> 
>>
>>Thanks,
>>Shuai
>>
>>>   		/* Update device context, write TC.V as the last step. */
>>>   		dma_wmb();
>>>   		WRITE_ONCE(dc->tc, tc);
>>> @@ -1288,22 +1288,22 @@ static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
>>>   	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
>>>   	struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
>>>   	struct pt_iommu_riscv_64_hw_info pt_info;
>>> -	u64 fsc, ta;
>>> +	struct riscv_iommu_dc dc = {0};
>>>
>>>   	pt_iommu_riscv_64_hw_info(&domain->riscvpt, &pt_info);
>>>
>>>   	if (!riscv_iommu_pt_supported(iommu, pt_info.fsc_iosatp_mode))
>>>   		return -ENODEV;
>>>
>>> -	fsc = FIELD_PREP(RISCV_IOMMU_PC_FSC_MODE, pt_info.fsc_iosatp_mode) |
>>> +	dc.fsc = FIELD_PREP(RISCV_IOMMU_PC_FSC_MODE, pt_info.fsc_iosatp_mode) |
>>>   	      FIELD_PREP(RISCV_IOMMU_PC_FSC_PPN, pt_info.ppn);
>>> -	ta = FIELD_PREP(RISCV_IOMMU_PC_TA_PSCID, domain->pscid) |
>>> +	dc.ta = FIELD_PREP(RISCV_IOMMU_PC_TA_PSCID, domain->pscid) |
>>>   	     RISCV_IOMMU_PC_TA_V;
>>>
>>>   	if (riscv_iommu_bond_link(domain, dev))
>>>   		return -ENOMEM;
>>>
>>> -	riscv_iommu_iodir_update(iommu, dev, fsc, ta);
>>> +	riscv_iommu_iodir_update(iommu, dev, &dc);
>>>   	riscv_iommu_bond_unlink(info->domain, dev);
>>>   	info->domain = domain;
>>>
>>> @@ -1378,9 +1378,12 @@ static int riscv_iommu_attach_blocking_domain(struct iommu_domain *iommu_domain,
>>>   {
>>>   	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
>>>   	struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
>>> +	struct riscv_iommu_dc dc = {0};
>>> +
>>> +	dc.fsc = RISCV_IOMMU_FSC_BARE;
>>>
>>>   	/* Make device context invalid, translation requests will fault w/ #258 */
>>> -	riscv_iommu_iodir_update(iommu, dev, RISCV_IOMMU_FSC_BARE, 0);
>>> +	riscv_iommu_iodir_update(iommu, dev, &dc);
>>>   	riscv_iommu_bond_unlink(info->domain, dev);
>>>   	info->domain = NULL;
>>>
>>> @@ -1400,8 +1403,12 @@ static int riscv_iommu_attach_identity_domain(struct iommu_domain *iommu_domain,
>>>   {
>>>   	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
>>>   	struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
>>> +	struct riscv_iommu_dc dc = {0};
>>> +
>>> +	dc.fsc = RISCV_IOMMU_FSC_BARE;
>>> +	dc.ta = RISCV_IOMMU_PC_TA_V;
>>>
>>> -	riscv_iommu_iodir_update(iommu, dev, RISCV_IOMMU_FSC_BARE, RISCV_IOMMU_PC_TA_V);
>>> +	riscv_iommu_iodir_update(iommu, dev, &dc);
>>>   	riscv_iommu_bond_unlink(info->domain, dev);
>>>   	info->domain = NULL;
>>>


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
