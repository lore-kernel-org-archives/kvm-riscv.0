Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AAB1606A325
	for <kvm-riscv@archiver.kernel.org>; Thu, 19 Nov 2026 18:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jkhTkhz9;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r/2GsE11
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PkuRqAu74KBaA5DipIrCIJ9vBSqTKACuraGXDKV7rDE=; b=jkhTkhz9YHcIipGqBBeBb4ljBZ
	Zr53OERjBAJcsqfwXm1ko8voQoDxQXwbo0bQytjSoNUfn2r2EL9ju/XH//2+qNxQ01pKGV9rGFbf6
	4TETnmj/YIizSsewaEal9+Zz7/Kpp36akFuscD4DEqRCjo1vmDtAGpq0381gOwH1x9Ro7SAJBHFS6
	E+ya8kql9X2rixAAGdpCgK+9ENLODJ0PfBQWK6SUtHD72R86JYy4AX1VNsGRj0HDUforgPNfmyKrU
	3hiCWvydcVzYpUZBzBrXelTUdOCm6VlAsEg74KynPCKu+ol5H/iX0Ez+2XuaaWAfIW/OXmHjzWGQo
	LkzvCP6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU6TE-0000000Cvxl-2xIB;
	Thu, 19 Nov 2026 18:02:52 +0000
Received: from mail-pi2-x09.google.com ([2607:f8b0:4864:3a::9])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU6TB-0000000Cvwp-49aU
	for kvm-riscv@lists.infradead.org;
	Thu, 19 Nov 2026 18:02:51 +0000
Received: by mail-pi2-x09.google.com with SMTP id 41be03b00d2f7-cdd8f943737so8518a12.1
        for <kvm-riscv@lists.infradead.org>; Thu, 19 Nov 2026 10:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795111369; x=1795716169; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=InfsSwOKE1v6TV2NrfByqErpltfDYpKmhyEWW16r+Go=;
        b=r/2GsE11cCM8CnVHF/9W2rtIrc5h1UNtDLmp3dYH/K1XmWM5lSo0ySZOgFwHTFOJ51
         VHkim0gD7X6fGWTdk9iof2SEVxAVB1KnhEDPE+TpsGFdL36kqYHmZKIoSeQUmsP+eA+W
         SyEMA4em0lTjmsN0JghvcwBR5bCUQctnzdSUP3ls4DH8TrkEGktsLMxDUJQHhqj7Kkvv
         Xft26cr3LjQC1/mTCl+T5UsZC2ZNXTJ0JfTPjNd9arPS876YfVEspgM/7JdMz5ks8mYb
         faxjas4+vIzS2XpBHTvkpoW/cVfkHfVHzbey+3tGQbDCFOZKvZXwwzOFyoSY3ayZMB2s
         ot9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795111369; x=1795716169;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=InfsSwOKE1v6TV2NrfByqErpltfDYpKmhyEWW16r+Go=;
        b=tr667tehZ+43xga8fpEt1bSqX8c4LdhQSR7abf5sYEF+hrXYOQx1+jFHHNkEZcnrsB
         6qng5XMHbLkBRKgkjShvHHSQwwX5jLboBmXiQqToY/OMF6ng308OFYd5nMrsfm9OX/z1
         BKjwCjg9uHmTlf08SLu9ZL8xTuWyuFvYYG+XlvuKw5hIc7mKT1XI+JpfouDKbsZzqMok
         adl/OxPhXoQvEsuQJKJC4+yuPm4IhADlx1u3ABnyGwZ0vPrkkjeC/hak4ERgZHCKp4F7
         GEcw3W8fTPp/6pY6Kw1D4qbxQby/gD7ECuMkn1at/0sqwr6EwFtDu3Mxwte9n8XKXwle
         bXFw==
X-Forwarded-Encrypted: i=1; AL+hErE9TnmIdmLdzV1+SjNaXej/INxg7RByFnsAC5AbkQ60pJrYHVcxpZHm8yYtYWYjd+FoJRNZQ+ZR3OQ=@lists.infradead.org
X-Gm-Message-State: APuU4Z+3MeU0K+2Rc7rDaEhWRTtHZiLws+BhmL6z0vTiPgosofrrqHYU
	TpHFmuYskYr4xR20Be46rd0T+ft8Q7zK2zdMf7GZI/E4JFVB5nNrLiDR
X-Gm-Gg: AYBFou3AUjZ6wc/isvNJCT4mAVK2EeNpvDpOIABgD9KVv46A4UyNUKNtz2r9Plwr3Xq
	qX2SrOrK/Pbi0V6fHwjaSzZffy008AHc6PF1BzKdaYoyOo43Z9qLpJT9jzdcrEk4Ccob2NU950n
	1z+Vo/dpBhhGRhNqrqD5lEVdWbndT8XOEwF8FiBsM7PKDhGSQ3d6Pwokfbw5ERidkLTPZ1FimXb
	XfETiaB03WPxqOodAWn2/1sX4roNZyAaFxP77LCHfCiQPnWolXgRH7vpgis4Gw7fzFETMEEVtI7
	6wZem5dvZ8WhG3TIeF+D9cOJj4FZppEMlUYcJqgWXif5iynmwW6bYbM1y++TUncqSPNlaTsZJmf
	zFCJl5W1ZO5t8Fc8V1r8SN3a0N2Riq8XMOXUtwsQ1AAafiFNEXM+wc0yDmZye4fuesEbwN0xMgy
	grkUi6o40ecMFPFT5zLBFpPvVR3dWF41YNBWyEoSjntlu0XkBPwUMfSdZhooIyX1i9nUhvc5pm8
	fwDJB0dGdRfhHLr6IRmSUc2altckkQoZtdFj9B7XiGAC6B7H0/JoiCylWD68lPHnmsR247L1Uol
	U3GxR//aMgALMPhLPqMC8kg2+8XreHPOi+yQm75J6X3rKtdggWzU2JBkk3c+xx/0Ltvp
X-Received: by 2002:a05:6a00:4c15:b0:8a0:73d7:aa7f with SMTP id d2e1a72fcca58-8c87ca50568mr392685b3a.41.1795111368332;
        Thu, 19 Nov 2026 10:02:48 -0800 (PST)
Received: from [192.168.50.100] ([114.252.97.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873b27900sm258038b3a.47.2026.11.19.10.02.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 10:02:47 -0800 (PST)
Message-ID: <23b033cb-1b98-48cf-a089-4e710dfe3e15@gmail.com>
Date: Fri, 20 Nov 2026 02:02:00 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 05/10] iommu/riscv: support GSCID and GVMA invalidation
 command
To: fangyu.yu@linux.alibaba.com, gong.shuai@sanechips.com.cn
Cc: alex@ghiti.fr, andrew.jones@linux.dev, anup@brainfault.org,
 aou@eecs.berkeley.edu, atish.patra@linux.dev, baolu.lu@linux.intel.com,
 guoren@kernel.org, iommu@lists.linux.dev, jgg@nvidia.com, jgg@ziepe.ca,
 joerg.roedel@amd.com, joro@8bytes.org, jroedel@suse.de,
 kevin.tian@intel.com, kvm-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 nutty.liu@hotmail.com, palmer@dabbelt.com, pjw@kernel.org,
 robin.murphy@arm.com, skhawaja@google.com, tanchi25@mails.ucas.ac.cn,
 tomasz.jeznach@linux.dev, vasant.hegde@amd.com, will@kernel.org,
 zong.li@sifive.com
References: <20261104092111.119394-1-gong.shuai@sanechips.com.cn>
 <20261104112712.68199-1-fangyu.yu@linux.alibaba.com>
From: Gong Shuai <gsh517025@gmail.com>
In-Reply-To: <20261104112712.68199-1-fangyu.yu@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_100250_031281_04B8B0F2 
X-CRM114-Status: GOOD (  20.87  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/4/2026 7:27 PM, fangyu.yu@linux.alibaba.com wrote:
>>Hi Fangyu,
>>
>>> From: Zong Li <zong.li@sifive.com>
>>>
>>> This patch adds a ID Allocator for GSCID and a wrap for setting up
>>> GSCID in IOTLB invalidation command.
>>>
>>> Set up iohgatp to enable second stage table and flush stage-2 table if
>>> the GSCID is set.
>>>
>>> The GSCID of domain should be freed when release domain. GSCID will be
>>> allocated for parent domain in nested IOMMU process.
>>>
>>> Signed-off-by: Zong Li <zong.li@sifive.com>
>>> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
>>> Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>
>>> ---
>>>  drivers/iommu/riscv/iommu-bits.h |  7 ++++
>>>  drivers/iommu/riscv/iommu.c      | 62 ++++++++++++++++++++++++++------
>>>  2 files changed, 58 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/drivers/iommu/riscv/iommu-bits.h b/drivers/iommu/riscv/iommu-bits.h
>>> index f2ef9bd3cde9..65d1f2250011 100644
>>> --- a/drivers/iommu/riscv/iommu-bits.h
>>> +++ b/drivers/iommu/riscv/iommu-bits.h
>>> @@ -720,6 +720,13 @@ static inline void riscv_iommu_cmd_inval_vma(struct riscv_iommu_command *cmd)
>>>  	cmd->dword1 = 0;
>>>  }
>>>
>>> +static inline void riscv_iommu_cmd_inval_gvma(struct riscv_iommu_command *cmd)
>>> +{
>>> +	cmd->dword0 = FIELD_PREP(RISCV_IOMMU_CMD0_OPCODE, RISCV_IOMMU_CMD_IOTINVAL_OPCODE) |
>>> +		      FIELD_PREP(RISCV_IOMMU_CMD0_FUNC, RISCV_IOMMU_CMD_IOTINVAL_FUNC_GVMA);
>>> +	cmd->dword1 = 0;
>>> +}
>>> +
>>>  static inline void riscv_iommu_cmd_inval_set_addr(struct riscv_iommu_command *cmd,
>>>  						  u64 addr)
>>>  {
>>> diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
>>> index 918fce4aa8c4..5546dfcd976c 100644
>>> --- a/drivers/iommu/riscv/iommu.c
>>> +++ b/drivers/iommu/riscv/iommu.c
>>> @@ -49,6 +49,10 @@
>>>  static DEFINE_IDA(riscv_iommu_pscids);
>>>  #define RISCV_IOMMU_MAX_PSCID		(BIT(20) - 1)
>>>
>>> +/* IOMMU GSCID allocation namespace. */
>>> +static DEFINE_IDA(riscv_iommu_gscids);
>>> +#define RISCV_IOMMU_MAX_GSCID		(BIT(16) - 1)
>>> +
>>>  /* Device resource-managed allocations */
>>>  struct riscv_iommu_devres {
>>>  	void *addr;
>>> @@ -842,6 +846,7 @@ struct riscv_iommu_domain {
>>>  	struct list_head bonds;
>>>  	spinlock_t lock;		/* protect bonds list updates. */
>>>  	int pscid;
>>> +	int gscid;
>>>  };
>>>  PT_IOMMU_CHECK_DOMAIN(struct riscv_iommu_domain, riscvpt.iommu, domain);
>>>
>>> @@ -1004,7 +1009,7 @@ static void riscv_iommu_tlbi_calc(struct riscv_iommu_tlbi *tlbi,
>>>  }
>>>
>>>  static void riscv_iommu_iotlb_inval_iommu(struct riscv_iommu_device *iommu,
>>> -					  int pscid,
>>> +					  int pscid, int gscid,
>>>  					  struct riscv_iommu_tlbi *tlbi)
>>>  {
>>>  	bool use_nl = tlbi->non_leaf &&
>>> @@ -1012,8 +1017,13 @@ static void riscv_iommu_iotlb_inval_iommu(struct riscv_iommu_device *iommu,
>>>  	struct riscv_iommu_command cmd;
>>>  	unsigned int i;
>>>
>>> -	riscv_iommu_cmd_inval_vma(&cmd);
>>> -	riscv_iommu_cmd_inval_set_pscid(&cmd, pscid);
>>> +	if (gscid) {
>>> +		riscv_iommu_cmd_inval_gvma(&cmd);
>>> +		riscv_iommu_cmd_inval_set_gscid(&cmd, gscid);
>>> +	} else {
>>> +		riscv_iommu_cmd_inval_vma(&cmd);
>>> +		riscv_iommu_cmd_inval_set_pscid(&cmd, pscid);
>>> +	}
>>
>>As I understand it, the same choice is needed in
>>riscv_iommu_bond_unlink().
>>
>>The missing GVMA command does not break anything today, because every
>>caller of bond_unlink() runs iodir_update() just before it, and that
>>already sends the GVMA for the old GSCID. But depending on that
>>ordering seems fragile, and the comment in bond_unlink(), "invalidate
>>all cached entries for domain's PSCID", is no longer true now that we
>>have S2 domains.
>>
> 
> There is no functional issue with the current code, since
> iodir_update() already performs the required invalidation.
> 
> That said, as this series adds S2 domain support,
> bond_unlink() should indeed be updated accordingly.
> Good catch.

Hi Fangyu,

I've included this code in patch 10 of the v3 nested series [1].

BTW, if you have time, would you mind reviewing the nested series?
I'd greatly appreciate your help.

[1] https://lore.kernel.org/linux-riscv/20261119132744.396426-11-gong.shuai@sanechips.com.cn/

Thanks,
Shaui

> 
> Thanks,
> Fangyu
> 
>>The change, if you think it is needed, fits better in the last patch,
>>"iommu/riscv: Add IOTINVAL.GVMA invalidations". I am replying here
>>only because the code is very similar.
>>
>>Thanks,
>>Shuai
>>
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
