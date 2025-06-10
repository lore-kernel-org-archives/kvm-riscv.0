Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D68D1C677C4
	for <kvm-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 19:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LwEOgrMSQLkvMlAZRiGMDhpsaUliPwFYJ8oS7foltts=; b=oR2etTK5KTKKVG
	woULQ0y1eATjk2vHaSDxyRTCVUNH7A7a42mblr06hUBi4YwAjRYahYjJLggdV5o2NhKldovrqxH7h
	94zRU+rF8yHdWtRgUyNJvbImV9QHLahjr91nDySJTX2wUkx04gfsargoKelo3wyO8+j/sbIxjRnbA
	M5fFnff9NdAJFLYpNUzCSSmyCEJbdeWbU4BZ5banF9fV8gpr30pRaxdoG+kzyLR0B/f4XijEV8/E5
	9FI7hMBuTS2+nzIR1cjjTgtPYbQIUK94OO7B1VhoIWa3xuy9CzfzqwYCMM6x1eqiBIx1z9dA2akGP
	lwDx/0ZeX27Y6f64mTBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP55D-00000007yh2-2Mjg;
	Tue, 10 Jun 2025 19:56:31 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP1pQ-00000007T2x-20Gc;
	Tue, 10 Jun 2025 16:28:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9FD36A51461;
	Tue, 10 Jun 2025 16:27:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40E8CC4CEED;
	Tue, 10 Jun 2025 16:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749572879;
	bh=M7AR7P2Hp2v576w27gcBYA1QJAA51vBNSHPVxtZiM1s=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=KFMK9QrgISSTDvxGudz6a85hexiOz9fN02iUkdTutBUXfp7ygyrWlMCX3ccpZPK2W
	 KyPJaujZxGXU/fxxfBo/GpgldljWm/oRCN+O6S47EHw+r0x70PqoUq9KAHaNbp2vgH
	 QQoBfMnMCwXLwDBYn3M1n3up7KpBSFu/QvhRU5FRX/3xQbnu3H7cvecri1C+npthOt
	 Su3nbFFwtWfwq+nxld3jUukygNRn8ezdtekIXeYAIcMcqDdHn8gI8LwuRS0QLfghMo
	 5vSD15iZiyo1+4z9QrEtDAAgTvZ8fD8H+kyKRr0AKuKh+U5M+miqArQa7nYKoSpz6g
	 +BSqSPYz8Jykg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EADC139D6540;
	Tue, 10 Jun 2025 16:28:30 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v5 0/6] KVM: lockdep improvements
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174957290974.2454024.11071746229021073521.git-patchwork-notify@kernel.org>
Date: Tue, 10 Jun 2025 16:28:29 +0000
References: <20250512180407.659015-1-mlevitsk@redhat.com>
In-Reply-To: <20250512180407.659015-1-mlevitsk@redhat.com>
To: Maxim Levitsky <mlevitsk@redhat.com>
Cc: linux-riscv@lists.infradead.org, kvm@vger.kernel.org,
 suzuki.poulose@arm.com, jingzhangos@google.com, hpa@zytor.com,
 sebott@redhat.com, lishusen2@huawei.com, longman@redhat.com,
 tglx@linutronix.de, linux-arm-kernel@lists.infradead.org,
 bhelgaas@google.com, bp@alien8.de, anup@brainfault.org, will@kernel.org,
 palmer@dabbelt.com, glider@google.com, kvmarm@lists.linux.dev,
 keisuke.nishimura@inria.fr, yuzenghui@huawei.com, peterz@infradead.org,
 atishp@atishpatra.org, joey.gouly@arm.com, x86@kernel.org, maz@kernel.org,
 seanjc@google.com, andre.przywara@arm.com, jiangkunkun@huawei.com,
 rdunlap@infradead.org, pbonzini@redhat.com, boqun.feng@gmail.com,
 catalin.marinas@arm.com, alex@ghiti.fr, linux-kernel@vger.kernel.org,
 dave.hansen@linux.intel.com, oliver.upton@linux.dev,
 kvm-riscv@lists.infradead.org, mingo@redhat.com, paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_092800_583084_5C64514A 
X-CRM114-Status: GOOD (  10.52  )
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
by Paolo Bonzini <pbonzini@redhat.com>:

On Mon, 12 May 2025 14:04:01 -0400 you wrote:
> This is	a continuation of my 'extract lock_all_vcpus/unlock_all_vcpus'
> patch series.
> 
> Implement the suggestion of using lockdep's "nest_lock" feature
> when locking all KVM vCPUs by adding mutex_trylock_nest_lock() and
> mutex_lock_killable_nest_lock() and use these functions	in the
> implementation of the
> kvm_trylock_all_vcpus()/kvm_lock_all_vcpus()/kvm_unlock_all_vcpus().
> 
> [...]

Here is the summary with links:
  - [v5,1/6] locking/mutex: implement mutex_trylock_nested
    https://git.kernel.org/riscv/c/c5b6ababd21a
  - [v5,2/6] locking/mutex: implement mutex_lock_killable_nest_lock
    https://git.kernel.org/riscv/c/fb49f07ba1d9
  - [v5,3/6] KVM: add kvm_lock_all_vcpus and kvm_trylock_all_vcpus
    https://git.kernel.org/riscv/c/e4a454ced74c
  - [v5,4/6] x86: KVM: SVM: use kvm_lock_all_vcpus instead of a custom implementation
    https://git.kernel.org/riscv/c/c560bc9286e6
  - [v5,5/6] KVM: arm64: use kvm_trylock_all_vcpus when locking all vCPUs
    https://git.kernel.org/riscv/c/b586c5d21954
  - [v5,6/6] RISC-V: KVM: use kvm_trylock_all_vcpus when locking all vCPUs
    https://git.kernel.org/riscv/c/8f56770d114b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
