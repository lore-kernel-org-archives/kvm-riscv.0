Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4526BC02193
	for <kvm-riscv@archiver.kernel.org>; Mon,  3 Feb 2025 19:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mKchL+UKLtIGAd9npbBX4RPKKMY64pFq6VAcy9vli6Y=; b=ssU915iBsA5eUG
	3FsY9PIDXPmpNKj60y6XJteEEiomz7J0qPB4FUfiRq+i9zolvTM4pngQEtEa5Qq4QeF7d9TvN1+P4
	qbN+NOWqLZv0W3DLvLiJ2UUP8rmbN8xqXzY8i/gA61bpbufSEjQOZzT+4TvU4+twrknEM3IzoKtnx
	aAUUHySgSN4Re/I69lmv/rHdAXJKYyVVH7jcA1X45qEiuGo4sJBok3L+HQOjgJ3Fd2SAXhDZqicra
	F1yO2F0cn3Drt3FiPWPoUorH1G2E+FVnwKxl5XivaiNQjhJZczIloebKZSURNAoJ0eycwwiYhrzlk
	MYBrHBt/H2kW7dAEHDnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf1xG-0000000GQwi-401K;
	Mon, 03 Feb 2025 19:17:58 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf1uc-0000000GQ5U-1rIU;
	Mon, 03 Feb 2025 19:15:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7C077A41C0E;
	Mon,  3 Feb 2025 19:13:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68442C4CED2;
	Mon,  3 Feb 2025 19:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738610113;
	bh=LsOe7ZzlPhqEAOvTiMeWa8iiWUe9V2RCk8jcWcixhvI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=G7l6g2ZIizTNYrxkBbzlrHOv4+1Ln/d/XodEN9IIjNpde3v5XMCTHWxOixZzN9q8S
	 rN949faoH1AmsOIYguVjeAET/42q9AfHISAy4DRFQbEgHWCmSBiO+usYkZKWGdjuEc
	 aMQcBIql2D2qg7gA+RBA9RSmdWEwkbG4N1MdJNl2d9Oi/XsgVsIqSxEPtd0MwyVq7S
	 Ri2Te1NlEdebGxFUQQ9BBxdOCgHNEZMN3+9wi/ffVR0/mr+a7tjOtFCkp3Ji/v/6sF
	 AnmSnhQNv9bBphD2MWs1sV6pTXMH9eZXUNtFKd4EDmS8MTdZO0pDDD7PU5plQAIbCr
	 GFDVqeo3/KTzQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE0DC380AA67;
	Mon,  3 Feb 2025 19:15:41 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/4] RISC-V: KVM: Allow Svvptc/Zabha/Ziccrse exts for
 guests
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173861014052.3409359.2500361473907016635.git-patchwork-notify@kernel.org>
Date: Mon, 03 Feb 2025 19:15:40 +0000
References: <cover.1732854096.git.zhouquan@iscas.ac.cn>
In-Reply-To: <cover.1732854096.git.zhouquan@iscas.ac.cn>
To: Quan Zhou <zhouquan@iscas.ac.cn>
Cc: linux-riscv@lists.infradead.org, anup@brainfault.org,
 ajones@ventanamicro.com, atishp@atishpatra.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_111514_555094_7BFB3AD4 
X-CRM114-Status: UNSURE (   7.48  )
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

This series was applied to riscv/linux.git (fixes)
by Anup Patel <anup@brainfault.org>:

On Mon,  2 Dec 2024 11:21:26 +0800 you wrote:
> From: Quan Zhou <zhouquan@iscas.ac.cn>
> 
> Advertise Svvptc/Zabha/Ziccrse extensions to KVM guest
> when underlying host supports it.
> 
> ---
> Change since v1:
> - Arrange Svvptc in alphabetical order (Andrew)
> - Add Reviewed-by tags
> 
> [...]

Here is the summary with links:
  - [v2,1/4] RISC-V: KVM: Allow Svvptc extension for Guest/VM
    https://git.kernel.org/riscv/c/0f8915859716
  - [v2,2/4] RISC-V: KVM: Allow Zabha extension for Guest/VM
    https://git.kernel.org/riscv/c/679e132c0ae2
  - [v2,3/4] RISC-V: KVM: Allow Ziccrse extension for Guest/VM
    https://git.kernel.org/riscv/c/79be257b579e
  - [v2,4/4] KVM: riscv: selftests: Add Svvptc/Zabha/Ziccrse exts to get-reg-list test
    https://git.kernel.org/riscv/c/144dfe4017bf

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
