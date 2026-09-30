Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7B64CA5FC1
	for <kvm-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 09:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FEaAIDAGImegKLUMtgBJv/1F+1iB+kEKgwfAmnBRi28=; b=qQrC/NJNcEu3Yd
	9BQ9v2QzfAPBqSxJR2Wp/hPV064mOh5V1tzpBU1FdzPSvHwaJlWuPU6eNm5IBpJCWDJT/uKmpzxw5
	bmkJXa1Gfys8zqexho+3NXbqaFDwvLATDm8lBAdye3p2pStBSR1Ag9JFEMtPq84qtjh95QXUy5lnl
	t1oB1wnTmNl1AYNsHOAA+6PbPRlvXOw+JRfmtPWjacXFqy3zyXf8G1DE0ZcCqCJYeGGcfo78rfUyD
	hre4GiewjpWniUIHqOWNgiz2zATdOcWLnMmv261J8CvixB8KtZUTL1sbgokwZsLtTJTvk4gxzTNpA
	t53FdbeUypjRDI7ljvBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBqr0-00000005bdq-2P2y;
	Wed, 30 Sep 2026 09:43:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBqqz-00000005bdK-0Dnp
	for kvm-riscv@bombadil.infradead.org;
	Wed, 30 Sep 2026 09:43:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ijGWipgk3wLo7MwWmebcVYG47kGzhR2Nzq7YXJYN53Y=; b=c+CW3jOPqxySGUcLJSO8Lvd1m6
	wmFM5/4c+s/fzTcsVfMj2pbHxkxJMIfpuko8XtdDNycwna04tHqNWZH2Qu3hlV0f0a16uHpLRHd6k
	ZL6DB0JkERVBgXFmDN0qPXbabc8jhDEAhyHd00QUnIRvkmriPxJiKdiXaM0Xbyt5r4qyWCyxLIdAc
	dbTq71/iWylExX3Mg5cxI+UhBnVY9kV3vQZwLoCIGIJcliHsRwsYlMYH+dxFK/HtmrX1YYK3r3rto
	e3WAHpLnvZ2zv1gWBd46xLwcqUtqHgqF/FfyWNg0WxWu2ZDrTFPPKoZTFhOiuUKYLNXr/LXcR3UW9
	LVxFcqEg==;
Received: from out-62.mta1.migadu.com ([95.215.58.62] helo=mta1.migadu.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBqqv-00000003b5s-3UTV
	for kvm-riscv@lists.infradead.org;
	Wed, 30 Sep 2026 09:43:55 +0000
X-Envelope-To: kvm-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=U2M2xlqw/KjGQrWvHSnOVqTKZiyerNMc1PkicikEQzI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790761430; v=1; x=1791366230;
 b=cN8Xs1J9fe8M9eW1hbhhXVWdp5+swtBBTsDzlOIAjCkTA10yHbRNgwGOXk5lu+LH+LHMOFt1
 YORvW3kHmXvNmquD3C3t6crNr80YamdhVx7a11xQgxxyPlVINVxVHmTk0Kga0NFKbAWxZ+g8dQj
 P1WUeXJPLanc1HX/HQcNq+x0=
X-Envelope-To: kvm-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 791cc7bddc75e0eb;
	Wed, 30 Sep 2026 09:43:50 +0000
X-Mizu-Trace-ID: 791cc7bddc75e0eb
X-Migadu-Flow: FLOW_OUT
Date: Wed, 30 Sep 2026 11:43:46 +0200
From: Andrew Jones <andrew.jones@linux.dev>
To: Xiang W <wangxiang@iscas.ac.cn>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	pbonzini@redhat.com, thuth@redhat.com
Subject: Re: [kvm-unit-tests PATCH 3/7] riscv: Add ACPI support for timer
 frequency discovery
Message-ID: <2wlouhxdm3owxuybtaizrcncnekhwjscdzeuwvye3hfwautlyu@rpnkw2r5emef>
References: <20260924033945.176581-1-wangxiang@iscas.ac.cn>
 <20260924033945.176581-4-wangxiang@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260924033945.176581-4-wangxiang@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_104354_183352_F38038AB 
X-CRM114-Status: GOOD (  23.67  )
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

On Thu, Sep 24, 2026 at 11:39:41AM +0800, Xiang W wrote:
> When a DT is not provided, read the system time base frequency from
> the RHCT instead of aborting in timer_get_frequency().
> 
> RHCT Time Base Frequency is the ACPI equivalent of the DT
> /cpus timebase-frequency property and is the same for all harts.
> Keep DT as the preferred path when one is available.
> 
> Signed-off-by: Xiang W <wangxiang@iscas.ac.cn>
> ---
>  lib/acpi.h        |  9 +++++++++
>  lib/riscv/timer.c | 37 +++++++++++++++++++++++++------------
>  2 files changed, 34 insertions(+), 12 deletions(-)
> 
> diff --git a/lib/acpi.h b/lib/acpi.h
> index a905807d..2597e8ce 100644
> --- a/lib/acpi.h
> +++ b/lib/acpi.h
> @@ -20,6 +20,7 @@
>  #define MADT_SIGNATURE ACPI_SIGNATURE('A','P','I','C')
>  #define SPCR_SIGNATURE ACPI_SIGNATURE('S','P','C','R')
>  #define GTDT_SIGNATURE ACPI_SIGNATURE('G','T','D','T')
> +#define RHCT_SIGNATURE ACPI_SIGNATURE('R','H','C','T')
>  
>  #define ACPI_SIGNATURE_8BYTE(c1, c2, c3, c4, c5, c6, c7, c8) \
>  	(((uint64_t)(ACPI_SIGNATURE(c1, c2, c3, c4))) |	     \
> @@ -328,6 +329,14 @@ struct acpi_table_gtdt {
>  	u32 virtual_el2_timer_flags;
>  };
>  
> +struct acpi_table_rhct {
> +	ACPI_TABLE_HEADER_DEF
> +	u32 flags;
> +	u64 timebase_frequency;
> +	u32 node_count;
> +	u32 node_offset;
> +};
> +
>  /* Reset to default packing */
>  #pragma pack()
>  
> diff --git a/lib/riscv/timer.c b/lib/riscv/timer.c
> index 18063b7e..2a18f0e0 100644
> --- a/lib/riscv/timer.c
> +++ b/lib/riscv/timer.c
> @@ -13,24 +13,37 @@
>  #include <asm/smp.h>
>  #include <asm/timer.h>
>  
> +#ifdef CONFIG_EFI
> +#include <acpi.h>
> +#endif
> +
>  void timer_get_frequency(void)
>  {
> -	const struct fdt_property *prop;
> -	u32 *data;
> -	int cpus, len;
> -
> -	assert_msg(dt_available(), "ACPI not yet supported");
> +	if (dt_available()) {
> +		const struct fdt_property *prop;
> +		u32 *data;
> +		int cpus, len;
>  
> -	const void *fdt = dt_fdt();
> +		const void *fdt = dt_fdt();

This should be put above 'u32 *data'

>  
> -	cpus = fdt_path_offset(fdt, "/cpus");
> -	assert(cpus >= 0);
> +		cpus = fdt_path_offset(fdt, "/cpus");
> +		assert(cpus >= 0);
>  
> -	prop = fdt_get_property(fdt, cpus, "timebase-frequency", &len);
> -	assert(prop != NULL && len == 4);
> +		prop = fdt_get_property(fdt, cpus, "timebase-frequency", &len);
> +		assert(prop != NULL && len == 4);
>  
> -	data = (u32 *)prop->data;
> -	timebase_frequency = fdt32_to_cpu(*data);
> +		data = (u32 *)prop->data;
> +		timebase_frequency = fdt32_to_cpu(*data);
> +	} else {
> +#ifdef CONFIG_EFI
> +		struct acpi_table_rhct *rhct;

Need a blank line here, or just do the find call on the same line.

> +		rhct = find_acpi_table_addr(RHCT_SIGNATURE);
> +		assert_msg(rhct, "Cannot find ACPI RHCT");
> +		timebase_frequency = rhct->timebase_frequency;
> +#else
> +		assert_msg(false, "ACPI not available");
> +#endif
> +	}
>  }
>  
>  void timer_start(unsigned long duration_us)
> -- 
> 2.47.3
>

Thanks,
drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
