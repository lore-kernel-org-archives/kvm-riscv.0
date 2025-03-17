Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E06F7C282EC
	for <kvm-riscv@archiver.kernel.org>; Mon, 17 Mar 2025 12:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+fFh8TlHatYDktj7msWNCagna6aBbF7fX3rlBbeSUjk=; b=QgoNu3TDMzmvwM
	cXv0j5OCw8uIKlE+kqvrrvC38joP9HM5/cGJayLJemLtuRCyvggXzRRIOUsANYMm5BSQEvMqtxav0
	P+67WaKx5qQzpA7kLP5YhHuAP23rN0i+eqvSxHevLAcSG2xPXlnLU0T9KJsps2Us2mKSdgiDIpjoV
	cT3erkp9506fwqap7RmxQDcylyhb7P+XhF+bmkEp8NaEDikPdugDBzA2BR8FVe7ne/BAulAiKcKKX
	HIMaORX4k2lztl0hEDxeCklxNnJkz2rOaK+Lgu1WXbGey9j9Mp28b5J7xc2wNIwvj9aul36kdMWFj
	kovDPDbNiiBn956iRmsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuA1M-00000002e02-1zEa;
	Mon, 17 Mar 2025 12:56:44 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu9r4-00000002cFu-1EQ6
	for kvm-riscv@lists.infradead.org;
	Mon, 17 Mar 2025 12:46:10 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-ac25d2b2354so753738166b.1
        for <kvm-riscv@lists.infradead.org>; Mon, 17 Mar 2025 05:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1742215564; x=1742820364; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Dj4a9Qi675m+cGCP0Z29Kbq/EiuHBxMaswPzVF8DZxc=;
        b=GvNm95RK6QVJTkq8LqDKGpnWFnw/KWvs2Ba96xCdNK7jC9NcvZCoYeBIACuL5teJa9
         KOvFILbI7A8aUydi0r6c7R8sFJn780uLutCSBbcDmhPZa3x+S2+XFPBK7a9RyOZQg3TR
         /wlSVOGII/eOciH9GRXO84QAqUv62X/7C7aAuhaJz40OVxetycOMtqau1GonO+OXdHJY
         4wW0fweTY6Rk1hRSoBpkFZd4WaAq2oTaxK91eIzQP/0uU9lZ0sbPgf4s6Q+lIhEH7YYS
         oqZQhW0hr76xiDYifAc1QC/LBmFanvc3wDrNPlrpy+/SWOUdS/RZPNIcko35W3X9cGLu
         v0bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742215564; x=1742820364;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dj4a9Qi675m+cGCP0Z29Kbq/EiuHBxMaswPzVF8DZxc=;
        b=cPd1Fszt1kHoIkjfMppMw8z0bfPhLYwu12WQB91N7uOFhEICrraBLJMwjQ8EEE/q58
         psy5MROqEP39UpQ3g90lBmZLKnBx2qwKmteJZOFzMJUbOXVfmka+KL81FLxCmy15QgmM
         D6U35KLYyG0NLKHcz4BYO9kW869KHBqfdPc2Q28K2NzWQJka5z98VigOSZkDiOVLdxeN
         BnhUEd8aqrbO+fKAvF+F+r0JjEtaPwh/rH+mbjYa4sla4gDmJbofAeYSgMKsqU7KD6A9
         KlAB7lTGi/GYJsfw99CbaabBenFjSk/JnN/kh83MczAX6rlj2u3uUcdp+87ZL+8fRR6l
         P9GA==
X-Forwarded-Encrypted: i=1; AJvYcCUqSouIIx43zDH6KZZ0t4PSX22S+RocCjv9CBsegRsRBGIUMBitTpomHk1jkL0ree/+MIea0v8Gh5g=@lists.infradead.org
X-Gm-Message-State: AOJu0YyksHfOF+dv5BBqx0UiCILogy/G0Kvy8ZbijeKIDYf7wEyFjBTI
	4IT5i8oBT3t4TiBDApqw6yl71OVssFcqoMivuj2mQuwDPxTbFzgNWiLt1c4TL14=
X-Gm-Gg: ASbGncvcgOeju9QHmR/N0FeDOngnYjlEqIH8cudu2ecfmhn+6Vf8x9rgyBeAiOd8NtP
	BzqTAnkbEnKlcqj25WZXMyitj1fwTjJl8wfEgVBZcwPgCC39sOuRvf6eOOKMQ4c9xaOe9hBZrTc
	pb6PjdMZzOGuIIKtzjUJACEJvmVQps4Rb9EQeOBdexgSoL/8JhyoVhivsDtX3J2MXgZBZC40mnI
	pY7m7tq9yUGvuqkn6tapDHlCrvlSOjx7Y+iV/jVI4JncWQeI/oneZsaByPG4QxYJULvO0vj8wUy
	VLyQu65qL4jQRkkyn5LI40/vqXtE19StlQb/e+t+T3U=
X-Google-Smtp-Source: AGHT+IEBfSYbyu2x/HWSGN8ifvpso0WAd1rWQtIFYheckpwUl1S2vd1gFGlAFb8pHIF7kPaMb4Iowg==
X-Received: by 2002:a17:907:a089:b0:ac1:ddaa:2c03 with SMTP id a640c23a62f3a-ac32fb300edmr1419732566b.0.1742215564362;
        Mon, 17 Mar 2025 05:46:04 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::59a5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3147e9ab1sm667621866b.52.2025.03.17.05.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 05:46:03 -0700 (PDT)
Date: Mon, 17 Mar 2025 13:46:03 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	Anup Patel <apatel@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>
Subject: Re: [kvm-unit-tests PATCH v10 5/8] lib: riscv: add functions to get
 implementer ID and version
Message-ID: <20250317-a53b74017397269b474dd6b9@orel>
References: <20250317101956.526834-1-cleger@rivosinc.com>
 <20250317101956.526834-6-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250317101956.526834-6-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_054606_893570_BE3BFFDB 
X-CRM114-Status: GOOD (  18.71  )
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

On Mon, Mar 17, 2025 at 11:19:51AM +0100, Cl=E9ment L=E9ger wrote:
> These function will be used by SSE tests to check for a specific opensbi
> version. sbi_impl_check() is an helper allowing to check for a specific
> SBI implementor without needing to check for ret.error.
> =

> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> ---
>  lib/riscv/asm/sbi.h | 30 ++++++++++++++++++++++++++++++
>  lib/riscv/sbi.c     | 10 ++++++++++
>  2 files changed, 40 insertions(+)
> =

> diff --git a/lib/riscv/asm/sbi.h b/lib/riscv/asm/sbi.h
> index 197288c7..06bcec16 100644
> --- a/lib/riscv/asm/sbi.h
> +++ b/lib/riscv/asm/sbi.h
> @@ -18,6 +18,19 @@
>  #define SBI_ERR_IO			-13
>  #define SBI_ERR_DENIED_LOCKED		-14
>  =

> +#define SBI_IMPL_BBL		0
> +#define SBI_IMPL_OPENSBI	1
> +#define SBI_IMPL_XVISOR		2
> +#define SBI_IMPL_KVM		3
> +#define SBI_IMPL_RUSTSBI	4
> +#define SBI_IMPL_DIOSIX		5
> +#define SBI_IMPL_COFFER		6
> +#define SBI_IMPL_XEN Project	7

s/Project//

> +#define SBI_IMPL_POLARFIRE_HSS	8
> +#define SBI_IMPL_COREBOOT	9
> +#define SBI_IMPL_OREBOOT	10
> +#define SBI_IMPL_BHYVE		11
> +
>  /* SBI spec version fields */
>  #define SBI_SPEC_VERSION_DEFAULT	0x1
>  #define SBI_SPEC_VERSION_MAJOR_SHIFT	24
> @@ -123,6 +136,10 @@ static inline unsigned long sbi_mk_version(unsigned =
long major, unsigned long mi
>  		| (minor & SBI_SPEC_VERSION_MINOR_MASK);
>  }
>  =

> +static inline unsigned long sbi_impl_opensbi_mk_version(unsigned long ma=
jor, unsigned long minor)
> +{
> +	return ((major << 16) | (minor));

Should at least mask minor, best to mask both.

> +}
>  =

>  struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
>  			unsigned long arg1, unsigned long arg2,
> @@ -139,7 +156,20 @@ struct sbiret sbi_send_ipi_cpumask(const cpumask_t *=
mask);
>  struct sbiret sbi_send_ipi_broadcast(void);
>  struct sbiret sbi_set_timer(unsigned long stime_value);
>  struct sbiret sbi_get_spec_version(void);
> +struct sbiret sbi_get_imp_version(void);
> +struct sbiret sbi_get_imp_id(void);
>  long sbi_probe(int ext);
>  =

> +static inline bool sbi_check_impl(unsigned long impl)
> +{
> +	struct sbiret ret;
> +
> +	ret =3D sbi_get_imp_id();
> +	if (ret.error)
> +		return false;
> +
> +	return ret.value =3D=3D impl;

Or, more tersely,

struct sbiret ret =3D sbi_get_imp_id();
return !ret.error && ret.value =3D=3D impl;

but an assert would make more sense, since get-impl-id really shouldn't
fail, unless the SBI version is 0.1, which we don't support.

> +}
> +
>  #endif /* !__ASSEMBLER__ */
>  #endif /* _ASMRISCV_SBI_H_ */
> diff --git a/lib/riscv/sbi.c b/lib/riscv/sbi.c
> index 3c395cff..9cb5757e 100644
> --- a/lib/riscv/sbi.c
> +++ b/lib/riscv/sbi.c
> @@ -107,6 +107,16 @@ struct sbiret sbi_set_timer(unsigned long stime_valu=
e)
>  	return sbi_ecall(SBI_EXT_TIME, SBI_EXT_TIME_SET_TIMER, stime_value, 0, =
0, 0, 0, 0);
>  }
>  =

> +struct sbiret sbi_get_imp_version(void)
> +{
> +	return sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_GET_IMP_VERSION, 0, 0, 0, 0=
, 0, 0);
> +}
> +
> +struct sbiret sbi_get_imp_id(void)
> +{
> +	return sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_GET_IMP_ID, 0, 0, 0, 0, 0, =
0);
> +}

Going with error asserts, then we can just put the asserts in these
functions and return ret.value directly, like sbi_probe() does, which
means sbi_check_impl() can be dropped.

Thanks,
drew

> +
>  struct sbiret sbi_get_spec_version(void)
>  {
>  	return sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_GET_SPEC_VERSION, 0, 0, 0, =
0, 0, 0);
> -- =

> 2.47.2
> =


-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
