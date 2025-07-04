Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F8B6C83F0C
	for <kvm-riscv@archiver.kernel.org>; Fri,  4 Jul 2025 09:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lumNeYu3c2V+JPwwdPby37VibfXnUGjZzemF9D9du+E=; b=dhOFAxufUi+ooi
	KalvsOydRyDpqN/llmw23k81UP697iL28fEAVKUWusp+lXhoE/9aCj5iI2bMOyDoy0wdKtP/Hph+z
	meV/HIacy7XWeOYnyaoQ0I/dgleS0YriP5hTtc530I0UjmH3LLWmvasM3viCya1WxgONnk11xUyPj
	yXsRgwidVKRNKCv6QgKMcRTzWOa4T+SMR23GrpPdX60vNcpZr45OLXSux2U5EbhpB3XsHlId8zjz4
	joOyIAeiO9EQPcc7mFkux9EppiRdJIF+KhQt4EmOXaztHPL8GJFN5RaJ9+vK6W0WDHFql7Tn/4h65
	X34XmBtxm3jr0C7v1vNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXcIK-0000000Dqqj-0xP0;
	Fri, 04 Jul 2025 09:01:20 +0000
Received: from out-186.mta0.migadu.com ([2001:41d0:1004:224b::ba])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXbkY-0000000DjVO-3GmS
	for kvm-riscv@lists.infradead.org;
	Fri, 04 Jul 2025 08:26:28 +0000
Date: Fri, 4 Jul 2025 10:26:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751617582;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BLuiC3GK+gBvNhBFSKYbY6othCmyRdGRrBJ98b0dw2g=;
	b=O/KeGp18sv8U3Wmy1pNjriUFJ4BC0DT1Oy4toWt8ZaSSRugTLk8eYxb9ib8a/0X8+ORC96
	vOL53MvzvpprNrxEisYnpILjJGsEU/qmzD9pDV3cNqXY1ZH1KhdXDRov0PfT66tAAUBHkK
	3hcFcu0FMwtFvH/zG8Gv+D4EvmZS9fM=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Jesse Taube <jesse@rivosinc.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-kselftest@vger.kernel.org, =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Charlie Jenkins <charlie@rivosinc.com>
Subject: Re: [kvm-unit-tests PATCH] riscv: Use norvc over arch, -c
Message-ID: <20250704-d34a50590233beaf67e66044@orel>
References: <20250704015837.1700249-1-jesse@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250704015837.1700249-1-jesse@rivosinc.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_012626_958162_3CB8326B 
X-CRM114-Status: GOOD (  14.79  )
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

On Thu, Jul 03, 2025 at 06:58:37PM -0700, Jesse Taube wrote:
> The Linux kernel main tree uses "norvc" over
> "arch, -c" change to match this.
> =

> GCC 15 started to add _zca_zcd to the assembler flags causing a bug
> which made "arch, -c" generate a compressed instruction.
> =

> Link: https://sourceware.org/bugzilla/show_bug.cgi?id=3D33128
> Cc: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> Signed-off-by: Jesse Taube <jesse@rivosinc.com>
> ---
>  riscv/isa-dbltrp.c | 2 +-
>  riscv/sbi-dbtr.c   | 2 +-
>  riscv/sbi-fwft.c   | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> =

> diff --git a/riscv/isa-dbltrp.c b/riscv/isa-dbltrp.c
> index b7e21589..af12860c 100644
> --- a/riscv/isa-dbltrp.c
> +++ b/riscv/isa-dbltrp.c
> @@ -26,7 +26,7 @@ do {										\
>  	unsigned long value =3D 0;						\
>  	asm volatile(								\
>  	"	.option push\n"							\
> -	"	.option arch,-c\n"						\
> +	"	.option norvc\n"						\
>  	"	sw %0, 0(%1)\n"							\
>  	"	.option pop\n"							\
>  	: : "r" (value), "r" (ptr) : "memory");					\
> diff --git a/riscv/sbi-dbtr.c b/riscv/sbi-dbtr.c
> index c4ccd81d..129f79b8 100644
> --- a/riscv/sbi-dbtr.c
> +++ b/riscv/sbi-dbtr.c
> @@ -134,7 +134,7 @@ static __attribute__((naked)) void exec_call(void)
>  {
>  	/* skip over nop when triggered instead of ret. */
>  	asm volatile (".option push\n"
> -		      ".option arch, -c\n"
> +		      ".option norvc\n"
>  		      "nop\n"
>  		      "ret\n"
>  		      ".option pop\n");
> diff --git a/riscv/sbi-fwft.c b/riscv/sbi-fwft.c
> index 8920bcb5..fda7eb52 100644
> --- a/riscv/sbi-fwft.c
> +++ b/riscv/sbi-fwft.c
> @@ -174,7 +174,7 @@ static void fwft_check_misaligned_exc_deleg(void)
>  		 * Disable compression so the lw takes exactly 4 bytes and thus
>  		 * can be skipped reliably from the exception handler.
>  		 */
> -		".option arch,-c\n"
> +		".option norvc\n"
>  		"lw %[val], 1(%[val_addr])\n"
>  		".option pop\n"
>  		: [val] "+r" (ret.value)
> -- =

> 2.43.0
> =

> =

> -- =

> kvm-riscv mailing list
> kvm-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

Merged. Thanks

-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
