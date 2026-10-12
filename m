Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7E56CA9ED1
	for <kvm-riscv@archiver.kernel.org>; Mon, 12 Oct 2026 09:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2/Bn408An+b3LgnTusnQaJXpBmKFMJ0KDKqhKOrC8Ns=; b=QqGG6xMrcswPsP
	950LO9T69Gb1Zz2na+0Ybn0ZNSx5RNjYN3ThIxXNpczLHV+JGz81JB1rCdzB8uFOgIqPZeZB2FGvk
	cJhoibMOOugpw/zmZutJf1VNJjI88bn3bwXDoqEPb7OdUS/FXImA060ZhBZbClaCXoT/3Q4VnteXB
	/va/Grh+0yYp/C5/+Ctni2J2LwocTplOPqT1sklHPU/NSCN2nNS0yO28jHN2STy21r5F5r8jXIXUx
	xalFFONy4T0gIrKtiK3eepHA7tAr/SXxQkCL4KkYuTsCMmaRteqfkUGg8LtdSBfkie8xiSVu7aj67
	X0C/EANQx+65m5ZV6ktg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGCf1-0000000A6mQ-0nsy;
	Mon, 12 Oct 2026 09:49:35 +0000
Received: from out30-119.freemail.mail.aliyun.com ([115.124.30.119])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGCex-0000000A6l7-4BBG;
	Mon, 12 Oct 2026 09:49:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1791798566; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=qEpKnihwtB1O/AmQiViwPVFIh5doeRnDfGtkes3Yveo=;
	b=gAN9lR+XdPyMmdtMXLXHNCs0KcLce1JDui7AsPCl5yIrSVLDoRiuW0AXG2wNXNR0cvupavgz+XIfT2CoudPM80xm7OGNu6gqRvIu72bW/mHo3vJ7zcLMB7bdaCNioajFiH3bj9hFW0guNx4mgxIZcrFr25qTIxuTWXgLnM0ff1U=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R831e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=19;SR=0;TI=SMTPD_---0XCe.3FT_1791798560;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0XCe.3FT_1791798560 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 12 Oct 2026 17:49:22 +0800
From: fangyu.yu@linux.alibaba.com
To: jgg@nvidia.com
Cc: alex@ghiti.fr,
	andrew.jones@oss.qualcomm.com,
	aou@eecs.berkeley.edu,
	fangyu.yu@linux.alibaba.com,
	gong.shuai@sanechips.com.cn,
	gsh517025@gmail.com,
	guoren@kernel.org,
	iommu@lists.linux.dev,
	joro@8bytes.org,
	kvm-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	robin.murphy@arm.com,
	tomasz.jeznach@linux.dev,
	will@kernel.org,
	zong.li@sifive.com
Subject: Re: [RFC PATCH 1/3] iommu/riscv: Add guest IMSIC GPA mapping helpers
Date: Mon, 12 Oct 2026 17:49:19 +0800
Message-Id: <20261012094919.98576-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20261011135132.GH13920@nvidia.com>
References: <20261011135132.GH13920@nvidia.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_024932_562474_625F8760 
X-CRM114-Status: UNSURE (   5.65  )
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

>On Sat, Oct 10, 2026 at 07:18:37PM +0800, fangyu.yu@linux.alibaba.com wrote:
>> This is not a generic page-table operation. It is a special
>> requirement of RISC-V IOMMU IRQ forwarding (irqbypass) on
>> implementations without an MSI page table: the guest IMSIC GPA
>> must be mapped into the second-stage domain, and when a vCPU's
>> VS-file host page migrates, its leaf must be replaced atomically.
>
>I think you can add an atomic PTE replace operation to generic_pt,
>that should be fine.

Hi Jason,

Thanks for the suggestion. I plan to give this a try in v2 and move
the atomic PTE replacement logic into generic_pt.

CC Shuai, since he suggested the same earlier.

Thanks,
Fangyu

>
>Jason

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
