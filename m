Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E1CFC5DF7E
	for <kvm-riscv@archiver.kernel.org>; Tue, 18 Aug 2026 12:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dvPaWuCp0H9Pk4PYgDgn6tjfwIdYvz5j+eDiV2tl9cQ=; b=ZiJxwDHbv683/d
	IMc+M5jAv4tc2MV2iAbWAOssV1+wYyU+nDyqgI1HLaAhvE/LFusIzeBHYwf4W3NHPiGGikFoYvff6
	BaMhQvK6W+XR00ZmCd55nZTahrkScY29YW21csXf/ucmAqaxnlt4P3ntotuz411FvL10Itu+f6yat
	9ZLQ5OwsCFwVj9RwHZwYIgbCIzeltOP85M5EO0GxipNeOknQhKWksXQuAGETAtnbqc8g8M3k9puBl
	r2LMnHLha4FvAdsSu4rqB/2A3KfrZ2BljczRTMVYQvAcUFOFniQz3p2QJxz+A6SGajZeAolCZv1IF
	xwXZ7TJ9u00lHGS1g3gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwJPc-00000007zu5-22K8;
	Tue, 18 Aug 2026 12:59:28 +0000
Received: from out30-124.freemail.mail.aliyun.com ([115.124.30.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwJPX-00000007ztf-2HAr;
	Tue, 18 Aug 2026 12:59:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1787057958; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=ES6qoaxH7aDi5DiJCCb446qkTLSYvUQTBdOjpjMPh+M=;
	b=I+gFwjYWNY2vL4bm8aDQSyI3l+1aT5lczjOf1a6W+oeHfwyjQW8drcy1whWAwq9J/IkadErznMZSugnO5EArpFKskyMyv8i0kBCIyAYkooqqT8Nvsdir9rjxt0GhCyqrn7PFRWbO+zRsIDCgi2PVtMsH8uv37AAi5VZ4uxzbXPE=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R171e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=24;SR=0;TI=SMTPD_---0X9DUfkY_1787057955;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0X9DUfkY_1787057955 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 18 Aug 2026 20:59:16 +0800
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
Subject: Re: [RFC PATCH v2 01/10] iommupt: Add RISC-V Second-stage (iohgatp) page table support 
Date: Tue, 18 Aug 2026 20:59:10 +0800
Message-Id: <20260818125910.39784-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <lpnxdqyekcczbyxo3n7zxpbj7243gixdzutvngpvr24ozmc4jt@nsoblujgprhe>
References: <lpnxdqyekcczbyxo3n7zxpbj7243gixdzutvngpvr24ozmc4jt@nsoblujgprhe>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_055925_672921_792D3238 
X-CRM114-Status: UNSURE (   8.69  )
X-CRM114-Notice: Please train this message.
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

>On Thu, May 07, 2026 at 07:36:57PM +0800, fangyu.yu@linux.alibaba.com wrote:
>...
>> diff --git a/include/linux/generic_pt/common.h b/include/linux/generic_pt/common.h
>> index fc5d0b5edadc..59448125159e 100644
>> --- a/include/linux/generic_pt/common.h
>> +++ b/include/linux/generic_pt/common.h
>> @@ -188,7 +188,10 @@ enum {
>>  	 * Support the 64k contiguous page size following the Svnapot extension.
>>  	 */
>>  	PT_FEAT_RISCV_SVNAPOT_64K = PT_FEAT_FMT_START,
>> -
>> +	/*
>> +	 * Using second-stage / iohgatp address translation.
>> +	 */
>> +	PT_FEAT_RISCV_S2,
>
>Hi Fangyu,
>
>I just sent [1], but I actually discovered that issue when testing this
>patch and finding PT_FEAT_RISCV_S2 was missing from PT_SUPPORTED_FEATURES.
>So this patch needs the same fix as [1] as well.
>

Hi Andrew,

Thanks for catching this. I'll fix it in the next revision.

>Thanks,
>drew
>
>[1] https://lore.kernel.org/all/20260818092444.42755-1-andrew.jones@oss.qualcomm.com/

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
