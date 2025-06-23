Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C00C77B7C
	for <kvm-riscv@archiver.kernel.org>; Mon, 23 Jun 2025 21:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/k8uDvvibBun/gCWihOBV79BqIEJqUEf8BZnfRHaZY0=; b=r1sHE3hLKk/9ij
	gPDiq3LO/ewIK4nhL1T4Tb3NCdht1uhe1daP+OdYIb5UZ7SWpG9i+s3Ej0DYSFuP/RwKbNGBdOJuD
	jFArciBtV2yLrdXduuqTIedX01kLOcfdDjSnhfoJ+LqhD8iTEiesrZWD9XidFNki3+btMC4B8dFuL
	WG7lSsoRMJW8X41fZlx9YyJANP3YJriofdsnWpBkNtuBpZhRGTl9/tsybPwLUtdLBJdtqqx27ELdL
	J+JjnRgk6cDIQLrIJekJDBwkZIkdZPqKkJFX7lP7TD4yjRpmNd3i44ZtPbKGJN4/++gjOhe2zkv/7
	a+dht+70+1AgQse058XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uToY9-00000003zoN-2Am4;
	Mon, 23 Jun 2025 21:17:57 +0000
Received: from out-188.mta0.migadu.com ([2001:41d0:1004:224b::bc])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTk33-00000003QJQ-0fwc
	for kvm-riscv@lists.infradead.org;
	Mon, 23 Jun 2025 16:29:35 +0000
Date: Mon, 23 Jun 2025 18:29:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750696167;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M7nD68AZ9bBeskPuhwyqlzdxDvnk/wliv4c8riomEwQ=;
	b=HpZ3RjBMraQ0SuWRyrgkcI+mCAMDhgXGKXjmhouq/7gl1D4AIklCH9AP4VKZVzMR0Hib+Q
	wUVyE/SYDZFNMtHJVWpJfOfp52XmsAEzx/l5JGwxRSLaMTUDt2EaSmhW8oxloBkINLvVhX
	N2Cq/jgDDOC+UeM29Bh92+ctmwX1JPI=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	Andrew Jones <ajones@ventanamicro.com>
Subject: Re: [kvm-unit-tests v3 2/2] riscv: Add ISA double trap extension
 testing
Message-ID: <20250623-0f0c86d875c2701f3a17d87b@orel>
References: <20250616115900.957266-1-cleger@rivosinc.com>
 <20250616115900.957266-3-cleger@rivosinc.com>
 <73e94306-91e4-4fd3-bc43-79872efc1b52@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <73e94306-91e4-4fd3-bc43-79872efc1b52@rivosinc.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_092933_723949_0C7AED6B 
X-CRM114-Status: GOOD (  31.96  )
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

On Thu, Jun 19, 2025 at 09:59:47AM +0200, Cl=E9ment L=E9ger wrote:
> =

> =

> On 16/06/2025 13:59, Cl=E9ment L=E9ger wrote:
> > This test allows to test the double trap implementation of hardware as
> > well as the SBI FWFT and SSE support for double trap. The tests will try
> > to trigger double trap using various sequences and will test to receive
> > the SSE double trap event if supported.
> > =

> > It is provided as a separate test from the SBI one for two reasons:
> > - It isn't specifically testing SBI "per se".
> > - It ends up by trying to crash into in M-mode.
> > =

> > Currently, the test uses a page fault to raise a trap programatically.
> > Some concern was raised by a github user on the original branch [1]
> > saying that the spec doesn't mandate any trap to be delegatable and that
> > we would need a way to detect which ones are delegatable. I think we can
> > safely assume that PAGE FAULT is delegatable and if a hardware that does
> > not have support comes up then it will probably be the vendor
> > responsibility to provide a way to do so.
> > =

> > Link: https://github.com/clementleger/kvm-unit-tests/issues/1 [1]
> > Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> > ---
> >  riscv/Makefile            |   1 +
> >  lib/riscv/asm/csr.h       |   1 +
> >  lib/riscv/asm/processor.h |  10 ++
> >  riscv/isa-dbltrp.c        | 210 ++++++++++++++++++++++++++++++++++++++
> >  riscv/unittests.cfg       |   4 +
> >  5 files changed, 226 insertions(+)
> >  create mode 100644 riscv/isa-dbltrp.c
> > =

> > diff --git a/riscv/Makefile b/riscv/Makefile
> > index 11e68eae..d71c9d2e 100644
> > --- a/riscv/Makefile
> > +++ b/riscv/Makefile
> > @@ -14,6 +14,7 @@ tests =3D
> >  tests +=3D $(TEST_DIR)/sbi.$(exe)
> >  tests +=3D $(TEST_DIR)/selftest.$(exe)
> >  tests +=3D $(TEST_DIR)/sieve.$(exe)
> > +tests +=3D $(TEST_DIR)/isa-dbltrp.$(exe)
> >  =

> >  all: $(tests)
> >  =

> > diff --git a/lib/riscv/asm/csr.h b/lib/riscv/asm/csr.h
> > index 3e4b5fca..6a8e0578 100644
> > --- a/lib/riscv/asm/csr.h
> > +++ b/lib/riscv/asm/csr.h
> > @@ -18,6 +18,7 @@
> >  =

> >  #define SR_SIE			_AC(0x00000002, UL)
> >  #define SR_SPP			_AC(0x00000100, UL)
> > +#define SR_SDT			_AC(0x01000000, UL) /* Supervisor Double Trap */
> >  =

> >  /* Exception cause high bit - is an interrupt if set */
> >  #define CAUSE_IRQ_FLAG		(_AC(1, UL) << (__riscv_xlen - 1))
> > diff --git a/lib/riscv/asm/processor.h b/lib/riscv/asm/processor.h
> > index 631ce226..a3dab064 100644
> > --- a/lib/riscv/asm/processor.h
> > +++ b/lib/riscv/asm/processor.h
> > @@ -50,6 +50,16 @@ static inline void ipi_ack(void)
> >  	csr_clear(CSR_SIP, IE_SSIE);
> >  }
> >  =

> > +static inline void local_dlbtrp_enable(void)
> > +{
> > +	csr_set(CSR_SSTATUS, SR_SDT);
> > +}
> > +
> > +static inline void local_dlbtrp_disable(void)
> > +{
> > +	csr_clear(CSR_SSTATUS, SR_SDT);
> > +}
> > +
> >  void install_exception_handler(unsigned long cause, void (*handler)(st=
ruct pt_regs *));
> >  void install_irq_handler(unsigned long cause, void (*handler)(struct p=
t_regs *));
> >  void do_handle_exception(struct pt_regs *regs);
> > diff --git a/riscv/isa-dbltrp.c b/riscv/isa-dbltrp.c
> > new file mode 100644
> > index 00000000..dcfa66da
> > --- /dev/null
> > +++ b/riscv/isa-dbltrp.c
> > @@ -0,0 +1,210 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * SBI verification
> > + *
> > + * Copyright (C) 2025, Rivos Inc., Cl=E9ment L=E9ger <cleger@rivosinc.=
com>
> > + */
> > +#include <alloc.h>
> > +#include <alloc_page.h>
> > +#include <libcflat.h>
> > +#include <stdlib.h>
> > +
> > +#include <asm/csr.h>
> > +#include <asm/page.h>
> > +#include <asm/processor.h>
> > +#include <asm/ptrace.h>
> > +#include <asm/sbi.h>
> > +
> > +#include <sbi-tests.h>
> > +
> > +static bool double_trap;
> > +static bool clear_sdt;
> > +
> > +#define INSN_LEN(insn)			((((insn) & 0x3) < 0x3) ? 2 : 4)
> =

> This macro should be removed since it was merged in another file.

Actually it should be removed since it's unused. If it was used, then we'd
need to rename the callsites since we call it RV_INSN_LEN.

I've removed it while applying to riscv/sbi.

https://gitlab.com/jones-drew/kvm-unit-tests/-/commits/riscv/sbi

Thanks,
drew

-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
