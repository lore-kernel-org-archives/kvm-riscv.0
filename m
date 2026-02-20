Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22B21C531E4
	for <kvm-riscv@archiver.kernel.org>; Fri, 20 Feb 2026 04:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KBP7vOHPJFMbcT+vc9DYP0xD6P+YUNRNXpRp8fAK/Jo=; b=4nRjKsud0Q7dH8
	ZyTRexnZv6RbZw8CPtFUh17cboHqnV+G4Fw6Q5rb39CPRhfJszpOgvJg7ut3tmPBPPclRTUf0omcu
	Yp0Hu7LdKA2tccT1Fymj1dC7ZGkJrNmUurFX2RNzLUrXfL4hweuzoenaiIGEFT//dYm8OelUrUYX5
	GZ4UqCb4Zzh3n7zLTsBU1IkpnZq2ziYYap0bvGt5LFEF4+zCOIDI+6T6HCTgZI3WA2hz4ePCVgBbN
	QawpedRA7XQGbSQ6WYzGPsX6ytwoW7LNH5McUUwZKu+2G79Jdg8V2454jjbNv8UC3v0Un5ByotWfZ
	o9//3JFbSGKpguqqIXBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtHr7-0000000DCq8-2Ws7;
	Fri, 20 Feb 2026 04:11:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtHr0-0000000DCb2-2Nl8;
	Fri, 20 Feb 2026 04:10:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EF2036184C;
	Fri, 20 Feb 2026 04:10:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94B12C19421;
	Fri, 20 Feb 2026 04:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771560657;
	bh=B9ojwB1QasO9eFz6CVWrutapCwSRDIdZql1m4r+SU+U=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=R6V6kP0b2K0E4zkJZCAWAYnE5G8mAjpiMEQdidmAH4I9Dx2YsY4O/b1KztZfm4Nxz
	 Lq/sng3k3At1ZHCTHzdppW6WihanXP+64wYH1osYwqIpmOvbRPHOjnMqS1Jkv0bE9g
	 hnRiqFJWjWMOeBJ05jmObWilO6+Dp4r75MaH8VlDGH2cmCn+h4aVU8Rmtt+POVPqVh
	 4rHAbZ1qS2KvYuQVcCfYXO+gjE/cZKbbOusBbHdjUhOVI4709oKPAuh62bTwUeMSDF
	 vLOOEmvvr3VlG2+lIvjvdwcmGtLPUEShkhtkrE2Ht5Hp3oW85jcch1dfqxu0GTNadp
	 5w4+FzcEa1MkA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FCC73809A88;
	Fri, 20 Feb 2026 04:11:07 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] RISC-V: KVM: Fix null pointer dereference in
 kvm_riscv_aia_imsic_rw_attr()
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177156066578.189817.1206944543601300200.git-patchwork-notify@kernel.org>
Date: Fri, 20 Feb 2026 04:11:05 +0000
References: <20260127072219.3366607-1-xujiakai2025@iscas.ac.cn>
In-Reply-To: <20260127072219.3366607-1-xujiakai2025@iscas.ac.cn>
To: eanut 6 <jiakaipeanut@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, anup@brainfault.org,
 atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, xujiakai2025@iscas.ac.cn,
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

On Tue, 27 Jan 2026 07:22:19 +0000 you wrote:
> Add a null pointer check for imsic_state before dereferencing it in
> kvm_riscv_aia_imsic_rw_attr(). While the function checks that the
> vcpu exists, it doesn't verify that the vcpu's imsic_state has been
> initialized, leading to a null pointer dereference when accessed.
> 
> The crash manifests as:
>   Unable to handle kernel paging request at virtual address
>   dfffffff00000006
>   ...
>   kvm_riscv_aia_imsic_rw_attr+0x2d8/0x854 arch/riscv/kvm/aia_imsic.c:958
>   aia_set_attr+0x2ee/0x1726 arch/riscv/kvm/aia_device.c:354
>   kvm_device_ioctl_attr virt/kvm/kvm_main.c:4744 [inline]
>   kvm_device_ioctl+0x296/0x374 virt/kvm/kvm_main.c:4761
>   vfs_ioctl fs/ioctl.c:51 [inline]
>   ...
> 
> [...]

Here is the summary with links:
  - RISC-V: KVM: Fix null pointer dereference in kvm_riscv_aia_imsic_rw_attr()
    https://git.kernel.org/riscv/c/aeb1d17d1af5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
