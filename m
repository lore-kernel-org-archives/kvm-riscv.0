Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4407BC36000
	for <kvm-riscv@archiver.kernel.org>; Thu, 20 Mar 2025 13:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XN74uAebPG1Y2ouMxPql2aDktfIuUK2aJKP03HH7T4o=; b=0U7HHJG5LLmS31
	r9Tv6qXN351UsIgoF472qk9vRdjO1XRSIKrYmv5l0WSSfiX0ny5bq7QNpAQQXRtR+Otgc/myBC9zk
	Xmc7Y+1MgVQT1fxr8T6ei8+3GhRLq7TPAyDPCkWemFr+Iph7dmQx+L5eCfMY67CP8goA3SVbqX8uQ
	jovM+d3XMKYMhwZO+IyP7jbzc2zs1Ag+3tUp+ELgZOl+dVoctg02zARSBxlSj75ctoynoqafoZmkV
	8wlVPsNimgxh+nVmwOdozo7M+mMQb2KCRncdtCLqFvy3rRPpqXK4m2d9fGljFS+vVAEIqt27Bw0U3
	RgNGhxxrHCNLdJ5a9slw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvG4b-0000000CFzq-3gS2;
	Thu, 20 Mar 2025 13:36:37 +0000
Received: from out-174.mta0.migadu.com ([2001:41d0:1004:224b::ae])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvG4X-0000000CFxT-2Qlk
	for kvm-riscv@lists.infradead.org;
	Thu, 20 Mar 2025 13:36:36 +0000
Date: Thu, 20 Mar 2025 14:36:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1742477789;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aEuneCpX2PcaS+tZZlfKCHOTfh8n4va050LvywoLtyg=;
	b=f/mFItOAunYnk5+Nw7Jy39RL+QuZJCsxRL0zzpIN4jIagh3XHT/eS8/SBHMOyogSqEKNTa
	EjEGon+wABUQ9tbMnhfc03YG9Gzf9HEpdqLRWePrjKMiBSoFiz7L2oxTEdtnhCGiHLxtUV
	f59ESLWZpVZQgwJk/n8hyBHtmldDL6M=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	Andrew Jones <ajones@ventanamicro.com>, Anup Patel <apatel@ventanamicro.com>, 
	Atish Patra <atishp@rivosinc.com>
Subject: Re: [kvm-unit-tests PATCH v11 3/8] riscv: Use asm-offsets to
 generate SBI_EXT_HSM values
Message-ID: <20250320-3db2b32593ec175998ef03b8@orel>
References: <20250317164655.1120015-1-cleger@rivosinc.com>
 <20250317164655.1120015-4-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250317164655.1120015-4-cleger@rivosinc.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_063633_762993_4D1FA202 
X-CRM114-Status: GOOD (  17.94  )
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

On Mon, Mar 17, 2025 at 05:46:48PM +0100, Cl=E9ment L=E9ger wrote:
> Replace hardcoded values with generated ones using sbi-asm-offset. This
> allows to directly use ASM_SBI_EXT_HSM and ASM_SBI_EXT_HSM_STOP in
> assembly.
> =

> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> Reviewed-by: Andrew Jones <andrew.jones@linux.dev>
> ---
>  riscv/Makefile          |  2 +-
>  riscv/sbi-asm.S         |  6 ++++--
>  riscv/sbi-asm-offsets.c | 11 +++++++++++
>  riscv/.gitignore        |  1 +
>  4 files changed, 17 insertions(+), 3 deletions(-)
>  create mode 100644 riscv/sbi-asm-offsets.c
>  create mode 100644 riscv/.gitignore
> =

> diff --git a/riscv/Makefile b/riscv/Makefile
> index ae9cf02a..02d2ac39 100644
> --- a/riscv/Makefile
> +++ b/riscv/Makefile
> @@ -87,7 +87,7 @@ CFLAGS +=3D -ffreestanding
>  CFLAGS +=3D -O2
>  CFLAGS +=3D -I $(SRCDIR)/lib -I $(SRCDIR)/lib/libfdt -I lib -I $(SRCDIR)=
/riscv
>  =

> -asm-offsets =3D lib/riscv/asm-offsets.h
> +asm-offsets =3D lib/riscv/asm-offsets.h riscv/sbi-asm-offsets.h
>  include $(SRCDIR)/scripts/asm-offsets.mak
>  =

>  .PRECIOUS: %.aux.o
> diff --git a/riscv/sbi-asm.S b/riscv/sbi-asm.S
> index f4185496..51f46efd 100644
> --- a/riscv/sbi-asm.S
> +++ b/riscv/sbi-asm.S
> @@ -6,6 +6,8 @@
>   */
>  #include <asm/asm.h>
>  #include <asm/csr.h>
> +#include <asm/asm-offsets.h>
> +#include <generated/sbi-asm-offsets.h>

Doing this causes sbi-asm.o to depend on generated files, so I had to add
the change below to the Makefile in order for 'make -j' to work.

Thanks,
drew


diff --git a/riscv/Makefile b/riscv/Makefile
index 02d2ac392f11..e4dba6772377 100644
--- a/riscv/Makefile
+++ b/riscv/Makefile
@@ -19,6 +19,8 @@ all: $(tests)

 $(TEST_DIR)/sbi-deps =3D $(TEST_DIR)/sbi-asm.o $(TEST_DIR)/sbi-fwft.o

+all_deps +=3D $($(TEST_DIR)/sbi-deps)
+
 # When built for EFI sieve needs extra memory, run with e.g. '-m 256' on Q=
EMU
 $(TEST_DIR)/sieve.$(exe): AUXFLAGS =3D 0x1

@@ -134,7 +136,7 @@ else
 endif

 generated-files =3D $(asm-offsets)
-$(tests:.$(exe)=3D.o) $(cstart.o) $(cflatobjs): $(generated-files)
+$(tests:.$(exe)=3D.o) $(cstart.o) $(cflatobjs) $(all_deps): $(generated-fi=
les)

 arch_clean: asm_offsets_clean
        $(RM) $(TEST_DIR)/*.{o,flat,elf,so,efi,debug} \

>  =

>  #include "sbi-tests.h"
>  =

> @@ -57,8 +59,8 @@ sbi_hsm_check:
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
> index 00000000..bd37b6a2
> --- /dev/null
> +++ b/riscv/sbi-asm-offsets.c
> @@ -0,0 +1,11 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +#include <kbuild.h>
> +#include <asm/sbi.h>
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

> 2.47.2
> =


-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
