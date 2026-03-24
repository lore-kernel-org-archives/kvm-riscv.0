Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA4AEF532DE
	for <kvm-riscv@archiver.kernel.org>; Tue, 24 Mar 2026 06:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UFzMW2+rOAmzcAeS+oAZmMZDqV1KI+FjbQgN6Qj2EHk=; b=DiyT56icKow14d
	YN/e77ki/QG/CR6leZJVtliEpYT4xDZ1sARra+QG4QIuawP/rCus2i896s/+DwTG7ZA0aC6mLZWT5
	W9Bq+q+Iv8rhDpBkEMK0e9XwhKp93j5GIJoa53IwRQK9TWNBO3corhAHMc36BL8+K3YlFFYwdvNqO
	vEE28YDoY1JbBArvT0uPYwuiQ6Ex1Z5Tl7oF7F+3Gb0S43efw37xlOpNymPTr+Yal8HWmHrYGE0cH
	oHIOn7lrq9mD/gjvxf9eyzXJwxxWY7RaLeiUngqJvJLqmqt/n4kiusnMGfQQVle+xKvMOGp56DoQV
	T8JxgYBkwdK+TZ7oNK6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4uvW-00000000dJ3-0bI5;
	Tue, 24 Mar 2026 06:07:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4uvT-00000000dH0-2Rfm;
	Tue, 24 Mar 2026 06:07:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4908940D56;
	Tue, 24 Mar 2026 06:07:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 272E5C19424;
	Tue, 24 Mar 2026 06:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774332458;
	bh=5TiSu/asBer7FpjtJQ/4BOedGtXXS9dtYnxsawzLT50=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=e/dAlcelitlNgqMX3PV9hN3qEIImYy80941mmwKTFHdM70zinBHDdDtYi0OQLW3SZ
	 AxtzJBOaToA0pkYIiu6pUMdH5vPoYGCXeoNMPvORWXTYsFmlOjgDCSpAI4KLogLBDs
	 NicpDBqeiF8S7CCPzVRvTia5NWI2FZvXTK8Eg1hXhExpOwZukr4EkA4diTfZtrXbcC
	 PuddORW7REuHe7Wv/iNvIi6fcdYTxfs/3QvcBy1aN+a9aSlxL8RplWJhLSC91iAMN0
	 WloP4eQO3SqdyF/W3+AKkDT3TUuuObJMheCgUPT+IJHKNW4NGRkisWfyQtrk+otWqX
	 MA3nP66Gvc8iw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 6F9333808200;
	Tue, 24 Mar 2026 06:07:27 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] RISC-V: KVM: Fix potential UAF in
 kvm_riscv_aia_imsic_has_attr()
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177433244628.469836.354325363149940595.git-patchwork-notify@kernel.org>
Date: Tue, 24 Mar 2026 06:07:26 +0000
References: <20260304080804.2281721-1-xujiakai2025@iscas.ac.cn>
In-Reply-To: <20260304080804.2281721-1-xujiakai2025@iscas.ac.cn>
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, anup@brainfault.org,
 atish.patra@linux.dev, pjw@kernel.org, aou@eecs.berkeley.edu,
 palmer@dabbelt.com, alex@ghiti.fr, jiakaiPeanut@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_230739_640362_774098F7 
X-CRM114-Status: UNSURE (   8.59  )
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

This patch was applied to riscv/linux.git (for-next)
by Anup Patel <anup@brainfault.org>:

On Wed,  4 Mar 2026 08:08:04 +0000 you wrote:
> The KVM_DEV_RISCV_AIA_GRP_APLIC branch of aia_has_attr() was identified
> to have a race condition with concurrent KVM_SET_DEVICE_ATTR ioctls,
> leading to a use-after-free bug.
> 
> Upon analyzing the code, it was discovered that the
> KVM_DEV_RISCV_AIA_GRP_IMSIC branch of aia_has_attr() suffers from the same
> lack of synchronization. It invokes kvm_riscv_aia_imsic_has_attr() without
> holding dev->kvm->lock.
> 
> [...]

Here is the summary with links:
  - RISC-V: KVM: Fix potential UAF in kvm_riscv_aia_imsic_has_attr()
    https://git.kernel.org/riscv/c/7120a9d9e023

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
