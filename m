Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D38D0C5AD49
	for <kvm-riscv@archiver.kernel.org>; Tue,  3 Jun 2025 16:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Idy3B9y0G3WB3JugF8xwKpk739aa4QZ7EKKGQV2ncTE=; b=gPuGySIZsvMPUf
	BgJVSEDeaaiNJa6tpnzUtDejYfemd0LZHTpOe1x9VgRGtsr3o//Iu02x1uJrYrF4Aq+TGe+v3y9+0
	fJjDcvLzHk79dg6bLMJESRe3S0vFOJFS6foN9DP+4nHLwYAxcqzpehn4n8eth+KHFQ0mFbHfDX1Qg
	Tgg/EiUJuBJ9CIoMGwYQYhg2GdVx5OSIIQoQ7XqJDbcyarpODU8Pj/Xm/u2AXu2lT+v+lMdTrrwbU
	R8lZ9sO0Y25fYsURk6QwE9bEI1oqLAD6n2K0T3++YmCP9RoWQVRLXQ0z0U8LoETtfuA65lJZpVfgH
	1i/bwf+5NR+wi5TiLKlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMUTC-0000000BOWe-1vWi;
	Tue, 03 Jun 2025 16:26:34 +0000
Received: from out-179.mta0.migadu.com ([91.218.175.179])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMUSj-0000000BOP9-0ZQg
	for kvm-riscv@lists.infradead.org;
	Tue, 03 Jun 2025 16:26:08 +0000
Date: Tue, 3 Jun 2025 18:25:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748967961;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZBAniNnGiElPg6mOkY82dWGbV7a3yKmZ4sg11NxT1WY=;
	b=KQkJyGm5Qrl8fLvpuyX0P7CKRdbSAL5suxcTKEGgfMEP+4LARluTvrfY9ONB0Vra7zFIMa
	D7ciX/ORgsTeBvIBqcC3P9Er77LwBh5mddYDtVrv3Q7Su3Ic9/xXYh5UtYriIiTLcIS6Mv
	fFYckZ5amTjUrfqvX7EQlpvlriP4VkE=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	Andrew Jones <ajones@ventanamicro.com>, Ved Shanbhogue <ved@rivosinc.com>
Subject: Re: [kvm-unit-tests v2 2/2] riscv: Add ISA double trap extension
 testing
Message-ID: <20250603-1e175dd9e60c1bf2a52dbfc9@orel>
References: <20250603154652.1712459-1-cleger@rivosinc.com>
 <20250603154652.1712459-3-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250603154652.1712459-3-cleger@rivosinc.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_092607_258026_BE6E26F2 
X-CRM114-Status: GOOD (  38.67  )
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

On Tue, Jun 03, 2025 at 05:46:50PM +0200, Cl=E9ment L=E9ger wrote:
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
> safely assume that PAGE FAULT is delegatable and if a hardware that does
> not have support comes up then it will probably be the vendor
> responsibility to provide a way to do so.
> =

> Link: https://github.com/clementleger/kvm-unit-tests/issues/1 [1]
> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> ---
>  riscv/Makefile            |   1 +
>  lib/riscv/asm/csr.h       |   1 +
>  lib/riscv/asm/processor.h |  10 ++
>  riscv/isa-dbltrp.c        | 211 ++++++++++++++++++++++++++++++++++++++
>  riscv/unittests.cfg       |   4 +
>  5 files changed, 227 insertions(+)
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
> diff --git a/lib/riscv/asm/processor.h b/lib/riscv/asm/processor.h
> index 40104272..87a41312 100644
> --- a/lib/riscv/asm/processor.h
> +++ b/lib/riscv/asm/processor.h
> @@ -48,6 +48,16 @@ static inline void ipi_ack(void)
>  	csr_clear(CSR_SIP, IE_SSIE);
>  }
>  =

> +static inline void local_dlbtrp_enable(void)
> +{
> +	csr_set(CSR_SSTATUS, SR_SDT);
> +}
> +
> +static inline void local_dlbtrp_disable(void)
> +{
> +	csr_clear(CSR_SSTATUS, SR_SDT);
> +}
> +
>  void install_exception_handler(unsigned long cause, void (*handler)(stru=
ct pt_regs *));
>  void install_irq_handler(unsigned long cause, void (*handler)(struct pt_=
regs *));
>  void do_handle_exception(struct pt_regs *regs);
> diff --git a/riscv/isa-dbltrp.c b/riscv/isa-dbltrp.c
> new file mode 100644
> index 00000000..a4545096
> --- /dev/null
> +++ b/riscv/isa-dbltrp.c
> @@ -0,0 +1,211 @@
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
> +static bool clear_sdt;
> +
> +#define INSN_LEN(insn)			((((insn) & 0x3) < 0x3) ? 2 : 4)
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
> +	: : "r" (value), "r" (ptr) : "memory");					\
> +} while (0)
> +
> +static void pagefault_trap_handler(struct pt_regs *regs)
> +{
> +	if (READ_ONCE(clear_sdt))
> +		local_dlbtrp_disable();
> +
> +	if (READ_ONCE(double_trap)) {
> +		WRITE_ONCE(double_trap, false);
> +		GEN_TRAP();
> +	}
> +
> +	/* Skip trapping instruction */
> +	regs->epc +=3D 4;
> +
> +	local_dlbtrp_enable();
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
> +	WRITE_ONCE(sse_dbltrp_called, true);
> +
> +	/* Skip trapping instruction */
> +	regs->epc +=3D 4;
> +}
> +
> +static int sse_double_trap(void)
> +{
> +	struct sbiret ret;
> +	int err =3D 0;
> +
> +	struct sbi_sse_handler_arg handler_arg =3D {
> +		.handler =3D sse_dbltrp_handler,
> +		.stack =3D alloc_page() + PAGE_SIZE,
> +	};
> +
> +	report_prefix_push("sse");
> +
> +	ret =3D sbi_sse_hart_unmask();
> +	if (!sbiret_report_error(&ret, SBI_SUCCESS, "SSE hart unmask ok")) {
> +		report_skip("Failed to unmask SSE events, skipping test");
> +		goto out_free_page;
> +	}
> +
> +	ret =3D sbi_sse_register(SBI_SSE_EVENT_LOCAL_DOUBLE_TRAP, &handler_arg);
> +	if (ret.error =3D=3D SBI_ERR_NOT_SUPPORTED) {
> +		report_skip("SSE double trap event is not supported");
> +		goto out_mask_sse;
> +	}
> +	sbiret_report_error(&ret, SBI_SUCCESS, "SSE double trap register");
> +
> +	ret =3D sbi_sse_enable(SBI_SSE_EVENT_LOCAL_DOUBLE_TRAP);
> +	if (!sbiret_report_error(&ret, SBI_SUCCESS, "SSE double trap enable")) {
> +		err =3D ret.error;

I'm not sure we need to return an error for this case. We won't be leaving
an SSE event handler registered.

> +		goto out_unregister;
> +	}
> +
> +	/*
> +	 * Generate a double crash so that an SSE event should be generated. Th=
e SPEC (ISA nor SBI)
> +	 * does not explicitly tell that if supported it should generate an SSE=
 event but that's
> +	 * a reasonable assumption to do so if both FWFT and SSE are supported.
> +	 */
> +	WRITE_ONCE(clear_sdt, false);
> +	WRITE_ONCE(double_trap, true);
> +	GEN_TRAP();
> +
> +	report(READ_ONCE(sse_dbltrp_called), "SSE double trap event generated");
> +
> +	ret =3D sbi_sse_disable(SBI_SSE_EVENT_LOCAL_DOUBLE_TRAP);
> +	sbiret_report_error(&ret, SBI_SUCCESS, "SSE double trap disable");
> +
> +out_unregister:
> +	ret =3D sbi_sse_unregister(SBI_SSE_EVENT_LOCAL_DOUBLE_TRAP);
> +	sbiret_report_error(&ret, SBI_SUCCESS, "SSE double trap unregister");

Needs to be

 if (!sbiret_report_error(&ret, SBI_SUCCESS, "SSE double trap unregister"))
    err =3D ret.error;

> +
> +out_mask_sse:
> +	sbi_sse_hart_mask();
> +
> +out_free_page:
> +	free_page(handler_arg.stack - PAGE_SIZE);
> +	report_prefix_pop();
> +
> +	return err;
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
> +	install_exception_handler(EXC_STORE_PAGE_FAULT, pagefault_trap_handler);
> +
> +	WRITE_ONCE(clear_sdt, true);
> +	WRITE_ONCE(double_trap, true);
> +	GEN_TRAP();
> +	report_pass("Double trap disabled, trap first time ok");
> +
> +	/* Enable double trap */
> +	ret =3D sbi_fwft_set(SBI_FWFT_DOUBLE_TRAP, 1, 0);
> +	sbiret_report_error(&ret, SBI_SUCCESS, "Set double trap enable feature =
value =3D=3D 1");
> +	ret =3D sbi_fwft_get(SBI_FWFT_DOUBLE_TRAP);
> +	if (!sbiret_report(&ret, SBI_SUCCESS, 1, "Get double trap enable featur=
e value =3D=3D 1"))
> +		return;
> +
> +	/* First time, clear the double trap flag (SDT) so that it doesn't gene=
rate a double trap */
> +	WRITE_ONCE(clear_sdt, true);
> +	WRITE_ONCE(double_trap, true);
> +
> +	GEN_TRAP();
> +	report_pass("Trapped twice allowed ok");
> +
> +	if (sbi_probe(SBI_EXT_SSE)) {
> +		if (sse_double_trap()) {
> +			report_skip("Could not correctly unregister SSE event, skipping last =
test");
> +			return;
> +		}
> +	} else {
> +		report_skip("SSE double trap event will not be tested, extension is no=
t available");

Missing return

> +	}

How about rearranging as

 if (!sbi_probe(SBI_EXT_SSE)) {
    report_skip("SSE double trap event will not be tested, extension is not=
 available");
    return;
 }
 if (sse_double_trap()) {
    report_skip("Could not correctly unregister SSE event, skipping last te=
st");
    return;
 }

> +
> +	if (!env_or_skip("DOUBLE_TRAP_TEST_CRASH"))
> +		return;
> +
> +	/*
> +	 * Third time, keep the double trap flag (SDT) and generate another tra=
p, this should
> +	 * generate a double trap. Since there is no SSE handler registered, it=
 should crash to
> +	 * M-mode.
> +	 */
> +	WRITE_ONCE(clear_sdt, false);
> +	WRITE_ONCE(double_trap, true);
> +	report_info("Should generate a double trap and crash!");
> +	GEN_TRAP();
> +	report_fail("Should have crashed!");
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
> +	if (ret.error =3D=3D SBI_ERR_NOT_SUPPORTED) {
> +		report_skip("SBI_FWFT_DOUBLE_TRAP is not supported!");
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
> index 2eb760ec..286e1cc7 100644
> --- a/riscv/unittests.cfg
> +++ b/riscv/unittests.cfg
> @@ -18,3 +18,7 @@ groups =3D selftest
>  file =3D sbi.flat
>  smp =3D $MAX_SMP
>  groups =3D sbi
> +
> +[dbltrp]
> +file =3D isa-dbltrp.flat
> +groups =3D isa sbi
> -- =

> 2.49.0
>

Thanks,
drew

-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
