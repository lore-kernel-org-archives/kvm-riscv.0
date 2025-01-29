Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 369E8C0218D
	for <kvm-riscv@archiver.kernel.org>; Wed, 29 Jan 2025 14:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RCxXDJHTjLkCoIPFzTU33CKZOBLeCV9kiIQRRqRcQig=; b=vRfBrVnm9/q/dG
	bH3EfrK7CrPPwd04qjhsSDTD7dX0ti4CZCZ8Fv5Al8xNwiGLWtEz2QfneqLkxYqlSYLyCf1Fl5sqL
	zsffyoZM4VWtW4lFVrHpcYbwUPRNGHLkET0//HrgVI0DQg3m+e9F8bx6/7N/mnjDYuYnRgDOUjSor
	GOAScWzzxJ77XQ9YjSChnO2hs4pKWFkSa0Y65ZCfdY3uCjMvz8sJUaUN4nOfdt2435atUFjDHb5is
	TSV4yO5VfoWVI+bd90ejN/bZr5s2kfvSGM1rIgK3x4P1y+jeDEbDLbt/gmN1O2Srh1er25tWHslOA
	jwkMWDxoqjAwuS22Iojg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1td8se-000000076bd-3uu1;
	Wed, 29 Jan 2025 14:17:24 +0000
Received: from out-170.mta1.migadu.com ([95.215.58.170])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1td8sa-000000076b2-37r7
	for kvm-riscv@lists.infradead.org;
	Wed, 29 Jan 2025 14:17:23 +0000
Date: Wed, 29 Jan 2025 15:17:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738160236;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3FYe50gT7/INRrDrvYureIAbDleSAcXQFfoib6AD7R4=;
	b=OBPU4IEjGreOYYBuocl/PISwDOmNRejZFaLZ6Rph/amMKVcV9gjMxadWYzh2qQZr69rgzN
	XYCHXy1M/Yt4Tu1h9GkiYouVTOcqw4gkt8WtrItZxhkQLhUQI4pilHAS4eelFDaxMhiYIE
	SNL69s+Fw2Wpn5fSIybK+BzcDxuDu7A=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	Andrew Jones <ajones@ventanamicro.com>, Anup Patel <apatel@ventanamicro.com>, 
	Atish Patra <atishp@rivosinc.com>
Subject: Re: [kvm-unit-tests PATCH v3 2/2] riscv: Add tests for SBI FWFT
 extension
Message-ID: <20250129-ab75148a5b1ce97ae8529532@orel>
References: <20250128141543.1338677-1-cleger@rivosinc.com>
 <20250128141543.1338677-3-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250128141543.1338677-3-cleger@rivosinc.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_061721_937229_D202A89B 
X-CRM114-Status: GOOD (  23.11  )
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

On Tue, Jan 28, 2025 at 03:15:42PM +0100, Cl=E9ment L=E9ger wrote:
> Add tests for the FWFT SBI extension. Currently, only the reserved range
> as well as the misaligned exception delegation are used.
> =

> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> ---
>  riscv/Makefile      |   2 +-
>  lib/riscv/asm/sbi.h |  34 ++++++++
>  riscv/sbi-fwft.c    | 190 ++++++++++++++++++++++++++++++++++++++++++++
>  riscv/sbi.c         |   3 +
>  4 files changed, 228 insertions(+), 1 deletion(-)
>  create mode 100644 riscv/sbi-fwft.c
> =

> diff --git a/riscv/Makefile b/riscv/Makefile
> index 5b5e157c..52718f3f 100644
> --- a/riscv/Makefile
> +++ b/riscv/Makefile
> @@ -17,7 +17,7 @@ tests +=3D $(TEST_DIR)/sieve.$(exe)
>  =

>  all: $(tests)
>  =

> -$(TEST_DIR)/sbi-deps =3D $(TEST_DIR)/sbi-asm.o
> +$(TEST_DIR)/sbi-deps =3D $(TEST_DIR)/sbi-asm.o $(TEST_DIR)/sbi-fwft.o
>  =

>  # When built for EFI sieve needs extra memory, run with e.g. '-m 256' on=
 QEMU
>  $(TEST_DIR)/sieve.$(exe): AUXFLAGS =3D 0x1
> diff --git a/lib/riscv/asm/sbi.h b/lib/riscv/asm/sbi.h
> index 98a9b097..397400f2 100644
> --- a/lib/riscv/asm/sbi.h
> +++ b/lib/riscv/asm/sbi.h
> @@ -11,6 +11,12 @@
>  #define SBI_ERR_ALREADY_AVAILABLE	-6
>  #define SBI_ERR_ALREADY_STARTED		-7
>  #define SBI_ERR_ALREADY_STOPPED		-8
> +#define SBI_ERR_NO_SHMEM		-9
> +#define SBI_ERR_INVALID_STATE		-10
> +#define SBI_ERR_BAD_RANGE		-11
> +#define SBI_ERR_TIMEOUT			-12
> +#define SBI_ERR_IO			-13
> +#define SBI_ERR_LOCKED			-14
>  =

>  #ifndef __ASSEMBLY__
>  #include <cpumask.h>
> @@ -23,6 +29,7 @@ enum sbi_ext_id {
>  	SBI_EXT_SRST =3D 0x53525354,
>  	SBI_EXT_DBCN =3D 0x4442434E,
>  	SBI_EXT_SUSP =3D 0x53555350,
> +	SBI_EXT_FWFT =3D 0x46574654,
>  };
>  =

>  enum sbi_ext_base_fid {
> @@ -71,6 +78,33 @@ enum sbi_ext_dbcn_fid {
>  	SBI_EXT_DBCN_CONSOLE_WRITE_BYTE,
>  };
>  =

> +
> +enum sbi_ext_fwft_fid {
> +	SBI_EXT_FWFT_SET =3D 0,
> +	SBI_EXT_FWFT_GET,
> +};
> +
> +#define SBI_FWFT_MISALIGNED_EXC_DELEG		0x0
> +#define SBI_FWFT_LANDING_PAD			0x1
> +#define SBI_FWFT_SHADOW_STACK			0x2
> +#define SBI_FWFT_DOUBLE_TRAP			0x3
> +#define SBI_FWFT_PTE_AD_HW_UPDATING		0x4
> +#define SBI_FWFT_POINTER_MASKING_PMLEN		0x5
> +#define SBI_FWFT_LOCAL_RESERVED_START		0x6
> +#define SBI_FWFT_LOCAL_RESERVED_END		0x3fffffff
> +#define SBI_FWFT_LOCAL_PLATFORM_START		0x40000000
> +#define SBI_FWFT_LOCAL_PLATFORM_END		0x7fffffff
> +
> +#define SBI_FWFT_GLOBAL_RESERVED_START		0x80000000
> +#define SBI_FWFT_GLOBAL_RESERVED_END		0xbfffffff
> +#define SBI_FWFT_GLOBAL_PLATFORM_START		0xc0000000
> +#define SBI_FWFT_GLOBAL_PLATFORM_END		0xffffffff
> +
> +#define SBI_FWFT_PLATFORM_FEATURE_BIT		BIT(30)
> +#define SBI_FWFT_GLOBAL_FEATURE_BIT		BIT(31)
> +
> +#define SBI_FWFT_SET_FLAG_LOCK			BIT(0)
> +
>  struct sbiret {
>  	long error;
>  	long value;
> diff --git a/riscv/sbi-fwft.c b/riscv/sbi-fwft.c
> new file mode 100644
> index 00000000..c9292cfb
> --- /dev/null
> +++ b/riscv/sbi-fwft.c
> @@ -0,0 +1,190 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * SBI verification
> + *
> + * Copyright (C) 2024, Rivos Inc., Cl=E9ment L=E9ger <cleger@rivosinc.co=
m>
> + */
> +#include <libcflat.h>
> +#include <stdlib.h>
> +
> +#include <asm/csr.h>
> +#include <asm/processor.h>
> +#include <asm/ptrace.h>
> +#include <asm/sbi.h>
> +
> +#include "sbi-tests.h"
> +
> +void check_fwft(void);
> +
> +
> +static struct sbiret fwft_set_raw(unsigned long feature, unsigned long v=
alue, unsigned long flags)
> +{
> +	return sbi_ecall(SBI_EXT_FWFT, SBI_EXT_FWFT_SET, feature, value, flags,=
 0, 0, 0);
> +}
> +
> +static struct sbiret fwft_set(uint32_t feature, unsigned long value, uns=
igned long flags)
> +{
> +	return fwft_set_raw(feature, value, flags);
> +}
> +
> +static struct sbiret fwft_get_raw(unsigned long feature)
> +{
> +	return sbi_ecall(SBI_EXT_FWFT, SBI_EXT_FWFT_GET, feature, 0, 0, 0, 0, 0=
);
> +}
> +
> +static struct sbiret fwft_get(uint32_t feature)
> +{
> +	return fwft_get_raw(feature);
> +}
> +
> +static void fwft_check_reserved(unsigned long id)
> +{
> +	struct sbiret ret;
> +
> +	ret =3D fwft_get(id);
> +	sbiret_report_error(&ret, SBI_ERR_DENIED, "get reserved feature 0x%lx",=
 id);
> +
> +	ret =3D fwft_set(id, 1, 0);
> +	sbiret_report_error(&ret, SBI_ERR_DENIED, "set reserved feature 0x%lx",=
 id);
> +}
> +
> +static void fwft_check_base(void)
> +{
> +	struct sbiret ret;
> +
> +	report_prefix_push("base");
> +
> +	fwft_check_reserved(SBI_FWFT_LOCAL_RESERVED_START);
> +	fwft_check_reserved(SBI_FWFT_LOCAL_RESERVED_END);
> +	fwft_check_reserved(SBI_FWFT_GLOBAL_RESERVED_START);
> +	fwft_check_reserved(SBI_FWFT_GLOBAL_RESERVED_END);
> +
> +	/* Check id > 32 bits */
> +	if (__riscv_xlen > 32) {
> +		ret =3D fwft_get_raw(BIT(32));
> +		sbiret_report_error(&ret, SBI_ERR_INVALID_PARAM,
> +				    "get feature 0x%lx error", BIT(32));
> +
> +		ret =3D fwft_set_raw(BIT(32), 0, 0);
> +		sbiret_report_error(&ret, SBI_ERR_INVALID_PARAM,
> +				    "set feature 0x%lx error", BIT(32));

At least with the compiler I'm using, the code inside this
"if (__riscv_xlen > 32)" block is still getting compiled for
rv32 and breaking on the BIT(). It doesn't help to use BIT_ULL() here
since fwft_get/set_raw() take longs. I guess we'll have to use #if.

Fixed on merge.

> +	}
> +
> +	report_prefix_pop();
> +}
> +
> +static bool misaligned_handled;
> +
> +static void misaligned_handler(struct pt_regs *regs)
> +{
> +	misaligned_handled =3D true;
> +	regs->epc +=3D 4;
> +}
> +
> +static struct sbiret fwft_misaligned_exc_set(unsigned long value, unsign=
ed long flags)
> +{
> +	return fwft_set(SBI_FWFT_MISALIGNED_EXC_DELEG, value, flags);
> +}
> +
> +static struct sbiret fwft_misaligned_exc_get(void)
> +{
> +	return fwft_get(SBI_FWFT_MISALIGNED_EXC_DELEG);
> +}
> +
> +static void fwft_check_misaligned_exc_deleg(void)
> +{
> +	struct sbiret ret;
> +
> +	report_prefix_push("misaligned_exc_deleg");
> +
> +	ret =3D fwft_misaligned_exc_get();
> +	if (ret.error =3D=3D SBI_ERR_NOT_SUPPORTED) {
> +		report_skip("SBI_FWFT_MISALIGNED_EXC_DELEG is not supported");
> +		return;
> +	}
> +
> +	if (!sbiret_report_error(&ret, 0, "Get misaligned deleg feature no erro=
r"))
> +		return;
> +
> +	ret =3D fwft_misaligned_exc_set(2, 0);
> +	sbiret_report_error(&ret, SBI_ERR_INVALID_PARAM,
> +			    "Set misaligned deleg feature invalid value 2");
> +	ret =3D fwft_misaligned_exc_set(0xFFFFFFFF, 0);
> +	sbiret_report_error(&ret, SBI_ERR_INVALID_PARAM,
> +			    "Set misaligned deleg feature invalid value 0xFFFFFFFF");
> +
> +	if (__riscv_xlen > 32) {
> +		ret =3D fwft_misaligned_exc_set(BIT(32), 0);
> +		sbiret_report_error(&ret, SBI_ERR_INVALID_PARAM,
> +				    "Set misaligned deleg with invalid value > 32bits");
> +
> +		ret =3D fwft_misaligned_exc_set(0, BIT(32));
> +		sbiret_report_error(&ret, SBI_ERR_INVALID_PARAM,
> +				    "Set misaligned deleg with invalid flag > 32bits");

Same comment as above and also fixed on merge.

Thanks,
drew

-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
