Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1454ECDE012
	for <kvm-riscv@archiver.kernel.org>; Fri, 26 Jun 2026 08:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FST0J6Tk42Mzty2awph9FmapKYQK/uvXGSDeR4O1jmU=; b=xEmW94pKJXsxUR
	JdwOfmU+oHdILoXuByxrGlprTWf6OAFSzrCcF9/Q4s0mKlfKGAQHtf5DkvB8D82pQxdQ29K7AoF1v
	q7/dTpa/6dImwL7I/6K7p8jE43qkwR9Z9G9IUcZAggxc0ExLcprhMgmCdNwxbwpcC5RUb/RNkqbzW
	rxpIqwYCgf/vEW0RH3SF/IdGaOMImM83Vx/9ALn6+lBlqsWnafaNIvhteMFHMbvs3uXqcZEFyZKHg
	8fu1tgTg4PhEBWsncwE8TIjk4uVOgTVEfZ6dbXtV3TQESD0y7z1hFbAvoAWC8rBBrCJxmTw13Uayf
	LSBttYhhJdd8fhvzmiFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1oL-0000000An7L-2w4B;
	Fri, 26 Jun 2026 08:21:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1oH-0000000An38-483M;
	Fri, 26 Jun 2026 08:21:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6983F60145;
	Fri, 26 Jun 2026 08:21:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BCA41F00A3A;
	Fri, 26 Jun 2026 08:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782462073;
	bh=JvPo55g3eS2w4p/tC+pRBIWpmLSFQYMnnMNilcteyYo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=aMYx1Gto+N0bypalZDoOlr81wF/uH5UhY0QLhvs3GfbDwe5bOFn2glLQH8D+H7Nev
	 0Ha6rhez+fSUCy/wkeqZ3/bg7F7Ed9gH95xZyZB4l4cOrd6O06o1PaxzzmD5RkMEEK
	 Oj8M+q3f+yWMfsAPzd/3h1rE4oaTY7Nv5DjHgJFBAFox7DT9p0wZgwni9qaHDUM4D8
	 11J5ZTpZfXRQJodF+odR4kikxgiW5zjCjdReouqymf/4FfvtZCcwCnMGG/C2ik6cSI
	 FyRPycWIgCmEPNB4nTJ1B9JhyFj57Rv4Su4SabrWN+t+hc9bhF6FrvcKRIVT00h1Sv
	 XXokDVsnCNwzw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 5695939389E8;
	Fri, 26 Jun 2026 08:21:01 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v4 0/2] iommu/riscv: Support Svpbmt memory types in
 generic_pt
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <178246206005.3816447.8810357368655365502.git-patchwork-notify@kernel.org>
Date: Fri, 26 Jun 2026 08:21:00 +0000
References: <20260512074142.16356-1-fangyu.yu@linux.alibaba.com>
In-Reply-To: <20260512074142.16356-1-fangyu.yu@linux.alibaba.com>
To: yu fangyu <fangyu.yu@linux.alibaba.com>
Cc: linux-riscv@lists.infradead.org, joro@8bytes.org, will@kernel.org,
 robin.murphy@arm.com, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, tjeznach@rivosinc.com, jgg@ziepe.ca,
 kevin.tian@intel.com, baolu.lu@linux.intel.com, vasant.hegde@amd.com,
 anup@brainfault.org, atish.patra@linux.dev, skhawaja@google.com,
 jgg@nvidia.com, nutty.liu@hotmail.com, guoren@kernel.org,
 andrew.jones@oss.qualcomm.com, kvm@vger.kernel.org, iommu@lists.linux.dev,
 kvm-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
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

Hello:

This series was applied to riscv/linux.git (fixes)
by Joerg Roedel <joerg.roedel@amd.com>:

On Tue, 12 May 2026 15:41:40 +0800 you wrote:
> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> 
> RISC-V Svpbmt adds page-based memory types (PBMT) to PTEs, allowing
> mappings to be tagged as e.g. normal memory, non-cacheable memory, or
> I/O.
> 
> This series wires the RISC-V IOMMU Svpbmt capability into generic_pt
> and uses PBMT to encode device memory attributes for IOMMU mappings.
> 
> [...]

Here is the summary with links:
  - [v4,1/2] iommu/riscv: Advertise Svpbmt support to generic page table
    https://git.kernel.org/riscv/c/f196a8668797
  - [v4,2/2] iommupt: Encode IOMMU_MMIO/IOMMU_CACHE via RISC-V Svpbmt bits
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
