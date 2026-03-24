Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08335F532DD
	for <kvm-riscv@archiver.kernel.org>; Tue, 24 Mar 2026 06:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XOXo6DytZEnakrjlKToB22X//UBLxHg7zkF+uDFtm08=; b=na+k70x7xTJ4kk
	sHHYoyD9ugL690YA1XLvkJ7YFiLRDuiJXL6P93wGTdTyPRVDEKHoagrmDGNc2qKUdlzQzprs7CQTI
	XovqhdiNSSYa09ToE+xbRXrI1k7vs6fQIvxCnXOWNcg8kZBbpmrsZN7Zx/9PkEFRQCRAtDjnyvjM1
	Z2x6UobWoR5/3r1GJQG9axUx1UXFQp3G6YU6wbrA7PRQKo6xiWi2Gk/Hk6EdicdsKWC7jSoWS1YAj
	1Vvy9UNRtIp51gWzyYd/3X5LrzUa/iIpnkzU3STjTD8LnxivcwBLsg/KWq8j7Hr901hBMlvDybIo5
	BYEqDDywtcppJW9XX53A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4uvW-00000000dJh-37wb;
	Tue, 24 Mar 2026 06:07:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4uvV-00000000dIV-2lL8;
	Tue, 24 Mar 2026 06:07:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1E4056013A;
	Tue, 24 Mar 2026 06:07:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E10D0C2BCB2;
	Tue, 24 Mar 2026 06:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774332460;
	bh=JP9ahby6Ly1VVw7RxM4srHWXaEIozlGHAWmdpUP2jJ8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=UbNGnKO/tp6ai6834ydA1lQ5PukSdo9guTKRu0aT7uQ94/PBq34Vo08i3GzwU1a7R
	 Cjj86a0rKtbPKnF+oVKFGyOV87WahqlGOu4eDV+h+S5j7x4aPhqGuz+E/DJGQoXOGA
	 wBe47f8pbr/WXEHhTZzzJBCJP9XHj+6UqfGOLICI3RcjHw+35Cz5SRZZcw7k7C/zYj
	 XUieDNECgaPKML2nc7pDk7PgesQln2TdJXIciFo+QXEQm2NonZFnC2+3B6gKw1+DHm
	 Z40BPILv5vYzesqn1zNeeb326JjYakJK+jDAuKVLcvEKgQfH7daPPDxWve9mnoaYbH
	 fSR6hO6kwysDw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FE5D3808200;
	Tue, 24 Mar 2026 06:07:30 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] KVM: Remove subtle "struct kvm_stats_desc" pseudo-overlay
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177433244873.469836.2501898935183219197.git-patchwork-notify@kernel.org>
Date: Tue, 24 Mar 2026 06:07:28 +0000
References: <20251205232655.445294-1-seanjc@google.com>
In-Reply-To: <20251205232655.445294-1-seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>
Cc: linux-riscv@lists.infradead.org, maz@kernel.org, oupton@kernel.org,
 zhaotianrui@loongson.cn, maobibo@loongson.cn, chenhuacai@kernel.org,
 maddy@linux.ibm.com, anup@brainfault.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, borntraeger@linux.ibm.com, frankja@linux.ibm.com,
 imbrenda@linux.ibm.com, pbonzini@redhat.com,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, gustavoars@kernel.org
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
by Sean Christopherson <seanjc@google.com>:

On Fri,  5 Dec 2025 15:26:55 -0800 you wrote:
> Remove KVM's internal pseudo-overlay of kvm_stats_desc, which subtly
> aliases the flexible name[] in the uAPI definition with a fixed-size array
> of the same name.  The unusual embedded structure results in compiler
> warnings due to -Wflex-array-member-not-at-end, and also necessitates an
> extra level of dereferencing in KVM.  To avoid the "overlay", define the
> uAPI structure to have a fixed-size name when building for the kernel.
> 
> [...]

Here is the summary with links:
  - KVM: Remove subtle "struct kvm_stats_desc" pseudo-overlay
    https://git.kernel.org/riscv/c/da142f3d373a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
