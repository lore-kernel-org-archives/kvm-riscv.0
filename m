Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 325EEC28B28
	for <kvm-riscv@archiver.kernel.org>; Wed, 12 Mar 2025 16:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d32HZbpxgGcrlD7XMUo4JNJV9ZB8Z04yUjNJBWVAXPI=; b=Mvjp7921yhdLNh
	CTCnw8mDhD+FzSRJ/PVnAXUekzd8wY+JZQZiPtBPPT9BqWpNQbS4nTT91EDTO1ltMv3NBd3Q5b0MY
	BGPtcAUYbfyEc+e4raLXCMb6XFhkKlutyxJvU4GhE4e7szTtBd/6HU77gUWvRm2oN8Wo0MBP2Q/kj
	yceXxUH9hB1ZAJpNr+XHxJ6Q841WTh9EbvfoLEmqMzf3sxK8xKGrqndVYmQU/BHi82WcJuUhBN2Hj
	vf1rdOsRacw3O8n9951VU9f+3cbkLu1K4zU+zPXRbn4iR+RXcQnpi1QT8ra/+79bYqJPamLlwoIGg
	LIZvDyLYA9pdsHguxCnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsOxI-000000091nL-2WRL;
	Wed, 12 Mar 2025 16:29:16 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsOxG-000000091mp-1zZD
	for kvm-riscv@lists.infradead.org;
	Wed, 12 Mar 2025 16:29:15 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so29522365e9.1
        for <kvm-riscv@lists.infradead.org>; Wed, 12 Mar 2025 09:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1741796952; x=1742401752; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fOnSpbCHIVScbDy74xUesrpWh1zALxdGl2tg20/LxlI=;
        b=nGa6zcIpt19OI0aVtQ6P+pFlEdHMvpGmI85X3PAzLsnfU/A/VwVfdaTKsI7ROSY9w/
         BXrq3Pnom2iSJmUgVrg5CI7dniE02i77y4SBv4QqaO74drJW4U7FR87KRvBmwjxR/QOS
         5YR/uX1fIgSGHciXery3p+Zd1JoMGDkQBkl84+pL1aMu+bMWTaY8bCF4VjnkG800HRuB
         ZgBkNb8Kv261bOy8soRNOLg5zBNFV1CX/fLG3+YrorCpphq9zk2RIVcnThGEo79Vd+Y9
         ICLjMWdJvdq/v1pSxFwyE/bUmfkJ6wGbjoR/d9g2M85J0nZuHTgM9CiBOUixzIH4Pk8D
         ddiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741796952; x=1742401752;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fOnSpbCHIVScbDy74xUesrpWh1zALxdGl2tg20/LxlI=;
        b=i4dhGEaTT09b/ZK0wXSsAatW2xwXmoN1bhhG8l5K1FBIkLElv7mQpaiNRXwcWVKZLk
         VoJViUMjyzZ5QjuRO4HcHDA/MtMJcpPN4FwiRW/sYgBvdK/qanNWk3FNtTnC7VuNE5H0
         OSicifwl2my7rC+yLbfw17a/p55GnH3YCDIshl3OOzJmW59ePSdZ7+nxdegwjcusXdRa
         74cWunu4TajonO8fj2f+74OipuaGA8V3WUK/c1tTFE/D2Id/11k7l7ZVqHl2Z5+wiOXH
         WW4+g3a8MyaH9YAWSVSg/rgh9XZKvfi/Vi+STMIDFRLaD0fukvCk3KfL1SExZvWDzKry
         MjCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJ7kJvZj08OYihXz7xDMCAyw7VfdYCTL+EpTtNAfgtznIPH7BH6RmZ8EY1ViwUSfs3Vip5nJMcQIA=@lists.infradead.org
X-Gm-Message-State: AOJu0YzF3xwdltyd9qQ8ryJwuu+zO6UzwREXxr3Z8ViYSusWNzHCldeJ
	on8MIdENH4e7PNYw9SBw/d1uJM3vMaPBVFpwvKqGsQjc4IC9jERUfz/5DtMSf38=
X-Gm-Gg: ASbGncvb6+0e2yJeyEoP/7hhn71K+PttTu6qGbV7zlIY9FowD5+Q9080FNkssJ2DFp0
	hOkPVRSni91dTbzd0xT0g20nUpgknyTJk9K1ATjFOVVTfUq9SFfa83hu+9X+ktjw79npeOhG7ai
	U5eQjMePWB6S5JDUCmIotIOui/lJMeRtQGaN9bPYpKppOeSHSIjv5gdqpgIDXKOpl9+XJ/RmR9P
	kDx7S83mw6NfmxmmMUJgthYm0XeseV6wrig5XycKraoXtPS5qe+f5TZiD545BWYcGBqV2aPeMbW
	EScPrT8u15c2V7F98Zx6FIp1rGzoYiEl
X-Google-Smtp-Source: AGHT+IHc8EpNIG4cxuPPSWYSwyRFGGdAIA0LCRbEBlPg4hgpbqDCLbDFmReBz0mcS83oLAFqOhYDNQ==
X-Received: by 2002:a5d:648f:0:b0:391:3150:96ff with SMTP id ffacd0b85a97d-39132d57d7emr17431954f8f.32.1741796952214;
        Wed, 12 Mar 2025 09:29:12 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::59a5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d0a72eeecsm26070745e9.3.2025.03.12.09.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 09:29:11 -0700 (PDT)
Date: Wed, 12 Mar 2025 17:29:10 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	Anup Patel <apatel@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>, 
	Andrew Jones <andrew.jones@linux.dev>
Subject: Re: [kvm-unit-tests PATCH v8 5/6] lib: riscv: Add SBI SSE support
Message-ID: <20250312-cf0b7348207165c9dceddd56@orel>
References: <20250307161549.1873770-1-cleger@rivosinc.com>
 <20250307161549.1873770-6-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250307161549.1873770-6-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_092914_523152_76F43CFA 
X-CRM114-Status: GOOD (  21.39  )
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

On Fri, Mar 07, 2025 at 05:15:47PM +0100, Cl=E9ment L=E9ger wrote:
> Add support for registering and handling SSE events. This will be used
> by sbi test as well as upcoming double trap tests.
> =

> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> Reviewed-by: Andrew Jones <andrew.jones@linux.dev>
> ---
>  riscv/Makefile          |   1 +
>  lib/riscv/asm/csr.h     |   1 +
>  lib/riscv/asm/sbi.h     |  38 ++++++++++++++-
>  lib/riscv/sbi-sse-asm.S | 103 ++++++++++++++++++++++++++++++++++++++++
>  lib/riscv/asm-offsets.c |   9 ++++
>  lib/riscv/sbi.c         |  76 +++++++++++++++++++++++++++++
>  6 files changed, 227 insertions(+), 1 deletion(-)
>  create mode 100644 lib/riscv/sbi-sse-asm.S
> =

> diff --git a/riscv/Makefile b/riscv/Makefile
> index 02d2ac39..16fc125b 100644
> --- a/riscv/Makefile
> +++ b/riscv/Makefile
> @@ -43,6 +43,7 @@ cflatobjs +=3D lib/riscv/setup.o
>  cflatobjs +=3D lib/riscv/smp.o
>  cflatobjs +=3D lib/riscv/stack.o
>  cflatobjs +=3D lib/riscv/timer.o
> +cflatobjs +=3D lib/riscv/sbi-sse-asm.o
>  ifeq ($(ARCH),riscv32)
>  cflatobjs +=3D lib/ldiv32.o
>  endif
> diff --git a/lib/riscv/asm/csr.h b/lib/riscv/asm/csr.h
> index c7fc87a9..3e4b5fca 100644
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
> diff --git a/lib/riscv/asm/sbi.h b/lib/riscv/asm/sbi.h
> index 780c9edd..acef8a5e 100644
> --- a/lib/riscv/asm/sbi.h
> +++ b/lib/riscv/asm/sbi.h
> @@ -230,5 +230,41 @@ struct sbiret sbi_send_ipi_broadcast(void);
>  struct sbiret sbi_set_timer(unsigned long stime_value);
>  long sbi_probe(int ext);
>  =

> -#endif /* !__ASSEMBLER__ */
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
> +struct sbiret sbi_sse_disable(unsigned long event_id);
> +struct sbiret sbi_sse_hart_mask(void);
> +struct sbiret sbi_sse_hart_unmask(void);
> +struct sbiret sbi_sse_inject(unsigned long event_id, unsigned long hart_=
id);
> +
> +#endif /* !__ASSEMBLY__ */

When rebasing on latest master this should have been left as
__ASSEMBLER__

>  #endif /* _ASMRISCV_SBI_H_ */
> diff --git a/lib/riscv/sbi-sse-asm.S b/lib/riscv/sbi-sse-asm.S
> new file mode 100644
> index 00000000..e4efd1ff
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

__ASSEMBLER__

> +#include <asm/asm.h>
> +#include <asm/asm-offsets.h>
> +#include <asm/csr.h>
> +#include <generated/sbi-asm-offsets.h>
> +
> +.section .text
> +.global sbi_sse_entry
> +sbi_sse_entry:
> +	/* Save stack temporarily */
> +	REG_S	sp, SBI_SSE_REG_TMP(a7)
> +	/* Set entry stack */
> +	REG_L	sp, SBI_SSE_HANDLER_STACK(a7)
> +
> +	addi	sp, sp, -(PT_SIZE)
> +	REG_S	ra, PT_RA(sp)
> +	REG_S	s0, PT_S0(sp)
> +	REG_S	s1, PT_S1(sp)
> +	REG_S	s2, PT_S2(sp)
> +	REG_S	s3, PT_S3(sp)
> +	REG_S	s4, PT_S4(sp)
> +	REG_S	s5, PT_S5(sp)
> +	REG_S	s6, PT_S6(sp)
> +	REG_S	s7, PT_S7(sp)
> +	REG_S	s8, PT_S8(sp)
> +	REG_S	s9, PT_S9(sp)
> +	REG_S	s10, PT_S10(sp)
> +	REG_S	s11, PT_S11(sp)
> +	REG_S	tp, PT_TP(sp)
> +	REG_S	t0, PT_T0(sp)
> +	REG_S	t1, PT_T1(sp)
> +	REG_S	t2, PT_T2(sp)
> +	REG_S	t3, PT_T3(sp)
> +	REG_S	t4, PT_T4(sp)
> +	REG_S	t5, PT_T5(sp)
> +	REG_S	t6, PT_T6(sp)
> +	REG_S	gp, PT_GP(sp)
> +	REG_S	a0, PT_A0(sp)
> +	REG_S	a1, PT_A1(sp)
> +	REG_S	a2, PT_A2(sp)
> +	REG_S	a3, PT_A3(sp)
> +	REG_S	a4, PT_A4(sp)
> +	REG_S	a5, PT_A5(sp)
> +	csrr	a1, CSR_SEPC
> +	REG_S	a1, PT_EPC(sp)
> +	csrr	a2, CSR_SSTATUS
> +	REG_S	a2, PT_STATUS(sp)
> +
> +	REG_L	a0, SBI_SSE_REG_TMP(a7)
> +	REG_S	a0, PT_SP(sp)
> +
> +	REG_L	t0, SBI_SSE_HANDLER(a7)
> +	REG_L	a0, SBI_SSE_HANDLER_DATA(a7)
> +	mv	a1, sp
> +	mv	a2, a6
> +	jalr	t0
> +
> +	REG_L	a1, PT_EPC(sp)
> +	REG_L	a2, PT_STATUS(sp)
> +	csrw	CSR_SEPC, a1
> +	csrw	CSR_SSTATUS, a2
> +
> +	REG_L	ra, PT_RA(sp)
> +	REG_L	s0, PT_S0(sp)
> +	REG_L	s1, PT_S1(sp)
> +	REG_L	s2, PT_S2(sp)
> +	REG_L	s3, PT_S3(sp)
> +	REG_L	s4, PT_S4(sp)
> +	REG_L	s5, PT_S5(sp)
> +	REG_L	s6, PT_S6(sp)
> +	REG_L	s7, PT_S7(sp)
> +	REG_L	s8, PT_S8(sp)
> +	REG_L	s9, PT_S9(sp)
> +	REG_L	s10, PT_S10(sp)
> +	REG_L	s11, PT_S11(sp)
> +	REG_L	tp, PT_TP(sp)
> +	REG_L	t0, PT_T0(sp)
> +	REG_L	t1, PT_T1(sp)
> +	REG_L	t2, PT_T2(sp)
> +	REG_L	t3, PT_T3(sp)
> +	REG_L	t4, PT_T4(sp)
> +	REG_L	t5, PT_T5(sp)
> +	REG_L	t6, PT_T6(sp)
> +	REG_L	gp, PT_GP(sp)
> +	REG_L	a0, PT_A0(sp)
> +	REG_L	a1, PT_A1(sp)
> +	REG_L	a2, PT_A2(sp)
> +	REG_L	a3, PT_A3(sp)
> +	REG_L	a4, PT_A4(sp)
> +	REG_L	a5, PT_A5(sp)
> +
> +	REG_L	sp, PT_SP(sp)
> +
> +	li	a7, ASM_SBI_EXT_SSE
> +	li	a6, ASM_SBI_EXT_SSE_COMPLETE
> +	ecall
> +
> diff --git a/lib/riscv/asm-offsets.c b/lib/riscv/asm-offsets.c
> index 6c511c14..a96c6e97 100644
> --- a/lib/riscv/asm-offsets.c
> +++ b/lib/riscv/asm-offsets.c
> @@ -3,6 +3,7 @@
>  #include <elf.h>
>  #include <asm/processor.h>
>  #include <asm/ptrace.h>
> +#include <asm/sbi.h>
>  #include <asm/smp.h>
>  =

>  int main(void)
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
> diff --git a/lib/riscv/sbi.c b/lib/riscv/sbi.c
> index 02dd338c..1752c916 100644
> --- a/lib/riscv/sbi.c
> +++ b/lib/riscv/sbi.c
> @@ -2,6 +2,7 @@
>  #include <libcflat.h>
>  #include <cpumask.h>
>  #include <limits.h>
> +#include <asm/io.h>
>  #include <asm/sbi.h>
>  #include <asm/setup.h>
>  =

> @@ -31,6 +32,81 @@ struct sbiret sbi_ecall(int ext, int fid, unsigned lon=
g arg0,
>  	return ret;
>  }
>  =

> +struct sbiret sbi_sse_read_attrs_raw(unsigned long event_id, unsigned lo=
ng base_attr_id,
> +				     unsigned long attr_count, unsigned long phys_lo,
> +				      unsigned long phys_hi)
                   extra space here ^

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
> +	return sbi_sse_register_raw(event_id, (unsigned long) sbi_sse_entry, (u=
nsigned long) arg);

nit: no spaces after casts

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
> +
>  void sbi_shutdown(void)
>  {
>  	sbi_ecall(SBI_EXT_SRST, 0, 0, 0, 0, 0, 0, 0);
> -- =

> 2.47.2
>

Thanks,
drew

-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
