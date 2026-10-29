Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01559606A31D
	for <kvm-riscv@archiver.kernel.org>; Thu, 29 Oct 2026 01:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GIJ/tV0z;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=v/6d4aMX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=uh6VlGLUVdEmwb40h4+oKv1yzRPfuG1qoqcLj3DgLZM=; b=GIJ/tV0zyh4GCpKX+OxEuKhqSs
	oBbdpnLrgGiTOS28V3nv3medKFuuUn92e+Ii6YD2zeM5FjZ7z/uhhM3CZ81isN8njMcpXI4brHlx+
	FCXY0pgJbH60Gtt7aLWiA5Bh1O4nlipGAHGfyhbWfUo9mayjAZCBd+BLXFa/y66xdeOkadIobjMWP
	XKIHkreED6wv1Uh+GURbHHBlwnwCnrl4mnX5PtfrQz8QRBSSt4QaX9tP2yPJV9kRSNn5LIgNvzWlw
	h+4iZpXlPCAwAYN7d9HSBwDG1MZp76mrhF85Eswwv69hv2nhcdmsLo0Ld+bcyDfVWud0Yr7oC3kF8
	L5qIhMOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMF98-000000089FL-1wiV;
	Thu, 29 Oct 2026 01:41:38 +0000
Received: from out30-130.freemail.mail.aliyun.com ([115.124.30.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMF94-000000089EO-0oeX;
	Thu, 29 Oct 2026 01:41:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793238085; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=C7QU0MynSPZH9XIFESMQueT1x5DIy1wAFQgauvOVdHE=;
	b=v/6d4aMXYaOr7ue/G5H372yJbrktzf5kEgEBixMVm2NoqF425JpYLJpAZd0vge3HGNtMIQIC2oGEZb0MzdSGQttU+wZ4mjZJTCnokkViqFnxerl7AFgzVpjCT+4s24jAEX8+x6LbZPpJY0e+qe3auCwfFCUx7Nxg2pq2UG+OWI0=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R171e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=28;SR=0;TI=SMTPD_---0XDhzCnt_1793238081;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0XDhzCnt_1793238081 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 29 Oct 2026 09:41:23 +0800
From: fangyu.yu@linux.alibaba.com
To: jgg@nvidia.com
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
	jgg@ziepe.ca,
	joerg.roedel@amd.com,
	joro@8bytes.org,
	jroedel@suse.de,
	kevin.tian@intel.com,
	kvm-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	robin.murphy@arm.com,
	skhawaja@google.com,
	tanchi25@mails.ucas.ac.cn,
	tomasz.jeznach@linux.dev,
	vasant.hegde@amd.com,
	will@kernel.org,
	zong.li@sifive.com
Subject: Re: [RFC PATCH v5 07/10] iommu/riscv: Add domain_alloc_paging_flags for second-stage domain  
Date: Thu, 29 Oct 2026 09:41:17 +0800
Message-Id: <20261029014117.80953-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <179320128834.2412245.6365239689333877950.b4-review@b4>
References: <179320128834.2412245.6365239689333877950.b4-review@b4>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_184134_883471_94C442A4 
X-CRM114-Status: UNSURE (   9.89  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

>> [ ... 22 lines skipped ... ]
>> -static struct iommu_domain *riscv_iommu_alloc_paging_domain(struct device *dev)
>> +static struct iommu_domain *
>> +riscv_iommu_domain_alloc_paging_flags(struct device *dev, u32 flags,
>> +				      const struct iommu_user_data *user_data)
>>  {
>>  	struct pt_iommu_riscv_64_cfg cfg = {};
>>  	struct riscv_iommu_domain *domain;
>>  	struct riscv_iommu_device *iommu;
>>  	int ret;
>> +	const u32 supported_flags = IOMMU_HWPT_ALLOC_DIRTY_TRACKING |
>> +				    IOMMU_HWPT_ALLOC_NEST_PARENT;
>>
>> -	iommu = dev_to_iommu(dev);
>> -	if (iommu->caps & RISCV_IOMMU_CAPABILITIES_SV57) {
>> -		cfg.common.hw_max_vasz_lg2 = 57;
>> -	} else if (iommu->caps & RISCV_IOMMU_CAPABILITIES_SV48) {
>> -		cfg.common.hw_max_vasz_lg2 = 48;
>> -	} else if (iommu->caps & RISCV_IOMMU_CAPABILITIES_SV39) {
>> -		cfg.common.hw_max_vasz_lg2 = 39;
>> -	} else {
>> -		dev_err(dev, "cannot find supported page table mode\n");
>> -		return ERR_PTR(-ENODEV);
>> -	}
>> -	cfg.common.hw_max_oasz_lg2 = 56;
>> +	if (flags & ~supported_flags)
>> +		return ERR_PTR(-EOPNOTSUPP);
>
>This probably isn't needed since the switch checks it?
>

Right, the switch already enumerates all valid combinations, and
the default case returns -EOPNOTSUPP, so this check is
redundant. I'll drop it, along with supported_flags, in v6.

>> [ ... 30 lines skipped ... ]
>> +	switch (flags) {
>> +	case 0:
>> +		cfg.common.features |= BIT(PT_FEAT_SIGN_EXTEND);
>> +		if (iommu->caps & RISCV_IOMMU_CAPABILITIES_SV57) {
>> +			cfg.common.hw_max_vasz_lg2 = 57;
>> +		} else if (iommu->caps & RISCV_IOMMU_CAPABILITIES_SV48) {
>> +			cfg.common.hw_max_vasz_lg2 = 48;
>> +		} else if (iommu->caps & RISCV_IOMMU_CAPABILITIES_SV39) {
>> +			cfg.common.hw_max_vasz_lg2 = 39;
>> +		} else {
>> +			ret = -ENODEV;
>> +			goto err_free;
>> +		}
>> +		domain->pscid = ida_alloc_range(&riscv_iommu_pscids, 1,
>> +						RISCV_IOMMU_MAX_PSCID, GFP_KERNEL);
>> +		if (domain->pscid < 0) {
>> +			ret = -ENOMEM;
>> +			goto err_free;
>> +		}
>> +		break;
>
>I'd prefer you make functions riscv_iommu_init_domain_s1/s2() to put
>this in, it will be clearer
>

Agreed. In v6, I will move the page table mode selection, the
PSCID/GSCID allocation, and the stage-specific feature bits
into riscv_iommu_init_domain_s1/s2().

Thanks,
Fangyu

>It looks ok otherwise
>
>Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
>
>--
>Jason

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
