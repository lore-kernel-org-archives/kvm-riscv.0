Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A03FEC35FF3
	for <kvm-riscv@archiver.kernel.org>; Thu, 13 Mar 2025 15:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VO4NX8MRYWumbCCbngTUv0/d56tICGFxIDJTbz57r+g=; b=slg5Mk1CnyvalF
	QMBST+W034ernxLvwgIco9xgb065mpCrWFn4cSlCq06Pm4Dog+23AgGJGuHCapmXthNxqSAyjID3J
	bVCJVZ0DyaN5qUa7i0PLgorBW4X7YiBum1jGjLO6j6xsgmLyxExls5/BPK1Jf4vBB9Cz23sniChIg
	ehbGfqM7I/3D666yxcpyk5hJpWFxgFk94lyqcDfJ2AlDVedepiyMq/0blhrBR79oWAFIiFu2XXmVw
	svk289naQHvdgW9GccbKuAY7pIOoeozWayJbEXvu9h6kjjFGWFPz67BdJZsTrmB9F+FqV5Pp0Wcml
	EloN9aODNErHTMw9gcTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tskKJ-0000000BdLn-1WbV;
	Thu, 13 Mar 2025 15:18:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tskKI-0000000BdKs-0CEO
	for kvm-riscv@bombadil.infradead.org;
	Thu, 13 Mar 2025 15:18:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=isB+41NGUW/+LtTWyVmmsVADbWrUkVd/mu3pBc3RyqY=; b=V2cxVvsMe5gsCFghIjIB1fl5vR
	Qvc6fF3ETvDArPFl2xmWa8qy/U7URLvPt23DqfiA/19uYnK3fyBmLI5D2vMqsupSFi7iSS/9GsF3o
	ySNGwu18PYkuq4SJW+nJtWTzmpuNvzxSSnTCS7IuUSd1sM1TZlb5k+EknD8SJyP0V7lWKLyxdaO5v
	96zgw2XOYVx/XnVAu9Rk1bIalkCt5Bmm9wNT2hVgWdDYnFXULHJ4JRVVRq9fE79lcAZjTP8MTmS4U
	0va9cZ2b/S6B8EoUOMAh7Yj+MkC5yx5Pb8bBpJoK2KuDDQVo47fr+CRNdYtgqNxq+ybd7B0915wR6
	deUTLi5w==;
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tskKF-00000002iee-0X9d
	for kvm-riscv@lists.infradead.org;
	Thu, 13 Mar 2025 15:18:24 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43bb6b0b898so10213175e9.1
        for <kvm-riscv@lists.infradead.org>; Thu, 13 Mar 2025 08:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1741879101; x=1742483901; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=isB+41NGUW/+LtTWyVmmsVADbWrUkVd/mu3pBc3RyqY=;
        b=D9EpSpyKti6t6353a+vgX0Xz9/oxABNWKh/Ac3vFnIiZniXvgT45Jn1sZtpoicSqVU
         7hKeI0bTVl8p9Eqrn3UvDubte3mL5KFuyzyINJMT3eLiun3znbnJbwtYJENamYv3XqmI
         2RKyyhmrvKaD27QPrW32EoVTcAR/pJsjXxjZcrnsYdoJTm3fd5m2cX6o8qVSx287f92O
         QCTEIhzqrq/7KFMjpHBJk4LjXon8hObTyYxywjgDX9mGgDU04TGgBxaZz8itYlglnM1m
         N0R4OJ7TCeWEFoyNKkjunwNITYDCgsBtXCHZUgGlsUxnZWWSTK+GB7YCAPvHfrdDGqtX
         DK+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741879101; x=1742483901;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=isB+41NGUW/+LtTWyVmmsVADbWrUkVd/mu3pBc3RyqY=;
        b=ViAOR1ynVaiGjqnagFJxYIlSvwiQhCH8Crb6S0UMOUBY/36tfN8wny0YFy+HWdUA/t
         i/Ey9HMh+ZJHzA6e1wNGfHOG93F7xfeKxnE9sjk9rSAo9AZFakcpzFjnOKBnwHDZIEjK
         MzXoLWwYeQpuX3wRkBpfehCeiciEfiBZpvd2t3hfjOpTeLrhuKpUvKj0SPn/4Onixn3k
         4+h/Lup1hYF7lmRLvllKg7XbNBDg+jsJWHZnbzQjmXMBkaz4P7vfO3eHRwwvL+0ahG2B
         7hBNW+nkRR8glrqXHKAjg5/yrL8Qs3nl3dXWdWhc8wYeltllcZyMZdWF6gIYiUlxsD0u
         qg9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVx4I5aCc0oakBNl2GQPyUw7i8wVD1l8E66tpCRxOvrG59hhwI260cXW4XNuW8geMm7kEpk6aWy6Z0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+ryaXaEeR6dCZBFkElD4I8dj6G9ZcMByJDrmURMW9Fnuy7hH7
	zoH+1WWo4099ZxqrJuoH2dw8fCMz/yxFp6KToRjAYlTnunss1cNW/VYYQVxgOio=
X-Gm-Gg: ASbGncv0xBC+aBr82sOzKlCpQa48DpTHA4lhQGll/W721RsrMs+iVOF2gooZAnwTep8
	d4T1vONKG43Ma+X+/ZiP6tlLdRVsRkJ3Hy6av97UwGs/1wbeg9Y65xESCCSCt6v2qC/XA3LHOfX
	89wncXoM/+HvxcIE0FbiOE7NzEm7AP96WVmID/HNaga2CS4IMRUyYvUO+5UzE1nzRhBw8gph3Ob
	XoqQ9hMEfolZKny5GXgQFg6+adpTuITF1h9HqTOtMcwzIUjWlxcqaHoLZUebrI6EJxL5ki6Gn3b
	4BkS8pubeKaB71yMEsqmvAFj3ccTVy77
X-Google-Smtp-Source: AGHT+IGQoej17xQcxoErKHLCqvlPlZSqjGfTS7DBqmbIvkpb8XJf7iEa6MP5sQiwocZCvXTx8N2C4g==
X-Received: by 2002:a05:600c:3502:b0:43c:f4b3:b0ad with SMTP id 5b1f17b1804b1-43d01c12187mr109092455e9.19.1741879100728;
        Thu, 13 Mar 2025 08:18:20 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::59a5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d0a8d0ab1sm56347735e9.34.2025.03.13.08.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 08:18:19 -0700 (PDT)
Date: Thu, 13 Mar 2025 16:18:18 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH v3 16/17] RISC-V: KVM: add support for FWFT SBI extension
Message-ID: <20250313-b15bd3f690fccfc5d1a946fc@orel>
References: <20250310151229.2365992-1-cleger@rivosinc.com>
 <20250310151229.2365992-17-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250310151229.2365992-17-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_151823_261883_B1676691 
X-CRM114-Status: GOOD (  30.96  )
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

On Mon, Mar 10, 2025 at 04:12:23PM +0100, Cl=E9ment L=E9ger wrote:
> Add basic infrastructure to support the FWFT extension in KVM.
> =

> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> ---
>  arch/riscv/include/asm/kvm_host.h          |   4 +
>  arch/riscv/include/asm/kvm_vcpu_sbi.h      |   1 +
>  arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h |  31 +++
>  arch/riscv/include/uapi/asm/kvm.h          |   1 +
>  arch/riscv/kvm/Makefile                    |   1 +
>  arch/riscv/kvm/vcpu_sbi.c                  |   4 +
>  arch/riscv/kvm/vcpu_sbi_fwft.c             | 212 +++++++++++++++++++++
>  7 files changed, 254 insertions(+)
>  create mode 100644 arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h
>  create mode 100644 arch/riscv/kvm/vcpu_sbi_fwft.c
> =

> diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/k=
vm_host.h
> index bb93d2995ea2..c0db61ba691a 100644
> --- a/arch/riscv/include/asm/kvm_host.h
> +++ b/arch/riscv/include/asm/kvm_host.h
> @@ -19,6 +19,7 @@
>  #include <asm/kvm_vcpu_fp.h>
>  #include <asm/kvm_vcpu_insn.h>
>  #include <asm/kvm_vcpu_sbi.h>
> +#include <asm/kvm_vcpu_sbi_fwft.h>
>  #include <asm/kvm_vcpu_timer.h>
>  #include <asm/kvm_vcpu_pmu.h>
>  =

> @@ -281,6 +282,9 @@ struct kvm_vcpu_arch {
>  	/* Performance monitoring context */
>  	struct kvm_pmu pmu_context;
>  =

> +	/* Firmware feature SBI extension context */
> +	struct kvm_sbi_fwft fwft_context;
> +
>  	/* 'static' configurations which are set only once */
>  	struct kvm_vcpu_config cfg;
>  =

> diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/a=
sm/kvm_vcpu_sbi.h
> index cb68b3a57c8f..ffd03fed0c06 100644
> --- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
> +++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> @@ -98,6 +98,7 @@ extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext=
_hsm;
>  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_dbcn;
>  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_susp;
>  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_sta;
> +extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_fwft;
>  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_experimental;
>  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_vendor;
>  =

> diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h b/arch/riscv/incl=
ude/asm/kvm_vcpu_sbi_fwft.h
> new file mode 100644
> index 000000000000..ec7568e0dc1a
> --- /dev/null
> +++ b/arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h
> @@ -0,0 +1,31 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2025 Rivos Inc.
> + *
> + * Authors:
> + *     Cl=E9ment L=E9ger <cleger@rivosinc.com>
> + */
> +
> +#ifndef __KVM_VCPU_RISCV_FWFT_H
> +#define __KVM_VCPU_RISCV_FWFT_H
> +
> +#include <asm/sbi.h>
> +
> +struct kvm_sbi_fwft_config;
> +struct kvm_sbi_fwft_feature;
> +struct kvm_vcpu;

Should only need the forward declaration for kvm_sbi_fwft_feature.

> +
> +struct kvm_sbi_fwft_config {
> +	const struct kvm_sbi_fwft_feature *feature;
> +	bool supported;
> +	unsigned long flags;
> +};
> +
> +/* FWFT data structure per vcpu */
> +struct kvm_sbi_fwft {
> +	struct kvm_sbi_fwft_config *configs;
> +};
> +
> +#define vcpu_to_fwft(vcpu) (&(vcpu)->arch.fwft_context)
> +
> +#endif /* !__KVM_VCPU_RISCV_FWFT_H */
> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/=
asm/kvm.h
> index f06bc5efcd79..fa6eee1caf41 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -202,6 +202,7 @@ enum KVM_RISCV_SBI_EXT_ID {
>  	KVM_RISCV_SBI_EXT_DBCN,
>  	KVM_RISCV_SBI_EXT_STA,
>  	KVM_RISCV_SBI_EXT_SUSP,
> +	KVM_RISCV_SBI_EXT_FWFT,
>  	KVM_RISCV_SBI_EXT_MAX,
>  };
>  =

> diff --git a/arch/riscv/kvm/Makefile b/arch/riscv/kvm/Makefile
> index 4e0bba91d284..06e2d52a9b88 100644
> --- a/arch/riscv/kvm/Makefile
> +++ b/arch/riscv/kvm/Makefile
> @@ -26,6 +26,7 @@ kvm-y +=3D vcpu_onereg.o
>  kvm-$(CONFIG_RISCV_PMU_SBI) +=3D vcpu_pmu.o
>  kvm-y +=3D vcpu_sbi.o
>  kvm-y +=3D vcpu_sbi_base.o
> +kvm-y +=3D vcpu_sbi_fwft.o
>  kvm-y +=3D vcpu_sbi_hsm.o
>  kvm-$(CONFIG_RISCV_PMU_SBI) +=3D vcpu_sbi_pmu.o
>  kvm-y +=3D vcpu_sbi_replace.o
> diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
> index 18726096ef44..27f22e98c8f8 100644
> --- a/arch/riscv/kvm/vcpu_sbi.c
> +++ b/arch/riscv/kvm/vcpu_sbi.c
> @@ -78,6 +78,10 @@ static const struct kvm_riscv_sbi_extension_entry sbi_=
ext[] =3D {
>  		.ext_idx =3D KVM_RISCV_SBI_EXT_STA,
>  		.ext_ptr =3D &vcpu_sbi_ext_sta,
>  	},
> +	{
> +		.ext_idx =3D KVM_RISCV_SBI_EXT_FWFT,
> +		.ext_ptr =3D &vcpu_sbi_ext_fwft,
> +	},
>  	{
>  		.ext_idx =3D KVM_RISCV_SBI_EXT_EXPERIMENTAL,
>  		.ext_ptr =3D &vcpu_sbi_ext_experimental,
> diff --git a/arch/riscv/kvm/vcpu_sbi_fwft.c b/arch/riscv/kvm/vcpu_sbi_fwf=
t.c
> new file mode 100644
> index 000000000000..cce1e41d5490
> --- /dev/null
> +++ b/arch/riscv/kvm/vcpu_sbi_fwft.c
> @@ -0,0 +1,212 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2025 Rivos Inc.
> + *
> + * Authors:
> + *     Cl=E9ment L=E9ger <cleger@rivosinc.com>
> + */
> +
> +#include <linux/errno.h>
> +#include <linux/err.h>
> +#include <linux/kvm_host.h>
> +#include <asm/cpufeature.h>
> +#include <asm/sbi.h>
> +#include <asm/kvm_vcpu_sbi.h>
> +#include <asm/kvm_vcpu_sbi_fwft.h>
> +
> +struct kvm_sbi_fwft_feature {
> +	/**
> +	 * @id: Feature ID
> +	 */
> +	enum sbi_fwft_feature_t id;
> +
> +	/**
> +	 * @supported: Check if the feature is supported on the vcpu
> +	 *
> +	 * This callback is optional, if not provided the feature is assumed to
> +	 * be supported
> +	 */
> +	bool (*supported)(struct kvm_vcpu *vcpu);
> +
> +	/**
> +	 * @set: Set the feature value
> +	 *
> +	 * This callback is mandatory

Since we're doing all this documentation, then let's also state they
return SBI errors (which are longs, so we should probably return longs).

> +	 */
> +	int (*set)(struct kvm_vcpu *vcpu, struct kvm_sbi_fwft_config *conf, uns=
igned long value);
> +
> +	/**
> +	 * @get: Get the feature current value
> +	 *
> +	 * This callback is mandatory
> +	 */
> +	int (*get)(struct kvm_vcpu *vcpu, struct kvm_sbi_fwft_config *conf, uns=
igned long *value);
> +};
> +
> +static const enum sbi_fwft_feature_t kvm_fwft_defined_features[] =3D {
> +	SBI_FWFT_MISALIGNED_EXC_DELEG,
> +	SBI_FWFT_LANDING_PAD,
> +	SBI_FWFT_SHADOW_STACK,
> +	SBI_FWFT_DOUBLE_TRAP,
> +	SBI_FWFT_PTE_AD_HW_UPDATING,
> +	SBI_FWFT_POINTER_MASKING_PMLEN,
> +};
> +
> +static bool kvm_fwft_is_defined_feature(enum sbi_fwft_feature_t feature)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(kvm_fwft_defined_features); i++) {
> +		if (kvm_fwft_defined_features[i] =3D=3D feature)
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
> +static const struct kvm_sbi_fwft_feature features[] =3D {
> +};
> +
> +static struct kvm_sbi_fwft_config *
> +kvm_sbi_fwft_get_config(struct kvm_vcpu *vcpu, enum sbi_fwft_feature_t f=
eature)
> +{
> +	int i =3D 0;

no need for '=3D 0'

> +	struct kvm_sbi_fwft *fwft =3D vcpu_to_fwft(vcpu);
> +
> +	for (i =3D 0; i < ARRAY_SIZE(features); i++) {
> +		if (fwft->configs[i].feature->id =3D=3D feature)
> +			return &fwft->configs[i];
> +	}
> +
> +	return NULL;
> +}
> +
> +static int kvm_fwft_get_feature(struct kvm_vcpu *vcpu, u32 feature,
> +				struct kvm_sbi_fwft_config **conf)
> +{
> +	struct kvm_sbi_fwft_config *tconf;
> +
> +	tconf =3D kvm_sbi_fwft_get_config(vcpu, feature);
> +	if (!tconf) {
> +		if (kvm_fwft_is_defined_feature(feature))
> +			return SBI_ERR_NOT_SUPPORTED;
> +
> +		return SBI_ERR_DENIED;
> +	}
> +
> +	if (!tconf->supported)
> +		return SBI_ERR_NOT_SUPPORTED;
> +
> +	*conf =3D tconf;
> +
> +	return SBI_SUCCESS;
> +}
> +
> +static int kvm_sbi_fwft_set(struct kvm_vcpu *vcpu, u32 feature,
> +			    unsigned long value, unsigned long flags)
> +{
> +	int ret;
> +	struct kvm_sbi_fwft_config *conf;
> +
> +	ret =3D kvm_fwft_get_feature(vcpu, feature, &conf);
> +	if (ret)
> +		return ret;
> +
> +	if ((flags & ~SBI_FWFT_SET_FLAG_LOCK) !=3D 0)
> +		return SBI_ERR_INVALID_PARAM;
> +
> +	if (conf->flags & SBI_FWFT_SET_FLAG_LOCK)
> +		return SBI_ERR_DENIED_LOCKED;
> +
> +	conf->flags =3D flags;
> +
> +	return conf->feature->set(vcpu, conf, value);
> +}
> +
> +static int kvm_sbi_fwft_get(struct kvm_vcpu *vcpu, unsigned long feature,
> +			    unsigned long *value)
> +{
> +	int ret;
> +	struct kvm_sbi_fwft_config *conf;
> +
> +	ret =3D kvm_fwft_get_feature(vcpu, feature, &conf);
> +	if (ret)
> +		return ret;
> +
> +	return conf->feature->get(vcpu, conf, value);
> +}
> +
> +static int kvm_sbi_ext_fwft_handler(struct kvm_vcpu *vcpu, struct kvm_ru=
n *run,
> +				    struct kvm_vcpu_sbi_return *retdata)
> +{
> +	int ret =3D 0;
> +	struct kvm_cpu_context *cp =3D &vcpu->arch.guest_context;
> +	unsigned long funcid =3D cp->a6;
> +
> +	switch (funcid) {
> +	case SBI_EXT_FWFT_SET:
> +		ret =3D kvm_sbi_fwft_set(vcpu, cp->a0, cp->a1, cp->a2);
> +		break;
> +	case SBI_EXT_FWFT_GET:
> +		ret =3D kvm_sbi_fwft_get(vcpu, cp->a0, &retdata->out_val);
> +		break;
> +	default:
> +		ret =3D SBI_ERR_NOT_SUPPORTED;
> +		break;
> +	}
> +
> +	retdata->err_val =3D ret;
> +
> +	return 0;
> +}
> +
> +static int kvm_sbi_ext_fwft_init(struct kvm_vcpu *vcpu)
> +{
> +	struct kvm_sbi_fwft *fwft =3D vcpu_to_fwft(vcpu);
> +	const struct kvm_sbi_fwft_feature *feature;
> +	struct kvm_sbi_fwft_config *conf;
> +	int i;
> +
> +	fwft->configs =3D kcalloc(ARRAY_SIZE(features), sizeof(struct kvm_sbi_f=
wft_config),
> +				GFP_KERNEL);
> +	if (!fwft->configs)
> +		return -ENOMEM;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(features); i++) {
> +		feature =3D &features[i];
> +		conf =3D &fwft->configs[i];
> +		if (feature->supported)
> +			conf->supported =3D feature->supported(vcpu);
> +		else
> +			conf->supported =3D true;
> +
> +		conf->feature =3D feature;
> +	}
> +
> +	return 0;
> +}
> +
> +static void kvm_sbi_ext_fwft_deinit(struct kvm_vcpu *vcpu)
> +{
> +	struct kvm_sbi_fwft *fwft =3D vcpu_to_fwft(vcpu);
> +
> +	kfree(fwft->configs);
> +}
> +
> +static void kvm_sbi_ext_fwft_reset(struct kvm_vcpu *vcpu)
> +{
> +	int i =3D 0;

no need for '=3D 0'

> +	struct kvm_sbi_fwft *fwft =3D vcpu_to_fwft(vcpu);
> +
> +	for (i =3D 0; i < ARRAY_SIZE(features); i++)
> +		fwft->configs[i].flags =3D 0;
> +}
> +
> +const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_fwft =3D {
> +	.extid_start =3D SBI_EXT_FWFT,
> +	.extid_end =3D SBI_EXT_FWFT,
> +	.handler =3D kvm_sbi_ext_fwft_handler,
> +	.init =3D kvm_sbi_ext_fwft_init,
> +	.deinit =3D kvm_sbi_ext_fwft_deinit,
> +	.reset =3D kvm_sbi_ext_fwft_reset,
> +};
> -- =

> 2.47.2
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
