Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E65FCA5FB1
	for <kvm-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 09:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J9yQO/WIUUV82vMUj+EU58e9llWkfUBM0ljpFY1HR8E=; b=O1HY2/HG/bDJMK
	98Qt8ydCvBo2g/DHQRrfykQp39ZwD6UaC2Z1Qk/YomZO2lcJrzobj8asVSoZU9kU344/naj60fIM2
	FQqXbe0DSguMSPgcMOa83QTmjR/3N0MfCjeowrKWLE+O9XfO7uE1Q5AU7Q4lV3IRIu+MeI9AwV7Gu
	UNEicFhiNLh6urNBe20dz+3JZmCkKDt4nC4CpxwGhuLe071GLOV3PmwPscbgYC0PobIDGMx10VYBA
	B6pMxlDnR8f6ImBCjaWmQl36rkj0Wgjqjh1+F3yZbTJjwOvHrHiQlo0wGCDCscmksfHV+UBIdiU68
	R2+PqQhySTNWy67fQsVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBqmj-00000005bLM-0P22;
	Wed, 30 Sep 2026 09:39:33 +0000
Received: from out-89.mta1.migadu.com ([95.215.58.89] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBqmg-00000005bK8-1WJG
	for kvm-riscv@lists.infradead.org;
	Wed, 30 Sep 2026 09:39:31 +0000
X-Envelope-To: kvm-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=khkThFf1oWq6SIxcHnXgeQNtm2wlSpOWtw7vvacr42A=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790761164; v=1; x=1791365964;
 b=eMMqbYscHWNSBzHkNX1SHuCbMlMBu+y1SRS4LOH2mkg2Wkyr8twIwEVwSkCy0C+yFgCcwCH6
 A2enMzUJRtjGKLQG8MXOjFLSenWzujIiNKiwdbCS6p929+6kJ2rnAsoy56c2Eu7L6XNBBfeH9vX
 Ru/sibBrycebAN8KzMguK+Tw=
X-Envelope-To: kvm-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 81ce95a8489771b1;
	Wed, 30 Sep 2026 09:39:24 +0000
X-Mizu-Trace-ID: 81ce95a8489771b1
X-Migadu-Flow: FLOW_OUT
Date: Wed, 30 Sep 2026 11:39:19 +0200
From: Andrew Jones <andrew.jones@linux.dev>
To: Xiang W <wangxiang@iscas.ac.cn>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	pbonzini@redhat.com, thuth@redhat.com
Subject: Re: [kvm-unit-tests PATCH 2/7] riscv: Add ACPI support for CPU
 initialization
Message-ID: <jl443rrfxhnjlxzysd33dd2mflqtiuj44tiolkihcjrncolnuh@gvz7zjdh2sog>
References: <20260924033945.176581-1-wangxiang@iscas.ac.cn>
 <20260924033945.176581-3-wangxiang@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260924033945.176581-3-wangxiang@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_023930_546162_CDB6449E 
X-CRM114-Status: GOOD (  17.74  )
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

On Thu, Sep 24, 2026 at 11:39:40AM +0800, Xiang W wrote:
> When a DT is not provided, discover harts from the MADT RINTC
> subtables (ACPI 6.6 type 24) instead of aborting in cpu_init_acpi().
> 
> Parse each RINTC entry for hart_id and ACPI UID, record them in
> thread_info, and mark the CPU present only if it is Enabled in
> the RINTC flags and SBI reports the hart as available.
> 
> Also add the RINTC MADT structure and the MADT types introduced
> after GENERIC_TRANSLATOR so the RISC-V interrupt controller
> entries can be identified.
> 
> Signed-off-by: Xiang W <wangxiang@iscas.ac.cn>
> ---
>  lib/acpi.h                | 30 +++++++++++++++++++++++++++++-
>  lib/riscv/asm/processor.h |  1 +
>  lib/riscv/setup.c         | 28 +++++++++++++++++++++++++++-
>  3 files changed, 57 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/acpi.h b/lib/acpi.h
> index a62cd3a9..a905807d 100644
> --- a/lib/acpi.h
> +++ b/lib/acpi.h
> @@ -226,6 +226,22 @@ struct acpi_madt_generic_translator {
>  	u32 reserved2;
>  };
>  
> +/* 24: RISC-V Interrupt Controller (RINTC) Structure (ACPI 6.6) */
> +struct acpi_madt_rintc {
> +	u8 type;
> +	u8 length;
> +	u8 version;
> +	u8 reserved;		/* reserved - must be zero */
> +	u32 flags;
> +	u64 hart_id;
> +	u32 uid;
> +	u32 ext_intc_id;
> +	u64 imsic_addr;
> +	u32 imsic_size;
> +};
> +
> +#define ACPI_RINTC_FLAGS_ENABLED	1
> +
>  /* Values for MADT subtable type in struct acpi_subtable_header */
>  
>  enum acpi_madt_type {
> @@ -245,7 +261,19 @@ enum acpi_madt_type {
>  	ACPI_MADT_TYPE_GENERIC_MSI_FRAME = 13,
>  	ACPI_MADT_TYPE_GENERIC_REDISTRIBUTOR = 14,
>  	ACPI_MADT_TYPE_GENERIC_TRANSLATOR = 15,
> -	ACPI_MADT_TYPE_RESERVED = 16	/* 16 and greater are reserved */
> +	ACPI_MADT_TYPE_MULTIPROCESSOR_WAKEUP = 16,

Linux calls this ACPI_MADT_TYPE_MULTIPROC_WAKEUP

Thanks,
drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
