Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D363CCCA462
	for <kvm-riscv@archiver.kernel.org>; Fri, 16 Oct 2026 07:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZB6KzDORZbwo2for5TD5cUSsCl9QO7lPR8xjvGghVeo=; b=4l9tGVtAomv44w
	p8If6q2C5lc1+QEmdJCUChzzB+utzz/WczvNpzswJDwX6FaUsy5M9+CY+FFEGxBb2F5g7D5kRLAlb
	0FZdR1KntUBQ1HOwsWfa+OcLpkks5xcaRPuMHA7KPuK0OcsDecNpZYnMAB0GiYLd6gjofr16mNpHQ
	wXdMthXIGbiwVOtTSzEVvDl2u9nwRLlzbRZEiemaW6KCPc/WyNg33VZ7FeARM6mhNYngDfXxSWVOP
	dm9NNXK5eaLjJZRCvg+RDmsFBbMDHd+LHRoepAoQ8kabbXZArrmU6JwALrPV58CGZO05mHrDf0Ouy
	KinV3ZSJlJunsWqu/KGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHcbi-00000002Ftf-42m0;
	Fri, 16 Oct 2026 07:44:02 +0000
Received: from mxhk.zte.com.cn ([160.30.148.35])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHcbg-00000002FrX-0c8s;
	Fri, 16 Oct 2026 07:44:01 +0000
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4j5cQ00PmPz8XrrJ;
	Fri, 16 Oct 2026 15:43:52 +0800 (CST)
Received: from szxlzmapp01.zte.com.cn ([10.5.231.85])
	by mse-fl2.zte.com.cn with SMTP id 69G7hiin088882;
	Fri, 16 Oct 2026 15:43:44 +0800 (+08)
	(envelope-from gong.shuai@sanechips.com.cn)
Received: from ubuntu-35-gs (unknown [10.230.214.35])
	by smtp (Zmail) with SMTP;
	Fri, 16 Oct 2026 15:43:45 +0800
X-Zmail-TransId: 3e816ad1d59f024-b85a8
X-Zmail-LocalSMTP: 1
X-Zmail-RealSender: gong.shuai@sanechips.com.cn
From: Gong Shuai <gong.shuai@sanechips.com.cn>
To: jgg@ziepe.ca
Cc: alex@ghiti.fr, andrew.jones@oss.qualcomm.com, anup@brainfault.org,
        aou@eecs.berkeley.edu, atish.patra@linux.dev,
        fangyu.yu@linux.alibaba.com, gong.shuai@sanechips.com.cn,
        gsh517025@gmail.com, iommu@lists.linux.dev, joro@8bytes.org,
        kevin.tian@intel.com, kvm-riscv@lists.infradead.org,
        kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, palmer@dabbelt.com,
        pbonzini@redhat.com, pjw@kernel.org, robin.murphy@arm.com,
        seanjc@google.com, tomasz.jeznach@linux.dev, will@kernel.org,
        wu.fei9@sanechips.com.cn, zhao.qingye@sanechips.com.cn
Subject: Re: [RFC PATCH 07/12] iommufd: Add RISC-V IOMMU hardware info type
Date: Fri, 16 Oct 2026 15:43:27 +0800
Message-ID: <20261016074327.10809-1-gong.shuai@sanechips.com.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261015235534.GA14213@ziepe.ca>
References: <20261015235534.GA14213@ziepe.ca>
MIME-Version: 1.0
X-ZMAIL-USEORIGINALEMLTOOUTBOUND: 1
X-MAIL: mse-fl2.zte.com.cn 69G7hiin088882
X-TLS: YES
X-ENVELOPE-SENDER: gong.shuai@sanechips.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Fri, 16 Oct 2026 15:43:52 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AD1D5B8.000/4j5cQ00PmPz8XrrJ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_004400_335892_24B1D599 
X-CRM114-Status: UNSURE (   5.13  )
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

Hi Jason,

> > +/**
> > + * struct iommu_hw_info_riscv - RISC-V IOMMU device info
> > + * @capabilities: Value of RISC-V IOMMU Capabilities register
> > + */
> > +struct iommu_hw_info_riscv {
> > +	__u64 capabilities;
> > +};
> > +
>
> Same here, spec reference.
>
> Also be careful to always use __aligned_u64, check all the patches.

Will add the spec reference ("IOMMU capabilities (capabilities)") and
switch to __aligned_u64. I checked the uAPI structures touched by this
series, and this is the only place that used __u64.

Thanks,
Shuai

>
> JAson

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
