Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95549C7EE2A
	for <kvm-riscv@archiver.kernel.org>; Wed, 25 Jun 2025 18:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7e594WmjgWINwTVDSlyDl4Cu9rE2ou4BLGd65oc5TbY=; b=NZzrYB+bgGYwQz
	XE7UXYCn0hLdTsTHDNVdLP2Cl9R1NWmgjBZtZE/9A8fBbozMw13mgfdm7dZGHLg6qiKV2pYz4P/b0
	zANVCod3SCeFb0hnp1EvVyxzntdoM8VtwvufxHaX4iKn7fxt4rRJQP23Fax4zqZwubNbZ0cEIr4uf
	M3PMCnP3vRkvDGUHJqCB2apF7M6+fnMHoSXpen4PsHn+FQ4azTJoDC7MSMUhFGmfj3jB44JmmZRCB
	fwS5DSvvUYyXnBuPACX1R6iphYCyaYRP1npjn3uXHRmtFdc6fMHWyjVHHCOqTaF1ZlaLxHyRK7rSb
	kcDw2KG6Bn/cppvLWO7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUUrh-00000009ZGb-0Pb1;
	Wed, 25 Jun 2025 18:28:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUQyT-00000008wEj-0t9L;
	Wed, 25 Jun 2025 14:19:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C0C375C42B5;
	Wed, 25 Jun 2025 14:17:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0CE9C4CEEA;
	Wed, 25 Jun 2025 14:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750861179;
	bh=g4ArFd+mq5NzwEmHH7H82HIytBCVh2j1tA+eOOIjQ3E=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=E7GJaO4RctEbyOoOCUvcBAsNztHOzSfPvfS43x5dBuK5XgD8KEseQCXN0hiA6zIsO
	 0cG9p2RXIeXJwQExX9t4tEhJ02NomZgciueU9iSh2vH24/8e1CHxktmLMNGwHMUfIt
	 lkIt/IDQV+GpYVEPJJHG8CbXJjbUd/IKHzMXEDNcsc1tJoUn/oSqCr7UTuaHKzdKTF
	 BHfAbu8PB2p7M0Ks2v9CCsywliMON+syXXGBZoIrLaqDpFzrGgrvFIqqucr29k9ozM
	 qJU44MeQeqTj9ilwi9H7Nz+Ow7KSLrc/fpNKCKwjZg211h6mNSUUhZP/58fkhkcDRD
	 RUcCeRV80mnDw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADDB53A40FCB;
	Wed, 25 Jun 2025 14:20:07 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v5 0/3] Move duplicated instructions macros into
 asm/insn.h
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <175086120650.493996.14965405389031258218.git-patchwork-notify@kernel.org>
Date: Wed, 25 Jun 2025 14:20:06 +0000
References: <20250620-dev-alex-insn_duplicate_v5_manual-v5-0-d865dc9ad180@rivosinc.com>
In-Reply-To: <20250620-dev-alex-insn_duplicate_v5_manual-v5-0-d865dc9ad180@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 anup@brainfault.org, atish.patra@linux.dev, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, philmd@linaro.org,
 ajones@ventanamicro.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_071941_288718_E290C0E7 
X-CRM114-Status: UNSURE (   6.85  )
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
by Palmer Dabbelt <palmer@dabbelt.com>:

On Fri, 20 Jun 2025 20:21:56 +0000 you wrote:
> The instructions parsing macros were duplicated and one of them had different
> implementations, which is error prone.
> 
> So let's consolidate those macros in asm/insn.h.
> 
> v1: https://lore.kernel.org/linux-riscv/20250422082545.450453-1-alexghiti@rivosinc.com/
> v2: https://lore.kernel.org/linux-riscv/20250508082215.88658-1-alexghiti@rivosinc.com/
> v3: https://lore.kernel.org/linux-riscv/20250508125202.108613-1-alexghiti@rivosinc.com/
> v4: https://lore.kernel.org/linux-riscv/20250516140805.282770-1-alexghiti@rivosinc.com/
> 
> [...]

Here is the summary with links:
  - [v5,1/3] riscv: Fix typo EXRACT -> EXTRACT
    https://git.kernel.org/riscv/c/e2d02461b2e2
  - [v5,2/3] riscv: Strengthen duplicate and inconsistent definition of RV_X()
    https://git.kernel.org/riscv/c/771c94605d50
  - [v5,3/3] riscv: Move all duplicate insn parsing macros into asm/insn.h
    https://git.kernel.org/riscv/c/38b566b84cf6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
