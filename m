Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B29BE77188
	for <kvm-riscv@archiver.kernel.org>; Wed,  8 Jan 2025 18:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6vxtvmEVr9VYtUokaxXiLDvxbTaygxKX3zrF3qCRr6Q=; b=gibCxFb07C0u9P
	X/oSHaJwgNSG8fbf9QhXgy7gNatq/KifQn+FXmh6I/6PEpzXx0LpqOfWeFyftklOcTEmUhyczZgUm
	/bwhHjhxK3i3ZJ2JaDUS1tQmqhLzkoxGEh3nL/11CIbli+68yA7SctvNkAWGEs6vd4+pdf5ArUqCV
	wBYEWJV1ulote6K+aebzdS5WolBgCcHK6nfUsUwt6m2seY8kh9Z2w0n9h0yRJyIzovDae35LCnDTc
	Cf6y4+PZjfzmYqLa4KjmKySYq3czx7J1GwI7YfcVeso8a2aJWEyh7fpLxUDE81t9WQaWiGZj6/WkN
	1KVAFM7wQ/ZSieiO10rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVafg-00000009VLs-3JEQ;
	Wed, 08 Jan 2025 18:20:48 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVafe-00000009VL5-1Qlj;
	Wed, 08 Jan 2025 18:20:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 57B3CA4149E;
	Wed,  8 Jan 2025 18:18:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A14DCC4CED3;
	Wed,  8 Jan 2025 18:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736360444;
	bh=6u171gNXjLB4/TNq3luEE/w0znQKDgGkK6H1upLrNfA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=EC0jNKZdPmCJf+xRRnFnY9utSY1l+fhJp8p5E3glRxISiS7V4W7zbTmHVyOI7mBkI
	 pixY+rwqUS5Vjr2Kjb7wRdzg+fcdBmJtDJ8+rLstqivNOcsAuj6XdAKrwSasNzpTbL
	 4RnVZprq52pjkYRhXpsVENCQRk9HR9cJaY+GIwCPI8Cf+98NUaXnv6ujx9qIuiFEJj
	 +gyzhWAFY6MsRIFZ5F6qtbTmI0CA+VQxZCUOmVbqh8xcsaFJoL68eaw+ip3pmb48I+
	 hNcJWjnb21Rs/eVTzsYM2VKq5ZOZhiJUruDnAjoGSxuCcuqzsIEkHvKCCh8zuZ9S8m
	 LwQj5foh+iBvA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70DE3380A965;
	Wed,  8 Jan 2025 18:21:07 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2] RISC-V: KVM: Fix csr_write -> csr_set for HVIEN PMU
 overflow bit
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173636046626.736486.6164615548118337611.git-patchwork-notify@kernel.org>
Date: Wed, 08 Jan 2025 18:21:06 +0000
References: <20241127041840.419940-1-michaelneuling@tenstorrent.com>
In-Reply-To: <20241127041840.419940-1-michaelneuling@tenstorrent.com>
To: Michael Neuling <michaelneuling@tenstorrent.com>
Cc: linux-riscv@lists.infradead.org, anup@brainfault.org,
 kvm-riscv@lists.infradead.org, palmer@dabbelt.com, mikey@neuling.org,
 atishp@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_102046_443609_39FAF7B3 
X-CRM114-Status: UNSURE (   7.88  )
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

This patch was applied to riscv/linux.git (fixes)
by Anup Patel <anup@brainfault.org>:

On Wed, 27 Nov 2024 04:18:40 +0000 you wrote:
> This doesn't cause a problem currently as HVIEN isn't used elsewhere
> yet. Found by inspection.
> 
> Signed-off-by: Michael Neuling <michaelneuling@tenstorrent.com>
> Fixes: 16b0bde9a37c ("RISC-V: KVM: Add perf sampling support for guests")
> Reviewed-by: Atish Patra <atishp@rivosinc.com>
> Reviewed-by: Anup Patel <anup@brainfault.org>
> 
> [...]

Here is the summary with links:
  - [v2] RISC-V: KVM: Fix csr_write -> csr_set for HVIEN PMU overflow bit
    https://git.kernel.org/riscv/c/ea6398a5af81

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
