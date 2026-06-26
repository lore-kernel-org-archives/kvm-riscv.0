Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63B0CCD4F26
	for <kvm-riscv@archiver.kernel.org>; Fri, 26 Jun 2026 08:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lFGiL8xNDY4oYtRxcqGiZXfpdCCIwlhlmMI0Hji2jxk=; b=yqXl85BM0pNcUv
	nUMaUjB6jfT2ZyhphlaXttBS8CwNtI1wO5pGZyTOYYrmR1RAc4tRGyXSDlhfl/L3CzCwsN+kvIdNF
	ZzYbe6Yk/djlUL8CDsm4bCxb27tFNjlshmFzvC3Hs8bZR7re5yuxsi/soOWcvZ57OdjF+WHLm4D4v
	0inYYDVpMNc+gEf7S26vLHsTk0CVZpJpRmj1GGDgieeRhBAlo/S0zzr9U1FWfixE74cpxYGPhqjM+
	ArkGjp/Osflk65p3rkO4IXrwuoJKckm5V8grZDnzVsizNFy/kh1k5O9SWBJ1wqDmAr82DUxViOQYi
	cGUDhfS+tVuXznLOb93Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1p8-0000000Aoqu-43G7;
	Fri, 26 Jun 2026 08:22:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1op-0000000Ao2V-2EA6;
	Fri, 26 Jun 2026 08:21:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 356F141E49;
	Fri, 26 Jun 2026 08:21:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 186871F00A3A;
	Fri, 26 Jun 2026 08:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782462107;
	bh=mk7h3t64f2TC7G5uCE6P3aFH1vKYFIvF6Dljp3/wEjE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=FL7c2/2NE6NmJK6Wc09lcQ4XlJvQgQzXLv3UtZhOBw9201ZskygEJlGPjs3oEIUuY
	 qvBiSx9M98D+cWajWSPs7DMFnAA37v17A6Ljtosm8oSu5D9YJ3EpYUU6nz6S39zMfm
	 IW4UW2EXTkFeehY8O5/vEza8PGBZsF0AdkRDLNLfC8egQoN7ZD806X2aiakR22HM29
	 uYsv/CExk+RNTlFR4rLTAVjIf/RGtGOEbJiPSjjQGsnE141ggFQGzA20SejpV1wVG3
	 fJXszgqvJwKasROiCUa7NWPiF0WRFNWfmBYEzk5GFc3vFzlmtdOTzM8wUA275y4wf0
	 4PtmVYK93aKcQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 5698A39389E8;
	Fri, 26 Jun 2026 08:21:35 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [GIT PULL] KVM/riscv changes for 7.2
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <178246209390.3816447.5191620601688029372.git-patchwork-notify@kernel.org>
Date: Fri, 26 Jun 2026 08:21:33 +0000
References: <CAAhSdy0WTa-jDxg0cQxwqfGM+Det+WxM-ELV3F2ktrcbw8g7Bw@mail.gmail.com>
In-Reply-To: <CAAhSdy0WTa-jDxg0cQxwqfGM+Det+WxM-ELV3F2ktrcbw8g7Bw@mail.gmail.com>
To: Anup Patel <anup@brainfault.org>
Cc: linux-riscv@lists.infradead.org, pbonzini@redhat.com, palmer@dabbelt.com,
 pjw@kernel.org, andrew.jones@oss.qualcomm.com, atish.patra@linux.dev,
 kvm-riscv@lists.infradead.org, kvm@vger.kernel.org
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

This pull request was applied to riscv/linux.git (fixes)
by Paolo Bonzini <pbonzini@redhat.com>:

On Sun, 14 Jun 2026 15:19:53 +0530 you wrote:
> Hi Paolo,
> 
> We have the following KVM RISC-V changes for 7.2:
> 1) Batch G-stage TLB flushes for GPA range based page table updates
> 2) Convert HGEI line management to fully per-HART
> 3) Speed up dirty logging write faults using MMU rwlock and atomic
>     PTE updates for permission-only changes
> 4) Use flexible array for APLIC IRQ state
> 5) FWFT fixes for missing CSR dirty marking and stale feature
>     exposure to Guest/VM
> 6) Fix logging enable check on a memslot by using
>     kvm_slot_dirty_track_enabled()
> 7) Fixes to avoid skipping valid pages in kvm_riscv_gstage_wp_range()
>     and kvm_riscv_gstage_unmap_range()
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] KVM/riscv changes for 7.2
    https://git.kernel.org/riscv/c/c6f1b611c66f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
