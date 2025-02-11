Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 483C1C0219E
	for <kvm-riscv@archiver.kernel.org>; Tue, 11 Feb 2025 15:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5yNU7NTlxSFXmI23rtwxEq+0OJAMPT8ldZV4+DeXv90=; b=vs1yvj8z7iu86s
	UrMvJxxE3bZ7igvTFBOtie9uzqHvz6V6V/CpwcLuQaB6jKiL6tGlS/719mMKImrXmM88YLsyQByWb
	4TpeyNJFsWvbV1MBvFVD+hX32Jmn7eRrOLexrBY9XEOiuPQMVShfwASIagvRVYXLEp5kelSrliEmQ
	IldKtUjpd3o8T3SnG8lQcNs8w1aCvsZ//che2y1ixisCUS9cMMIjlmLQytA21zl7ZIR+ML8stIKol
	WvpyjfJtOIhkvdYrBIZ/f9eci9NzWiK1BJw7D//PBqLlFHVbgHI34mm/PYWjXxOWAk0fT49Ly8vTG
	Lten2lAodb0VGtU9pV5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ths0J-00000004FuR-1uwG;
	Tue, 11 Feb 2025 15:16:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thrzr-00000004FrI-1KsQ
	for kvm-riscv@lists.infradead.org;
	Tue, 11 Feb 2025 15:16:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 89566113E;
	Tue, 11 Feb 2025 07:16:43 -0800 (PST)
Received: from arm.com (e134078.arm.com [10.1.26.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 646043F5A1;
	Tue, 11 Feb 2025 07:16:21 -0800 (PST)
Date: Tue, 11 Feb 2025 15:16:18 +0000
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: Re: [kvmtool PATCH] riscv: Fix no params with nodefault segfault
Message-ID: <Z6tpwskaTCfS2mjR@arm.com>
References: <20250123151339.185908-2-ajones@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250123151339.185908-2-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_071623_397240_F96AB6A4 
X-CRM114-Status: GOOD (  16.32  )
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

Hi Drew,

On Thu, Jan 23, 2025 at 04:13:40PM +0100, Andrew Jones wrote:
> Fix segfault received when using --nodefault without --params.
> 
> Fixes: 7c9aac003925 ("riscv: Generate FDT at runtime for Guest/VM")
> Suggested-by: Alexandru Elisei <alexandru.elisei@arm.com>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  riscv/fdt.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/riscv/fdt.c b/riscv/fdt.c
> index 85c8f95604f6..f6a702533258 100644
> --- a/riscv/fdt.c
> +++ b/riscv/fdt.c
> @@ -256,9 +256,10 @@ static int setup_fdt(struct kvm *kvm)
>  		if (kvm->cfg.kernel_cmdline)
>  			_FDT(fdt_property_string(fdt, "bootargs",
>  						 kvm->cfg.kernel_cmdline));
> -	} else
> +	} else if (kvm->cfg.real_cmdline) {

Looks good to me, matches how arm/fdt.c handles real_cmdline:

Reviewed-by: Alexandru Elisei <alexandru.elisei@arm.com>

Some context here. Before the patch that introduced --nodefaults, in commit
5613ae26b998 ("Add --nodefaults command line argument"), kvmtool would
always fiddle with the kernel command line to make it more likely that a
kernel boots - kvm_cmd_run_init() called kvm_run_set_real_cmdline()
unconditionally, which made it that kvm->cfg.real_cmdline was always
pointing to a valid string. Hence no check was needed here.

After --nodefaults was introduced, if the user specifies --nodefaults and
doesn't set the kernel command line (via -p/--params), real_cmdline ends up
being NULL and the fdt generator segfaults below.

The riscv port was developed in parallel to the series that introduced
--nodefaults, so I guess this check was missed during integration.

Thanks,
Alex

>  		_FDT(fdt_property_string(fdt, "bootargs",
>  					 kvm->cfg.real_cmdline));
> +	}
>  
>  	_FDT(fdt_property_string(fdt, "stdout-path", "serial0"));
>  
> -- 
> 2.48.1
> 

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
