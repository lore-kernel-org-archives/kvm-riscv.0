Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0AC9CDE013
	for <kvm-riscv@archiver.kernel.org>; Fri, 26 Jun 2026 08:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j3ozG26KDQClvHLbQvPlpJGjioznRJex47iAmm/wbGA=; b=R1+eUStymfDB49
	xg1DSB9giEiB3+C6u01q+r1YuDhsiMSkMH6x7DBSPL+aJAFDSJUEsNSLl4k3dNAG2HPGcXjLrF3o0
	mzby//R71HsDKQ4P1HFbN/0LtyEaENd+/zR7NG5mj9PMyeMOeiSj5dWo+ZSr34cAluKVznPZh4Qf5
	wyQAUi+1acs/IpwyLVbtV+KIYLkUwXVltFg7Kqrh4Ayz6hUI3m1XG0WZ8o5C7+tI+n79YoL+/3sVq
	X6EVjDBU+cDJAEoQMY3pbnAKlxQhjAZPDe1vKGFAwgNSVvRTHXwF2G/joyEZzbbMR1UT9Rti8vL0J
	lQOeKufxuPtvSd4RogWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1oN-0000000AnAZ-0WoQ;
	Fri, 26 Jun 2026 08:21:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1oL-0000000An6e-1pIW;
	Fri, 26 Jun 2026 08:21:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3433C419A8;
	Fri, 26 Jun 2026 08:21:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 167DD1F00A3D;
	Fri, 26 Jun 2026 08:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782462077;
	bh=B5R9EaYncZkXDWvxwVpfZCNbo6uu2MiUO7r8Emfv8vo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=T9jnzJSYGxTlYaYKe0nBjZNa0hbP4E3pmzFdP2LeEP/dKPjmP0tg/eZMPPfCV2+NH
	 9tGxT25LwknlXlbtv7RGSU/BNTJjJ0h652zeOk0JGf/rqXu6Mnz/IVV0M3qtISv9OZ
	 r+wIk2RDmlPPJyszUP+BZ17gbZkhzs7ZDY40sa6Y/i1xG4iFedLrnWJYVh+SGaSF8Z
	 LMvYJoB97Oc85lvJYMPJEMzGAujT77kvoJ+jZ5C2ojEKPvedzP0mkp1bhVpwXVsLJc
	 bTNtdHkxkDdEL9FmYwNc1MadPY+WzOg26A0XTS0tQ+685QbZgKFGyznTcHg8hZgxyO
	 WGoaJYIKYEHJg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 531AC39389E8;
	Fri, 26 Jun 2026 08:21:05 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v5 0/2] RISC-V: KVM: Convert HGEI management to fully
 per-HART
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <178246206416.3816447.5019323970795639399.git-patchwork-notify@kernel.org>
Date: Fri, 26 Jun 2026 08:21:04 +0000
References: <20260525094945.3721783-1-anup.patel@oss.qualcomm.com>
In-Reply-To: <20260525094945.3721783-1-anup.patel@oss.qualcomm.com>
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: linux-riscv@lists.infradead.org, pbonzini@redhat.com,
 atish.patra@linux.dev, tglx@kernel.org, palmer@dabbelt.com, pjw@kernel.org,
 anup@brainfault.org, andrew.jones@oss.qualcomm.com,
 kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, guoren@kernel.org
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

On Mon, 25 May 2026 15:19:43 +0530 you wrote:
> From: "Guo Ren (Alibaba DAMO Academy)" <guoren@kernel.org>
> 
> This short series converts RISC-V KVM AIA's Hypervisor Guest External
> Interrupt (HGEI) line management from a global "one-size-fits-all"
> model to a fully per-HART (per-CPU) model. It also performs the
> corresponding changes in the IMSIC irqchip driver.
> 
> [...]

Here is the summary with links:
  - [v5,1/2] irqchip/riscv-imsic: Add nr_guest_files in per-HART local config
    https://git.kernel.org/riscv/c/59ebc16276c5
  - [v5,2/2] RISC-V: KVM: AIA: Make HGEI number management fully per-CPU
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
