Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B09B3C02180
	for <kvm-riscv@archiver.kernel.org>; Wed, 15 Jan 2025 11:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zCQg9BnI/AC0x7QcDTn5ikKPDK1MKks1vDUeJENElXU=; b=do+OeGCFWsQLEX
	2cRZXd0O97qUMKgvYkd/Px8I7hUhlkzXJICWSTHnerGduwttEfwZ2Fo5Bivcqbyu+9DGuv6GPgk49
	p8FVRjJo9uuukN2d3Rk3KQB+iymUVe7nNl8aHvywODRODU3eGBLApLtFyRpL3GbuI/wLQ23v3fT3D
	mCBMoOaSdMoVG09GWwoNeWN/+7jj6kD1jLXfZjlE16JMCPXnG5mLw3vbSqKF5MVkF251lCy2dnZLg
	jleOM6+LF6yUMDDDHAIVmmMVN+J6LJFQC779mTvbDkVYbkz0s5fPVcalv+ln9ptsYO/S7keNqGr0T
	jU6x8/DKbN7vmE/PZNLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY1yu-0000000BleL-1mZI;
	Wed, 15 Jan 2025 11:54:44 +0000
Received: from out-171.mta1.migadu.com ([2001:41d0:203:375::ab])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY1y0-0000000Bl9p-47Ri
	for kvm-riscv@lists.infradead.org;
	Wed, 15 Jan 2025 11:53:50 +0000
Date: Wed, 15 Jan 2025 12:53:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1736942026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1sco8ktW39kqonSXUGt7UzTB7sldMgmov4ALg1LT3J8=;
	b=jIxEzcRqQj2BGFcCwQxk1BAbzZUh1p7LSk5gJqBlcJ3ONXm6x4pP3wtBL66rgthNwqpfsr
	FhjtPaouQc3AGVwcdh6wCj9aXAL0j6hpEN0J3KcuDGts5bsGzcitrXZvbI+tUkgFp+g40E
	6zNVinfkYrCBB56fWq16FUQL45EbeEs=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	Andrew Jones <ajones@ventanamicro.com>, Anup Patel <apatel@ventanamicro.com>, 
	Atish Patra <atishp@rivosinc.com>
Subject: Re: [kvm-unit-tests PATCH v6 2/5] riscv: use asm-offsets to generate
 SBI_EXT_HSM values
Message-ID: <20250115-b08dfc4dd3d73ce95bece07c@orel>
References: <20250110111247.2963146-1-cleger@rivosinc.com>
 <20250110111247.2963146-3-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250110111247.2963146-3-cleger@rivosinc.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_035349_166125_694A4341 
X-CRM114-Status: GOOD (  15.26  )
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

On Fri, Jan 10, 2025 at 12:12:41PM +0100, Cl=E9ment L=E9ger wrote:
> Replace hardcoded values with generated ones using sbi-asm-offset. This
> allows to directly use ASM_SBI_EXT_HSM and ASM_SBI_EXT_HSM_STOP in
> assembly.
> =

> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> ---
>  riscv/Makefile          |  2 +-
>  riscv/sbi-asm.S         |  6 ++++--
>  riscv/sbi-asm-offsets.c | 12 ++++++++++++
>  riscv/.gitignore        |  1 +
>  4 files changed, 18 insertions(+), 3 deletions(-)
>  create mode 100644 riscv/sbi-asm-offsets.c
>  create mode 100644 riscv/.gitignore
> =

> diff --git a/riscv/Makefile b/riscv/Makefile
> index 28b04156..af5ee495 100644
> --- a/riscv/Makefile
> +++ b/riscv/Makefile
> @@ -86,7 +86,7 @@ CFLAGS +=3D -ffreestanding
>  CFLAGS +=3D -O2
>  CFLAGS +=3D -I $(SRCDIR)/lib -I $(SRCDIR)/lib/libfdt -I lib -I $(SRCDIR)=
/riscv
>  =

> -asm-offsets =3D lib/riscv/asm-offsets.h
> +asm-offsets =3D lib/riscv/asm-offsets.h riscv/sbi-asm-offsets.h
>  include $(SRCDIR)/scripts/asm-offsets.mak
>  =

>  %.aux.o: $(SRCDIR)/lib/auxinfo.c
> diff --git a/riscv/sbi-asm.S b/riscv/sbi-asm.S
> index 923c2cec..b9c2696f 100644
> --- a/riscv/sbi-asm.S
> +++ b/riscv/sbi-asm.S
> @@ -7,6 +7,8 @@
>  #define __ASSEMBLY__
>  #include <asm/asm.h>
>  #include <asm/csr.h>
> +#include <asm/asm-offsets.h>
> +#include <generated/sbi-asm-offsets.h>
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
> diff --git a/riscv/sbi-asm-offsets.c b/riscv/sbi-asm-offsets.c
> new file mode 100644
> index 00000000..116fe497
> --- /dev/null
> +++ b/riscv/sbi-asm-offsets.c
> @@ -0,0 +1,12 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +#include <kbuild.h>
> +#include <asm/sbi.h>
> +#include "sbi-tests.h"

Don't need to include sbi-tests.h

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
> index 00000000..0a8c5a36
> --- /dev/null
> +++ b/riscv/.gitignore
> @@ -0,0 +1 @@
> +/*-asm-offsets.[hs]
> -- =

> 2.47.1
>

Otherwise,

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>

-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
