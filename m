Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 766E5E77199
	for <kvm-riscv@archiver.kernel.org>; Tue,  7 Jan 2025 17:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=brTieRsu3f2J38PFPgTnWZd11DC/o2doEh9qfKT4yOM=; b=S6UVcRQHP0Yzc7
	iFq9GH1TPVkYJhxx64iDNQgecT9L8hXrqV2uzpn3fVaekRCthmfAX/e/XUw4aET3HHdgfUh1/dfZ5
	FC5AtIOxxg2arVeR+SlJL/M4QrJ+FjQPmd6hyS3XLN4VJrLdHwi4caCQY/mYO8NtHIWAolyGm+KRu
	ExOvYy3K2MN8sFcaU1EyOaW+7A3GeZD7hWp9QxkH3Rzj3sHaTq5D4Yz5WoJLcWg6I9ZI2ww2hSSF0
	i7q/hdlWjP9vhMC4ja84/HrF6kY0ugknCIcepfFDv2m4y5towqJnOlP1jdQ7NKjipADCa1Rm+1BV7
	723qRbWCvmsoE96T9fOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVDdK-00000005u4u-0lH7;
	Tue, 07 Jan 2025 17:44:50 +0000
Received: from out-174.mta1.migadu.com ([95.215.58.174])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVDMB-00000005r01-2M2z
	for kvm-riscv@lists.infradead.org;
	Tue, 07 Jan 2025 17:27:12 +0000
Date: Tue, 7 Jan 2025 18:27:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1736270823;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EInka3Xi3NGVenf+F3gnYlNQHdGGFcUbbqf7IwFSB0k=;
	b=xj2PAsKyHO8xaKwwCSczbalSZ7j2iErQyZFdb7VxtKUMUdbqz68ntzGj2D8n/vxECx580/
	rSY/UiOEK8t6pSmX9nWop8VTe4MhOWDS1xSWGB+B17upmpPGFdTLvu8Yq2TNFWXPb3l6ea
	11DU2Nnl2ATR6rYcnWF0CLdQut4BDn8=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	Andrew Jones <ajones@ventanamicro.com>, Anup Patel <apatel@ventanamicro.com>, 
	Atish Patra <atishp@rivosinc.com>
Subject: Re: [kvm-unit-tests PATCH v4 2/5] riscv: use asm-offsets to generate
 SBI_EXT_HSM values
Message-ID: <20250107-feb21efc4c0815bd3ed7b173@orel>
References: <20241125162200.1630845-1-cleger@rivosinc.com>
 <20241125162200.1630845-3-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241125162200.1630845-3-cleger@rivosinc.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_092707_957628_340A16CC 
X-CRM114-Status: GOOD (  17.75  )
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

On Mon, Nov 25, 2024 at 05:21:51PM +0100, Cl=E9ment L=E9ger wrote:
> Replace hardcoded values with generated ones using asm-offset. This
> allows to directly use ASM_SBI_EXT_HSM and ASM_SBI_EXT_HSM_START in

ASM_SBI_EXT_HSM_HART_STOP

> assembly.
> =

> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> ---
>  riscv/Makefile           |  2 +-
>  riscv/sbi-asm.S          |  6 ++++--
>  riscv/asm-offsets-test.c | 12 ++++++++++++
>  riscv/.gitignore         |  1 +
>  4 files changed, 18 insertions(+), 3 deletions(-)
>  create mode 100644 riscv/asm-offsets-test.c
>  create mode 100644 riscv/.gitignore
> =

> diff --git a/riscv/Makefile b/riscv/Makefile
> index 28b04156..a01ff8a3 100644
> --- a/riscv/Makefile
> +++ b/riscv/Makefile
> @@ -86,7 +86,7 @@ CFLAGS +=3D -ffreestanding
>  CFLAGS +=3D -O2
>  CFLAGS +=3D -I $(SRCDIR)/lib -I $(SRCDIR)/lib/libfdt -I lib -I $(SRCDIR)=
/riscv
>  =

> -asm-offsets =3D lib/riscv/asm-offsets.h
> +asm-offsets =3D lib/riscv/asm-offsets.h riscv/asm-offsets-test.h
>  include $(SRCDIR)/scripts/asm-offsets.mak
>  =

>  %.aux.o: $(SRCDIR)/lib/auxinfo.c
> diff --git a/riscv/sbi-asm.S b/riscv/sbi-asm.S
> index 923c2cec..193d9606 100644
> --- a/riscv/sbi-asm.S
> +++ b/riscv/sbi-asm.S
> @@ -7,6 +7,8 @@
>  #define __ASSEMBLY__
>  #include <asm/asm.h>
>  #include <asm/csr.h>
> +#include <asm/asm-offsets.h>
> +#include <generated/asm-offsets-test.h>
>  =

>  #include "sbi-tests.h"
>  =

> @@ -58,8 +60,8 @@ sbi_hsm_check:
>  7:	lb	t0, 0(t1)
>  	pause
>  	beqz	t0, 7b
> -	li	a7, 0x48534d	/* SBI_EXT_HSM */
> -	li	a6, 1		/* SBI_EXT_HSM_HART_STOP */
> +	li	a7, ASM_SBI_EXT_HSM
> +	li	a6, ASM_SBI_EXT_HSM_HART_STOP
>  	ecall
>  8:	pause
>  	j	8b
> diff --git a/riscv/asm-offsets-test.c b/riscv/asm-offsets-test.c
> new file mode 100644
> index 00000000..116fe497
> --- /dev/null
> +++ b/riscv/asm-offsets-test.c
> @@ -0,0 +1,12 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +#include <kbuild.h>
> +#include <asm/sbi.h>
> +#include "sbi-tests.h"
> +
> +int main(void)
> +{
> +	DEFINE(ASM_SBI_EXT_HSM, SBI_EXT_HSM);
> +	DEFINE(ASM_SBI_EXT_HSM_HART_STOP, SBI_EXT_HSM_HART_STOP);
> +
> +	return 0;
> +}
> diff --git a/riscv/.gitignore b/riscv/.gitignore
> new file mode 100644
> index 00000000..91713581
> --- /dev/null
> +++ b/riscv/.gitignore
> @@ -0,0 +1 @@
> +/asm-offsets-test.[hs]
> -- =

> 2.45.2
>

I like this and I should probably rework stuff to replace all the _IDX
macros in riscv/sbi-tests.h. I think we should call it sbi-asm-offsets.c,
though, and then change the Makefile and .gitignore changes to refer to
riscv/*-asm-offsets.h. That would allow us to keep test-specific asm-
offsets separate and avoid the name "asm-offsets-test" or similar which,
to me, conveys it's for testing asm-offsets.

Thanks,
drew

-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
