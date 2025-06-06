Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7D0BC5AD49
	for <kvm-riscv@archiver.kernel.org>; Fri,  6 Jun 2025 08:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kI77R+aObAr9CvdQYXw1h4GcRWl5J4Cg+dMUDoAAKVU=; b=ysTd93mbCvRuc4
	x2avDELF8R3BF4W6rD9bHDhWci2136+mMfI0XnTVzcKzKdaFUaHwFw85hkTxN6PCoiH+CYlazAmWB
	GhiEgYCY/wXo5G0PVEx8MAgLRasczobxHYfrozVvW1CS2920HodnzfIC9FYXb1ZAZd5jacgn5+ul1
	+hw8bL5JXEyUetvcjL0f4FxG4f6p+RMwWL1ORJSw3uGhC4y4ehPLbPtIwHjfb9Va5pbs5gALrcDRU
	1WMTuhC0x++O7Hh5jwHjv/O4y0v+hGYqnqqLXmwWyze6wTU5hRF6gFVPsUQ8Ilnxd4nfHPi2K203f
	oL07X2bjaAY0SDz+u7VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNSkk-0000000HRev-2DNw;
	Fri, 06 Jun 2025 08:48:42 +0000
Received: from out-171.mta0.migadu.com ([2001:41d0:1004:224b::ab])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNSki-0000000HRdN-0RKC
	for kvm-riscv@lists.infradead.org;
	Fri, 06 Jun 2025 08:48:41 +0000
Date: Fri, 6 Jun 2025 10:48:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749199717;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+Y0ncs7BntoLmuGjS33PPF7FAyz1oiPPPcRfIV0w5m8=;
	b=Ib1Pd6/qGTY380nEHOlMndskLTkkdMiTv3zcj2QyRFSWXWjgCG6sHcIw0NJVA4j1I5PePi
	VSL16V3jHFtLhDE2zVtrPwdn7kBC+13ztukljn65fDsNFgojEFZzSWyvFG2sRFDs4McZfu
	LlT81dtXkToPhuGk5Syujhj6KM5SDgI=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Jesse Taube <jesse@rivosinc.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-kselftest@vger.kernel.org, Atish Patra <atishp@atishpatra.org>, 
	Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, Himanshu Chauhan <hchauhan@ventanamicro.com>, 
	Charlie Jenkins <charlie@rivosinc.com>
Subject: Re: [kvm-unit-tests PATCH v3 2/2] riscv: sbi: Add SBI Debug Triggers
 Extension tests
Message-ID: <20250606-1b7c5285a3c731597f970c1d@orel>
References: <20250605161806.1206850-1-jesse@rivosinc.com>
 <20250605161806.1206850-2-jesse@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250605161806.1206850-2-jesse@rivosinc.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_014840_346668_777414D5 
X-CRM114-Status: GOOD (  18.03  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Jun 05, 2025 at 09:18:06AM -0700, Jesse Taube wrote:
> Add tests for the DBTR SBI extension.
> 
> Signed-off-by: Jesse Taube <jesse@rivosinc.com>
> ---
> V1 -> V2:
>  - Call report_prefix_pop before returning
>  - Disable compressed instructions in exec_call, update related comment
>  - Remove extra "| 1" in dbtr_test_load
>  - Remove extra newlines
>  - Remove extra tabs in check_exec
>  - Remove typedefs from enums
>  - Return when dbtr_install_trigger fails
>  - s/avalible/available/g
>  - s/unistall/uninstall/g
> V2 -> V3:
>  - Change SBI_DBTR_SHMEM_INVALID_ADDR to -1UL
>  - Move all dbtr functions to sbi-dbtr.c
>  - Move INSN_LEN to processor.h
>  - Update include list
>  - Use C-style comments
> ---
>  lib/riscv/asm/sbi.h |   1 +
>  riscv/Makefile      |   1 +
>  riscv/sbi-dbtr.c    | 811 ++++++++++++++++++++++++++++++++++++++++++++
>  riscv/sbi-tests.h   |   1 +
>  riscv/sbi.c         |   1 +
>  5 files changed, 815 insertions(+)
>  create mode 100644 riscv/sbi-dbtr.c
> 
> diff --git a/lib/riscv/asm/sbi.h b/lib/riscv/asm/sbi.h
> index a5738a5c..78fd6e2a 100644
> --- a/lib/riscv/asm/sbi.h
> +++ b/lib/riscv/asm/sbi.h
> @@ -51,6 +51,7 @@ enum sbi_ext_id {
>  	SBI_EXT_SUSP = 0x53555350,
>  	SBI_EXT_FWFT = 0x46574654,
>  	SBI_EXT_SSE = 0x535345,
> +	SBI_EXT_DBTR = 0x44425452,
>  };
>  
>  enum sbi_ext_base_fid {
> diff --git a/riscv/Makefile b/riscv/Makefile
> index 11e68eae..55c7ac93 100644
> --- a/riscv/Makefile
> +++ b/riscv/Makefile
> @@ -20,6 +20,7 @@ all: $(tests)
>  $(TEST_DIR)/sbi-deps += $(TEST_DIR)/sbi-asm.o
>  $(TEST_DIR)/sbi-deps += $(TEST_DIR)/sbi-fwft.o
>  $(TEST_DIR)/sbi-deps += $(TEST_DIR)/sbi-sse.o
> +$(TEST_DIR)/sbi-deps += $(TEST_DIR)/sbi-dbtr.o
>  
>  all_deps += $($(TEST_DIR)/sbi-deps)
>  
> diff --git a/riscv/sbi-dbtr.c b/riscv/sbi-dbtr.c
> new file mode 100644
> index 00000000..a4bfa41e
> --- /dev/null
> +++ b/riscv/sbi-dbtr.c
> @@ -0,0 +1,811 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * SBI DBTR testsuite
> + *
> + * Copyright (C) 2025, Rivos Inc., Jesse Taube <jesse@rivosinc.com>
> + */
> +
> +#include <asm/io.h>
> +#include <bitops.h>
> +#include <asm/processor.h>
> +
> +#include "sbi-tests.h"

Still missing at least libcflat.h (report_*). I'm not a big fan of
libcflat.h (a collection of random stuff...), but until somebody
gets around to dividing it up correctly, then pretty much every
unit test file will need it.

> +
> +#define SBI_DBTR_SHMEM_INVALID_ADDR	(-1UL)

I was going to complain that my suggestion to use get_invalid_addr() was
ignored, but now I see that SBI_DBTR_SHMEM_INVALID_ADDR isn't used at all?

Thanks,
drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
