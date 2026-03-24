Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD929F532DE
	for <kvm-riscv@archiver.kernel.org>; Tue, 24 Mar 2026 06:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hyrb6qWQWww86jSIQVxorX9G67+X28hQU6g1g4lNbg4=; b=NQbcaIP45DgmZJ
	ebn3iM5D0CQLlU1DRkHj1PUzgjsFurNMllRYZetIWYiuxcfzHyy/abDhq+V8TFU/dcl28/ANDczcf
	VeORfH+iejCDS4yjF+rm/lcILtE6udwfIgdVxLF7sqWGdzWJYiIxnV/IzQ39WpYKLDgqkjpHW7WDj
	5Bw4+CO6pG7Kf1ExKl8C2R1soTA9mH8VGNkufs+dAzvU5PcH/hy3qEGrxFe2+VJZrX2PB9iC5nqvR
	rUlPHK8zVX5X58JGvE0HsB241vwmbpl0kClkppdU1/GwU8Eedy76+0ew2jflvZAfV9nrD2syHipt7
	vbZoZDxCCH7j6M+nxj/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4uva-00000000dOJ-2Oeq;
	Tue, 24 Mar 2026 06:07:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4uvX-00000000dJg-1i8a;
	Tue, 24 Mar 2026 06:07:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8A4AC41AD2;
	Tue, 24 Mar 2026 06:07:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69F02C2BCB2;
	Tue, 24 Mar 2026 06:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774332462;
	bh=5zNUfjCbe4xMMri1P2HaByUJAkjQzA8Nb9ip9FvYKes=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=byrCHLeFhkP2m2kqESbzXZCxNMNC//4fVSFc9OeISJD1jNXl+AxwmfLgRdod4s1oA
	 Oa72XoY5nRRjIvgFlTXq0Vi64GALRTxTUZvjB4l2/2o2eiMUv86OyfTtFQRnnnc84Z
	 cnPBrH5NSBZbBdFMhHQurVK8qLDbgjZpM8kEkZ2nwz5lvqfVGa6IwLDxNPmI/lKtMl
	 C4x4ei+7qwP2MIzEAzo6VgyvQZPsB+JHpK8TvHvAiyqZEer5QShnK/Fl59vZADpGme
	 QiIA0Kz4We8WXDmOFR0/fH8YvVu9A9ABD5T6VdX+IzjWeY3aB/j7liGA4P+8xPNWE/
	 eB1ZlnfTnv+Qg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B72183808200;
	Tue, 24 Mar 2026 06:07:31 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/4] KVM: riscv: Fix Spectre-v1 vulnerabilities in
 register access
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177433245028.469836.11061694721898939145.git-patchwork-notify@kernel.org>
Date: Tue, 24 Mar 2026 06:07:30 +0000
References: <20260303-kvm-riscv-spectre-v1-v2-0-192caab8e0dc@cispa.de>
In-Reply-To: <20260303-kvm-riscv-spectre-v1-v2-0-192caab8e0dc@cispa.de>
To: Lukas Gerlach <lukas.gerlach@cispa.de>
Cc: linux-riscv@lists.infradead.org, anup@brainfault.org,
 atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, ajones@ventanamicro.com,
 radim.krcmar@oss.qualcomm.com, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 daniel.weber@cispa.de, michael.schwarz@cispa.de, marton.bognar@kuleuven.be,
 jo.vanbulck@kuleuven.be
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_230743_484096_6E5C2970 
X-CRM114-Status: UNSURE (   7.67  )
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

This series was applied to riscv/linux.git (for-next)
by Anup Patel <anup@brainfault.org>:

On Tue, 3 Mar 2026 15:19:40 +0100 you wrote:
> This series adds array_index_nospec() to RISC-V KVM to prevent
> speculative out-of-bounds access to kernel memory.
> 
> Similar fixes exist for x86 (ioapic, lapic, PMU) and arm64 (vgic).
> 
> Signed-off-by: Lukas Gerlach <lukas.gerlach@cispa.de>
> 
> [...]

Here is the summary with links:
  - [v2,1/4] KVM: riscv: Fix Spectre-v1 in ONE_REG register access
    https://git.kernel.org/riscv/c/f9e26fc32541
  - [v2,2/4] KVM: riscv: Fix Spectre-v1 in AIA CSR access
    https://git.kernel.org/riscv/c/ec87a82ca874
  - [v2,3/4] KVM: riscv: Fix Spectre-v1 in floating-point register access
    https://git.kernel.org/riscv/c/8f0c15c4b14f
  - [v2,4/4] KVM: riscv: Fix Spectre-v1 in PMU counter access
    https://git.kernel.org/riscv/c/2dda6a9e09ee

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
