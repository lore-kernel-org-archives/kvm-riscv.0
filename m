Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37259F532E0
	for <kvm-riscv@archiver.kernel.org>; Tue, 24 Mar 2026 06:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RNGG0s0xN5jfgz7jwUHWbxHAybHm7ZA9yZXrLOI/O9Q=; b=TrENxD9t7eeXtm
	551nK+/KR86/hbX5XFA3pyjU148NgA8JjSfj9Xj979pKbHj3f+EOcg8IxjDFdpkBQ5Gz392rjzMcT
	F9YngXy3CkrCD1d4UCll04Ksc0pA7a15gGcaamnJfdXgh1bCfkd6FaDi9mcbuagECchiD69pLejKt
	G/wMF30EB2V4JdxIeqruUpmhcbj/7HVlY+hNuayO1HXJTjhH8A99V41GXV/liS8jzTU/lKXCkO1Jk
	/nKm7nXXZ+vi8GUa02qqODh6F+DjEJuYZQmlBQ81sKdXS83dIhKtRfzq8S1VOO+RXS6Vjr/CXDIq7
	de3YljmQSsOJyGWuGe0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4uve-00000000dTb-3n91;
	Tue, 24 Mar 2026 06:07:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4uva-00000000dOK-3RsV;
	Tue, 24 Mar 2026 06:07:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7CC4F4439C;
	Tue, 24 Mar 2026 06:07:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F883C2BCB4;
	Tue, 24 Mar 2026 06:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774332466;
	bh=z4J3ormmSXU+X7jeV6FkQUS7GtywJzymGFhiKVjbDaU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Hwoz5YsjR1PACl+UQNn+HH+FllIaPq/7dXZ7ML29dJvWcP3Sy7qtE65yX0PVwt496
	 C50KSpIsgEURb5xPAiG3GJPawXBZBTkfae3QvOjntb5DRvqWxRXTXnPYnoimUQSUbQ
	 gvDMLUTf1JPzXzHl6NetEwiAtjXr6rCbJzlBDFRHcZJ21Vtrep7uhj0ZNP1NrHQJWI
	 bmqjM+5n4g0s2XeL7NL7xnHxTLmRpAL8gqYjG9CAC1LwILx+yARKcV7UQ9MrF6TnTq
	 kuM1HGFpLCFQjB4oq+KUm61KUg+q0SW6jfcLA/yq5JAbXkZ7Ti0FY08zRUFUGMMUAY
	 xEi/TQdsPaMbw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9E9E3808200;
	Tue, 24 Mar 2026 06:07:35 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2] RISC-V: KVM: Fix null pointer dereference in
 kvm_riscv_vcpu_aia_rmw_topei()
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177433245454.469836.16737695875391376252.git-patchwork-notify@kernel.org>
Date: Tue, 24 Mar 2026 06:07:34 +0000
References: <20260226085119.643295-1-xujiakai2025@iscas.ac.cn>
In-Reply-To: <20260226085119.643295-1-xujiakai2025@iscas.ac.cn>
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, alex@ghiti.fr,
 aou@eecs.berkeley.edu, palmer@dabbelt.com, paul.walmsley@sifive.com,
 atish.patra@linux.dev, anup@brainfault.org, jiakaiPeanut@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_230746_899670_477E74EE 
X-CRM114-Status: UNSURE (   8.82  )
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

This patch was applied to riscv/linux.git (for-next)
by Anup Patel <anup@brainfault.org>:

On Thu, 26 Feb 2026 08:51:19 +0000 you wrote:
> kvm_riscv_vcpu_aia_rmw_topei() assumes that the per-vCPU IMSIC state has
> been initialized once AIA is reported as available and initialized at
> the VM level. This assumption does not always hold.
> 
> Under fuzzed ioctl sequences, a guest may access the IMSIC TOPEI CSR
> before the vCPU IMSIC state is set up. In this case,
> vcpu->arch.aia_context.imsic_state is still NULL, and the TOPEI RMW path
> dereferences it unconditionally, leading to a host kernel crash.
> 
> [...]

Here is the summary with links:
  - [v2] RISC-V: KVM: Fix null pointer dereference in kvm_riscv_vcpu_aia_rmw_topei()
    https://git.kernel.org/riscv/c/c28eb189e481

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
