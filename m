Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64C39CF58FE
	for <kvm-riscv@archiver.kernel.org>; Wed, 19 Nov 2025 21:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=qDE9132tIuZhccXR/39Sd35y6TZAew92to/elrHw5IU=; b=Yn5yqWufv3emJA36LWshFkqQXv
	087n1wMhV/12nNT6jQkPZTGj104Fi3VoGuM3PA+J59Ms+LscACUudsx+/cuO8udPEFZf11dllVdVW
	tTEr1FK4u3rnbVG8qDjTURw2Yav4rTAvYRvDiH2mWz9nrWoT5HEtCNyASkacifAfYKupxckP4p6id
	M/4llSv3eJlrtJxTW5XVssDwiHLTWzHjXUzLkPxcMorVhb60Vj6WNlr8vVbOx4yXDGa+1/Uyfr1Kt
	xkZVfmaQyiDqR6CeOxtPj6g/Z+ZBuJl+109Lm3JBTCLdk1Bhr4NHstXjFOHPItQfBb0T9c6FIlFVW
	xU8zRLmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLply-00000005kd1-3fR8;
	Wed, 19 Nov 2025 21:31:30 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLplw-00000005kc3-2z3X
	for kvm-riscv@lists.infradead.org;
	Wed, 19 Nov 2025 21:31:29 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-295592eb5dbso5062115ad.0
        for <kvm-riscv@lists.infradead.org>; Wed, 19 Nov 2025 13:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763587887; x=1764192687; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=tRlBn8hNsoLzEGGI6zV1NxPFQ/eFHCg8PaMSNSKYawI=;
        b=n5KlQWvdK34aKIolHSQc6DmRdgLr6+25j66jW1qX8/yAS+D2Qb+hqDA1B37WgxdCBQ
         ztrydwoKMOex3juwUdM9+ibgh0sESNOBcDFhxr54/nBAQsK4xxmxZjWc/oKgJX0hu9BS
         fEC/gSX0op1iXoZXN55q0pyPI+ee9ODgMnD16g0CMGdEt7YbK1YXmzQXpIZhAB5RLewF
         pzdrq5nZFQXXEYeQqOgIwimOdQOvm3eCsBCr6fFd7sba3ok1aIy4HNM68f4E4loAnDm+
         ea+uas2y/fNKEh2YdAlzpskABPmJm82OjHXZ88XF+AJPsHPT/Ca3aUjBhvaU1zod5zi4
         RMrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763587887; x=1764192687;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tRlBn8hNsoLzEGGI6zV1NxPFQ/eFHCg8PaMSNSKYawI=;
        b=u9S1afpOTozBtzWxxp7Qjn8hO8+mZegZ7YNlbpVxw2on6OQzB2jCvQ/4dZiUwic1z4
         eIopKyrhvovi0hAzTTBSAbHMhdbZy6i1mgLpM55szhQa1WwUwRQDwi0GmOlYBX5yf02o
         s3eWDqaUJOSqXkas+aJPWE0wRcCDdYt0QdzesBYd6QwWFP1vVnVmv4yRKeC3V7o2hubT
         QeC7CC1ATlO+YvIvPMb9pUsHjVUUvwtdbR0MPr5x5sbmO9cQGml7ye90y8Llo2WnlmwW
         Dn46mSBZtI3hzncrKSuDIKdeXfL+y6S2c8BlsFr3lQU1x67KFNNIJYQ2neywNMTzgaCT
         VQEg==
X-Forwarded-Encrypted: i=1; AJvYcCXdOdFB2wvYBWrCg4+0Vl1XzgorM3PpPYQ0OqvllbX9TI0hPYAI4r6dKw54yvaheI89HbbJpuhnlfM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3Wy3uo8X/Al+1qHbvA5pJrHA+wnctdDQgQfVB9c1THkEXBVsT
	F0PAsZc4E8U05ONYPXxjrgxd/z2G/GrDYHbyg2D5PY58WPXsJGS4nP81RJ40m8b+Oy3VJ4Ng2Xo
	1/4KX9A==
X-Google-Smtp-Source: AGHT+IEd+gfd++T3e2i6Z4dBj2glGk6LJnNjNrz24WgF1sqa+HmClxx9J2N7UBfKQW53wCFECS0cLQGpQb0=
X-Received: from plot18.prod.google.com ([2002:a17:902:8c92:b0:298:9ac:cfe9])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ccc7:b0:298:49db:a9c5
 with SMTP id d9443c01a7336-29b5b136462mr7336255ad.43.1763587887332; Wed, 19
 Nov 2025 13:31:27 -0800 (PST)
Date: Wed, 19 Nov 2025 13:31:26 -0800
In-Reply-To: <aKNF7jc4qr9ab-Es@google.com>
Mime-Version: 1.0
References: <20250806195706.1650976-1-seanjc@google.com> <20250806195706.1650976-10-seanjc@google.com>
 <20250815113951.GC4067720@noisy.programming.kicks-ass.net>
 <aJ9VQH87ytkWf1dH@google.com> <aJ9YbZTJAg66IiVh@google.com>
 <20250818143204.GH3289052@noisy.programming.kicks-ass.net> <aKNF7jc4qr9ab-Es@google.com>
Message-ID: <aR43LoV1ti5-2WRD@google.com>
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
X-CRM114-CacheID: sfid-20251119_133128_757816_8B3C82DA 
X-CRM114-Status: GOOD (  34.88  )
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

On Mon, Aug 18, 2025, Sean Christopherson wrote:
> On Mon, Aug 18, 2025, Peter Zijlstra wrote:
> > On Fri, Aug 15, 2025 at 08:55:25AM -0700, Sean Christopherson wrote:
> > > On Fri, Aug 15, 2025, Sean Christopherson wrote:
> > > > On Fri, Aug 15, 2025, Peter Zijlstra wrote:
> > > So if we're confident that switching the host LVTPC outside of
> > > perf_{load,put}_guest_context() is functionally safe, I'm a-ok with it.
> > 
> > Let me see. So the hardware sets Masked when it raises the interrupt.
> > 
> > The interrupt handler clears it from software -- depending on uarch in 3
> > different places:
> >  1) right at the start of the PMI
> >  2) in the middle, right before enabling the PMU (writing global control)
> >  3) at the end of the PMI
> > 
> > the various changelogs adding that code mention spurious PMIs and
> > malformed PEBS records.
> > 
> > So the fun all happens when the guest is doing PMI and gets a VM-exit
> > while still Masked.
> > 
> > At that point, we can come in and completely rewrite the PMU state,
> > reroute the PMI and enable things again. Then later, we 'restore' the
> > PMU state, re-set LVTPC masked to the guest interrupt and 'resume'.
> > 
> > What could possibly go wrong :/ Kan, I'm assuming, but not knowing, that
> > writing all the PMU MSRs is somehow serializing state sufficient to not
> > cause the above mentioned fails? Specifically, clearing PEBS_ENABLE
> > should inhibit those malformed PEBS records or something? What if the
> > host also has PEBS and we don't actually clear the bit?
> > 
> > The current order ensures we rewrite LVTPC when global control is unset;
> > I think we want to keep that.
> 
> Yes, for sure.
> 
> > While staring at this, I note that perf_load_guest_context() will clear
> > global ctrl, clear all the counter programming, and re-enable an empty
> > pmu. Now, an empty PMU should result in global control being zero --
> > there is nothing run after all.
> > 
> > But then kvm_mediated_pmu_load() writes an explicit 0 again. Perhaps
> > replace this with asserting it is 0 instead?
> 
> Yeah, I like that idea, a lot.  This?
> 
> 	perf_load_guest_context();
> 
> 	/*
> 	 * Sanity check that "loading" guest context disabled all counters, as
> 	 * modifying the LVTPC while host perf is active will cause explosions,
> 	 * as will loading event selectors and PMCs with guest values.
> 	 *
> 	 * VMX will enable/disable counters at VM-Enter/VM-Exit by atomically
> 	 * loading PERF_GLOBAL_CONTROL.  SVM effectively performs the switch by
> 	 * configuring all events to be GUEST_ONLY.
> 	 */
> 	WARN_ON_ONCE(rdmsrq(kvm_pmu_ops.PERF_GLOBAL_CTRL));

This doesn't actually work, because perf_load_guest_context() doesn't guarantee
PERF_GLOBAL_CTRL is '0', it only guarantees all events are disabled.  E.g. if
there are no perf events, perf_load_guest_context() is one big nop (I think).

And while it might seem reasonable to expect PERF_GLOBAL_CTRL to be '0' if
there are no perf events, that doesn't hold true today.  E.g. amd_pmu_reload_virt()
unconditionally sets all supported MSR_AMD64_PERF_CNTR_GLOBAL_CTL bits.

I'm sure we could massage perf to really truly ensure PERF_GLOBAL_CTRL is '0',
but I don't see any value in explicitly doing that in perf_load_guest_context()
(versus simply doing it in KVM), and I would rather not play whack-a-mole in perf
as part of this series.

So unless someone really, really wants to lean on perf to clear PERF_GLOBAL_CTRL,
I'll go with this:

	/*
	 * Explicitly clear PERF_GLOBAL_CTRL, as "loading" the guest's context
	 * disables all individual counters (if any were enabled), but doesn't
	 * globally disable the entire PMU.  Loading event selectors and PMCs
	 * with guest values while PERF_GLOBAL_CTRL is non-zero will generate
	 * unexpected events and PMIs.
	 *
	 * VMX will enable/disable counters at VM-Enter/VM-Exit by atomically
	 * loading PERF_GLOBAL_CONTROL.  SVM effectively performs the switch by
	 * configuring all events to be GUEST_ONLY.  Clear PERF_GLOBAL_CONTROL
	 * even for SVM to minimize the damage if a perf event is left enabled,
	 * and to ensure a consistent starting state.
	 */
	wrmsrq(kvm_pmu_ops.PERF_GLOBAL_CTRL, 0);

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
