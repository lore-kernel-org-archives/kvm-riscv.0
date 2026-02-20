Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30158C531F2
	for <kvm-riscv@archiver.kernel.org>; Fri, 20 Feb 2026 04:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LhdBWYYjbwrVEAHBbEjA9s8bPiSVpWD/sCS+wD28Xq0=; b=RD/leWI8g7B9I2
	UR93cWG2Y7aLZoDa74un+VWGRQzHp6X3M1xmmYQpCcwQFaxUMII3frwtE9Ma5qLjUIYph/7me77fY
	qPxZBp4Sug8J9tk6BTSLnTVRwQ/dDZF5L7IUzkpQ9t/7AbISSA9y27oDTy9T+oyR397RIRVbLQcL2
	CGRiHfRktCvpg4eRZ9ur2+tFoJal+vX4vCiuro67ocyamh4a02FBdRhqJc/pJKQGtjRMCtK3sHKIQ
	5W3gpYeKG0H8Hu619K+XfQ2Yh6f7V8088eIPETDjpp4Z7c73y8sl53nd0Svl08nELLvDB6U23Q01M
	hC2bNjpgA7XVjjXVX1aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtHqk-0000000DCKw-3jXP;
	Fri, 20 Feb 2026 04:10:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtHqf-0000000DCHB-2cCc;
	Fri, 20 Feb 2026 04:10:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0B9136185F;
	Fri, 20 Feb 2026 04:10:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99C77C2BC87;
	Fri, 20 Feb 2026 04:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771560636;
	bh=Ifpckop5sDPNCgmdPL4sGXc0scyTZuad/LyPyb/8d1Q=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=mK6b8wox98nl2xIIq+AirgaDUITrg6ikL3liq5eXJET9k3Yon4jEipvaywhEvQJuJ
	 +XZXQWUly4/pUm8yG4fuLZpep3z5QKB3RlQh6tNIaWtBPhTKANKc+h843s2NdFOmGh
	 xhFR6wzGtSgVyH7OQyfEs+lOXq5SnkZQc2gstZHdg2Yx8vF5pn3CpGHyuyA2NmUGVp
	 7uFPlJXR/Q85k9UoBJb/IuYyCxX5IVZs5lrw1ZDiTm5C2wUPUmGdo1/rwpE64PZHWl
	 C7hEU2Lbw9R9cCL5YkC1n86LlWOHsFJ2oRfSBtg6hbCOFvt+kQYVjbN5ckyV3zNYjX
	 kAG5miQD2CIMQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 400123809A88;
	Fri, 20 Feb 2026 04:10:46 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] RISC-V: KVM: Skip IMSIC update if vCPU IMSIC state is not
 initialized
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177156064504.189817.4302642983283569881.git-patchwork-notify@kernel.org>
Date: Fri, 20 Feb 2026 04:10:45 +0000
References: <20260127084313.3496485-1-xujiakai2025@iscas.ac.cn>
In-Reply-To: <20260127084313.3496485-1-xujiakai2025@iscas.ac.cn>
To: eanut 6 <jiakaipeanut@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, anup@brainfault.org,
 atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, xujiakai2025@iscas.ac.cn,
 jiakaiPeanut@gmail.com
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

On Tue, 27 Jan 2026 08:43:13 +0000 you wrote:
> kvm_riscv_vcpu_aia_imsic_update() assumes that the vCPU IMSIC state has
> already been initialized and unconditionally accesses imsic->vsfile_lock.
> However, in fuzzed ioctl sequences, the AIA device may be initialized at
> the VM level while the per-vCPU IMSIC state is still NULL.
> 
> This leads to invalid access when entering the vCPU run loop before
> IMSIC initialization has completed.
> 
> [...]

Here is the summary with links:
  - RISC-V: KVM: Skip IMSIC update if vCPU IMSIC state is not initialized
    https://git.kernel.org/riscv/c/003b9dae53ae

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
