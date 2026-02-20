Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 227E7C531F8
	for <kvm-riscv@archiver.kernel.org>; Fri, 20 Feb 2026 04:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qsrdnf3oarqxNqXVYn+EzxjJe0SMH3nwNjyWKeIpHEI=; b=me5kx7vfLe8+Tz
	mMdJSvIY+S/OZzeeG3j0gmQ33ePhSoG/eJU0CxtmWLZ4quweADTnUgk/z2GdpDabI2RZrt/j2hlR1
	Ok+qFsl4B2pfIZOePqhNI8pqyTROIbn+IihB56iN9FywKwnrVaKtJI9eYufVvM/rISIJl056zNypZ
	qgzDoXaqZ0b/KeofBi3EpZAmITmdjEC/wRxMLrqWU78HhDv2XPNdQKAwJ0XCp3gpCVxYWNYfveb9S
	Bz39+sGKGIWkNC5muqGN8dB7m9O7c0bHoT32ZPnRUj2R0v6jH40WgVwsaflG/fS7dvI2rOfVVoSXf
	J/WbIJ17CAuGB54XWcrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtHr3-0000000DCiD-3NZ1;
	Fri, 20 Feb 2026 04:11:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtHqu-0000000DCUw-1iyG;
	Fri, 20 Feb 2026 04:10:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CA3A46184C;
	Fri, 20 Feb 2026 04:10:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96E5DC19421;
	Fri, 20 Feb 2026 04:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771560651;
	bh=evdnVFP154xQL1h2OcymHWYDUXgDAm2JlzKuv7gRIj4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=bjHLnJFfgZqUcJ1oX9WN/ZiccgQNg8JncNFzs31xxTRWUlnKNa5PO/Dqb47ef+sZR
	 tFn9N/9le0ZAudJ7/uH2aX06UIMGI3v7VClm3KFESeJbQ4yVgjXNOiSow0kMioK4bb
	 +4y7mS5u1w8idSQwRC8gIWoCH/vBjV5R3Ng4+W2S/XBnq7o1ygM4/2Bq6qr59DqBIS
	 b9yPRl+ijbS/nL2/WQlYKBxcDMN3Rp9LR0xmvmysoAn9mqlh/Hs6uadGaPHl+0Xw4K
	 mMs0Ywfb/nzhhkMJCR5PFwm6AJklxceQtA3747QdjMCBWOB2pLNkkxV1+pLRmWam41
	 PtY6CIM6IMP+Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 400BA3809A88;
	Fri, 20 Feb 2026 04:11:01 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v4] RISC-V: KVM: Fix null pointer dereference in
 kvm_riscv_aia_imsic_has_attr()
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177156065978.189817.14743297362954778130.git-patchwork-notify@kernel.org>
Date: Fri, 20 Feb 2026 04:10:59 +0000
References: <20260125143344.2515451-1-xujiakai2025@iscas.ac.cn>
In-Reply-To: <20260125143344.2515451-1-xujiakai2025@iscas.ac.cn>
To: eanut 6 <jiakaipeanut@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, alex@ghiti.fr,
 aou@eecs.berkeley.edu, palmer@dabbelt.com, pjw@kernel.org,
 atish.patra@linux.dev, anup@brainfault.org, xujiakai2025@iscas.ac.cn,
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

On Sun, 25 Jan 2026 14:33:44 +0000 you wrote:
> Add a null pointer check for imsic_state before dereferencing it in
> kvm_riscv_aia_imsic_has_attr(). While the function checks that the
> vcpu exists, it doesn't verify that the vcpu's imsic_state has been
> initialized, leading to a null pointer dereference when accessed.
> 
> This issue was discovered during fuzzing of RISC-V KVM code. The
> crash occurs when userspace calls KVM_HAS_DEVICE_ATTR ioctl on an
> AIA IMSIC device before the IMSIC state has been fully initialized
> for a vcpu.
> 
> [...]

Here is the summary with links:
  - [v4] RISC-V: KVM: Fix null pointer dereference in kvm_riscv_aia_imsic_has_attr()
    https://git.kernel.org/riscv/c/11366ead4f14

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
