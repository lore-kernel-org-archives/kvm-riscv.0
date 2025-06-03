Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9513FC5AD49
	for <kvm-riscv@archiver.kernel.org>; Tue,  3 Jun 2025 09:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ANgtwJT6TGfJwpjt5Q3cv64NZZ+7DqsCKmif5hvMwd0=; b=rYFgPR1yxSFeLE
	4kmWQg17WXljGDdFvZM8V7i8cJotOm0CLLWaX0rvgZ+UeL2vYoUgX/LoKb8GUw/KWMR+zbqUlN2hF
	f280XuKo6bznE/M52PcwCurzSvPrb8pHpBmb1jQv1BznABJyloBUcCcT4HdkYeQQXCu+lnFqNZfo+
	G9G0/9oaecwURRb0wT8hueyaAIzfnXR7vOEXpi4DQKA2uN4P4N6unX2PBRym/KGMDXFV7F1atsxIL
	GrZca3tZFJZTMYTJYCDLQLFy2k0/zT6yBR8yZoecJMeCEhSjcdraRDEfUPzXbIeRFUXjFQ13I/6n2
	pFe8fWzt71P1UMVUWZNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMNts-0000000AVYD-0Jhb;
	Tue, 03 Jun 2025 09:25:40 +0000
Received: from out-178.mta0.migadu.com ([2001:41d0:1004:224b::b2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMNeM-0000000ASBN-380N
	for kvm-riscv@lists.infradead.org;
	Tue, 03 Jun 2025 09:09:40 +0000
Date: Tue, 3 Jun 2025 11:09:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748941775;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HosKKhKaeAxS0BiblgoplCxniIg8FN66wGDmGUgRL0s=;
	b=KCT0BjQjtCVrutQNA760Pedbb11ZG6XjGVOCuAczocX6KAEUJyT273u3DiHowXFp8hnIKx
	gbNDhJKE6Gca+oVUrcCAVzTw+oAcMOLyeji4xJyCzlpyUIeIOyTCt8EmzFrxJk2lHegR+9
	tFXXrr2FbM+wWYF6oM35ZXzxphbenYo=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	Andrew Jones <ajones@ventanamicro.com>, Ved Shanbhogue <ved@rivosinc.com>
Subject: Re: [PATCH 3/3] riscv: Add ISA double trap extension testing
Message-ID: <20250603-46e84d5167307b38c90a06b5@orel>
References: <20250523075341.1355755-1-cleger@rivosinc.com>
 <20250523075341.1355755-4-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250523075341.1355755-4-cleger@rivosinc.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_020938_999338_91DD1716 
X-CRM114-Status: GOOD (  41.45  )
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

On Fri, May 23, 2025 at 09:53:10AM +0200, Cl=E9ment L=E9ger wrote:
> This test allows to test the double trap implementation of hardware as
> well as the SBI FWFT and SSE support for double trap. The tests will try
> to trigger double trap using various sequences and will test to receive
> the SSE double trap event if supported.
> =

> It is provided as a separate test from the SBI one for two reasons:
> - It isn't specifically testing SBI "per se".
> - It ends up by trying to crash into in M-mode.
> =

> Currently, the test uses a page fault to raise a trap programatically.
> Some concern was raised by a github user on the original branch [1]
> saying that the spec doesn't mandate any trap to be delegatable and that
> we would need a way to detect which ones are delegatable. I think we can
> safely assume that PAGE FAULT is delagatable and if a hardware that does
> not have support comes up then it will probably be the vendor
> responsibility to provide a way to do so.
> =

> Link: https://github.com/clementleger/kvm-unit-tests/issues/1 [1]
> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> ---
>  riscv/Makefile      |   1 +
>  lib/riscv/asm/csr.h |   1 +
>  riscv/isa-dbltrp.c  | 189 ++++++++++++++++++++++++++++++++++++++++++++
>  riscv/unittests.cfg |   5 ++
>  4 files changed, 196 insertions(+)
>  create mode 100644 riscv/isa-dbltrp.c
> =

> diff --git a/riscv/Makefile b/riscv/Makefile
> index 11e68eae..d71c9d2e 100644
> --- a/riscv/Makefile
> +++ b/riscv/Makefile
> @@ -14,6 +14,7 @@ tests =3D
>  tests +=3D $(TEST_DIR)/sbi.$(exe)
>  tests +=3D $(TEST_DIR)/selftest.$(exe)
>  tests +=3D $(TEST_DIR)/sieve.$(exe)
> +tests +=3D $(TEST_DIR)/isa-dbltrp.$(exe)
>  =

>  all: $(tests)
>  =

> diff --git a/lib/riscv/asm/csr.h b/lib/riscv/asm/csr.h
> index 3e4b5fca..6a8e0578 100644
> --- a/lib/riscv/asm/csr.h
> +++ b/lib/riscv/asm/csr.h
> @@ -18,6 +18,7 @@
>  =

>  #define SR_SIE			_AC(0x00000002, UL)
>  #define SR_SPP			_AC(0x00000100, UL)
> +#define SR_SDT			_AC(0x01000000, UL) /* Supervisor Double Trap */
>  =

>  /* Exception cause high bit - is an interrupt if set */
>  #define CAUSE_IRQ_FLAG		(_AC(1, UL) << (__riscv_xlen - 1))
> diff --git a/riscv/isa-dbltrp.c b/riscv/isa-dbltrp.c
> new file mode 100644
> index 00000000..174aee2a
> --- /dev/null
> +++ b/riscv/isa-dbltrp.c
> @@ -0,0 +1,189 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * SBI verification
> + *
> + * Copyright (C) 2025, Rivos Inc., Cl=E9ment L=E9ger <cleger@rivosinc.co=
m>
> + */
> +#include <alloc.h>
> +#include <alloc_page.h>
> +#include <libcflat.h>
> +#include <stdlib.h>
> +
> +#include <asm/csr.h>
> +#include <asm/page.h>
> +#include <asm/processor.h>
> +#include <asm/ptrace.h>
> +#include <asm/sbi.h>
> +
> +#include <sbi-tests.h>
> +
> +static bool double_trap;
> +static bool set_sdt =3D true;
> +
> +#define GEN_TRAP()								\
> +do {										\
> +	void *ptr =3D NULL;							\
> +	unsigned long value =3D 0;						\
> +	asm volatile(								\
> +	"	.option push\n"							\
> +	"	.option arch,-c\n"						\
> +	"	sw %0, 0(%1)\n"							\
> +	"	.option pop\n"							\
> +	: : "r"(value), "r"(ptr) : "memory");					\

nit: need some spaces

 "r" (value), "r" (ptr)

> +} while (0)
> +
> +static void syscall_trap_handler(struct pt_regs *regs)

This is a page fault handler, not a syscall.

> +{
> +	if (set_sdt)
> +		csr_set(CSR_SSTATUS, SR_SDT);
> +
> +	if (double_trap) {
> +		double_trap =3D false;
> +		GEN_TRAP();
> +	}
> +
> +	/* Skip trapping instruction */
> +	regs->epc +=3D 4;
> +}
> +
> +static bool sse_dbltrp_called;
> +
> +static void sse_dbltrp_handler(void *data, struct pt_regs *regs, unsigne=
d int hartid)
> +{
> +	struct sbiret ret;
> +	unsigned long flags;
> +	unsigned long expected_flags =3D SBI_SSE_ATTR_INTERRUPTED_FLAGS_SSTATUS=
_SPP |
> +				       SBI_SSE_ATTR_INTERRUPTED_FLAGS_SSTATUS_SDT;
> +
> +	ret =3D sbi_sse_read_attrs(SBI_SSE_EVENT_LOCAL_DOUBLE_TRAP, SBI_SSE_ATT=
R_INTERRUPTED_FLAGS, 1,
> +				 &flags);
> +	sbiret_report_error(&ret, SBI_SUCCESS, "Get double trap event flags");
> +	report(flags =3D=3D expected_flags, "SSE flags =3D=3D 0x%lx", expected_=
flags);
> +
> +	sse_dbltrp_called =3D true;
> +
> +	/* Skip trapping instruction */
> +	regs->epc +=3D 4;
> +}
> +
> +static void sse_double_trap(void)
> +{
> +	struct sbiret ret;
> +
> +	struct sbi_sse_handler_arg handler_arg =3D {
> +		.handler =3D sse_dbltrp_handler,
> +		.stack =3D alloc_page() + PAGE_SIZE,
> +	};
> +
> +	report_prefix_push("sse");
> +
> +	ret =3D sbi_sse_hart_unmask();
> +	if (!sbiret_report_error(&ret, SBI_SUCCESS, "SSE hart unmask ok"))
> +		goto out;

The unmasking failed, but the out label takes us to a mask.

> +
> +	ret =3D sbi_sse_register(SBI_SSE_EVENT_LOCAL_DOUBLE_TRAP, &handler_arg);
> +	if (ret.error =3D=3D SBI_ERR_NOT_SUPPORTED) {
> +		report_skip("SSE double trap event is not supported");
> +		goto out;
> +	}
> +	sbiret_report_error(&ret, SBI_SUCCESS, "SSE double trap register");
> +
> +	ret =3D sbi_sse_enable(SBI_SSE_EVENT_LOCAL_DOUBLE_TRAP);
> +	if (!sbiret_report_error(&ret, SBI_SUCCESS, "SSE double trap enable"))
> +		goto out_unregister;
> +
> +	/*
> +	 * Generate a double crash so that an SSE event should be generated. Th=
e SPEC (ISA nor SBI)
> +	 * does not explicitly tell that if supported it should generate an SSE=
 event but that's
> +	 * a reasonable assumption to do so if both FWFT and SSE are supported.

This is something to raise in a tech-prs call, because it sounds like we
need another paragraph for FWFT which states when DOUBLE_TRAP is enabled
and SSE is supported that SSE local double trap events will be raised. Or,
we need another FWFT feature that allows S-mode to request that behavior
be enabled/disabled when SSE is supported (and M-mode can decide yes/no
to that request).

> +	 */
> +	set_sdt =3D true;
> +	double_trap =3D true;

WRITE_ONCE(set_sdt, true);
WRITE_ONCE(double_trap, true);

> +	GEN_TRAP();
> +
> +	report(sse_dbltrp_called, "SSE double trap event generated");

READ_ONCE(sse_dbltrp_called)

> +
> +	ret =3D sbi_sse_disable(SBI_SSE_EVENT_LOCAL_DOUBLE_TRAP);
> +	sbiret_report_error(&ret, SBI_SUCCESS, "SSE double trap disable");
> +out_unregister:
> +	ret =3D sbi_sse_unregister(SBI_SSE_EVENT_LOCAL_DOUBLE_TRAP);
> +	sbiret_report_error(&ret, SBI_SUCCESS, "SSE double trap unregister");
> +
> +out:
> +	sbi_sse_hart_mask();
> +	free_page(handler_arg.stack - PAGE_SIZE);
> +
> +	report_prefix_pop();
> +}
> +
> +static void check_double_trap(void)
> +{
> +	struct sbiret ret;
> +
> +	/* Disable double trap */
> +	ret =3D sbi_fwft_set(SBI_FWFT_DOUBLE_TRAP, 0, 0);
> +	sbiret_report_error(&ret, SBI_SUCCESS, "Set double trap enable feature =
value =3D=3D 0");
> +	ret =3D sbi_fwft_get(SBI_FWFT_DOUBLE_TRAP);
> +	sbiret_report(&ret, SBI_SUCCESS, 0, "Get double trap enable feature val=
ue =3D=3D 0");
> +
> +	install_exception_handler(EXC_STORE_PAGE_FAULT, syscall_trap_handler);
> +
> +	double_trap =3D true;

WRITE_ONCE(double_trap, true);

> +	GEN_TRAP();
> +	report_pass("Double trap disabled, trap first time ok");
> +
> +	/* Enable double trap */
> +	ret =3D sbi_fwft_set(SBI_FWFT_DOUBLE_TRAP, 1, 1);

Why lock it?

> +	sbiret_report_error(&ret, SBI_SUCCESS, "Set double trap enable feature =
value =3D=3D 1");
> +	ret =3D sbi_fwft_get(SBI_FWFT_DOUBLE_TRAP);
> +	if (!sbiret_report(&ret, SBI_SUCCESS, 1, "Get double trap enable featur=
e value =3D=3D 1"))
> +		return;
> +
> +	/* First time, clear the double trap flag (SDT) so that it doesn't gene=
rate a double trap */
> +	set_sdt =3D false;
> +	double_trap =3D true;

WRITE_ONCE(set_sdt, true);
WRITE_ONCE(double_trap, true);

> +	GEN_TRAP();
> +	report_pass("Trapped twice allowed ok");
> +
> +	if (sbi_probe(SBI_EXT_SSE))
> +		sse_double_trap();
> +	else
> +		report_skip("SSE double trap event will not be tested, extension is no=
t available");
> +
> +	/*
> +	 * Second time, keep the double trap flag (SDT) and generate another tr=
ap, this should

Third time if we did the SSE test.

> +	 * generate a double trap. Since there is no SSE handler registered, it=
 should crash to
> +	 * M-mode.

No SSE handler that we know of... sse_double_trap() should return
some error if it fails to unregister and then we should skip this
test in that case.

> +	 */
> +	set_sdt =3D true;
> +	double_trap =3D true;

WRITE_ONCE(set_sdt, true);
WRITE_ONCE(double_trap, true);

> +	report_info("Should generate a double trap and crash !");
> +	GEN_TRAP();
> +	report_fail("Should have crashed !");

nit: Put the '!' next to the last word.

I think this M-mode crash test should be optional. We can make it optional
on an environment variable since we already use environment variables for
other optional tests. We even have env_or_skip() in riscv/sbi-tests.h for
that purpose.

> +}
> +
> +int main(int argc, char **argv)
> +{
> +	struct sbiret ret;
> +
> +	report_prefix_push("dbltrp");
> +
> +	if (!sbi_probe(SBI_EXT_FWFT)) {
> +		report_skip("FWFT extension is not available, can not enable double tr=
aps");
> +		goto out;
> +	}
> +
> +	ret =3D sbi_fwft_get(SBI_FWFT_DOUBLE_TRAP);
> +	if (ret.value =3D=3D SBI_ERR_NOT_SUPPORTED) {
> +		report_skip("SBI_FWFT_DOUBLE_TRAP is not supported !");

nit: Put the '!' next to the last word.

> +		goto out;
> +	}
> +
> +	if (sbiret_report_error(&ret, SBI_SUCCESS, "SBI_FWFT_DOUBLE_TRAP get va=
lue"))
> +		check_double_trap();
> +
> +out:
> +	report_prefix_pop();
> +
> +	return report_summary();
> +}
> diff --git a/riscv/unittests.cfg b/riscv/unittests.cfg
> index 2eb760ec..757e6027 100644
> --- a/riscv/unittests.cfg
> +++ b/riscv/unittests.cfg
> @@ -18,3 +18,8 @@ groups =3D selftest
>  file =3D sbi.flat
>  smp =3D $MAX_SMP
>  groups =3D sbi
> +
> +[dbltrp]
> +file =3D isa-dbltrp.flat
> +smp =3D $MAX_SMP

The test doesn't appear to require multiple harts.

> +groups =3D isa

groups =3D isa sbi

> -- =

> 2.49.0
>

Thanks,
drew

-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
