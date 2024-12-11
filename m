Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70ED6E7717D
	for <kvm-riscv@archiver.kernel.org>; Wed, 11 Dec 2024 22:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bqaY2d4lGF71/Y/E4E59hIg1E8a/ZJuaPWqlahfKjJc=; b=xXHaaxqOjV4tN9
	hYYDb+sOZiNJ2GTdd64lRsVAo8tSk0OB972CJ4+T+NDuegSLo3wDvjyvhGveaiiKwjqc5U95DkHBE
	x9nVTSkfFUVBgdU9ZWQ5ekqQqZ9N5yoXh4sBIB1Z146aFm8u3oZaO70olCFheuYSDDX+3HdtBoiF/
	h7NTw2jCGGpyYyo/7C0S1NqZYNphYcX2csXgyMnakpS+YeM6mntTClXLeOHqGH+he2COOfFiyXm3/
	ioXmRGIrl6OY3ZlyJZchhebMC2OlRqLFNO7aIzPflBRhMnGu73lNaZoddD3vvvaE3IR31jrmz3xRH
	2vxkkwboxbKPwSFwy3ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLVGr-0000000GLCr-0IZl;
	Wed, 11 Dec 2024 22:33:29 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLVFl-0000000GKNm-1Ck5;
	Wed, 11 Dec 2024 22:32:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0A699A41D67;
	Wed, 11 Dec 2024 22:30:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D0CDC4CEDF;
	Wed, 11 Dec 2024 22:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733956340;
	bh=SL+9+Q0zX1tM74INOwLbIbE4XWzgTiWIBxGgYOOTQlo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=TZTzYvxN3lAr1c8GNo20ftFB1GrsFS6HFevwYdyB3ZdD18BUJaddBMvh9vgJ0V1pk
	 LX0zaiKMTZ/gElqmc0M1mW1FBq0kxQWpSHOlhm+i6Sv0hewEmgnfSabuhT3oj5+qeX
	 1iQ3igxD+o3M6k61DvkNf8Ry4ZZWvtp4GEBtjGJDWHBrbknZNNVM1ct6o3VAHMz+v/
	 6MBOQ+/7ooQzOl2B9pDpDYluTWxfCevgVnSyIN8qY18UWcalk654rM7/+3Gy7rylPi
	 9/crC0u+6mbfAznZR3RejbGEZo3d940T8IpkqUQ5pcyFA9jarjp9yqET3++bAlkPna
	 dXfF37wgf0iJA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70E18380A965;
	Wed, 11 Dec 2024 22:32:37 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/1] RISC-V: KVM: Fix APLIC in_clrip and clripnum write
 emulation
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173395635599.1729195.3021974708700896861.git-patchwork-notify@kernel.org>
Date: Wed, 11 Dec 2024 22:32:35 +0000
References: <20241029085542.30541-1-yongxuan.wang@sifive.com>
In-Reply-To: <20241029085542.30541-1-yongxuan.wang@sifive.com>
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, greentime.hu@sifive.com,
 vincent.chen@sifive.com, anup@brainfault.org, atishp@atishpatra.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_143221_389829_4B2840AC 
X-CRM114-Status: UNSURE (   9.57  )
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

On Tue, 29 Oct 2024 16:55:39 +0800 you wrote:
> In the section "4.7 Precise effects on interrupt-pending bits"
> of the RISC-V AIA specification defines that:
> 
> "If the source mode is Level1 or Level0 and the interrupt domain
> is configured in MSI delivery mode (domaincfg.DM = 1):
> The pending bit is cleared whenever the rectified input value is
> low, when the interrupt is forwarded by MSI, or by a relevant
> write to an in_clrip register or to clripnum."
> 
> [...]

Here is the summary with links:
  - [v2,1/1] RISC-V: KVM: Fix APLIC in_clrip and clripnum write emulation
    https://git.kernel.org/riscv/c/60821fb4dd73

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
