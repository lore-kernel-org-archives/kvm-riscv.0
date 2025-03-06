Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8483FC282D1
	for <kvm-riscv@archiver.kernel.org>; Thu,  6 Mar 2025 15:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qt5XCNG7kl6mStFpcugr2+WVMzkmnjSdlqZ+xfrilyY=; b=fsWk5gF+XtXcfH
	3jQNbA24TSoxHqRTPMRC6HZgo3vfnAIZZJStqvXQPtVvtcKyUP0t5AuR2EDoRbricQEw00HtKqtwS
	pmxOrFko/p4lrYxUsClqdOYGCHzVoQpvXbuTwjTAt/7gt7qMvKbIoTHh/83RMWoMAp7sTz2rA34OD
	7Y2Om89rZEySbxHcpG/uD3vVqewqzOyVlF1Mntb7gWcujCwK7mMsgRQmXI55nAhUoRN1Iucer1fis
	e/fXZVh/Ez3xdGfa5hYfHRMVoie2icyekG+o4XhjjNfjV461vmCITn7i8/4qMuu1k7+7I4MbWSrVH
	vc5VQCl7Boprw85QaWMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqCwz-0000000BI2c-13ee;
	Thu, 06 Mar 2025 15:15:53 +0000
Received: from out-183.mta0.migadu.com ([2001:41d0:1004:224b::b7])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqCwK-0000000BHxq-2tAy
	for kvm-riscv@lists.infradead.org;
	Thu, 06 Mar 2025 15:15:14 +0000
Date: Thu, 6 Mar 2025 16:15:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1741274108;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lVH0GxmWmcu/UgBN4gM6j99Mf09UV1MGgTDFHSQe7xs=;
	b=awgjPrqGX7DrTrDLvctmgTXfKtUMvPuFfeK/N5E6bNTd+ACdSlmnDf0ZqdV5yXyGiiMh36
	il9O9NP3lcdrQlffuKAnVnoWdPX8k7jgKkj8kd6/wTGQhL47Y8BGpq6V/jSjIx5NJoeCjL
	sAHkemNZe0+6p2zt+YTHY37ioxJCJo0=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	Andrew Jones <ajones@ventanamicro.com>, Anup Patel <apatel@ventanamicro.com>, 
	Atish Patra <atishp@rivosinc.com>
Subject: Re: [kvm-unit-tests PATCH v7 6/6] riscv: sbi: Add SSE extension tests
Message-ID: <20250306-5f8b0b45873648fa93beccc7@orel>
References: <20250214114423.1071621-1-cleger@rivosinc.com>
 <20250214114423.1071621-7-cleger@rivosinc.com>
 <20250227-93a15f012d9bda941ef44e38@orel>
 <d37dc38b-ba6d-48cd-8d23-9e2ce9c6581e@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d37dc38b-ba6d-48cd-8d23-9e2ce9c6581e@rivosinc.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_071512_947036_3A8C29AD 
X-CRM114-Status: GOOD (  22.75  )
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

On Thu, Mar 06, 2025 at 03:32:39PM +0100, Cl=E9ment L=E9ger wrote:
> =

> =

> On 28/02/2025 18:51, Andrew Jones wrote:
...
> >> +	attr =3D SBI_SSE_ATTR_INTERRUPTED_FLAGS;
> >> +	ret =3D sbi_sse_read_attrs(event_id, attr, 1, &prev_value);
> >> +	sbiret_report_error(&ret, SBI_SUCCESS, "Save interrupted flags no er=
ror");
> >> +
> >> +	for (i =3D 0; i < ARRAY_SIZE(interrupted_flags); i++) {
> >> +		flags =3D interrupted_flags[i];
> >> +		ret =3D sbi_sse_write_attrs(event_id, attr, 1, &flags);
> >> +		sbiret_report_error(&ret, SBI_SUCCESS,
> >> +				    "Set interrupted flags bit 0x%lx value no error", flags);
> >> +		ret =3D sbi_sse_read_attrs(event_id, attr, 1, &value);
> >> +		sbiret_report_error(&ret, SBI_SUCCESS, "Get interrupted flags after=
 set no error");
> >> +		report(value =3D=3D flags, "interrupted flags modified value ok: 0x=
%lx", value);
> > =

> > Do we also need to test with more than one flag set at a time?
> =

> That is already done a few lines above (see /* Restore full saved state *=
/).

OK

> =

> > =

> >> +	}
> >> +
> >> +	/* Write invalid bit in flag register */
> >> +	flags =3D SBI_SSE_ATTR_INTERRUPTED_FLAGS_SSTATUS_SDT << 1;
> >> +	ret =3D sbi_sse_write_attrs(event_id, attr, 1, &flags);
> >> +	sbiret_report_error(&ret, SBI_ERR_INVALID_PARAM, "Set invalid flags =
bit 0x%lx value error",
> >> +			    flags);
> >> +#if __riscv_xlen > 32
> >> +	flags =3D BIT(32);
> >> +	ret =3D sbi_sse_write_attrs(event_id, attr, 1, &flags);
> >> +	sbiret_report_error(&ret, SBI_ERR_INVALID_PARAM, "Set invalid flags =
bit 0x%lx value error",
> > =

> > This should have a different report string than the test above.
> =

> The bit value format does differentiate the printf though.

OK

...
> >> +	ret =3D sbi_sse_unregister(event_id);
> >> +	if (!sbiret_report_error(&ret, SBI_SUCCESS, "SSE unregister no error=
"))
> >> +		goto done;
> >> +
> >> +	sse_check_state(event_id, SBI_SSE_STATE_UNUSED);
> >> +
> >> +done:
> > =

> > Is it ok to leave this function with an event registered/enabled? If no=
t,
> > then some of the goto's above should goto other labels which disable and
> > unregister.
> =

> No it's not but it's massive pain to keep everything coherent when it
> fails ;)
>

asserts/aborts are fine if we can't recover easily, but then we should
move the SSE tests out of the main SBI test into its own test so we
don't short-circuit all other tests that may follow it.

...
> >> +		/* Be sure global events are targeting the current hart */
> >> +		sse_global_event_set_current_hart(event_id);
> >> +
> >> +		sbi_sse_register(event_id, event_arg);
> >> +		value =3D arg->prio;
> >> +		sbi_sse_write_attrs(event_id, SBI_SSE_ATTR_PRIORITY, 1, &value);
> >> +		sbi_sse_enable(event_id);
> > =

> > No return code checks for these SSE calls? If we're 99% sure they should
> > succeed, then I'd still check them with asserts.
> =

> I was a bit lazy here. Since the goal is *not* to check the event state
> themselve but rather the ordering, I didn't bother checking them. As
> said before, habndling error and event state properly in case of error
> seemed like a churn to me *just* for testing. I'll try something better
> as well though.
> =


We always want at least asserts() in order to catch the train when it
first goes off the rails, rather than after it smashed through a village
or two.

Thanks,
drew

-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
