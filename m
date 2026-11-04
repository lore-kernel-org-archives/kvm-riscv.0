Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD48D606A33C
	for <kvm-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 11:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jxwtumpB;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=aJysmVG6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QADS70MUzOo1xH3jtS78LbXIWpIOrxPTxL/6v2bIwSs=; b=jxwtumpBJjl1gJy6zDVOw62t54
	K7UtxmXSAhkQ+GdQ5en4qK14vD7qIjUfQfQvT6yk1gAAI7utkJtrTwgqGRg9HO+4UBxIBmYzGDRUB
	YXGLgYT4btfFSn0S/qetKq4HNdnlajvi6OOTafFnw+KuqhU4nVLdadi4brOqZYI4UDBL8J2skV1dP
	TI+Wr3ucC1+8Jf0sAMZ/ZAigub/YvDBQ351IpMVsmtkMx92ZMbuRGJWR6Fl+UNw7xtHEczrKQgwfh
	gtG+4PD7ZognCegGgFRDfzlCi9Dj3URWFEeRz0HIlqNVhIzaDzGFbd2hnW1vvlQKgRuS9rrwe/6tZ
	+VENQcyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOZ9J-000000059YB-1oNY;
	Wed, 04 Nov 2026 11:27:25 +0000
Received: from out30-133.freemail.mail.aliyun.com ([115.124.30.133])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOZ9E-000000059UL-050I;
	Wed, 04 Nov 2026 11:27:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793791637; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=eSRpEyiCpq6q3r3x8lXM5Pt5HeYqMgK+KLNe7ym6hQM=;
	b=aJysmVG6wDCaBZ7s8EgxxqW0ZdYj5atcNO+3tRr7lf/sZyC++VlaEgXc+MhFiBjsoYrQbPeZCInd2YCKi95EtNpqQqDkIXZ/MshChRPkpwpycCD8b/+RVHvyZySDKmgZLW1vjgz27UCfli8zkiwKBUL5UFQCzT/yFfoZk9wUmaQ=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R861e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=29;SR=0;TI=SMTPD_---0XE5bSHL_1793791633;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0XE5bSHL_1793791633 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 04 Nov 2026 19:27:15 +0800
From: fangyu.yu@linux.alibaba.com
To: gong.shuai@sanechips.com.cn
Cc: alex@ghiti.fr,
	andrew.jones@linux.dev,
	anup@brainfault.org,
	aou@eecs.berkeley.edu,
	atish.patra@linux.dev,
	baolu.lu@linux.intel.com,
	fangyu.yu@linux.alibaba.com,
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
Date: Wed,  4 Nov 2026 19:27:12 +0800
Message-Id: <20261104112712.68199-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20261104092111.119394-1-gong.shuai@sanechips.com.cn>
References: <20261104092111.119394-1-gong.shuai@sanechips.com.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_032720_222942_F72F0294 
X-CRM114-Status: GOOD (  18.35  )
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

>Hi Fangyu,
>
>> From: Zong Li <zong.li@sifive.com>
>>
>> This patch adds a ID Allocator for GSCID and a wrap for setting up
>> GSCID in IOTLB invalidation command.
>>
>> Set up iohgatp to enable second stage table and flush stage-2 table if
>> the GSCID is set.
>>
>> The GSCID of domain should be freed when release domain. GSCID will be
>> allocated for parent domain in nested IOMMU process.
>>
>> Signed-off-by: Zong Li <zong.li@sifive.com>
>> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
>> Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>
>> ---
>>  drivers/iommu/riscv/iommu-bits.h |  7 ++++
>>  drivers/iommu/riscv/iommu.c      | 62 ++++++++++++++++++++++++++------
>>  2 files changed, 58 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/iommu/riscv/iommu-bits.h b/drivers/iommu/riscv/iommu-bits.h
>> index f2ef9bd3cde9..65d1f2250011 100644
>> --- a/drivers/iommu/riscv/iommu-bits.h
>> +++ b/drivers/iommu/riscv/iommu-bits.h
>> @@ -720,6 +720,13 @@ static inline void riscv_iommu_cmd_inval_vma(struct riscv_iommu_command *cmd)
>>  	cmd->dword1 = 0;
>>  }
>>
>> +static inline void riscv_iommu_cmd_inval_gvma(struct riscv_iommu_command *cmd)
>> +{
>> +	cmd->dword0 = FIELD_PREP(RISCV_IOMMU_CMD0_OPCODE, RISCV_IOMMU_CMD_IOTINVAL_OPCODE) |
>> +		      FIELD_PREP(RISCV_IOMMU_CMD0_FUNC, RISCV_IOMMU_CMD_IOTINVAL_FUNC_GVMA);
>> +	cmd->dword1 = 0;
>> +}
>> +
>>  static inline void riscv_iommu_cmd_inval_set_addr(struct riscv_iommu_command *cmd,
>>  						  u64 addr)
>>  {
>> diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
>> index 918fce4aa8c4..5546dfcd976c 100644
>> --- a/drivers/iommu/riscv/iommu.c
>> +++ b/drivers/iommu/riscv/iommu.c
>> @@ -49,6 +49,10 @@
>>  static DEFINE_IDA(riscv_iommu_pscids);
>>  #define RISCV_IOMMU_MAX_PSCID		(BIT(20) - 1)
>>
>> +/* IOMMU GSCID allocation namespace. */
>> +static DEFINE_IDA(riscv_iommu_gscids);
>> +#define RISCV_IOMMU_MAX_GSCID		(BIT(16) - 1)
>> +
>>  /* Device resource-managed allocations */
>>  struct riscv_iommu_devres {
>>  	void *addr;
>> @@ -842,6 +846,7 @@ struct riscv_iommu_domain {
>>  	struct list_head bonds;
>>  	spinlock_t lock;		/* protect bonds list updates. */
>>  	int pscid;
>> +	int gscid;
>>  };
>>  PT_IOMMU_CHECK_DOMAIN(struct riscv_iommu_domain, riscvpt.iommu, domain);
>>
>> @@ -1004,7 +1009,7 @@ static void riscv_iommu_tlbi_calc(struct riscv_iommu_tlbi *tlbi,
>>  }
>>
>>  static void riscv_iommu_iotlb_inval_iommu(struct riscv_iommu_device *iommu,
>> -					  int pscid,
>> +					  int pscid, int gscid,
>>  					  struct riscv_iommu_tlbi *tlbi)
>>  {
>>  	bool use_nl = tlbi->non_leaf &&
>> @@ -1012,8 +1017,13 @@ static void riscv_iommu_iotlb_inval_iommu(struct riscv_iommu_device *iommu,
>>  	struct riscv_iommu_command cmd;
>>  	unsigned int i;
>>
>> -	riscv_iommu_cmd_inval_vma(&cmd);
>> -	riscv_iommu_cmd_inval_set_pscid(&cmd, pscid);
>> +	if (gscid) {
>> +		riscv_iommu_cmd_inval_gvma(&cmd);
>> +		riscv_iommu_cmd_inval_set_gscid(&cmd, gscid);
>> +	} else {
>> +		riscv_iommu_cmd_inval_vma(&cmd);
>> +		riscv_iommu_cmd_inval_set_pscid(&cmd, pscid);
>> +	}
>
>As I understand it, the same choice is needed in
>riscv_iommu_bond_unlink().
>
>The missing GVMA command does not break anything today, because every
>caller of bond_unlink() runs iodir_update() just before it, and that
>already sends the GVMA for the old GSCID. But depending on that
>ordering seems fragile, and the comment in bond_unlink(), "invalidate
>all cached entries for domain's PSCID", is no longer true now that we
>have S2 domains.
>

There is no functional issue with the current code, since
iodir_update() already performs the required invalidation.

That said, as this series adds S2 domain support,
bond_unlink() should indeed be updated accordingly.
Good catch.

Thanks,
Fangyu

>The change, if you think it is needed, fits better in the last patch,
>"iommu/riscv: Add IOTINVAL.GVMA invalidations". I am replying here
>only because the code is very similar.
>
>Thanks,
>Shuai
>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
