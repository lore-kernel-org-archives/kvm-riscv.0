Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DADB3CAC5AC
	for <kvm-riscv@archiver.kernel.org>; Tue, 23 Sep 2025 20:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z1J/3TJO2a707HHacWXIVzxXSHtgAaVdjnAdhBCg8/M=; b=JBh7lVHEzfUqLK
	ZECdUyIPT2mpoulXrLWFU9d2Wbhasp2UuZ4FOMSE98jAOrjo2/hhII/6RVX4WTubbSzI5AdTmOGir
	bPwLS3z8AuIW5zeORL3BvntOKMlBUq9eX+gQcpBxZ0oIRYHunl0UZU3ag4ONhhY1cp4110sgP8oAi
	PbmoBqAG/RsKxca8aNYZFqe1TGtuNGdlKGI0Pwiw6h7Zgwyq4djA5ZRwHlOEh1AxLWJ42p+mGHB/t
	HEgTqoI84N6rJZ6kErIsuqgygz4SYb1tZmX+6IU3rv6z1bb6SjJg1oB30dAolyyeBR7uxESAMDtxa
	RC19L34cwoCi2Y6K5EBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v19Ox-0000000Ekcw-1a0M;
	Tue, 23 Sep 2025 20:14:15 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v19Ov-0000000Ekby-1DxV
	for kvm-riscv@lists.infradead.org;
	Tue, 23 Sep 2025 20:14:14 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-71d5fb5e34cso3150867b3.0
        for <kvm-riscv@lists.infradead.org>; Tue, 23 Sep 2025 13:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1758658452; x=1759263252; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XwoI4wo9zLfkjndrTS8NOMixLRyHjpBjZZO1kBexomI=;
        b=mCaqwNLIX2BBfypRaDx8cwmeUAkHdkcoPxXRG81gF90zWVjLqDl49g6SPIZAjN64yI
         Ko5t3Lh9rhOXfDP9GJ+eYSniW6fZUPNrMmcDPapI78ARBuaqIPcv7/u4SwTD7iBYNjI7
         06x/DnOLv3BIQJ7qXDSsk/z1e4l8bFXKanG8Go5pM/1fFy/sFH7x8vDFHuHktoDf/laC
         1XlCWNG4rAMpo1bf11jl2nwXdL/LvzhUHneSuYvc6vAAPDTIEa1r1FepEqecCEsAmCsd
         oFfVQO8wpfspWTGFWWblsKpx3F2TKFZlD2z1KRZAaMWGHezyYRSiStcZH7fjxMwV8IF4
         1Y9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758658452; x=1759263252;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XwoI4wo9zLfkjndrTS8NOMixLRyHjpBjZZO1kBexomI=;
        b=eUDouhp/ZNckWBW2Mya5yjLdgkfOfZhh4oYiWF17Bw1DATCg8LnArguPKnKOJWYRR0
         zOlQ9HQWZf9WWRqeHFRVxO0F/S2iWzsAjIVTgiihoB9h0m7KoQv++PjJeWx9V9ISpp1M
         haFb1ls0nLq3E9xGhzJR1XXiwgxz7Oj6A3dW+hETmfflNEdt34z4Up8WTLaVSVHHN3L0
         /2G1FCgMQ/HdITVn+wGChaqatD83gW6h4Iyc674f/fMofdOs8ZrdZHUck/b9zHD6NrEJ
         H4pl0fVeyru5iGfJHJYqR0EFsTKKjz/OhLEYpLGSafnNwTGhSHUdukHLBcm+qCHsJGhk
         KNaA==
X-Forwarded-Encrypted: i=1; AJvYcCXxkS3DlixHr34w/EJGjSQJRD0+UJZgU8i2r3I9/sX00riKzyqf4JPLN8kWv/H8auquvMudFGi9Apg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yya/ZvS5ZUcrrjiSbRJ0+I4zRohfZKkV+MJrkvat9VeN9QvVqXe
	b5eKnGWnXmvWfcbFq2Z91RgB5Pr+f3yS6FumppGt3vVPRdYH7jKNIJQVKNAbSuHOQ3M=
X-Gm-Gg: ASbGncvCODOwMJmZE2tqsr78xFAsh8+XCGg1ZQhlqQaf2QiuNg7sAheFte9rHx6mvoU
	ABKyE00dEB6SOaP3Ba8MAsDys3lkyIOLJ5X5AuouUeqbbcmsnTFlB/IdAnNvHaTkHchktQodPAB
	jSUCO3F1Avc/OJ1EgJmu/+rAtZx7EfVWxHQuuPQANNWc+XKksoyuKRfaU2lrYWtvw//C0PrnwAK
	wTKMminJguzIOpNdPfRE7fKrIpNPA3kvNRAaSXjCkw4k/3CccwTnVYfMfAv4C/1MoanyPQ2pLtO
	lVpePR4TMLtpjVP88XoBbutwzanZD7CmSIUxOclGSz3W+6hl61pMpxFWdTmIpw9TKaCEHUbLtZ2
	JeaTdAlKJLtSnPO7W5IQH2ke7
X-Google-Smtp-Source: AGHT+IGeCZ6j6R+MpW8BlXjZwmHOp5b59quaQ2iQXSXVNma3YEpQ2jgmW2R4eikrimp7SLuMomVdnA==
X-Received: by 2002:a05:690c:490f:b0:729:5b86:551c with SMTP id 00721157ae682-7587a54ee84mr30284947b3.0.1758658452166;
        Tue, 23 Sep 2025 13:14:12 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-73971887fe8sm43349297b3.50.2025.09.23.13.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 13:14:11 -0700 (PDT)
Date: Tue, 23 Sep 2025 15:14:11 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: BillXiang <xiangwencheng@lanxincomputing.com>
Cc: anup@brainfault.org, kvm-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, atishp@rivosinc.com
Subject: Re: [PATCH] riscv: Move user-visible sbi ext ids to uapi
Message-ID: <20250923-5498566fbd48a3dfd61ecd08@orel>
References: <20250917085246.1430354-1-xiangwencheng@lanxincomputing.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250917085246.1430354-1-xiangwencheng@lanxincomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_131413_341404_32422993 
X-CRM114-Status: GOOD (  22.71  )
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

On Wed, Sep 17, 2025 at 04:52:46PM +0800, BillXiang wrote:
> Move those sbi ext ids to uapi because they will be forwarded
> to user space by kvm.

We don't need to publish the IDs in UAPI since they are already known to
userspace by reading the SBI spec. Indeed QEMU already defines all of
these except for the experimental range.

What problem are you trying to solve?

Thanks,
drew

> 
> Signed-off-by: BillXiang <xiangwencheng@lanxincomputing.com>
> ---
>  arch/riscv/include/asm/sbi.h      | 16 +-----------
>  arch/riscv/include/uapi/asm/sbi.h | 43 +++++++++++++++++++++++++++++++
>  2 files changed, 44 insertions(+), 15 deletions(-)
>  create mode 100644 arch/riscv/include/uapi/asm/sbi.h
> 
> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> index 341e74238aa0..e196feaabb2e 100644
> --- a/arch/riscv/include/asm/sbi.h
> +++ b/arch/riscv/include/asm/sbi.h
> @@ -10,13 +10,12 @@
>  #include <linux/types.h>
>  #include <linux/cpumask.h>
>  #include <linux/jump_label.h>
> +#include <uapi/asm/sbi.h>
>  
>  #ifdef CONFIG_RISCV_SBI
>  enum sbi_ext_id {
>  #ifdef CONFIG_RISCV_SBI_V01
>  	SBI_EXT_0_1_SET_TIMER = 0x0,
> -	SBI_EXT_0_1_CONSOLE_PUTCHAR = 0x1,
> -	SBI_EXT_0_1_CONSOLE_GETCHAR = 0x2,
>  	SBI_EXT_0_1_CLEAR_IPI = 0x3,
>  	SBI_EXT_0_1_SEND_IPI = 0x4,
>  	SBI_EXT_0_1_REMOTE_FENCE_I = 0x5,
> @@ -37,13 +36,6 @@ enum sbi_ext_id {
>  	SBI_EXT_NACL = 0x4E41434C,
>  	SBI_EXT_FWFT = 0x46574654,
>  
> -	/* Experimentals extensions must lie within this range */
> -	SBI_EXT_EXPERIMENTAL_START = 0x08000000,
> -	SBI_EXT_EXPERIMENTAL_END = 0x08FFFFFF,
> -
> -	/* Vendor extensions must lie within this range */
> -	SBI_EXT_VENDOR_START = 0x09000000,
> -	SBI_EXT_VENDOR_END = 0x09FFFFFF,
>  };
>  
>  enum sbi_ext_base_fid {
> @@ -263,12 +255,6 @@ enum sbi_pmu_ctr_type {
>  #define SBI_PMU_STOP_FLAG_RESET BIT(0)
>  #define SBI_PMU_STOP_FLAG_TAKE_SNAPSHOT BIT(1)
>  
> -enum sbi_ext_dbcn_fid {
> -	SBI_EXT_DBCN_CONSOLE_WRITE = 0,
> -	SBI_EXT_DBCN_CONSOLE_READ = 1,
> -	SBI_EXT_DBCN_CONSOLE_WRITE_BYTE = 2,
> -};
> -
>  /* SBI STA (steal-time accounting) extension */
>  enum sbi_ext_sta_fid {
>  	SBI_EXT_STA_STEAL_TIME_SET_SHMEM = 0,
> diff --git a/arch/riscv/include/uapi/asm/sbi.h b/arch/riscv/include/uapi/asm/sbi.h
> new file mode 100644
> index 000000000000..d29ac0abeefe
> --- /dev/null
> +++ b/arch/riscv/include/uapi/asm/sbi.h
> @@ -0,0 +1,43 @@
> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> +/*
> + * Copyright (C) 2025 Lanxincomputing Corporation or its affiliates.
> + *
> + * Authors:
> + *     BillXiang <xiangwencheng@lanxincomputing.com>
> + */
> +
> +#ifndef _UAPI_ASM_RISCV_SBI_H
> +#define _UAPI_ASM_RISCV_SBI_H
> +
> +
> +enum SBI_EXT_ID {
> +	/*
> +	* The CONSOLE_GETCHAR/CONSOLE_PUTCHAR SBI calls cannot be
> +	* handled in kernel so they will be forwarded to userspace by kvm.
> +	*/
> +	SBI_EXT_0_1_CONSOLE_PUTCHAR = 0x1,
> +	SBI_EXT_0_1_CONSOLE_GETCHAR = 0x2,
> +	/*
> +	* Both SBI experimental and vendor extensions are
> +	* unconditionally forwarded to userspace by kvm.
> +	*/
> +	/* Experimentals extensions must lie within this range */
> +	SBI_EXT_EXPERIMENTAL_START = 0x08000000,
> +	SBI_EXT_EXPERIMENTAL_END = 0x08FFFFFF,
> +
> +	/* Vendor extensions must lie within this range */
> +	SBI_EXT_VENDOR_START = 0x09000000,
> +	SBI_EXT_VENDOR_END = 0x09FFFFFF,
> +};
> +
> +/*
> +* The SBI debug console functions are unconditionally
> +* forwarded to the userspace by kvm.
> +*/
> +enum sbi_ext_dbcn_fid {
> +	SBI_EXT_DBCN_CONSOLE_WRITE = 0,
> +	SBI_EXT_DBCN_CONSOLE_READ = 1,
> +	SBI_EXT_DBCN_CONSOLE_WRITE_BYTE = 2,
> +};
> +
> +#endif /* _UAPI_ASM_RISCV_SBI_H */
> \ No newline at end of file
> -- 
> 2.43.0

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
