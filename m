Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A585EE77188
	for <kvm-riscv@archiver.kernel.org>; Tue, 14 Jan 2025 11:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aGp1Qu3U+9CtpwxJDP0Gx7rHnFZ7m7lqafEry1gg2cA=; b=FpSiRQo3q3PHte
	lFwZ++XELLYmFINEz6Dro/VehSs83Pl9v59BP3d0Jd4F0YIGLunnvMs0CBs4dTtzGk2ovY2eXvPHd
	7ml9o70dbydsyep6ZfGpJ7H6kFk7QdLLdTypa+hM3+QqiIbZ4JPFKNAy7yIhFcG4cWB4VcgNZCExt
	NsKzz5zWIKiOgjDhuGr3Ur5vrsdMuVSCe7KgXNHB8i+roqwLrlieiytb13vZOKZpYAUC9wC8xJt8D
	CM7a782ncMIII91pD+LzAehaFriy5LEwBGzJUlGtmZm1mh2oT3UHWIHttdsP40Hu6rCUniPIrK4VY
	qEbIjg5UsgnF388SUWkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXfaK-00000008KSj-1FiL;
	Tue, 14 Jan 2025 11:59:52 +0000
Received: from out-177.mta1.migadu.com ([95.215.58.177])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXfZe-00000008KI4-2it3
	for kvm-riscv@lists.infradead.org;
	Tue, 14 Jan 2025 11:59:12 +0000
Date: Tue, 14 Jan 2025 12:59:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1736855948;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ox55oql2rRXAzJeVGKoYQQU+DDSlyXeFZoboOP1k/Fk=;
	b=iVt8KeJuwn6hmqnXKMsPBzzL6YxO9JEC8MdUr1CYxmBdR738Bp++KWfxBe1GV8ABguZmgP
	EJgFGqDEHbiDYrT3Dwexl9IB3siS43GJbwcB+u55eoFpfMATvU8SdeNm7Z5mKdUP3aUhdC
	UqvqasdgTjtC9l6ZhqeT5VnZm4UpHw4=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	Andrew Jones <ajones@ventanamicro.com>, Anup Patel <apatel@ventanamicro.com>, 
	Atish Patra <atishp@rivosinc.com>
Subject: Re: [kvm-unit-tests PATCH v4 5/5] riscv: sbi: Add SSE extension tests
Message-ID: <20250114-bfcab3a5629c66ef1215060a@orel>
References: <20241125162200.1630845-1-cleger@rivosinc.com>
 <20241125162200.1630845-6-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241125162200.1630845-6-cleger@rivosinc.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_035911_114071_E01AC316 
X-CRM114-Status: GOOD (  28.60  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org


Continuing review...

On Mon, Nov 25, 2024 at 05:21:54PM +0100, Cl=E9ment L=E9ger wrote:
...
> +static void sse_test_inject_global(unsigned long event_id)
> +{
> +	unsigned long ret;
> +	unsigned int cpu;
> +	struct sse_handler_arg args;
> +	volatile struct sse_foreign_cpu_test_arg test_arg =3D {.event_id =3D ev=
ent_id};
> +	enum sbi_sse_state state;
> +
> +	args.handler =3D sse_foreign_cpu_handler;
> +	args.handler_data =3D (void *)&test_arg;
> +	args.stack =3D sse_alloc_stack();
> +
> +	report_prefix_push("global_dispatch");
> +
> +	ret =3D sse_event_register(event_id, &args);
> +	if (ret)

print/report something here?

> +		goto done;
> +
> +	for_each_online_cpu(cpu) {
> +		test_arg.expected_cpu =3D cpu;
> +		/* For test_arg content to be visible for other CPUs */
> +		smp_wmb();
> +		ret =3D sse_event_set_attr(event_id, SBI_SSE_ATTR_PREFERRED_HART, cpu);
> +		if (ret) {
> +			report_fail("Failed to set preferred hart");
> +			goto done;
> +		}
> +
> +		ret =3D sse_event_enable(event_id);
> +		if (ret) {
> +			report_fail("Failed to enable SSE event");
> +			goto done;
> +		}
> +
> +		ret =3D sse_event_inject(event_id, cpu);
> +		if (ret) {
> +			report_fail("Failed to inject event");
> +			goto done;
> +		}
> +
> +		while (!test_arg.done) {
> +			/* For shared test_arg structure */
> +			smp_rmb();
> +		}
> +
> +		test_arg.done =3D false;
> +
> +		/* Wait for event to be in ENABLED state */
> +		do {
> +			ret =3D sse_get_state(event_id, &state);
> +			if (ret) {
> +				report_fail("Failed to get event state");
> +				goto done;
> +			}
> +		} while (state !=3D SBI_SSE_STATE_ENABLED);
> +
> +		ret =3D sse_event_disable(event_id);
> +		if (ret) {
> +			report_fail("Failed to disable SSE event");
> +			goto done;
> +		}
> +
> +		report_pass("Global event on CPU %d", cpu);
> +	}

Breaking this into two parts

 for_each_online_cpu() {
    ... inject event ...
 }
 ... wait a bit ...
 for_each_online_cpu() {
    ... check results ...
 }

would allow testing that the SBI implementation can handle
simultaneous requests.

> +
> +done:
> +	ret =3D sse_event_unregister(event_id);
> +	if (ret)
> +		report_fail("Failed to unregister event");

If we came here from the 'goto done' for sse_event_register(), then I'd
expect unregister to fail since we failed to register.

> +
> +	sse_free_stack(args.stack);
> +	report_prefix_pop();
> +}
> +
> +struct priority_test_arg {
> +	unsigned long evt;
> +	bool called;
> +	u32 prio;
> +	struct priority_test_arg *next_evt_arg;
> +	void (*check_func)(struct priority_test_arg *arg);
> +};
> +
> +static void sse_hi_priority_test_handler(void *arg, struct pt_regs *regs,
> +					 unsigned int hartid)
> +{
> +	struct priority_test_arg *targ =3D arg;
> +	struct priority_test_arg *next =3D targ->next_evt_arg;
> +
> +	targ->called =3D 1;

nit: =3D true

> +	if (next) {
> +		sse_event_inject(next->evt, current_thread_info()->hartid);
> +		if (sse_event_pending(next->evt))
> +			report_fail("Higher priority event is pending");
> +		if (!next->called)
> +			report_fail("Higher priority event was not handled");

Should change these if-report-fails to report()'s

> +	}
> +}
> +
> +static void sse_low_priority_test_handler(void *arg, struct pt_regs *reg=
s,
> +					  unsigned int hartid)
> +{
> +	struct priority_test_arg *targ =3D arg;
> +	struct priority_test_arg *next =3D targ->next_evt_arg;
> +
> +	targ->called =3D 1;
  =

nit: =3D true

> +
> +	if (next) {
> +		sse_event_inject(next->evt, current_thread_info()->hartid);
> +
> +		if (!sse_event_pending(next->evt))
> +			report_fail("Lower priority event is pending");
> +
> +		if (next->called)
> +			report_fail("Lower priority event %s was handle before %s",
> +			      sse_evt_name(next->evt), sse_evt_name(targ->evt));

Should change these if-report-fails to report()'s

> +	}
> +}
> +
> +static void sse_test_injection_priority_arg(struct priority_test_arg *in=
_args,
> +					    unsigned int in_args_size,
> +					    sse_handler_fn handler,
> +					    const char *test_name)
> +{
> +	unsigned int i;
> +	int ret;
> +	unsigned long event_id;
> +	struct priority_test_arg *arg;
> +	unsigned int args_size =3D 0;
> +	struct sse_handler_arg event_args[in_args_size];
> +	struct priority_test_arg *args[in_args_size];
> +	void *stack;
> +	struct sse_handler_arg *event_arg;
> +
> +	report_prefix_push(test_name);
> +
> +	for (i =3D 0; i < in_args_size; i++) {
> +		arg =3D &in_args[i];
> +		event_id =3D arg->evt;
> +		if (!sse_evt_can_inject(event_id))
> +			continue;
> +
> +		args[args_size] =3D arg;
> +		args_size++;
> +	}
> +
> +	if (!args_size) {
> +		report_skip("No event injectable");
> +		report_prefix_pop();
> +		goto skip;
> +	}
> +
> +	for (i =3D 0; i < args_size; i++) {
> +		arg =3D args[i];
> +		event_id =3D arg->evt;
> +		stack =3D sse_alloc_stack();
> +
> +		event_arg =3D &event_args[i];
> +		event_arg->handler =3D handler;
> +		event_arg->handler_data =3D (void *)arg;
> +		event_arg->stack =3D stack;
> +
> +		if (i < (args_size - 1))
> +			arg->next_evt_arg =3D args[i + 1];
> +		else
> +			arg->next_evt_arg =3D NULL;
> +
> +		/* Be sure global events are targeting the current hart */
> +		sse_global_event_set_current_hart(event_id);
> +
> +		sse_event_register(event_id, event_arg);
> +		sse_event_set_attr(event_id, SBI_SSE_ATTR_PRIORITY, arg->prio);
> +		sse_event_enable(event_id);
> +	}
> +
> +	/* Inject first event */
> +	ret =3D sse_event_inject(args[0]->evt, current_thread_info()->hartid);
> +	report(ret =3D=3D SBI_SUCCESS, "SSE injection no error");
> +
> +	for (i =3D 0; i < args_size; i++) {
> +		arg =3D args[i];
> +		event_id =3D arg->evt;
> +
> +		if (!arg->called)
> +			report_fail("Event %s handler called", sse_evt_name(arg->evt));

report()

> +
> +		sse_event_disable(event_id);
> +		sse_event_unregister(event_id);
> +
> +		event_arg =3D &event_args[i];
> +		sse_free_stack(event_arg->stack);
> +	}
> +
> +skip:
> +	report_prefix_pop();
> +}
> +
> +static struct priority_test_arg hi_prio_args[] =3D {
> +	{.evt =3D SBI_SSE_EVENT_GLOBAL_SOFTWARE},
> +	{.evt =3D SBI_SSE_EVENT_LOCAL_SOFTWARE},
> +	{.evt =3D SBI_SSE_EVENT_LOCAL_PMU},
> +	{.evt =3D SBI_SSE_EVENT_GLOBAL_RAS},
> +	{.evt =3D SBI_SSE_EVENT_LOCAL_RAS},
> +};
> +
> +static struct priority_test_arg low_prio_args[] =3D {
> +	{.evt =3D SBI_SSE_EVENT_LOCAL_RAS},
> +	{.evt =3D SBI_SSE_EVENT_GLOBAL_RAS},
> +	{.evt =3D SBI_SSE_EVENT_LOCAL_PMU},
> +	{.evt =3D SBI_SSE_EVENT_LOCAL_SOFTWARE},
> +	{.evt =3D SBI_SSE_EVENT_GLOBAL_SOFTWARE},
> +};
> +
> +static struct priority_test_arg prio_args[] =3D {
> +	{.evt =3D SBI_SSE_EVENT_GLOBAL_SOFTWARE, .prio =3D 5},
> +	{.evt =3D SBI_SSE_EVENT_LOCAL_SOFTWARE, .prio =3D 10},
> +	{.evt =3D SBI_SSE_EVENT_LOCAL_PMU, .prio =3D 15},
> +	{.evt =3D SBI_SSE_EVENT_GLOBAL_RAS, .prio =3D 20},
> +	{.evt =3D SBI_SSE_EVENT_LOCAL_RAS, .prio =3D 25},
> +};
> +
> +static struct priority_test_arg same_prio_args[] =3D {
> +	{.evt =3D SBI_SSE_EVENT_LOCAL_PMU, .prio =3D 0},
> +	{.evt =3D SBI_SSE_EVENT_LOCAL_RAS, .prio =3D 10},
> +	{.evt =3D SBI_SSE_EVENT_LOCAL_SOFTWARE, .prio =3D 10},
> +	{.evt =3D SBI_SSE_EVENT_GLOBAL_SOFTWARE, .prio =3D 10},
> +	{.evt =3D SBI_SSE_EVENT_GLOBAL_RAS, .prio =3D 20},
> +};
> +
> +static void sse_test_injection_priority(void)
> +{
> +	report_prefix_push("prio");
> +
> +	sse_test_injection_priority_arg(hi_prio_args, ARRAY_SIZE(hi_prio_args),
> +					sse_hi_priority_test_handler, "high");
> +
> +	sse_test_injection_priority_arg(low_prio_args, ARRAY_SIZE(low_prio_args=
),
> +					sse_low_priority_test_handler, "low");
> +
> +	sse_test_injection_priority_arg(prio_args, ARRAY_SIZE(prio_args),
> +					sse_low_priority_test_handler, "changed");
> +
> +	sse_test_injection_priority_arg(same_prio_args, ARRAY_SIZE(same_prio_ar=
gs),
> +					sse_low_priority_test_handler, "same_prio_args");
> +
> +	report_prefix_pop();
> +}
> +
> +static bool sse_can_inject(unsigned long event_id)
> +{
> +	int ret;
> +	unsigned long status;
> +
> +	ret =3D sse_event_get_attr(event_id, SBI_SSE_ATTR_STATUS, &status);
> +	report(ret =3D=3D 0, "SSE get attr status no error");

I'm not sure we need this report()

> +	if (ret)
> +		return 0;

nit: return false

> +
> +	return !!(status & BIT(SBI_SSE_ATTR_STATUS_INJECT_OFFSET));
> +}
> +
> +static void boot_secondary(void *data)
> +{
> +	sse_hart_unmask();
> +}
> +
> +static void sse_check_mask(void)
> +{
> +	int ret;
> +
> +	/* Upon boot, event are masked, check that */
> +	ret =3D sse_hart_mask();
> +	report(ret =3D=3D SBI_ERR_ALREADY_STARTED, "SSE hart mask at boot time =
ok");

The spec says that trying to mask twice should return
SBI_ERR_ALREADY_STOPPED. If this test is passing then we probably have it
backwards in opensbi too.

> +
> +	ret =3D sse_hart_unmask();
> +	report(ret =3D=3D SBI_SUCCESS, "SSE hart no error ok");
> +	ret =3D sse_hart_unmask();
> +	report(ret =3D=3D SBI_ERR_ALREADY_STOPPED, "SSE hart unmask twice error=
 ok");

Should be SBI_ERR_ALREADY_STARTED

> +
> +	ret =3D sse_hart_mask();
> +	report(ret =3D=3D SBI_SUCCESS, "SSE hart mask no error");
> +	ret =3D sse_hart_mask();
> +	report(ret =3D=3D SBI_ERR_ALREADY_STARTED, "SSE hart mask twice ok");

SBI_ERR_ALREADY_STOPPED

> +}
> +
> +void check_sse(void)
> +{
> +	unsigned long i, event;
> +
> +	report_prefix_push("sse");
> +	sse_check_mask();

I guess the mask check should come after the sbi_probe()

> +
> +	/*
> +	 * Dummy wakeup of all processors since some of them will be targeted
> +	 * by global events without going through the wakeup call as well as
> +	 * unmasking all =

> +	 */
> +	on_cpus(boot_secondary, NULL);
> +
> +	if (!sbi_probe(SBI_EXT_SSE)) {
> +		report_skip("SSE extension not available");
> +		report_prefix_pop();
> +		return;
> +	}
> +
> +	for (i =3D 0; i < ARRAY_SIZE(sse_event_infos); i++) {
> +		event =3D sse_event_infos[i].event_id;
> +		report_prefix_push(sse_event_infos[i].name);
> +		if (!sse_can_inject(event)) {
> +			report_skip("Event does not support injection");

Let's output the event ID too.

> +			report_prefix_pop();
> +			continue;
> +		} else {
> +			sse_event_infos[i].can_inject =3D true;
> +		}
> +		sse_test_attr(event);
> +		sse_test_register_error(event);
> +		sse_test_inject_simple(event);
> +		if (sse_event_is_global(event))
> +			sse_test_inject_global(event);
> +		else
> +			sse_test_inject_local(event);
> +
> +		report_prefix_pop();
> +	}
> +
> +	sse_test_injection_priority();
> +
> +	report_prefix_pop();
> +}
> diff --git a/riscv/sbi.c b/riscv/sbi.c
> index 6f4ddaf1..33d5e40d 100644
> --- a/riscv/sbi.c
> +++ b/riscv/sbi.c
> @@ -32,6 +32,8 @@
>  =

>  #define	HIGH_ADDR_BOUNDARY	((phys_addr_t)1 << 32)
>  =

> +void check_sse(void);
> +
>  static long __labs(long a)
>  {
>  	return __builtin_labs(a);
> @@ -1451,6 +1453,7 @@ int main(int argc, char **argv)
>  	check_hsm();
>  	check_dbcn();
>  	check_susp();
> +	check_sse();
>  =

>  	return report_summary();
>  }
> -- =

> 2.45.2
> =


Thanks,
drew

-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
