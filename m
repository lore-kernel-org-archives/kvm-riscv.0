Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DECC7C282D0
	for <kvm-riscv@archiver.kernel.org>; Fri, 28 Feb 2025 17:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rw28xHVsNlFb/5rkPTzbv75dLDzdunXdiAo8/V5dfJc=; b=tTW45nbR3Q2ETn
	+5V4FnH+mVNADa9UMOEIgPuGJcg2ug7WSjdeyEYgyj7T1VImBnCGsKzaLfpCB9SbNdn35o0OhxWVa
	c29SzJrS7Qq9xLvASjPnBlukCVpuZCt5X0r6UVNnHCweAuz+8P844YOMCYOGRbwjtaaMtMTgdMomH
	/eA7g5xEW4OUPqzbMNQfHLX75ccty5IpG/ePALbWbu4aiIrRZZQHaaWL/4RPQAikN7DqBbWBjDlmd
	NfKakfuhb1p1A5efYHpzUh3+dCBXXxm3n5tPQGaaMhz2xOi1b86Ix9yJQ7bzjEIc3eg8TGIDTGIcZ
	jFSFudy5zmxLD8+a85oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to4YW-0000000C24x-1VN8;
	Fri, 28 Feb 2025 17:53:48 +0000
Received: from out-180.mta0.migadu.com ([2001:41d0:1004:224b::b4])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to4Wo-0000000C1eT-0xPh
	for kvm-riscv@lists.infradead.org;
	Fri, 28 Feb 2025 17:52:06 +0000
Date: Fri, 28 Feb 2025 18:51:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1740765117;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jk/uCHQhPeMjjv9WDpuaL7Z7zVTtLdClJmt1l/i9KeE=;
	b=tfAv1HDOfShkY/7ytE2DiVsKCogSV1No88e05EDgj7s7kTKjzYzG5wHmfF6aDFPdqWjvbo
	SeozWEE0Y6G1qyL5McIFfViGah4co1AZ4oWuIhkj8d2zG/NCzTbcV/xRissX3JhEkOPY7a
	2JSxVPizoMvzAWKrdTXO9SkeHfo1jvw=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	Andrew Jones <ajones@ventanamicro.com>, Anup Patel <apatel@ventanamicro.com>, 
	Atish Patra <atishp@rivosinc.com>
Subject: Re: [kvm-unit-tests PATCH v7 6/6] riscv: sbi: Add SSE extension tests
Message-ID: <20250227-93a15f012d9bda941ef44e38@orel>
References: <20250214114423.1071621-1-cleger@rivosinc.com>
 <20250214114423.1071621-7-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250214114423.1071621-7-cleger@rivosinc.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_095204_741396_A4D43BAD 
X-CRM114-Status: GOOD (  36.05  )
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


Global style note: For casts we prefer no space between the (type) and
the variable, i.e. (type)var

On Fri, Feb 14, 2025 at 12:44:19PM +0100, Cl=E9ment L=E9ger wrote:
> Add SBI SSE extension tests for the following features:
> - Test attributes errors (invalid values, RO, etc)
> - Registration errors
> - Simple events (register, enable, inject)
> - Events with different priorities
> - Global events dispatch on different harts
> - Local events on all harts
> - Hart mask/unmask events
> =

> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> ---
>  riscv/Makefile  |    1 +
>  riscv/sbi-sse.c | 1054 +++++++++++++++++++++++++++++++++++++++++++++++
>  riscv/sbi.c     |    2 +
>  3 files changed, 1057 insertions(+)
>  create mode 100644 riscv/sbi-sse.c
> =

> diff --git a/riscv/Makefile b/riscv/Makefile
> index ed590ede..ea62e05f 100644
> --- a/riscv/Makefile
> +++ b/riscv/Makefile
> @@ -18,6 +18,7 @@ tests +=3D $(TEST_DIR)/sieve.$(exe)
>  all: $(tests)
>  =

>  $(TEST_DIR)/sbi-deps =3D $(TEST_DIR)/sbi-asm.o $(TEST_DIR)/sbi-fwft.o
> +$(TEST_DIR)/sbi-deps +=3D $(TEST_DIR)/sbi-sse.o
>  =

>  # When built for EFI sieve needs extra memory, run with e.g. '-m 256' on=
 QEMU
>  $(TEST_DIR)/sieve.$(exe): AUXFLAGS =3D 0x1
> diff --git a/riscv/sbi-sse.c b/riscv/sbi-sse.c
> new file mode 100644
> index 00000000..27f47f73
> --- /dev/null
> +++ b/riscv/sbi-sse.c
> @@ -0,0 +1,1054 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * SBI SSE testsuite
> + *
> + * Copyright (C) 2025, Rivos Inc., Cl=E9ment L=E9ger <cleger@rivosinc.co=
m>
> + */
> +#include <alloc.h>
> +#include <alloc_page.h>
> +#include <bitops.h>
> +#include <cpumask.h>
> +#include <libcflat.h>
> +#include <on-cpus.h>
> +#include <stdlib.h>
> +
> +#include <asm/barrier.h>
> +#include <asm/io.h>
> +#include <asm/page.h>
> +#include <asm/processor.h>
> +#include <asm/sbi.h>
> +#include <asm/sbi-sse.h>
> +#include <asm/setup.h>
> +
> +#include "sbi-tests.h"
> +
> +#define SSE_STACK_SIZE	PAGE_SIZE
> +
> +void check_sse(void);

Since we now have an #ifndef __ASSEMBLY__ section in riscv/sbi-tests.h we
can just put this prototype there.

> +
> +struct sse_event_info {
> +	uint32_t event_id;
> +	const char *name;
> +	bool can_inject;
> +};
> +
> +static struct sse_event_info sse_event_infos[] =3D {
> +	{
> +		.event_id =3D SBI_SSE_EVENT_LOCAL_HIGH_PRIO_RAS,
> +		.name =3D "local_high_prio_ras",
> +	},
> +	{
> +		.event_id =3D SBI_SSE_EVENT_LOCAL_DOUBLE_TRAP,
> +		.name =3D "double_trap",
> +	},
> +	{
> +		.event_id =3D SBI_SSE_EVENT_GLOBAL_HIGH_PRIO_RAS,
> +		.name =3D "global_high_prio_ras",
> +	},
> +	{
> +		.event_id =3D SBI_SSE_EVENT_LOCAL_PMU_OVERFLOW,
> +		.name =3D "local_pmu_overflow",
> +	},
> +	{
> +		.event_id =3D SBI_SSE_EVENT_LOCAL_LOW_PRIO_RAS,
> +		.name =3D "local_low_prio_ras",
> +	},
> +	{
> +		.event_id =3D SBI_SSE_EVENT_GLOBAL_LOW_PRIO_RAS,
> +		.name =3D "global_low_prio_ras",
> +	},
> +	{
> +		.event_id =3D SBI_SSE_EVENT_LOCAL_SOFTWARE,
> +		.name =3D "local_software",
> +	},
> +	{
> +		.event_id =3D SBI_SSE_EVENT_GLOBAL_SOFTWARE,
> +		.name =3D "global_software",
> +	},
> +};
> +
> +static const char *const attr_names[] =3D {
> +	[SBI_SSE_ATTR_STATUS] =3D "status",
> +	[SBI_SSE_ATTR_PRIORITY] =3D "priority",
> +	[SBI_SSE_ATTR_CONFIG] =3D "config",
> +	[SBI_SSE_ATTR_PREFERRED_HART] =3D "preferred_hart",
> +	[SBI_SSE_ATTR_ENTRY_PC] =3D "entry_pc",
> +	[SBI_SSE_ATTR_ENTRY_ARG] =3D "entry_arg",
> +	[SBI_SSE_ATTR_INTERRUPTED_SEPC] =3D "interrupted_sepc",
> +	[SBI_SSE_ATTR_INTERRUPTED_FLAGS] =3D "interrupted_flags",
> +	[SBI_SSE_ATTR_INTERRUPTED_A6] =3D "interrupted_a6",
> +	[SBI_SSE_ATTR_INTERRUPTED_A7] =3D "interrupted_a7",
> +};
> +
> +static const unsigned long ro_attrs[] =3D {
> +	SBI_SSE_ATTR_STATUS,
> +	SBI_SSE_ATTR_ENTRY_PC,
> +	SBI_SSE_ATTR_ENTRY_ARG,
> +};
> +
> +static const unsigned long interrupted_attrs[] =3D {
> +	SBI_SSE_ATTR_INTERRUPTED_SEPC,
> +	SBI_SSE_ATTR_INTERRUPTED_FLAGS,
> +	SBI_SSE_ATTR_INTERRUPTED_A6,
> +	SBI_SSE_ATTR_INTERRUPTED_A7,
> +};
> +
> +static const unsigned long interrupted_flags[] =3D {
> +	SBI_SSE_ATTR_INTERRUPTED_FLAGS_SSTATUS_SPP,
> +	SBI_SSE_ATTR_INTERRUPTED_FLAGS_SSTATUS_SPIE,
> +	SBI_SSE_ATTR_INTERRUPTED_FLAGS_SSTATUS_SPELP,
> +	SBI_SSE_ATTR_INTERRUPTED_FLAGS_SSTATUS_SDT,
> +	SBI_SSE_ATTR_INTERRUPTED_FLAGS_HSTATUS_SPV,
> +	SBI_SSE_ATTR_INTERRUPTED_FLAGS_HSTATUS_SPVP,
> +};
> +
> +static struct sse_event_info *sse_event_get_info(uint32_t event_id)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(sse_event_infos); i++) {
> +		if (sse_event_infos[i].event_id =3D=3D event_id)
> +			return &sse_event_infos[i];
> +	}
> +
> +	assert_msg(false, "Invalid event id: %d", event_id);
> +}
> +
> +static const char *sse_event_name(uint32_t event_id)
> +{
> +	return sse_event_get_info(event_id)->name;
> +}
> +
> +static bool sse_event_can_inject(uint32_t event_id)
> +{
> +	return sse_event_get_info(event_id)->can_inject;
> +}
> +
> +static struct sbiret sse_event_get_state(uint32_t event_id, enum sbi_sse=
_state *state)
> +{
> +	struct sbiret ret;
> +	unsigned long status;
> +
> +	ret =3D sbi_sse_read_attrs(event_id, SBI_SSE_ATTR_STATUS, 1, &status);
> +	if (ret.error) {
> +		sbiret_report_error(&ret, 0, "Get SSE event status no error");
> +		return ret;
> +	}
> +
> +	*state =3D status & SBI_SSE_ATTR_STATUS_STATE_MASK;
> +
> +	return ret;
> +}
> +
> +static void sse_global_event_set_current_hart(uint32_t event_id)
> +{
> +	struct sbiret ret;
> +	unsigned long current_hart =3D current_thread_info()->hartid;
> +
> +	if (!sbi_sse_event_is_global(event_id))
> +		return;
> +
> +	ret =3D sbi_sse_write_attrs(event_id, SBI_SSE_ATTR_PREFERRED_HART, 1, &=
current_hart);
> +	if (ret.error)
> +		report_abort("set preferred hart failure, error %ld", ret.error);

Are we sure we want to abort? Or should we try to propagate an error from
here and just bail out of SSE tests?

> +}
> +
> +static bool sse_check_state(uint32_t event_id, unsigned long expected_st=
ate)
> +{
> +	struct sbiret ret;
> +	enum sbi_sse_state state;
> +
> +	ret =3D sse_event_get_state(event_id, &state);
> +	if (ret.error)
> +		return false;
> +	report(state =3D=3D expected_state, "SSE event status =3D=3D %ld", expe=
cted_state);
> +
> +	return state =3D=3D expected_state;

Can just write

  return report(state =3D=3D expected_state, "SSE event status =3D=3D %ld",=
 expected_state);

> +}
> +
> +static bool sse_event_pending(uint32_t event_id)
> +{
> +	struct sbiret ret;
> +	unsigned long status;
> +
> +	ret =3D sbi_sse_read_attrs(event_id, SBI_SSE_ATTR_STATUS, 1, &status);
> +	if (ret.error) {
> +		report_fail("Failed to get SSE event status, error %ld", ret.error);

sbiret_report_error()

> +		return false;
> +	}
> +
> +	return !!(status & BIT(SBI_SSE_ATTR_STATUS_PENDING_OFFSET));
> +}
> +
> +static void *sse_alloc_stack(void)
> +{
> +	/*
> +	 * We assume that SSE_STACK_SIZE always fit in one page. This page will
> +	 * always be decrement before storing anything on it in sse-entry.S.

decremented

> +	 */
> +	assert(SSE_STACK_SIZE <=3D PAGE_SIZE);
> +
> +	return (alloc_page() + SSE_STACK_SIZE);
> +}
> +
> +static void sse_free_stack(void *stack)
> +{
> +	free_page(stack - SSE_STACK_SIZE);
> +}
> +
> +static void sse_read_write_test(uint32_t event_id, unsigned long attr, u=
nsigned long attr_count,
> +				unsigned long *value, long expected_error, const char *str)
> +{
> +	struct sbiret ret;
> +
> +	ret =3D sbi_sse_read_attrs(event_id, attr, attr_count, value);
> +	sbiret_report_error(&ret, expected_error, "Read %s error", str);
> +
> +	ret =3D sbi_sse_write_attrs(event_id, attr, attr_count, value);
> +	sbiret_report_error(&ret, expected_error, "Write %s error", str);
> +}
> +
> +#define ALL_ATTRS_COUNT	(SBI_SSE_ATTR_INTERRUPTED_A7 + 1)
> +
> +static void sse_test_attrs(uint32_t event_id)
> +{
> +	unsigned long value =3D 0;
> +	struct sbiret ret;
> +	void *ptr;
> +	unsigned long values[ALL_ATTRS_COUNT];
> +	unsigned int i;
> +	const char *max_hart_str;
> +	const char *attr_name;
> +
> +	report_prefix_push("attrs");
> +
> +	for (i =3D 0; i < ARRAY_SIZE(ro_attrs); i++) {
> +		ret =3D sbi_sse_write_attrs(event_id, ro_attrs[i], 1, &value);
> +		sbiret_report_error(&ret, SBI_ERR_BAD_RANGE, "RO attribute %s not writ=
able",
> +				    attr_names[ro_attrs[i]]);
> +	}
> +
> +	ret =3D sbi_sse_read_attrs(event_id, SBI_SSE_ATTR_STATUS, ALL_ATTRS_COU=
NT, values);
> +	sbiret_report_error(&ret, SBI_SUCCESS, "Read multiple attributes no err=
or");
> +
> +	for (i =3D SBI_SSE_ATTR_STATUS; i <=3D SBI_SSE_ATTR_INTERRUPTED_A7; i++=
) {
> +		ret =3D sbi_sse_read_attrs(event_id, i, 1, &value);
> +		attr_name =3D attr_names[i];
> +
> +		sbiret_report_error(&ret, SBI_SUCCESS, "Read single attribute %s", att=
r_name);
> +		if (values[i] !=3D value)
> +			report_fail("Attribute 0x%x single value read (0x%lx) differs from th=
e one read with multiple attributes (0x%lx)",
> +				    i, value, values[i]);
> +		/*
> +		 * Preferred hart reset value is defined by SBI vendor and
> +		 * status injectable bit also depends on the SBI implementation

The spec says the STATUS attribute reset value is zero. In any case, if
certain bits can be tested then we should test them, so we can mask off
the injectable bit and still check for zero.

> +		 */
> +		if (i !=3D SBI_SSE_ATTR_STATUS && i !=3D SBI_SSE_ATTR_PREFERRED_HART)
> +			report(value =3D=3D 0, "Attribute %s reset value is 0", attr_name);
> +	}
> +
> +#if __riscv_xlen > 32
> +	value =3D BIT(32);
> +	ret =3D sbi_sse_write_attrs(event_id, SBI_SSE_ATTR_PRIORITY, 1, &value);
> +	sbiret_report_error(&ret, SBI_ERR_INVALID_PARAM, "Write invalid prio > =
0xFFFFFFFF error");
> +#endif
> +
> +	value =3D ~SBI_SSE_ATTR_CONFIG_ONESHOT;
> +	ret =3D sbi_sse_write_attrs(event_id, SBI_SSE_ATTR_CONFIG, 1, &value);
> +	sbiret_report_error(&ret, SBI_ERR_INVALID_PARAM, "Write invalid config =
value error");
> +
> +	if (sbi_sse_event_is_global(event_id)) {
> +		max_hart_str =3D getenv("MAX_HART_ID");

This should be named "INVALID_HARTID"

> +		if (!max_hart_str)
> +			value =3D 0xFFFFFFFFUL;
> +		else
> +			value =3D strtoul(max_hart_str, NULL, 0);
> +
> +		ret =3D sbi_sse_write_attrs(event_id, SBI_SSE_ATTR_PREFERRED_HART, 1, =
&value);
> +		sbiret_report_error(&ret, SBI_ERR_INVALID_PARAM, "Set invalid hart id =
error");

The spec doesn't say you can get invalid-param for a bad hartid.

> +	} else {
> +		/* Set Hart on local event -> RO */
> +		value =3D current_thread_info()->hartid;
> +		ret =3D sbi_sse_write_attrs(event_id, SBI_SSE_ATTR_PREFERRED_HART, 1, =
&value);
> +		sbiret_report_error(&ret, SBI_ERR_BAD_RANGE, "Set hart id on local eve=
nt error");

The spec doesn't say you can get bad-range for a valid hartid when set
locally.

> +	}
> +
> +	/* Set/get flags, sepc, a6, a7 */
> +	for (i =3D 0; i < ARRAY_SIZE(interrupted_attrs); i++) {
> +		attr_name =3D attr_names[interrupted_attrs[i]];
> +		ret =3D sbi_sse_read_attrs(event_id, interrupted_attrs[i], 1, &value);
> +		sbiret_report_error(&ret, SBI_SUCCESS, "Get interrupted %s no error", =
attr_name);
> +
> +		value =3D ARRAY_SIZE(interrupted_attrs) - i;

I don't understand how this creates an invalid value for all interrupted at=
trs?

> +		ret =3D sbi_sse_write_attrs(event_id, interrupted_attrs[i], 1, &value);
> +		sbiret_report_error(&ret, SBI_ERR_INVALID_STATE,

The spec doesn't state SBI_ERR_INVALID_STATE will ever be returned for
sbi_sse_write_attrs()

> +				    "Set attribute %s invalid state error", attr_name);
> +	}
> +
> +	sse_read_write_test(event_id, SBI_SSE_ATTR_STATUS, 0, &value, SBI_ERR_I=
NVALID_PARAM,
> +			    "attribute attr_count =3D=3D 0");
> +	sse_read_write_test(event_id, SBI_SSE_ATTR_INTERRUPTED_A7 + 1, 1, &valu=
e, SBI_ERR_BAD_RANGE,
> +			    "invalid attribute");
> +
> +#if __riscv_xlen > 32
> +	sse_read_write_test(event_id, BIT(32), 1, &value, SBI_ERR_INVALID_PARAM,
> +			    "attribute id > 32 bits");
> +	sse_read_write_test(event_id, SBI_SSE_ATTR_STATUS, BIT(32), &value, SBI=
_ERR_INVALID_PARAM,
> +			    "attribute count > 32 bits");

I think you plan to change these to expect them to behave like
base_attr_id=3D1 and attr_count=3D1.

> +#endif
> +
> +	/* Misaligned pointer address */
> +	ptr =3D (void *) &value;
> +	ptr +=3D 1;
> +	sse_read_write_test(event_id, SBI_SSE_ATTR_STATUS, 1, ptr, SBI_ERR_INVA=
LID_ADDRESS,
> +		"attribute with invalid address");
> +
> +	report_prefix_pop();
> +}
> +
> +static void sse_test_register_error(uint32_t event_id)
> +{
> +	struct sbiret ret;
> +
> +	report_prefix_push("register");
> +
> +	ret =3D sbi_sse_unregister(event_id);
> +	sbiret_report_error(&ret, SBI_ERR_INVALID_STATE, "SSE unregister non re=
gistered event");

non-registered

> +
> +	ret =3D sbi_sse_register_raw(event_id, 0x1, 0);
> +	sbiret_report_error(&ret, SBI_ERR_INVALID_PARAM, "SSE register misalign=
ed entry");
> +
> +	ret =3D sbi_sse_register_raw(event_id, virt_to_phys(sbi_sse_entry), 0);
> +	sbiret_report_error(&ret, SBI_SUCCESS, "SSE register ok");
> +	if (ret.error)
> +		goto done;
> +
> +	ret =3D sbi_sse_register_raw(event_id, virt_to_phys(sbi_sse_entry), 0);
> +	sbiret_report_error(&ret, SBI_ERR_INVALID_STATE, "SSE register twice fa=
ilure");

"SSE register used event"

> +
> +	ret =3D sbi_sse_unregister(event_id);
> +	sbiret_report_error(&ret, SBI_SUCCESS, "SSE unregister ok");
> +
> +done:
> +	report_prefix_pop();
> +}
> +
> +struct sse_simple_test_arg {
> +	bool done;
> +	unsigned long expected_a6;
> +	uint32_t event_id;
> +};
> +
> +static void sse_simple_handler(void *data, struct pt_regs *regs, unsigne=
d int hartid)
> +{
> +	struct sse_simple_test_arg *arg =3D data;
> +	int i;
> +	struct sbiret ret;
> +	const char *attr_name;
> +	uint32_t event_id =3D READ_ONCE(arg->event_id), attr;
> +	unsigned long value, prev_value, flags;
> +	unsigned long interrupted_state[ARRAY_SIZE(interrupted_attrs)];
> +	unsigned long modified_state[ARRAY_SIZE(interrupted_attrs)] =3D {4, 3, =
2, 1};
> +	unsigned long tmp_state[ARRAY_SIZE(interrupted_attrs)];
> +
> +	report((regs->status & SR_SPP) =3D=3D SR_SPP, "Interrupted S-mode");
> +	report(hartid =3D=3D current_thread_info()->hartid, "Hartid correctly p=
assed");
> +	sse_check_state(event_id, SBI_SSE_STATE_RUNNING);
> +	report(!sse_event_pending(event_id), "Event not pending");
> +
> +	/* Read full interrupted state */
> +	ret =3D sbi_sse_read_attrs(event_id, SBI_SSE_ATTR_INTERRUPTED_SEPC,
> +				 ARRAY_SIZE(interrupted_attrs), interrupted_state);
> +	sbiret_report_error(&ret, SBI_SUCCESS, "Save full interrupted state fro=
m SSE handler ok");
> +
> +	/* Write full modified state and read it */
> +	ret =3D sbi_sse_write_attrs(event_id, SBI_SSE_ATTR_INTERRUPTED_SEPC,
> +				  ARRAY_SIZE(modified_state), modified_state);
> +	sbiret_report_error(&ret, SBI_SUCCESS,
> +			    "Write full interrupted state from SSE handler ok");
> +
> +	ret =3D sbi_sse_read_attrs(event_id, SBI_SSE_ATTR_INTERRUPTED_SEPC,
> +				ARRAY_SIZE(tmp_state), tmp_state);
> +	sbiret_report_error(&ret, SBI_SUCCESS, "Read full modified state from S=
SE handler ok");
> +
> +	report(memcmp(tmp_state, modified_state, sizeof(modified_state)) =3D=3D=
 0,
> +		      "Full interrupted state successfully written");

"Full... should line up under the report(, not memcmp(

> +
> +	/* Restore full saved state */
> +	ret =3D sbi_sse_write_attrs(event_id, SBI_SSE_ATTR_INTERRUPTED_SEPC,
> +		ARRAY_SIZE(interrupted_attrs), interrupted_state);
> +	sbiret_report_error(&ret, SBI_SUCCESS,
> +			    "Full interrupted state restore from SSE handler ok");
> +
> +	/* We test SBI_SSE_ATTR_INTERRUPTED_FLAGS below with specific flag valu=
es */
> +	for (i =3D 0; i < ARRAY_SIZE(interrupted_attrs); i++) {
> +		attr =3D interrupted_attrs[i];
> +		if (attr =3D=3D SBI_SSE_ATTR_INTERRUPTED_FLAGS)
> +			continue;
> +
> +		attr_name =3D attr_names[attr];
> +
> +		ret =3D sbi_sse_read_attrs(event_id, attr, 1, &prev_value);
> +		sbiret_report_error(&ret, SBI_SUCCESS, "Get attr %s no error", attr_na=
me);
> +
> +		value =3D 0xDEADBEEF + i;
> +		ret =3D sbi_sse_write_attrs(event_id, attr, 1, &value);
> +		sbiret_report_error(&ret, SBI_SUCCESS, "Set attr %s no error", attr_na=
me);
> +
> +		ret =3D sbi_sse_read_attrs(event_id, attr, 1, &value);
> +		sbiret_report_error(&ret, SBI_SUCCESS, "Get attr %s no error", attr_na=
me);
> +		report(value =3D=3D 0xDEADBEEF + i, "Get attr %s no error, value: 0x%l=
x", attr_name,
> +		       value);
> +
> +		ret =3D sbi_sse_write_attrs(event_id, attr, 1, &prev_value);
> +		sbiret_report_error(&ret, SBI_SUCCESS, "Restore attr %s value no error=
", attr_name);
> +	}
> +
> +	/* Test all flags allowed for SBI_SSE_ATTR_INTERRUPTED_FLAGS*/
                                                                    ^
								    missing
								    space

> +	attr =3D SBI_SSE_ATTR_INTERRUPTED_FLAGS;
> +	ret =3D sbi_sse_read_attrs(event_id, attr, 1, &prev_value);
> +	sbiret_report_error(&ret, SBI_SUCCESS, "Save interrupted flags no error=
");
> +
> +	for (i =3D 0; i < ARRAY_SIZE(interrupted_flags); i++) {
> +		flags =3D interrupted_flags[i];
> +		ret =3D sbi_sse_write_attrs(event_id, attr, 1, &flags);
> +		sbiret_report_error(&ret, SBI_SUCCESS,
> +				    "Set interrupted flags bit 0x%lx value no error", flags);
> +		ret =3D sbi_sse_read_attrs(event_id, attr, 1, &value);
> +		sbiret_report_error(&ret, SBI_SUCCESS, "Get interrupted flags after se=
t no error");
> +		report(value =3D=3D flags, "interrupted flags modified value ok: 0x%lx=
", value);

Do we also need to test with more than one flag set at a time?

> +	}
> +
> +	/* Write invalid bit in flag register */
> +	flags =3D SBI_SSE_ATTR_INTERRUPTED_FLAGS_SSTATUS_SDT << 1;
> +	ret =3D sbi_sse_write_attrs(event_id, attr, 1, &flags);
> +	sbiret_report_error(&ret, SBI_ERR_INVALID_PARAM, "Set invalid flags bit=
 0x%lx value error",
> +			    flags);
> +#if __riscv_xlen > 32
> +	flags =3D BIT(32);
> +	ret =3D sbi_sse_write_attrs(event_id, attr, 1, &flags);
> +	sbiret_report_error(&ret, SBI_ERR_INVALID_PARAM, "Set invalid flags bit=
 0x%lx value error",

This should have a different report string than the test above.

> +			    flags);
> +#endif
> +
> +	ret =3D sbi_sse_write_attrs(event_id, attr, 1, &prev_value);
> +	sbiret_report_error(&ret, SBI_SUCCESS, "Restore interrupted flags no er=
ror");
> +
> +	/* Try to change HARTID/Priority while running */
> +	if (sbi_sse_event_is_global(event_id)) {
> +		value =3D current_thread_info()->hartid;
> +		ret =3D sbi_sse_write_attrs(event_id, SBI_SSE_ATTR_PREFERRED_HART, 1, =
&value);
> +		sbiret_report_error(&ret, SBI_ERR_INVALID_STATE, "Set hart id while ru=
nning error");
> +	}

SBI_ERR_INVALID_STATE is not listed as a possible error for write_attrs.

> +
> +	value =3D 0;
> +	ret =3D sbi_sse_write_attrs(event_id, SBI_SSE_ATTR_PRIORITY, 1, &value);
> +	sbiret_report_error(&ret, SBI_ERR_INVALID_STATE, "Set priority while ru=
nning error");
> +
> +	report(interrupted_state[2] =3D=3D READ_ONCE(arg->expected_a6),
> +	       "Interrupted state a6 ok, expected 0x%lx, got 0x%lx",
> +	       READ_ONCE(arg->expected_a6), interrupted_state[2]);

Could just READ_ONCE expected_a6 once.

> +
> +	report(interrupted_state[3] =3D=3D SBI_EXT_SSE,
> +	       "Interrupted state a7 ok, expected 0x%x, got 0x%lx", SBI_EXT_SSE,
> +	       interrupted_state[3]);
> +
> +	WRITE_ONCE(arg->done, true);
> +}
> +
> +static void sse_test_inject_simple(uint32_t event_id)
> +{
> +	unsigned long value;
> +	struct sbiret ret;
> +	struct sse_simple_test_arg test_arg =3D {.event_id =3D event_id};
> +	struct sbi_sse_handler_arg args =3D {
> +		.handler =3D sse_simple_handler,
> +		.handler_data =3D (void *) &test_arg,
> +		.stack =3D sse_alloc_stack(),
> +	};
> +
> +	report_prefix_push("simple");
> +
> +	if (!sse_check_state(event_id, SBI_SSE_STATE_UNUSED))
> +		goto done;
> +
> +	ret =3D sbi_sse_register(event_id, &args);
> +	if (!sbiret_report_error(&ret, SBI_SUCCESS, "SSE register no error"))
> +		goto done;
> +
> +	if (!sse_check_state(event_id, SBI_SSE_STATE_REGISTERED))
> +		goto done;
> +
> +	/* Be sure global events are targeting the current hart */
> +	sse_global_event_set_current_hart(event_id);
> +
> +	ret =3D sbi_sse_enable(event_id);
> +	if (!sbiret_report_error(&ret, SBI_SUCCESS, "SSE enable no error"))
> +		goto done;
> +
> +	if (!sse_check_state(event_id, SBI_SSE_STATE_ENABLED))
> +		goto done;
> +
> +	ret =3D sbi_sse_hart_mask();
> +	if (!sbiret_report_error(&ret, SBI_SUCCESS, "SSE hart mask no error"))
> +		goto done;
> +
> +	ret =3D sbi_sse_inject(event_id, current_thread_info()->hartid);
> +	if (!sbiret_report_error(&ret, SBI_SUCCESS, "SSE injection masked no er=
ror"))
> +		goto done;
> +
> +	barrier();
> +	report(test_arg.done =3D=3D 0, "SSE event masked not handled");

Could instead drop the barrier() calls and use READ/WRITE_ONCE with all
test_arg member accesses.

> +
> +	/*
> +	 * When unmasking the SSE events, we expect it to be injected
> +	 * immediately so a6 should be SBI_EXT_SBI_SSE_HART_UNMASK
> +	 */
> +	test_arg.expected_a6 =3D SBI_EXT_SSE_HART_UNMASK;
> +	ret =3D sbi_sse_hart_unmask();
> +	if (!sbiret_report_error(&ret, SBI_SUCCESS, "SSE hart unmask no error"))
> +		goto done;
> +
> +	barrier();
> +	report(test_arg.done =3D=3D 1, "SSE event unmasked handled");
> +	test_arg.done =3D 0;
> +	test_arg.expected_a6 =3D SBI_EXT_SSE_INJECT;
> +
> +	/* Set as oneshot and verify it is disabled */
> +	ret =3D sbi_sse_disable(event_id);
> +	sbiret_report_error(&ret, SBI_SUCCESS, "Disable event ok");
> +	value =3D SBI_SSE_ATTR_CONFIG_ONESHOT;
> +	ret =3D sbi_sse_write_attrs(event_id, SBI_SSE_ATTR_CONFIG, 1, &value);
> +	sbiret_report_error(&ret, SBI_SUCCESS, "Set event attribute as ONESHOT"=
);
> +	ret =3D sbi_sse_enable(event_id);
> +	sbiret_report_error(&ret, SBI_SUCCESS, "Enable event ok");
> +
> +	ret =3D sbi_sse_inject(event_id, current_thread_info()->hartid);
> +	if (!sbiret_report_error(&ret, SBI_SUCCESS, "SSE second injection no er=
ror"))
> +		goto done;
> +
> +	barrier();
> +	report(test_arg.done =3D=3D 1, "SSE event handled ok");
> +	test_arg.done =3D 0;
> +
> +	if (!sse_check_state(event_id, SBI_SSE_STATE_REGISTERED))
> +		goto done;
> +
> +	/* Clear ONESHOT FLAG */
> +	value =3D 0;
> +	sbi_sse_write_attrs(event_id, SBI_SSE_ATTR_CONFIG, 1, &value);

Why clear the oneshot flag before unregistering (and not check if the attr
write was successful)?

> +
> +	ret =3D sbi_sse_unregister(event_id);
> +	if (!sbiret_report_error(&ret, SBI_SUCCESS, "SSE unregister no error"))
> +		goto done;
> +
> +	sse_check_state(event_id, SBI_SSE_STATE_UNUSED);
> +
> +done:

Is it ok to leave this function with an event registered/enabled? If not,
then some of the goto's above should goto other labels which disable and
unregister.

> +	sse_free_stack(args.stack);
> +	report_prefix_pop();
> +}
> +
> +struct sse_foreign_cpu_test_arg {
> +	bool done;
> +	unsigned int expected_cpu;
> +	uint32_t event_id;
> +};
> +
> +static void sse_foreign_cpu_handler(void *data, struct pt_regs *regs, un=
signed int hartid)
> +{
> +	struct sse_foreign_cpu_test_arg *arg =3D data;
> +	unsigned int expected_cpu;
> +
> +	/* For arg content to be visible */
> +	smp_rmb();
> +	expected_cpu =3D READ_ONCE(arg->expected_cpu);
> +	report(expected_cpu =3D=3D current_thread_info()->cpu,
> +	       "Received event on CPU (%d), expected CPU (%d)", current_thread_=
info()->cpu,
> +	       expected_cpu);
> +
> +	WRITE_ONCE(arg->done, true);
> +	/* For arg update to be visible for other CPUs */
> +	smp_wmb();
> +}
> +
> +struct sse_local_per_cpu {
> +	struct sbi_sse_handler_arg args;
> +	struct sbiret ret;
> +	struct sse_foreign_cpu_test_arg handler_arg;
> +};
> +
> +static void sse_register_enable_local(void *data)
> +{
> +	struct sbiret ret;
> +	struct sse_local_per_cpu *cpu_args =3D data;
> +	struct sse_local_per_cpu *cpu_arg =3D &cpu_args[current_thread_info()->=
cpu];
> +	uint32_t event_id =3D cpu_arg->handler_arg.event_id;
> +
> +	ret =3D sbi_sse_register(event_id, &cpu_arg->args);
> +	WRITE_ONCE(cpu_arg->ret, ret);
> +	if (ret.error)
> +		return;
> +
> +	ret =3D sbi_sse_enable(event_id);
> +	WRITE_ONCE(cpu_arg->ret, ret);
> +}
> +
> +static void sbi_sse_disable_unregister_local(void *data)
> +{
> +	struct sbiret ret;
> +	struct sse_local_per_cpu *cpu_args =3D data;
> +	struct sse_local_per_cpu *cpu_arg =3D &cpu_args[current_thread_info()->=
cpu];
> +	uint32_t event_id =3D cpu_arg->handler_arg.event_id;
> +
> +	ret =3D sbi_sse_disable(event_id);
> +	WRITE_ONCE(cpu_arg->ret, ret);
> +	if (ret.error)
> +		return;
> +
> +	ret =3D sbi_sse_unregister(event_id);
> +	WRITE_ONCE(cpu_arg->ret, ret);
> +}
> +
> +static void sse_test_inject_local(uint32_t event_id)
> +{
> +	int cpu;
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
> +	}
> +
> +	on_cpus(sse_register_enable_local, cpu_args);
> +	for_each_online_cpu(cpu) {
> +		cpu_arg =3D &cpu_args[cpu];
> +		ret =3D cpu_arg->ret;
> +		if (ret.error)
> +			report_abort("CPU failed to register/enable SSE event: %ld",
> +				     ret.error);

Do we need this to be an abort?

> +
> +		handler_arg =3D &cpu_arg->handler_arg;
> +		WRITE_ONCE(handler_arg->expected_cpu, cpu);
> +		/* For handler_arg content to be visible for other CPUs */
> +		smp_wmb();
> +		ret =3D sbi_sse_inject(event_id, cpus[cpu].hartid);
> +		if (ret.error)
> +			report_abort("CPU failed to register/enable SSE event: %ld",
> +				     ret.error);

abort?

> +	}
> +
> +	for_each_online_cpu(cpu) {
> +		handler_arg =3D &cpu_args[cpu].handler_arg;

Need smp_rmb() here in case we read done=3D1 on first try in order
to be sure that all other data ordered wrt the done write can
be observed.

> +		while (!READ_ONCE(handler_arg->done)) {

Maybe a cpu_relax() here.

> +			/* For handler_arg update to be visible */
> +			smp_rmb();
> +		}
> +		WRITE_ONCE(handler_arg->done, false);
> +	}
> +
> +	on_cpus(sbi_sse_disable_unregister_local, cpu_args);
> +	for_each_online_cpu(cpu) {
> +		cpu_arg =3D &cpu_args[cpu];
> +		ret =3D READ_ONCE(cpu_arg->ret);
> +		if (ret.error)
> +			report_abort("CPU failed to disable/unregister SSE event: %ld",
> +				     ret.error);

abort?

> +	}
> +
> +	for_each_online_cpu(cpu) {
> +		cpu_arg =3D &cpu_args[cpu];
> +

delete unnecessary blank line

> +		sse_free_stack(cpu_arg->args.stack);
> +	}
> +
> +	report_pass("local event dispatch on all CPUs");
> +	report_prefix_pop();
> +
> +}
> +
> +static void sse_test_inject_global(uint32_t event_id)
> +{
> +	unsigned long value;
> +	struct sbiret ret;
> +	unsigned int cpu;
> +	struct sse_foreign_cpu_test_arg test_arg =3D {.event_id =3D event_id};
> +	struct sbi_sse_handler_arg args =3D {
> +		.handler =3D sse_foreign_cpu_handler,
> +		.handler_data =3D (void *) &test_arg,
> +		.stack =3D sse_alloc_stack(),
> +	};
> +	enum sbi_sse_state state;
> +
> +	report_prefix_push("global_dispatch");
> +
> +	ret =3D sbi_sse_register(event_id, &args);
> +	if (!sbiret_report_error(&ret, SBI_SUCCESS, "Register event no error"))
> +		goto err_free_stack;
> +
> +	for_each_online_cpu(cpu) {
> +		WRITE_ONCE(test_arg.expected_cpu, cpu);
> +		/* For test_arg content to be visible for other CPUs */
> +		smp_wmb();
> +		value =3D cpu;
> +		ret =3D sbi_sse_write_attrs(event_id, SBI_SSE_ATTR_PREFERRED_HART, 1, =
&value);
> +		if (!sbiret_report_error(&ret, SBI_SUCCESS, "Set preferred hart no err=
or"))
> +			goto err_unregister;
> +
> +		ret =3D sbi_sse_enable(event_id);
> +		if (!sbiret_report_error(&ret, SBI_SUCCESS, "Enable SSE event no error=
"))
> +			goto err_unregister;
> +
> +		ret =3D sbi_sse_inject(event_id, cpu);
> +		if (!sbiret_report_error(&ret, SBI_SUCCESS, "Inject SSE event no error=
"))
> +			goto err_disable;
> +

smp_rmb()

> +		while (!READ_ONCE(test_arg.done)) {

cpu_relax()

> +			/* For shared test_arg structure */
> +			smp_rmb();
> +		}
> +
> +		WRITE_ONCE(test_arg.done, false);
> +
> +		/* Wait for event to be in ENABLED state */
> +		do {
> +			ret =3D sse_event_get_state(event_id, &state);
> +			if (sbiret_report_error(&ret, SBI_SUCCESS, "Get SSE event state no er=
ror"))
> +				goto err_disable;

cpu_relax() or even use udelay()?

> +		} while (state !=3D SBI_SSE_STATE_ENABLED);
> +
> +err_disable:
> +		ret =3D sbi_sse_disable(event_id);
> +		if (!sbiret_report_error(&ret, SBI_SUCCESS, "Disable SSE event no erro=
r"))
> +			goto err_unregister;
> +
> +		report_pass("Global event on CPU %d", cpu);
> +	}
> +
> +err_unregister:
> +	ret =3D sbi_sse_unregister(event_id);
> +	sbiret_report_error(&ret, SBI_SUCCESS, "Unregister SSE event no error");
> +
> +err_free_stack:
> +	sse_free_stack(args.stack);
> +	report_prefix_pop();
> +}
> +
> +struct priority_test_arg {
> +	uint32_t event_id;
> +	bool called;
> +	u32 prio;
> +	struct priority_test_arg *next_event_arg;
> +	void (*check_func)(struct priority_test_arg *arg);
> +};
> +
> +static void sse_hi_priority_test_handler(void *arg, struct pt_regs *regs,
> +					 unsigned int hartid)
> +{
> +	struct priority_test_arg *targ =3D arg;
> +	struct priority_test_arg *next =3D targ->next_event_arg;
> +
> +	targ->called =3D true;
> +	if (next) {
> +		sbi_sse_inject(next->event_id, current_thread_info()->hartid);
> +
> +		report(!sse_event_pending(next->event_id), "Higher priority event is p=
ending");

"is not pending"

> +		report(next->called, "Higher priority event was not handled");

"was handled"

> +	}
> +}
> +
> +static void sse_low_priority_test_handler(void *arg, struct pt_regs *reg=
s,
> +					  unsigned int hartid)
> +{
> +	struct priority_test_arg *targ =3D arg;
> +	struct priority_test_arg *next =3D targ->next_event_arg;
> +
> +	targ->called =3D true;
> +
> +	if (next) {
> +		sbi_sse_inject(next->event_id, current_thread_info()->hartid);
> +
> +		report(sse_event_pending(next->event_id), "Lower priority event is pen=
ding");
> +		report(!next->called, "Lower priority event %s was handle before %s",

"was not handled"

> +		       sse_event_name(next->event_id), sse_event_name(targ->event_id));
> +	}
> +}
> +
> +static void sse_test_injection_priority_arg(struct priority_test_arg *in=
_args,
> +					    unsigned int in_args_size,
> +					    sbi_sse_handler_fn handler,
> +					    const char *test_name)
> +{
> +	unsigned int i;
> +	unsigned long value;
> +	struct sbiret ret;
> +	uint32_t event_id;
> +	struct priority_test_arg *arg;
> +	unsigned int args_size =3D 0;
> +	struct sbi_sse_handler_arg event_args[in_args_size];
> +	struct priority_test_arg *args[in_args_size];
> +	void *stack;
> +	struct sbi_sse_handler_arg *event_arg;
> +
> +	report_prefix_push(test_name);
> +
> +	for (i =3D 0; i < in_args_size; i++) {
> +		arg =3D &in_args[i];
> +		event_id =3D arg->event_id;
> +		if (!sse_event_can_inject(event_id))
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
> +		event_id =3D arg->event_id;
> +		stack =3D sse_alloc_stack();
> +
> +		event_arg =3D &event_args[i];
> +		event_arg->handler =3D handler;
> +		event_arg->handler_data =3D (void *)arg;
> +		event_arg->stack =3D stack;
> +
> +		if (i < (args_size - 1))
> +			arg->next_event_arg =3D args[i + 1];
> +		else
> +			arg->next_event_arg =3D NULL;
> +
> +		/* Be sure global events are targeting the current hart */
> +		sse_global_event_set_current_hart(event_id);
> +
> +		sbi_sse_register(event_id, event_arg);
> +		value =3D arg->prio;
> +		sbi_sse_write_attrs(event_id, SBI_SSE_ATTR_PRIORITY, 1, &value);
> +		sbi_sse_enable(event_id);

No return code checks for these SSE calls? If we're 99% sure they should
succeed, then I'd still check them with asserts.

> +	}
> +
> +	/* Inject first event */
> +	ret =3D sbi_sse_inject(args[0]->event_id, current_thread_info()->hartid=
);
> +	sbiret_report_error(&ret, SBI_SUCCESS, "SSE injection no error");
> +
> +	for (i =3D 0; i < args_size; i++) {
> +		arg =3D args[i];
> +		event_id =3D arg->event_id;
> +
> +		report(arg->called, "Event %s handler called", sse_event_name(arg->eve=
nt_id));
> +
> +		sbi_sse_disable(event_id);
> +		sbi_sse_unregister(event_id);

No return code checks?

> +
> +		event_arg =3D &event_args[i];
> +		sse_free_stack(event_arg->stack);
> +	}
> +
> +skip:
> +	report_prefix_pop();

Isn't this an extra pop()? We should be able to return directly from the
report_skip() if-block.

> +}
> +
> +static struct priority_test_arg hi_prio_args[] =3D {
> +	{.event_id =3D SBI_SSE_EVENT_GLOBAL_SOFTWARE},
> +	{.event_id =3D SBI_SSE_EVENT_LOCAL_SOFTWARE},
> +	{.event_id =3D SBI_SSE_EVENT_GLOBAL_LOW_PRIO_RAS},
> +	{.event_id =3D SBI_SSE_EVENT_LOCAL_LOW_PRIO_RAS},
> +	{.event_id =3D SBI_SSE_EVENT_LOCAL_PMU_OVERFLOW},
> +	{.event_id =3D SBI_SSE_EVENT_GLOBAL_HIGH_PRIO_RAS},
> +	{.event_id =3D SBI_SSE_EVENT_LOCAL_DOUBLE_TRAP},
> +	{.event_id =3D SBI_SSE_EVENT_LOCAL_HIGH_PRIO_RAS},
> +};
> +
> +static struct priority_test_arg low_prio_args[] =3D {
> +	{.event_id =3D SBI_SSE_EVENT_LOCAL_HIGH_PRIO_RAS},
> +	{.event_id =3D SBI_SSE_EVENT_LOCAL_DOUBLE_TRAP},
> +	{.event_id =3D SBI_SSE_EVENT_GLOBAL_HIGH_PRIO_RAS},
> +	{.event_id =3D SBI_SSE_EVENT_LOCAL_PMU_OVERFLOW},
> +	{.event_id =3D SBI_SSE_EVENT_LOCAL_LOW_PRIO_RAS},
> +	{.event_id =3D SBI_SSE_EVENT_GLOBAL_LOW_PRIO_RAS},
> +	{.event_id =3D SBI_SSE_EVENT_LOCAL_SOFTWARE},
> +	{.event_id =3D SBI_SSE_EVENT_GLOBAL_SOFTWARE},
> +};
> +
> +static struct priority_test_arg prio_args[] =3D {
> +	{.event_id =3D SBI_SSE_EVENT_GLOBAL_SOFTWARE, .prio =3D 5},
> +	{.event_id =3D SBI_SSE_EVENT_LOCAL_SOFTWARE, .prio =3D 10},
> +	{.event_id =3D SBI_SSE_EVENT_LOCAL_LOW_PRIO_RAS, .prio =3D 12},
> +	{.event_id =3D SBI_SSE_EVENT_LOCAL_PMU_OVERFLOW, .prio =3D 15},
> +	{.event_id =3D SBI_SSE_EVENT_GLOBAL_HIGH_PRIO_RAS, .prio =3D 20},
> +	{.event_id =3D SBI_SSE_EVENT_GLOBAL_LOW_PRIO_RAS, .prio =3D 22},
> +	{.event_id =3D SBI_SSE_EVENT_LOCAL_HIGH_PRIO_RAS, .prio =3D 25},
> +};
> +
> +static struct priority_test_arg same_prio_args[] =3D {
> +	{.event_id =3D SBI_SSE_EVENT_LOCAL_PMU_OVERFLOW, .prio =3D 0},
> +	{.event_id =3D SBI_SSE_EVENT_GLOBAL_LOW_PRIO_RAS, .prio =3D 0},
> +	{.event_id =3D SBI_SSE_EVENT_LOCAL_HIGH_PRIO_RAS, .prio =3D 10},
> +	{.event_id =3D SBI_SSE_EVENT_LOCAL_SOFTWARE, .prio =3D 10},
> +	{.event_id =3D SBI_SSE_EVENT_GLOBAL_SOFTWARE, .prio =3D 10},
> +	{.event_id =3D SBI_SSE_EVENT_GLOBAL_HIGH_PRIO_RAS, .prio =3D 20},
> +	{.event_id =3D SBI_SSE_EVENT_LOCAL_LOW_PRIO_RAS, .prio =3D 20},
> +};

nit: could tab out the .prio's in order to better tabulate the above two
structs.

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
> +static void test_invalid_event_id(unsigned long event_id)
> +{
> +	struct sbiret ret;
> +	unsigned long value =3D 0;
> +
> +	ret =3D sbi_sse_register_raw(event_id, (unsigned long) sbi_sse_entry, 0=
);
> +	sbiret_report_error(&ret, SBI_ERR_INVALID_PARAM,
> +			    "SSE register event_id 0x%lx invalid param", event_id);
> +
> +	ret =3D sbi_sse_unregister(event_id);
> +	sbiret_report_error(&ret, SBI_ERR_INVALID_PARAM,
> +			"SSE unregister event_id 0x%lx invalid param", event_id);
> +
> +	ret =3D sbi_sse_enable(event_id);
> +	sbiret_report_error(&ret, SBI_ERR_INVALID_PARAM,
> +			    "SSE enable event_id 0x%lx invalid param", event_id);
> +
> +	ret =3D sbi_sse_disable(event_id);
> +	sbiret_report_error(&ret, SBI_ERR_INVALID_PARAM,
> +			    "SSE disable event_id 0x%lx invalid param", event_id);
> +
> +	ret =3D sbi_sse_inject(event_id, 0);
> +	sbiret_report_error(&ret, SBI_ERR_INVALID_PARAM,
> +			    "SSE inject event_id 0x%lx invalid param", event_id);
> +
> +	ret =3D sbi_sse_write_attrs(event_id, SBI_SSE_ATTR_PRIORITY, 1, &value);
> +	sbiret_report_error(&ret, SBI_ERR_INVALID_PARAM,
> +			    "SSE write attr event_id 0x%lx invalid param", event_id);
> +
> +	ret =3D sbi_sse_read_attrs(event_id, SBI_SSE_ATTR_PRIORITY, 1, &value);
> +	sbiret_report_error(&ret, SBI_ERR_INVALID_PARAM,
> +			    "SSE read attr event_id 0x%lx invalid param", event_id);

We can s/invalid param/ from all the strings above since we output
SBI_ERR_INVALID_PARAM with the latest sbiret_report_error()

> +}
> +
> +static void sse_test_invalid_event_id(void)
> +{
> +
> +	report_prefix_push("event_id");
> +
> +#if __riscv_xlen > 32
> +	test_invalid_event_id(BIT_ULL(32));
> +#endif

With your latest opensbi changes we'll truncate eventid, so we need
another invalid eventid for the tests. That's good since we can then test
for rv32 too.

> +
> +	report_prefix_pop();
> +}
> +
> +static bool sse_can_inject(uint32_t event_id)
> +{
> +	struct sbiret ret;
> +	unsigned long status;
> +
> +	ret =3D sbi_sse_read_attrs(event_id, SBI_SSE_ATTR_STATUS, 1, &status);
> +	if (ret.error)

Don't we want to assert or complain loudly about an unexpected status read
failure?

> +		return false;
> +
> +	return !!(status & BIT(SBI_SSE_ATTR_STATUS_INJECT_OFFSET));
> +}
> +
> +static void boot_secondary(void *data)

Maybe name this sse_secondary_boot_and_unmask?

> +{
> +	sbi_sse_hart_unmask();
> +}
> +
> +static void sse_check_mask(void)
> +{
> +	struct sbiret ret;
> +
> +	/* Upon boot, event are masked, check that */
> +	ret =3D sbi_sse_hart_mask();
> +	sbiret_report_error(&ret, SBI_ERR_ALREADY_STOPPED, "SSE hart mask at bo=
ot time ok");
> +
> +	ret =3D sbi_sse_hart_unmask();
> +	sbiret_report_error(&ret, SBI_SUCCESS, "SSE hart no error ok");
                                                        ^ unmask

> +	ret =3D sbi_sse_hart_unmask();
> +	sbiret_report_error(&ret, SBI_ERR_ALREADY_STARTED, "SSE hart unmask twi=
ce error ok");
> +
> +	ret =3D sbi_sse_hart_mask();
> +	sbiret_report_error(&ret, SBI_SUCCESS, "SSE hart mask no error");
> +	ret =3D sbi_sse_hart_mask();
> +	sbiret_report_error(&ret, SBI_ERR_ALREADY_STOPPED, "SSE hart mask twice=
 ok");
> +}
> +
> +void check_sse(void)
> +{
> +	unsigned long i, event_id;
> +
> +	report_prefix_push("sse");
> +
> +	if (!sbi_probe(SBI_EXT_SSE)) {
> +		report_skip("SSE extension not available");
> +		report_prefix_pop();
> +		return;
> +	}
> +
> +	sse_check_mask();
> +
> +	/*
> +	 * Dummy wakeup of all processors since some of them will be targeted
> +	 * by global events without going through the wakeup call as well as
> +	 * unmasking SSE events on all harts
> +	 */
> +	on_cpus(boot_secondary, NULL);
> +
> +	sse_test_invalid_event_id();
> +
> +	for (i =3D 0; i < ARRAY_SIZE(sse_event_infos); i++) {
> +		event_id =3D sse_event_infos[i].event_id;
> +		report_prefix_push(sse_event_infos[i].name);
> +		if (!sse_can_inject(event_id)) {
> +			report_skip("Event 0x%lx does not support injection", event_id);
> +			report_prefix_pop();
> +			continue;
> +		} else {
> +			sse_event_infos[i].can_inject =3D true;

What do we need to cache can_inject=3Dtrue for if we filter out all events
which have can_inject=3Dfalse? Should we run at least something with
events which don't support injection?

> +		}
> +		sse_test_attrs(event_id);
> +		sse_test_register_error(event_id);
> +		sse_test_inject_simple(event_id);
> +		if (sbi_sse_event_is_global(event_id))
> +			sse_test_inject_global(event_id);
> +		else
> +			sse_test_inject_local(event_id);
> +
> +		report_prefix_pop();
> +	}
> +
> +	sse_test_injection_priority();
> +
> +	report_prefix_pop();
> +}
> diff --git a/riscv/sbi.c b/riscv/sbi.c
> index 7c7a2d2d..49e81bda 100644
> --- a/riscv/sbi.c
> +++ b/riscv/sbi.c
> @@ -32,6 +32,7 @@
>  =

>  #define	HIGH_ADDR_BOUNDARY	((phys_addr_t)1 << 32)
>  =

> +void check_sse(void);
>  void check_fwft(void);
>  =

>  static long __labs(long a)
> @@ -1439,6 +1440,7 @@ int main(int argc, char **argv)
>  	check_hsm();
>  	check_dbcn();
>  	check_susp();
> +	check_sse();
>  	check_fwft();
>  =

>  	return report_summary();
> -- =

> 2.47.2
>

Thanks,
drew

-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
