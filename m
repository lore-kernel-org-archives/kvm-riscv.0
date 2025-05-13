Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B72CBC3ABCC
	for <kvm-riscv@archiver.kernel.org>; Tue, 13 May 2025 11:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MZ6WQSFXrOUv8HzHQ5zz8CMCqsSIkJ29/CqBq1II59A=; b=HkxgvEG5vC6l8x
	cxriF3FqcL8QEuJIo6vFPPGKJmEMGGzn7NpQVkbN2FE539yMTFGTOehFCBmXfYKyi58OQeCoFLLZQ
	DnxOmbXlNl6THyW8JbAbrXH1xXEkFtqg54ZvUWLaZBiMlRnlu/oJFZ2W7YroIP6n3ZtA1oJZRs64X
	NpaUEAZ0ZrUu4hTiD1ipyVOZR1rIyJefXvVk0Umr5laNPlW+EBpVgDqpgRK1maDCebfXe3DCPu965
	MWDFvXgA4ZYgdFXEnb2l0y3VKkcfg8sUdUdVQZgaI+AcBygADc7HfBwa38SdK0uu+8wEyD8bUyQGJ
	kefhverDIMEdg2MKPZFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEo5F-0000000CIM5-1WJr;
	Tue, 13 May 2025 11:46:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEo5E-0000000CILp-3Wut;
	Tue, 13 May 2025 11:46:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=18tp2DX9OqoEURmphhrYz22jloqtedKHeleStMqFFkQ=; b=R/77HBPlxz7Jum8NEPWrGPBjwE
	4r3P6T+wFFGwzaoeqhgdJnsP9Mxzbjull9ScpfQ7JZHGnj4jxu3e/2l2TNVxDjN9fugwytXJQwoIF
	zyDmzaBOe43guFLpPbsLM6EENBVyHkH6N6kdfYS75eNzrm4tpEsTOt1+gddIixIQy9PQFQ22hjSB3
	KItTKKBLPRW5Z1I5oJTAEYhP6MO2VNbVDpwJx07nxS5A/MIdZkPQwGHkd4ZNLQqGTW+QNPv5WKIV4
	weogKRyU69OnfeH2sjesQEI0Hlg4BUvmutzrlaYTz50S5jjH191xsx0R2bxeNKeJyvQHai2uaBAvq
	7hVJr0aw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uEo56-0000000Gy4a-1Ff1;
	Tue, 13 May 2025 11:45:56 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id E256E30066A; Tue, 13 May 2025 13:45:55 +0200 (CEST)
Date: Tue, 13 May 2025 13:45:55 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Maxim Levitsky <mlevitsk@redhat.com>
Cc: kvm@vger.kernel.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
	Jing Zhang <jingzhangos@google.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Sebastian Ott <sebott@redhat.com>,
	Shusen Li <lishusen2@huawei.com>, Waiman Long <longman@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	Bjorn Helgaas <bhelgaas@google.com>, Borislav Petkov <bp@alien8.de>,
	Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexander Potapenko <glider@google.com>, kvmarm@lists.linux.dev,
	Keisuke Nishimura <keisuke.nishimura@inria.fr>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Atish Patra <atishp@atishpatra.org>,
	Joey Gouly <joey.gouly@arm.com>, x86@kernel.org,
	Marc Zyngier <maz@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Kunkun Jiang <jiangkunkun@huawei.com>,
	linux-riscv@lists.infradead.org,
	Randy Dunlap <rdunlap@infradead.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	kvm-riscv@lists.infradead.org, Ingo Molnar <mingo@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH v5 0/6] KVM: lockdep improvements
Message-ID: <20250513114555.GF25763@noisy.programming.kicks-ass.net>
References: <20250512180407.659015-1-mlevitsk@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250512180407.659015-1-mlevitsk@redhat.com>
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

On Mon, May 12, 2025 at 02:04:01PM -0400, Maxim Levitsky wrote:
> This is	a continuation of my 'extract lock_all_vcpus/unlock_all_vcpus'
> patch series.
> 
> Implement the suggestion of using lockdep's "nest_lock" feature
> when locking all KVM vCPUs by adding mutex_trylock_nest_lock() and
> mutex_lock_killable_nest_lock() and use these functions	in the
> implementation of the
> kvm_trylock_all_vcpus()/kvm_lock_all_vcpus()/kvm_unlock_all_vcpus().
> 
> Those changes allow removal of a custom workaround that was needed to
> silence the lockdep warning in the SEV code and also stop lockdep from
> complaining in case of ARM and RISC-V code which doesn't include the above
> mentioned workaround.
> 
> Finally, it's worth noting that this patch series removes a fair
> amount of duplicate code by implementing the logic in one place.
> 
> V5: addressed review feedback.
> 
> Best regards,
> 	Maxim Levitsky
> 
> Maxim Levitsky (6):
>   locking/mutex: implement mutex_trylock_nested
>   locking/mutex: implement mutex_lock_killable_nest_lock
>   KVM: add kvm_lock_all_vcpus and kvm_trylock_all_vcpus
>   x86: KVM: SVM: use kvm_lock_all_vcpus instead of a custom
>     implementation
>   KVM: arm64: use kvm_trylock_all_vcpus when locking all vCPUs
>   RISC-V: KVM: use kvm_trylock_all_vcpus when locking all vCPUs
> 
>  arch/arm64/include/asm/kvm_host.h     |  3 --
>  arch/arm64/kvm/arch_timer.c           |  4 +-
>  arch/arm64/kvm/arm.c                  | 43 ----------------
>  arch/arm64/kvm/vgic/vgic-init.c       |  4 +-
>  arch/arm64/kvm/vgic/vgic-its.c        |  8 +--
>  arch/arm64/kvm/vgic/vgic-kvm-device.c | 12 ++---
>  arch/riscv/kvm/aia_device.c           | 34 +------------
>  arch/x86/kvm/svm/sev.c                | 72 ++-------------------------
>  include/linux/kvm_host.h              |  4 ++
>  include/linux/mutex.h                 | 32 ++++++++++--
>  kernel/locking/mutex.c                | 21 +++++---
>  virt/kvm/kvm_main.c                   | 59 ++++++++++++++++++++++
>  12 files changed, 126 insertions(+), 170 deletions(-)

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
