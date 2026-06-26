Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D325CDE00E
	for <kvm-riscv@archiver.kernel.org>; Fri, 26 Jun 2026 08:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=POlgLrAcx4HQ3dB/OeaMVNlgcifFxM2gxNZQIGy3Y8A=; b=IqaYawJ0TERdH/
	4iLHVIt2hTwf9y9cUSMkamTfKhBev3yMMEOsaINBIxWsRbt0T9/QXYATFjaBH7Xui2/KWfGvMf3hk
	pVwgMe1iYhwhcTy6jRkqKVzWPXtnBWVzxcsiEy3CLPOfo/H3W6TiRq1x2VXTWgCY/WzsY8547vN6q
	zxMgwi0h3P3zEJ52/xeLpkFQfhwNJOEtdECCSPVVXBWoE5JERsS9Cye89wQe87HzSYmlbSPYbBd/H
	8pR4O9EuflLePX6xKgCPOyaMmq2oOZXkTEIyo4UBrclYXZlWZwDl0XEVZNgN+vfriXHO4G0qgzPLm
	M9I9fn8upKAl/Zvj2ufw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1pB-0000000AowL-2Hk0;
	Fri, 26 Jun 2026 08:22:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1ot-0000000AoEP-2NJ4;
	Fri, 26 Jun 2026 08:21:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 378A743650;
	Fri, 26 Jun 2026 08:21:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18AD31F00A3D;
	Fri, 26 Jun 2026 08:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782462111;
	bh=72yOiaA8TWoMcBgxP6mWwE+LHov7bJ9rKxn3P+RprOc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=DKaoLeCVBLfxGRUCDD63mz3Yv7wl1NmkyC/oWe1VXxnYgbNOgx8OLIb97BrF9ahWi
	 9/keAucRqysUZAM8A/5IiD86BP+oNc90Y7vaAxe3E8/8cQ0NmxW9/zls0xbx8r6QBW
	 tHZnjpYjiJyQN4U0wFT/X1gcBAXyemKYO4HqQsMjy54TLKkdesvd33LtZi6FN5GxU+
	 vhJEpEXa0WW8Xr5G0nVV3hjoEOnOHOhpuPuem40C3KmCu/gOqyOqma4VMQnFra+8t8
	 HFwZ628Oz/edI1HY69uzGDt9l7vmmnqeBQUy1kcz8Dt4Wr7K5k+utU0I+nvK7y4e5x
	 w/sKB7Uq98upQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 5690A39389E8;
	Fri, 26 Jun 2026 08:21:39 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] RISC-V: KVM: Fix NULL pointer dereference in AIA IMSIC
 functions
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <178246209795.3816447.969073388950467321.git-patchwork-notify@kernel.org>
Date: Fri, 26 Jun 2026 08:21:37 +0000
References: <20260526031517.1166025-1-xujiakai2025@iscas.ac.cn>
In-Reply-To: <20260526031517.1166025-1-xujiakai2025@iscas.ac.cn>
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org, aou@eecs.berkeley.edu,
 alex@ghiti.fr, anup@brainfault.org, atish.patra@linux.dev,
 liujingqi@lanxincomputing.com, palmer@dabbelt.com, pjw@kernel.org,
 jiakaiPeanut@gmail.com
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

On Tue, 26 May 2026 03:15:17 +0000 you wrote:
> Fuzzer reported a NULL pointer dereference in
> kvm_riscv_vcpu_aia_imsic_put() when a VCPU's imsic_state was NULL while
> kvm_riscv_aia_initialized() returned true.
> 
> The global initialized flag is set per-VM in aia_init(), but imsic_state
> is allocated per-VCPU in kvm_riscv_vcpu_aia_imsic_init(). If a VCPU is
> created after aia_init() has already run, its imsic_state remains NULL
> while the global flag is true. When this VCPU is preempted, kvm_sched_out()
> calls kvm_arch_vcpu_put() -> kvm_riscv_vcpu_aia_put() ->
> kvm_riscv_vcpu_aia_imsic_put() which dereferences NULL.
> 
> [...]

Here is the summary with links:
  - RISC-V: KVM: Fix NULL pointer dereference in AIA IMSIC functions
    https://git.kernel.org/riscv/c/76ae7c7ee004

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
