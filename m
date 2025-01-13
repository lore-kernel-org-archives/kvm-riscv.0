Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB270C02180
	for <kvm-riscv@archiver.kernel.org>; Mon, 13 Jan 2025 17:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tuj6SOQuLXXNgBjZITPsL4qMkv8AUAHGAii+Aa5RyKY=; b=hugwsQTr7rsa5s
	o3+yNtXsyLDo9MU3Ic94FN/Yk/qdFmz4irCtFkBEw4nTc8vTVkwaMvxIvQ2z66kjwIqdUT38LXDCm
	G4dhUlBRUGrPOAeMu+dGUnUQpQ9GUkRWgucOT/QxWqLw64lpJ1F12wkTq+4/GPxvWLd7MAHYGsOP0
	piDX71m1d5SLRedb5RUXkY4td+hlQ8np3/LmpJSHFJtzGGEvKOUjzh5XGBrTieYhcYXs8Om2UEDKi
	5EeRY2pp6thGQJ7muc0gkWXMbUNB53M/dQIuGJluIUgCFlCLVTBYbdRJGg9GTwUPOSGBDuyb5WKlD
	5Z0jk1Za5LdLgRPtv/7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXO6t-000000061Xf-1f8F;
	Mon, 13 Jan 2025 17:20:19 +0000
Received: from out-186.mta1.migadu.com ([2001:41d0:203:375::ba])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXO6p-000000061XB-3eBu
	for kvm-riscv@lists.infradead.org;
	Mon, 13 Jan 2025 17:20:18 +0000
Date: Mon, 13 Jan 2025 18:19:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1736788813;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kKZhHPCyZDLdjAf8E3hlB7fpY0cr2y7IX19MOLtfDYI=;
	b=Y1XQZAVYC+h69G07gRsjUOFI3cYeltB/qkpWsY8LSoML3wU5hrRSyDTY0/xqzaDtzcrazo
	w9SNvjHhBQAKgDqymZ2dacxJ/dv16cbgsfCCH8yJafBdLHw/fUqpheoBIwyxopJCNQ41x3
	f3q+fnBmMLPqc4A5m6sSrQSFh+7S+V4=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	Andrew Jones <ajones@ventanamicro.com>, Anup Patel <apatel@ventanamicro.com>, 
	Atish Patra <atishp@rivosinc.com>
Subject: Re: [kvm-unit-tests PATCH v4 5/5] riscv: sbi: Add SSE extension tests
Message-ID: <20250108-162405687be625303572c303@orel>
References: <20241125162200.1630845-1-cleger@rivosinc.com>
 <20241125162200.1630845-6-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241125162200.1630845-6-cleger@rivosinc.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_092016_482196_33264FA0 
X-CRM114-Status: GOOD (  33.98  )
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

On Mon, Nov 25, 2024 at 05:21:54PM +0100, Cl=E9ment L=E9ger wrote:
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
>  riscv/Makefile           |    2 +-
>  lib/riscv/asm/csr.h      |    2 +
>  riscv/sbi-tests.h        |   12 +
>  riscv/sbi-asm.S          |   90 ++++
>  riscv/asm-offsets-test.c |    7 +
>  riscv/sbi-sse.c          | 1043 ++++++++++++++++++++++++++++++++++++++
>  riscv/sbi.c              |    3 +
>  7 files changed, 1158 insertions(+), 1 deletion(-)
>  create mode 100644 riscv/sbi-sse.c
> =

> diff --git a/riscv/Makefile b/riscv/Makefile
> index 05e41d0c..5fb1b04f 100644
> --- a/riscv/Makefile
> +++ b/riscv/Makefile
> @@ -17,7 +17,7 @@ tests +=3D $(TEST_DIR)/sieve.$(exe)
>  =

>  all: $(tests)
>  =

> -$(TEST_DIR)/sbi-deps =3D $(TEST_DIR)/sbi-asm.o
> +$(TEST_DIR)/sbi-deps =3D $(TEST_DIR)/sbi-asm.o $(TEST_DIR)/sbi-sse.o
>  =

>  # When built for EFI sieve needs extra memory, run with e.g. '-m 256' on=
 QEMU
>  $(TEST_DIR)/sieve.$(exe): AUXFLAGS =3D 0x1
> diff --git a/lib/riscv/asm/csr.h b/lib/riscv/asm/csr.h
> index 16f5ddd7..06831380 100644
> --- a/lib/riscv/asm/csr.h
> +++ b/lib/riscv/asm/csr.h
> @@ -21,6 +21,8 @@
>  /* Exception cause high bit - is an interrupt if set */
>  #define CAUSE_IRQ_FLAG		(_AC(1, UL) << (__riscv_xlen - 1))
>  =

> +#define SSTATUS_SPP		_AC(0x00000100, UL) /* Previously Supervisor */

Above we have SR_SIE, so we should keep the naming consistent and use
SR_SPP, which is also consistent with Linux. We should also keep the
SSTATUS bits grouped together.

> +
>  /* Exception causes */
>  #define EXC_INST_MISALIGNED	0
>  #define EXC_INST_ACCESS		1
> diff --git a/riscv/sbi-tests.h b/riscv/sbi-tests.h
> index ce129968..44414995 100644
> --- a/riscv/sbi-tests.h
> +++ b/riscv/sbi-tests.h
> @@ -33,4 +33,16 @@
>  #define SBI_SUSP_TEST_HARTID	(1 << 2)
>  #define SBI_SUSP_TEST_MASK	7
>  =

> +#ifndef __ASSEMBLY__
> +
> +typedef void (*sse_handler_fn)(void *data, struct pt_regs *regs, unsigne=
d int hartid);
> +
> +struct sse_handler_arg {
> +	unsigned long reg_tmp;
> +	sse_handler_fn handler;
> +	void *handler_data;
> +	void *stack;
> +};
> +
> +#endif /* !__ASSEMBLY__ */
>  #endif /* _RISCV_SBI_TESTS_H_ */
> diff --git a/riscv/sbi-asm.S b/riscv/sbi-asm.S
> index 193d9606..7c2e1301 100644
> --- a/riscv/sbi-asm.S
> +++ b/riscv/sbi-asm.S
> @@ -131,3 +131,93 @@ sbi_susp_resume:
>  	call	longjmp
>  6:	pause	/* unreachable */
>  	j	6b
> +
> +.global sse_entry
> +sse_entry:
> +	/* Save stack temporarily */
> +	REG_S sp, SBI_SSE_REG_TMP(a7)
> +	/* Set entry stack */
> +	REG_L sp, SBI_SSE_HANDLER_STACK(a7)
> +
> +	addi sp, sp, -(PT_SIZE)
> +	REG_S ra, PT_RA(sp)
> +	REG_S s0, PT_S0(sp)
> +	REG_S s1, PT_S1(sp)
> +	REG_S s2, PT_S2(sp)
> +	REG_S s3, PT_S3(sp)
> +	REG_S s4, PT_S4(sp)
> +	REG_S s5, PT_S5(sp)
> +	REG_S s6, PT_S6(sp)
> +	REG_S s7, PT_S7(sp)
> +	REG_S s8, PT_S8(sp)
> +	REG_S s9, PT_S9(sp)
> +	REG_S s10, PT_S10(sp)
> +	REG_S s11, PT_S11(sp)
> +	REG_S tp, PT_TP(sp)
> +	REG_S t0, PT_T0(sp)
> +	REG_S t1, PT_T1(sp)
> +	REG_S t2, PT_T2(sp)
> +	REG_S t3, PT_T3(sp)
> +	REG_S t4, PT_T4(sp)
> +	REG_S t5, PT_T5(sp)
> +	REG_S t6, PT_T6(sp)
> +	REG_S gp, PT_GP(sp)
> +	REG_S a0, PT_A0(sp)
> +	REG_S a1, PT_A1(sp)
> +	REG_S a2, PT_A2(sp)
> +	REG_S a3, PT_A3(sp)
> +	REG_S a4, PT_A4(sp)
> +	REG_S a5, PT_A5(sp)
> +	csrr a1, CSR_SEPC
> +	REG_S a1, PT_EPC(sp)
> +	csrr a2, CSR_SSTATUS
> +	REG_S a2, PT_STATUS(sp)
> +
> +	REG_L a0, SBI_SSE_REG_TMP(a7)
> +	REG_S a0, PT_SP(sp)
> +
> +	REG_L t0, SBI_SSE_HANDLER(a7)
> +	REG_L a0, SBI_SSE_HANDLER_DATA(a7)
> +	mv a1, sp
> +	mv a2, a6
> +	jalr t0
> +
> +	REG_L a1, PT_EPC(sp)
> +	REG_L a2, PT_STATUS(sp)
> +	csrw CSR_SEPC, a1
> +	csrw CSR_SSTATUS, a2
> +
> +	REG_L ra, PT_RA(sp)
> +	REG_L s0, PT_S0(sp)
> +	REG_L s1, PT_S1(sp)
> +	REG_L s2, PT_S2(sp)
> +	REG_L s3, PT_S3(sp)
> +	REG_L s4, PT_S4(sp)
> +	REG_L s5, PT_S5(sp)
> +	REG_L s6, PT_S6(sp)
> +	REG_L s7, PT_S7(sp)
> +	REG_L s8, PT_S8(sp)
> +	REG_L s9, PT_S9(sp)
> +	REG_L s10, PT_S10(sp)
> +	REG_L s11, PT_S11(sp)
> +	REG_L tp, PT_TP(sp)
> +	REG_L t0, PT_T0(sp)
> +	REG_L t1, PT_T1(sp)
> +	REG_L t2, PT_T2(sp)
> +	REG_L t3, PT_T3(sp)
> +	REG_L t4, PT_T4(sp)
> +	REG_L t5, PT_T5(sp)
> +	REG_L t6, PT_T6(sp)
> +	REG_L gp, PT_GP(sp)
> +	REG_L a0, PT_A0(sp)
> +	REG_L a1, PT_A1(sp)
> +	REG_L a2, PT_A2(sp)
> +	REG_L a3, PT_A3(sp)
> +	REG_L a4, PT_A4(sp)
> +	REG_L a5, PT_A5(sp)
> +
> +	REG_L sp, PT_SP(sp)
> +
> +	li a7, ASM_SBI_EXT_SSE
> +	li a6, ASM_SBI_EXT_SSE_COMPLETE
> +	ecall
> \ No newline at end of file

Might need to check your editor settings to avoid these no newline things.

> diff --git a/riscv/asm-offsets-test.c b/riscv/asm-offsets-test.c
> index 116fe497..7b746e91 100644
> --- a/riscv/asm-offsets-test.c
> +++ b/riscv/asm-offsets-test.c
> @@ -7,6 +7,13 @@ int main(void)
>  {
>  	DEFINE(ASM_SBI_EXT_HSM, SBI_EXT_HSM);
>  	DEFINE(ASM_SBI_EXT_HSM_HART_STOP, SBI_EXT_HSM_HART_STOP);
> +	DEFINE(ASM_SBI_EXT_SSE, SBI_EXT_SSE);
> +	DEFINE(ASM_SBI_EXT_SSE_COMPLETE, SBI_EXT_SSE_COMPLETE);
> +
> +	OFFSET(SBI_SSE_REG_TMP, sse_handler_arg, reg_tmp);
> +	OFFSET(SBI_SSE_HANDLER, sse_handler_arg, handler);
> +	OFFSET(SBI_SSE_HANDLER_DATA, sse_handler_arg, handler_data);
> +	OFFSET(SBI_SSE_HANDLER_STACK, sse_handler_arg, stack);
>  =

>  	return 0;
>  }
> diff --git a/riscv/sbi-sse.c b/riscv/sbi-sse.c
> new file mode 100644
> index 00000000..3637cbee
> --- /dev/null
> +++ b/riscv/sbi-sse.c
> @@ -0,0 +1,1043 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * SBI SSE testsuite
> + *
> + * Copyright (C) 2024, Rivos Inc., Cl=E9ment L=E9ger <cleger@rivosinc.co=
m>
> + */
> +#include <alloc.h>
> +#include <alloc_page.h>
> +#include <bitops.h>
> +#include <cpumask.h>
> +#include <libcflat.h>
> +#include <on-cpus.h>
> +
> +#include <asm/barrier.h>
> +#include <asm/page.h>
> +#include <asm/processor.h>
> +#include <asm/sbi.h>
> +#include <asm/setup.h>
> +
> +#include "sbi-tests.h"
> +
> +#define SSE_STACK_SIZE	PAGE_SIZE
> +
> +void check_sse(void);
> +void sse_entry(void);
> +
> +struct sse_event_info {
> +	unsigned long event_id;
> +	const char *name;
> +	bool can_inject;
> +};
> +
> +static struct sse_event_info sse_event_infos[] =3D {
> +	{
> +		.event_id =3D SBI_SSE_EVENT_LOCAL_RAS,
> +		.name =3D "local_ras",
> +	},
> +	{
> +		.event_id =3D SBI_SSE_EVENT_LOCAL_DOUBLE_TRAP,
> +		.name =3D "double_trap",
> +	},
> +	{
> +		.event_id =3D SBI_SSE_EVENT_GLOBAL_RAS,
> +		.name =3D "global_ras",
> +	},
> +	{
> +		.event_id =3D SBI_SSE_EVENT_LOCAL_PMU,
> +		.name =3D "local_pmu",
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
> +	[SBI_SSE_ATTR_PRIORITY] =3D "prio",

"priority"

> +	[SBI_SSE_ATTR_CONFIG] =3D "config",
> +	[SBI_SSE_ATTR_PREFERRED_HART] =3D "preferred_hart",
> +	[SBI_SSE_ATTR_ENTRY_PC] =3D "entry_pc",
> +	[SBI_SSE_ATTR_ENTRY_ARG] =3D "entry_arg",
> +	[SBI_SSE_ATTR_INTERRUPTED_SEPC] =3D "interrupted_pc",

"interrupted_sepc"

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
> +	SBI_SSE_ATTR_INTERRUPTED_FLAGS,
> +	SBI_SSE_ATTR_INTERRUPTED_SEPC,
> +	SBI_SSE_ATTR_INTERRUPTED_A6,
> +	SBI_SSE_ATTR_INTERRUPTED_A7,
> +};
> +
> +static const unsigned long interrupted_flags[] =3D {
> +	SBI_SSE_ATTR_INTERRUPTED_FLAGS_SSTATUS_SPP,
> +	SBI_SSE_ATTR_INTERRUPTED_FLAGS_SSTATUS_SPIE,
> +	SBI_SSE_ATTR_INTERRUPTED_FLAGS_HSTATUS_SPV,
> +	SBI_SSE_ATTR_INTERRUPTED_FLAGS_HSTATUS_SPVP,
> +};
> +
> +static struct sse_event_info *sse_evt_get_infos(unsigned long event_id)

sse_evt_get_info() <-- drop the 's' since we only get one info

Also, it seems like we're mixing 'event' and 'evt' a lot in the naming
of variables and functions (applies to whole file). I'm not sure if
there's a pattern. I typically prefer spelling stuff out, so 'event',
but as long as things are consistent it's fine.

> +{
> +	int i;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(sse_event_infos); i++) {
> +		if (sse_event_infos[i].event_id =3D=3D event_id)
> +			return &sse_event_infos[i];
> +	}
> +
> +	assert_msg(false, "Invalid event id: %ld", event_id);
> +}
> +
> +static const char *sse_evt_name(unsigned long event_id)
> +{
> +	struct sse_event_info *infos =3D sse_evt_get_infos(event_id);
> +
> +	return infos->name;

Or the oneliner,

 return sse_evt_get_info(event_id)->name;

> +}
> +
> +static bool sse_evt_can_inject(unsigned long event_id)
> +{
> +	struct sse_event_info *infos =3D sse_evt_get_infos(event_id);
> +
> +	return infos->can_inject;

same comment as above

> +}
> +
> +static bool sse_event_is_global(unsigned long event_id)
> +{
> +	return !!(event_id & SBI_SSE_EVENT_GLOBAL_BIT);
> +}
> +
> +static struct sbiret sse_event_get_attr_raw(unsigned long event_id,

Let's name this sse_read_attrs_raw()

> +					    unsigned long base_attr_id,
> +					    unsigned long attr_count,
> +					    unsigned long phys_lo,
> +					    unsigned long phys_hi)
> +{
> +	return sbi_ecall(SBI_EXT_SSE, SBI_EXT_SSE_READ_ATTRS, event_id,
> +			base_attr_id, attr_count, phys_lo, phys_hi, 0);
> +}
> +
> +static unsigned long sse_event_get_attrs(unsigned long event_id, unsigne=
d long attr_id,
> +					 unsigned long *values, unsigned int attr_count)

And this sse_read_attrs()

> +{
> +	struct sbiret ret;
> +
> +	ret =3D sse_event_get_attr_raw(event_id, attr_id, attr_count, (unsigned=
 long)values, 0);

We should use virt_to_phys() on values and we shouldn't assume that we
don't need phys_hi.

  phys_addr_t p =3D virt_to_phys(values);
  sse_read_attrs_raw(..., lower_32_bits(p), upper_32_bits(p))

> +
> +	return ret.error;
> +}
> +
> +static unsigned long sse_event_get_attr(unsigned long event_id, unsigned=
 long attr_id,

Let's drop this function and use '1' when necessary in the callers.

> +					unsigned long *value)
> +{
> +	return sse_event_get_attrs(event_id, attr_id, value, 1);
> +}
> +
> +static struct sbiret sse_event_set_attr_raw(unsigned long event_id, unsi=
gned long base_attr_id,
> +					    unsigned long attr_count, unsigned long phys_lo,
> +					    unsigned long phys_hi)

sse_write_attrs_raw()

> +{
> +	return sbi_ecall(SBI_EXT_SSE, SBI_EXT_SSE_WRITE_ATTRS, event_id, base_a=
ttr_id, attr_count,
> +			 phys_lo, phys_hi, 0);
> +}
> +
> +static unsigned long sse_event_set_attr(unsigned long event_id, unsigned=
 long attr_id,

sse_write_attrs() and keep the attr_count parameter.

> +					unsigned long value)
> +{
> +	struct sbiret ret;
> +
> +	ret =3D sse_event_set_attr_raw(event_id, attr_id, 1, (unsigned long)&va=
lue, 0);

Same comment as above about virt_to_phys

> +
> +	return ret.error;
> +}
> +
> +static unsigned long sse_event_register_raw(unsigned long event_id, void=
 *entry_pc, void *entry_arg)

sse_register_raw()

> +{
> +	struct sbiret ret;
> +
> +	ret =3D sbi_ecall(SBI_EXT_SSE, SBI_EXT_SSE_REGISTER, event_id, (unsigne=
d long)entry_pc,
> +			(unsigned long)entry_arg, 0, 0, 0);
> +
> +	return ret.error;

I don't think you wanted to return ret.error here, but rather the sbiret
and then below call this function instead of sbi_ecall().

> +}
> +
> +static unsigned long sse_event_register(unsigned long event_id, struct s=
se_handler_arg *arg)

sse_register()

> +{
> +	struct sbiret ret;
> +
> +	ret =3D sbi_ecall(SBI_EXT_SSE, SBI_EXT_SSE_REGISTER, event_id, (unsigne=
d long)sse_entry,
> +			(unsigned long)arg, 0, 0, 0);
> +
> +	return ret.error;
> +}
> +
> +static unsigned long sse_event_unregister(unsigned long event_id)

sse_unregister()

> +{
> +	struct sbiret ret;
> +
> +	ret =3D sbi_ecall(SBI_EXT_SSE, SBI_EXT_SSE_UNREGISTER, event_id, 0, 0, =
0, 0, 0);
> +
> +	return ret.error;
> +}
> +
> +static unsigned long sse_event_enable(unsigned long event_id)

sse_enable()

> +{
> +	struct sbiret ret;
> +
> +	ret =3D sbi_ecall(SBI_EXT_SSE, SBI_EXT_SSE_ENABLE, event_id, 0, 0, 0, 0=
, 0);
> +
> +	return ret.error;
> +}
> +
> +static unsigned long sse_hart_mask(void)
> +{
> +	struct sbiret ret;
> +
> +	ret =3D sbi_ecall(SBI_EXT_SSE, SBI_EXT_SSE_HART_MASK, 0, 0, 0, 0, 0, 0);
> +
> +	return ret.error;
> +}
> +
> +static unsigned long sse_hart_unmask(void)
> +{
> +	struct sbiret ret;
> +
> +	ret =3D sbi_ecall(SBI_EXT_SSE, SBI_EXT_SSE_HART_UNMASK, 0, 0, 0, 0, 0, =
0);
> +
> +	return ret.error;
> +}
> +
> +static unsigned long sse_event_inject(unsigned long event_id, unsigned l=
ong hart_id)

sse_inject()

> +{
> +	struct sbiret ret;
> +
> +	ret =3D sbi_ecall(SBI_EXT_SSE, SBI_EXT_SSE_INJECT, event_id, hart_id, 0=
, 0, 0, 0);
> +
> +	return ret.error;
> +}
> +
> +static unsigned long sse_event_disable(unsigned long event_id)

sse_disable() and my OCD says this should be up next to sse_enable()

> +{
> +	struct sbiret ret;
> +
> +	ret =3D sbi_ecall(SBI_EXT_SSE, SBI_EXT_SSE_DISABLE, event_id, 0, 0, 0, =
0, 0);
> +
> +	return ret.error;
> +}
> +
> +
> +static int sse_get_state(unsigned long event_id, enum sbi_sse_state *sta=
te)

sse_event_get_state()

> +{
> +	int ret;
> +	unsigned long status;
> +
> +	ret =3D sse_event_get_attr(event_id, SBI_SSE_ATTR_STATUS, &status);
> +	if (ret) {
> +		report_fail("Failed to get SSE event status");

We should output the error we got too.

> +		return -1;

For binary return values (worked / didn't work) I usually go for a bool
(true / false), but (0 / -1) is OK too.

> +	}
> +
> +	*state =3D status & SBI_SSE_ATTR_STATUS_STATE_MASK;
> +
> +	return 0;
> +}
> +
> +static void sse_global_event_set_current_hart(unsigned long event_id)
> +{
> +	int ret;
> +
> +	if (!sse_event_is_global(event_id))
> +		return;
> +
> +	ret =3D sse_event_set_attr(event_id, SBI_SSE_ATTR_PREFERRED_HART,
> +				 current_thread_info()->hartid);
> +	if (ret)
> +		report_abort("set preferred hart failure");

output error received

> +}
> +
> +static int sse_check_state(unsigned long event_id, unsigned long expecte=
d_state)
> +{
> +	int ret;
> +	enum sbi_sse_state state;
> +
> +	ret =3D sse_get_state(event_id, &state);
> +	if (ret)
> +		return 1;
> +	report(state =3D=3D expected_state, "SSE event status =3D=3D %ld", expe=
cted_state);
> +
> +	return state !=3D expected_state;

'check' named functions should almost always be booleans and true should
be returned when the check confirms the expectation and false when it
doesn't.

> +}
> +
> +static bool sse_event_pending(unsigned long event_id)
> +{
> +	int ret;
> +	unsigned long status;
> +
> +	ret =3D sse_event_get_attr(event_id, SBI_SSE_ATTR_STATUS, &status);
> +	if (ret) {
> +		report_fail("Failed to get SSE event status");

output error received

> +		return false;
> +	}
> +
> +	return !!(status & BIT(SBI_SSE_ATTR_STATUS_PENDING_OFFSET));
> +}
> +
> +static void *sse_alloc_stack(void)
> +{
> +	return (alloc_page() + SSE_STACK_SIZE);

This function assumes SSE_STACK_SIZE < PAGE_SIZE. To catch a bug where
somebody increases SSE_STACK_SIZE it should either not assume that or
have an assert(SSE_STACK_SIZE < PAGE_SIZE) in it. (SSE_STACK_SIZE can
be =3D=3D PAGE_SIZE too as long as there's no chance it'll get used before
its first decrement. So 'assert(SSE_STACK_SIZE <=3D PAGE_SIZE)' would
need a comment stating that extra assumption. Or, just subtract 16
(to keep 16-byte alignment) right away like __smp_boot_secondary()
does.

> +}
> +
> +static void sse_free_stack(void *stack)
> +{
> +	free_page(stack - SSE_STACK_SIZE);
> +}
> +
> +static void sse_test_attr(unsigned long event_id)
> +{
> +	unsigned long ret, value =3D 0;
> +	unsigned long values[ARRAY_SIZE(ro_attrs)];
> +	struct sbiret sret;
> +	unsigned int i;
> +
> +	report_prefix_push("attrs");
> +
> +	for (i =3D 0; i < ARRAY_SIZE(ro_attrs); i++) {
> +		ret =3D sse_event_set_attr(event_id, ro_attrs[i], value);
> +		report(ret =3D=3D SBI_ERR_BAD_RANGE, "RO attribute %s not writable",
> +		       attr_names[ro_attrs[i]]);
> +	}
> +
> +	for (i =3D SBI_SSE_ATTR_STATUS; i <=3D SBI_SSE_ATTR_INTERRUPTED_A7; i++=
) {
> +		ret =3D sse_event_get_attr(event_id, i, &value);
> +		report(ret =3D=3D SBI_SUCCESS, "Read single attribute %s", attr_names[=
i]);
> +		/* Preferred Hart reset value is defined by SBI vendor and status inje=
ctable bit

please using opening wing /* for comments.

> +		 * also depends on the SBI implementation
> +		 */
> +		if (i !=3D SBI_SSE_ATTR_STATUS && i !=3D SBI_SSE_ATTR_PREFERRED_HART)
> +			report(value =3D=3D 0, "Attribute %s reset value is 0", attr_names[i]=
);

Filtering out SBI implementation dependant values is probably good enough
for these attributes, but we've also been making use of environment
variables for stuff like this.

> +	}
> +
> +	ret =3D sse_event_get_attrs(event_id, SBI_SSE_ATTR_STATUS, values,
> +				  SBI_SSE_ATTR_INTERRUPTED_A7 - SBI_SSE_ATTR_STATUS);
> +	report(ret =3D=3D SBI_SUCCESS, "Read multiple attributes");

Maybe we should save the values from single reads and compare them to the
values of the multiple read? Eh, either way...

> +
> +#if __riscv_xlen > 32

I prefer avoiding the ifdeffery with =


 if (__riscv_xlen > 32)

> +	ret =3D sse_event_set_attr(event_id, SBI_SSE_ATTR_PRIORITY, 0xFFFFFFFFU=
L + 1UL);
> +	report(ret =3D=3D SBI_ERR_INVALID_PARAM, "Write prio > 0xFFFFFFFF error=
");
> +#endif
> +
> +	ret =3D sse_event_set_attr(event_id, SBI_SSE_ATTR_CONFIG, ~SBI_SSE_ATTR=
_CONFIG_ONESHOT);
> +	report(ret =3D=3D SBI_ERR_INVALID_PARAM, "Write invalid config error");
> +
> +	if (sse_event_is_global(event_id)) {
> +		ret =3D sse_event_set_attr(event_id, SBI_SSE_ATTR_PREFERRED_HART, 0xFF=
FFFFFFUL);

I think 0xFFFFFFFF can theoretically be a valid hartid. This is one of
those places we could use an environment variable allowing the user to
decide what's invalid, but then use something like 0xFFFFFFFF for the
default of the environment variable isn't present.

> +		report(ret =3D=3D SBI_ERR_INVALID_PARAM, "Set invalid hart id error");
> +	} else {
> +		/* Set Hart on local event -> RO */
> +		ret =3D sse_event_set_attr(event_id, SBI_SSE_ATTR_PREFERRED_HART,
> +					 current_thread_info()->hartid);
> +		report(ret =3D=3D SBI_ERR_BAD_RANGE, "Set hart id on local event error=
");
> +	}
> +
> +	/* Set/get flags, sepc, a6, a7 */
> +	for (i =3D 0; i < ARRAY_SIZE(interrupted_attrs); i++) {
> +		ret =3D sse_event_get_attr(event_id, interrupted_attrs[i], &value);
> +		report(ret =3D=3D 0, "Get interrupted %s no error", attr_names[interru=
pted_attrs[i]]);
> +
> +		/* 0x1 is a valid value for all the interrupted attributes */
> +		ret =3D sse_event_set_attr(event_id, SBI_SSE_ATTR_INTERRUPTED_FLAGS, 0=
x1);

I guess sepc should need to be at least 2-byte aligned, possibly 4-byte
aligned. A strict SBI implementation might check that? Since 4 should also
be valid for all the attributes we could just use that. Or, we could use
sepc=3D4,flags=3D3,a6=3D2,a7=3D1 and then we'd be able to test when reading=
 back
that multi-attribute read/write is at least consistent (but it still
doesn't tell us if the SBI impl got the attributes mapped correctly
internally, just that the r/w interface is consistent)

> +		report(ret =3D=3D SBI_ERR_INVALID_STATE, "Set interrupted flags invali=
d state error");
> +	}
> +
> +	/* Attr_count =3D=3D 0 */
> +	sret =3D sse_event_get_attr_raw(event_id, SBI_SSE_ATTR_STATUS, 0, (unsi=
gned long) &value, 0);
> +	report(sret.error =3D=3D SBI_ERR_INVALID_PARAM, "Read attribute attr_co=
unt =3D=3D 0 error");
> +
> +	sret =3D sse_event_set_attr_raw(event_id, SBI_SSE_ATTR_STATUS, 0, (unsi=
gned long) &value, 0);
> +	report(sret.error =3D=3D SBI_ERR_INVALID_PARAM, "Write attribute attr_c=
ount =3D=3D 0 error");
> +
> +	/* Invalid attribute id */
> +	ret =3D sse_event_get_attr(event_id, SBI_SSE_ATTR_INTERRUPTED_A7 + 1, &=
value);
> +	report(ret =3D=3D SBI_ERR_BAD_RANGE, "Read invalid attribute error");
> +	ret =3D sse_event_set_attr(event_id, SBI_SSE_ATTR_INTERRUPTED_A7 + 1, v=
alue);
> +	report(ret =3D=3D SBI_ERR_BAD_RANGE, "Write invalid attribute error");
> +
> +	/* Misaligned phys address */
> +	sret =3D sse_event_get_attr_raw(event_id, SBI_SSE_ATTR_STATUS, 1,
> +				      ((unsigned long) &value | 0x1), 0);
> +	report(sret.error =3D=3D SBI_ERR_INVALID_ADDRESS, "Read attribute with =
invalid address error");
> +	sret =3D sse_event_set_attr_raw(event_id, SBI_SSE_ATTR_STATUS, 1,
> +				      ((unsigned long) &value | 0x1), 0);
> +	report(sret.error =3D=3D SBI_ERR_INVALID_ADDRESS, "Write attribute with=
 invalid address error");

Seems were getting a lot of tests repeated for read and write with the
only things changing being the function and the string Read/Write.
So could maybe use a helper function for those that does both.

> +
> +	report_prefix_pop();
> +}
> +
> +static void sse_test_register_error(unsigned long event_id)
> +{
> +	unsigned long ret;
> +
> +	report_prefix_push("register");
> +
> +	ret =3D sse_event_unregister(event_id);
> +	report(ret =3D=3D SBI_ERR_INVALID_STATE, "SSE unregister non registered=
 event");
> +
> +	ret =3D sse_event_register_raw(event_id, (void *) 0x1, NULL);
> +	report(ret =3D=3D SBI_ERR_INVALID_PARAM, "SSE register misaligned entry=
");
> +

What about a test for an invalid event_id? We should try to get full
coverage of the spec with our tests, so we have to pay extra attention
to error codes that describe more than one way they're returned.

Also, I see the description for SBI_ERR_INVALID_STATE says "The event is
not in UNUSED state.", but I think it should say "The event is valid but
is not in UNUSED state." Otherwise when we test with an invalid event_id
it's a bit ambiguous as to what will be returned.

> +	ret =3D sse_event_register_raw(event_id, (void *) sse_entry, NULL);
> +	report(ret =3D=3D SBI_SUCCESS, "SSE register ok");
> +	if (ret)
> +		goto done;
> +
> +	ret =3D sse_event_register_raw(event_id, (void *) sse_entry, NULL);
> +	report(ret =3D=3D SBI_ERR_INVALID_STATE, "SSE register twice failure");
> +	if (!ret)
> +		goto done;
> +
> +	ret =3D sse_event_unregister(event_id);
> +	report(ret =3D=3D SBI_SUCCESS, "SSE unregister ok");
> +
> +done:
> +	report_prefix_pop();
> +}
> +
> +struct sse_simple_test_arg {
> +	bool done;
> +	unsigned long expected_a6;
> +	unsigned long event_id;
> +};
> +
> +static void sse_simple_handler(void *data, struct pt_regs *regs, unsigne=
d int hartid)
> +{
> +	volatile struct sse_simple_test_arg *arg =3D data;

We have READ/WRITE_ONCE so we don't need the volatile here, we just need
to use them. I prefer using them as it helps annotate the code.

> +	int ret, i;
> +	const char *attr_name;
> +	unsigned long event_id =3D arg->event_id, value, prev_value, flags, att=
r;
> +	const unsigned long regs_len =3D (SBI_SSE_ATTR_INTERRUPTED_A7 - SBI_SSE=
_ATTR_INTERRUPTED_A6) +
> +				       1;

I guess your editor did that wrap automatically? Please keep the 1 on the
same line. Anyway we know there's only a6 and a7, so we can just use 2
without the math.

> +	unsigned long interrupted_state[regs_len];
> +
> +	if ((regs->status & SSTATUS_SPP) =3D=3D 0)
> +		report_fail("Interrupted S-mode");
> +
> +	if (hartid !=3D current_thread_info()->hartid)
> +		report_fail("Hartid correctly passed");
> +
> +	sse_check_state(event_id, SBI_SSE_STATE_RUNNING);
> +	if (sse_event_pending(event_id))
> +		report_fail("Event is not pending");

The above report_fail()'s should be report()'s

> +
> +	/* Set a6, a7, sepc, flags while running */
> +	for (i =3D 0; i < ARRAY_SIZE(interrupted_attrs); i++) {
> +		attr =3D interrupted_attrs[i];
> +		attr_name =3D attr_names[attr];
> +
> +		ret =3D sse_event_get_attr(event_id, attr, &prev_value);
> +		report(ret =3D=3D 0, "Get attr %s no error", attr_name);

If the test fails it'd be nice to have the error value, so we should do
something like

   report(ret =3D=3D 0, "Get attr %s no error (error =3D %ld)", attr_name, =
ret);

Same comment for similar report()'s

> +
> +		/* We test SBI_SSE_ATTR_INTERRUPTED_FLAGS below with specific flag val=
ues */
> +		if (attr =3D=3D SBI_SSE_ATTR_INTERRUPTED_FLAGS)
> +			continue;
> +
> +		ret =3D sse_event_set_attr(event_id, attr, 0xDEADBEEF + i);
> +		report(ret =3D=3D 0, "Set attr %s invalid state no error", attr_name);
> +
> +		ret =3D sse_event_get_attr(event_id, attr, &value);
> +		report(ret =3D=3D 0, "Get attr %s modified value no error", attr_name);
> +		report(value =3D=3D 0xDEADBEEF + i, "Get attr %s modified value ok", a=
ttr_name);
> +
> +		ret =3D sse_event_set_attr(event_id, attr, prev_value);
> +		report(ret =3D=3D 0, "Restore attr %s value no error", attr_name);
> +	}
> +
> +	/* Test all flags allowed for SBI_SSE_ATTR_INTERRUPTED_FLAGS*/
> +	attr =3D SBI_SSE_ATTR_INTERRUPTED_FLAGS;
> +	attr_name =3D attr_names[attr];
> +	ret =3D sse_event_get_attr(event_id, attr, &prev_value);
> +	report(ret =3D=3D 0, "Get attr %s no error", attr_name);
> +
> +	for (i =3D 0; i < ARRAY_SIZE(interrupted_flags); i++) {
> +		flags =3D interrupted_flags[i];
> +		ret =3D sse_event_set_attr(event_id, attr, flags);
> +		report(ret =3D=3D 0, "Set interrupted %s value no error", attr_name);

We should also output which flag we're writing in the report. I just
looked at the spec and see "bit[XLEN-1:4]: Reserved for future use and
should be zero". That needs to be "...MUST be zero" otherwise it's not
testable (and we should test it) nor can we add more flags later.

> +		ret =3D sse_event_get_attr(event_id, attr, &value);
> +		report(value =3D=3D flags, "Get attr %s modified value ok", attr_name);
> +	}
> +
> +	ret =3D sse_event_set_attr(event_id, attr, prev_value);
> +		report(ret =3D=3D 0, "Restore attr %s value no error", attr_name);
> +
> +	/* Try to change HARTID/Priority while running */
> +	if (sse_event_is_global(event_id)) {
> +		ret =3D sse_event_set_attr(event_id, SBI_SSE_ATTR_PREFERRED_HART,
> +					 current_thread_info()->hartid);
> +		report(ret =3D=3D SBI_ERR_INVALID_STATE, "Set hart id while running er=
ror");
> +	}
> +
> +	ret =3D sse_event_set_attr(event_id, SBI_SSE_ATTR_PRIORITY, 0);
> +	report(ret =3D=3D SBI_ERR_INVALID_STATE, "Set priority while running er=
ror");
> +
> +	ret =3D sse_event_get_attrs(event_id, SBI_SSE_ATTR_INTERRUPTED_A6, inte=
rrupted_state,
> +				  regs_len);
> +	report(ret =3D=3D SBI_SUCCESS, "Read interrupted context from SSE handl=
er ok");
> +	if (interrupted_state[0] !=3D arg->expected_a6)
> +		report_fail("Interrupted state a6 check ok");
> +	if (interrupted_state[1] !=3D SBI_EXT_SSE)
> +		report_fail("Interrupted state a7 check ok");

The above report_fail()'s should be report()'s
> +
> +	arg->done =3D true;
> +}
> +
> +static void sse_test_inject_simple(unsigned long event_id)
> +{
> +	unsigned long ret;
> +	struct sse_handler_arg args;
> +	volatile struct sse_simple_test_arg test_arg =3D {.event_id =3D event_i=
d, .done =3D 0};

nit: no need for .done =3D 0 and prefer 'false' for boolean.

> +
> +	args.handler =3D sse_simple_handler;
> +	args.handler_data =3D (void *) &test_arg;
                                    ^ nit: remove this space

> +	args.stack =3D sse_alloc_stack();
> +
> +	report_prefix_push("simple");
> +
> +	ret =3D sse_check_state(event_id, SBI_SSE_STATE_UNUSED);
> +	if (ret)
> +		goto done;
> +
> +	ret =3D sse_event_register(event_id, &args);
> +	report(ret =3D=3D SBI_SUCCESS, "SSE register no error");
> +	if (ret)
> +		goto done;
> +
> +	ret =3D sse_check_state(event_id, SBI_SSE_STATE_REGISTERED);
> +	if (ret)
> +		goto done;
> +
> +	/* Be sure global events are targeting the current hart */
> +	sse_global_event_set_current_hart(event_id);
> +
> +	ret =3D sse_event_enable(event_id);
> +	report(ret =3D=3D SBI_SUCCESS, "SSE enable no error");
> +	if (ret)
> +		goto done;
> +
> +	ret =3D sse_check_state(event_id, SBI_SSE_STATE_ENABLED);
> +	if (ret)
> +		goto done;
> +
> +	ret =3D sse_hart_mask();
> +	report(ret =3D=3D SBI_SUCCESS, "SSE hart mask no error");
> +
> +	ret =3D sse_event_inject(event_id, current_thread_info()->hartid);
> +	report(ret =3D=3D SBI_SUCCESS, "SSE injection masked no error");
> +	if (ret)
> +		goto done;
> +
> +	barrier();
> +	report(test_arg.done =3D=3D 0, "SSE event masked not handled");
> +
> +	/*
> +	 * When unmasking the SSE events, we expect it to be injected
> +	 * immediately so a6 should be SBI_EXT_SSE_HART_UNMASK
> +	 */
> +	test_arg.expected_a6 =3D SBI_EXT_SSE_HART_UNMASK;
> +	ret =3D sse_hart_unmask();
> +	report(ret =3D=3D SBI_SUCCESS, "SSE hart unmask no error");
> +
> +	barrier();
> +	report(test_arg.done =3D=3D 1, "SSE event unmasked handled");
> +	test_arg.done =3D 0;
> +	test_arg.expected_a6 =3D SBI_EXT_SSE_INJECT;
> +
> +	/* Set as oneshot and verify it is disabled */
> +	ret =3D sse_event_disable(event_id);
> +	report(ret =3D=3D 0, "Disable event ok");
> +	ret =3D sse_event_set_attr(event_id, SBI_SSE_ATTR_CONFIG, SBI_SSE_ATTR_=
CONFIG_ONESHOT);
> +	report(ret =3D=3D 0, "Set event attribute as ONESHOT");
> +	ret =3D sse_event_enable(event_id);
> +	report(ret =3D=3D 0, "Enable event ok");
> +
> +	ret =3D sse_event_inject(event_id, current_thread_info()->hartid);
> +	report(ret =3D=3D SBI_SUCCESS, "SSE injection 2 no error");
                                                  ^ what's this '2' mean?
> +	if (ret)
> +		goto done;
> +
> +	barrier();
> +	report(test_arg.done =3D=3D 1, "SSE event handled ok");
> +	test_arg.done =3D 0;
> +
> +	ret =3D sse_check_state(event_id, SBI_SSE_STATE_REGISTERED);
> +	if (ret)
> +		goto done;
> +
> +	/* Clear ONESHOT FLAG */
> +	sse_event_set_attr(event_id, SBI_SSE_ATTR_CONFIG, 0);
> +
> +	ret =3D sse_event_unregister(event_id);
> +	report(ret =3D=3D SBI_SUCCESS, "SSE unregister no error");
> +	if (ret)
> +		goto done;
> +
> +	sse_check_state(event_id, SBI_SSE_STATE_UNUSED);
> +
> +done:
> +	sse_free_stack(args.stack);
> +	report_prefix_pop();
> +}
> +
> +struct sse_foreign_cpu_test_arg {
> +	bool done;
> +	unsigned int expected_cpu;
> +	unsigned long event_id;
> +};
> +
> +static void sse_foreign_cpu_handler(void *data, struct pt_regs *regs, un=
signed int hartid)
> +{
> +	volatile struct sse_foreign_cpu_test_arg *arg =3D data;

Same READ/WRITE_ONCE comment as above.

> +
> +	/* For arg content to be visible */
> +	smp_rmb();
> +	if (arg->expected_cpu !=3D current_thread_info()->cpu)
> +		report_fail("Received event on CPU (%d), expected CPU (%d)",
> +			    current_thread_info()->cpu, arg->expected_cpu);
> +
> +	arg->done =3D true;
> +	/* For arg update to be visible for other CPUs */
> +	smp_wmb();
> +}
> +
> +struct sse_local_per_cpu {
> +	struct sse_handler_arg args;
> +	unsigned long ret;
> +};
> +
> +struct sse_local_data {
> +	unsigned long event_id;
> +	struct sse_local_per_cpu *cpu_args[NR_CPUS];

Could dynamically allocate cpu_args in sse_test_inject_local() to only be
nr_cpus large, but it doesn't really matter.

> +};
> +
> +static void sse_register_enable_local(void *data)
> +{
> +	struct sse_local_data *local_data =3D data;
> +	struct sse_local_per_cpu *cpu_arg =3D local_data->cpu_args[current_thre=
ad_info()->cpu];
> +
> +	cpu_arg->ret =3D sse_event_register(local_data->event_id, &cpu_arg->arg=
s);
> +	if (cpu_arg->ret)

Shouldn't we output something here?

> +		return;
> +
> +	cpu_arg->ret =3D sse_event_enable(local_data->event_id);
> +}
> +
> +static void sse_disable_unregister_local(void *data)
> +{
> +	struct sse_local_data *local_data =3D data;
> +	struct sse_local_per_cpu *cpu_arg =3D local_data->cpu_args[current_thre=
ad_info()->cpu];
> +
> +	cpu_arg->ret =3D sse_event_disable(local_data->event_id);
> +	if (cpu_arg->ret)

Shouldn't we output something here?

> +		return;
> +
> +	cpu_arg->ret =3D sse_event_unregister(local_data->event_id);
> +}
> +
> +static void sse_test_inject_local(unsigned long event_id)
> +{
> +	int cpu;
> +	unsigned long ret;
> +	struct sse_local_data local_data;
> +	struct sse_local_per_cpu *cpu_arg;
> +	volatile struct sse_foreign_cpu_test_arg test_arg =3D {.event_id =3D ev=
ent_id};
> +
> +	report_prefix_push("local_dispatch");
> +	local_data.event_id =3D event_id;

Init this above with

  struct sse_local_data local_data =3D {.event_id =3D event_id}

> +
> +	for_each_online_cpu(cpu) {
> +		cpu_arg =3D calloc(1, sizeof(struct sse_handler_arg));
> +
> +		cpu_arg->args.stack =3D sse_alloc_stack();
> +		cpu_arg->args.handler =3D sse_foreign_cpu_handler;
> +		cpu_arg->args.handler_data =3D (void *)&test_arg;
> +		local_data.cpu_args[cpu] =3D cpu_arg;
> +	}
> +
> +	on_cpus(sse_register_enable_local, &local_data);
> +	for_each_online_cpu(cpu) {
> +		if (local_data.cpu_args[cpu]->ret)
> +			report_abort("CPU failed to register/enable SSE event");
> +
> +		test_arg.expected_cpu =3D cpu;
> +		/* For test_arg content to be visible for other CPUs */
> +		smp_wmb();
> +		ret =3D sse_event_inject(event_id, cpus[cpu].hartid);
> +		if (ret)
> +			report_abort("CPU failed to register/enable SSE event");

copy+paste mistake, error message should be different than above

> +
> +		while (!test_arg.done) {
> +			/* For test_arg update to be visible */
> +			smp_rmb();
> +		}
> +
> +		test_arg.done =3D false;

Why not use a different test_arg for each hart and then one
for_each_online_cpu() loop to inject events and another loop
to check if they all completed after some delay (plus spin
on done if necessary)?

> +	}
> +
> +	on_cpus(sse_disable_unregister_local, &local_data);
> +	for_each_online_cpu(cpu) {
> +		if (local_data.cpu_args[cpu]->ret)
> +			report_abort("CPU failed to disable/unregister SSE event");
> +	}
> +
> +	for_each_online_cpu(cpu) {
> +		cpu_arg =3D local_data.cpu_args[cpu];
> +
> +		sse_free_stack(cpu_arg->args.stack);
> +	}
> +
> +	report_pass("local event dispatch on all CPUs");
> +	report_prefix_pop();
> +
> +}
> +
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
> +
> +done:
> +	ret =3D sse_event_unregister(event_id);
> +	if (ret)
> +		report_fail("Failed to unregister event");
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
> +	if (next) {
> +		sse_event_inject(next->evt, current_thread_info()->hartid);
> +		if (sse_event_pending(next->evt))
> +			report_fail("Higher priority event is pending");
> +		if (!next->called)
> +			report_fail("Higher priority event was not handled");
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
> +	if (ret)
> +		return 0;
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
> +
> +	ret =3D sse_hart_unmask();
> +	report(ret =3D=3D SBI_SUCCESS, "SSE hart no error ok");
> +	ret =3D sse_hart_unmask();
> +	report(ret =3D=3D SBI_ERR_ALREADY_STOPPED, "SSE hart unmask twice error=
 ok");
> +
> +	ret =3D sse_hart_mask();
> +	report(ret =3D=3D SBI_SUCCESS, "SSE hart mask no error");
> +	ret =3D sse_hart_mask();
> +	report(ret =3D=3D SBI_ERR_ALREADY_STARTED, "SSE hart mask twice ok");
> +}
> +
> +void check_sse(void)
> +{
> +	unsigned long i, event;
> +
> +	report_prefix_push("sse");
> +	sse_check_mask();
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


-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
