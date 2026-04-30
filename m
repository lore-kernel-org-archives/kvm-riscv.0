Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9F6BFF8864
	for <kvm-riscv@archiver.kernel.org>; Thu, 30 Apr 2026 03:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FeRnv860c4V8pubS0AQ7I625AnJZuKWSqdj6iSo+0U8=; b=kycKVcq2LhaCP1
	DWecSHg3iEZfaA15wfqRmlAcswihk6Zg1azCwZ/aV3OseRIz/GIvKmF84Jx1aiH2eDIPcEqTj23XO
	UlXzxAZZdTAijA01SjhBeKHs6nilZmSruk3yLk1bFbSzK9kJ1IpkXVRFq8ymEcKQsKzXi3T26c2AU
	Yoz2GsYxn0oYOq2APpafyD2/pzErwC3dMWLFQcqjDtEe8H/RO6nPuqMKkkNZNAfmhypRZyphB7VI6
	jB4LI5JmDALeYYR8iBhRi9ODq8R0Klj3dy17jNbl1s0Xw1M2WHCHo88cNt9t5w4lvRvAdgiVzbNIX
	GalD4Xkd69tVi+TFVgtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII3w-00000004XyL-16Ha;
	Thu, 30 Apr 2026 03:27:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII2t-00000004Wps-3lui;
	Thu, 30 Apr 2026 03:26:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8ADFB4456F;
	Thu, 30 Apr 2026 03:26:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BEADC2BCB8;
	Thu, 30 Apr 2026 03:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777519595;
	bh=v2FVe+EQzcRgy5kBHv31JJ1JABN71LAgpMDEFu1iEeQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=kIzodHHoxdLZ+cDEQj8Njp+uRU2rFvB5r8IfM+fIJ9hEZSG088leSKu/922hUPp85
	 uMHN4hDlcpbFHClaWJFg4kZDURxZTq1inA7wHZImmThwHGfHBgEpKvrqi7ijJtqwdy
	 5WH+gX1UuJLBbrZylZYd6CoFRANggv3/UfcfBb3+dpW1T1QlADsSguUSaj5Egn2fSz
	 Bdi/bACXwgbbfMZegVFixj8x6oV9POowqUolYkPDN08WqNkOFsPo8VKMx1GwPrzfov
	 j0EGamHpvvWNIqGxIFN2PoHCW88iEsn1BChR7+E1rQl0nVqgLLU8i9CPn6y4VH9hy+
	 marnzTmOrauAw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9EFF3809A07;
	Thu, 30 Apr 2026 03:25:51 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v10 0/3] RISC-V: KVM: Validate SBI STA shmem alignment
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177751955029.2274119.9759689276814198546.git-patchwork-notify@kernel.org>
Date: Thu, 30 Apr 2026 03:25:50 +0000
References: <20260303010859.1763177-1-xujiakai2025@iscas.ac.cn>
In-Reply-To: <20260303010859.1763177-1-xujiakai2025@iscas.ac.cn>
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org,
 kvm@vger.kernel.org, alex@ghiti.fr, pbonzini@redhat.com, shuah@kernel.org,
 pjw@kernel.org, palmer@dabbelt.com, ajones@ventanamicro.com,
 anup@brainfault.org, atish.patra@linux.dev, aou@eecs.berkeley.edu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_202636_011053_2EDAF5F3 
X-CRM114-Status: UNSURE (   8.33  )
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

This series was applied to riscv/linux.git (fixes)
by Anup Patel <anup@brainfault.org>:

On Tue,  3 Mar 2026 01:08:56 +0000 you wrote:
> This series fixes a missing validation in the RISC-V KVM SBI
> steal-time accounting (STA) register handling.
> 
> Patch 1 validates the configured SBI STA shared memory GPA at
> KVM_SET_ONE_REG, enforcing the 64-byte alignment requirement
> defined by the SBI specification or allowing INVALID_GPA to explicitly
> disable steal-time accounting. This prevents invalid userspace state
> from reaching runtime code paths and avoids WARN_ON() triggers during
> KVM_RUN.
> 
> [...]

Here is the summary with links:
  - [v10,1/3] RISC-V: KVM: Validate SBI STA shmem alignment in kvm_sbi_ext_sta_set_reg()
    https://git.kernel.org/riscv/c/fa9681ed5c6a
  - [v10,2/3] KVM: selftests: Refactor UAPI tests into dedicated function
    (no matching commit)
  - [v10,3/3] RISC-V: KVM: selftests: Add RISC-V SBI STA shmem alignment tests
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
