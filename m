Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0ABA606A331
	for <kvm-riscv@archiver.kernel.org>; Sat, 21 Nov 2026 06:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JzW5YEU8;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=P+IsRQQd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=t9bQ1KjTpvEZ9JQiHfBBiD2dtaXCd83ZsDE+7WwQBCM=; b=JzW5YEU82Uou+01SSfOzEZRxzu
	4JMeiGAckMiZQJvana27HqCFbt3LCXyIWZ165z/TxgpFqxQ6mFHxO7DstAUA+O2r3AvYjC32dUoJM
	FB84p3r4da3V+Te0Lz5SHo1UYgG6Iq5v/BMDfG6RUKVncOglS9/3DKhWIx0j1DkeVDsDCYLboSucX
	uYGE1A6u1S893w8ahkFsQvoG3cmvWedwnCC294zL8fkBYtBHuntQqvTguYQgerXrjuwlINXCaRBBQ
	pwH4eeEpD+E4QIt5kziJf1WKpV5P5zllVgHqA93Fq9nMLlNtb+YwArPUSGySJq4+8oXiENZtc+CSl
	/s2zJifA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUeO8-0000000GmwO-3cfl;
	Sat, 21 Nov 2026 06:15:52 +0000
Received: from out30-101.freemail.mail.aliyun.com ([115.124.30.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUeO5-0000000Gmvi-0RA6;
	Sat, 21 Nov 2026 06:15:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1795241738; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=YShQ51CxPN05RyeAJpAM1rmHPAWCYeDv107+BzXh+IU=;
	b=P+IsRQQd0chCnVD/8d8CMexNOPxH0TE1IA7ZmsemAf/sYtNU/GYmyAbGkUgZozcEbQ92yD8NosObkN4IlsrQh81lT1gwlmQTS+7SNnl9v77sf2P14X+3M+DFfTnpGdsD7LwYcMlryFiowl4R4L4Z51mzMtefjm29z2nbJ/WzdyY=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R831e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=30;SR=0;TI=SMTPD_---0XF83hNL_1795241733;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0XF83hNL_1795241733 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sat, 21 Nov 2026 14:15:35 +0800
From: fangyu.yu@linux.alibaba.com
To: gsh517025@gmail.com
Cc: alex@ghiti.fr,
	andrew.jones@linux.dev,
	anup@brainfault.org,
	aou@eecs.berkeley.edu,
	atish.patra@linux.dev,
	baolu.lu@linux.intel.com,
	fangyu.yu@linux.alibaba.com,
	gong.shuai@sanechips.com.cn,
	guoren@kernel.org,
	iommu@lists.linux.dev,
	jgg@nvidia.com,
	jgg@ziepe.ca,
	joerg.roedel@amd.com,
	joro@8bytes.org,
	jroedel@suse.de,
	kevin.tian@intel.com,
	kvm-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	nutty.liu@hotmail.com,
	palmer@dabbelt.com,
	pjw@kernel.org,
	robin.murphy@arm.com,
	skhawaja@google.com,
	tanchi25@mails.ucas.ac.cn,
	tomasz.jeznach@linux.dev,
	vasant.hegde@amd.com,
	will@kernel.org,
	zong.li@sifive.com
Subject: Re: [PATCH v7 05/10] iommu/riscv: support GSCID and GVMA invalidation command 
Date: Sat, 21 Nov 2026 14:15:32 +0800
Message-Id: <20261121061532.23534-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <23b033cb-1b98-48cf-a089-4e710dfe3e15@gmail.com>
References: <23b033cb-1b98-48cf-a089-4e710dfe3e15@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_221549_847959_A9B3A570 
X-CRM114-Status: GOOD (  19.88  )
X-Spam-Score: -17.6 (-----------------)
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
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

>>>Hi Fangyu,
>>>
>>>> From: Zong Li <zong.li@sifive.com>
>>>>
>>>> This patch adds a ID Allocator for GSCID and a wrap for setting up
>>>> GSCID in IOTLB invalidation command.
>>>>
>>>> Set up iohgatp to enable second stage table and flush stage-2 table if
>>>> the GSCID is set.
>>>>
>>>> The GSCID of domain should be freed when release domain. GSCID will be
>>>> allocated for parent domain in nested IOMMU process.
>>>>
>>>> Signed-off-by: Zong Li <zong.li@sifive.com>
>>>> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
>>>> Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>
>>>> ---
>>>>  drivers/iommu/riscv/iommu-bits.h |  7 ++++
>>>>  drivers/iommu/riscv/iommu.c      | 62 ++++++++++++++++++++++++++------
>>>>  2 files changed, 58 insertions(+), 11 deletions(-)
>>>>
>>>> diff --git a/drivers/iommu/riscv/iommu-bits.h b/drivers/iommu/riscv/iommu-bits.h
>>>> index f2ef9bd3cde9..65d1f2250011 100644
>>>> --- a/drivers/iommu/riscv/iommu-bits.h
>>>> +++ b/drivers/iommu/riscv/iommu-bits.h
>>>> @@ -720,6 +720,13 @@ static inline void riscv_iommu_cmd_inval_vma(struct riscv_iommu_command *cmd)
>>>>  	cmd->dword1 = 0;
>>>>  }
>>>>
>>>> +static inline void riscv_iommu_cmd_inval_gvma(struct riscv_iommu_command *cmd)
>>>> +{
>>>> +	cmd->dword0 = FIELD_PREP(RISCV_IOMMU_CMD0_OPCODE, RISCV_IOMMU_CMD_IOTINVAL_OPCODE) |
>>>> +		      FIELD_PREP(RISCV_IOMMU_CMD0_FUNC, RISCV_IOMMU_CMD_IOTINVAL_FUNC_GVMA);
>>>> +	cmd->dword1 = 0;
>>>> +}
>>>> +
>>>>  static inline void riscv_iommu_cmd_inval_set_addr(struct riscv_iommu_command *cmd,
>>>>  						  u64 addr)
>>>>  {
>>>> diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
>>>> index 918fce4aa8c4..5546dfcd976c 100644
>>>> --- a/drivers/iommu/riscv/iommu.c
>>>> +++ b/drivers/iommu/riscv/iommu.c
>>>> @@ -49,6 +49,10 @@
>>>>  static DEFINE_IDA(riscv_iommu_pscids);
>>>>  #define RISCV_IOMMU_MAX_PSCID		(BIT(20) - 1)
>>>>
>>>> +/* IOMMU GSCID allocation namespace. */
>>>> +static DEFINE_IDA(riscv_iommu_gscids);
>>>> +#define RISCV_IOMMU_MAX_GSCID		(BIT(16) - 1)
>>>> +
>>>>  /* Device resource-managed allocations */
>>>>  struct riscv_iommu_devres {
>>>>  	void *addr;
>>>> @@ -842,6 +846,7 @@ struct riscv_iommu_domain {
>>>>  	struct list_head bonds;
>>>>  	spinlock_t lock;		/* protect bonds list updates. */
>>>>  	int pscid;
>>>> +	int gscid;
>>>>  };
>>>>  PT_IOMMU_CHECK_DOMAIN(struct riscv_iommu_domain, riscvpt.iommu, domain);
>>>>
>>>> @@ -1004,7 +1009,7 @@ static void riscv_iommu_tlbi_calc(struct riscv_iommu_tlbi *tlbi,
>>>>  }
>>>>
>>>>  static void riscv_iommu_iotlb_inval_iommu(struct riscv_iommu_device *iommu,
>>>> -					  int pscid,
>>>> +					  int pscid, int gscid,
>>>>  					  struct riscv_iommu_tlbi *tlbi)
>>>>  {
>>>>  	bool use_nl = tlbi->non_leaf &&
>>>> @@ -1012,8 +1017,13 @@ static void riscv_iommu_iotlb_inval_iommu(struct riscv_iommu_device *iommu,
>>>>  	struct riscv_iommu_command cmd;
>>>>  	unsigned int i;
>>>>
>>>> -	riscv_iommu_cmd_inval_vma(&cmd);
>>>> -	riscv_iommu_cmd_inval_set_pscid(&cmd, pscid);
>>>> +	if (gscid) {
>>>> +		riscv_iommu_cmd_inval_gvma(&cmd);
>>>> +		riscv_iommu_cmd_inval_set_gscid(&cmd, gscid);
>>>> +	} else {
>>>> +		riscv_iommu_cmd_inval_vma(&cmd);
>>>> +		riscv_iommu_cmd_inval_set_pscid(&cmd, pscid);
>>>> +	}
>>>
>>>As I understand it, the same choice is needed in
>>>riscv_iommu_bond_unlink().
>>>
>>>The missing GVMA command does not break anything today, because every
>>>caller of bond_unlink() runs iodir_update() just before it, and that
>>>already sends the GVMA for the old GSCID. But depending on that
>>>ordering seems fragile, and the comment in bond_unlink(), "invalidate
>>>all cached entries for domain's PSCID", is no longer true now that we
>>>have S2 domains.
>>>
>>
>> There is no functional issue with the current code, since
>> iodir_update() already performs the required invalidation.
>>
>> That said, as this series adds S2 domain support,
>> bond_unlink() should indeed be updated accordingly.
>> Good catch.
>
>Hi Fangyu,
>
>I've included this code in patch 10 of the v3 nested series [1].
>

Hi Shuai,

Thanks for the pointer. If possible, I'd suggest keeping this
change in the current patch rather than splitting it out --
it makes the functionality look more complete, and splitting
it into two patches seems a bit odd.

>BTW, if you have time, would you mind reviewing the nested series?
>I'd greatly appreciate your help.
>

Regarding the nested series, it looks like a solid set of
patches that already provides the basic nested IOMMU
functionality. I'd be glad to help with the review and hope
I can be of some help.

Thanks,
Fangyu

>[1] https://lore.kernel.org/linux-riscv/20261119132744.396426-11-gong.shuai@sanechips.com.cn/
>
>Thanks,
>Shaui
>
>>
>> Thanks,
>> Fangyu
>>
>>>The change, if you think it is needed, fits better in the last patch,
>>>"iommu/riscv: Add IOTINVAL.GVMA invalidations". I am replying here
>>>only because the code is very similar.
>>>
>>>Thanks,
>>>Shuai
>>>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
