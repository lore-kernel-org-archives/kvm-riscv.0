Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B24D2CA0ED1
	for <kvm-riscv@archiver.kernel.org>; Fri, 15 Aug 2025 14:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+FJjdlsVpReZSYO/01aWUIYfqigo9P9+foZIVYQopJY=; b=UPqxlphbNvOge6
	KXy+1JfBU5HZ4KO1FYedYdr9YdhGPcjpZmaxzEaeRp5bdJi24s74IBQOQ39045LINgzIa1ek4z/XE
	VNymQnEncOvBqp+yuvqbRCS0rC1/DwRcE1SjmL/z95FrRvYPAGRI/8nfvCSepLGh+sQAv42hDjoxS
	jQKbImGEFCi9qq+d4Te0DV95mOS9O1M0nWaqGXRycMQ/8XgW8dpOyGpZn+Ooqm3py0/TUklgRx4Rs
	SwLlZtD0BQXnZmy4ku8Vn/aSDr8x+jl7mRyF/a0cE/aL/s7JWUzgZ5aqRRKk4qBkeM44dwBdZCuEL
	F5Uur6O0UC6qPHPZtNwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umvc7-00000002kJN-1dIb;
	Fri, 15 Aug 2025 14:41:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umsms-00000002MSk-1beN;
	Fri, 15 Aug 2025 11:39:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=xjeTweJ3rpt6YpKV/vEnlA7rHRaCcvmve7oDl2/k04A=; b=d3ilS2jyupRTcEOmUlOqZKAjGM
	0Qpsy+V+NIZ7r6wlbtVd3Bs2iHwdCFkGwOzPWg/E2TAHZ67IJq2YhPzRZLCrutdbF3TTo6Ag01Y2W
	1nm6Ojyl7/9b6VntcO58DVhpiGFVPl2ElJHVYxgEeTGc8hwoxm/DVbquUrLBrlRCd8IxRmRpiSCGk
	BCnawrZK+2z68e1v28tE9DnwMzqA2hI+I/uT3IoQAQMiZw9XSrIWuzhqt23Vw4AXDCCgR5yHUbRaG
	NjrBmHQQaGA99TukqezyXSwAkPtTSWNAPQvvxlXehSLtU2ZtPtGN1X2zSR6LZZPcTEdzcBYYoOc+w
	rt1YgSRw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umsmm-0000000GhAl-3JcF;
	Fri, 15 Aug 2025 11:39:53 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id C287B3002ED; Fri, 15 Aug 2025 13:39:51 +0200 (CEST)
Date: Fri, 15 Aug 2025 13:39:51 +0200
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
Message-ID: <20250815113951.GC4067720@noisy.programming.kicks-ass.net>
References: <20250806195706.1650976-1-seanjc@google.com>
 <20250806195706.1650976-10-seanjc@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250806195706.1650976-10-seanjc@google.com>
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

On Wed, Aug 06, 2025 at 12:56:31PM -0700, Sean Christopherson wrote:
> Add arch hooks to the mediated vPMU load/put APIs, and use the hooks to
> switch PMIs to the dedicated mediated PMU IRQ vector on load, and back to
> perf's standard NMI when the guest context is put.  I.e. route PMIs to
> PERF_GUEST_MEDIATED_PMI_VECTOR when the guest context is active, and to
> NMIs while the host context is active.
> 
> While running with guest context loaded, ignore all NMIs (in perf).  Any
> NMI that arrives while the LVTPC points at the mediated PMU IRQ vector
> can't possibly be due to a host perf event.
> 
> Signed-off-by: Xiong Zhang <xiong.y.zhang@linux.intel.com>
> Signed-off-by: Kan Liang <kan.liang@linux.intel.com>
> Signed-off-by: Mingwei Zhang <mizhang@google.com>
> [sean: use arch hook instead of per-PMU callback]
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/events/core.c     | 27 +++++++++++++++++++++++++++
>  include/linux/perf_event.h |  3 +++
>  kernel/events/core.c       |  4 ++++
>  3 files changed, 34 insertions(+)
> 
> diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
> index 7610f26dfbd9..9b0525b252f1 100644
> --- a/arch/x86/events/core.c
> +++ b/arch/x86/events/core.c
> @@ -55,6 +55,8 @@ DEFINE_PER_CPU(struct cpu_hw_events, cpu_hw_events) = {
>  	.pmu = &pmu,
>  };
>  
> +static DEFINE_PER_CPU(bool, x86_guest_ctx_loaded);
> +
>  DEFINE_STATIC_KEY_FALSE(rdpmc_never_available_key);
>  DEFINE_STATIC_KEY_FALSE(rdpmc_always_available_key);
>  DEFINE_STATIC_KEY_FALSE(perf_is_hybrid);
> @@ -1756,6 +1758,16 @@ perf_event_nmi_handler(unsigned int cmd, struct pt_regs *regs)
>  	u64 finish_clock;
>  	int ret;
>  
> +	/*
> +	 * Ignore all NMIs when a guest's mediated PMU context is loaded.  Any
> +	 * such NMI can't be due to a PMI as the CPU's LVTPC is switched to/from
> +	 * the dedicated mediated PMI IRQ vector while host events are quiesced.
> +	 * Attempting to handle a PMI while the guest's context is loaded will
> +	 * generate false positives and clobber guest state.
> +	 */
> +	if (this_cpu_read(x86_guest_ctx_loaded))
> +		return NMI_DONE;
> +
>  	/*
>  	 * All PMUs/events that share this PMI handler should make sure to
>  	 * increment active_events for their events.
> @@ -2727,6 +2739,21 @@ static struct pmu pmu = {
>  	.filter			= x86_pmu_filter,
>  };
>  
> +void arch_perf_load_guest_context(unsigned long data)
> +{
> +	u32 masked = data & APIC_LVT_MASKED;
> +
> +	apic_write(APIC_LVTPC,
> +		   APIC_DM_FIXED | PERF_GUEST_MEDIATED_PMI_VECTOR | masked);
> +	this_cpu_write(x86_guest_ctx_loaded, true);
> +}
> +
> +void arch_perf_put_guest_context(void)
> +{
> +	this_cpu_write(x86_guest_ctx_loaded, false);
> +	apic_write(APIC_LVTPC, APIC_DM_NMI);
> +}
> +
>  void arch_perf_update_userpage(struct perf_event *event,
>  			       struct perf_event_mmap_page *userpg, u64 now)
>  {
> diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
> index 0c529fbd97e6..3a9bd9c4c90e 100644
> --- a/include/linux/perf_event.h
> +++ b/include/linux/perf_event.h
> @@ -1846,6 +1846,9 @@ static inline unsigned long perf_arch_guest_misc_flags(struct pt_regs *regs)
>  # define perf_arch_guest_misc_flags(regs)	perf_arch_guest_misc_flags(regs)
>  #endif
>  
> +extern void arch_perf_load_guest_context(unsigned long data);
> +extern void arch_perf_put_guest_context(void);
> +
>  static inline bool needs_branch_stack(struct perf_event *event)
>  {
>  	return event->attr.branch_sample_type != 0;
> diff --git a/kernel/events/core.c b/kernel/events/core.c
> index e1df3c3bfc0d..ad22b182762e 100644
> --- a/kernel/events/core.c
> +++ b/kernel/events/core.c
> @@ -6408,6 +6408,8 @@ void perf_load_guest_context(unsigned long data)
>  		task_ctx_sched_out(cpuctx->task_ctx, NULL, EVENT_GUEST);
>  	}
>  
> +	arch_perf_load_guest_context(data);

So I still don't understand why this ever needs to reach the generic
code. x86 pmu driver and x86 kvm can surely sort this out inside of x86,
no?


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
