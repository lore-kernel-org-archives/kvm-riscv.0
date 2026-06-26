Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4FE5CDE016
	for <kvm-riscv@archiver.kernel.org>; Fri, 26 Jun 2026 08:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cBdFFi3aLKvY/rM4OEh7/fL05V2TLtQpj/vUcAwq0fY=; b=l2kRkbrfFxbose
	4CMZL2g/uvMfGZjLRBfyUp5pa9Gwkzy2L/KVkz7AdINBOZ7Yp2QQL3ayBYHBMzeis6Js6YoS0rAzS
	WkOEkKBM3V9ubG6PUO5kkf0lN5/O2zF0/BBUfr7vXlvEO42yDtDA2CHfszyz8fAT6I5gKr09eWHnt
	u3pJ0Yfhmp80XqppPbGmvvVDmqmRnGT5hablWERqoCQyFnbN0cwqX02KxAjPwQgxwTA/T7tqpy5Ns
	i50bcwLPiynrNh/CfCbw1yLQCGCg9ySxmYtE3CI/dJ38J19Wb+qAdEm304HUC3lRyaDKYV/lhEAvh
	fNukw/YKXhl8yK7qQdwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1oO-0000000AnDv-2Ib9;
	Fri, 26 Jun 2026 08:21:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1oM-0000000An9Z-44Y1;
	Fri, 26 Jun 2026 08:21:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B21FF40A8E;
	Fri, 26 Jun 2026 08:21:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 946431F00A3F;
	Fri, 26 Jun 2026 08:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782462078;
	bh=JI0GxwAojLxKVFwlEOU4ZPICdfzGKw9cICvZEMficB8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=I6xKGOM7/fsBQEKDF7dia1uD6RiDe1aFMJruUQis5I9vTwn0YNsK6D2SxTFHivvxq
	 pDeY0fVr1TMG85kvEefOc2/Vg0HbxreL9gDXLR/3h2OTYwBiCgvSeaw5te5ws9XInA
	 ExQiy0LqB1rnjTl1mIz2cN70ybxsPI42URHmE0C18xvjsF11jnSybCBFtaLVfNAkum
	 6CM40mcgNBrrUxIyXmAnVmIUKGmJ/gkJpXB+q7zpcja89npZZxT78x0QsiUSzLJv5C
	 37zTEizn9T1NYR2iBPbbsxPxR+Ra20Y2yvc+9mP23hgcK69ElukKON03y3j6XmQoN9
	 j/bhWMw9cnrsA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D09BA39389E8;
	Fri, 26 Jun 2026 08:21:06 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] RISC-V: KVM: Fix invalid HVA warning in steal-time
 recording
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <178246206549.3816447.5536790669750884836.git-patchwork-notify@kernel.org>
Date: Fri, 26 Jun 2026 08:21:05 +0000
References: <20260415075216.2757427-1-xujiakai2025@iscas.ac.cn>
In-Reply-To: <20260415075216.2757427-1-xujiakai2025@iscas.ac.cn>
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org, aou@eecs.berkeley.edu,
 alex@ghiti.fr, ajones@ventanamicro.com, anup@brainfault.org,
 atish.patra@linux.dev, palmer@dabbelt.com, pjw@kernel.org,
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

On Wed, 15 Apr 2026 07:52:16 +0000 you wrote:
> kvm_riscv_vcpu_record_steal_time() assumes that the steal-time shared
> memory GPA (vcpu->arch.sta.shmem) is always backed by a valid guest
> memory slot. However, this assumption is not guaranteed by the KVM
> userspace ABI.
> 
> A malicious or buggy userspace can set the STA shared memory GPA via
> KVM_SET_ONE_REG without establishing a corresponding memory region via
> KVM_SET_USER_MEMORY_REGION. In such cases, the GPA cannot be translated
> to a valid HVA and kvm_vcpu_gfn_to_hva() returns an error address.
> 
> [...]

Here is the summary with links:
  - RISC-V: KVM: Fix invalid HVA warning in steal-time recording
    https://git.kernel.org/riscv/c/653f17c74260

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
