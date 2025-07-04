Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48DBEC83F03
	for <kvm-riscv@archiver.kernel.org>; Fri,  4 Jul 2025 09:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z2+JX/qgJXrPGPK+5I0k7Emhs9dh8JRyXvjarylJBF0=; b=2P6NsaKML1caxP
	j8KPPBF1AxLlmdeWDnWk5K9RvS1bheFZSYoO0G1GuSh/0s8eTx5TnvwD4JqFECmWQI0fPdhgc1DCc
	xWMVpgRZwom21YygDfwo1DDekDRBeHdoUd4zl5++wm8XzvG5fXIFXegg15dlK5ww0SI5gfyImIJyb
	ko0ZypEhehGNT8tCKJrORuZ+Xwz+6K3GLuxY+TEDAR/e1IlW1Rn1NrNWIbG6T3l2VYVEsUAsBCqAC
	Lw/CahMEUTzpv1p/FiXMIpWK9REz/LPt42SIdp+hKVan3reTlllS28odyY7tcuXvfjdlNpdgRP1y/
	BND/acCs188zJuI8M97g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXcIG-0000000Dqny-4AdW;
	Fri, 04 Jul 2025 09:01:17 +0000
Received: from out-186.mta1.migadu.com ([2001:41d0:203:375::ba])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXbc9-0000000DhPE-364j
	for kvm-riscv@lists.infradead.org;
	Fri, 04 Jul 2025 08:17:47 +0000
Date: Fri, 4 Jul 2025 10:17:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751617061;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ASASzrlKQboUIkLWluBZCrMel/BU8gIUIO5M+yGTLBA=;
	b=DOepv9ob4oyEgjlwBbB1vq7+7jS4+iMelHgcPgmwT+0LSL9PngbsDS1WFEIz7g4iXTIm+h
	CFrbZdLKyj25uRPSu+SLUGfRvUj1rC8DDIzz0Ts5LjZT+kFlTd5/M3CDq6L6LiazYQ/G8B
	iPQxH8ltXx5yJQYujzO5OLz2R9awH1w=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Jesse Taube <jesse@rivosinc.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-kselftest@vger.kernel.org, =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, James Raphael Tiovalen <jamestiotio@gmail.com>, 
	Sean Christopherson <seanjc@google.com>, Cade Richard <cade.richard@gmail.com>
Subject: Re: [kvm-unit-tests PATCH] riscv: lib: Add sbi-exit-code to
 configure and environment
Message-ID: <20250704-d2ca01be799a71427b5163f9@orel>
References: <20250703133601.1396848-1-jesse@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250703133601.1396848-1-jesse@rivosinc.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_011746_202166_80D4AECD 
X-CRM114-Status: GOOD (  25.15  )
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

On Thu, Jul 03, 2025 at 06:36:00AM -0700, Jesse Taube wrote:
> Add --[enable|disable]-sbi-exit-code to configure script.
> With the default value disabled.
> Add a check for SBI_PASS_EXIT_CODE in the environment, so that passing
> of the test status is configurable from both the
> environment and the configure script
> 
> Signed-off-by: Jesse Taube <jesse@rivosinc.com>
> ---
>  configure      | 11 +++++++++++
>  lib/riscv/io.c | 12 +++++++++++-
>  2 files changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/configure b/configure
> index 20bf5042..7c949bdc 100755
> --- a/configure
> +++ b/configure
> @@ -67,6 +67,7 @@ earlycon=
>  console=
>  efi=
>  efi_direct=
> +sbi_exit_code=0
>  target_cpu=
>  
>  # Enable -Werror by default for git repositories only (i.e. developer builds)
> @@ -141,6 +142,9 @@ usage() {
>  	                           system and run from the UEFI shell. Ignored when efi isn't enabled
>  	                           and defaults to enabled when efi is enabled for riscv64.
>  	                           (arm64 and riscv64 only)
> +	    --[enable|disable]-sbi-exit-code
> +	                           Enable or disable sending pass/fail exit code to SBI SRST.
> +	                           (disabled by default, riscv only)
>  EOF
>      exit 1
>  }
> @@ -236,6 +240,12 @@ while [[ $optno -le $argc ]]; do
>  	--disable-efi-direct)
>  	    efi_direct=n
>  	    ;;
> +	--enable-sbi-exit-code)
> +	    sbi_exit_code=1
> +	    ;;
> +	--disable-sbi-exit-code)
> +	    sbi_exit_code=0
> +	    ;;
>  	--enable-werror)
>  	    werror=-Werror
>  	    ;;
> @@ -551,6 +561,7 @@ EOF
>  elif [ "$arch" = "riscv32" ] || [ "$arch" = "riscv64" ]; then
>      echo "#define CONFIG_UART_EARLY_BASE ${uart_early_addr}" >> lib/config.h
>      [ "$console" = "sbi" ] && echo "#define CONFIG_SBI_CONSOLE" >> lib/config.h
> +    echo "#define CONFIG_SBI_EXIT_CODE ${sbi_exit_code}" >> lib/config.h
>      echo >> lib/config.h
>  fi
>  echo "#endif" >> lib/config.h
> diff --git a/lib/riscv/io.c b/lib/riscv/io.c
> index b1163404..0e666009 100644
> --- a/lib/riscv/io.c
> +++ b/lib/riscv/io.c
> @@ -162,8 +162,18 @@ void halt(int code);
>  
>  void exit(int code)
>  {
> +	char *s = getenv("SBI_PASS_EXIT_CODE");
> +	bool pass_exit = CONFIG_SBI_EXIT_CODE;

This is the first case of what may become more common - a config variable
which also has an env override. I think it may be good convention to
name them the same, i.e. the env name would also be CONFIG_SBI_EXIT_CODE,
unless you think that would be confusing for some reason?

> +
>  	printf("\nEXIT: STATUS=%d\n", ((code) << 1) | 1);
> -	sbi_shutdown(code == 0);
> +
> +	if (s)
> +		pass_exit = (*s == '1' || *s == 'y' || *s == 'Y');

We now have this logic in four places[1]. I think it's time we factor it,
and it's counterpart "!(s && (*s == '0' || *s == 'n' || *s == 'N'))"
into a couple helper macros. I'm not sure where the best place for
those macros to live is, though. I guess libcflat.h, but we really
ought to split that thing apart someday...

[1]
 - twice in lib/errata.h
 - once in riscv/sbi-tests.ha
 - and now here

> +
> +	if (pass_exit)
> +		sbi_shutdown(code == 0);
> +	else
> +		sbi_shutdown(true);

nit: can be written more concisely as

 sbi_shutdown(pass_exit ? code == 0 : true)

>  	halt(code);
>  	__builtin_unreachable();
>  }
> -- 
> 2.43.0
>

Thanks,
drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
