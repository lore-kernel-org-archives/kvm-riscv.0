Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2931CCDE00E
	for <kvm-riscv@archiver.kernel.org>; Fri, 26 Jun 2026 08:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aGR/Hndrx0tRBJeiYe3TFVeTTLcRQ0+uP0WMuVKwnBo=; b=YtHCPjkaumDtwm
	yr1MomGJuMK+2FRLOdKMJLOz7UclviSlETJHEYUjdDS4eN67SsSphhFlbw6am86w8uwBpegQXVoR9
	JhiI1PVI5/fN3T41dgxAf9yg1d2uwwEwfDjuOa2hx80ewLousQJe2FeBTZ26Io12Y2C0e3BIe2+mx
	xqDS6ZRJ4jJuhTNiuVKyAvwQ6d/nKfwawElf7+3Hy1mf6WN2DcPppygKZrfJTnTlU8AewL65gscKI
	bNn0rh3ovtfxmub8Ialm7g/X8/MGRkCK3C0j6BnccStvv4cMp+YUCvv7yot86Y6iOJqRS6yNKzSEU
	nHuDVutYrYJs6KMgEK4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1oq-0000000Ao63-2EyC;
	Fri, 26 Jun 2026 08:21:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1od-0000000Andh-1aMe;
	Fri, 26 Jun 2026 08:21:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EE11E442D8;
	Fri, 26 Jun 2026 08:21:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D090C1F000E9;
	Fri, 26 Jun 2026 08:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782462093;
	bh=p5+rIqdVv344EQDk5zZnFOdYzj2jMyT9lQ7p6WTw/Os=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=AqxGMNNytH3yg2QXdoyhU9CAHGPY90p1k6s3uowWLx6ea3WXmlnZ3vzgQS4KLBOHe
	 +KFJfvXWvyDW5YLRusseh09kaj695+9bqcQUpqxrnjgVwetdjOR2JxmVBQwg5VlhIB
	 PTJ3cnRE3KwvbWnuMoNO0fT7tGR7BhQEwvFtkeMLdASmixXxD2fQlmZ+lK9JPch9mn
	 t7+jyKnIbQFE+QtZ1Sb9L5Aq5TQgQRUUUPMAmITLivRKIwBKGrn04Lkxi3DAOP+hSU
	 4JlJ7OFphSa22D5OXHRQ8P5D9J84BgNkWARuQoiDJFgnBcHjtYSB3bj58AIReMmS9H
	 uSD+zHAFPodYg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 1975839389E8;
	Fri, 26 Jun 2026 08:21:22 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 0/5] KVM: riscv: Speed up dirty logging write faults
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <178246208080.3816447.14235715613320602429.git-patchwork-notify@kernel.org>
Date: Fri, 26 Jun 2026 08:21:20 +0000
References: <20260517153427.94889-1-tjytimi@163.com>
In-Reply-To: <20260517153427.94889-1-tjytimi@163.com>
To: Jinyu Tang <tjytimi@163.com>
Cc: linux-riscv@lists.infradead.org, apatel@ventanamicro.com,
 anup@brainfault.org, pbonzini@redhat.com, seanjc@google.com,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, atish.patra@linux.dev, pjw@kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, radim.krcmar@oss.qualcomm.com, andrew.jones@oss.qualcomm.com,
 conor.dooley@microchip.com, yongxuan.wang@sifive.com, nutty.liu@hotmail.com
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
by Anup Patel <anup@brainfault.org>:

On Sun, 17 May 2026 23:34:22 +0800 you wrote:
> This series speeds up the common dirty logging write fault path for
> RISC-V KVM.
> 
> When dirty logging is enabled, guest writes to write-protected G-stage
> 4K leaves currently go through the full fault path and take mmu_lock for
> write.  That is expensive once the leaf already exists and
> only needs its permission and dirty state updated.
> 
> [...]

Here is the summary with links:
  - [1/5] KVM: riscv: Rely on common MMU notifier locking
    (no matching commit)
  - [2/5] KVM: riscv: Use an rwlock for mmu_lock
    (no matching commit)
  - [3/5] KVM: riscv: Add a G-stage PTE cmpxchg helper
    https://git.kernel.org/riscv/c/7dd416fdd3fb
  - [4/5] KVM: riscv: Update G-stage PTE permissions atomically
    https://git.kernel.org/riscv/c/d7a26a0ba715
  - [5/5] KVM: riscv: Fast-path dirty logging write faults
    https://git.kernel.org/riscv/c/7705be59eb2d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
