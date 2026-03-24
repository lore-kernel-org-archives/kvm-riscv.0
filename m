Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEAFEF532DE
	for <kvm-riscv@archiver.kernel.org>; Tue, 24 Mar 2026 06:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ioIz9n86ZenBgxDU/MquTrH99JJ7/kO4Qb8OlhkDwSM=; b=sFgpGKBBVJlOcZ
	pgFTire1lII4sr3t0q+mpsdB7HnpN+uxj0XJBBKdw4JanK6PxiUlKYRdGMOHMd9EWWrdIQ19rNpVw
	q0+q0WkSg08fzxHtzLP2j8DYzaMrkb2CTSSXWQg2lpHtNcaqXPWPCiMgGMPBfVMWTLn9EcMyWzcQ0
	lnIoLe3G7eN3WWA/cYO3Pu46dXA8oby6Zr3SxntgQr8wiOqvqGsgeVzkmYBINs3I4ICSxMg6Hgd1g
	CJuAozXtJcgPK8U/XfMjV6HcmgKoW6M53gtKuboPUMvRF2HDJs961nyldSRr/ZBiUW4scachxHrBM
	jCL5IWMoBO57U3yVuH1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4uvm-00000000deo-1LCJ;
	Tue, 24 Mar 2026 06:07:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4uvh-00000000dVY-2JKk;
	Tue, 24 Mar 2026 06:07:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 601956013E;
	Tue, 24 Mar 2026 06:07:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16419C2BCB2;
	Tue, 24 Mar 2026 06:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774332473;
	bh=YaPgiHQl56+sPNb1XcP4MC0aBJocLJM0xG2k+cBTOuw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=nPrht0N5iNqPF1ITTro1KL5P2xYH3yruzSUogcoTheEVWP+y9EbXg8cUVa/e9udLr
	 uD5XTHGBMbg2w2uz8ibqYKpKtPRndWWyUCCnzvX09pKWvQ/jH7s+kFgycsEhFURmLN
	 06O5VDpT5hmYSURtbZFJCio2gUgMBXPvN0TrQTSr4d1RMwb9B1T1oqx3DAayMY+rVy
	 I6dynBKN1tvpVlRCzjKKL6J1VTs+g6nmeFHbpsRFLIeTpBQW63wgc8xTbcRb/Dos90
	 P0RulPv06Sa/xejlqUu879rw9BV/fqVbcQ7l7/05k3u3nt4yqezaORuBAoxbqXlUiG
	 XUpxBUSxmYaiw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 599EC3808200;
	Tue, 24 Mar 2026 06:07:42 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] RISC-V: KVM: Fix out-of-bounds by 1
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177433246104.469836.4154059877699067385.git-patchwork-notify@kernel.org>
Date: Tue, 24 Mar 2026 06:07:41 +0000
References: <20260228152226.2116895-1-ethantidmore06@gmail.com>
In-Reply-To: <20260228152226.2116895-1-ethantidmore06@gmail.com>
To: Ethan Tidmore <ethantidmore06@gmail.com>
Cc: linux-riscv@lists.infradead.org, anup@brainfault.org,
 atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, ajones@ventanamicro.com,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
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

This patch was applied to riscv/linux.git (for-next)
by Anup Patel <anup@brainfault.org>:

On Sat, 28 Feb 2026 09:22:26 -0600 you wrote:
> The array kvpmu->pmc is defined as:
> 
> struct kvm_pmc pmc[RISCV_KVM_MAX_COUNTERS];
> 
> So, accessing it with index RISCV_KVM_MAX_COUNTERS would be
> out-of-bounds by 1.
> 
> [...]

Here is the summary with links:
  - RISC-V: KVM: Fix out-of-bounds by 1
    https://git.kernel.org/riscv/c/5c1bb0787111

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
