Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8482BC8303F
	for <kvm-riscv@archiver.kernel.org>; Mon, 25 Aug 2025 23:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NCjP85jOhLbG2+N/BvUpThHObYZvXb1DUkWUJO4ZKRQ=; b=R0TBY2kqOOoyyZ
	F1QoE7dZn5I0nGJU3nmviB90sqWSz2Pbo3kxyOtl02tnjnz/XE95LvNqpwnjw/Y6EQJ2Nm5F7madN
	82BPb8pWXjl+fiTCI5/lvKgGKXQR5ViYMkLVdf4MmltVgXlDNtDFf52RxwniNilgV5mMziMYUHyO+
	q8tQuW+ePTw1WYz2qRlSdJv7GIoY0B7/nRpaegLPwMLHsQA0hsoJA7ooyR5SKjwVFSVKbN+FEw+ic
	68633NtAPNW7xoAxW3ia/R5gpuHHkiBl54q9cB8moH5jGRVcDKqQNtEbXnoL9+GQQXhy+3mk8aJfs
	JHkC7vY5pOrPuwNWte8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqgJE-0000000A6XO-076X;
	Mon, 25 Aug 2025 23:09:04 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqgJB-0000000A6Wd-3hiV;
	Mon, 25 Aug 2025 23:09:03 +0000
Received: from [100.64.0.200] (unknown [20.29.225.195])
	by linux.microsoft.com (Postfix) with ESMTPSA id 1E032211829D;
	Mon, 25 Aug 2025 16:08:59 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 1E032211829D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1756163339;
	bh=yjj+T4F6X5Rb2NiUbWNootXcw5MYUgeaYi89zI0rqQM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GTT5fOzUX6bjgmJRyTtl5Nlh5JACcr0YCsgajA504/VguHTsD2kG9KDvDG5alk+gF
	 AlqgkFhhFVQMT3abN68Y5Bm44usX4MzHqG7q2W8uP1gfSybPvK8eBGyTYKXvPevQWI
	 Yg63eHOsilGGsMx/M0Y6URyOnRsPjGUV5RxxijdQ=
Message-ID: <3188ca61-2591-4576-9777-1671689b7235@linux.microsoft.com>
Date: Mon, 25 Aug 2025 16:08:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] Drivers: hv: Fix NEED_RESCHED_LAZY and use common
 APIs
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>,
 Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Peter Zijlstra <peterz@infradead.org>,
 Andy Lutomirski <luto@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 Frederic Weisbecker <frederic@kernel.org>,
 Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
 Joel Fernandes <joelagnelf@nvidia.com>, Josh Triplett
 <josh@joshtriplett.org>, Boqun Feng <boqun.feng@gmail.com>,
 Uladzislau Rezki <urezki@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-hyperv@vger.kernel.org, rcu@vger.kernel.org
References: <20250825200622.3759571-1-seanjc@google.com>
Content-Language: en-US
From: Nuno Das Neves <nunodasneves@linux.microsoft.com>
In-Reply-To: <20250825200622.3759571-1-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_160901_990782_77D076A8 
X-CRM114-Status: GOOD (  14.35  )
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

On 8/25/2025 1:06 PM, Sean Christopherson wrote:
> Fix a bug where MSHV root partitions don't honor NEED_RESCHED_LAZY, and then
> deduplicate the TIF related MSHV code by turning the "kvm" entry APIs into
> more generic "virt" APIs (which ideally would have been done when MSHV root
> support was added).
> 
> Assuming all is well, maybe this could go through the tip tree?
> 
> The Hyper-V stuff and non-x86 architectures are compile-tested only.
> 

Thanks Sean, I can test the root partition changes.

A similar change will be needed in mshv_vtl_main.c since it also calls
mshv_do_pre_guest_mode_work() (hence the "common" in mshv_common.c).

Also, is it possible to make all the mshv driver changes in a single patch?
It seems like it would be cleaner than refactoring it in patches 1 & 2 and
then deleting all the refactored code in patch 5.

Thanks
Nuno

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


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
