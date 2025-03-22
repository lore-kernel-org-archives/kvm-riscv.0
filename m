Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AB83C35FFC
	for <kvm-riscv@archiver.kernel.org>; Sat, 22 Mar 2025 12:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fpeSg40ardkDHsZ4mBHrjtvpEwMVzQO/Zv77jCShT4c=; b=zSgbLIQPGPbsH1
	Wv0UVqEh5VuxtWns2hqR68cGcnIeSqMfzECAGCe3N1YaEtR8aZtd4DAtOurgfNmyYOay7LRCDBujx
	7k+JrEY9DxOwfI0wjSu7pYBfXzuQTVpZCGAVIfIsZy7GY2XGoMCcWcSwGLmNJHxzCk98izlduoCRI
	8iw4UIIE2UU55wzslKzA0daLtXr6WButx6ePOXIlq5tl7Nm9IXgxEcXG2J9eEpvLGw9ZpcLREuk7A
	eaGcrGcOBCFMLPCbHzSIIEO4X5zERxEl6AIlbRdZc4yfoeNXJMwjbEckKcPOjySHhcuVMamCFVTqS
	hw+stK2PTLfDaY3WSYBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvxju-0000000HNkt-1Kon;
	Sat, 22 Mar 2025 12:14:10 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvxjr-0000000HNkE-25kH
	for kvm-riscv@lists.infradead.org;
	Sat, 22 Mar 2025 12:14:08 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so19315865e9.1
        for <kvm-riscv@lists.infradead.org>; Sat, 22 Mar 2025 05:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1742645646; x=1743250446; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HWiG+xsp/K3sKHDmBr99lwm1kmwvHTycl73xMSShxhA=;
        b=eNOh4ptBHmrK2bDAVSqnBrIm8bFZXHnJ1OkjSt+VkxUAWOxufKSwFOJwzJ5l81Rtfi
         E9g6piiYGcsMuBipSUpZtl24kktphkGAJRYyHoJ5nCOfQ47vBzQm5aeBsQVLc7Tt7ZDc
         lApBuNiwmkZ+w6uV8IsW+kzM7h9MPedTwMkZXJPORIzspiAzAv0EdRBAEtBkOBXXIHcs
         kvKS4nclYhgP3hVstuyrbpzEtEFJF9Z+tFT1oMR0ighSPUbhwop2y1y+Yq35r9iQm2DH
         IrnF3M/PArWsppq6lAmELlnPs4Qs8Qa8HifJ0j6VP2nP2h4K0RLaHUwQum1W0KU/A809
         LEig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742645646; x=1743250446;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HWiG+xsp/K3sKHDmBr99lwm1kmwvHTycl73xMSShxhA=;
        b=obG3e9M8WapyDWzWUPm5VEh+xZaU6C88+4wEn5j+3pVYI3TbrhrwjZKE04k+2H//LM
         dxp9cqWHeqObeJK5rAPaXHTzFK38WhA2ZuUjE8qMoXqAFKqdNncmNP8OupR3sbTwaDI+
         iVaR/KikXPYhrmnR7v7B7wjWXZSCCaLXxa5/zGD2jh1P94hNYtE94SImUBGqHELKhQgB
         VZxiPmdDLoLkB98q8RW2uDPOgKWkSSQgHQT9SfNCv4js5UaeL5P3jzHFsTKdSXhrS5px
         9UhMqpr7meMH/SjvVEAJxpTsE/cip51Fpfz6yDwoabCA5gnkWYt+DBaHwuI0FfS77NdL
         5ZdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbrXIZO9utojCLTV0dJqe001/Tbp/74OjLMJAce7CEGsGHtyCg94crom3wreWnX92woH2dFfTxI0w=@lists.infradead.org
X-Gm-Message-State: AOJu0YymKAO1OziD8iV+gDxbMVcsvThZAc+Sdwsv7Vf76TtQNqxTSApL
	YtuhUECvrTF302Ms8XrCLAoT1+YtIO0H5fpictVjNPtEODVpQPeu5mFSqxPm70w=
X-Gm-Gg: ASbGncsgM9Ws0msJrNvNcBgq1tPgoAtZUpCwYvNPaE2s7DfSojQznw9312++qTPpWPG
	tuhWEk4fKESr8hS3vrcHHuPNwLsoy/PqF/1CugonCrdcPN6CJffFYeT2xN3LY34qcz+XaIT3wBJ
	L/p4nAgEsYsEIhkyOnHLLto0kvjGmKAk9eqhDVIVpNOQ4sGhG2m/8hVOgd5S7K3DIaotdRTUSjx
	rLHn6O0hWHgPg+o4kK2Fd7i2VrF98r6m3ELV43SGgJmjwwSDl3dDfRPP6WDhTapjNtcfkvspiss
	3cTA84DwT7t0GS2K3bAmHOSitTi6HfHDSoJdOQ7hAAH3oUnGLoaEVzSPXXPu90Utoqq1dMZh9w=
	=
X-Google-Smtp-Source: AGHT+IHDpqohOy/JFZMqFxMBBhwIE63mmqiaNSOUqHyk1TFZEA2JJgoaEQil96e3l0fdWRwlkr8L7g==
X-Received: by 2002:a05:6000:1fa6:b0:391:34:4fa9 with SMTP id ffacd0b85a97d-3997f899fafmr5563180f8f.0.1742645645619;
        Sat, 22 Mar 2025 05:14:05 -0700 (PDT)
Received: from localhost (cst2-173-28.cust.vodafone.cz. [31.30.173.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fdb0669sm54992695e9.34.2025.03.22.05.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Mar 2025 05:14:05 -0700 (PDT)
Date: Sat, 22 Mar 2025 13:14:03 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH v4 04/18] riscv: sbi: add SBI FWFT extension calls
Message-ID: <20250322-62ad16eaf41abd98170fa6bb@orel>
References: <20250317170625.1142870-1-cleger@rivosinc.com>
 <20250317170625.1142870-5-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250317170625.1142870-5-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250322_051407_541180_63F8D2F6 
X-CRM114-Status: GOOD (  20.52  )
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

On Mon, Mar 17, 2025 at 06:06:10PM +0100, Cl=E9ment L=E9ger wrote:
> Add FWFT extension calls. This will be ratified in SBI V3.0 hence, it is
> provided as a separate commit that can be left out if needed.
> =

> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> ---
>  arch/riscv/kernel/sbi.c | 30 ++++++++++++++++++++++++++++--
>  1 file changed, 28 insertions(+), 2 deletions(-)
> =

> diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
> index d41a5642be24..54d9ceb7b723 100644
> --- a/arch/riscv/kernel/sbi.c
> +++ b/arch/riscv/kernel/sbi.c
> @@ -299,6 +299,8 @@ static int __sbi_rfence_v02(int fid, const struct cpu=
mask *cpu_mask,
>  	return 0;
>  }
>  =

> +static bool sbi_fwft_supported;
> +
>  /**
>   * sbi_fwft_get() - Get a feature for the local hart
>   * @feature: The feature ID to be set
> @@ -308,7 +310,15 @@ static int __sbi_rfence_v02(int fid, const struct cp=
umask *cpu_mask,
>   */
>  int sbi_fwft_get(u32 feature, unsigned long *value)
>  {
> -	return -EOPNOTSUPP;
> +	struct sbiret ret;
> +
> +	if (!sbi_fwft_supported)
> +		return -EOPNOTSUPP;
> +
> +	ret =3D sbi_ecall(SBI_EXT_FWFT, SBI_EXT_FWFT_GET,
> +			feature, 0, 0, 0, 0, 0);

We're missing the

 if (!ret)
    *value =3D ret.value;

part.

> +
> +	return sbi_err_map_linux_errno(ret.error);
>  }
>  =

>  /**
> @@ -321,7 +331,15 @@ int sbi_fwft_get(u32 feature, unsigned long *value)
>   */
>  int sbi_fwft_set(u32 feature, unsigned long value, unsigned long flags)
>  {
> -	return -EOPNOTSUPP;
> +	struct sbiret ret;
> +
> +	if (!sbi_fwft_supported)
> +		return -EOPNOTSUPP;
> +
> +	ret =3D sbi_ecall(SBI_EXT_FWFT, SBI_EXT_FWFT_SET,
> +			feature, value, flags, 0, 0, 0);
> +
> +	return sbi_err_map_linux_errno(ret.error);
>  }
>  =

>  struct fwft_set_req {
> @@ -360,6 +378,9 @@ int sbi_fwft_local_set_cpumask(const cpumask_t *mask,=
 u32 feature,
>  		.error =3D ATOMIC_INIT(0),
>  	};
>  =

> +	if (!sbi_fwft_supported)
> +		return -EOPNOTSUPP;
> +
>  	if (feature & SBI_FWFT_GLOBAL_FEATURE_BIT)
>  		return -EINVAL;
>  =

> @@ -691,6 +712,11 @@ void __init sbi_init(void)
>  			pr_info("SBI DBCN extension detected\n");
>  			sbi_debug_console_available =3D true;
>  		}
> +		if ((sbi_spec_version >=3D sbi_mk_version(3, 0)) &&
> +		    (sbi_probe_extension(SBI_EXT_FWFT) > 0)) {
> +			pr_info("SBI FWFT extension detected\n");
> +			sbi_fwft_supported =3D true;
> +		}
>  	} else {
>  		__sbi_set_timer =3D __sbi_set_timer_v01;
>  		__sbi_send_ipi	=3D __sbi_send_ipi_v01;
> -- =

> 2.47.2
>

Thanks,
drew

-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
