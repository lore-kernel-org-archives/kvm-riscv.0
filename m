Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73553CD37B5
	for <kvm-riscv@archiver.kernel.org>; Mon, 11 May 2026 08:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R+DVeCWK1Bx1kK4/9kKY2zmYfgY81cCQYb/qM5PInEg=; b=A5VeekzfVX3jQH
	AxyrbIJju/IwDgn9U9mVe9E/4QN+mkEF+lxIjC2eInGO2Sr8jXVgn/xuht5s23TA5n42Bfdp/z6vM
	NSExrHC6yVK86uhHVVqSOsxAxKfH7RkMh2BFIBddJqH44i3C+OJN9sgqhHat9EUVlCJIU/K/YSJxN
	n4mWlJn6T7m028Urd/wTZQUXFm4ZpcpLhO+pMaES0FOIIhbpu9HPfO9OjBAh/NYNEx730p6/v0PYj
	/4fg6O/g/9LC2qIjVt4AziPUwqGKuIQXgec2YYh5ofPoM9s4no63pFnFfvn/VHfYQUVU5pSSCrgdK
	pnjEWA29ZPTq/Go5dHKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMLdR-0000000ChNb-0baD;
	Mon, 11 May 2026 08:05:05 +0000
Received: from mail.8bytes.org ([2a01:238:42d9:3f00:e505:6202:4f0c:f051])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMLdO-0000000ChMt-3wBR;
	Mon, 11 May 2026 08:05:04 +0000
Received: from 8bytes.org (p200300f6af1d9600f5faa5cebd6c042e.dip0.t-ipconnect.de [IPv6:2003:f6:af1d:9600:f5fa:a5ce:bd6c:42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id E325C1C44A0;
	Mon, 11 May 2026 10:05:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1778486701;
	bh=pa5tgQNRYAqre11FvOMaG2NhKeiv0GAPLES/9LGkknw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=6KQrrIvHg6gY7RnIbOxVI7UxT4T6LfcIcf5KiYvG7Xl6CDy61f+m1FJ+vL8UiRUWR
	 /2zG74QxeJM9wR9URpA6YWkQmqLH4VhBw+QwNgTFVS+YNe5o9VwyOgy3HOOejQ/oUG
	 h3A1pgHJnAbvQqIiipQcKuA4uyBNhJdbX6MR2xHi/hdYGTEXok4plSVUzu4L6Ecwt4
	 z07CRIqv/ywLTwZqVUQod5VzB7zqNxYp1a+0U8f6cRq39eG/ssltr2ROMXmyqM6Ji4
	 6ywQ7fD9rVaqFrRh4B/rHosQG7hMqtqlKXGSAdWTxHoGYvQ5RPiWVN79QN7znz8ymU
	 WRTCa386CECyQ==
Date: Mon, 11 May 2026 10:04:59 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: fangyu.yu@linux.alibaba.com
Cc: will@kernel.org, robin.murphy@arm.com, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, tjeznach@rivosinc.com, 
	jgg@ziepe.ca, kevin.tian@intel.com, baolu.lu@linux.intel.com, 
	vasant.hegde@amd.com, anup@brainfault.org, nutty.liu@hotmail.com, jgg@nvidia.com, 
	guoren@kernel.org, iommu@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] iommu/riscv: Support Svpbmt memory types in
 generic_pt
Message-ID: <k6k2ufkol6trxucf32qxj5i2v7safcyososquomqr7vavqwvr7@s4b6h26htu4x>
References: <20260417140746.97817-1-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260417140746.97817-1-fangyu.yu@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_010503_194562_15B9A667 
X-CRM114-Status: UNSURE (   6.96  )
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

On Fri, Apr 17, 2026 at 10:07:44PM +0800, fangyu.yu@linux.alibaba.com wrote:
> Fangyu Yu (2):
>   iommu/riscv: Advertise Svpbmt support to generic page table
>   iommupt: Encode IOMMU_MMIO/IOMMU_CACHE via RISC-V Svpbmt bits
> 
>  drivers/iommu/generic_pt/fmt/riscv.h | 11 ++++++++++-
>  drivers/iommu/riscv/iommu.c          |  2 ++
>  include/linux/generic_pt/common.h    |  4 ++++
>  3 files changed, 16 insertions(+), 1 deletion(-)

Applied this one instead of v2.

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
