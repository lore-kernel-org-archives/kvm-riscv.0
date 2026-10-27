Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB14606A32F
	for <kvm-riscv@archiver.kernel.org>; Tue, 27 Oct 2026 14:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yu9mq/gR;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=s/KK8D3s
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=EIuATy9BoJSP/9PmWJHbEukVgy/xtZnDgq9WIBS7Vkc=; b=yu9mq/gRKD772S+anJu/k3KcnK
	ZneJ8uKW0O0eZ8VkZI6Z/wGGF0dXxWI04Y0EbL1i0fn8xCsnumMzE2LKUzui47WFdF3YvamtQSbfO
	mNIrtHcPoyWzXd4z5dLSafohRnQv6T8czsiuZO51aDcMgl4N7Rwi7eyMgf3Sqqftqh9rZGoNOZaiZ
	V05Co6C8krBGTwDUnZyHZygyD215/MfyzxmtJs8HuxB0uxzdsTX1rclFhaYAB4qp/Om9MVBLUjG4A
	OLBRoyOuhjMWA6SmheUyjVi8ok9aarx/VQeeK8siim0d3zdstXFA9sCM4mSnMoiFj+hoHoP+O6dCX
	NnqP/X8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLhrC-00000004zAj-0lPZ;
	Tue, 27 Oct 2026 14:08:54 +0000
Received: from out30-113.freemail.mail.aliyun.com ([115.124.30.113])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLhr9-00000004z9U-25i6;
	Tue, 27 Oct 2026 14:08:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793110123; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=pJDcTOL3vwPjyTTZ32hN77pZkCa+SzNVB78DIO/TIG0=;
	b=s/KK8D3syykh1B5TgfiJrbM75HCg8O+pz4OrTda4A68vQGqJy9vX6kH1uYkrCps0CmhTG1L5FIzw3D9eEVPkX9zjwFlczqTDOVjZd9yBe54xVVdTbQJZ6Eg/7hZQZj3X3SnwngH+EyrqVeKeb/EPFL38WJ3zws8Xz3hwlx4TpzQ=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=21;SR=0;TI=SMTPD_---0XDe7Dwu_1793110121;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0XDe7Dwu_1793110121 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 27 Oct 2026 22:08:42 +0800
From: fangyu.yu@linux.alibaba.com
To: gong.shuai@sanechips.com.cn
Cc: alex@ghiti.fr,
	andrew.jones@oss.qualcomm.com,
	aou@eecs.berkeley.edu,
	fangyu.yu@linux.alibaba.com,
	gsh517025@gmail.com,
	guoren@kernel.org,
	iommu@lists.linux.dev,
	jgg@nvidia.com,
	jgg@ziepe.ca,
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
Date: Tue, 27 Oct 2026 22:08:37 +0800
Message-Id: <20261027140837.84112-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20261026080604.184574-1-gong.shuai@sanechips.com.cn>
References: <20261026080604.184574-1-gong.shuai@sanechips.com.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_070852_086700_4F91B392 
X-CRM114-Status: GOOD (  20.53  )
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
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

>Hi Fangyu,
>
>> >Andrew has moved well past a v3
>> >
>> >I shouldn't be seeing code in iommu or irq drivers directly mapping into
>> >domains. That doesn't work, Andrew's latest series don't do this.
>> >
>> >It still needs to use the SW_MSI mechanism and related.
>> >
>>
>> Andrew has posted two patch series in the community: one is the
>> MSI remap v6 series[1], and another is the IRQ bypass v3 series[2].
>> I think you are referring to the MSI remap v6 series. My patch was
>> based on the IRQ bypass v3 series, and I added this patch on top
>> of it.
>>
>> [1] https://lore.kernel.org/linux-iommu/179209292714.4133959.5997128071302263244.b4-review@b4/T/#t
>> [2] https://lore.kernel.org/linux-riscv/20260928143113.49838-1-andrew.jones@oss.qualcomm.com/
>>
>> >Nothing in the commit messages clearly explained what this is actually for
>> >without having to go dig up the riscv manuals again. Please explain how the
>> >interrupt translation works and what actual user visible problem this is
>> >trying to solve is.
>> >
>>
>> The interrupt translation is based on Andrew's irq bypass patch
>> description.
>>
>> RISC-V IOMMU defines an optional MSI page table feature, which can
>> be used to implement irq bypass by translating the vIMSIC GPA to
>> the pIMSIC HPA.
>>
>> My patch complements that design. If the RISC-V IOMMU hardware does
>> not implement the MSI page table, then the second-stage page table
>> can be used instead to map vIMSIC GPA to pIMSIC HPA.
>
>Using the regular stage-2 page table to translate MSI target
>addresses seems reasonable to me as a fallback for hardware without
>MSI_FLAT.
>
>I would like to share my personal understanding of Jason's review.
>Please correct me if I missed his point.
>
>His concern seems to be about who owns and maintains these mappings.
>When the RISC-V IOMMU driver calls iommu_map directly on a paging
>domain managed by iommufd, the mappings are not visible to the domain
>owner. This makes it difficult to handle mapping lifetime and
>hardware page table replacement correctly.
>

Hi Shuai,

Thanks for the review.

Before going further, I want to make sure I answer the actual
question. If the concern is about who owns and maintains these
mappings, I address that below.

The iommu_map() and replace_leaf() calls are not a separate
mapping facility added next to the forwarding code. They are
two steps in the existing interrupt-forwarding state machine
driven from iommu-ir.c:

  - first FORWARD:      flat -> MSIPTE written /
                        noflat -> S2 PTE installed
  - UPDATE_TARGET:      flat -> MSIPTE updated /
                        noflat -> replace_leaf()
                         (only if the VS-file page moved)
  - last unforward:     flat -> MSI table deactivated /
                        noflat -> S2 PTE removed

So the lifetime of the S2 mapping matches the lifetime of the
forwarding session, which is the same rule the MSI page table
already follows. The driver is the only layer that sees both
the forwarding session (device <-> vCPU) and the paging domain
used to translate guest MSI writes, so it is also the only
layer that can maintain this mapping.

Note that the noflat column of the last row is not in v2: v2
only frees the bookkeeping when the domain is torn down. In
v3, I revoke the S2 entries both when the last forwarded IRQ
in the domain is released and at domain free, so the entry
lifetime becomes identical to the MSIPTE lifetime.

Thanks,
Fangyu

>The current SW_MSI support does not appear to cover this use case
>directly. It allocates IOVAs for host MSI pages and records the
>resulting mappings. Guest forwarding instead requires mappings at
>fixed guest GPAs, with their target HPAs changing when vCPUs migrate.
>Supporting this through SW_MSI would therefore seem to require a
>nontrivial extension.
>
>Best regards,
>Shuai
>
>>
>> Thanks,
>> Fangyu
>>
>> >--
>> >Jason
>>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
