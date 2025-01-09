Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E67EE77197
	for <kvm-riscv@archiver.kernel.org>; Thu,  9 Jan 2025 19:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P/zb5w6q0LTXsb6ROk9qA8Jn6L0uK9bREhtTDH0vMDs=; b=Sa1RXUo1adUyRf
	KqLbAyr0tWrw+1Kq8Nr8rvLv7rsReUPXV3EHKjA+1V8Wvt4wHx5dlwtUD3LonnIZtl5NM9coAVwpF
	pzm184etLEz/7bFUKdZWyG4K4L/et0GeqY6mig69H+SOhdBOeS/kqCrFilcVOcIIzX8Z5VQe1BUgu
	LJ1JILsAfPftydO9L2q0KibLNG9icYAqHN/KzOcNOIITz7b4vuxrQlI9d6IeL24HGbCt7iX/m/cSd
	qoLBQIkRuiZOssrbgQY/Dr1UeTgWA9+1OyiDDK73FlixcTPXdTldJk/dfaxqqKpXqdqaN2EOZuSjr
	gxMW6R4sj57jpBy0hYmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVyOF-0000000D7tz-1HlH;
	Thu, 09 Jan 2025 19:40:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVyOC-0000000D7s2-3P59;
	Thu, 09 Jan 2025 19:40:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 519525C2EF4;
	Thu,  9 Jan 2025 19:39:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03B86C4CED2;
	Thu,  9 Jan 2025 19:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736451619;
	bh=i6ORmYJpmxaqhBl75JVy4C6c/8caHc3WyC29hPfgg8o=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=SeCHI4yW0db6PRCP8Sjllp7pIAuAEmJDXVqTzsXvRtqLzT5b73kIiait1S/J1QpHr
	 8tbw/ZtSKzRjr2uJ4BYTvicr9jCSCDL0/wWFmwZNGl3AD+Z8LhP4pAI1VZdQcNKdVI
	 lTmEX4EMySPqaqI3gkVzdPcm6yVJUNwMdrdhVhSmVUNVvp5S6kcIZvNNYUrA1mLHPE
	 MS5w8G992B4tjPYn3LOO4S5IQvgU3tB03e24v11Nn0Jb66ON8gp0dXlgphW8UdnlZ9
	 UN8g04ZMSjU8aAx66ijYM+yvFKP1wbHBq1BFaR6iwiv/M3ZQzqXs4V+JaV0Zhe5XYF
	 LCey5mAY3dnTw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB212380A97F;
	Thu,  9 Jan 2025 19:40:41 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 0/8] Add SBI v3.0 PMU enhancements
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173645164075.1490121.3552449186878140898.git-patchwork-notify@kernel.org>
Date: Thu, 09 Jan 2025 19:40:40 +0000
References: <20241119-pmu_event_info-v1-0-a4f9691421f8@rivosinc.com>
In-Reply-To: <20241119-pmu_event_info-v1-0-a4f9691421f8@rivosinc.com>
To: Atish Kumar Patra <atishp@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, anup@brainfault.org, will@kernel.org,
 mark.rutland@arm.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 mchitale@ventanamicro.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, palmer@rivosinc.com, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_114020_894171_CA95D148 
X-CRM114-Status: GOOD (  10.24  )
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

This series was applied to riscv/linux.git (fixes)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Tue, 19 Nov 2024 12:29:48 -0800 you wrote:
> SBI v3.0 specification[1] added two new improvements to the PMU chaper.
> 
> 1. Added an additional get_event_info function to query event availablity
> in bulk instead of individual SBI calls for each event. This helps in
> improving the boot time.
> 
> 2. Raw event width allowed by the platform is widened to have 56 bits
> with RAW event v2 as per new clarification in the priv ISA[2].
> 
> [...]

Here is the summary with links:
  - [1/8] drivers/perf: riscv: Add SBI v3.0 flag
    (no matching commit)
  - [2/8] drivers/perf: riscv: Fix Platform firmware event data
    https://git.kernel.org/riscv/c/fc58db9aeb15
  - [3/8] drivers/perf: riscv: Add raw event v2 support
    (no matching commit)
  - [4/8] RISC-V: KVM: Add support for Raw event v2
    (no matching commit)
  - [5/8] drivers/perf: riscv: Implement PMU event info function
    (no matching commit)
  - [6/8] drivers/perf: riscv: Export PMU event info function
    (no matching commit)
  - [7/8] RISC-V: KVM: Implement get event info function
    (no matching commit)
  - [8/8] RISC-V: KVM: Upgrade the supported SBI version to 3.0
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
