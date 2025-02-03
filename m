Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32CADC02192
	for <kvm-riscv@archiver.kernel.org>; Mon,  3 Feb 2025 19:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3G1ixrI0PUm52Mrt1M5pIGVjixEBXAktXaOqsYG8pcs=; b=3j9hhBlcfLYtMi
	FCIq/K+fq4UjVRDUa91jO6fZolVl9fl04pH6GeaSoKWjnTKbn8UCmqkAN4jjlPe8uHS1zqr6ZkWdF
	BqmMOByUXI7oc0eG6rGoVQuFSWOWF74m0KVEuLhM38I7hEjciF3q+WzIY5c9C9Du2PSZ7OzI3+dZk
	Y3DN07yPJmR/v1VUgU8VgZF1+UW7284RNx5dm7IVd1YHm8FCBqmO+W53hebTqfqaTnfehU+xSHgS9
	erAcfZWcyuI9Nwdmoj5CKNe4BRyz1dGbB1HPA6EKrks5P39AHooMbgFFIMecvUZ8H6QrKFkGLMpNh
	NNkklPAM2E7lC34TwSrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf1ya-0000000GRQl-3sA1;
	Mon, 03 Feb 2025 19:19:20 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf1ul-0000000GQCa-3FQg;
	Mon, 03 Feb 2025 19:15:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C0FD6A41C20;
	Mon,  3 Feb 2025 19:13:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2CCFC4CEE3;
	Mon,  3 Feb 2025 19:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738610122;
	bh=x4p1X9nOXxuhn4jEPid5fzjCvgZ4D3ZQU2ymjtjqU9E=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=SwiVodep/1/nWnRpopWbBGkkYwgqp6zjbivmPprSBDK7KEzSCdK2xq2o+52mpu2gS
	 3zr7qNPdshAge0rXr1UkK0d0mAXUpI6C5KURLWQlqmy5xPSQEXP2peKrPfu9dENBeF
	 q+QHs8EZaSp7fpT9t6Vgp36iZU34R/kSW4Mkw6R0EhsAK+RCRciPYLnz7OBuILt8Am
	 ETjGYMXis2V0Vs6zUv5LGIP2vjtDlRM79Qr7rsaQ6x+eaH1FGxqQd3r8aZDTQ/nUCD
	 B5QbsGm5nrDJVkFPaDDVc5Opb0m7VLr6fZRFl30v+USNqmOxNibUohAJO9AxpoXhrl
	 2uh4Gek08nD7w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33FB5380AA67;
	Mon,  3 Feb 2025 19:15:51 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/3] Collect guest/host statistics during the redirected
 traps
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173861014984.3409359.10285498075782232366.git-patchwork-notify@kernel.org>
Date: Mon, 03 Feb 2025 19:15:49 +0000
References: <20241224-kvm_guest_stat-v2-0-08a77ac36b02@rivosinc.com>
In-Reply-To: <20241224-kvm_guest_stat-v2-0-08a77ac36b02@rivosinc.com>
To: Atish Kumar Patra <atishp@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, anup@brainfault.org,
 atishp@atishpatra.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, zhouquan@iscas.ac.cn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_111523_880895_1BD2FA97 
X-CRM114-Status: GOOD (  10.42  )
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
by Anup Patel <anup@brainfault.org>:

On Tue, 24 Dec 2024 13:04:52 -0800 you wrote:
> As discussed in the patch[1], this series adds the host statistics for
> traps that are redirected to the guest. Since there are 1-1 mapping for
> firmware counters as well, this series enables those so that the guest
> can collect information about these exits via perf if required.
> 
> I have included the patch[1] as well in this series as it has not been
> applied and there will be likely conflicts while merging both.
> 
> [...]

Here is the summary with links:
  - [v2,1/3] RISC-V: KVM: Redirect instruction access fault trap to guest
    https://git.kernel.org/riscv/c/51c58956732b
  - [v2,2/3] RISC-V: KVM: Update firmware counters for various events
    https://git.kernel.org/riscv/c/2f15b5eaff79
  - [v2,3/3] RISC-V: KVM: Add new exit statstics for redirected traps
    https://git.kernel.org/riscv/c/af79caa83f6a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
