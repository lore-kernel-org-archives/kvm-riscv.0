Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA36EC5B549
	for <kvm-riscv@archiver.kernel.org>; Thu,  5 Jun 2025 01:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=caFQZWjG8APIlb+Ft+g47WGgtt4WJZEJbUp9exUMJl0=; b=UarNZ5s+VmWwG2
	TfddRZLtBLlgbs5YqqRfFXXn0a2Nsy/FSTwY2fxDsZnYV1KkSklHUYHepln1sAb+AOQ1BZLE3yLl/
	1kzW+3nX0uCcYkUn/nYfkrFumMuA8OTk7rR9j/E3oPRgY0VAYuwfxA3FlOsEsIehG0n+zEqA2HZRG
	3jVuAz4qEgbK6Mg/zQnQ5tQL8WAAkX+FYw4LqMyY6iqPkYVMfjjBs/VK0GxCwgNUbvDe/Pn1PIGHZ
	xQnlcZAVfJt2rYBhpQoeYIkrKLNncYEygy+dqzUBpi2zJ2vWfDmmb+nZ/WzRoPsTsKR93qCwBsJRd
	fuX6hqbUWxGWsrJaARXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMzQh-0000000EVJo-0U5q;
	Thu, 05 Jun 2025 01:30:03 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMzQe-0000000EVIr-3PHE;
	Thu, 05 Jun 2025 01:30:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 12656A507C8;
	Thu,  5 Jun 2025 01:30:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC6C4C4CEE4;
	Thu,  5 Jun 2025 01:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749086999;
	bh=oBRR0U72ZWaszWIIDxHCBlFYwKXTGXUi/Puz8CELYE0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=WAUmGJwHqQPtGkL6BxJp/lZ6BFMHW2rR5SSx1vKYpiYv35GufWZAXhYdfIoADeXjD
	 CGOegwiqaNxX4DBQ9Bed4vlObt4tMM8L1BRG7/4YtwTRMVRfPYTel1RiWIRdJKDoTJ
	 ko1zekAV8LuRiArTZETLi/h9pc9sHbqAH7eIiAEaCJK4ktXv40J3H/oZgA4Q73MiJe
	 7PzT1m/d6yNJ7nJCPQothhNEI48BHa3hfwg2axJaIl0spw9Hmt9/Go1fykE+2FK3WT
	 GtkfoEyQwDCfXvvJlEVD8DBOLQe0svrAJuPGs0J7ngslXyAQeHTaGdhcNkbvNVGaex
	 AXAJbqSuAGr6w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAFC338111E5;
	Thu,  5 Jun 2025 01:30:32 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v8 00/14] riscv: add SBI FWFT misaligned exception
 delegation
 support
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174908703175.2529829.13116744092084054612.git-patchwork-notify@kernel.org>
Date: Thu, 05 Jun 2025 01:30:31 +0000
References: <20250523101932.1594077-1-cleger@rivosinc.com>
In-Reply-To: <20250523101932.1594077-1-cleger@rivosinc.com>
To: =?utf-8?b?Q2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPg==?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, anup@brainfault.org, atishp@atishpatra.org,
 shuah@kernel.org, corbet@lwn.net, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org,
 samuel.holland@sifive.com, ajones@ventanamicro.com, debug@rivosinc.com,
 charlie@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_183000_994887_5CD9DFD2 
X-CRM114-Status: UNSURE (   9.75  )
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

On Fri, 23 May 2025 12:19:17 +0200 you wrote:
> The SBI Firmware Feature extension allows the S-mode to request some
> specific features (either hardware or software) to be enabled. This
> series uses this extension to request misaligned access exception
> delegation to S-mode in order to let the kernel handle it. It also adds
> support for the KVM FWFT SBI extension based on the misaligned access
> handling infrastructure.
> 
> [...]

Here is the summary with links:
  - [v8,01/14] riscv: sbi: add Firmware Feature (FWFT) SBI extensions definitions
    https://git.kernel.org/riscv/c/cf8651f7319d
  - [v8,02/14] riscv: sbi: remove useless parenthesis
    https://git.kernel.org/riscv/c/a7cd450f0e06
  - [v8,03/14] riscv: sbi: add new SBI error mappings
    https://git.kernel.org/riscv/c/99cf5b7c7387
  - [v8,04/14] riscv: sbi: add FWFT extension interface
    https://git.kernel.org/riscv/c/6d6d0641dcfa
  - [v8,05/14] riscv: sbi: add SBI FWFT extension calls
    https://git.kernel.org/riscv/c/c4a50db1e173
  - [v8,06/14] riscv: misaligned: request misaligned exception from SBI
    https://git.kernel.org/riscv/c/cf5a8abc6560
  - [v8,07/14] riscv: misaligned: use on_each_cpu() for scalar misaligned access probing
    https://git.kernel.org/riscv/c/9f9f6fdd1dc6
  - [v8,08/14] riscv: misaligned: declare misaligned_access_speed under CONFIG_RISCV_MISALIGNED
    https://git.kernel.org/riscv/c/1317045a7d6f
  - [v8,09/14] riscv: misaligned: move emulated access uniformity check in a function
    https://git.kernel.org/riscv/c/4eaaa65e3012
  - [v8,10/14] riscv: misaligned: add a function to check misalign trap delegability
    https://git.kernel.org/riscv/c/7977448bf374
  - [v8,11/14] RISC-V: KVM: add SBI extension init()/deinit() functions
    (no matching commit)
  - [v8,12/14] RISC-V: KVM: add SBI extension reset callback
    (no matching commit)
  - [v8,13/14] RISC-V: KVM: add support for FWFT SBI extension
    (no matching commit)
  - [v8,14/14] RISC-V: KVM: add support for SBI_FWFT_MISALIGNED_DELEG
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
