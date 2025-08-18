Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2060CA0ED1
	for <kvm-riscv@archiver.kernel.org>; Mon, 18 Aug 2025 14:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p9MTrTS/WKLWUuFxSwQ68aH83NAwsTg6L9EI7S/JTbc=; b=hla8dBw91490d3
	c8KiOLhE/0kWkLXfUFKg/mnZWAB4GyiWTYKjZnm9rNxTqIyn7tXpgzZS3yOpm8+m8TD0/By2kQEll
	08qYyCBX3XzAxFv5lfZ7U+3+9B34AJ1eDurhoLsKl/BTnWWFTZSy1xWoyi3JQdjdJqrrG1dJcwamD
	VdOi0sp7/3m4MTjf53cD9qtX/tpLIwB/sP0MpcDE4gx3oYcn9yg91n3nLydW2w5V6eY+QcH4L8uGJ
	sY576zMDMV5hvwnjC0sgY8IzEriIa8VtnTABzXduvnnHkYh4fn4+SG2agMWNx+dLH1dhPgka05wbv
	dCHCKxxCrGuc3DsMHMLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo0xv-00000007lmm-2Szo;
	Mon, 18 Aug 2025 14:36:03 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo0uA-00000007lGR-3mQH;
	Mon, 18 Aug 2025 14:32:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=6/EIRFg9PLgH5wwlMqWFKmPwTY6Y/F+Dlmaynssm+2Y=; b=nTwJBQDMyEiWOl9UKDS8McJeti
	nj2X7/q6CCyGsURq8PcmJKXeUUPIGn1OIHoJm93+vT3hwGJB/j6uSWZyqTNkmObWD5hUoZFcLuuqv
	FDy6H/gOMAsxcb0nNNyzDeOEjs3qBBIvRCTnxZNQG4RgiZgY4h3Tl+whMPf7vRLFHfsGBo0dtF63J
	b9a4itPxIPqRAa3/rFEEiJCCB1HWg+ppbiRYrSeF6BxqBVPvItmbtmMAUuckFZZXb1iaPxtZV3irs
	UTjM7zKpuSyaFmkEsXTgejffm/Nqdx4etJkPDN0uMWcooNWwfQqSfINnPGbas/DAJX/d6G8BuDVHY
	Gbz6qISA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo0u5-00000007DeO-2MJS;
	Mon, 18 Aug 2025 14:32:06 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id EC54630029B; Mon, 18 Aug 2025 16:32:04 +0200 (CEST)
Date: Mon, 18 Aug 2025 16:32:04 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
	Tianrui Zhao <zhaotianrui@loongson.cn>,
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Xin Li <xin@zytor.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	kvm@vger.kernel.org, loongarch@lists.linux.dev,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
	Kan Liang <kan.liang@linux.intel.com>,
	Yongwei Ma <yongwei.ma@intel.com>,
	Mingwei Zhang <mizhang@google.com>,
	Xiong Zhang <xiong.y.zhang@linux.intel.com>,
	Sandipan Das <sandipan.das@amd.com>,
	Dapeng Mi <dapeng1.mi@linux.intel.com>
Subject: Re: [PATCH v5 09/44] perf/x86: Switch LVTPC to/from mediated PMI
 vector on guest load/put context
Message-ID: <20250818143204.GH3289052@noisy.programming.kicks-ass.net>
References: <20250806195706.1650976-1-seanjc@google.com>
 <20250806195706.1650976-10-seanjc@google.com>
 <20250815113951.GC4067720@noisy.programming.kicks-ass.net>
 <aJ9VQH87ytkWf1dH@google.com>
 <aJ9YbZTJAg66IiVh@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aJ9YbZTJAg66IiVh@google.com>
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

On Fri, Aug 15, 2025 at 08:55:25AM -0700, Sean Christopherson wrote:
> On Fri, Aug 15, 2025, Sean Christopherson wrote:
> > On Fri, Aug 15, 2025, Peter Zijlstra wrote:
> > > > diff --git a/kernel/events/core.c b/kernel/events/core.c
> > > > index e1df3c3bfc0d..ad22b182762e 100644
> > > > --- a/kernel/events/core.c
> > > > +++ b/kernel/events/core.c
> > > > @@ -6408,6 +6408,8 @@ void perf_load_guest_context(unsigned long data)
> > > >  		task_ctx_sched_out(cpuctx->task_ctx, NULL, EVENT_GUEST);
> > > >  	}
> > > >  
> > > > +	arch_perf_load_guest_context(data);
> > > 
> > > So I still don't understand why this ever needs to reach the generic
> > > code. x86 pmu driver and x86 kvm can surely sort this out inside of x86,
> > > no?
> > 
> > It's definitely possible to handle this entirely within x86, I just don't love
> > switching the LVTPC without the protection of perf_ctx_lock and perf_ctx_disable().
> > It's not a sticking point for me if you strongly prefer something like this: 
> > 
> > diff --git a/arch/x86/kvm/pmu.c b/arch/x86/kvm/pmu.c
> > index 0e5048ae86fa..86b81c217b97 100644
> > --- a/arch/x86/kvm/pmu.c
> > +++ b/arch/x86/kvm/pmu.c
> > @@ -1319,7 +1319,9 @@ void kvm_mediated_pmu_load(struct kvm_vcpu *vcpu)
> >  
> >         lockdep_assert_irqs_disabled();
> >  
> > -       perf_load_guest_context(kvm_lapic_get_reg(vcpu->arch.apic, APIC_LVTPC));
> > +       perf_load_guest_context();
> > +
> > +       perf_load_guest_lvtpc(kvm_lapic_get_reg(vcpu->arch.apic, APIC_LVTPC));
> 
> Hmm, an argument for providing a dedicated perf_load_guest_lvtpc() APIs is that
> it would allow KVM to handle LVTPC writes in KVM's VM-Exit fastpath, i.e. without
> having to do a full put+reload of the guest context.
> 
> So if we're confident that switching the host LVTPC outside of
> perf_{load,put}_guest_context() is functionally safe, I'm a-ok with it.

Let me see. So the hardware sets Masked when it raises the interrupt.

The interrupt handler clears it from software -- depending on uarch in 3
different places:
 1) right at the start of the PMI
 2) in the middle, right before enabling the PMU (writing global control)
 3) at the end of the PMI

the various changelogs adding that code mention spurious PMIs and
malformed PEBS records.

So the fun all happens when the guest is doing PMI and gets a VM-exit
while still Masked.

At that point, we can come in and completely rewrite the PMU state,
reroute the PMI and enable things again. Then later, we 'restore' the
PMU state, re-set LVTPC masked to the guest interrupt and 'resume'.

What could possibly go wrong :/ Kan, I'm assuming, but not knowing, that
writing all the PMU MSRs is somehow serializing state sufficient to not
cause the above mentioned fails? Specifically, clearing PEBS_ENABLE
should inhibit those malformed PEBS records or something? What if the
host also has PEBS and we don't actually clear the bit?

The current order ensures we rewrite LVTPC when global control is unset;
I think we want to keep that.

While staring at this, I note that perf_load_guest_context() will clear
global ctrl, clear all the counter programming, and re-enable an empty
pmu. Now, an empty PMU should result in global control being zero --
there is nothing run after all.

But then kvm_mediated_pmu_load() writes an explicit 0 again. Perhaps
replace this with asserting it is 0 instead?

Anyway, this means that moving the LVTPC writing into
kvm_mediated_pmu_load() as you suggest is identical.
perf_load_guest_context() results in global control being 0, we then
assert it is 0, and write LVTPC while it is still 0.
kvm_pmu_load_guest_pmcs() will then frob the MSRs.

OK, so *IF* doing the VM-exit during PMI is sound, this is something
that needs a comment somewhere. Then going back again, is the easy part,
since on the host side, we can never transition into KVM during a PMI.

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
