Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05B23CA0ED1
	for <kvm-riscv@archiver.kernel.org>; Mon, 18 Aug 2025 17:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=tbrM1GRy/7lmWuYmeiQ+6wRc8a6MeYBfkJShhuJnC4A=; b=SX+wHk56BJIaFtLB6fWm2ihRcJ
	YdXZ/OYLL2VSUd4etBtoJGgen+SvnAk9jUxpW1H+H+wTogKfcPitKKqZI9nlvYa5m+P2gzkp4xv1/
	fh+B+Q2gFHbX4GlKB5WA/E9Y8gvgkz6FjfzfxH588Nr14aPSTL4gnr5UkQIBez+lwlvO+AvuJ1AsO
	nLfL6FLWUW8snRf/RuyKIW7j3ESX46Fpc2JESSgUINE+jlFP/nPjYkrtoQAtbq4zSXKF/46a+hapc
	+rtGirPp1xLQT1O5dIMS/iXj4d71m/07QjF/ZBwApOyauIkvvYxBA47C9IlNEhkvlvogq8ZasfhRN
	aZGUC0Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo3iK-00000008AFd-33Gx;
	Mon, 18 Aug 2025 17:32:08 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo1jt-00000007uri-3z4g
	for kvm-riscv@lists.infradead.org;
	Mon, 18 Aug 2025 15:25:39 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-32326e09c5fso4262916a91.2
        for <kvm-riscv@lists.infradead.org>; Mon, 18 Aug 2025 08:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755530736; x=1756135536; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CsoYx/ZJm+dL7FRV6jyG7YgqbQ7bK3pBhdAAvFLAFxA=;
        b=EjiDmJfMM+NPTm2hpTb/jJHTGn73r7KnPvEM7kG0Wq9nXIRHYpJHhqWtMk68k85bkP
         nK655qac9HCK00t/tosmuq7D1vLvCue6Rnh2xiOwOEOQJnjicSD4AvUJv8HR75JTrDhg
         v5layamigOKoBY+jP0a15bZNGLIzcf6A/b2n7NSlq/fyaGrn8mAAs07w3k7xWgkYorfE
         YslI+TX9ElTE/iv1/rvGkVZTOWujzGalAhl0h5t6/m7rKxHFjh2QdNW60iXlEIbNarwW
         js6zwi7TXVlATxGnatPA3SueJKzUcYhONkiuySZrhGDiZ05ZMUjwVVZJzSUkj5qIGyC6
         Vh8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755530736; x=1756135536;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CsoYx/ZJm+dL7FRV6jyG7YgqbQ7bK3pBhdAAvFLAFxA=;
        b=DjRIoELsBDc6pEuuHm1vge9NoQSKI/92+sXMRJg56InODS0u+a/7OAaTGcl7x7FvLI
         3uo0eoxgvEDZOQxSe4x/NdpXAg/HPEtF23fmZZhHu4XfjPedsmyhB8/KSYALssFS7pGL
         T+B4jTlKypHmb1p33zL7PuSzhP4tn/G2jon8Hf1n5INU2kkz9FdsHFYbmVNiaceickEn
         5OcCip/hT7rexT1GBHYCVuEFgg6JXicvXfYCyGARk/8TZiyO3cGpD5dxVhZ4a7TdX4BP
         nGW3hlQ3G6ar9BreQf4fp9Akr7WzPlRJn/ymq0/FzEF8kU/eYM0ORdBUshP1kB1s7Jz7
         pFAw==
X-Forwarded-Encrypted: i=1; AJvYcCWwxS5Q0H90c/jlpB432NTlbS5l+0vuN3IPCTiYe9wsRVBj+gH5t/s0Z2rHtpqYoq8nFDdVr61c3NE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8KdMeelJbxWxnER5O/kI6TvWK6Z7v5VlAX0b0zPNKU/xttAkk
	Vzq1xo+WQOXPozjP4ZXmG20v7BJU4c4lfsfH4kDQJ2YuLWHJ7HtH3ODxKwYDA9Wm88iMwR02ACN
	K7+s3rQ==
X-Google-Smtp-Source: AGHT+IFCmpj8FbJmK1+JWLBztlT6f28DkrWlTFsNjoSajBRjHfMiKFT/6+vAkpnb7u9ULN6Oz/FIAv/3KBU=
X-Received: from pjee5.prod.google.com ([2002:a17:90b:5785:b0:311:ef56:7694])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:52c6:b0:31e:f3b7:49c6
 with SMTP id 98e67ed59e1d1-323421b64b7mr17300718a91.15.1755530736134; Mon, 18
 Aug 2025 08:25:36 -0700 (PDT)
Date: Mon, 18 Aug 2025 08:25:34 -0700
In-Reply-To: <20250818143204.GH3289052@noisy.programming.kicks-ass.net>
Mime-Version: 1.0
References: <20250806195706.1650976-1-seanjc@google.com> <20250806195706.1650976-10-seanjc@google.com>
 <20250815113951.GC4067720@noisy.programming.kicks-ass.net>
 <aJ9VQH87ytkWf1dH@google.com> <aJ9YbZTJAg66IiVh@google.com> <20250818143204.GH3289052@noisy.programming.kicks-ass.net>
Message-ID: <aKNF7jc4qr9ab-Es@google.com>
Subject: Re: [PATCH v5 09/44] perf/x86: Switch LVTPC to/from mediated PMI
 vector on guest load/put context
From: Sean Christopherson <seanjc@google.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Xin Li <xin@zytor.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Andy Lutomirski <luto@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	Kan Liang <kan.liang@linux.intel.com>, Yongwei Ma <yongwei.ma@intel.com>, 
	Mingwei Zhang <mizhang@google.com>, Xiong Zhang <xiong.y.zhang@linux.intel.com>, 
	Sandipan Das <sandipan.das@amd.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_082537_981935_7666BA60 
X-CRM114-Status: GOOD (  39.91  )
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

On Mon, Aug 18, 2025, Peter Zijlstra wrote:
> On Fri, Aug 15, 2025 at 08:55:25AM -0700, Sean Christopherson wrote:
> > On Fri, Aug 15, 2025, Sean Christopherson wrote:
> > > On Fri, Aug 15, 2025, Peter Zijlstra wrote:
> > > > > diff --git a/kernel/events/core.c b/kernel/events/core.c
> > > > > index e1df3c3bfc0d..ad22b182762e 100644
> > > > > --- a/kernel/events/core.c
> > > > > +++ b/kernel/events/core.c
> > > > > @@ -6408,6 +6408,8 @@ void perf_load_guest_context(unsigned long data)
> > > > >  		task_ctx_sched_out(cpuctx->task_ctx, NULL, EVENT_GUEST);
> > > > >  	}
> > > > >  
> > > > > +	arch_perf_load_guest_context(data);
> > > > 
> > > > So I still don't understand why this ever needs to reach the generic
> > > > code. x86 pmu driver and x86 kvm can surely sort this out inside of x86,
> > > > no?
> > > 
> > > It's definitely possible to handle this entirely within x86, I just don't love
> > > switching the LVTPC without the protection of perf_ctx_lock and perf_ctx_disable().
> > > It's not a sticking point for me if you strongly prefer something like this: 
> > > 
> > > diff --git a/arch/x86/kvm/pmu.c b/arch/x86/kvm/pmu.c
> > > index 0e5048ae86fa..86b81c217b97 100644
> > > --- a/arch/x86/kvm/pmu.c
> > > +++ b/arch/x86/kvm/pmu.c
> > > @@ -1319,7 +1319,9 @@ void kvm_mediated_pmu_load(struct kvm_vcpu *vcpu)
> > >  
> > >         lockdep_assert_irqs_disabled();
> > >  
> > > -       perf_load_guest_context(kvm_lapic_get_reg(vcpu->arch.apic, APIC_LVTPC));
> > > +       perf_load_guest_context();
> > > +
> > > +       perf_load_guest_lvtpc(kvm_lapic_get_reg(vcpu->arch.apic, APIC_LVTPC));
> > 
> > Hmm, an argument for providing a dedicated perf_load_guest_lvtpc() APIs is that
> > it would allow KVM to handle LVTPC writes in KVM's VM-Exit fastpath, i.e. without
> > having to do a full put+reload of the guest context.
> > 
> > So if we're confident that switching the host LVTPC outside of
> > perf_{load,put}_guest_context() is functionally safe, I'm a-ok with it.
> 
> Let me see. So the hardware sets Masked when it raises the interrupt.
> 
> The interrupt handler clears it from software -- depending on uarch in 3
> different places:
>  1) right at the start of the PMI
>  2) in the middle, right before enabling the PMU (writing global control)
>  3) at the end of the PMI
> 
> the various changelogs adding that code mention spurious PMIs and
> malformed PEBS records.
> 
> So the fun all happens when the guest is doing PMI and gets a VM-exit
> while still Masked.
> 
> At that point, we can come in and completely rewrite the PMU state,
> reroute the PMI and enable things again. Then later, we 'restore' the
> PMU state, re-set LVTPC masked to the guest interrupt and 'resume'.
> 
> What could possibly go wrong :/ Kan, I'm assuming, but not knowing, that
> writing all the PMU MSRs is somehow serializing state sufficient to not
> cause the above mentioned fails? Specifically, clearing PEBS_ENABLE
> should inhibit those malformed PEBS records or something? What if the
> host also has PEBS and we don't actually clear the bit?
> 
> The current order ensures we rewrite LVTPC when global control is unset;
> I think we want to keep that.

Yes, for sure.

> While staring at this, I note that perf_load_guest_context() will clear
> global ctrl, clear all the counter programming, and re-enable an empty
> pmu. Now, an empty PMU should result in global control being zero --
> there is nothing run after all.
> 
> But then kvm_mediated_pmu_load() writes an explicit 0 again. Perhaps
> replace this with asserting it is 0 instead?

Yeah, I like that idea, a lot.  This?

	perf_load_guest_context();

	/*
	 * Sanity check that "loading" guest context disabled all counters, as
	 * modifying the LVTPC while host perf is active will cause explosions,
	 * as will loading event selectors and PMCs with guest values.
	 *
	 * VMX will enable/disable counters at VM-Enter/VM-Exit by atomically
	 * loading PERF_GLOBAL_CONTROL.  SVM effectively performs the switch by
	 * configuring all events to be GUEST_ONLY.
	 */
	WARN_ON_ONCE(rdmsrq(kvm_pmu_ops.PERF_GLOBAL_CTRL));

	perf_load_guest_lvtpc(kvm_lapic_get_reg(vcpu->arch.apic, APIC_LVTPC));

> Anyway, this means that moving the LVTPC writing into
> kvm_mediated_pmu_load() as you suggest is identical.
> perf_load_guest_context() results in global control being 0, we then
> assert it is 0, and write LVTPC while it is still 0.
> kvm_pmu_load_guest_pmcs() will then frob the MSRs.
> 
> OK, so *IF* doing the VM-exit during PMI is sound, this is something
> that needs a comment somewhere. 

I'm a bit lost here.  Are you essentially asking if it's ok to take a VM-Exit
while the guest is handling a PMI?  If so, that _has_ to work, because there are
myriad things that can/will trigger a VM-Exit at any point while the guest is
active.

> Then going back again, is the easy part, since on the host side, we can never
> transition into KVM during a PMI.

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
