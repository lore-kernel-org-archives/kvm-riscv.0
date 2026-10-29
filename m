Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B823606A326
	for <kvm-riscv@archiver.kernel.org>; Thu, 29 Oct 2026 01:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wVcEV7KW;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=KOWEmtUL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=gWsO0yBS24+HKi4FKEaRMOa9o1kLvue3QgaTu2UTOzM=; b=wVcEV7KWvj4f+g3DqOXSYZFp6A
	cCKgKUTpvxMRqVMllytsqdBx8bLx6bRWspFQwWXMEHF9CWg4lQL1CucuDoPTAbsgGGHWB8FGM5TNb
	SB83lFO4mEejt4VW4yCDOBZ4XNhJmhuyHHhd5+oHxIIT5sIULeKVDH0RLf5H35/KO+IJ1whQYpNfX
	lh1zrX9wvrb1wu0UIJ7MNd/kuoOAYBewDXgQsWsQkV8vnPy/mx150biVKDGUKFcnt0CUfi7l+rdl+
	v3c9uT7t2g5Vy34P5h7AV22N+JBH08B4ogTQJvMukcbs1cgucm/qDtYMxJNOVi+DJZWIkxaXLniOE
	UObuPfDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMFJT-00000008A5X-1kmk;
	Thu, 29 Oct 2026 01:52:19 +0000
Received: from out30-130.freemail.mail.aliyun.com ([115.124.30.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMFJP-00000008A58-2G8e;
	Thu, 29 Oct 2026 01:52:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793238732; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=a+kTNEMlGRHVqhyrD9wjKCx3s2EeROQLPFxQ8ka5f9I=;
	b=KOWEmtULoDa2JCruIYMNOqf1ogyQPkHfiiHqOv/sCbd5mWj717ui0B/5ihHhijf4hMMV9yek65Ugaxn4SLFmwAwvev3kEBmr/WsBoR0F2eIszCCENEsQxMegt+We1vrBLdwQ+IIxmhTIqhJ+WZvtDfTfjGgk0JmbaE215OdfWVM=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R101e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=28;SR=0;TI=SMTPD_---0XDhqoRO_1793238728;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0XDhqoRO_1793238728 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 29 Oct 2026 09:52:10 +0800
From: fangyu.yu@linux.alibaba.com
To: jgg@nvidia.com
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
	jgg@ziepe.ca,
	joerg.roedel@amd.com,
	joro@8bytes.org,
	jroedel@suse.de,
	kevin.tian@intel.com,
	kvm-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	robin.murphy@arm.com,
	skhawaja@google.com,
	tanchi25@mails.ucas.ac.cn,
	tomasz.jeznach@linux.dev,
	vasant.hegde@amd.com,
	will@kernel.org,
	zong.li@sifive.com
Subject: Re: [RFC PATCH v5 00/10] iommu/riscv: Add hardware dirty tracking for second-stage domains  
Date: Thu, 29 Oct 2026 09:52:07 +0800
Message-Id: <20261029015207.82522-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <179320128818.2412245.14186677086155168748.b4-review@b4>
References: <179320128818.2412245.14186677086155168748.b4-review@b4>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_185215_928727_58E2541A 
X-CRM114-Status: UNSURE (   7.02  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

>> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
>>
>> The RISC-V IOMMU architecture defines an AMO_HWAD capability (Hardware
>> Access/Dirty update) that allows the IOMMU to atomically set the A/D bits
>> in second-stage PTEs on DMA access.  When DC.tc.GADE is asserted, the IOMMU
>> autonomously sets D on the first write to a page mapped by an iohgatp
>> domain.  This series wires that capability up to the iommufd dirty-tracking
>> interface (IOMMU_HWPT_SET_DIRTY_TRACKING / IOMMU_HWPT_GET_DIRTY_BITMAP) and
>> reports IOMMU_CAP_DIRTY_TRACKING.
>
>These patches don't apply, so sashiko couldn't run:
>
>https://sashiko.dev/#/patchset/20261020094106.92722-1-fangyu.yu%40linux.alibaba.com
>
>> [ ... 86 lines skipped ... ]
>> [1] https://lore.kernel.org/linux-iommu/1-v2-563ee63886f0+1209-iommupt_armv8_jgg@nvidia.com/
>> [2] https://lore.kernel.org/linux-iommu/20260818092444.42755-1-andrew.jones@oss.qualcomm.com/
>
>Because of these extra patches I suppose.
>
>Please figure out how to fix this before you send it again..
>
>Also no base-commit trailer which helps sashiko apply them.
>

Sure, I'll fix the apply issues and add a base-commit trailer in the
next version.

Thanks,
Fangyu

>--
>Jason

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
