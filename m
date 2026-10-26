Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55201606A31A
	for <kvm-riscv@archiver.kernel.org>; Mon, 26 Oct 2026 08:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JAtUTpmN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=FF/ejPnHATNshkBQ8mEiAwtNKvXzlVSnl5i3fAM81h4=; b=JAtUTpmNQudZ5Hnu/AyX3GADiJ
	VJkrlW8cpL9R1juLZmIyHyi6tQDhgThoHmao0jdjeqtovgNnVSaVPA50iiLSTAek4boO3oPL06Elb
	BIPT8WAQcNDITJA5l/mZ2eIqtmMuVtwyr+/r6ZMM4WVoNF/8FMtVrB/UIleioOJOcgC9VtWgMCt+F
	Md71tHNoYsJqoD8x0ze+XUechZZqOeaOH2vBPqF/IGHbmNZz145fptMxBI3JU8jCBp9XIcQmosxJU
	cjeLCrLEZafqjlfUIEQPJeNuqLyuzW4xASNmLTdjglRy7cC9jERXzILaQDw1b3A300Aq+foSThDlc
	/aOZA34w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLFj0-00000001vL8-0AM0;
	Mon, 26 Oct 2026 08:06:34 +0000
Received: from mxhk.zte.com.cn ([160.30.148.34])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLFix-00000001vKa-1CfH;
	Mon, 26 Oct 2026 08:06:32 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4jCmRL3fzxz4yjSf;
	Mon, 26 Oct 2026 16:06:22 +0800 (CST)
Received: from szxl2zmapp06.zte.com.cn ([10.1.32.108])
	by mse-fl1.zte.com.cn with SMTP id 69Q865A0064039;
	Mon, 26 Oct 2026 16:06:05 +0800 (+08)
	(envelope-from gong.shuai@sanechips.com.cn)
Received: from ubuntu-35-gs (unknown [10.230.214.35])
	by smtp (Zmail) with SMTP;
	Mon, 26 Oct 2026 16:06:07 +0800
X-Zmail-TransId: 3e816adf09e6027-1935f
X-Zmail-LocalSMTP: 1
X-Zmail-RealSender: gong.shuai@sanechips.com.cn
From: Gong Shuai <gong.shuai@sanechips.com.cn>
To: fangyu.yu@linux.alibaba.com
Cc: alex@ghiti.fr, andrew.jones@oss.qualcomm.com, aou@eecs.berkeley.edu,
        gsh517025@gmail.com, guoren@kernel.org, iommu@lists.linux.dev,
        jgg@nvidia.com, jgg@ziepe.ca, joro@8bytes.org, jroedel@suse.de,
        kvm-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, palmer@dabbelt.com, pjw@kernel.org,
        robin.murphy@arm.com, tomasz.jeznach@linux.dev, will@kernel.org,
        zong.li@sifive.com, Gong Shuai <gong.shuai@sanechips.com.cn>
Subject: Re: [RFC PATCH v2 3/4] iommu/riscv: Add guest IMSIC GPA mapping helpers
Date: Mon, 26 Oct 2026 16:06:04 +0800
Message-ID: <20261026080604.184574-1-gong.shuai@sanechips.com.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261016030138.91675-1-fangyu.yu@linux.alibaba.com>
References: <20261016030138.91675-1-fangyu.yu@linux.alibaba.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ZMAIL-USEORIGINALEMLTOOUTBOUND: 1
X-MAIL: mse-fl1.zte.com.cn 69Q865A0064039
X-TLS: YES
X-ENVELOPE-SENDER: gong.shuai@sanechips.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Mon, 26 Oct 2026 16:06:22 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6ADF09FE.001/4jCmRL3fzxz4yjSf
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_010631_485496_CACBD8CD 
X-CRM114-Status: GOOD (  18.94  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Fangyu,

> >Andrew has moved well past a v3
> >
> >I shouldn't be seeing code in iommu or irq drivers directly mapping into
> >domains. That doesn't work, Andrew's latest series don't do this.
> >
> >It still needs to use the SW_MSI mechanism and related.
> >
>
> Andrew has posted two patch series in the community: one is the
> MSI remap v6 series[1], and another is the IRQ bypass v3 series[2].
> I think you are referring to the MSI remap v6 series. My patch was
> based on the IRQ bypass v3 series, and I added this patch on top
> of it.
>
> [1] https://lore.kernel.org/linux-iommu/179209292714.4133959.5997128071302263244.b4-review@b4/T/#t
> [2] https://lore.kernel.org/linux-riscv/20260928143113.49838-1-andrew.jones@oss.qualcomm.com/
>
> >Nothing in the commit messages clearly explained what this is actually for
> >without having to go dig up the riscv manuals again. Please explain how the
> >interrupt translation works and what actual user visible problem this is
> >trying to solve is.
> >
>
> The interrupt translation is based on Andrew's irq bypass patch
> description.
>
> RISC-V IOMMU defines an optional MSI page table feature, which can
> be used to implement irq bypass by translating the vIMSIC GPA to
> the pIMSIC HPA.
>
> My patch complements that design. If the RISC-V IOMMU hardware does
> not implement the MSI page table, then the second-stage page table
> can be used instead to map vIMSIC GPA to pIMSIC HPA.

Using the regular stage-2 page table to translate MSI target
addresses seems reasonable to me as a fallback for hardware without
MSI_FLAT.

I would like to share my personal understanding of Jason's review.
Please correct me if I missed his point.

His concern seems to be about who owns and maintains these mappings.
When the RISC-V IOMMU driver calls iommu_map directly on a paging
domain managed by iommufd, the mappings are not visible to the domain
owner. This makes it difficult to handle mapping lifetime and
hardware page table replacement correctly.

The current SW_MSI support does not appear to cover this use case
directly. It allocates IOVAs for host MSI pages and records the
resulting mappings. Guest forwarding instead requires mappings at
fixed guest GPAs, with their target HPAs changing when vCPUs migrate.
Supporting this through SW_MSI would therefore seem to require a
nontrivial extension.

Best regards,
Shuai

>
> Thanks,
> Fangyu
>
> >--
> >Jason
>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
