Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE255FF8875
	for <kvm-riscv@archiver.kernel.org>; Thu, 30 Apr 2026 03:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OB1zIOmZEEIeIt3BGfMiyvHYi/sftcKO3Ay9fCPpG8k=; b=FtXyBy8CpD5gyn
	Hkk5GQlsFBBdhQQ41+pHL3d0Qlqy4wSY57p6Qbxa/eXMqPc4EBpFAVDcGV7K1Oje+IO7/iEPQiPP2
	I2CObypxqv4w0dzfEFGpGGNY+dMkeXUdqvSrj8biLq3wBbHnf3iLhMNk7ywLztjD609SmRf87KU/+
	Vd27jWpAQquvXOu/g64RhfeXzFXRYp42oEutXi7OoYYPdsyWvUrJsV8QdB6KW8L5GULcP9eBZtPdq
	/CQW6JLHhGtgQ7tz70Ce+ZKKfM/zpL+uWIs48rxujQzVCPXzCBeZjmjitRXFBBiWLh3U4JhqGaXYL
	Kv5hJxd0Zn9G8ngAYR2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII2C-00000004WNa-0Vlj;
	Thu, 30 Apr 2026 03:25:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII28-00000004WLI-3OtG;
	Thu, 30 Apr 2026 03:25:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8071444579;
	Thu, 30 Apr 2026 03:25:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6536AC2BCB8;
	Thu, 30 Apr 2026 03:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777519548;
	bh=RtJO1GZhj3koVnHx0qwUJkqHkcUaFGtA/Q7HZ0KFCRw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=U4DSMgrJbaoUSMpvE/6jEHCHrJOiZF+sKcHVUYTOeDJSlN7Ek4P0+BtQz4eM4IkO9
	 ag0RCEK94ydpNWjq78bOCT5UrJ5suiiAnJoPc9TOr1/c3gYbaIiNtK7jKF0JnzyOH6
	 AWW3EHW4benxvlV0k+80SfgLv51TS3h4EeTwUpRbZKV9Tk2qmOzITCUYRqvjAAygxK
	 wmk2IqqxOcPQBfXBYld5gPYhBdS8VU87ioOxshGPIAEDO0ldja0/UZ7O7EUMp0TdC5
	 9GhrfkcNNWocWsC2tSGEHxuwJghcP7ksDlaL6kZlCpdTKmwKarqFnokxKDxcNlvTR7
	 o3pIIIiVrnBdA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9F073809A07;
	Thu, 30 Apr 2026 03:25:04 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2] RISC-V: KVM: Fix shift-out-of-bounds in
 make_xfence_request()
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177751950329.2274119.11010707282482271011.git-patchwork-notify@kernel.org>
Date: Thu, 30 Apr 2026 03:25:03 +0000
References: <20260403232011.2394966-1-xujiakai2025@iscas.ac.cn>
In-Reply-To: <20260403232011.2394966-1-xujiakai2025@iscas.ac.cn>
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org, aou@eecs.berkeley.edu,
 alex@ghiti.fr, anup@brainfault.org, atish.patra@linux.dev,
 palmer@dabbelt.com, pjw@kernel.org, jiakaiPeanut@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_202548_869801_A24F3424 
X-CRM114-Status: UNSURE (   8.72  )
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

On Fri,  3 Apr 2026 23:20:11 +0000 you wrote:
> The make_xfence_request() function uses a shift operation to check if a
> vCPU is in the hart mask:
> 
>   if (!(hmask & (1UL << (vcpu->vcpu_id - hbase))))
> 
> However, when the difference between vcpu_id and hbase
> is >= BITS_PER_LONG, the shift operation causes undefined behavior.
> 
> [...]

Here is the summary with links:
  - [v2] RISC-V: KVM: Fix shift-out-of-bounds in make_xfence_request()
    https://git.kernel.org/riscv/c/ddbf9c76c402

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
