Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 798D1CDE008
	for <kvm-riscv@archiver.kernel.org>; Fri, 26 Jun 2026 08:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rKtKeNpuKswPAQPSCdv6GhQAVaKzNWShccayDvCsW3I=; b=UMMakPsG/T8LmD
	pHZCaGu/SlartEQYi2r+yztb/7be8k2+e/VbB+ZDTz2IkZqUnNiFHL28rZGHJwldZRk1zj6e3ewvZ
	Ooww+3E5dj4Q+T1F7ZioIiYbYl/B+ouRvde840bzyp2Efq8vGUcyBVD0GSwkIXBZtwoS4oItKyjnc
	e/NL3Smf6mHjE1cB1Cj5nYfUgWOG9xGKGPLKrhEiykykqA7O5Wciy1P3M74HBPP28/7JTQMWSJDfC
	BmK1JnAH3K2V89VK3Xn95ZQjNJLbwhg6djjhMtYbGooY57XLnwAslHaKL+S1erMSZKxHh+lwqiObi
	TUaKzhLq6THm83bzGtBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1p5-0000000AoiQ-3MGQ;
	Fri, 26 Jun 2026 08:22:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1of-0000000AnhS-0cVb;
	Fri, 26 Jun 2026 08:21:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A074160220;
	Fri, 26 Jun 2026 08:21:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 564071F000E9;
	Fri, 26 Jun 2026 08:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782462095;
	bh=9ng+K5LtfItZozFyW5DaKLk3vg89jUk5p+Jo40h/pz0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=gy9obNaagDLrQoDnAOJ9mWpvqgzIicpqyoeod0wvdXDDe+Li3tUihiHwItm8IN9PR
	 j2CMjq8Hhphd8FC9VSV+2cEQEMVhXUS1Stp59UV8bNTu+pBxueYh2S45iDWfZ/qaym
	 DLBjQnHS26sbvZAkitK+HeZo4FtglhDXlWF3+RxBNfJ+mdam37U4E+OReRc7HZWT3M
	 iwShpsnaYenuj21+AJcPCuUzrqfHiWRN02laL9IdavxX9tiqUmmKEJ36cwNsgvzHXa
	 GXdaMOleHY3lHrkOmx7h9DsqT++WIHzHTWg/2JsQBpXWJ07Zjy2d2WGlhbVTQv9GSy
	 FUppLP2bY7jPw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93AC539389E8;
	Fri, 26 Jun 2026 08:21:23 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] RISC-V: KVM: Fix timer state restore
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <178246208225.3816447.7133626201153668356.git-patchwork-notify@kernel.org>
Date: Fri, 26 Jun 2026 08:21:22 +0000
References: <20260526075544.796396-1-maqianga@uniontech.com>
In-Reply-To: <20260526075544.796396-1-maqianga@uniontech.com>
To: Qiang Ma <maqianga@uniontech.com>
Cc: linux-riscv@lists.infradead.org, anup@brainfault.org,
 atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, kvm@vger.kernel.org,
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

This patch was applied to riscv/linux.git (fixes)
by Anup Patel <anup@brainfault.org>:

On Tue, 26 May 2026 15:55:44 +0800 you wrote:
> The KVM_REG_RISCV_TIMER_REG(state) one-reg write passes the value
> written by userspace to kvm_riscv_vcpu_timer_next_event() when
> re-enabling the timer.
> 
> That value is the timer state, KVM_RISCV_TIMER_STATE_ON, not the
> timer compare value. During migration or state restore, userspace
> restores the compare register separately, which stores the target
> cycle in t->next_cycles. Re-arming the timer with the state value
> schedules the next event at cycle 1 instead of the restored compare
> value, causing the virtual timer to fire too early.
> 
> [...]

Here is the summary with links:
  - RISC-V: KVM: Fix timer state restore
    https://git.kernel.org/riscv/c/6d4c17ed5620

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
