Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 578A8C83F09
	for <kvm-riscv@archiver.kernel.org>; Wed,  9 Jul 2025 12:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cqa1tPvdFh1yH8GpEu6zSRAGwyA3OiZh8HOI48m7ofE=; b=4bc9SYSRbwZdGo
	UVdJHPUR5mPC5AHBjYNqgRmJ8MrDbjcUuab9hcYytSm5LDIDVusbCvcg1NFt70tTlg8uBlcNqj2Du
	vdKTWv75+XpCMs7RAh6S92UJtxiw5QAZP3kEHerHTY7E+KRXmVYQA6OAFpnYEgzROzzwUgb7BYVpE
	UEI3E3Oiz3oQi7m108lLB63OVdkIcxiAFANNZcgOxFQRN0qMZG9s+jzVXvVVtlxsWDkHhMwANQ7K6
	ncWeEXDgg0uvSjXGC/GkhP8APfJDPFOaGiJN6X7SwPcB1SEuh+cngLLM9euBuf/zGfSVCE5YdQPgv
	zjhaZW8L4RGU+4OostTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZTW2-00000008Zlh-0BCI;
	Wed, 09 Jul 2025 12:03:10 +0000
Received: from out-173.mta0.migadu.com ([91.218.175.173])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZRlu-00000008GPp-2bTq
	for kvm-riscv@lists.infradead.org;
	Wed, 09 Jul 2025 10:11:27 +0000
Date: Wed, 9 Jul 2025 12:11:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1752055884;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AvzhVKn5QMLTrSvpQmmJbAfpNgi2rhLZNaG0BHlE0eg=;
	b=KHHYqNg+6FdI7k0DG7nUbhnmLKsGb6zGctcd416DKr/dvXe+QtR5fUUosRXNHhM9PsHXvh
	Q549vP6KjK+G8kiOVICPZ+lVgoair4PE+2KljPi/KIqqCdXJf/1AL+lNtnABuCNeoSuZVX
	PuKmR8gVX5Qc04JRJ9IJ3rc/XdbAezM=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Jesse Taube <jesse@rivosinc.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-kselftest@vger.kernel.org, =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, James Raphael Tiovalen <jamestiotio@gmail.com>, 
	Sean Christopherson <seanjc@google.com>, Cade Richard <cade.richard@gmail.com>
Subject: Re: [kvm-unit-tests PATCH v2 2/2] riscv: lib: Add sbi-exit-code to
 configure and environment
Message-ID: <20250709-93076fafcec83e14102193dc@orel>
References: <20250708154811.1888319-1-jesse@rivosinc.com>
 <20250708154811.1888319-2-jesse@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250708154811.1888319-2-jesse@rivosinc.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_031126_805491_151E85D0 
X-CRM114-Status: GOOD (  19.83  )
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

On Tue, Jul 08, 2025 at 08:48:11AM -0700, Jesse Taube wrote:
> Add --[enable|disable]-sbi-exit-code to configure script.
> With the default value as disabled.
> Add a check for SBI_EXIT_CODE in the environment, so that passing
> of the test status is configurable from both the
> environment and the configure script
> 
> Signed-off-by: Jesse Taube <jesse@rivosinc.com>
> ---
>  configure      | 11 +++++++++++
>  lib/riscv/io.c |  4 +++-
>  2 files changed, 14 insertions(+), 1 deletion(-)
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
> index b1163404..c46845de 100644
> --- a/lib/riscv/io.c
> +++ b/lib/riscv/io.c
> @@ -6,6 +6,7 @@
>   * Copyright (C) 2023, Ventana Micro Systems Inc., Andrew Jones <ajones@ventanamicro.com>
>   */
>  #include <libcflat.h>
> +#include <argv.h>
>  #include <bitops.h>
>  #include <config.h>
>  #include <devicetree.h>
> @@ -163,7 +164,8 @@ void halt(int code);
>  void exit(int code)
>  {
>  	printf("\nEXIT: STATUS=%d\n", ((code) << 1) | 1);
> -	sbi_shutdown(code == 0);
> +
> +	sbi_shutdown(GET_CONFIG_OR_ENV(SBI_EXIT_CODE) ? code == 0 : true);
>  	halt(code);
>  	__builtin_unreachable();
>  }
> -- 
> 2.43.0
>

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
