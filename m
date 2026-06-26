Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 328A7CDE012
	for <kvm-riscv@archiver.kernel.org>; Fri, 26 Jun 2026 08:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h/UorBnVYlMlGcRVfEESGNDWpj4cvdNfDAJWTr5l/BU=; b=TgyvyuICR2rn6L
	zPKS8JD/UN5PJ16Fpyx52fD74S4wdzaT3UA7X/JKz/u3EoFnP3ss0CfVW9kdkTvdhhSvZsC7aH1PP
	gNk3AzgzqfWiWHfy6V72Zq1gUQovBlJA/bn/bTApTsmrXtFjY3X5yAoDBojHBJsPxST3537NDqYDL
	Z82RD4/qfsO78Wd9uAIsXXM6oGQipNAQ43rdo32wXrlAG0ujS8wnzT9Ivuz90fhgbqQna+gg+HSBL
	l4jcPfs99IygPxBmgfEmuV3Gi/sIcnlEuiI30H0CpbzjfUET9bIg/m7XGu3zRpOuWOwIFEARSO2Q4
	fZFe92Bb5Tlfg7EK5rcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1p6-0000000AokQ-33X0;
	Fri, 26 Jun 2026 08:22:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1og-0000000Ank4-0QqY;
	Fri, 26 Jun 2026 08:21:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2690E6021A;
	Fri, 26 Jun 2026 08:21:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFC1E1F00A3D;
	Fri, 26 Jun 2026 08:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782462096;
	bh=5bdyaQScC5yxhGtHkOxVkC1utqWcnR2A5uiAb1rzExE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=TYAaSqi0jPz/YuW5AFJNSp0ysnIokkd6BattnJBHSvG6/gt61mTJCv1OSGRrewaHv
	 3J2mpaEm3Iu3q2EN/gvGe5ZWnvaBvMZynHHRh0olFEPayEpeGbTDgc3rQ9Kex+IDhI
	 9bPEJat8OyHqJNHkejMiZ5zNeRHspizduJt+6r8iXKePvk92ufaeYilT01W2GOVMdp
	 XjY6coBfzvgCE3suJ69LdqNyXo09sVuPqmx38CTu1n4eZ7utdl2kAz2Tf4EWoDQLaa
	 WQRb+w6dxVrCedOW9CsNLH9yTou1Hvd7IM8JjmJK3bB1dFqCbTQWSYUOZQUuARNrEb
	 FkgccnXidLbmw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 197E639389E8;
	Fri, 26 Jun 2026 08:21:25 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v1] riscv: kvm: Use endian-specific __lelong for NACL
 shared
 memory
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <178246208372.3816447.9810005317307164502.git-patchwork-notify@kernel.org>
Date: Fri, 26 Jun 2026 08:21:23 +0000
References: <20260608155252.4292-1-seanwascoding@gmail.com>
In-Reply-To: <20260608155252.4292-1-seanwascoding@gmail.com>
To: Sean Chang <seanwascoding@gmail.com>
Cc: linux-riscv@lists.infradead.org, anup@brainfault.org, palmer@dabbelt.com,
 atish.patra@linux.dev, pjw@kernel.org, aou@eecs.berkeley.edu, alex@ghiti.fr,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
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

On Mon,  8 Jun 2026 23:52:52 +0800 you wrote:
> When compiling with sparse enabled (C=2), bitwise type warnings are
> triggered in the RISC-V KVM implementation. This occurs because the
> user-space data unboxing macro '__get_user_asm' performs implicit
> casting on restricted types without forcing the compiler's compliance.
> 
> Additionally, raw 'unsigned long *' pointers are used to access the
> SBI NACL shared memory, whereas the RISC-V SBI specification mandates
> that these structures must follow little-endian byte ordering.
> 
> [...]

Here is the summary with links:
  - [v1] riscv: kvm: Use endian-specific __lelong for NACL shared memory
    https://git.kernel.org/riscv/c/52738352a6f2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
