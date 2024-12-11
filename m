Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BA57E7717D
	for <kvm-riscv@archiver.kernel.org>; Thu, 12 Dec 2024 00:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nx7jWAOEuYedxMwsAYfqh6aoQ+fu42wA5ZTcYqUuDdM=; b=pVM83+L2txq25f
	Th0YBAhTFLpnM0X8RI1tphGD3i4e81Zv6APNjxswUFRRrUXwNrp7PCeYXTLv9YNNqMBvcdhd9Di1W
	0nf1iFsKyno4cLwFqK+uVRR4UB7xcyDQVEBNAX3gsUjxrU4Ykoryl7q/loyvg+uGB3X1rNs/yJIBx
	DuT7/sZIvCMhsosFhLAWYTbvDJXgxKWjStfqqocnlEO3nD8qnsHbG/Codg9qLhI+bqg0bsdHhMxaw
	EgSmUdDuZ+oTTfsNEzZkeZMNyJBDL+TIsHfz5ZJ62tdR0JpRs9bk60vKAge9ERmDLVwVWyRomMlF6
	Sr0Hg4FdvdiMXmkplmzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLWcy-0000000GZGv-3nhv;
	Thu, 12 Dec 2024 00:00:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLVVl-0000000GP7C-1gmK;
	Wed, 11 Dec 2024 22:48:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4EF775C56DD;
	Wed, 11 Dec 2024 22:48:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 730A8C4CED2;
	Wed, 11 Dec 2024 22:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733957332;
	bh=acGfeI0YRpuxvMx+0wvb7CKvqFMzbYj83Gfj/IHzt/k=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=VwuRZL7hzOzelB/yF7WX1leHtcROppgi4k6lZ6fqicnkU7BncIzoDDEEOPAOde8A7
	 Lxyru9MlWdNbyLM4GTzPITzxTkifOamHejip5xmdL85k4JKn/gDxNnc/I85mvofOYW
	 fH0cfkG5azyYUsqNw/Apj/TDLsbs8fQFkYM4kTx3xmKOTmMIfH8je8jg3twMmwIUAP
	 2blbqyanq5DQ5N64VwWNdMVf9oOIur9LpGOAAeRYqgKdAww1k9N4G/uJzlJ3rdWe0a
	 nEDhsz+NzK5G1KRsASDB2jUphDNrhABKG+SYCeP5Q26NCFAx/pOnyZauP4BdNvCibc
	 KMDaCK7MmZMNw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADCB7380A965;
	Wed, 11 Dec 2024 22:49:09 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [GIT PULL] KVM/riscv changes for 6.13
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173395734850.1729195.10005899360469788312.git-patchwork-notify@kernel.org>
Date: Wed, 11 Dec 2024 22:49:08 +0000
References: <CAAhSdy1iTNc5QG34ceebMzA137-pNGzTva33VQ83j-yMoaw8Fg@mail.gmail.com>
In-Reply-To: <CAAhSdy1iTNc5QG34ceebMzA137-pNGzTva33VQ83j-yMoaw8Fg@mail.gmail.com>
To: Anup Patel <anup@brainfault.org>
Cc: linux-riscv@lists.infradead.org, pbonzini@redhat.com, palmer@dabbelt.com,
 palmer@rivosinc.com, ajones@ventanamicro.com, atishp@atishpatra.org,
 atishp@rivosinc.com, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_144853_496427_F728BB9D 
X-CRM114-Status: UNSURE (   8.62  )
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

This pull request was applied to riscv/linux.git (for-next)
by Paolo Bonzini <pbonzini@redhat.com>:

On Fri, 8 Nov 2024 17:07:34 +0530 you wrote:
> Hi Paolo,
> 
> We have the following KVM RISC-V changes for 6.13:
> 1) Accelerate KVM RISC-V when running as a guest
> 2) Perf support to collect KVM guest statistics from host side
> 
> In addition, the pointer masking support (Ssnpm and
> Smnpm) for KVM guest is going through the RISC-V tree.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] KVM/riscv changes for 6.13
    https://git.kernel.org/riscv/c/e3e0f9b7ae28

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
