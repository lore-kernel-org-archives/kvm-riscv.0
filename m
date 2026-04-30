Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12B32FF8875
	for <kvm-riscv@archiver.kernel.org>; Thu, 30 Apr 2026 03:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y+R6ASel9xvm6zwmi0fGZrKbRLRrUcDLr7Sjb/x2/rY=; b=TeBLrfBwmZYGf2
	dPLtmPY66P3P7p1lMtDVMYNdvjcHQYWY6kJyBcS5C0b/YfFaAq8s8K1J5K1fL88AhsHRarWZsSerq
	kw+qTzItxhko8P2gRdbvXDtjWb56wO6lwSpWzTg5wRGCm/iigBy4P6m6p4hRjRTSxyBLqMdCO7kK3
	WEV9PNB+W7HOGBp8CVz58X+urwiHN1TKoVPIAX+7YOAXmoyr1cfYcjEb5OA+HyX7jbUloTs0lFWfJ
	1JZsgyTi5uchJYA+Mcr+q6Bx3QNRXpXn+ETtcIedbkl8zloSYS2bYzwZgZuDoSYvZTZQA5TzhnSZy
	X0uT3MMSj5DxK74+PaRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII3m-00000004Xii-2691;
	Thu, 30 Apr 2026 03:27:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII2b-00000004Wdu-1plB;
	Thu, 30 Apr 2026 03:26:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1237744586;
	Thu, 30 Apr 2026 03:26:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6296C2BCB8;
	Thu, 30 Apr 2026 03:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777519576;
	bh=IDMWKx8m6rNQw0ZCNz9wwYzKSr4KAa3cIQDkV5a1RQo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=M8Us4xSbzW4gFQLD5L2V5yXNmiyJU9gy+rzMDUnwTCB88wRZeyRQcGUMytmIcBwNP
	 yqZbEoMkICm7T1yfU41bAt8YuRwSnZ/p/8XRi81LwYi467rYrw4QAzZl5w21rVZvVM
	 xC1HT1M81B8iE0n8NbczE5vX+CA6iqi2NknOcacNclVWNgL3Ewg3+DuFJgAEnaEV/k
	 Gv5b8q3TSRljOzFUUmvLr4gMVfIXDgHdK4jtxJGCFX5ZhUICR2CgD+26NcFYlTO1i7
	 XLNhEdPUAt9/Yor6L9JV4Ix723edKFA77rZ8FjcrGsnU6hEctaOdvYL9puAb38hD2N
	 XauPp6jwxGbMg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FE2E3809A07;
	Thu, 30 Apr 2026 03:25:33 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] KVM: riscv: selftests: Implement
 kvm_arch_has_default_irqchip
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177751953180.2274119.17183218206073663905.git-patchwork-notify@kernel.org>
Date: Thu, 30 Apr 2026 03:25:31 +0000
References: <20260402101818.2982071-1-mayuresh.chitale@oss.qualcomm.com>
In-Reply-To: <20260402101818.2982071-1-mayuresh.chitale@oss.qualcomm.com>
To: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Cc: linux-riscv@lists.infradead.org, anup@brainfault.org,
 atish.patra@linux.dev, pbonzini@redhat.com, shuah@kernel.org, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, seanjc@google.com,
 maz@kernel.org, oupton@kernel.org, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_202617_734004_8D401B3B 
X-CRM114-Status: UNSURE (   8.46  )
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

On Thu,  2 Apr 2026 15:48:14 +0530 you wrote:
> kvm_arch_has_default_irqchip is required for irqfd_test and returns
> true if an in-kernel interrupt controller is supported.
> 
> Fixes: a133052666bed ("KVM: selftests: Fix irqfd_test for non-x86 architectures")
> Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
> ---
>  tools/testing/selftests/kvm/lib/riscv/processor.c | 5 +++++
>  1 file changed, 5 insertions(+)

Here is the summary with links:
  - KVM: riscv: selftests: Implement kvm_arch_has_default_irqchip
    https://git.kernel.org/riscv/c/1ec8bea903f4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
