Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36CA0FF885A
	for <kvm-riscv@archiver.kernel.org>; Wed, 29 Apr 2026 02:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fEXBlI6BnYa50ejqXKoM+YxVMMwsv+P+RB68hwP0l+Y=; b=Uz5kAOf+3Jgg7T
	NfytN0rrHyac+YGVScMy7fuUMoVeC4CTPAWQRP8XWMc1xW7kkuEG4X7x72nWHN06IpcsPfsLBg0U7
	uzA1a3Cii3Pi/VbXWX+VoU7135t7fdrpMLgiZevJA0O2ECNyx5Hdzyi2l8Sc9eQFiMHqOHi964vk9
	WT0Iwvj1ERjErA1yQT4HCTSBFGVfs3rUbrC0JPiHuz84W6H+tQmKYCnQ3PPsIrPw9l2hayPfVaDCR
	f0whAFNpZFugV3utWJmZiwEACzCg5pMtt40cIOvmAPuR6o4SC2txzFrMw+1Pc5lMfKbh9iFTzHpte
	5fXGUzgv7ceqYooTB+SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHunz-00000002nIm-3YT4;
	Wed, 29 Apr 2026 02:37:39 +0000
Received: from out30-130.freemail.mail.aliyun.com ([115.124.30.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHunx-00000002nIN-28cL;
	Wed, 29 Apr 2026 02:37:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1777430253; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=9vgeJGi4fIz8c1PAExsDJNL3htFpFy8K6PCAfkBpC84=;
	b=xnyTct9rn8qm5vgW3260+7nlnKASyFZ+lQ+3Eq3PiEA56C11peSDgL/tf2JB9m/78/dxFMTrK06HUabhA45xrvfYD3avZkiusd4aaz3PJM6HS8QpCj2cyiSULvFZ4ylP/nxrlcjYjTXyuDFVkedKz+L5haDulWE8aqKRp8z5srM=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R131e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=23;SR=0;TI=SMTPD_---0X1vzVVG_1777430247;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0X1vzVVG_1777430247 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 29 Apr 2026 10:37:29 +0800
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
	will@kernel.org,
	zong.li@sifive.com
Subject: Re: Re: [RFC PATCH 11/11] iommu/riscv: support nested iommu for getting iommu hardware information 
Date: Wed, 29 Apr 2026 10:37:22 +0800
Message-Id: <20260429023722.79615-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20260428133942.GI849557@ziepe.ca>
References: <20260428133942.GI849557@ziepe.ca>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_193738_061041_3040E29B 
X-CRM114-Status: UNSURE (   9.66  )
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

>> From: Zong Li <zong.li@sifive.com>
>> 
>> This patch implements .hw_info operation and the related data
>> structures for passing the IOMMU hardware capabilities for iommufd.
>> 
>> Signed-off-by: Zong Li <zong.li@sifive.com>
>> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
>> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
>> ---
>>  drivers/iommu/riscv/iommu.c  | 19 +++++++++++++++++++
>>  include/uapi/linux/iommufd.h | 18 ++++++++++++++++++
>>  2 files changed, 37 insertions(+)
>
>This has nothing to do with dirty tracking. It should go with a series
>introducing viommu.
>

Thanks for pointing that out.

I added the .hw_info-related patch because, during passthrough testing with a
VM, I observed that QEMU calls iommufd_get_hw_info, so I initially thought it
was required. However, it appears that the .hw_info implementation is not
necessary for this series. I will remove the .hw_info-related patch from my
dirty-tracking series in a follow-up revision.

Thanks,
Fangyu

>Jason

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
