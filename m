Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73174CA0EC0
	for <kvm-riscv@archiver.kernel.org>; Fri,  8 Aug 2025 07:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qHurzP+sC0A9nDB0OtuFHPWUcajsRHKQ4URILGh7K58=; b=Tl3Ybcpj3qzxbG
	drOjfhQYVscfb6Ck8fjmN7wLWes2p0+wd6dERdUs77honlxDymwAWHWtQ36qRY2i/QCtRAiE2RPan
	AQxa1+xHU3eEBNOFhaDw9OEDFZx+UsN17sEH8n89fYfocyKr/8xZtN/SM9x6OmKjACjAPvl9iMbFf
	BoSYzqLQpUE+31ISZ1/WMCHkUt+3Kn5mDVf34meBJ3ssKedmnZzBy3bWF9pcD+Lv6GmFbRj13Y0Jc
	hYVNuj1oBXCX6RlT+d/JIQWeYbkeTssf1jV8PyyVJCp4MpL+Z2yK/Z+87JKkLO5NcbUaN4Z0eYkjs
	/rVz8BxaEO/0RY2vrERQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukHoq-00000002FOs-0al3;
	Fri, 08 Aug 2025 07:47:16 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukHYz-00000002CHb-1maJ;
	Fri, 08 Aug 2025 07:30:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754638254; x=1786174254;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=N93jbXCfcX8tT1d6Si749lOVTvmyst9EjSTFBREX9yk=;
  b=DJ69Hxjj7Q2lTVmYMRYXr/A7ODYKRxPKQAw5nXC4vkb1PSfL5OkofgoB
   b/G4mGdgsja96TDM1DFdJJ0AgFU+nr/J4XI5ZcdzgmNY7Lt+rIXw4A6EQ
   3OU2/g7AhZMili7sVVCsg3Yu6WDNqN9PJFZ0dfwp4NS7OCvpINQXFDNLI
   Yu1aA7lSPxXCBhAuuLMv7cYW9TM4JROP4PztS2ZB4pTl1IYSTICJUd4MB
   HrE8LurL6bv/z6+4xuqU7kEUfvJu1r087ralsrFxiCiujZp6WAI9wzkIW
   qrdJGF3Ly7e040lvIh7H3KRLTWbG1+Mwptrh6IphVrM9jGA0ExFahGZpT
   w==;
X-CSE-ConnectionGUID: WT8L1Yi+TVWDiDxwMMHc5w==
X-CSE-MsgGUID: AoH9eIflTsiWj7NbOul/WQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56860998"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="56860998"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2025 00:30:50 -0700
X-CSE-ConnectionGUID: nPT+neYWR5ic6FwTvd4gdw==
X-CSE-MsgGUID: 3HIOr3NzSxqUGeU1ve8zNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="165677254"
Received: from dapengmi-mobl1.ccr.corp.intel.com (HELO [10.124.240.106]) ([10.124.240.106])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2025 00:30:43 -0700
Message-ID: <f3e09bef-8bc9-48ac-983e-7a18c2ff4ad2@linux.intel.com>
Date: Fri, 8 Aug 2025 15:30:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/44] perf: Add APIs to load/put guest mediated PMU
 context
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao
 <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>,
 Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Xin Li <xin@zytor.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 kvm@vger.kernel.org, loongarch@lists.linux.dev,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 Kan Liang <kan.liang@linux.intel.com>, Yongwei Ma <yongwei.ma@intel.com>,
 Mingwei Zhang <mizhang@google.com>,
 Xiong Zhang <xiong.y.zhang@linux.intel.com>,
 Sandipan Das <sandipan.das@amd.com>
References: <20250806195706.1650976-1-seanjc@google.com>
 <20250806195706.1650976-8-seanjc@google.com>
Content-Language: en-US
From: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
In-Reply-To: <20250806195706.1650976-8-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_003053_505651_76500408 
X-CRM114-Status: GOOD (  20.68  )
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


On 8/7/2025 3:56 AM, Sean Christopherson wrote:
> From: Kan Liang <kan.liang@linux.intel.com>
>
> Add exported APIs to load/put a guest mediated PMU context.  KVM will
> load the guest PMU shortly before VM-Enter, and put the guest PMU shortly
> after VM-Exit.
>
> On the perf side of things, schedule out all exclude_guest events when the
> guest context is loaded, and schedule them back in when the guest context
> is put.  I.e. yield the hardware PMU resources to the guest, by way of KVM.
>
> Note, perf is only responsible for managing host context.  KVM is
> responsible for loading/storing guest state to/from hardware.
>
> Suggested-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Kan Liang <kan.liang@linux.intel.com>
> Signed-off-by: Mingwei Zhang <mizhang@google.com>
> [sean: shuffle patches around, write changelog]
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  include/linux/perf_event.h |  2 ++
>  kernel/events/core.c       | 61 ++++++++++++++++++++++++++++++++++++++
>  2 files changed, 63 insertions(+)
>
> diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
> index 0958b6d0a61c..42d019d70b42 100644
> --- a/include/linux/perf_event.h
> +++ b/include/linux/perf_event.h
> @@ -1925,6 +1925,8 @@ extern u64 perf_event_pause(struct perf_event *event, bool reset);
>  #ifdef CONFIG_PERF_GUEST_MEDIATED_PMU
>  int perf_create_mediated_pmu(void);
>  void perf_release_mediated_pmu(void);
> +void perf_load_guest_context(unsigned long data);
> +void perf_put_guest_context(void);
>  #endif
>  
>  #else /* !CONFIG_PERF_EVENTS: */
> diff --git a/kernel/events/core.c b/kernel/events/core.c
> index 6875b56ddd6b..77398b1ad4c5 100644
> --- a/kernel/events/core.c
> +++ b/kernel/events/core.c
> @@ -469,10 +469,19 @@ static cpumask_var_t perf_online_pkg_mask;
>  static cpumask_var_t perf_online_sys_mask;
>  static struct kmem_cache *perf_event_cache;
>  
> +#ifdef CONFIG_PERF_GUEST_MEDIATED_PMU
> +static DEFINE_PER_CPU(bool, guest_ctx_loaded);
> +
> +static __always_inline bool is_guest_mediated_pmu_loaded(void)
> +{
> +	return __this_cpu_read(guest_ctx_loaded);
> +}
> +#else
>  static __always_inline bool is_guest_mediated_pmu_loaded(void)
>  {
>  	return false;
>  }
> +#endif
>  
>  /*
>   * perf event paranoia level:
> @@ -6379,6 +6388,58 @@ void perf_release_mediated_pmu(void)
>  	atomic_dec(&nr_mediated_pmu_vms);
>  }
>  EXPORT_SYMBOL_GPL(perf_release_mediated_pmu);
> +
> +/* When loading a guest's mediated PMU, schedule out all exclude_guest events. */
> +void perf_load_guest_context(unsigned long data)

nit: the "data" argument is not used in this patch, we may defer to
introduce it in patch 09/44.


> +{
> +	struct perf_cpu_context *cpuctx = this_cpu_ptr(&perf_cpu_context);
> +
> +	lockdep_assert_irqs_disabled();
> +
> +	guard(perf_ctx_lock)(cpuctx, cpuctx->task_ctx);
> +
> +	if (WARN_ON_ONCE(__this_cpu_read(guest_ctx_loaded)))
> +		return;
> +
> +	perf_ctx_disable(&cpuctx->ctx, EVENT_GUEST);
> +	ctx_sched_out(&cpuctx->ctx, NULL, EVENT_GUEST);
> +	if (cpuctx->task_ctx) {
> +		perf_ctx_disable(cpuctx->task_ctx, EVENT_GUEST);
> +		task_ctx_sched_out(cpuctx->task_ctx, NULL, EVENT_GUEST);
> +	}
> +
> +	perf_ctx_enable(&cpuctx->ctx, EVENT_GUEST);
> +	if (cpuctx->task_ctx)
> +		perf_ctx_enable(cpuctx->task_ctx, EVENT_GUEST);
> +
> +	__this_cpu_write(guest_ctx_loaded, true);
> +}
> +EXPORT_SYMBOL_GPL(perf_load_guest_context);
> +
> +void perf_put_guest_context(void)
> +{
> +	struct perf_cpu_context *cpuctx = this_cpu_ptr(&perf_cpu_context);
> +
> +	lockdep_assert_irqs_disabled();
> +
> +	guard(perf_ctx_lock)(cpuctx, cpuctx->task_ctx);
> +
> +	if (WARN_ON_ONCE(!__this_cpu_read(guest_ctx_loaded)))
> +		return;
> +
> +	perf_ctx_disable(&cpuctx->ctx, EVENT_GUEST);
> +	if (cpuctx->task_ctx)
> +		perf_ctx_disable(cpuctx->task_ctx, EVENT_GUEST);
> +
> +	perf_event_sched_in(cpuctx, cpuctx->task_ctx, NULL, EVENT_GUEST);
> +
> +	if (cpuctx->task_ctx)
> +		perf_ctx_enable(cpuctx->task_ctx, EVENT_GUEST);
> +	perf_ctx_enable(&cpuctx->ctx, EVENT_GUEST);
> +
> +	__this_cpu_write(guest_ctx_loaded, false);
> +}
> +EXPORT_SYMBOL_GPL(perf_put_guest_context);
>  #else
>  static int mediated_pmu_account_event(struct perf_event *event) { return 0; }
>  static void mediated_pmu_unaccount_event(struct perf_event *event) {}

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
