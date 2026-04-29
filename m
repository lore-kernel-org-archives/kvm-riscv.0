Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88737FF8875
	for <kvm-riscv@archiver.kernel.org>; Wed, 29 Apr 2026 01:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5lead0LAcM8LZO+lYgpvsua9E27CXarGEKNP1GRoDYw=; b=zx5GomqYQ83c3a
	Y0mWwKZt+JRHf+5Kud1spEqV8LjFvA+77Lx+V9W/980QvW+5gElFRjw6F+x0270RM462Ox6JSAUdA
	cn3PnltL/giA0+fs3yZRLEe3hjwYm/YdgkU9mRtmSME8nTH4aD220wPQkp2GQo+wG231TNvlXUnbo
	ol7PWytklkhRabo6GjDtbIvs/qEjmQ3uAiidxC60uMBMkp1JYkNmF7KpF4G0tjbrSeQI5M3z82k/x
	kk4sToXbTf1pg8lvKxY7HIZCHNN1yn/aZyycGhprGM6zYOYuei0FMpm82/Td28jUURESAAsTihToG
	+6zZB3BlVT+4a4MzTa9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHtWW-00000002hev-08tk;
	Wed, 29 Apr 2026 01:15:32 +0000
Received: from out30-97.freemail.mail.aliyun.com ([115.124.30.97])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHtWT-00000002he1-0Wki;
	Wed, 29 Apr 2026 01:15:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1777425325; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=xWnII7NbedrCecv32Wz7AYnJB6oJuNa7XLMjqnf42ng=;
	b=d7AdNmsLQCnRsf+Gv/1Awdemh5I1CO8FJ9EBGw8TvjCMs4Gb3PNmqLSWp75UA2AIB3/UHKE3tRiaDdbyyL8v6CqoRWwhQew2v53Ko5h3V0DLQ7qqULCynqFUCdlSk0YJ7DLo1/pUxLGQFBhCQLdyXvRV0EPVCTQ494xJIvLb/zs=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R861e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=22;SR=0;TI=SMTPD_---0X1vlEBh_1777425321;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0X1vlEBh_1777425321 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 29 Apr 2026 09:15:23 +0800
From: fangyu.yu@linux.alibaba.com
To: jgg@ziepe.ca
Cc: alex@ghiti.fr,
	anup@brainfault.org,
	aou@eecs.berkeley.edu,
	atish.patra@linux.dev,
	baolu.lu@linux.intel.com,
	fangyu.yu@linux.alibaba.com,
	guoren@kernel.org,
	iommu@lists.linux.dev,
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
Subject: Re: Re: [RFC PATCH 02/11] iommu/riscv: report iommu capabilities  
Date: Wed, 29 Apr 2026 09:15:20 +0800
Message-Id: <20260429011520.62812-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20260428133324.GD849557@ziepe.ca>
References: <20260428133324.GD849557@ziepe.ca>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_181529_511086_0DE68073 
X-CRM114-Status: UNSURE (   3.13  )
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

>> +static bool riscv_iommu_capable(struct device *dev, enum iommu_cap cap)
>> +{
>> +	switch (cap) {
>> +	case IOMMU_CAP_CACHE_COHERENCY:
>> +	case IOMMU_CAP_DEFERRED_FLUSH:
>
>IOMMU_CAP_DEFERRED_FLUSH is not needed in v7.1

Thanks, I will drop IOMMU_CAP_DEFERRED_FLUSH.

>
>Jason

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
