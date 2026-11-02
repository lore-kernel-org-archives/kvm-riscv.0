Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271F2606A33A
	for <kvm-riscv@archiver.kernel.org>; Mon,  2 Nov 2026 13:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4Pry6G9X;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=QeYoBMKD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GlQ1iUx+6gDFjWsQ2vFXm5c84rlIVyOuhWdsuxgUoas=; b=4Pry6G9X74zsUHNQWddKCiQle1
	NIb6y+BQFaW3y989nEGmxg21Z0bd7aIWVhwTKvYVvPArZrp2zQg+sL5gQxidfApyH4RsLLdDIsdE0
	ptAO43BP2cIUJ+E+//gJhmlXy8BB/D4qweOLtZnvcHKaVmBQqWgLhwLEBO8b+JBEKueclDFiQwBs8
	X5NzPI3RisHV2cAUiq05sf6qcOMKd3Kdziiq+H9XD8jZm7sPKiIorBH98xwzhoph6ebdEx+i2ig1K
	HhQidGBXXmr6i8ccJZan7piCIUMVF4ggRZuWvepAY5h5hY+VVEheErEXJB41bLRdncQeWQxT5w7k0
	A5Afcxdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNrzJ-0000000GagH-2XX8;
	Mon, 02 Nov 2026 13:22:13 +0000
Received: from out30-111.freemail.mail.aliyun.com ([115.124.30.111])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNrzF-0000000Gado-43zp;
	Mon, 02 Nov 2026 13:22:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793625722; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=djgnkC1S9SsBayDDJz8CWP9esVizW3/CZWCKQKY14tA=;
	b=QeYoBMKDxKRDUaZMQ2pg46rSklZLQJDoZ37hFSoyJ011TG0wTvNDqpCbRi2tgSbtxn/praKpXn+5A/IkUd2UNPs63sqpB3ZbeEnSHtXDYX+1N+zsK2ueEBKzqt6khF2dSFaEeNi2G5xWwdCyP7gEpX7oum/4rlNSxhcPX22Ef0E=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R931e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=28;SR=0;TI=SMTPD_---0XE-KG9J_1793625716;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0XE-KG9J_1793625716 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 02 Nov 2026 21:21:58 +0800
From: fangyu.yu@linux.alibaba.com
To: jgg@ziepe.ca
Cc: alex@ghiti.fr,
	andrew.jones@linux.dev,
	anup@brainfault.org,
	aou@eecs.berkeley.edu,
	atish.patra@linux.dev,
	baolu.lu@linux.intel.com,
	fangyu.yu@linux.alibaba.com,
	gong.shuai@sanechips.com.cn,
	guoren@kernel.org,
	iommu@lists.linux.dev,
	joerg.roedel@amd.com,
	joro@8bytes.org,
	jroedel@suse.de,
	kevin.tian@intel.com,
	kvm-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	nutty.liu@hotmail.com,
	palmer@dabbelt.com,
	pjw@kernel.org,
	robin.murphy@arm.com,
	skhawaja@google.com,
	tanchi25@mails.ucas.ac.cn,
	tomasz.jeznach@linux.dev,
	vasant.hegde@amd.com,
	will@kernel.org,
	zong.li@sifive.com
Subject: Re: [PATCH v6 09/10] iommu/riscv: Add dirty tracking support for second-stage domains 
Date: Mon,  2 Nov 2026 21:21:51 +0800
Message-Id: <20261102132151.52507-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20261102131356.GA274202@nvidia.com>
References: <20261102131356.GA274202@nvidia.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_052211_039195_3CF21BE9 
X-CRM114-Status: GOOD (  10.17  )
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
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

>> >@@ -1439,6 +1454,9 @@ static int riscv_iommu_init_domain_s2(struct device *dev,
>> > 	if (domain->gscid < 0)
>> > 		return -ENOMEM;
>> >
>> >+	if (iommu->caps & RISCV_IOMMU_CAPABILITIES_AMO_HWAD)
>> >+		domain->domain.dirty_ops = &riscv_iommu_dirty_ops;
>>
>> This sets dirty_ops based on whether the allocating device's IOMMU
>> supports AMO_HWAD. As I understand it, the domain/HWPT is not tied
>> to that IOMMU instance. A later attach may target a device behind
>> another instance without AMO_HWAD, and the attach can still succeed
>> with GADE disabled, potentially causing guest page faults.
>>
>> Shouldn't we therefore revalidate AMO_HWAD cap for domains with
>> dirty_ops and reject this combination?
>>
>> FYI, both AMD and Intel have attach-time dirty-tracking checks. See
>> drivers/iommu/intel/iommu.c:3195 and drivers/iommu/amd/iommu.c:3221.
>
>Right, need to check on every domain attach that the domain is
>compatible with the iommu instance.
>

Hi Shuai, Jason:

Thanks for pointing that out.

The domain is not tied to the allocating IOMMU instance, and
riscv_iommu_attach_paging_domain() only sets GADE when the target
instance advertises AMO_HWAD. As a result, attaching a dirty-tracking
domain to a device behind an instance without AMO_HWAD would silently
succeed. 
I'll fix this in the next version.

Thanks,
Fangyu

>Jason

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
