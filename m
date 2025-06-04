Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35F98C5B543
	for <kvm-riscv@archiver.kernel.org>; Wed,  4 Jun 2025 14:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ajxkM1vPXmON64GTM2MLJf+NUhsMmqzevj2LOAQzxPM=; b=oRdq/C/xzWR9Ey
	zu3XPz1sn6NgtX6OeXs7JhEdyS5BPJwUZ1z0k13u8nJjkUY5/v24/QQtd0PxwQ3/MnGKYsunufkwF
	7M+Rr3XhCGMGb50W/ywTTtwP8/DKJtiJm7BfkRsUXRneKd8ROHV61FFDblfs6JWC4ua0mBThQ7yHq
	oIuwGZD8fM2eU0eHvxZlULKZMGDhgGe1AGFgktIDCg3a6LHjaG0OHeDrtP8Xn6Nb17o0hTlSWYqUa
	ef2iqOBzDB5Xc7cx/LCFvl6PwtRXkNEpvyx5YefIqS6UANkVp7HhyZUQteQLId8RyYQ0k/OXZ50u5
	Xe3/TjXyZw04F5ILn+nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMpAV-0000000DZlS-2qRu;
	Wed, 04 Jun 2025 14:32:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMpAT-0000000DZje-10zT;
	Wed, 04 Jun 2025 14:32:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B4A5A5C5E25;
	Wed,  4 Jun 2025 14:30:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BEC8C4CEE4;
	Wed,  4 Jun 2025 14:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749047556;
	bh=IpQmYI+LTEk5yMKcHxOS33hPu3ZQ3xuwoEnpYV5S2GQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=IHnAE5oAkhaMg8Xz2BVRmid2SlXHCYmWFOTvl2MkkUd2zSFmGViznKr4cBAUM9XY6
	 v2PalVivCpTgoVuTnskBKwAMAk0oJAdtROJl9v9FY8cjvLqtqc7Ssb731gr14aJQKZ
	 XfZ8tw2HriFIoH2TmNjeAL7Ap0xPNGCLIVV5ga8agxLQCYY3JhkYF27JRo0SO7WjS3
	 F311JuD5dJQ4NgOFXAQ/2OWpJqlmWj91Nt6xpDGzkmqtCgEYfwPeyQzePQd9P7hxgN
	 GrgVJ7t8A4VOnukMwl1RBD/k4PSWjjWqSxXug9ECLcwlHwflZ7TtZ1it8d91D8ovc+
	 18rye+BqC1QMg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADCC738111E5;
	Wed,  4 Jun 2025 14:33:09 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v4 0/3] Move duplicated instructions macros into
 asm/insn.h
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174904758848.2309006.5543819811010216908.git-patchwork-notify@kernel.org>
Date: Wed, 04 Jun 2025 14:33:08 +0000
References: <20250516140805.282770-1-alexghiti@rivosinc.com>
In-Reply-To: <20250516140805.282770-1-alexghiti@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, alex@ghiti.fr, anup@brainfault.org,
 atishp@atishpatra.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_073237_321044_AE512483 
X-CRM114-Status: UNSURE (   6.73  )
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

This series was applied to riscv/linux.git (for-next)
by Alexandre Ghiti <alexghiti@rivosinc.com>:

On Fri, 16 May 2025 16:08:02 +0200 you wrote:
> The instructions parsing macros were duplicated and one of them had different
> implementations, which is error prone.
> 
> So let's consolidate those macros in asm/insn.h.
> 
> v1: https://lore.kernel.org/linux-riscv/20250422082545.450453-1-alexghiti@rivosinc.com/
> v2: https://lore.kernel.org/linux-riscv/20250508082215.88658-1-alexghiti@rivosinc.com/
> v3: https://lore.kernel.org/linux-riscv/20250508125202.108613-1-alexghiti@rivosinc.com/
> 
> [...]

Here is the summary with links:
  - [v4,1/3] riscv: Fix typo EXRACT -> EXTRACT
    https://git.kernel.org/riscv/c/00542578d2fd
  - [v4,2/3] riscv: Strengthen duplicate and inconsistent definition of RV_X()
    https://git.kernel.org/riscv/c/9908f88a651e
  - [v4,3/3] riscv: Move all duplicate insn parsing macros into asm/insn.h
    https://git.kernel.org/riscv/c/4f8d6dc47e46

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
