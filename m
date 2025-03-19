Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6A53C36001
	for <kvm-riscv@archiver.kernel.org>; Wed, 19 Mar 2025 17:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fOGqA4Ao6jLYpOMLVIdGJ6I344E7Pa/7hfGl6SkuOlU=; b=2VM59ZxFo6swW7
	5bfbJCtWpNIDdEzDEb+qrYqjaPNNztqorJuMufXiGzUKo6ogVxYgoJWkUBYEkxHDFAshJrVmJoVei
	q5O3Nxk6hfBkRohvRQph6NWWWnixORGBR1L+PKZlou+oOvHY6dzEPKagLbFbYmPzPmCl573pYUtho
	30Ru3UEwt7pJR3Je2wBIAP8Utj95gDu+mxC7E2sO+xo/Y95bro4QQTxS0e9WuNPXjOS4669knOGNf
	jowm8JNULbVuhsG4au4xsHWuA/8Jxb4+xH+F2iFrGHymigFTe/5yQFxpIpbh4HJ7oPSapAqddg/9M
	dcasDyg+Fc3Mq+b63kHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuxRc-00000009k1d-0sLd;
	Wed, 19 Mar 2025 17:43:08 +0000
Received: from out-188.mta1.migadu.com ([2001:41d0:203:375::bc])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuxKy-00000009j52-1iPx
	for kvm-riscv@lists.infradead.org;
	Wed, 19 Mar 2025 17:36:18 +0000
Date: Wed, 19 Mar 2025 18:36:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1742405773;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ErWkhu1m3mOlbwmYksVgSmppKgKfD3xu4om11C7ZndA=;
	b=cXZc7K/3uRl2umO2QqWHI8wOEvg5I2uPhREU3yeRvj/OpimxjI1J+kpUvywK20JtmF3EqK
	Esemtcfm8jz8fhpxQ9B33uGdXvQEWYK3HTeoKmV8dN6gGTu8w/1peZKOUti+XhyjiwI4xA
	mOEO7gjaHylWW5QOWIwGbONz0IACwLE=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	Andrew Jones <ajones@ventanamicro.com>, Anup Patel <apatel@ventanamicro.com>, 
	Atish Patra <atishp@rivosinc.com>
Subject: Re: [kvm-unit-tests PATCH v11 5/8] lib: riscv: Add functions to get
 implementer ID and version
Message-ID: <20250319-093901c8531b82e99d02ea8e@orel>
References: <20250317164655.1120015-1-cleger@rivosinc.com>
 <20250317164655.1120015-6-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250317164655.1120015-6-cleger@rivosinc.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_103616_791197_CB9B3B60 
X-CRM114-Status: GOOD (  15.25  )
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

On Mon, Mar 17, 2025 at 05:46:50PM +0100, Cl=E9ment L=E9ger wrote:
> These functions will be used by SSE tests to check for a specific OpenSBI
> version.
> =

> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> ---
>  lib/riscv/asm/sbi.h | 20 ++++++++++++++++++++
>  lib/riscv/sbi.c     | 20 ++++++++++++++++++++
>  2 files changed, 40 insertions(+)
> =

> diff --git a/lib/riscv/asm/sbi.h b/lib/riscv/asm/sbi.h
> index ee9d6e50..90111628 100644
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
> +#define SBI_IMPL_XEN		7
> +#define SBI_IMPL_POLARFIRE_HSS	8
> +#define SBI_IMPL_COREBOOT	9
> +#define SBI_IMPL_OREBOOT	10
> +#define SBI_IMPL_BHYVE		11
> +
>  /* SBI spec version fields */
>  #define SBI_SPEC_VERSION_MAJOR_SHIFT	24
>  #define SBI_SPEC_VERSION_MAJOR_MASK	0x7f
> @@ -124,6 +137,11 @@ static inline unsigned long sbi_mk_version(unsigned =
long major, unsigned long mi
>  		| (minor & SBI_SPEC_VERSION_MINOR_MASK);
>  }
>  =

> +static inline unsigned long sbi_impl_opensbi_mk_version(unsigned long ma=
jor, unsigned long minor)
> +{
> +	return (((major & 0xffff) << 16) | (minor & 0xffff));
> +}
> +
>  struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
>  			unsigned long arg1, unsigned long arg2,
>  			unsigned long arg3, unsigned long arg4,
> @@ -139,6 +157,8 @@ struct sbiret sbi_send_ipi_cpumask(const cpumask_t *m=
ask);
>  struct sbiret sbi_send_ipi_broadcast(void);
>  struct sbiret sbi_set_timer(unsigned long stime_value);
>  struct sbiret sbi_get_spec_version(void);
> +unsigned long sbi_get_imp_version(void);
> +unsigned long sbi_get_imp_id(void);
>  long sbi_probe(int ext);
>  =

>  #endif /* !__ASSEMBLER__ */
> diff --git a/lib/riscv/sbi.c b/lib/riscv/sbi.c
> index 9d4eb541..ab032e3e 100644
> --- a/lib/riscv/sbi.c
> +++ b/lib/riscv/sbi.c
> @@ -107,6 +107,26 @@ struct sbiret sbi_set_timer(unsigned long stime_valu=
e)
>  	return sbi_ecall(SBI_EXT_TIME, SBI_EXT_TIME_SET_TIMER, stime_value, 0, =
0, 0, 0, 0);
>  }
>  =

> +unsigned long sbi_get_imp_version(void)
> +{
> +	struct sbiret ret;
> +
> +	ret =3D sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_GET_IMP_VERSION, 0, 0, 0, =
0, 0, 0);
> +	assert(!ret.error);
> +
> +	return ret.value;
> +}
> +
> +unsigned long sbi_get_imp_id(void)
> +{
> +	struct sbiret ret;
> +
> +	ret =3D sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_GET_IMP_ID, 0, 0, 0, 0, 0,=
 0);
> +	assert(!ret.error);
> +
> +	return ret.value;
> +}
> +
>  struct sbiret sbi_get_spec_version(void)
>  {
>  	return sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_GET_SPEC_VERSION, 0, 0, 0, =
0, 0, 0);
> -- =

> 2.47.2
>

LGTM

Thanks,
drew

-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
