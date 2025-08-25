Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93FFBC8303F
	for <kvm-riscv@archiver.kernel.org>; Mon, 25 Aug 2025 21:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wr1jw1ZNdylQIoRJVW3hXkCTxNv098/7FgDbnVbtcnU=; b=QXejs6HZMyVZNK
	988Zb+7Sg8Fdgm6/bbMyBkFJMEw2oATNB8vVpeQdkwZHgHbsaTfhgREez9UZLWH/2GHuOCErQ5X/D
	9gAVSpuh2w3hmg2uatcCTRsyuCERnggPf0QBeI4ZA/J0SJmdpriBhv0AVh3qlwwWyOc0N4Eg3Y8TQ
	nrtPwFIIR4gXnBMbgOTkl6wGkiLgAzWvmxLubCjDy4hMR8EbQA67mPj7ICvfrHCXqhRH7B2ynNddF
	hw72K3baT15Gj6iivEALvHK6vyAmnfR+/hznTfMxSYhEZD9jhEJYSIMTABb2kCyA2p4y8maCw4kBA
	rieRKfMCc6pw4FVjGgMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqf0y-00000009ne5-11Zx;
	Mon, 25 Aug 2025 21:46:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqf0x-00000009ndJ-00d9;
	Mon, 25 Aug 2025 21:46:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 04A06601E5;
	Mon, 25 Aug 2025 21:46:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95AD6C4CEED;
	Mon, 25 Aug 2025 21:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756158354;
	bh=z2K4pTnpiDqLqYIH8QVc9PQKE3DH+YA71ZyqVbqxW6o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WehF5ftNNXRo0ktcAvTwwGNFGV/EAJ74RPmJHCc1/Z17l1QEglTKoK3ibLL8gnc4t
	 NlKz6k7fz2lmrzWRP6K+pj3xu5efQX0yAcStIUphpdlkE0hXvX1O/hxV14uaFfM9Il
	 teNGWS4vL/IPlA1GKik4UxLjNusOjbU5D/OewsXrWcI/Ynet9r+J6j0h0Qw9udbcdx
	 Jt5qZw5UoaBh5E3LiK4rJTYYyfwi5l7H9dDZXLKpcynQANDbCwVWm46jM36cUflkSE
	 TgteF7/ksdzao8dEBvyhS4bxR3OBEL/v0WKy2lffmwCnCK3v1xmgFX8nRRpGli6jrU
	 9ptYFqpFDYbDA==
Date: Mon, 25 Aug 2025 21:45:52 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Tianrui Zhao <zhaotianrui@loongson.cn>,
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Andy Lutomirski <luto@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Uladzislau Rezki <urezki@gmail.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	kvm@vger.kernel.org, loongarch@lists.linux.dev,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-hyperv@vger.kernel.org, rcu@vger.kernel.org,
	mrathor@linux.microsoft.com, nunodasneves@linux.microsoft.com
Subject: Re: [PATCH 0/5] Drivers: hv: Fix NEED_RESCHED_LAZY and use common
 APIs
Message-ID: <aKzZkItq-8_OmxJ0@liuwe-devbox-ubuntu-v2.tail21d00.ts.net>
References: <20250825200622.3759571-1-seanjc@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250825200622.3759571-1-seanjc@google.com>
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

On Mon, Aug 25, 2025 at 01:06:17PM -0700, Sean Christopherson wrote:
> Fix a bug where MSHV root partitions don't honor NEED_RESCHED_LAZY, and then
> deduplicate the TIF related MSHV code by turning the "kvm" entry APIs into
> more generic "virt" APIs (which ideally would have been done when MSHV root
> support was added).
> 

It is nice to have a common infrastructure.

Cc Mukesh and Nuno for review and test.

Thanks,
Wei

> Assuming all is well, maybe this could go through the tip tree?
> 
> The Hyper-V stuff and non-x86 architectures are compile-tested only.
> 
> Sean Christopherson (5):
>   Drivers: hv: Move TIF pre-guest work handling fully into mshv_common.c
>   Drivers: hv: Handle NEED_RESCHED_LAZY before transferring to guest
>   entry/kvm: KVM: Move KVM details related to signal/-EINTR into KVM
>     proper
>   entry: Rename "kvm" entry code assets to "virt" to genericize APIs
>   Drivers: hv: Use common "entry virt" APIs to do work before running
>     guest
> 
>  MAINTAINERS                                 |  2 +-
>  arch/arm64/kvm/Kconfig                      |  2 +-
>  arch/arm64/kvm/arm.c                        |  3 +-
>  arch/loongarch/kvm/Kconfig                  |  2 +-
>  arch/loongarch/kvm/vcpu.c                   |  3 +-
>  arch/riscv/kvm/Kconfig                      |  2 +-
>  arch/riscv/kvm/vcpu.c                       |  3 +-
>  arch/x86/kvm/Kconfig                        |  2 +-
>  arch/x86/kvm/vmx/vmx.c                      |  1 -
>  arch/x86/kvm/x86.c                          |  3 +-
>  drivers/hv/Kconfig                          |  1 +
>  drivers/hv/mshv.h                           |  2 --
>  drivers/hv/mshv_common.c                    | 22 ---------------
>  drivers/hv/mshv_root_main.c                 | 31 ++++-----------------
>  include/linux/{entry-kvm.h => entry-virt.h} | 19 +++++--------
>  include/linux/kvm_host.h                    | 17 +++++++++--
>  include/linux/rcupdate.h                    |  2 +-
>  kernel/entry/Makefile                       |  2 +-
>  kernel/entry/{kvm.c => virt.c}              | 15 ++++------
>  kernel/rcu/tree.c                           |  6 ++--
>  virt/kvm/Kconfig                            |  2 +-
>  21 files changed, 49 insertions(+), 93 deletions(-)
>  rename include/linux/{entry-kvm.h => entry-virt.h} (83%)
>  rename kernel/entry/{kvm.c => virt.c} (66%)
> 
> 
> base-commit: 1b237f190eb3d36f52dffe07a40b5eb210280e00
> -- 
> 2.51.0.261.g7ce5a0a67e-goog
> 

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
