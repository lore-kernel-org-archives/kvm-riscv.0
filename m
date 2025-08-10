Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A764EC87FDA
	for <kvm-riscv@archiver.kernel.org>; Sun, 10 Aug 2025 21:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S4jKNQJBv5VcSBMEiAXIDe+H7blgHNWW0xuqEN0JUEk=; b=kggFvZgHMISeuW
	4tOBR6ekpi9cwvUZPiwgm2wc6C48Sp3KoBdCx+AcuL2KSCbiH+Ht3dW83sqgSaPbqi4e0vwdu7oHc
	TkfJCHTQsVk5yZWOsfsTnjMTdqpcJKgfmEEGnsABC26Ttg2kBBbWv1P9mA9UisvAmMiPN1elt73AC
	bkEIbExhihVsrI5rK99D+TxyyF+UmnmnBwMhaH6YIXNF/W8ag0DY7pr/gfu/kYDeNIPqOzHYOfl2p
	RH2fIJbJJxpUgkJVapn3E6HwJWyDQz5KuoUIQA72w7UMqSXELgCh/+euTLsES2K5OyOGhLqxHJ5qk
	Gt0WM54W3R0AVsR56yyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulDNS-000000060Lj-1FgS;
	Sun, 10 Aug 2025 21:14:50 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulDKr-00000005zXP-2cWw;
	Sun, 10 Aug 2025 21:12:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F1916A5687F;
	Sun, 10 Aug 2025 21:12:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DCEBC4CEEB;
	Sun, 10 Aug 2025 21:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754860328;
	bh=ZK22F6C/xwxn3px53k7HK2LnPgcM6+IW6mZjmVw4kFw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=fyWQ5oooRC6wI8X6P+yvMFj5P/hHuuEVXFYqiAdDrROsJheOK+FCl0ax8qRBG0MH4
	 wTrPfy9PBKTT7rnR1tiCIf5OOSsKxtMA0op0F4VLfQaXvJRDoyfgB0+0jdrEVkk3N+
	 Uwi0TrWouz0jNcmgr8YcfIOnnLQ4IkGuLZo1gAbYetV+005FVY9eAFmDmerFVEb2RO
	 71OS0WbF/mxSum4TUKSSGI/49849ZjfpsYtQimD7ozCY6NF4+DosiaTC22axlmheAD
	 1q2CjvngKZUm3HTxftih68jHazWm2QfgTnFoBmDCTO0octJRac1ZYnAgW6vFQZqbbQ
	 Z07Y65Rmub+Qg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70C3939D0C2B;
	Sun, 10 Aug 2025 21:12:22 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [GIT PULL v2] KVM/riscv changes for 6.17
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <175486034099.1221929.4746664358148231967.git-patchwork-notify@kernel.org>
Date: Sun, 10 Aug 2025 21:12:20 +0000
References: <CAAhSdy1084USuM+k9T-AP7X_=s7x+WFv++U0PkjVojbPbjRCrw@mail.gmail.com>
In-Reply-To: <CAAhSdy1084USuM+k9T-AP7X_=s7x+WFv++U0PkjVojbPbjRCrw@mail.gmail.com>
To: Anup Patel <anup@brainfault.org>
Cc: linux-riscv@lists.infradead.org, pbonzini@redhat.com, palmer@dabbelt.com,
 ajones@ventanamicro.com, atishp@rivosinc.com, atish.patra@linux.dev,
 kvm-riscv@lists.infradead.org, kvm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_141209_729371_BDE758FC 
X-CRM114-Status: UNSURE (   7.38  )
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

This pull request was applied to riscv/linux.git (fixes)
by Paolo Bonzini <pbonzini@redhat.com>:

On Tue, 29 Jul 2025 17:04:22 +0530 you wrote:
> Hi Paolo,
> 
> We have the following KVM RISC-V changes for 6.17:
> 1) Enabled ring-based dirty memory tracking
> 2) Improved "perf kvm stat" to report interrupt events
> 3) Delegate illegal instruction trap to VS-mode
> 4) MMU related improvements for KVM RISC-V for the
>     upcoming nested virtualization support
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,v2] KVM/riscv changes for 6.17
    https://git.kernel.org/riscv/c/65164fd0f6b5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
