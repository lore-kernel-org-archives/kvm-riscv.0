Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACFF3C87FD3
	for <kvm-riscv@archiver.kernel.org>; Wed,  6 Aug 2025 17:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XSQK9HmBmLilFBcaMRF/eLLMbmHgjqHU3yCs0pR0i2E=; b=uW0Eks8vAW2cSt
	5/MHHlHpGaVKkEPLuegpqrmTXWQ71ePzuGAmdV17jMSlhfczSheVfJJp9g0j4mMYVs21uPasndAo0
	FQC1fhjbenxZY3Es0OlIrBiizjJ+Bl/ephioEmCfRE8clGLZhWYRcBcT0+CMfVcQn6rzREMmlGwnj
	bSU8Ye+1qAc2pJG26yZggvzWCIQTZjCXWQJUkEMDPLBVynoqM6EbG3bt7vuxl2b6XMyLCHNujjKiJ
	jhwK+Ur+1JIRpaulu1YIHcG8E0Mjv+4bWsBUUaLprnh5TRsHZChQtW9+5WSjnh0Xi0pnh+iwwlTXm
	sKFFKKmnIcasOsaOj5hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujhnq-0000000FtHp-1bAV;
	Wed, 06 Aug 2025 17:19:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujhjb-0000000Fs5u-16ec;
	Wed, 06 Aug 2025 17:15:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 05D3C45EDC;
	Wed,  6 Aug 2025 17:15:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD6EEC4CEF7;
	Wed,  6 Aug 2025 17:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754500526;
	bh=4O0lpFS2A9Ol5YCPqBXxI2WeTeZTQ0FHJZhde9pVFxY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Ua+YVdetR6avGAde1rm4P69RtWpZrn3naIzqZLCt7YA4lFX3NtNGCM860Wb8Nuybh
	 O2zmBGVlXQjcfqy4Jr8bn7oK0FCRC4oUjLQHFaGY21TpdrBNZKE2eExTRIp4iOt4uW
	 ImA1sS5tqs/GByK9CyiXaaB1wwi0wMaXUrjIQ/et8yvJgdGcFSk2pzzfuy3g3pUQu0
	 iB16CLr60MtF1xWHRhGIJjNS8O0x/7un/8iEaZ850e4ZBuvOuyszhlcKppX6mnvjAR
	 6jUpi5NFr2QSVMAO44hI8sQR+yCyg5VJ2uYjNBRFw6OxmMjeFxmvws3WVX3+RoX9Wh
	 ONbYZvSauIbfQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAD6E383BF63;
	Wed,  6 Aug 2025 17:15:41 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/2] Few timer and AIA fixes for KVM RISC-V
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <175450054049.2863135.4614852920454002653.git-patchwork-notify@kernel.org>
Date: Wed, 06 Aug 2025 17:15:40 +0000
References: <20250707035345.17494-1-apatel@ventanamicro.com>
In-Reply-To: <20250707035345.17494-1-apatel@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, atish.patra@linux.dev,
 palmer@dabbelt.com, paul.walmsley@sifive.com, alex@ghiti.fr,
 ajones@ventanamicro.com, anup@brainfault.org, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_101527_323390_D630E2B3 
X-CRM114-Status: GOOD (  11.23  )
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
by Anup Patel <anup@brainfault.org>:

On Mon,  7 Jul 2025 09:23:42 +0530 you wrote:
> The RISC-V Privileged specificaiton says the following: "WFI is also
> required to resume execution for locally enabled interrupts pending
> at any privilege level, regardless of the global interrupt enable at
> each privilege level."
> 
> Based on the above, if there is pending VS-timer interrupt when the
> host (aka HS-mode) executes WFI then such a WFI will simply become NOP
> and not do anything. This result in QEMU RISC-V consuming a lot of CPU
> time on the x86 machine where it is running. The PATCH1 solves this
> issue by adding appropriate cleanup in KVM RISC-V timer virtualization.
> 
> [...]

Here is the summary with links:
  - [v2,1/2] RISC-V: KVM: Disable vstimecmp before exiting to user-space
    https://git.kernel.org/riscv/c/57f576e860d3
  - [v2,2/2] RISC-V: KVM: Move HGEI[E|P] CSR access to IMSIC virtualization
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
