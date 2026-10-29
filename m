Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1558606A334
	for <kvm-riscv@archiver.kernel.org>; Thu, 29 Oct 2026 13:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fDZMCqKH;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=Fh1ewr5A
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=HNjBkEjhO5OmbIxiFJnjRd2eKRqBx2pL1SfZRamk3QM=; b=fDZMCqKHoRTjaXSIK/Se31qyFV
	eF2bmFeGLyGgT8FA89GiuSOBUvR8sHArHAfH2UvrFtrbqX7LYNRdtGAU7tlvB95R9Ev47/qq0tq5S
	vLzAJuwDC1OKXalwqPfS8eApNcu/8Le2pNuplYpggj6g/ikENXHTVXnMZizzDZxGmLARaxCB6WrLW
	V6Vg89mojtqxcRBV9bQW5MYjHYqUfNwEwH7Q9VjBAKk9M9lZBTt4fLL/KJYW3bMyu2zEXfbRcohIm
	yh7fhKwbPTzn8FDCvG34UkgUp9tKAT0OsI9J3G4FkQ3p783oPD8RKRhhJHmJHzmByT9hYHQ5xikj7
	Y3u+hQ6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMQHL-00000009MS0-1nDX;
	Thu, 29 Oct 2026 13:34:51 +0000
Received: from out30-97.freemail.mail.aliyun.com ([115.124.30.97])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMQHI-00000009MR9-1vJb;
	Thu, 29 Oct 2026 13:34:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793280885; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=YVcuR3dE8fIuUWwIxvchcOUadKxVHUF5SCVKnZ/WJfI=;
	b=Fh1ewr5AjZaAi8lZ/FM68UXC7qrVIHH/hlibevh/6ZoOAEeXwzr7MKEtKsM7e63PY19JkmamDAJ7ez6j3LGsCYJhFjcbzWQoeVFIyMuuB5/rhRAxz7UtIXX+I2L25gTmhvU3IVLSUqpsRr4WJF2gOb6mZBnyi5OJcgSeM0kuO/w=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=20;SR=0;TI=SMTPD_---0XDjURmL_1793280883;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0XDjURmL_1793280883 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 29 Oct 2026 21:34:44 +0800
From: fangyu.yu@linux.alibaba.com
To: jgg@nvidia.com
Cc: alex@ghiti.fr,
	andrew.jones@linux.dev,
	aou@eecs.berkeley.edu,
	fangyu.yu@linux.alibaba.com,
	gong.shuai@sanechips.com.cn,
	gsh517025@gmail.com,
	guoren@kernel.org,
	iommu@lists.linux.dev,
	joro@8bytes.org,
	jroedel@suse.de,
	kvm-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	robin.murphy@arm.com,
	tomasz.jeznach@linux.dev,
	will@kernel.org,
	zong.li@sifive.com
Subject: Re: [RFC PATCH v2 3/4] iommu/riscv: Add guest IMSIC GPA mapping helpers  
Date: Thu, 29 Oct 2026 21:34:42 +0800
Message-Id: <20261029133442.82962-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20261027141300.GB2338330@nvidia.com>
References: <20261027141300.GB2338330@nvidia.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_063448_699986_1BAE33FD 
X-CRM114-Status: GOOD (  14.84  )
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
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

>> >His concern seems to be about who owns and maintains these mappings.
>> >When the RISC-V IOMMU driver calls iommu_map directly on a paging
>> >domain managed by iommufd, the mappings are not visible to the domain
>> >owner. This makes it difficult to handle mapping lifetime and
>> >hardware page table replacement correctly.
>> >
>>
>> Hi Shuai,
>>
>> Thanks for the review.
>>
>> Before going further, I want to make sure I answer the actual
>> question. If the concern is about who owns and maintains these
>> mappings, I address that below.
>>
>> The iommu_map() and replace_leaf() calls are not a separate
>> mapping facility added next to the forwarding code. They are
>> two steps in the existing interrupt-forwarding state machine
>> driven from iommu-ir.c:
>>
>>   - first FORWARD:      flat -> MSIPTE written /
>>                         noflat -> S2 PTE installed
>>   - UPDATE_TARGET:      flat -> MSIPTE updated /
>>                         noflat -> replace_leaf()
>>                          (only if the VS-file page moved)
>>   - last unforward:     flat -> MSI table deactivated /
>>                         noflat -> S2 PTE removed
>>
>> So the lifetime of the S2 mapping matches the lifetime of the
>> forwarding session, which is the same rule the MSI page table
>> already follows. The driver is the only layer that sees both
>> the forwarding session (device <-> vCPU) and the paging domain
>> used to translate guest MSI writes, so it is also the only
>> layer that can maintain this mapping.
>>
>> Note that the noflat column of the last row is not in v2: v2
>> only frees the bookkeeping when the domain is torn down. In
>> v3, I revoke the S2 entries both when the last forwarded IRQ
>> in the domain is released and at domain free, so the entry
>> lifetime becomes identical to the MSIPTE lifetime.
>
>The big point is interrupt code has to live in an irq_domain, not in
>the iommu driver, and the IOVA allocator is not part of either irq or
>iommu drivers.
>

Hi Jason,

Thanks, I agree that interrupt routing belongs in irq_domain, and IOVA
allocation belongs in dma-iommu/iommufd, not in the irq or iommu
drivers.

This series does not invent the interrupt-remapping structure; it
builds on Andrew's RISC-V IOMMU irqbypass v3 series:

  https://lore.kernel.org/linux-iommu/20260928143113.49838-1-
  andrew.jones@oss.qualcomm.com/

That series creates a DOMAIN_BUS_MSI_REMAP irq_domain under the MSI
parent, with an irq_chip whose .irq_set_vcpu_affinity is the
forwarding entry point. Our noflat support hooks into the same
callback and does not touch the DMA path in iommu.c.

There is no IOVA allocator involved in the noflat path. The mapped
address is the guest IMSIC GPA, a reserved guest MMIO window, and
what we install is a stage-2 translation from that GPA to the host
VS-file HPA. The IOMMU driver already owns the stage-2 tables for
this domain, so the update happens through the same irq_chip callback
used by the flat MSI case.

If you have a cleaner layering in mind, I'd be happy to discuss it.
For example, should irq_domain own a reserved S2 window and ask the
IOMMU driver for a primitive like "map GPA X to HPA Y in this
domain's S2"?

Thanks,
Fangyu

>So you have to layer this properly if you are going to even attempt
>it. It sounds complicated.
>
>Jason
>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
