Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64641606A332
	for <kvm-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 12:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NtQgLyew
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=FyPssZts9kfP9A7ql1Pfa1rblwUIfSlhIHjv2IJ8L9M=; b=NtQgLyewzFC3dwaqhX0D6Gj6tK
	x0fuNrJ6YHUgBT2CWV7/+faTOKfN2iVDYr8kWHX4XkRoNzE+7UYsGneWR7JEbuX1zTcO6FtWxd5M7
	BPh29nnLbBv8V/gViBbrxenclJyLy+86KsMI85aMBcNCM9dC2FaRe5EQJVTKqcONno74OX17+wCPU
	XPaCjfNYtc+3vQKcCDwwDDXor2KyP2PGSugS+1b8ypt9y3RbAM7msJI4iT+Zhh2tVFzxkU15GSfYc
	THdMbhydRP/dE76iUaktNqJCNzR+d+torngL/y2WlVBMJXerjDLY0osZDNv9CUmJ2Ll3Xv2c7zyQX
	DJGTil3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQkXh-00000003jAG-3cDH;
	Tue, 10 Nov 2026 12:01:37 +0000
Received: from mxhk.zte.com.cn ([160.30.148.34])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQkXe-00000003j9Z-3IgE;
	Tue, 10 Nov 2026 12:01:36 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4jP4xl36c4z5PkGn;
	Tue, 10 Nov 2026 20:01:31 +0800 (CST)
Received: from szxlzmapp01.zte.com.cn ([10.5.231.85])
	by mse-fl1.zte.com.cn with SMTP id 6AAC1K6X083645;
	Tue, 10 Nov 2026 20:01:20 +0800 (+08)
	(envelope-from gong.shuai@sanechips.com.cn)
Received: from ubuntu-35-gs (unknown [10.230.214.35])
	by smtp (Zmail) with SMTP;
	Tue, 10 Nov 2026 20:01:23 +0800
X-Zmail-TransId: 3e816af3078a02b-e5a48
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
        seanjc@google.com, tanchi25@mails.ucas.ac.cn, tomasz.jeznach@linux.dev,
        will@kernel.org, wu.fei9@sanechips.com.cn,
        zhao.qingye@sanechips.com.cn
Subject: Re: [RFC PATCH v2 9/9] iommu/riscv: Add riscv_iommu_attach_dev_nested
Date: Tue, 10 Nov 2026 20:01:18 +0800
Message-ID: <20261110120119.184759-1-gong.shuai@sanechips.com.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105183222.GE663069@ziepe.ca>
References: <20261105183222.GE663069@ziepe.ca>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ZMAIL-USEORIGINALEMLTOOUTBOUND: 1
X-MAIL: mse-fl1.zte.com.cn 6AAC1K6X083645
X-TLS: YES
X-ENVELOPE-SENDER: gong.shuai@sanechips.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Tue, 10 Nov 2026 20:01:31 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AF3079B.001/4jP4xl36c4z5PkGn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_040135_011695_E6B25167 
X-CRM114-Status: GOOD (  21.10  )
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
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jason,

> On Thu, Nov 05, 2026 at 10:49:44PM +0800, Tan Chi wrote:
> > Hi Shuai and Fei,
> > 
> > I noticed a potential issue with fixing the physical DC's PSCID to 0.
> > 
> > In QEMU, different VFIO devices can have separate stage-1 HWPTs while
> > sharing the same vIOMMU and stage-2 parent. This means two devices may
> > have different first-stage page table roots but the same host GSCID
> > and PSCID=0.
> > 
> > According to the RISC-V IOMMU specification, DC.ta.PSCID identifies
> > the first-stage address space when PDTV=0 and the first stage is not
> > Bare. Could this cause the physical IOMMU to reuse cached translations
> > across different stage-1 address spaces? Even broader invalidations
> > would not prevent such cache aliasing.
> > 
> > There also seems to be a related issue in patch 6.
> > riscv_viommu_cache_invalidate() unconditionally forces PSCV=1 and
> > PSCID=0. However, an IOTINVAL.VMA with PSCV=0 also invalidates global
> > mappings, while PSCV=1 excludes them. This appears to narrow the
> > guest's requested invalidation scope and could leave stale global
> > translations cached.
> > 
> > One possible approach might be to use the PSCID from the guest-provided
> > DC.ta when allocating the nested domain, and preserve the guest's PSCID
> > and PSCV settings during invalidation while substituting the host GSCID.
> > I'm not sure whether additional considerations are needed for PSCID
> > reuse or domain lifetime, though.
> 
> If the guest is issuing invalidations you must always preserve the
> guests "ASID" or whatever your HW calls it. It can be virtualized and
> mapped from a guest view to physical, but it must be preserved and
> physical must be 1:1 with virtual.
> 
> Jason

Thanks for clarifying the software responsibility and the 1:1 mapping
requirement. We will not drop this "ASID/PSCID" or collapse it to zero
in the next version.

I have outlined the approaches we are considering in my reply to Tan Chi.
I would very much appreciate your thoughts on which approach would be
preferable for RISC-V, and on any potential pitfalls we should keep in
mind.

Thanks,
Shuai

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
