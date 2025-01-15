Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FD83C02180
	for <kvm-riscv@archiver.kernel.org>; Wed, 15 Jan 2025 12:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=89MmW+XPc7Kna75iqBzBudwS3SRyWCQNYfDi2fvzkD0=; b=LMc2PQpza72vAx
	atgTHphPnNovtDqQ5NjCcvUL+BYQ4hGJ1AcYOmQRapV73jaNHz2Cs953Znc61/X2maOSxu83VWbso
	XEYn1diSotwhr8NmTpKRS1VeTIXSo24NwKRG+Jhbnv5CTk01WZ3gVnqcI7/9xWEYyvZuReHioHXC7
	cD7XNvRkGr2kvgoDfhf6TFI1oXWycwpjfFfZ1/fYSrxdQtV3gbSlSQ+3bNrVcWAVYIPDTwSyCi5Ym
	vap6BzHvC7zawqKzqnmZC2tiTRvmvjD65AF927M2qr3/JsYBhYz+ouxLAf840xBUUAAKzc02l5/Gc
	NNqk6xX4tQP2zyfY6Idg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY2yb-0000000BuNe-482A;
	Wed, 15 Jan 2025 12:58:29 +0000
Received: from out-181.mta1.migadu.com ([2001:41d0:203:375::b5])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY2yY-0000000BuNC-3b9F
	for kvm-riscv@lists.infradead.org;
	Wed, 15 Jan 2025 12:58:28 +0000
Date: Wed, 15 Jan 2025 13:58:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1736945902;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=atQs3bvXD4Yx/ZLDU7Ro3lLnEM/kCrq4wB3RJrd0pA4=;
	b=Q64+jiE/SMyd/igPD4iG/ga0mZss45Xv16YLNEeWAj3thIuAhvRcq0tZiB6aVWvcbGa2ui
	BNJac29yZwFGn1CaKJHT32Y0Z+GDWfmzPrIhf+ZYM7eX5lt45jou5j5LST1Lmo9OFbiBSj
	IcTT+mEj3zHw5fazPkukvS5p48ukqxE=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	Andrew Jones <ajones@ventanamicro.com>, Anup Patel <apatel@ventanamicro.com>, 
	Atish Patra <atishp@rivosinc.com>
Subject: Re: [kvm-unit-tests PATCH 2/2] riscv: Add tests for SBI FWFT
 extension
Message-ID: <20250115-0e896f7efb3e6bc2af91afb4@orel>
References: <20250106155321.1109586-1-cleger@rivosinc.com>
 <20250106155321.1109586-3-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250106155321.1109586-3-cleger@rivosinc.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_045827_180019_3688AB76 
X-CRM114-Status: GOOD (  34.92  )
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

On Mon, Jan 06, 2025 at 04:53:20PM +0100, Cl=E9ment L=E9ger wrote:
> This commit add tests for a the FWFT SBI extension. Currently, only

s/This commit//

> the reserved range as well as the misaligned exception delegation.
> =

> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> ---
>  riscv/Makefile      |   2 +-
>  lib/riscv/asm/sbi.h |  31 +++++++++
>  riscv/sbi-fwft.c    | 153 ++++++++++++++++++++++++++++++++++++++++++++
>  riscv/sbi.c         |   3 +
>  4 files changed, 188 insertions(+), 1 deletion(-)
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
> index 98a9b097..27e6fcdb 100644
> --- a/lib/riscv/asm/sbi.h
> +++ b/lib/riscv/asm/sbi.h
> @@ -11,6 +11,9 @@
>  #define SBI_ERR_ALREADY_AVAILABLE	-6
>  #define SBI_ERR_ALREADY_STARTED		-7
>  #define SBI_ERR_ALREADY_STOPPED		-8
> +#define SBI_ERR_NO_SHMEM		-9
> +#define SBI_ERR_INVALID_STATE		-10
> +#define SBI_ERR_BAD_RANGE		-11

Need SBI_ERR_DENIED_LOCKED (and TIMEOUT and IO) too

>  =

>  #ifndef __ASSEMBLY__
>  #include <cpumask.h>
> @@ -23,6 +26,7 @@ enum sbi_ext_id {
>  	SBI_EXT_SRST =3D 0x53525354,
>  	SBI_EXT_DBCN =3D 0x4442434E,
>  	SBI_EXT_SUSP =3D 0x53555350,
> +	SBI_EXT_FWFT =3D 0x46574654,
>  };
>  =

>  enum sbi_ext_base_fid {
> @@ -71,6 +75,33 @@ enum sbi_ext_dbcn_fid {
>  	SBI_EXT_DBCN_CONSOLE_WRITE_BYTE,
>  };
>  =

> +/* SBI function IDs for FW feature extension */
> +#define SBI_EXT_FWFT_SET		0x0
> +#define SBI_EXT_FWFT_GET		0x1

Use a _fid enum like the other extensions.

> +
> +enum sbi_fwft_feature_t {

Use defines for the following, like SSE does for its ranges.

> +	SBI_FWFT_MISALIGNED_EXC_DELEG		=3D 0x0,
> +	SBI_FWFT_LANDING_PAD			=3D 0x1,
> +	SBI_FWFT_SHADOW_STACK			=3D 0x2,
> +	SBI_FWFT_DOUBLE_TRAP			=3D 0x3,
> +	SBI_FWFT_PTE_AD_HARDWARE_UPDATE		=3D 0x4,

SBI_FWFT_PTE_AD_HW_UPDATING

> +	SBI_FWFT_POINTER_MASKING_PMLEN		=3D 0x5,
> +	SBI_FWFT_LOCAL_RESERVED_START		=3D 0x6,
> +	SBI_FWFT_LOCAL_RESERVED_END		=3D 0x3fffffff,

Do we need the reserved start/end? SSE doesn't define its reserved
ranges.

> +	SBI_FWFT_LOCAL_PLATFORM_START		=3D 0x40000000,
> +	SBI_FWFT_LOCAL_PLATFORM_END		=3D 0x7fffffff,
> +
> +	SBI_FWFT_GLOBAL_RESERVED_START		=3D 0x80000000,
> +	SBI_FWFT_GLOBAL_RESERVED_END		=3D 0xbfffffff,

Same reserved range question.

> +	SBI_FWFT_GLOBAL_PLATFORM_START		=3D 0xc0000000,
> +	SBI_FWFT_GLOBAL_PLATFORM_END		=3D 0xffffffff,
> +};
> +
> +#define SBI_FWFT_PLATFORM_FEATURE_BIT		(1 << 30)
> +#define SBI_FWFT_GLOBAL_FEATURE_BIT		(1 << 31)
> +
> +#define SBI_FWFT_SET_FLAG_LOCK			(1 << 0)

BIT() for the above defines

> +
>  struct sbiret {
>  	long error;
>  	long value;
> diff --git a/riscv/sbi-fwft.c b/riscv/sbi-fwft.c
> new file mode 100644
> index 00000000..8a7f2070
> --- /dev/null
> +++ b/riscv/sbi-fwft.c
> @@ -0,0 +1,153 @@
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
> +void check_fwft(void);
> +
> +static int fwft_set(unsigned long feature_id, unsigned long value,

returning an int is truncating sbiret.error

s/unsigned long feature_id/uint32_t feature/

> +		       unsigned long flags)
> +{
> +	struct sbiret ret =3D sbi_ecall(SBI_EXT_FWFT, SBI_EXT_FWFT_SET,
> +				      feature_id, value, flags, 0, 0, 0);
> +
> +	return ret.error;
> +}

Probably need a fwft_set_raw() as well which takes an unsigned long for
feature in order to test feature IDs that set bits >=3D 32 and returns
an sbiret allowing sbiret.value to be checked.

> +
> +static int fwft_get(unsigned long feature_id, unsigned long *value)

returning an int is truncating sbiret.error

s/unsigned long feature_id/uint32_t feature/

> +{
> +	struct sbiret ret =3D sbi_ecall(SBI_EXT_FWFT, SBI_EXT_FWFT_GET,
> +				      feature_id, 0, 0, 0, 0, 0);
> +
> +	*value =3D ret.value;
> +
> +	return ret.error;

Why not just return sbiret to return both value and error?

As a separate patch we should update struct sbiret to match the latest
spec which now has a union in it.

Same comment about needing a _raw version too.

> +}
> +
> +static void fwft_check_reserved(unsigned long id)
> +{
> +	int ret;
> +	bool pass =3D true;
> +	unsigned long value;
> +
> +	ret =3D fwft_get(id, &value);
> +	if (ret !=3D SBI_ERR_DENIED)
> +		pass =3D false;
> +
> +	ret =3D fwft_set(id, 1, 0);
> +	if (ret !=3D SBI_ERR_DENIED)
> +		pass =3D false;
> +
> +	report(pass, "get/set reserved feature 0x%lx error =3D=3D SBI_ERR_DENIE=
D", id);

The get and set should be split into two tests

 struct sbiret ret;
 ret =3D fwft_get(id);
 report(ret.error =3D=3D SBI_ERR_DENIED, ...);
 ret =3D fwft_set(id, 1, 0);
 report(ret.error =3D=3D SBI_ERR_DENIED, ...);

> +}
> +
> +static void fwft_check_denied(void)
> +{
> +	fwft_check_reserved(SBI_FWFT_LOCAL_RESERVED_START);
> +	fwft_check_reserved(SBI_FWFT_LOCAL_RESERVED_END);
> +	fwft_check_reserved(SBI_FWFT_GLOBAL_RESERVED_START);
> +	fwft_check_reserved(SBI_FWFT_GLOBAL_RESERVED_END);

I see why we have the reserved ranges defined now. Shouldn't we also have
tests like these for SSE, which means we should define the reserved ranges
for it too?

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
> +static void fwft_check_misaligned(void)
> +{
> +	int ret;
> +	unsigned long value;
> +
> +	report_prefix_push("misaligned_deleg");

"misaligned_exc_deleg"

> +
> +	ret =3D fwft_get(SBI_FWFT_MISALIGNED_EXC_DELEG, &value);
> +	if (ret =3D=3D SBI_ERR_NOT_SUPPORTED) {
> +		report_skip("SBI_FWFT_MISALIGNED_EXC_DELEG is not supported");
> +		return;
> +	}
> +	report(!ret, "Get misaligned deleg feature no error");

Should output the error too

> +	if (ret)
> +		return;
> +
> +	ret =3D fwft_set(SBI_FWFT_MISALIGNED_EXC_DELEG, 2, 0);
> +	report(ret =3D=3D SBI_ERR_INVALID_PARAM, "Set misaligned deleg feature =
invalid value error");
> +	ret =3D fwft_set(SBI_FWFT_MISALIGNED_EXC_DELEG, 0xFFFFFFFF, 0);
> +	report(ret =3D=3D SBI_ERR_INVALID_PARAM, "Set misaligned deleg feature =
invalid value error");

Something like

     if (__riscv_xlen > 32) {
        ret =3D fwft_set(SBI_FWFT_MISALIGNED_EXC_DELEG, (1ul << 32), 0);
        report(ret =3D=3D SBI_ERR_INVALID_PARAM
     }

would be a good test too (and also for the flags parameter)

> +
> +	/* Set to 0 and check after with get */
> +	ret =3D fwft_set(SBI_FWFT_MISALIGNED_EXC_DELEG, 0, 0);
> +	report(!ret, "Set misaligned deleg feature value no error");
> +	ret =3D fwft_get(SBI_FWFT_MISALIGNED_EXC_DELEG, &value);
> +	if (ret)
> +		report_fail("Get misaligned deleg feature after set");
> +	else
> +		report(value =3D=3D 0, "Set misaligned deleg feature value 0");
> +
> +	/* Set to 1 and check after with get */
> +	ret =3D fwft_set(SBI_FWFT_MISALIGNED_EXC_DELEG, 1, 0);
> +	report(!ret, "Set misaligned deleg feature value no error");
> +	ret =3D fwft_get(SBI_FWFT_MISALIGNED_EXC_DELEG, &value);
> +	if (ret)
> +		report_fail("Get misaligned deleg feature after set");
> +	else
> +		report(value =3D=3D 1, "Set misaligned deleg feature value 1");
> +
> +	install_exception_handler(EXC_LOAD_MISALIGNED, misaligned_handler);
> +
> +	asm volatile (
> +		".option norvc\n"

We also need push/pop otherwise from here on out we stop using compression
instructions.

> +		"lw %[val], 1(%[val_addr])"
> +		: [val] "+r" (value)
> +		: [val_addr] "r" (&value)
> +		: "memory");
> +
> +	if (!misaligned_handled)
> +		report_skip("Verify misaligned load exception trap in supervisor");

Why is this report_skip()? Shouldn't we just do

  report(misaligned_handled, ...)

> +	else
> +		report_pass("Verify misaligned load exception trap in supervisor");
> +
> +	install_exception_handler(EXC_LOAD_MISALIGNED, NULL);
> +
> +	report_prefix_pop();
> +}
> +
> +void check_fwft(void)
> +{
> +	struct sbiret ret;
> +
> +	report_prefix_push("fwft");
> +
> +	if (!sbi_probe(SBI_EXT_FWFT)) {
> +		report_skip("FWFT extension not available");
> +		report_prefix_pop();
> +		return;
> +	}
> +
> +	ret =3D sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_PROBE_EXT, SBI_EXT_FWFT, 0=
, 0, 0, 0, 0);
> +	report(!ret.error, "FWFT extension probing no error");
> +	if (ret.error)
> +		goto done;
> +
> +	if (ret.value =3D=3D 0) {
> +		report_skip("FWFT extension is not present");
> +		goto done;
> +	}

The above "raw" probing looks like it should have been removed when
the sbi_probe() call was added.

> +
> +	fwft_check_denied();
> +	fwft_check_misaligned();
> +done:
> +	report_prefix_pop();
> +}
> diff --git a/riscv/sbi.c b/riscv/sbi.c
> index 6f4ddaf1..8600e38e 100644
> --- a/riscv/sbi.c
> +++ b/riscv/sbi.c
> @@ -32,6 +32,8 @@
>  =

>  #define	HIGH_ADDR_BOUNDARY	((phys_addr_t)1 << 32)
>  =

> +void check_fwft(void);
> +
>  static long __labs(long a)
>  {
>  	return __builtin_labs(a);
> @@ -1451,6 +1453,7 @@ int main(int argc, char **argv)
>  	check_hsm();
>  	check_dbcn();
>  	check_susp();
> +	check_fwft();
>  =

>  	return report_summary();
>  }
> -- =

> 2.47.1
>

Nice start to the FWFT tests. After this is merged I'll add tests for
PTE_AD_HW_UPDATING. We also should get LOCK and local/global tests in
sooner than later.

Thanks,
drew

-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
