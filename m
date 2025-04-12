Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3A71C369AE
	for <kvm-riscv@archiver.kernel.org>; Sat, 12 Apr 2025 13:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XDMW1dK+6KG6fOeL0+InJISDaTdjNAE+eRkWBtC1bac=; b=Fl9XMbyG7jTavw
	ZllA05AFJBxUSKgq9rm7YNHva5T22l1jO3NeVPNCshX/pSAVPRwfelVQbMZCD9YacICdU2F4c3byW
	IKoZq0dz5uut2mQ5dRQIVBm1J0yjidlxBbMGrTlC2h8Jdb18btPOLx4XvqBBMxfN6Y5MPhf5fAtJ4
	850VqN/xtyKXxfA918YKT5bneaZ9NsKuTDmJ1foD6Jt6lfQKgOqDRz1TizsQ5xi4SGKIm/71DzqKm
	ZbXoJN8oL3T9fLGllEv7C6zYAN6Ds34OLL21p2Li/JwP9CoLiOUvFyaKUHFeyuIMDQRu31tP/zM5r
	7j6JbMqW9aUwDQ2y+uwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3bAe-0000000FxOZ-08xb;
	Sat, 12 Apr 2025 13:45:20 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3bAb-0000000FxO7-2Shq
	for kvm-riscv@lists.infradead.org;
	Sat, 12 Apr 2025 13:45:18 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43edb40f357so24347905e9.0
        for <kvm-riscv@lists.infradead.org>; Sat, 12 Apr 2025 06:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1744465516; x=1745070316; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q+PTisbOYZ2Qwu/8sMQ4cLoOEg0RHZSBhZtKop+FLVc=;
        b=PmFNt1Ahe+/bJQctBgfbrNMBzNkZyi7eHNind7Ex8KDw/+LhnrSdZT6xDTB8J1ppi5
         3sU/JpGw3E0LapxCSO//MQ5y8BvoGJ/2JZAZRXBilIF8a3fiy58g5ByCK8EEz90YrArx
         8l65VXUZh7QPLCW/wiiXwqDUJKOMNlaMSkwaaHAO2xz5fupxCoxMtm9C36DRLXcFFk2x
         g3Kx7rkwpHkIzw4tGLGZcKx7JRo+mvHpp5Le5mS3VbObMNUU4hcpDgbIo/Oj92EowdYs
         MA7C+xqoA+7zjCeoB63smCiGjbwqF4s4Q9iRKwf5xFSfi+eSnlv8B4qV7kTbcMwXNdUs
         7bRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744465516; x=1745070316;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q+PTisbOYZ2Qwu/8sMQ4cLoOEg0RHZSBhZtKop+FLVc=;
        b=LtBExeAEbiB8Z1MmqsTFxQMGHbkh9zuPrkxI7fV4tPn+pvVVJhHFvBKLJny7tNOXjT
         RCOnTTcZtqJklaasRKU9LdXswOUe1nUm/EIQv5243COl0gXQKRc/MZJGkOUIvqOabu2H
         no1RJSS2eoVD2wE8QP0wfGsjKGSsm8+vCwDRaPslMTk3ct3cJQ5L/GKPgAbyClo9akuT
         kaYqSVk7bmL09rORzFoKQ2Z+JD6VqFNs+5qKsRiCbwJ0nUZC1nosCGwiVzS4rINdccRk
         dfc0HVDp/n9qHHmq0M76DBxP+TmOqMTFpTkxeTwLfkfF262ezWpg1g/dxBey/yr7/7ah
         P8rg==
X-Forwarded-Encrypted: i=1; AJvYcCVVKuSZO1UPucQ+2PbaaERMb2Skq/BUxEAHFvZFT9MsE4I2j3Gzbk5b2mMzeoYrPzFDmdFz63uL+xY=@lists.infradead.org
X-Gm-Message-State: AOJu0YyF7a8uzV6Xbl9y2EEcfwY8Egx6w5BUQsOqZTXSyp4h/m2mR5qS
	4jtqmJpDH81jvSFtlbErdmBh27Vp3fYlMCjFcth6xhQciyy6uVNyFi0lbhfIlL7Z/4n8m83nAY3
	+
X-Gm-Gg: ASbGncsJFxaar4rR/JKQ4lLWpdoTrBY91FEAUuy1dNvAAE4LbLJAOJQZVNEfnDvgit+
	VfF04441ys5DBwawk0ItcZbVifL3+xxAZwcFDYR87T8+tRsmotIrAX0f6jZgmerByi64+irpRWK
	uOP+jUuX0kau53nmJXCQBS0SKMWh1s6NOQzB4UxUDLfppiQ5Mp97V9xXF9QM8J8oIELSu+ErE9R
	9IooXCCQ/7JKC3D+7ox/mEininexRYLCLsqBTvFYCSXidJ6LTKyzqUBrLYbuPX/AAUS35UlQQ7U
	PZogXa+xFv71qKR5/x2HnhzVPQ1xWLtMo3HWbW+TIM4HXQWm8OwBduCuyKXFuyVT7m/V1n+co3w
	uTEJI
X-Google-Smtp-Source: AGHT+IHOggjW4ANei8+xfx2xYGSLpaAiQhy8R8hFdGmjQUvWrfEGBCXt+dyjNPjiCGY1JREcJFIGGg==
X-Received: by 2002:a05:600c:46d0:b0:43d:209:21fd with SMTP id 5b1f17b1804b1-43f3a9b02b3mr61950195e9.30.1744465515805;
        Sat, 12 Apr 2025 06:45:15 -0700 (PDT)
Received: from localhost (cst2-173-28.cust.vodafone.cz. [31.30.173.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae977513sm5044750f8f.42.2025.04.12.06.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 06:45:15 -0700 (PDT)
Date: Sat, 12 Apr 2025 15:45:13 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Will Deacon <will@kernel.org>, julien.thierry.kdev@gmail.com, 
	maz@kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
Subject: Re: [kvmtool PATCH 10/10] riscv: Allow including extensions in the
 min CPU type using command-line
Message-ID: <20250412-bc81866c2227ed98429f86b5@orel>
References: <20250326065644.73765-1-apatel@ventanamicro.com>
 <20250326065644.73765-11-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250326065644.73765-11-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250412_064517_631995_EF1915F6 
X-CRM114-Status: GOOD (  23.39  )
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

On Wed, Mar 26, 2025 at 12:26:44PM +0530, Anup Patel wrote:
> It is useful to allow including extensions in the min CPU type on need
> basis via command-line. To achieve this, parse extension names as comma
> separated values appended to the "min" CPU type using command-line.
> 
> For example, to include Sstc and Ssaia in the min CPU type use
> "--cpu-type min,sstc,ssaia" command-line option.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  riscv/fdt.c | 41 +++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 39 insertions(+), 2 deletions(-)
> 
> diff --git a/riscv/fdt.c b/riscv/fdt.c
> index 4c018c8..9cefd2f 100644
> --- a/riscv/fdt.c
> +++ b/riscv/fdt.c
> @@ -108,6 +108,20 @@ static bool __isa_ext_warn_disable_failure(struct kvm *kvm, struct isa_ext_info
>  	return true;
>  }
>  
> +static void __min_cpu_include(const char *ext, size_t ext_len)

s/include/enable/

> +{
> +	struct isa_ext_info *info;
> +	unsigned long i;
> +
> +	for (i = 0; i < ARRAY_SIZE(isa_info_arr); i++) {
> +		info = &isa_info_arr[i];
> +		if (strlen(info->name) != ext_len)
> +			continue;
> +		if (!strncmp(ext, info->name, ext_len))

strcmp should be fine here since we already checked length.

> +			info->min_cpu_included = true;
> +	}
> +}
> +
>  bool riscv__isa_extension_disabled(struct kvm *kvm, unsigned long isa_ext_id)
>  {
>  	struct isa_ext_info *info = NULL;
> @@ -128,16 +142,39 @@ bool riscv__isa_extension_disabled(struct kvm *kvm, unsigned long isa_ext_id)
>  int riscv__cpu_type_parser(const struct option *opt, const char *arg, int unset)
>  {
>  	struct kvm *kvm = opt->ptr;
> +	const char *str, *nstr;
> +	int len;
>  
> -	if ((strncmp(arg, "min", 3) && strncmp(arg, "max", 3)) || strlen(arg) != 3)
> +	if ((strncmp(arg, "min", 3) || strlen(arg) < 3) &&

If arg == 'min', then it can't be less than 3 so the '|| strlen(arg) < 3'
is dead code.

> +	    (strncmp(arg, "max", 3) || strlen(arg) != 3))

I think we want

 if (strlen(arg) < 3 ||
     (strlen(arg) == 3 && strcmp(arg, "min") && strcmp(arg, "max")) ||
     strncmp(arg, "min", 3))

>  		die("Invalid CPU type %s\n", arg);
>  
>  	if (!strncmp(arg, "max", 3))
>  		kvm->cfg.arch.cpu_type = "max";
>  
> -	if (!strncmp(arg, "min", 3))
> +	if (!strncmp(arg, "min", 3)) {
>  		kvm->cfg.arch.cpu_type = "min";
>  
> +		str = arg;
> +		str += 3;
> +		while (*str) {
> +			if (*str == ',') {
> +				str++;
> +				continue;
> +			}
> +
> +			nstr = strchr(str, ',');
> +			if (!nstr)
> +				nstr = str + strlen(str);
> +
> +			len = nstr - str;
> +			if (len) {

I think len will always be nonzero since *str isn't \0 and we ate all
consecutive ,'s above. __min_cpu_include() is also safe to call with
len=0, so we could drop this check.

> +				__min_cpu_include(str, len);
> +				str += len;
> +			}
> +		}
> +	}
> +
>  	return 0;
>  }
>  
> -- 
> 2.43.0
>

Thanks,
drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
