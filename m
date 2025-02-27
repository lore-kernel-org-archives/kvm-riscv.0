Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDD89C19F32
	for <kvm-riscv@archiver.kernel.org>; Thu, 27 Feb 2025 19:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FBpR+35HyssFoXQ37oapltvmbdJWaXnwAYEu2/iUkE4=; b=psEgDOj3cM7ovW
	Cu13m710nme9JvRWYw2fUVzhwUu1l6ojkglXlEH2g9kbjTKAFDNlorlXPpPtF3MtCcGXfanxLhrvK
	dmXxCe0+lYhCEjWr0tmnJw/GojsY43kjXiYRbjuUfazkpuBPs3iIppZewobZLupkROUFpGHhAOQ/G
	8J3zd0UUAzj2ntYJcAA5AS8T6SKI7GG9X6Owt8f6j6jq3VmoLIiYmKFvc7eRMQ6VNMgQzw41nJfvv
	QQDRFWIl6jvaGf8qCRgMCPSGqRLKlnB8JEyruDujNeM0/Koy+f4xisp1kBjX3gsx2RMvBuTtXDois
	DDkTS8UhwqeVZYf9Ri+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjj5-00000008XTf-2bbm;
	Thu, 27 Feb 2025 19:39:19 +0000
Received: from out-170.mta1.migadu.com ([95.215.58.170])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tngM6-00000007zjo-1jnA
	for kvm-riscv@lists.infradead.org;
	Thu, 27 Feb 2025 16:03:24 +0000
Date: Thu, 27 Feb 2025 17:03:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1740672198;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l1+AyCQLv7cOOfW4ZiocHyOBtFJdcnQChne7Uogxj4M=;
	b=cSCpcjeGZ6hyO+N6SagobjMbIs26+2uo+GpGa2OqeSIE/eHFsNnx+WckF7peeN7YWKBxnu
	tJrmJ+8l5UPRP9ZW4T7PrV6/bkKa3MOgRPmIolhDSF4RxVI78SpYgmskoMDkzDLbXAaZjy
	Y14xSAW0arswlb0iBJtSFz8D22xg1r0=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	Andrew Jones <ajones@ventanamicro.com>, Anup Patel <apatel@ventanamicro.com>, 
	Atish Patra <atishp@rivosinc.com>
Subject: Re: [kvm-unit-tests PATCH v7 5/6] lib: riscv: Add SBI SSE support
Message-ID: <20250227-a28f41972a73e8269d26b461@orel>
References: <20250214114423.1071621-1-cleger@rivosinc.com>
 <20250214114423.1071621-6-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250214114423.1071621-6-cleger@rivosinc.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_080322_897756_F936189F 
X-CRM114-Status: GOOD (  19.95  )
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

On Fri, Feb 14, 2025 at 12:44:18PM +0100, Cl=E9ment L=E9ger wrote:
> Add support for registering and handling SSE events. This will be used
> by sbi test as well as upcoming double trap tests.
> =

> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> ---
>  riscv/Makefile          |   2 +
>  lib/riscv/asm/csr.h     |   1 +
>  lib/riscv/asm/sbi-sse.h |  48 +++++++++++++++++++
>  lib/riscv/sbi-sse-asm.S | 103 ++++++++++++++++++++++++++++++++++++++++
>  lib/riscv/asm-offsets.c |   9 ++++
>  lib/riscv/sbi-sse.c     |  84 ++++++++++++++++++++++++++++++++
>  6 files changed, 247 insertions(+)
>  create mode 100644 lib/riscv/asm/sbi-sse.h
>  create mode 100644 lib/riscv/sbi-sse-asm.S
>  create mode 100644 lib/riscv/sbi-sse.c
> =

> diff --git a/riscv/Makefile b/riscv/Makefile
> index 02d2ac39..ed590ede 100644
> --- a/riscv/Makefile
> +++ b/riscv/Makefile
> @@ -43,6 +43,8 @@ cflatobjs +=3D lib/riscv/setup.o
>  cflatobjs +=3D lib/riscv/smp.o
>  cflatobjs +=3D lib/riscv/stack.o
>  cflatobjs +=3D lib/riscv/timer.o
> +cflatobjs +=3D lib/riscv/sbi-sse-asm.o
> +cflatobjs +=3D lib/riscv/sbi-sse.o
>  ifeq ($(ARCH),riscv32)
>  cflatobjs +=3D lib/ldiv32.o
>  endif
> diff --git a/lib/riscv/asm/csr.h b/lib/riscv/asm/csr.h
> index 16f5ddd7..389d9850 100644
> --- a/lib/riscv/asm/csr.h
> +++ b/lib/riscv/asm/csr.h
> @@ -17,6 +17,7 @@
>  #define CSR_TIME		0xc01
>  =

>  #define SR_SIE			_AC(0x00000002, UL)
> +#define SR_SPP			_AC(0x00000100, UL)
>  =

>  /* Exception cause high bit - is an interrupt if set */
>  #define CAUSE_IRQ_FLAG		(_AC(1, UL) << (__riscv_xlen - 1))
> diff --git a/lib/riscv/asm/sbi-sse.h b/lib/riscv/asm/sbi-sse.h
> new file mode 100644
> index 00000000..ba18ce27
> --- /dev/null
> +++ b/lib/riscv/asm/sbi-sse.h
> @@ -0,0 +1,48 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * SBI SSE library interface
> + *
> + * Copyright (C) 2025, Rivos Inc., Cl=E9ment L=E9ger <cleger@rivosinc.co=
m>
> + */
> +#ifndef _RISCV_SSE_H_
> +#define _RISCV_SSE_H_
> +
> +#include <asm/sbi.h>
> +
> +typedef void (*sbi_sse_handler_fn)(void *data, struct pt_regs *regs, uns=
igned int hartid);
> +
> +struct sbi_sse_handler_arg {
> +	unsigned long reg_tmp;
> +	sbi_sse_handler_fn handler;
> +	void *handler_data;
> +	void *stack;
> +};
> +
> +extern void sbi_sse_entry(void);
> +
> +static inline bool sbi_sse_event_is_global(uint32_t event_id)
> +{
> +	return !!(event_id & SBI_SSE_EVENT_GLOBAL_BIT);
> +}
> +
> +struct sbiret sbi_sse_read_attrs_raw(unsigned long event_id, unsigned lo=
ng base_attr_id,
> +				     unsigned long attr_count, unsigned long phys_lo,
> +				     unsigned long phys_hi);
> +struct sbiret sbi_sse_read_attrs(unsigned long event_id, unsigned long b=
ase_attr_id,
> +				 unsigned long attr_count, unsigned long *values);
> +struct sbiret sbi_sse_write_attrs_raw(unsigned long event_id, unsigned l=
ong base_attr_id,
> +				      unsigned long attr_count, unsigned long phys_lo,
> +				      unsigned long phys_hi);
> +struct sbiret sbi_sse_write_attrs(unsigned long event_id, unsigned long =
base_attr_id,
> +				  unsigned long attr_count, unsigned long *values);
> +struct sbiret sbi_sse_register_raw(unsigned long event_id, unsigned long=
 entry_pc,
> +				   unsigned long entry_arg);
> +struct sbiret sbi_sse_register(unsigned long event_id, struct sbi_sse_ha=
ndler_arg *arg);
> +struct sbiret sbi_sse_unregister(unsigned long event_id);
> +struct sbiret sbi_sse_enable(unsigned long event_id);
> +struct sbiret sbi_sse_hart_mask(void);
> +struct sbiret sbi_sse_hart_unmask(void);
> +struct sbiret sbi_sse_inject(unsigned long event_id, unsigned long hart_=
id);
> +struct sbiret sbi_sse_disable(unsigned long event_id);

nit: I'd put disable up by enable to keep pairs together.

> +
> +#endif /* !_RISCV_SSE_H_ */
> diff --git a/lib/riscv/sbi-sse-asm.S b/lib/riscv/sbi-sse-asm.S
> new file mode 100644
> index 00000000..5f60b839
> --- /dev/null
> +++ b/lib/riscv/sbi-sse-asm.S
> @@ -0,0 +1,103 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * RISC-V SSE events entry point.
> + *
> + * Copyright (C) 2025, Rivos Inc., Cl=E9ment L=E9ger <cleger@rivosinc.co=
m>
> + */
> +#define __ASSEMBLY__
> +#include <asm/asm.h>
> +#include <asm/csr.h>
> +#include <asm/asm-offsets.h>

nit: asm-offsets above csr if we want to practice alphabetical ordering.

> +#include <generated/sbi-asm-offsets.h>
> +
> +.section .text
> +.global sbi_sse_entry
> +sbi_sse_entry:
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

nit: Format asm with a tab after the operator like save/restore_context do.

> +
> diff --git a/lib/riscv/asm-offsets.c b/lib/riscv/asm-offsets.c
> index 6c511c14..77e5d26d 100644
> --- a/lib/riscv/asm-offsets.c
> +++ b/lib/riscv/asm-offsets.c
> @@ -4,6 +4,7 @@
>  #include <asm/processor.h>
>  #include <asm/ptrace.h>
>  #include <asm/smp.h>
> +#include <asm/sbi-sse.h>

nit: alphabetize

>  =

>  int main(void)
>  {
> @@ -63,5 +64,13 @@ int main(void)
>  	OFFSET(THREAD_INFO_HARTID, thread_info, hartid);
>  	DEFINE(THREAD_INFO_SIZE, sizeof(struct thread_info));
>  =

> +	DEFINE(ASM_SBI_EXT_SSE, SBI_EXT_SSE);
> +	DEFINE(ASM_SBI_EXT_SSE_COMPLETE, SBI_EXT_SSE_COMPLETE);
> +
> +	OFFSET(SBI_SSE_REG_TMP, sbi_sse_handler_arg, reg_tmp);
> +	OFFSET(SBI_SSE_HANDLER, sbi_sse_handler_arg, handler);
> +	OFFSET(SBI_SSE_HANDLER_DATA, sbi_sse_handler_arg, handler_data);
> +	OFFSET(SBI_SSE_HANDLER_STACK, sbi_sse_handler_arg, stack);
> +
>  	return 0;
>  }
> diff --git a/lib/riscv/sbi-sse.c b/lib/riscv/sbi-sse.c
> new file mode 100644
> index 00000000..bc4dd10e
> --- /dev/null
> +++ b/lib/riscv/sbi-sse.c

I think we could just put these wrappers in lib/riscv/sbi.c, but OK.

> @@ -0,0 +1,84 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * SBI SSE library
> + *
> + * Copyright (C) 2025, Rivos Inc., Cl=E9ment L=E9ger <cleger@rivosinc.co=
m>
> + */
> +#include <asm/sbi.h>
> +#include <asm/sbi-sse.h>
> +#include <asm/io.h>

nit: alphabetize

> +
> +struct sbiret sbi_sse_read_attrs_raw(unsigned long event_id, unsigned lo=
ng base_attr_id,
> +				     unsigned long attr_count, unsigned long phys_lo,
> +				     unsigned long phys_hi)
> +{
> +	return sbi_ecall(SBI_EXT_SSE, SBI_EXT_SSE_READ_ATTRS, event_id, base_at=
tr_id, attr_count,
> +			 phys_lo, phys_hi, 0);
> +}
> +
> +struct sbiret sbi_sse_read_attrs(unsigned long event_id, unsigned long b=
ase_attr_id,
> +				 unsigned long attr_count, unsigned long *values)
> +{
> +	phys_addr_t p =3D virt_to_phys(values);
> +
> +	return sbi_sse_read_attrs_raw(event_id, base_attr_id, attr_count, lower=
_32_bits(p),
> +				      upper_32_bits(p));
> +}
> +
> +struct sbiret sbi_sse_write_attrs_raw(unsigned long event_id, unsigned l=
ong base_attr_id,
> +				      unsigned long attr_count, unsigned long phys_lo,
> +				      unsigned long phys_hi)
> +{
> +	return sbi_ecall(SBI_EXT_SSE, SBI_EXT_SSE_WRITE_ATTRS, event_id, base_a=
ttr_id, attr_count,
> +			 phys_lo, phys_hi, 0);
> +}
> +
> +struct sbiret sbi_sse_write_attrs(unsigned long event_id, unsigned long =
base_attr_id,
> +				  unsigned long attr_count, unsigned long *values)
> +{
> +	phys_addr_t p =3D virt_to_phys(values);
> +
> +	return sbi_sse_write_attrs_raw(event_id, base_attr_id, attr_count, lowe=
r_32_bits(p),
> +				       upper_32_bits(p));
> +}
> +
> +struct sbiret sbi_sse_register_raw(unsigned long event_id, unsigned long=
 entry_pc,
> +				   unsigned long entry_arg)
> +{
> +	return sbi_ecall(SBI_EXT_SSE, SBI_EXT_SSE_REGISTER, event_id, entry_pc,=
 entry_arg, 0, 0, 0);
> +}
> +
> +struct sbiret sbi_sse_register(unsigned long event_id, struct sbi_sse_ha=
ndler_arg *arg)
> +{

 phys_addr_t entry =3D virt_to_phys(sbi_sse_entry);
 phys_addr_t arg =3D virt_to_phys(arg);

 assert(__riscv_xlen > 32 || upper_32_bits(entry) =3D=3D 0);
 assert(__riscv_xlen > 32 || upper_32_bits(arg) =3D=3D 0);

 return sbi_sse_register_raw(event_id, entry, arg);

> +	return sbi_sse_register_raw(event_id, virt_to_phys(sbi_sse_entry), virt=
_to_phys(arg));
> +}
> +
> +struct sbiret sbi_sse_unregister(unsigned long event_id)
> +{
> +	return sbi_ecall(SBI_EXT_SSE, SBI_EXT_SSE_UNREGISTER, event_id, 0, 0, 0=
, 0, 0);
> +}
> +
> +struct sbiret sbi_sse_enable(unsigned long event_id)
> +{
> +	return sbi_ecall(SBI_EXT_SSE, SBI_EXT_SSE_ENABLE, event_id, 0, 0, 0, 0,=
 0);
> +}
> +
> +struct sbiret sbi_sse_disable(unsigned long event_id)
> +{
> +	return sbi_ecall(SBI_EXT_SSE, SBI_EXT_SSE_DISABLE, event_id, 0, 0, 0, 0=
, 0);
> +}
> +
> +struct sbiret sbi_sse_hart_mask(void)
> +{
> +	return sbi_ecall(SBI_EXT_SSE, SBI_EXT_SSE_HART_MASK, 0, 0, 0, 0, 0, 0);
> +}
> +
> +struct sbiret sbi_sse_hart_unmask(void)
> +{
> +	return sbi_ecall(SBI_EXT_SSE, SBI_EXT_SSE_HART_UNMASK, 0, 0, 0, 0, 0, 0=
);
> +}
> +
> +struct sbiret sbi_sse_inject(unsigned long event_id, unsigned long hart_=
id)
> +{
> +	return sbi_ecall(SBI_EXT_SSE, SBI_EXT_SSE_INJECT, event_id, hart_id, 0,=
 0, 0, 0);
> +}
> -- =

> 2.47.2
>

Besides the nits and the sanity checking for rv32,

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>

-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
