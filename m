Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBDA3CA0FED
	for <kvm-riscv@archiver.kernel.org>; Tue,  9 Sep 2025 17:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ga88+T97gYK0jruO7M3ZepKjYhrtGM2ixv4gVIt4th8=; b=w1nz0uJEdAoJx5
	HGMV+sKuHmXqdagIzbsKklgG0uLI2KtSA3vig7jZFLh+DWwrgXfHvNPgwLuX3oXKesyCObKlutp7P
	lWpQtPpc3x206lyJ+tc/JaGzOwCA7PRsG47HjxR80i4l1p/il0UMm1b3W8JOV09h+8X3aR9s50gBd
	06eYzh5A1S7dOm6jKYzYh1/bZ/wLboabKCn0Is3sh3O1ldyLmw0sLgIw8HnqHNbVzzPpuPrdW75w5
	DPNVq1T6NpwrvFgJXnppUBKkNNEocPuSmgeH9cCSWZTHQBdaZ6gMj4Mj4tUeAiAOj82XvEWUcfJDU
	rfMh1T92lEIlInN3EwGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw28Y-000000098wZ-1B8F;
	Tue, 09 Sep 2025 17:28:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw21F-00000008wS5-3wb5;
	Tue, 09 Sep 2025 17:20:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3750160224;
	Tue,  9 Sep 2025 17:20:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B305C4CEF4;
	Tue,  9 Sep 2025 17:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757438435;
	bh=aDtO0EP2Luwblw7wXBa/S0nm/bbd84Amf4RIFEa0YMU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rWNA+SZ7P7XMqvonOPAEdmtY55rXaIKEEzU9HK+ppzMNafCHRqDvkVmEoUduHt/rT
	 aa5OZZx3ilY519/VHWj4+vwbhsuG88pY0+u24AUMR9OeOT4pFbgJb7ecQe/x2pWO4E
	 vcn4jx2aGZ2e8t05J44ouMyfLu5WoVzT4hxN53UWANQ6M/G517uScWAOMTyKqRmi5V
	 diqflVnydGhyAkUdxMQ6Bnquv1D4Xk2wLalfluyanQAMUeNCL713BGUmRtcdXk2oSb
	 +eCWCY1ISYJlrL6GLeiTkLfqGaoEYVf8wOe7r+TdNoqrDDp/wKG1ImILx8nFyAfEJN
	 RYEyJmVbovIiA==
Date: Tue, 9 Sep 2025 17:20:34 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Wei Liu <wei.liu@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
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
	Dexuan Cui <decui@microsoft.com>,
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
	Nuno Das Neves <nunodasneves@linux.microsoft.com>,
	Mukesh R <mrathor@linux.microsoft.com>
Subject: Re: [PATCH v2 0/7] Drivers: hv: Fix NEED_RESCHED_LAZY and use common
 APIs
Message-ID: <aMBh4kPNOEUKvxpV@liuwe-devbox-ubuntu-v2.lamzopl0uupeniq2etz1fddiyg.xx.internal.cloudapp.net>
References: <20250828000156.23389-1-seanjc@google.com>
 <aLojpyTwAMdb1z6D@liuwe-devbox-ubuntu-v2.lamzopl0uupeniq2etz1fddiyg.xx.internal.cloudapp.net>
 <aLp3makY6FzuUwor@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aLp3makY6FzuUwor@google.com>
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

On Thu, Sep 04, 2025 at 10:39:37PM -0700, Sean Christopherson wrote:
> On Thu, Sep 04, 2025, Wei Liu wrote:
> > On Wed, Aug 27, 2025 at 05:01:49PM -0700, Sean Christopherson wrote:
> > > Fix a bug where MSHV root partitions (and upper-level VTL code) don't honor
> > > NEED_RESCHED_LAZY, and then deduplicate the TIF related MSHV code by turning
> > > the "kvm" entry APIs into more generic "virt" APIs.
> > > 
> > > This version is based on
> > > 
> > >   git://git.kernel.org/pub/scm/linux/kernel/git/hyperv/linux.git hyperv-next
> > > 
> > > in order to pickup the VTL changes that are queued for 6.18.  I also
> > > squashed the NEED_RESCHED_LAZY fixes for root and VTL modes into a single
> > > patch, as it should be easy/straightforward to drop the VTL change as needed
> > > if we want this in 6.17 or earlier.
> > > 
> > > That effectively means the full series is dependent on the VTL changes being
> > > fully merged for 6.18.  But I think that's ok as it's really only the MSHV
> > > changes that have any urgency whatsoever, and I assume that Microsoft is
> > > the only user that truly cares about the MSHV root fix.  I.e. if the whole
> > > thing gets delayed, I think it's only the Hyper-V folks that are impacted.
> > > 
> > > I have no preference what tree this goes through, or when, and can respin
> > > and/or split as needed.
> > > 
> > > As with v1, the Hyper-V stuff and non-x86 architectures are compile-tested
> > > only.
> > > 
> > > v2:
> > >  - Rebase on hyperv-next.
> > >  - Fix and converge the VTL code as well. [Peter, Nuno]
> > > 
> > > v1: https://lore.kernel.org/all/20250825200622.3759571-1-seanjc@google.com
> > > 
> > 
> > I dropped the mshv_vtl changes in this series and applied the rest
> > (including the KVM changes) to hyperv-next.
> 
> mshv_do_pre_guest_mode_work() ended up getting left behind since its removal was
> in the last mshv_vtl patch.
> 
>   $ git grep mshv_do_pre_guest_mode_work
>   drivers/hv/mshv.h:int mshv_do_pre_guest_mode_work(ulong th_flags);
>   drivers/hv/mshv_common.c:int mshv_do_pre_guest_mode_work(ulong th_flags)
>   drivers/hv/mshv_common.c:EXPORT_SYMBOL_GPL(mshv_do_pre_guest_mode_work);
> 
> Want to squash this into 3786d7d6b3c0 ("mshv: Use common "entry virt" APIs to do
> work in root before running guest")?
> 

It's done. Thanks for pointing it out.

Wei

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
