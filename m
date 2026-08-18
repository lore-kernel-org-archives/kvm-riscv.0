Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B901EC5DF74
	for <kvm-riscv@archiver.kernel.org>; Tue, 18 Aug 2026 14:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6bjEdFis3m+u7ciLiijXaK8grd9QAQ2tg8UWKUGexVM=; b=w2I8cZylL2MWRs
	VfqNThuZ2vYBH2seUcbWHyxIB5Vj9LF8/qcrIGvU5PDm4aWJh/WJFk4QMnxbYRRwDcoShgQpuhbFZ
	6iPf6OWPqHH6VwOPKPtpnT7m6J4hpKfqo5R9OENJUt7EIE2XLQSFREcA0Usf7ANYB5KnK+usxm5Xc
	FIBNN3tVOM+1HNsePC/bCIaZu720y2L7MmDJSyg/LPgwzD2Qxfc4r0Q/iwYDsmOQs8AwKLtvHCGYy
	V3bdHj6te+v6kyKoA4xhHTrntP5sIgI4YWiRC6Ebmc8V2dM4j9dhxA+MoWgmi8g3fcO4ofAGdhk0O
	XS7yu+AMo11IvDRA1EXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwKPw-000000085U8-1FQT;
	Tue, 18 Aug 2026 14:03:52 +0000
Received: from out30-98.freemail.mail.aliyun.com ([115.124.30.98])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwKPs-000000085TM-3B83;
	Tue, 18 Aug 2026 14:03:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1787061824; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=3+dGJ9oJ4HyGceZTjzfr3Zv2QrruNTe35bavzWX5RY8=;
	b=vM/PZjLRk+G86Cm3UqEJRrULiS3D0UNkhw+suxKR5mUTOfeWkIkav0cAbID18tJ9fCfdrtKLQ+hYJfbArL1IuEaCmxL+RzEwp1kAnheqTHDwpln7DtLEnmbNsrEfFbFO/u+WkIIRlzeT0HQ5mkol/H3noSsRAphUn6wY8A21LcI=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R121e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=24;SR=0;TI=SMTPD_---0X9DdTDT_1787061820;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0X9DdTDT_1787061820 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 18 Aug 2026 22:03:42 +0800
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
	will@kernel.org
Subject: Re: [RFC PATCH v2 07/10] iommu/riscv: Add domain_alloc_paging_flags for second-stage domain 
Date: Tue, 18 Aug 2026 22:03:40 +0800
Message-Id: <20260818140340.48333-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <rzvdgmjkk5rzn4qehsoajmbak7jpssqancyn3mfvpnzf6wyvsc@alyg5a4c2scx>
References: <rzvdgmjkk5rzn4qehsoajmbak7jpssqancyn3mfvpnzf6wyvsc@alyg5a4c2scx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_070348_951569_7EBBB1C9 
X-CRM114-Status: GOOD (  10.35  )
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

>On Thu, May 07, 2026 at 07:37:03PM +0800, fangyu.yu@linux.alibaba.com wrote:
>...
>> +	case IOMMU_HWPT_ALLOC_NEST_PARENT:
>> +	case IOMMU_HWPT_ALLOC_DIRTY_TRACKING:
>> +	case IOMMU_HWPT_ALLOC_DIRTY_TRACKING | IOMMU_HWPT_ALLOC_NEST_PARENT:
>> +		/*
>> +		 * Second-stage (iohgatp) page table for KVM VFIO device
>> +		 * pass-through and dirty tracking. The GPA space is 2 bits
>> +		 * wider than the corresponding first-stage VA space (x4 root
>> +		 * page table), so hw_max_vasz_lg2 values are 41/50/59.
>> +		 */
>> +		if (iommu->caps & RISCV_IOMMU_CAPABILITIES_SV57X4) {
>> +			cfg.common.hw_max_vasz_lg2 = 59;
>> +		} else if (iommu->caps & RISCV_IOMMU_CAPABILITIES_SV48X4) {
>> +			cfg.common.hw_max_vasz_lg2 = 50;
>> +		} else if (iommu->caps & RISCV_IOMMU_CAPABILITIES_SV39X4) {
>> +			cfg.common.hw_max_vasz_lg2 = 41;
>> +		} else {
>> +			ret = -ENODEV;
>> +			goto err_free;
>> +		}
>> +		domain->gscid = ida_alloc_range(&riscv_iommu_gscids, 1,
>> +						RISCV_IOMMU_MAX_GSCID, GFP_KERNEL);
>> +		if (domain->gscid < 0) {
>> +			ret = -ENOMEM;
>> +			goto err_free;
>> +		}
>> +		cfg.common.features |= BIT(PT_FEAT_RISCV_S2);
>
>cfg.common.features currently has PT_FEAT_SIGN_EXTEND which isn't correct
>for the second stage. So it needs to removed and then added back in for
>the first stage. riscv_64_kunit_fmt_cfgs[] in the kunit test will then
>need to also be updated.

Thanks, agreed. PT_FEAT_SIGN_EXTEND is only valid for first-stage
VA translation and should not be inherited by iohgatp domains. I'll move
PT_FEAT_SIGN_EXTEND into the first-stage allocation path, leave second-stage
domains with PT_FEAT_RISCV_S2 only, and update the RISC-V KUnit configs
accordingly in next version.

>
>Thanks,
>drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
