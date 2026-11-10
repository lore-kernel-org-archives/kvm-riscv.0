Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D9E606B58B
	for <kvm-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 11:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KmRNsUmE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XCZa3Trc8N1xDZOemjJXdEuYPLNp4PuaUQJns9blMR0=; b=KmRNsUmEAUHGc6Uwfh3aBv1LXj
	dW3ED3JoDtGcstK+4UgDe+nayQGKhZrpAIwPFOH5ZpJ0c0BHuXm5bgzZHi4KWvQdWV2QE+uxVXvbD
	zju61MmHGGJNqFtYPFZK0MiSjRGlJnwKOd2G6biah5Tcl5D8onbXm4vlZVs83eShwMG6JAP3y2l6J
	cACNxce8Kw28FRSvDev0QCcZTbRFrx+Yxa3bAq4+N91V7bFpVNvBvRt0ZjIv4nGFCSGiiJnZl0PYh
	aSlyvuR8+64YH5bdLbYBdciEYMZIlf3wELKYPDsgoIBLgM+Ye5xWmiWuuUvtRnPBu5kaK2AeaPz4s
	An7cIXeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQkOU-00000003hw7-1hNr;
	Tue, 10 Nov 2026 11:52:06 +0000
Received: from mxhk.zte.com.cn ([160.30.148.35])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQkOR-00000003htD-2rX4;
	Tue, 10 Nov 2026 11:52:05 +0000
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4jP4kc0NQRz8XrrX;
	Tue, 10 Nov 2026 19:51:52 +0800 (CST)
Received: from szxl2zmapp06.zte.com.cn ([10.1.32.108])
	by mse-fl2.zte.com.cn with SMTP id 6AABpdZk005559;
	Tue, 10 Nov 2026 19:51:39 +0800 (+08)
	(envelope-from gong.shuai@sanechips.com.cn)
Received: from ubuntu-35-gs (unknown [10.230.214.35])
	by smtp (Zmail) with SMTP;
	Tue, 10 Nov 2026 19:51:42 +0800
X-Zmail-TransId: 3e816af3054502b-e4c51
X-Zmail-LocalSMTP: 1
X-Zmail-RealSender: gong.shuai@sanechips.com.cn
From: Gong Shuai <gong.shuai@sanechips.com.cn>
To: tanchi25@mails.ucas.ac.cn
Cc: alex@ghiti.fr, andrew.jones@oss.qualcomm.com, anup@brainfault.org,
        aou@eecs.berkeley.edu, atish.patra@linux.dev,
        fangyu.yu@linux.alibaba.com, gong.shuai@sanechips.com.cn,
        gsh517025@gmail.com, iommu@lists.linux.dev, jgg@ziepe.ca,
        joro@8bytes.org, kevin.tian@intel.com, kvm-riscv@lists.infradead.org,
        kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, palmer@dabbelt.com,
        pbonzini@redhat.com, pjw@kernel.org, robin.murphy@arm.com,
        seanjc@google.com, tomasz.jeznach@linux.dev, will@kernel.org,
        wu.fei9@sanechips.com.cn, zhao.qingye@sanechips.com.cn
Subject: Re: [RFC PATCH v2 9/9] iommu/riscv: Add riscv_iommu_attach_dev_nested
Date: Tue, 10 Nov 2026 19:51:37 +0800
Message-ID: <20261110115137.184160-1-gong.shuai@sanechips.com.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105144944.10193-1-tanchi25@mails.ucas.ac.cn>
References: <20261105144944.10193-1-tanchi25@mails.ucas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ZMAIL-USEORIGINALEMLTOOUTBOUND: 1
X-MAIL: mse-fl2.zte.com.cn 6AABpdZk005559
X-TLS: YES
X-ENVELOPE-SENDER: gong.shuai@sanechips.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Tue, 10 Nov 2026 19:51:52 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AF30558.000/4jP4kc0NQRz8XrrX
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_035204_063085_673B9486 
X-CRM114-Status: GOOD (  19.74  )
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

Hi Tan Chi,

Thanks for your review and for pointing these out.

> Hi Shuai and Fei,
> 
> I noticed a potential issue with fixing the physical DC's PSCID to 0.
> 
> In QEMU, different VFIO devices can have separate stage-1 HWPTs while
> sharing the same vIOMMU and stage-2 parent. This means two devices may
> have different first-stage page table roots but the same host GSCID
> and PSCID=0.
> 
> According to the RISC-V IOMMU specification, DC.ta.PSCID identifies
> the first-stage address space when PDTV=0 and the first stage is not
> Bare. Could this cause the physical IOMMU to reuse cached translations
> across different stage-1 address spaces? Even broader invalidations
> would not prevent such cache aliasing.

You are right. We kept PSCID at zero as a simplification for the RFC,
but this was based on a misunderstanding of the PSCID semantics. When
PDTV=0 and stage 1 is not Bare, DC.ta.PSCID identifies the S1
address space. Sharing it across different page tables can cause cached
translations to alias.

> 
> There also seems to be a related issue in patch 6.
> riscv_viommu_cache_invalidate() unconditionally forces PSCV=1 and
> PSCID=0. However, an IOTINVAL.VMA with PSCV=0 also invalidates global
> mappings, while PSCV=1 excludes them. This appears to narrow the
> guest's requested invalidation scope and could leave stale global
> translations cached.

Agreed.

> 
> One possible approach might be to use the PSCID from the guest-provided
> DC.ta when allocating the nested domain, and preserve the guest's PSCID
> and PSCV settings during invalidation while substituting the host GSCID.
> I'm not sure whether additional considerations are needed for PSCID
> reuse or domain lifetime, though.

Thanks for the suggestion. While analyzing this issue, we found that
using the guest PSCID is the right direction, but preserving it alone
is not sufficient when multiple vIOMMUs share the same host GSCID.
Different vIOMMUs may have independent guest PSCID namespaces, so two
vIOMMUs sharing an S2 parent may use the same guest PSCID for different
S1 address spaces.

My understanding is that the ultimate goal is to ensure that the
(GSCID, PSCID) pair programmed into the physical DC uniquely identifies
the correct nested address space, and therefore the cached translations
belonging to it.

So far, we have identified three possible approaches:

  1. Share the S2 parent's GSCID and use the guest PSCID directly.

     This requires PSCID uniqueness across all vIOMMUs sharing that S2
     parent, so that different S1 address spaces cannot be assigned the
     same (GSCID, PSCID) pair. This uniqueness can be provided by the
     guest itself or through VMM/guest coordination.

     The current ARM mainline model similarly uses the guest ASID directly
     while inheriting the VMID from the S2 parent. For Linux guests, the
     SMMUv3 driver's global ASID allocator can provide ASID uniqueness
     across vSMMUs. The Linux RISC-V driver also uses a global PSCID
     allocator. The main question is whether we want to rely on this
     guest implementation property.

  2. Use the guest PSCID directly, but allocate a separate host GSCID for
     each vIOMMU.

     This allows independent vIOMMUs to reuse the same guest PSCID without
     aliasing, even when they share an S2 parent.

     The proposed ARM series follows this model by moving VMID allocation
     from the S2 domain to the vSMMU [1].

  3. Share the GSCID and maintain a per-vIOMMU mapping from each guest
     PSCID to a host-allocated PSCID.

     AMD mainline uses an analogous model for DomID. It maintains a
     per-vIOMMU gDomID-to-hDomID mapping and programs the mapped hDomID
     into the physical DTE.

Option 2 seems better because it gives each vIOMMU its own GSCID, which
isolates the PSCID namespace of each vIOMMU without requiring a mapping
table or relying on a guest implementation property such as a global
PSCID allocator. Its main costs are additional GSCID consumption and the
need to invalidate each vIOMMU's GSCID whenever the shared S2 parent
changes. I would appreciate your thoughts on which approach we should
take.

[1] https://lore.kernel.org/lkml/05dd00dcb2f0d077f59bcbccac1820534ad7b5cf.1773949042.git.nicolinc@nvidia.com/

Thanks,
Shuai

> 
> Thanks,
> Tan Chi
> 

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
