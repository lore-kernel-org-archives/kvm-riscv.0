Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 856B0C0218C
	for <kvm-riscv@archiver.kernel.org>; Fri, 24 Jan 2025 16:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h82jZiWY3/kLbXIBJfgnsVww5Lz2uPEyx3GcHSSm1Fk=; b=V0rKR2tPEQVHCp
	ANwuin+UOMwYrREZnkBFWmaK4DkhYTuWBYWVRTKKjQMSBwvDUVEJ92Pk+21av51zp/IZwuVbYnPHb
	NFK9G4mOrNPwqQTpydBZVpGExXLZ9kcB7XwQ7++3TlPVwWYzZ18dSFjVAbP7lWJGpTkn29tgBEjlt
	+2OtReSeIddlfHdsrEg5Z8Lwf7I8W3I0RRaEI03N9ed+vAGoF5I2BxlDvD2UOu3zRVizVyB3UQEIT
	LMWqVR7v2eauRegSwLr2eD06ozkSWYZtEi2oTALzfzUXCRev8ZHm3qfZop7n1iQxypmcZm0JeaV19
	Uk8V6/smhJ5pBFDISP6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbMeZ-0000000F7vh-2m7V;
	Fri, 24 Jan 2025 16:35:31 +0000
Received: from out-178.mta1.migadu.com ([2001:41d0:203:375::b2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbMeV-0000000F7v6-3pIj
	for kvm-riscv@lists.infradead.org;
	Fri, 24 Jan 2025 16:35:30 +0000
Date: Fri, 24 Jan 2025 17:35:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737736523;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TBvy3cn+7B8JfgZOYf5cAwUbsAsHkrbgul8p0tw44Gk=;
	b=bdKUJ4E9iiAwUlQOlRWnDihpv3Cd20du6z0/5fdKHpMG7miGFgDp32NkOsppvg9rOtWTmf
	6X2M5IcdFOKDshCutCkRPXXmNjP/KqR2mp0MFEZOh77K+57+b//1Iud3TieLR6MRd/lknv
	nSOnwZlvz3Mmo8ulL7oi8UZalsH9HBQ=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	Andrew Jones <ajones@ventanamicro.com>, Anup Patel <apatel@ventanamicro.com>, 
	Atish Patra <atishp@rivosinc.com>
Subject: Re: [kvm-unit-tests PATCH v2 2/2] riscv: Add tests for SBI FWFT
 extension
Message-ID: <20250123-c4b9bac80893db142bc99690@orel>
References: <20250123165405.3524478-1-cleger@rivosinc.com>
 <20250123165405.3524478-3-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250123165405.3524478-3-cleger@rivosinc.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_083528_464271_13690636 
X-CRM114-Status: GOOD (  33.04  )
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

On Thu, Jan 23, 2025 at 05:54:04PM +0100, Cl=E9ment L=E9ger wrote:
> Add tests for the FWFT SBI extension. Currently, only the reserved range
> as well as the misaligned exception delegation are used.
> =

> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> ---
>  riscv/Makefile      |   2 +-
>  lib/riscv/asm/sbi.h |  34 ++++++++
>  riscv/sbi-fwft.c    | 189 ++++++++++++++++++++++++++++++++++++++++++++
>  riscv/sbi.c         |   3 +
>  4 files changed, 227 insertions(+), 1 deletion(-)
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
> index 00000000..7866a917
> --- /dev/null
> +++ b/riscv/sbi-fwft.c
> @@ -0,0 +1,189 @@
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
> +
> +static struct sbiret fwft_set_raw(unsigned long feature_id, unsigned lon=
g value,
> +				  unsigned long flags)
> +{
> +	return sbi_ecall(SBI_EXT_FWFT, SBI_EXT_FWFT_SET, feature_id, value,
> +			 flags, 0, 0, 0);
> +}
> +
> +static struct sbiret fwft_set(uint32_t feature_id, unsigned long value,
> +			      unsigned long flags)
> +{
> +	return fwft_set_raw(feature_id, value, flags);
> +}
> +
> +static struct sbiret fwft_get_raw(unsigned long feature_id)
> +{
> +	return sbi_ecall(SBI_EXT_FWFT, SBI_EXT_FWFT_GET, feature_id, 0, 0, 0, 0,
> +			 0);
> +}
> +
> +static struct sbiret fwft_get(uint32_t feature_id)
> +{
> +	return fwft_get_raw(feature_id);
> +}

nit: s/feature_id/feature/ for all the above, as that would exactly match
the spec, but no biggy.

> +
> +static void fwft_check_reserved(unsigned long id)
> +{
> +	struct sbiret ret;
> +
> +	ret =3D fwft_get(id);
> +	report(ret.error =3D=3D SBI_ERR_DENIED,
> +	       "get reserved feature 0x%lx error =3D=3D SBI_ERR_DENIED", id);
> +
> +	ret =3D fwft_set(id, 1, 0);
> +	report(ret.error =3D=3D SBI_ERR_DENIED,
> +	       "set reserved feature 0x%lx error =3D=3D SBI_ERR_DENIED", id);

I think we need something like gen_report(), which is in riscv/sbi.c, in
order to output the unexpected errors if we don't get what we expect. I've
pushed a few patches to my riscv/sbi branch[1] in order to provide
sbiret_report_error().

[1] https://gitlab.com/jones-drew/kvm-unit-tests/-/commits/riscv/sbi

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
> +		report(ret.error =3D=3D SBI_ERR_INVALID_PARAM,
> +		"get feature 0x%lx error =3D=3D SBI_ERR_INVALID_PARAM", BIT(32));

Need to indent the string under ret.error.

> +
> +		ret =3D fwft_set_raw(BIT(32), 0, 0);
> +		report(ret.error =3D=3D SBI_ERR_INVALID_PARAM,
> +		"set feature 0x%lx error =3D=3D SBI_ERR_INVALID_PARAM", BIT(32));

Need to indent the string under ret.error.

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
> +static void fwft_check_misaligned_exc_deleg(void)
> +{
> +	struct sbiret ret;
> +
> +	report_prefix_push("misaligned_exc_deleg");
> +
> +	ret =3D fwft_get(SBI_FWFT_MISALIGNED_EXC_DELEG);
> +	if (ret.error =3D=3D SBI_ERR_NOT_SUPPORTED) {
> +		report_skip("SBI_FWFT_MISALIGNED_EXC_DELEG is not supported");
> +		return;
> +	}
> +	report(!ret.error, "Get misaligned deleg feature no error: %lx",
> +	       ret.error);
> +	if (ret.error)
> +		return;

With the new sbiret_report_error() this can become

  if (!sbiret_report_error(ret, 0, "Get misaligned deleg feature no error"))
      return;

> +
> +	ret =3D fwft_set(SBI_FWFT_MISALIGNED_EXC_DELEG, 2, 0);
> +	report(ret.error =3D=3D SBI_ERR_INVALID_PARAM,
> +	       "Set misaligned deleg feature invalid value error");
> +	ret =3D fwft_set(SBI_FWFT_MISALIGNED_EXC_DELEG, 0xFFFFFFFF, 0);
> +	report(ret.error =3D=3D SBI_ERR_INVALID_PARAM,
> +	       "Set misaligned deleg feature invalid value error");

Need sbiret_report_error() to ensure we can see what the returned error
was if it isn't what we expected.

We should have a different error message for each test so testers can
look up the one that failed by the message. Maybe just output the
invalid test value too.

> +
> +	if (__riscv_xlen > 32) {
> +		ret =3D fwft_set(SBI_FWFT_MISALIGNED_EXC_DELEG, BIT(32), 0);
> +		report(ret.error =3D=3D SBI_ERR_INVALID_PARAM,
> +		       "Set misaligned deleg with value > 32bits invalid param error");
> +
> +		ret =3D fwft_set(SBI_FWFT_MISALIGNED_EXC_DELEG, 0, BIT(32));
> +		report(ret.error =3D=3D SBI_ERR_INVALID_PARAM,
> +		       "Set misaligned deleg with flag > 32bits invalid param error");

Same two comments as above.

> +	}
> +
> +	/* Set to 0 and check after with get */
> +	ret =3D fwft_set(SBI_FWFT_MISALIGNED_EXC_DELEG, 0, 0);
> +	report(!ret.error, "Set misaligned deleg feature value no error");

 sbiret_report_error()

> +	ret =3D fwft_get(SBI_FWFT_MISALIGNED_EXC_DELEG);
> +	if (ret.error)
> +		report_fail("Get misaligned deleg feature after set: %lx",
> +			    ret.error);
> +	else
> +		report(ret.value =3D=3D 0, "Set misaligned deleg feature value 0");

 sbiret_report(ret, 0, 0, "get/set misaligned deleg feature value 0")

> +
> +	/* Set to 1 and check after with get */
> +	ret =3D fwft_set(SBI_FWFT_MISALIGNED_EXC_DELEG, 1, 0);
> +	report(!ret.error, "Set misaligned deleg feature value no error");
> +	ret =3D fwft_get(SBI_FWFT_MISALIGNED_EXC_DELEG);
> +	if (ret.error)
> +		report_fail("Get misaligned deleg feature after set: %lx",
> +			    ret.error);
> +	else
> +		report(ret.value =3D=3D 1, "Set misaligned deleg feature value 1");

Same sbiret_report_error / sbiret_report comments as above.

We should get SBI_ERR_NOT_SUPPORTED if the platform doesn't support
delegating misaligned exceptions, right? If so, then we should tolerate
that and skip the trap test below.

> +
> +	install_exception_handler(EXC_LOAD_MISALIGNED, misaligned_handler);
> +
> +	asm volatile (
> +		".option push\n"
> +		/*
> +		 * Disable compression so the lw takes exactly 4 bytes and thus
> +		 * can be skipped reliably from the exception handler.
> +		 */
> +		".option arch,-c\n"

What's the difference between this and .option norvc ?

> +		"lw %[val], 1(%[val_addr])\n"
> +		".option pop\n"
> +		: [val] "+r" (ret.value)
> +		: [val_addr] "r" (&ret.value)
> +		: "memory");
> +
> +	if (!misaligned_handled)
> +		report_skip("Verify misaligned load exception trap in supervisor");

If we skip this test when we can't set SBI_FWFT_MISALIGNED_EXC_DELEG to 1,
then we should always fail this test when we don't get the exception.

> +	else
> +		report_pass("Verify misaligned load exception trap in supervisor");
> +
> +	install_exception_handler(EXC_LOAD_MISALIGNED, NULL);
> +
> +	/* Lock the feature */
> +	ret =3D fwft_set(SBI_FWFT_MISALIGNED_EXC_DELEG, 0, SBI_FWFT_SET_FLAG_LO=
CK);
> +	report(!ret.error, "Set misaligned deleg feature value 0 and lock no er=
ror");
> +	ret =3D fwft_set(SBI_FWFT_MISALIGNED_EXC_DELEG, 1, 0);
> +	report(ret.error =3D=3D SBI_ERR_LOCKED,
> +	       "Set misaligned deleg feature value 0 and lock no error");
> +	ret =3D fwft_get(SBI_FWFT_MISALIGNED_EXC_DELEG);
> +	report(!ret.error, "Get misaligned deleg locked value no error");

Need sbiret_report_error() for all these tests.

> +
> +	report_prefix_pop();
> +}
> +
> +void check_fwft(void)
> +{
> +	report_prefix_push("fwft");
> +
> +	if (!sbi_probe(SBI_EXT_FWFT)) {
> +		report_skip("FWFT extension not available");
> +		report_prefix_pop();
> +		return;
> +	}
> +
> +	fwft_check_base();
> +	fwft_check_misaligned_exc_deleg();
> +
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

Thanks,
drew

-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
