Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 357B1C282EC
	for <kvm-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 14:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l9b8JiZZFeb9qr4/yqotUdjNvsGDm7lJTVyMHUTqHqo=; b=AYfo/7+pSIUZTs
	JSu7CFp5f7NsLB3o8vV+4z0Bv3f7up+5TpQrztJxP8MqtK5DvOyxk9XT5gDj6Q7XOYszI7MYL62Rj
	NUzjC6I+PyXB4PcDy4SclzxGpdGK0Ssufs9n+Fps5mWGAp66tnix7MPQfSFrnOZ3kT8e3U6Hn/HV/
	p1KqJc34hTY7mM2gdUk4SIyrF3+/yXDYslNW7jg3KCeu68FAUDHLHl6Z+BsvM//PwLtfDOzf2yfTZ
	LZ+ITndYSXqNVix9bXX9KjqH+GOlBdjINwap6Z3ATVNTJpZxCBtpYp/eSBj2UzHVuxjFVjTWVLgE5
	Pv+nOsuN4COTh4mo1NIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt5kz-0000000EMtD-2yiF;
	Fri, 14 Mar 2025 14:11:25 +0000
Received: from out-185.mta0.migadu.com ([2001:41d0:1004:224b::b9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt5kx-0000000EMsO-2HnZ
	for kvm-riscv@lists.infradead.org;
	Fri, 14 Mar 2025 14:11:25 +0000
Date: Fri, 14 Mar 2025 15:11:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1741961477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iE/wJzW/iMea/0NTGsZB5pMBUzUt6UFrylXVlwTLhN4=;
	b=A2OhWF5J+h372lLcm8Kiy+kwtYrhFwPi7CL0wsgT+V2w3D8A+iPvEGcHmpQcD3e4oTwQYu
	bEsnOmAp3CPC8M8G4wazS6PF1q2dxDx56m9Yijdo2qfo2HW+UMndj+shsymEM11CAPw1hz
	lkPlvDg4l+AFMMt4jv5mcteEJTmOlVE=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	Andrew Jones <ajones@ventanamicro.com>, Anup Patel <apatel@ventanamicro.com>, 
	Atish Patra <atishp@rivosinc.com>
Subject: Re: [kvm-unit-tests PATCH v9 6/6] riscv: sbi: Add SSE extension tests
Message-ID: <20250314-0940c2c0dcd92b285f43e4ca@orel>
References: <20250314111030.3728671-1-cleger@rivosinc.com>
 <20250314111030.3728671-7-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250314111030.3728671-7-cleger@rivosinc.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_071124_052563_5CAB83CD 
X-CRM114-Status: GOOD (  11.00  )
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

On Fri, Mar 14, 2025 at 12:10:29PM +0100, Cl=E9ment L=E9ger wrote:
...
> +static void sse_test_inject_local(uint32_t event_id)
> +{
> +	int cpu;
> +	uint64_t timeout;
> +	struct sbiret ret;
> +	struct sse_local_per_cpu *cpu_args, *cpu_arg;
> +	struct sse_foreign_cpu_test_arg *handler_arg;
> +
> +	cpu_args =3D calloc(NR_CPUS, sizeof(struct sbi_sse_handler_arg));
> +
> +	report_prefix_push("local_dispatch");
> +	for_each_online_cpu(cpu) {
> +		cpu_arg =3D &cpu_args[cpu];
> +		cpu_arg->handler_arg.event_id =3D event_id;
> +		cpu_arg->args.stack =3D sse_alloc_stack();
> +		cpu_arg->args.handler =3D sse_foreign_cpu_handler;
> +		cpu_arg->args.handler_data =3D (void *)&cpu_arg->handler_arg;
> +		cpu_arg->state =3D SBI_SSE_STATE_UNUSED;
> +	}
> +
> +	on_cpus(sse_register_enable_local, cpu_args);
> +	for_each_online_cpu(cpu) {
> +		cpu_arg =3D &cpu_args[cpu];
> +		ret =3D cpu_arg->ret;
> +		if (ret.error) {
> +			report_fail("CPU failed to register/enable event: %ld", ret.error);
> +			goto cleanup;
> +		}
> +
> +		handler_arg =3D &cpu_arg->handler_arg;
> +		WRITE_ONCE(handler_arg->expected_cpu, cpu);
> +		/* For handler_arg content to be visible for other CPUs */
> +		smp_wmb();
> +		ret =3D sbi_sse_inject(event_id, cpus[cpu].hartid);
> +		if (ret.error) {
> +			report_fail("CPU failed to inject event: %ld", ret.error);
> +			goto cleanup;
> +		}
> +	}
> +
> +	for_each_online_cpu(cpu) {
> +		handler_arg =3D &cpu_args[cpu].handler_arg;
> +		smp_rmb();
> +
> +		timeout =3D sse_event_get_complete_timeout();
> +		while (!READ_ONCE(handler_arg->done) || timer_get_cycles() < timeout) {

I pointed this out in the last review, the || should be a &&. We don't
want to keep waiting until we reach the timeout if we get the done signal
earlier.

> +			/* For handler_arg update to be visible */
> +			smp_rmb();
> +			cpu_relax();
> +		}
> +		report(READ_ONCE(handler_arg->done), "Event handled");
> +		WRITE_ONCE(handler_arg->done, false);
> +	}
> +
> +cleanup:
> +	on_cpus(sbi_sse_disable_unregister_local, cpu_args);
> +	for_each_online_cpu(cpu) {
> +		cpu_arg =3D &cpu_args[cpu];
> +		ret =3D READ_ONCE(cpu_arg->ret);
> +		if (ret.error)
> +			report_fail("CPU failed to disable/unregister event: %ld", ret.error);
> +	}
> +
> +	for_each_online_cpu(cpu) {
> +		cpu_arg =3D &cpu_args[cpu];
> +		sse_free_stack(cpu_arg->args.stack);
> +	}
> +
> +	report_prefix_pop();
> +}
> +
> +static void sse_test_inject_global_cpu(uint32_t event_id, unsigned int c=
pu,
> +				       struct sse_foreign_cpu_test_arg *test_arg)
> +{
> +	unsigned long value;
> +	struct sbiret ret;
> +	uint64_t timeout;
> +	enum sbi_sse_state state;
> +
> +	WRITE_ONCE(test_arg->expected_cpu, cpu);
> +	/* For test_arg content to be visible for other CPUs */
> +	smp_wmb();
> +	value =3D cpu;
> +	ret =3D sbi_sse_write_attrs(event_id, SBI_SSE_ATTR_PREFERRED_HART, 1, &=
value);
> +	if (!sbiret_report_error(&ret, SBI_SUCCESS, "Set preferred hart"))
> +		return;
> +
> +	ret =3D sbi_sse_enable(event_id);
> +	if (!sbiret_report_error(&ret, SBI_SUCCESS, "Enable event"))
> +		return;
> +
> +	ret =3D sbi_sse_inject(event_id, cpu);
> +	if (!sbiret_report_error(&ret, SBI_SUCCESS, "Inject event"))
> +		goto disable;
> +
> +	smp_rmb();
> +	timeout =3D sse_event_get_complete_timeout();
> +	while (!READ_ONCE(test_arg->done) || timer_get_cycles() < timeout) {

same comment

> +		/* For shared test_arg structure */
> +		smp_rmb();
> +		cpu_relax();
> +	}
> +
> +	report(READ_ONCE(test_arg->done), "event handler called");
> +	WRITE_ONCE(test_arg->done, false);
> +
> +	timeout =3D sse_event_get_complete_timeout();
> +	/* Wait for event to be back in ENABLED state */
> +	do {
> +		ret =3D sse_event_get_state(event_id, &state);
> +		if (ret.error)
> +			goto disable;
> +		cpu_relax();
> +	} while (state !=3D SBI_SSE_STATE_ENABLED || timer_get_cycles() < timeo=
ut);

same comment

Otherwise,

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>

Thanks,
drew

-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
