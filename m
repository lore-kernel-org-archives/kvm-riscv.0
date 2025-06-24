Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8EC3C7EE33
	for <kvm-riscv@archiver.kernel.org>; Tue, 24 Jun 2025 14:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WOv1WcRr06Xi6KIj8HOLdZI1B/6CjiuE91iQx+h62As=; b=KMh37gy8EJtB3x
	EFDEK1Jb86oB7F1xSUs0xXmRkBZDXbYuenUoHU84/M++HlT/YsB1PP2StQdZqjQI79xie9+uBgdaC
	DmxcGyZjIom5rTKntUWrtiCc0DF31oYz4xnjp2U/9dLJlba18aa2X3TaK4tCcqWxnl1qSb8y/cZIf
	tD9uiECKM12rVDenB8/Hvee/LEa3a9HDznnQCvGdjp4PB9ovvnZCLekO2eKsmmLpMZzM172h2lKtz
	Doy539YRNviE+icI5wmCKnFa8q6DFzl1Yf7oB/ywXZqLZYO8awMDjy37cMIVEf0c26Z0gfCD0bJp1
	jyjWWLzIkF4U0NC5EAbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU4Pf-00000005r7N-1VeY;
	Tue, 24 Jun 2025 14:14:15 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU3zk-00000005lfH-2J9C
	for kvm-riscv@lists.infradead.org;
	Tue, 24 Jun 2025 13:47:29 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3a6d77b43c9so2860543f8f.3
        for <kvm-riscv@lists.infradead.org>; Tue, 24 Jun 2025 06:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750772847; x=1751377647; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ycq0kX3Vn1ZpP7yxI/jdDggIlJCstgVkDpgaYIcdwgY=;
        b=gcoHkq15RRXCuJ19UwOdDmcuBQEhZei3RubzsGZCKQxCB4Fdgld0OMukw+D0WXewSS
         mnR2cvooIDxSf4or2cJamrLP97nIVDfbm7DtjLrx8iV+urMN8nIEmcgHlzY6wEd0RTCL
         WDEFfbBEhlQWJlh4v0+P3wh7qmfd24jiY2Gz/gvMU6vJfadbW7sWf0K34qRBAItpnaen
         VBFeneOZb29GMnnapiRJ7zqluNMvXPE6fw+RqJ41RVbjtOin6082RFSvmxc3nWpuRLSd
         SVCyUGwhyA63zs38+rbs6nDoR7OgCbHMDJB4AFvqXhKWYijVdhkn8lAzqL0RoSZVuVo3
         /zgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750772847; x=1751377647;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ycq0kX3Vn1ZpP7yxI/jdDggIlJCstgVkDpgaYIcdwgY=;
        b=ccoK07AI9STtC+BcJ+iseKIjMHr8/2GxvDY6Zk8YUipOc6VgNEnZb889tUe3mbGivu
         +m1PbgqW0xpxZTW19cmwaB18n4gEVhJwg3znz+XV/BQWMDnxSXpbR5qT+eb0BwdBWp5a
         Sc4sVmQWzZQoKB+L6caEXkdsP9dkMmCCQ6mlghT0zXbHjF/0YisLzRoEgcQD7Y+JdNfP
         gWWGvjT53mLYPJQoOmTIYQhRgQ9pPZVJ7U/9GH3kjMZk6QEmea8UsyXY7u8aiRK7vYK3
         YPvvrhfOlUn5VLkNAHzRkAinEJTUtPRprRHwsYPKdeA7qpTBqa2KuWZRyZxbBTXWzu6y
         C9dg==
X-Forwarded-Encrypted: i=1; AJvYcCXIitg1p2d5EqfNwwMqtmD5D9FWYbU4ouF/ieiszr6QG/ttK5AqCbH5C1xlxHSAlb7ydKt+F3NQAFg=@lists.infradead.org
X-Gm-Message-State: AOJu0YyOOGcUCcSMhXIe0dymw3WDgFGdQYwdLu3baeLjSoP8gZivDy8B
	OwJxqj8lWY+qTK0SWQzagriii9Lgj7fb+tHOob62Kjmta/NrcoVafa46l4u9kltTRs8=
X-Gm-Gg: ASbGncsPdZjoVyRT+rSmecLimQbUfrMwAeWGdJ8jXGwcnwBDubnIlZhsxOGPOBQYTA6
	88B/lN8JLX0eEbyPIGM0j4XL4ixh+VexsgFlxeiC7Ib4kndFBcsduFlNmPaCqLZER/6e7CW/P43
	abknwmsHPLf6WvwZEde3chIw9P6G0YaYEWymI3Jr+eEISF+eCRGtR/XX8NrjcznEOR6++8GDAvB
	PxH11y4JN6PmYPqR4Giz3sGtYBqInvVxapz0L5BCdOJIf1Xg2Lg1Yb9Jj9zwKRI2dnaTOL4q/Tg
	JQx61kW5Vj/0d7fUcd7QOkdGhY00gJLmt0XfgqenR3PuhyxoKQ==
X-Google-Smtp-Source: AGHT+IHb76B6ik9Yt3pkD/SAdLPqXg65db3i1R0WxXLtr/BPlZTDKztKX7BSnwY0vPSiL+IcBDUqLw==
X-Received: by 2002:a05:6000:2211:b0:3a4:ed62:c7e1 with SMTP id ffacd0b85a97d-3a6d12c455cmr12967179f8f.12.1750772847157;
        Tue, 24 Jun 2025 06:47:27 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::5485])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e80f259dsm2035419f8f.50.2025.06.24.06.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:47:26 -0700 (PDT)
Date: Tue, 24 Jun 2025 15:47:26 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: zhouquan@iscas.ac.cn
Cc: anup@brainfault.org, atishp@atishpatra.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH 5/5] KVM: riscv: selftests: Add bfloat16 extension to
 get-reg-list test
Message-ID: <20250624-044127e80c3700d93f114280@orel>
References: <cover.1750164414.git.zhouquan@iscas.ac.cn>
 <65752029ed1ae331a9ac867a6fef2e63a797569e.1750164414.git.zhouquan@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <65752029ed1ae331a9ac867a6fef2e63a797569e.1750164414.git.zhouquan@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_064728_613619_9F3EBF55 
X-CRM114-Status: GOOD (  14.83  )
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

On Tue, Jun 17, 2025 at 09:10:50PM +0800, zhouquan@iscas.ac.cn wrote:
> From: Quan Zhou <zhouquan@iscas.ac.cn>
> 
> The KVM RISC-V allows Zfbfmin/Zvfbfmin/Zvfbfwma extensions for Guest/VM
> so add them to get-reg-list test.
> 
> Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
> ---
>  tools/testing/selftests/kvm/riscv/get-reg-list.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> index ebdc34b58bad..e5a07e000b66 100644
> --- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
> +++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> @@ -80,6 +80,7 @@ bool filter_reg(__u64 reg)
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZCF:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZCMOP:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZFA:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZFBFMIN:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZFH:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZFHMIN:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICBOM:
> @@ -104,6 +105,8 @@ bool filter_reg(__u64 reg)
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZTSO:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZVBB:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZVBC:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZVFBFMIN:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZVFBFWMA:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZVFH:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZVFHMIN:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZVKB:
> @@ -535,6 +538,7 @@ static const char *isa_ext_single_id_to_str(__u64 reg_off)
>  		KVM_ISA_EXT_ARR(ZCF),
>  		KVM_ISA_EXT_ARR(ZCMOP),
>  		KVM_ISA_EXT_ARR(ZFA),
> +		KVM_ISA_EXT_ARR(ZFBFMIN),
>  		KVM_ISA_EXT_ARR(ZFH),
>  		KVM_ISA_EXT_ARR(ZFHMIN),
>  		KVM_ISA_EXT_ARR(ZICBOM),
> @@ -559,6 +563,8 @@ static const char *isa_ext_single_id_to_str(__u64 reg_off)
>  		KVM_ISA_EXT_ARR(ZTSO),
>  		KVM_ISA_EXT_ARR(ZVBB),
>  		KVM_ISA_EXT_ARR(ZVBC),
> +		KVM_ISA_EXT_ARR(ZVFBFMIN),
> +		KVM_ISA_EXT_ARR(ZVFBFWMA),
>  		KVM_ISA_EXT_ARR(ZVFH),
>  		KVM_ISA_EXT_ARR(ZVFHMIN),
>  		KVM_ISA_EXT_ARR(ZVKB),
> @@ -1138,6 +1144,7 @@ KVM_ISA_EXT_SIMPLE_CONFIG(zcd, ZCD);
>  KVM_ISA_EXT_SIMPLE_CONFIG(zcf, ZCF);
>  KVM_ISA_EXT_SIMPLE_CONFIG(zcmop, ZCMOP);
>  KVM_ISA_EXT_SIMPLE_CONFIG(zfa, ZFA);
> +KVM_ISA_EXT_SIMPLE_CONFIG(zfbfmin, ZFBFMIN);
>  KVM_ISA_EXT_SIMPLE_CONFIG(zfh, ZFH);
>  KVM_ISA_EXT_SIMPLE_CONFIG(zfhmin, ZFHMIN);
>  KVM_ISA_EXT_SUBLIST_CONFIG(zicbom, ZICBOM);
> @@ -1162,6 +1169,8 @@ KVM_ISA_EXT_SIMPLE_CONFIG(zkt, ZKT);
>  KVM_ISA_EXT_SIMPLE_CONFIG(ztso, ZTSO);
>  KVM_ISA_EXT_SIMPLE_CONFIG(zvbb, ZVBB);
>  KVM_ISA_EXT_SIMPLE_CONFIG(zvbc, ZVBC);
> +KVM_ISA_EXT_SIMPLE_CONFIG(zvfbfmin, ZVFBFMIN);
> +KVM_ISA_EXT_SIMPLE_CONFIG(zvfbfwma, ZVFBFWMA);
>  KVM_ISA_EXT_SIMPLE_CONFIG(zvfh, ZVFH);
>  KVM_ISA_EXT_SIMPLE_CONFIG(zvfhmin, ZVFHMIN);
>  KVM_ISA_EXT_SIMPLE_CONFIG(zvkb, ZVKB);
> @@ -1213,6 +1222,7 @@ struct vcpu_reg_list *vcpu_configs[] = {
>  	&config_zcf,
>  	&config_zcmop,
>  	&config_zfa,
> +	&config_zfbfmin,
>  	&config_zfh,
>  	&config_zfhmin,
>  	&config_zicbom,
> @@ -1237,6 +1247,8 @@ struct vcpu_reg_list *vcpu_configs[] = {
>  	&config_ztso,
>  	&config_zvbb,
>  	&config_zvbc,
> +	&config_zvfbfmin,
> +	&config_zvfbfwma,
>  	&config_zvfh,
>  	&config_zvfhmin,
>  	&config_zvkb,
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
