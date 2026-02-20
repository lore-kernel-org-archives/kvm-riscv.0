Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69A0DC531F8
	for <kvm-riscv@archiver.kernel.org>; Fri, 20 Feb 2026 04:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SISZ6FLcCvZ8hqGmezDQ3+oSAE6CWbL06JrRBu7QwZI=; b=F04M20+klptIs5
	RNP1vLRDESoCgZR7vuGXwa0pgpo7KHTFvXyJ7ciPA9YU/kFlASjGkYkIOiC38FjB7tSb/jM7VFbFj
	5S6G6fZ53oeNxuQluAFLRXnP1ybPU/7Y7N3B4dzteqbbch5WEtOFfr7n8O29AdB9FZGBPmMmdaJNa
	hqRlC3mG9v2EdFzJiKxXt6mQWVH18OrIGHmDde0sscn3uyPoHtj8br8vM3k9i3hIQ/hGGn9+sgmIO
	CzRbrlYUOBE4dIFUoN6oLLfLlI5XhdCnd0x6o1Xd8oD6ZrlT0sxUWcQuCmf/3PVAFMruzitDE+xN7
	Zh5nSe903RvSQ01MeujQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtHr8-0000000DCqp-00gH;
	Fri, 20 Feb 2026 04:11:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtHqz-0000000DCac-0dtX;
	Fri, 20 Feb 2026 04:10:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8ECCF61851;
	Fri, 20 Feb 2026 04:10:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C601C19421;
	Fri, 20 Feb 2026 04:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771560656;
	bh=3KVU56LlvB/E74bXL0kiXIK3YWovwzwFpcCv6TDm0yg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=PI8xqvtK6mt4NbScn0lPJJcRTuhp4oZSjEV5Bunk199bmj2O35FGRjyUrG0ucZtwv
	 Sry3bA5yvXF3253Owr+6Y2CnaxKM5TG1sVYwgjaPUHZ3twZ5MLNZJ7n5whiDKx2nFF
	 bz6ONRijkFxar+yzOhAvv4Qhg+pl/ROaVFIz0JIW80Q8C0LZIOjvvvElTU/hKGtrqK
	 eIy3/yUYokjnwhHTpZ5RoqmDfe+k4v+ccLgGMS7LzrK8cXPG1/joPZL0VCXMMJ16Ig
	 /tavtvZ52AbSW/kNnBu0thcamZtTfO2cdraY0OjA7kRtTRD3V6taSv56yzsXXjCjUA
	 Zn2Y5nUyVhhWw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA0463809A88;
	Fri, 20 Feb 2026 04:11:05 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v5] irqchip/riscv-imsic: Adjust the number of available
 guest
 irq files
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177156066430.189817.17794056497252031488.git-patchwork-notify@kernel.org>
Date: Fri, 20 Feb 2026 04:11:04 +0000
References: <20260104133457.57742-1-luxu.kernel@bytedance.com>
In-Reply-To: <20260104133457.57742-1-luxu.kernel@bytedance.com>
To: Xu Lu <luxu.kernel@bytedance.com>
Cc: linux-riscv@lists.infradead.org, anup@brainfault.org,
 atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, tglx@linutronix.de,
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

On Sun,  4 Jan 2026 21:34:57 +0800 you wrote:
> Currently, KVM assumes the minimum of implemented HGEIE bits and
> "BIT(gc->guest_index_bits) - 1" as the number of guest files available
> across all CPUs. This will not work when CPUs have different number
> of guest files because KVM may incorrectly allocate a guest file on a
> CPU with fewer guest files.
> 
> To address above, during initialization, calculate the number of
> available guest interrupt files according to MMIO resources and
> constrain the number of guest interrupt files that can be allocated
> by KVM.
> 
> [...]

Here is the summary with links:
  - [v5] irqchip/riscv-imsic: Adjust the number of available guest irq files
    https://git.kernel.org/riscv/c/376e2f8cca28

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
