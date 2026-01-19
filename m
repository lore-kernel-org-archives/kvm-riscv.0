Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67BBED29C2F
	for <kvm-riscv@archiver.kernel.org>; Mon, 19 Jan 2026 14:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+u+MYXFG4d/TWOt0CMF1KyfDXLnPRj7EMowLjBkBn1c=; b=3/0b7sM0lyIu5x
	UGd/g62ByYIt0V1w8l6t4gR3Lq1HCEkbtsjWB2mZ//Wjxer0CbIj8z/qw1E/Ehx2nNx5DpRJU3N4J
	+YZ1gHW3cBkpeb1aY6cmE9D0COFrAhlBUnA1lIUcFYCDNWvjj7SzXdDnj6HLGMzmlNAyTurV6YYYQ
	wB+I8dd2sf0u3SKkkUqqswS3GfD6KQSX5IoDaEGE/IQVNz7H7Lt4zYXd3fyFOMIOqOJSzCukNMUQG
	Ty9AhrBT/BBnQXLMDr7Lr4ROC7AWVJSkXO2YdxXDZOG8OafZOFI6Fh9bje9taEBBaySGHIFSm0wQL
	ZUQ2QRVHAf3D209tFpnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhqBh-00000002FPz-0KbI;
	Mon, 19 Jan 2026 14:25:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhqBf-00000002FOv-3Mwg;
	Mon, 19 Jan 2026 14:24:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BD99060131;
	Mon, 19 Jan 2026 14:24:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E947C116C6;
	Mon, 19 Jan 2026 14:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768832698;
	bh=v1sciITZqN0hNvGR0YzBR4kuRnBvQjIP+4ux4WD5CyU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=KEOB9ZqKNWr/46rFUwYztJpvzzegFANcAGg4i+uPBerrQW/9MFwcaxg93QkKgwX2A
	 RorMQMZWLGF3y/InfycmU3zNtLYf8EhHFQEu4qOZ40M0tcCjQ8TqSnwPVenb4pQDpA
	 2xU4/vQhjDW81pcmCn0ETs252dA5xp/DzdVPnQPL/eiKLTFwpktN9OoHddyb0lh8bj
	 vk/cJRz9Ez7+fCJjEvKajofyfEeGLDjTEPh7KLGv48J0XLdo+noiHj/NmKJhMW7QZT
	 QJAMdaMU4dJQHL1xj5wt0mzB5oxF8xlKqe4UkvDK72lD+TOqbwgHJHUCY0/8rtjXDm
	 ZMPZa6HJwpb3Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 788633A55FAF;
	Mon, 19 Jan 2026 14:21:29 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] Revert "irqchip/riscv-imsic: Embed the vector array in
 lpriv"
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <176883248829.1426077.16023211489280922945.git-patchwork-notify@kernel.org>
Date: Mon, 19 Jan 2026 14:21:28 +0000
References: <20251223143544.1504217-1-anup.patel@oss.qualcomm.com>
In-Reply-To: <20251223143544.1504217-1-anup.patel@oss.qualcomm.com>
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: linux-riscv@lists.infradead.org, tglx@linutronix.de, palmer@dabbelt.com,
 pjw@kernel.org, alex@ghiti.fr, sunilvl@oss.qualcomm.com,
 atish.patra@linux.dev, andrew.jones@oss.qualcomm.com,
 samuel.holland@sifive.com, anup@brainfault.org,
 kvm-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
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
by Thomas Gleixner <tglx@kernel.org>:

On Tue, 23 Dec 2025 20:05:44 +0530 you wrote:
> The __alloc_percpu() fails when the number of IDs are greater than 959
> because size parameter of __alloc_percpu() must be less than 32768 (aka
> PCPU_MIN_UNIT_SIZE). This failure is observed with KVMTOOL when AIA is
> trap-n-emulated by in-kernel KVM because in this case KVM guest has 2047
> interrupt IDs.
> 
> To address this issue, don't embed vector array in struct imsic_local_priv
> until __alloc_percpu() support size parameter greater than 32768.
> 
> [...]

Here is the summary with links:
  - Revert "irqchip/riscv-imsic: Embed the vector array in lpriv"
    https://git.kernel.org/riscv/c/a33d16dc874a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
