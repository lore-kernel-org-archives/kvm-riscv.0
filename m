Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31B3FCA0FF2
	for <kvm-riscv@archiver.kernel.org>; Tue, 26 Aug 2025 18:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T5v2j03/17uPzbx1rojSo6OjpM+QANUvi7IqfDU5eXo=; b=n8LQBKo0l6a7+i
	xyEI8fSbnfeNMaWS3kTdxs7+JTolkWsT01oaqDkLYm4sGudTET41kfuyi/NxRqIUuE5xIeg8Qj4mj
	kR4V15Qpf+GcDZAysZcZLttJzkEhKryiZa9laznaEHV183KHO29VuHubiGaCPqrfJh+WMyWMItaIR
	Uq7FunjkpKg3ZhHzyMhUIC04yDoa6yjeH/cfBTcx+CGnrbY7g8AWaUd9bsvFxI+rx5OOVrsvZIXTE
	M2Bzjd1Nk8ednutQil5ZfNzB4hejvdHnCMXgobM8OU1/gbz8A+HC1MnzMT+XRVkKcsKgIik7XuqNC
	grEWtK8Ddx9fY88nqdFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqy5i-0000000CqIt-1SBy;
	Tue, 26 Aug 2025 18:08:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqwzp-0000000ChNV-39Ms;
	Tue, 26 Aug 2025 16:58:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=B1Ra0sIa1ZhdeCCWkbFdTe10sKp2xTKc4kpjbQJ+L0o=; b=O2hOXDu1uzbwlX7OANF+iGx/R+
	6UoXejCDibkCsBP0Sufh3Cb3m2ROKpT0+iygB0+J2CFV6fsEcSakCSOSpcjcst5wqBNZ9Rl7SvzIa
	Pp8Cm8v4K61eCclnm95hf4TwyzFqt3VNXXKASCFdrpUfQBmIKmHmZMWxCZeMODzT0/ZSx1BXyXevy
	LBYUvUvp3c2Jv1v+1UkRNjfGE9F5GZHLGzke7MyECyGMET1vTEOJH00LPKwLlO5Nr2QYb4X85ZH/L
	8C93B3Ay1P9C54Em9H9JVOShPXXyBlOSfgO6zM9rI1vKDiYjnkTX7V5taI1ycLtBX9hzcD4QAYzEJ
	9DcRBDbw==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqwzm-00000002HDR-20kM;
	Tue, 26 Aug 2025 16:58:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 828AA44427;
	Tue, 26 Aug 2025 16:58:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C82A7C4CEF1;
	Tue, 26 Aug 2025 16:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756227482;
	bh=fnUtXDAxJfdbxKoWIvjZ0YEMsdquajfs3Wt0vqohrgU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fuvpJ+uRtRM9fzHvRv14jD9ZQo0Z+Ik1UILyoPgPF2jz8dNyPROaEFVvlvQAaXz4X
	 ttXYaAtJGkub4HtTxq/BEINhmPDYT0kc4MO9Pt7hSTntGG0uTTAcFEzDYKdGxtFeT2
	 qkjkQ9Njb/UFnPIIvb1+17UQA9vp2juzNUYGm3uywq3v8NTkaS1OlNFYQ09AI39lpx
	 YQaZvSP4SUfRf4YlPPa54Y1tNy/wsF7ZVJVKqynCB7t8JfsAtW1Xvl7gh2NjEvVbqY
	 byeS9jwZXrmVRhx6StAaC2vlVi6HX3Ox4JExT2RQEj9zwDNL3tioAysr1mHqOoXhAg
	 8DUjtPx04KNjg==
Date: Tue, 26 Aug 2025 16:58:00 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Nuno Das Neves <nunodasneves@linux.microsoft.com>,
	Marc Zyngier <maz@kernel.org>,
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
	linux-hyperv@vger.kernel.org, rcu@vger.kernel.org
Subject: Re: [PATCH 0/5] Drivers: hv: Fix NEED_RESCHED_LAZY and use common
 APIs
Message-ID: <aK3nmOgVl4INJpjG@liuwe-devbox-ubuntu-v2.tail21d00.ts.net>
References: <20250825200622.3759571-1-seanjc@google.com>
 <3188ca61-2591-4576-9777-1671689b7235@linux.microsoft.com>
 <aKz_ZMvvF0e9nwSn@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aKz_ZMvvF0e9nwSn@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_175806_966277_7C8F639B 
X-CRM114-Status: GOOD (  30.26  )
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

On Mon, Aug 25, 2025 at 05:27:16PM -0700, Sean Christopherson wrote:
> On Mon, Aug 25, 2025, Nuno Das Neves wrote:
> > On 8/25/2025 1:06 PM, Sean Christopherson wrote:
> > > Fix a bug where MSHV root partitions don't honor NEED_RESCHED_LAZY, and then
> > > deduplicate the TIF related MSHV code by turning the "kvm" entry APIs into
> > > more generic "virt" APIs (which ideally would have been done when MSHV root
> > > support was added).
> > > 
> > > Assuming all is well, maybe this could go through the tip tree?
> > > 
> > > The Hyper-V stuff and non-x86 architectures are compile-tested only.
> > > 
> > 
> > Thanks Sean, I can test the root partition changes.
> > 
> > A similar change will be needed in mshv_vtl_main.c since it also calls
> > mshv_do_pre_guest_mode_work() (hence the "common" in mshv_common.c).
> 
> Oof, more dependencies.  I suppose the easiest thing would be to send a series
> against
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/hyperv/linux.git queue
> 
> and then route everything through there?

Our fixes branch is on 6.17-rc1. You can use it as a base if you want
to.

> 
> Alternatively, frontload the MSHV fixes (which I'll do regardless) and take those
> through hyperv and the rest through the tip tree?  That seems like an absurd
> amount of juggling though, especially if we want to get the cleanups into 6.18.
> And if none of these lands, it's MSHV that'll suffer the most, so betting it all
> on the hyperv tree doesn't seem terrible.
> 

I'm happy to do it however the community sees fit.

> > Also, is it possible to make all the mshv driver changes in a single patch?
> 
> It's certainly possible, but I'd prefer not do to that.
> 
> > It seems like it would be cleaner than refactoring it in patches 1 & 2 and
> > then deleting all the refactored code in patch 5.
> 
> Only if you don't care about backporting fixes, bisection, or maintaining code.
> 
> E.g. if checking NEED_RESCHED_LAZY somehow causes issues, it would be really nice
> for that to bisect to exactly that patch, not a patch that also switches to a
> completely different set of APIs.
> 
> And if someone is wants the fixes in a pre-6.18 kernel, they don't need to
> backport all of the KVM and entry code changes just to get the fix.

+1 on this.

Thanks,
Wei

> 
> As for the maintenance headache, see above.

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
