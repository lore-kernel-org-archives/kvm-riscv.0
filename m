Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1720C35FFC
	for <kvm-riscv@archiver.kernel.org>; Sat, 22 Mar 2025 12:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wY8pzfK2RmBbKsXEAxEgeYtA/3XXUvtMNEOnLFZh1nc=; b=Qozo/evnJAOlZY
	TJR7fRx84PxKmsY7Zma/RvFXoAZ5D58mxvF+Ri7+jiZ1iEGc7ZIe+nqMZh9psl89DfkdDNqiyNn1P
	1ziqB70OsSO4r9ayV+t5fLFLoyAsqu4fWV7NsDweGoxleioqEKaRezSJ04Lndt9Vz3enxLcOZBqVs
	cHArOCQ1jcs7TFBbuiFpVwuFhOSJ60ZTGjD2F1HnvbyHPpFXJLthF+Vl7iRICllDNzP5+VT+l+BMs
	LREUV35DkLgILIQSOFP0CGxgc1+aztQgJiMR9sAnoiKhsgvWXymecPm/XycOZ49oj+DYoyrnmnniO
	SxMvKPL38s9iAUTqQndA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvxzU-0000000HOlV-28PO;
	Sat, 22 Mar 2025 12:30:16 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvxzR-0000000HOkY-20b3
	for kvm-riscv@lists.infradead.org;
	Sat, 22 Mar 2025 12:30:14 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-43690d4605dso19021055e9.0
        for <kvm-riscv@lists.infradead.org>; Sat, 22 Mar 2025 05:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1742646612; x=1743251412; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XK2TAqZG341EzHEinXnSfJT8xoYCNibzBDqkY726Y1s=;
        b=HD/ba6OrPn9s8G1xTMZJOcl3CKHVjZExJipmBNIfPgFDE3Dlv10MLRQkTN11fX2um+
         HL5JE9VZcdBRYLypmC2xIa24hW2CV93zjdxmPKI6Z6U3owQnItYSn8rwU5BgLU50U1Fc
         dxyywRCuV8W09YFYDGXZgvPgBVbbq0/WK2DYfyaIgEY+3/okmA7ETQtaoLFsFrvNeN2J
         uvufnT4QQ5v6tObTnyUSHFdVefNb/R8p4mztkt+XVlTuNyacyiLjsKBwZC/+QEYlVPf3
         wEeB9LkqyWUjr07tQcgHmekgv7Qjkp8yKwA+i0A0FsaHqj+//I5NskdXNuURoaTN9TsE
         LnMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742646612; x=1743251412;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XK2TAqZG341EzHEinXnSfJT8xoYCNibzBDqkY726Y1s=;
        b=BGJgNMpijtl78aEVlGOMUUufiyoSsDFtQmhmJHxdZhzoSK71Y288SBGdD5WiDfaM05
         YNsIbwGMty6SKFDoCXjFFwgoRSwfCa0IJxBqUGH58h2ZyJQZg4X/wDeqpweGzSo8fRV/
         yHy3cLNcGGSdnHtQXsP2DSUm+TnZOeSvllSrOKXZHuDQWurGF2t6nWeuWS4SP9UN/kyy
         nhU02QcXwTP8gonhip2WKNEiGe/E/s8NfJsyrWhVHlAPdhGLWrJQ4gnx/PpHQzD+RQdZ
         Q7NJiFwaelRWACMkjgzVAzz+3L05k1Bj/rxCYCdaX9HebjqtgclTvRmCjnhwZ+2j4XU9
         hSow==
X-Forwarded-Encrypted: i=1; AJvYcCWWQmMxC0BVvmt0EcZEM4FiL/ONsBfNHiWtJFCUNDZncXpWC64NEVbnTPoKYk+JpbP6SJp77S9kA1E=@lists.infradead.org
X-Gm-Message-State: AOJu0YyX0iUYb+Uc4BzT4rS0FFTjhFK9dG4mYgs4f8+Bjf8Drpacsgvg
	H29bE7qpkMUumNw494AscT8Q1d5LrfhYHwxuYVMd/NxVb3Ude7hU9eVzWSgkl8M=
X-Gm-Gg: ASbGnctJ1VGnNJPtVopE3CtHHqfPTNO9do5bPQ/WxSyKTFf2BgC9OI/SYDrxKKuV+c1
	ErwffhowLGCmK4FG7jfLOj6H9CVVUuWd2pQ/QZOLq4Y4o4N+Ek/5zzE5jWu6z2tY4DqILNgNNvh
	1PJFbfIfMT/4LKnLx3GTaMIBTyWgtH7VgbLl9O6flKgtyMDbugrq7pebbvsrhH2zQ8xdjvKX9pt
	3u6QymRFWK6F4XKJKs4y1RvXMW8pRDWH+/MeOQ4C+nrbTGhFcPPgIg0BBT1VW3lL0JDTxQAuR1a
	V8YvZ9jEarRwFKvCGBa8Fe80yqDdnefPoc92ciQ4mivCWh0wYIlBRbUAwjEyRoj8JEp/l2V2jw=
	=
X-Google-Smtp-Source: AGHT+IG8oeOIoiATGf2n/eErF/v1UJz5jBt3u89DGuQOGIaGoIkUZOrdT8f7P/SGIIjTK+RAQA8QjA==
X-Received: by 2002:a05:600c:83c4:b0:43c:fffc:7886 with SMTP id 5b1f17b1804b1-43d509ec52fmr59753085e9.8.1742646611632;
        Sat, 22 Mar 2025 05:30:11 -0700 (PDT)
Received: from localhost (cst2-173-28.cust.vodafone.cz. [31.30.173.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d440eda26sm106789645e9.36.2025.03.22.05.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Mar 2025 05:30:11 -0700 (PDT)
Date: Sat, 22 Mar 2025 13:30:10 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH v4 17/18] RISC-V: KVM: add support for FWFT SBI extension
Message-ID: <20250322-c4eaee71aa9c1f0b13ca8fef@orel>
References: <20250317170625.1142870-1-cleger@rivosinc.com>
 <20250317170625.1142870-18-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250317170625.1142870-18-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250322_053013_511430_1C401945 
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Mar 17, 2025 at 06:06:23PM +0100, Cl=E9ment L=E9ger wrote:
> Add basic infrastructure to support the FWFT extension in KVM.
> =

> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/include/asm/kvm_host.h          |   4 +
>  arch/riscv/include/asm/kvm_vcpu_sbi.h      |   1 +
>  arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h |  29 +++
>  arch/riscv/include/uapi/asm/kvm.h          |   1 +
>  arch/riscv/kvm/Makefile                    |   1 +
>  arch/riscv/kvm/vcpu_sbi.c                  |   4 +
>  arch/riscv/kvm/vcpu_sbi_fwft.c             | 216 +++++++++++++++++++++
>  7 files changed, 256 insertions(+)
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
> index 000000000000..9ba841355758
> --- /dev/null
> +++ b/arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h
> @@ -0,0 +1,29 @@
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
> +struct kvm_sbi_fwft_feature;
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
> index 50be079b5528..0748810c0252 100644
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
> index 000000000000..8a7cfe1fe7a7
> --- /dev/null
> +++ b/arch/riscv/kvm/vcpu_sbi_fwft.c
> @@ -0,0 +1,216 @@
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
> +	 * Return SBI_SUCCESS on success or an SBI error (SBI_ERR_*)
> +	 *
> +	 * This callback is mandatory
> +	 */
> +	long (*set)(struct kvm_vcpu *vcpu, struct kvm_sbi_fwft_config *conf, un=
signed long value);
> +
> +	/**
> +	 * @get: Get the feature current value
> +	 *
> +	 * Return SBI_SUCCESS on success or an SBI error (SBI_ERR_*)
> +	 *
> +	 * This callback is mandatory
> +	 */
> +	 long (*get)(struct kvm_vcpu *vcpu, struct kvm_sbi_fwft_config *conf, u=
nsigned long *value);
        ^ =

	extra space here


Thanks,
drew

-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
