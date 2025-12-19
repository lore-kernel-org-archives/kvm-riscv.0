Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3856ED711D6
	for <kvm-riscv@archiver.kernel.org>; Fri, 19 Dec 2025 08:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BuES+GethP8go7FVnw93FBzmp/pApVOCGcA1yVMoaKA=; b=yfP3RHM4bJj+8j
	d/NKaQacBoPQj+H6/yHL7GfuTByYiG2FVuOBiojdmozZ1/63BniVJ4B+cE7bfsyWKpi/l2z1gUgJx
	aVgXH5s7f/rqcijMWQZxulF3rZLEFEI2DUP2THL0wV8DD1ZYyPJjzQQ0n22Ylv3VEsAySvzj2hxKA
	JTmh6oPoslvhnnnbJu8Ma5fIu0dM2js2rF1C6w53CEdQ+uxQ/w3XLiBR3kcM/4h6M95gt4sOU93LG
	Sjd+fm15bm8IbmV+2Ck0loER8XWLm7j+/qJUEQNdBCKnLVKfY9VQt8qTWhF5CcBcFuev5CRgrywBm
	MtBRmAecya/Jd8hoKKHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWVcP-00000009pVX-2q3R;
	Fri, 19 Dec 2025 08:13:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWVcB-00000009p9J-1cNn;
	Fri, 19 Dec 2025 08:13:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 906FA4437E;
	Fri, 19 Dec 2025 08:13:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EE75C19425;
	Fri, 19 Dec 2025 08:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766132010;
	bh=l//QwgPNp1q4alMwyDOP8wGl2QpoY+/qlyQYNCdTd4I=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=qxl4+v7EchxSQ7uPMHgNydReNM1Y6n+K31KkYZykBB3zU4/1J55VuaieSBPlR9Uew
	 sLPPbZyXzw6pJ+styBQdsS0VRaDdqAl6U1hXPC2bUl0TvEu+rZd1OaDzNP4aOStHCw
	 ZZvMZqHw68rVGgMhd/UwwdRS24KcLQ02S/WO0J1ohgEOhsHUDqnR1nA5FOlM747o2y
	 erJR+P6geI4sQdGcE79OMvqcCMoTWhhpXEVOtbXXJGenq2Ir6sw+qs+MsKb7rWSt8r
	 14TrsfA2fV/kOFeqFhp7zu47yGs3J1syqT9XBu0q/JfKl9NfTeBHRszhr2z6HTblmW
	 GL+j2vbGTM0rw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 790A6380AA50;
	Fri, 19 Dec 2025 08:10:20 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v3] RISC-V: KVM: Fix guest page fault within HLV*
 instructions
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <176613181927.3684357.6307325316578427331.git-patchwork-notify@kernel.org>
Date: Fri, 19 Dec 2025 08:10:19 +0000
References: <20251121133543.46822-1-fangyu.yu@linux.alibaba.com>
In-Reply-To: <20251121133543.46822-1-fangyu.yu@linux.alibaba.com>
To: yu fangyu <fangyu.yu@linux.alibaba.com>
Cc: linux-riscv@lists.infradead.org, anup@brainfault.org,
 atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, guoren@kernel.org,
 ajones@ventanamicro.com, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_001331_633930_11484CF8 
X-CRM114-Status: UNSURE (   8.63  )
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

Hello:

This patch was applied to riscv/linux.git (fixes)
by Anup Patel <anup@brainfault.org>:

On Fri, 21 Nov 2025 21:35:43 +0800 you wrote:
> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> 
> When executing HLV* instructions at the HS mode, a guest page fault
> may occur when a g-stage page table migration between triggering the
> virtual instruction exception and executing the HLV* instruction.
> 
> This may be a corner case, and one simpler way to handle this is to
> re-execute the instruction where the virtual  instruction exception
> occurred, and the guest page fault will be automatically handled.
> 
> [...]

Here is the summary with links:
  - [v3] RISC-V: KVM: Fix guest page fault within HLV* instructions
    https://git.kernel.org/riscv/c/974555d6e417

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
