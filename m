Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB153C282EC
	for <kvm-riscv@archiver.kernel.org>; Mon, 17 Mar 2025 12:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eUJs+c8PBCaW62cp+mymzrF6MaIkDiNc8R4j+LXLnVY=; b=SSFN7csOcmIARf
	F9iujdWV7qw1wOjffvip/gegqLjn7mhYmC9cwlzzo5uwJCTryD5Psw083g7P0/IjnpENLALCrP/fJ
	Ke1X+5LlJv/9jLXLBE4neK8rjGj9dzUM16gNa1e80lYm/4BP2WcYJ8SXW8PBpGVNhpfJ42OmFHFGF
	8ukUqLVLjOFuWCHYH9y509RcobTdJRq7siYqCKFYxcG4XOVOSKtL/l7B/cfnl6/k13hLgoathbyZS
	8DmsR0HSK+iXZjwM13PTrE7sQ3JmbvbhtAc0mU77K1E375JrApXskX9Egn7fT2oG/ZXT+9A2MUUUG
	24FtxgnOzebDF82BlHVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu9cU-00000002Zgk-2kMK;
	Mon, 17 Mar 2025 12:31:02 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu9cR-00000002ZfF-2Pwf
	for kvm-riscv@lists.infradead.org;
	Mon, 17 Mar 2025 12:31:00 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-ac2b10bea16so223346366b.0
        for <kvm-riscv@lists.infradead.org>; Mon, 17 Mar 2025 05:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1742214658; x=1742819458; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=keEF1ClYo9QFdZgk8doZ3yD+Jw42L+l34XOiAAsMsaU=;
        b=F7RMtMiifc5Ji0/eKYoBhnIUwW/DjOF818N3ch+6uw62RHrwceLX2lcD7tgRy2pFn6
         rdzCKPYvZ9g+15qIDKb+ju04Dh0TMz+Xig3BLHzMSd1y7zkq3rGTlbs1NNT4xvp57IQU
         7hGsqncxj9mRZzslrRGpvxUiNTmixsXZZY3Kk7iTHtiCWsLIIF0EpxBgtbHVfiaj6STO
         8J6+OKCCWpuS3faMJGXTucfjJ2BQQNLIaBHhHVc2TUQ9tLj4MYU5jEE4ztGh4/NUbfvu
         xPdZSX3RYKDWEZ3zgVwhOY1q3GQSOV2npBaa8WT8WfVtdPovnXX9TR9X3yT+QuS5ezpN
         rmBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742214658; x=1742819458;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=keEF1ClYo9QFdZgk8doZ3yD+Jw42L+l34XOiAAsMsaU=;
        b=WEyWHlvoj+6EIT4dPg6DRZLwGlt/RUd0qZVpws5qkX1eC7O3uGBXn0hd/RkD7bFr7B
         1nBfiR54Q4TRJHwTg92MWKIVfGBf6e6NM6MHNROZqMZpO+L83uWnVXchcmcw1rVhUFUp
         WJiT5uEnBYBvBhhMLmm1IRV4BCVX30ZqkBokgBr3FH7NboVnDJqjpdyUy+z7LywZpb5e
         EOMVuJl9DRNDo35GuIdUJDXixN0Xesy1KbODpbdpQ8byqdTQGPqHpkeb7vFfyARTR2M+
         uLZvr9noHLKfhMvLavhlATZelhHBEqKg5PT3iLhZ8A0Tj41LO3gS+nZMfcDAOCZweLQg
         Nntg==
X-Forwarded-Encrypted: i=1; AJvYcCV2wEf7fAtnAXcdHn30C2wooG0Kl6Cw90fsMtVIwb8l1e+lPFK6xHSNztYyW1V4Bo2kfiKeUXir7Xw=@lists.infradead.org
X-Gm-Message-State: AOJu0YzYpQAEaGyn3LVq3zJnNr5LHCf7zgGE6GmJGCAzSVYvqq6y7XsU
	47FTF4yjLXVrCCoX1xw0xn/pwJKxukv6+Bn4P/rUQi4HSuIcdulcpXFKJ1qZw5s=
X-Gm-Gg: ASbGncv2G28FUPIBuvI9dATrMOSdkAsTRgUEgf6+/Urg0WQAjMPxlmcCdVGRbTlDVjj
	kWalsGhsD+FKQnbQgM+Zq3ge2WatN1epIV9JkRYGZQxa+B13WwKFgKGKs+/UWFDZEmW5zXAVdxk
	Id5+/+gKOHRvn2rfY7UAr4X9oDSWLskCcvLk0nPY6MThByxmKptydgU+0ukRzyvdY4szPTlFyMv
	5KstYShYKFhZcGqnkapMsE20ubV1FCCadI5z3fhSqx40erKSLrjktUQQddXvPqZr8SJ1cYnPhyu
	lyqCBj2GOtNwNVZHUJqHvusO7IQotPj9
X-Google-Smtp-Source: AGHT+IHtzVUeirnuse4ZybcWG7nXBAB985STAX7f2lJ+9K3VXptDd5bi0QFu79er9azuzjpbxYPToA==
X-Received: by 2002:a17:906:4795:b0:abf:fb7b:8d09 with SMTP id a640c23a62f3a-ac33041c7a6mr1172606666b.51.1742214657719;
        Mon, 17 Mar 2025 05:30:57 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::59a5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac314a9db94sm671667366b.171.2025.03.17.05.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 05:30:57 -0700 (PDT)
Date: Mon, 17 Mar 2025 13:30:56 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	Anup Patel <apatel@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>
Subject: Re: [kvm-unit-tests PATCH v10 4/8] riscv: sbi: Add functions for
 version checking
Message-ID: <20250317-4edd893e742f7186b515be76@orel>
References: <20250317101956.526834-1-cleger@rivosinc.com>
 <20250317101956.526834-5-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250317101956.526834-5-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_053059_618934_3DB044A9 
X-CRM114-Status: GOOD (  19.26  )
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

On Mon, Mar 17, 2025 at 11:19:50AM +0100, Cl=E9ment L=E9ger wrote:
> Version checking was done using some custom hardcoded values, backport a
> few SBI function and defines from Linux to do that cleanly.
> =

> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> ---
>  lib/riscv/asm/sbi.h | 15 +++++++++++++++
>  lib/riscv/sbi.c     |  9 +++++++--
>  2 files changed, 22 insertions(+), 2 deletions(-)
> =

> diff --git a/lib/riscv/asm/sbi.h b/lib/riscv/asm/sbi.h
> index 2f4d91ef..197288c7 100644
> --- a/lib/riscv/asm/sbi.h
> +++ b/lib/riscv/asm/sbi.h
> @@ -18,6 +18,12 @@
>  #define SBI_ERR_IO			-13
>  #define SBI_ERR_DENIED_LOCKED		-14
>  =

> +/* SBI spec version fields */
> +#define SBI_SPEC_VERSION_DEFAULT	0x1

We don't need this define, since we don't support version 0.1. But there
is another mask we should add. See below.

> +#define SBI_SPEC_VERSION_MAJOR_SHIFT	24
> +#define SBI_SPEC_VERSION_MAJOR_MASK	0x7f
> +#define SBI_SPEC_VERSION_MINOR_MASK	0xffffff
> +
>  #ifndef __ASSEMBLER__
>  #include <cpumask.h>
>  =

> @@ -110,6 +116,14 @@ struct sbiret {
>  	long value;
>  };
>  =

> +/* Make SBI version */
> +static inline unsigned long sbi_mk_version(unsigned long major, unsigned=
 long minor)
> +{
> +	return ((major & SBI_SPEC_VERSION_MAJOR_MASK) << SBI_SPEC_VERSION_MAJOR=
_SHIFT)
> +		| (minor & SBI_SPEC_VERSION_MINOR_MASK);
> +}
> +
> +

Extra blank, but I see it goes away with the next patch.

>  struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
>  			unsigned long arg1, unsigned long arg2,
>  			unsigned long arg3, unsigned long arg4,
> @@ -124,6 +138,7 @@ struct sbiret sbi_send_ipi_cpu(int cpu);
>  struct sbiret sbi_send_ipi_cpumask(const cpumask_t *mask);
>  struct sbiret sbi_send_ipi_broadcast(void);
>  struct sbiret sbi_set_timer(unsigned long stime_value);
> +struct sbiret sbi_get_spec_version(void);
>  long sbi_probe(int ext);
>  =

>  #endif /* !__ASSEMBLER__ */
> diff --git a/lib/riscv/sbi.c b/lib/riscv/sbi.c
> index 02dd338c..3c395cff 100644
> --- a/lib/riscv/sbi.c
> +++ b/lib/riscv/sbi.c
> @@ -107,12 +107,17 @@ struct sbiret sbi_set_timer(unsigned long stime_val=
ue)
>  	return sbi_ecall(SBI_EXT_TIME, SBI_EXT_TIME_SET_TIMER, stime_value, 0, =
0, 0, 0, 0);
>  }
>  =

> +struct sbiret sbi_get_spec_version(void)
> +{
> +	return sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_GET_SPEC_VERSION, 0, 0, 0, =
0, 0, 0);
> +}
> +
>  long sbi_probe(int ext)
>  {
>  	struct sbiret ret;
>  =

> -	ret =3D sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_GET_SPEC_VERSION, 0, 0, 0,=
 0, 0, 0);
> -	assert(!ret.error && (ret.value & 0x7ffffffful) >=3D 2);
> +	ret =3D sbi_get_spec_version();
> +	assert(!ret.error && ret.value >=3D sbi_mk_version(2, 0));

This changes the check from >=3D 0.2 to >=3D 2.0. Also, before, we were more
tolerant with the return value potentially having upper bits set, since
the spec only recently added "When XLEN is greater than 32, bits 32 and
above are also reserved and must be 0." and we can leave it to the SBI
tests to check those bits. IOW, this should be

#define SBI_SPEC_VERSION_MASK 0x7fffffff

 assert(!ret.error && (ret.value & SBI_SPEC_VERSION_MASK) >=3D sbi_mk_versi=
on(0, 2));

>  =

>  	ret =3D sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_PROBE_EXT, ext, 0, 0, 0, 0=
, 0);
>  	assert(!ret.error);
> -- =

> 2.47.2
>

Thanks,
drew

-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
