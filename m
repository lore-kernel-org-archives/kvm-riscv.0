Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4CDDCCA46D
	for <kvm-riscv@archiver.kernel.org>; Fri, 16 Oct 2026 07:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zFk/Cssw9FKDYgn32AnqRiZKJaz3qrS0zm4ePYcJiCQ=; b=VGiY+AURDOdVFI
	Vk0m+W7aY30OD+rLV6RlmnCx7BPyk4fDd1blARZxC5iHTvIk9Key07rIANPucn6Roqav5cfD/45Q6
	lHnlhNAr1ezD0nmOlYFdkyH9iua509QtUE6oUi5MOn3fJ0VGz9yjvsJtFbIzNsv/PADF8775bEuaA
	qu1rewMZImUaGFeOSa33OhdWaSqdLt9xhGLDOOGzN/TlLgB1z4F7o8xkgNmbl3M5iTulZUqhFv3Cf
	s8OYP+IMv0NcT1q+rBahSu9pQJPZcQQAYFxrkpBuKrOpVmecAEW+8kiLN+rQuYhljIndElLJH9JWe
	9gpMMJRiZFFTzwNdCdhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHcOx-00000002EWn-0uOq;
	Fri, 16 Oct 2026 07:30:51 +0000
Received: from mxct.zte.com.cn ([183.62.165.209])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHcOu-00000002EWK-3t4E;
	Fri, 16 Oct 2026 07:30:50 +0000
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4j5c6Y2TVkz5B0lT;
	Fri, 16 Oct 2026 15:30:29 +0800 (CST)
Received: from szxl2zmapp05.zte.com.cn ([10.1.32.37])
	by mse-fl2.zte.com.cn with SMTP id 69G7UOtm070340;
	Fri, 16 Oct 2026 15:30:24 +0800 (+08)
	(envelope-from gong.shuai@sanechips.com.cn)
Received: from ubuntu-35-gs (unknown [10.230.214.35])
	by smtp (Zmail) with SMTP;
	Fri, 16 Oct 2026 15:30:26 +0800
X-Zmail-TransId: 3e816ad1d28c024-b7501
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
Subject: Re: [RFC PATCH 02/12] iommufd: Add RISC-V IOMMU hwpt and vIOMMU types
Date: Fri, 16 Oct 2026 15:30:20 +0800
Message-ID: <20261016073020.10119-1-gong.shuai@sanechips.com.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261015235400.GZ14213@ziepe.ca>
References: <20261015235400.GZ14213@ziepe.ca>
MIME-Version: 1.0
X-ZMAIL-USEORIGINALEMLTOOUTBOUND: 1
X-MAIL: mse-fl2.zte.com.cn 69G7UOtm070340
X-TLS: YES
X-ENVELOPE-SENDER: gong.shuai@sanechips.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Fri, 16 Oct 2026 15:30:29 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AD1D295.000/4j5c6Y2TVkz5B0lT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_003049_131055_D12F16E1 
X-CRM114-Status: UNSURE (   8.91  )
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

Thank you for your review.

> > +/**
> > + * struct iommu_hwpt_riscv - RISC-V IOMMU stage-1 page table data
> > + *			     (IOMMU_HWPT_DATA_RISCV_S1)
> > + * @tc: Guest device context translation control
> > + * @iosatp: Guest device context stage-1 root page table pointer
> > + */
> > +struct iommu_hwpt_riscv {
> > +	__aligned_u64 tc;
> > +	__aligned_u64 iosatp;
> > +};
>
> Like the others you need a spec reference explaining exactly what
> these fields are.

I'll add references to the device-context sections of the RISC-V IOMMU
specification ("Leaf DDT entry", "Device-context fields", "Translation
control (tc)", and "First-Stage context (fsc)"), and I'll also include
detailed field information, as ARM does.

Also, I'll rename the field from iosatp to fsc. It holds iosatp when
PDTV=0 and process-directory-table pointer (pdtp) when PDTV=1, and the
two share the same layout, so the name should cover both interpretations
and the uAPI won't need to change when Process-Directory-Table (PDT)
support is added.

>
> Usually it should be the entire guest structure, is it only 16 bytes?

The RISC-V device-context is 32 bytes in base format and 64 bytes in
extended format, but it is not entirely guest-owned in a nested setup:
iohgatp, ta and the extended-format MSI fields are configured by the host.

The guest-owned part is therefore exactly tc and fsc fields, so 16 bytes
is all we take.

Thanks,
Shuai

>
> But this looks broadly right otherwise
>
> Jason

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
