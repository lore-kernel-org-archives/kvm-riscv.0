Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CFF8C369AB
	for <kvm-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 12:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PB/H6md5OHCUScm7ewmUbkMuO3XqX/zdz4Ks/GA5pVw=; b=jFt13wlLV4w0C0
	rmQ5GZ+U/Z0gdGcnlPQFW5z5/iMoCg5JjOZu1wHQ7Wv0nUnt7kxZYRFpV1/eEImJ9QmNqT/PimzNB
	mfKeT7C/4+AQ8NPj3BxAvpGvg/IFDbdwGMnCdChh4kQhqLsvfPBTJNsj65xMHWYmWefR3hBy74Q3z
	Zf9LzDkleiI3fQ+6RHmTrZ8afc/Kc6TGwm3+2MJbQKVZoRR8/tIurlHvru+jO1x49UP7C1c2nlQpX
	cBAAMEf5a36m5fQDrzapgte0geY61nXIiEg3mXT7WVDG0dQeRo3yuvppDr5mEg6RtGOTGNC9cSbST
	dMQgFblV6CIC51122kmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7w66-0000000E6UX-3BV3;
	Thu, 24 Apr 2025 12:54:34 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7uPZ-0000000DnRT-3Igg
	for kvm-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 11:06:35 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43cf257158fso5111445e9.2
        for <kvm-riscv@lists.infradead.org>; Thu, 24 Apr 2025 04:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745492792; x=1746097592; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xaFlU49KHj/WqsyzkJFZpLzZkQa35ucQoiXjJp4Ub20=;
        b=fQG2yGzIsrUibzkE05eEuN7UcqmD6iJFOvsPe4YdltpTxQRrsnZMF+syPWXHqb3R//
         zCmWrpC6JO9N3FKJ2OkcbCDC3ve5rBLleZ5Hkga7lVhHyYOBeNnKFSdsm3heYt2BfGFX
         QYCQTm8QjeLlkSgtkdOrJZ1C8JZ04v+ypiHEyQcjkgen7D6LarlUz5si3hsc+SscZ9q/
         3XinazjHHxwkOp6VXCu0B8dW2jZAPIKCgaNx0Ooi9SDwaHv3jMuE51rHMMpS9ZACIVNA
         yNIYHoLy0euQpm3D1b4aYJfOGSRGys4U39wrVClolSSGWCSD6FWeEPkg8EE4cBPOOiUV
         pr3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745492792; x=1746097592;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xaFlU49KHj/WqsyzkJFZpLzZkQa35ucQoiXjJp4Ub20=;
        b=xOoj9GHufU0Q1oVBFCUoDzwRPmkRQX4MJ55FGs27vVBBYDuvk17B6e/Er62nYgknmm
         x5FLV57cypPXacAoZxM85iF1KnfN5lBDwm6dy+dDWAZhr/3JDWaM/TKP6fhbLbJZClp/
         DcXD7CT4ycf8OVt9nafl2PHFF/p3eNMFbyC2TT7WnthmSqEq9d28Yvcmt7MNt1RI2pFZ
         Gdr1RZLAF9f20ClRHmgG086DdHcTrb10CJAQ0Xu0tc6byL8LOuFraJ49InuMtic03vRd
         s9pc5qGF2D5zzRmAbfZ/33uwJcuxe5s4D6wrMrXWy+T0Q0+s5j0ddn0xM4J2XQNe/105
         KpmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIPAFpy+sDLDkP0cNH0TPj35WKGoN+yhZ1vf3WbkUp89smn5ZR971C/5pWK4CjXnS2Ocy8Epz2xKc=@lists.infradead.org
X-Gm-Message-State: AOJu0YwEk8S+b2gLo2bMnjgFK0FpKCuTD+dnGjDwlhNfjO5ofTOeEh2W
	l1lMF/wctZrvcUHqCt6exQSu4m4vxihSmAhUN0sKze7hbq5BQv4UE+2hDU993Gc=
X-Gm-Gg: ASbGncvcm1/SoTaB13P9Qsn63nZe7hijLQqIYpfKdeD5QLzC7aoyF3f7azP2d+DQRXo
	a84njjnnNqNBu6F/Q6eWmgmaPMlyQJjzLmOdVwA3swb44/tSXFuvbq3Z2Kn5YBYNSnYfo/sjVFb
	eS1gziNtsRxa67YWpoJ1vVP8z9stzk/9DfywZMyf2xYhyotcm5evd+YZcRQoa1DnZM1Dqt4JF/q
	MfQQ24K5/WAVo9R+VZDNARVTxjZCDdDM2TqcAParkF0LuTZftgFiYBmAXLsZHnG/Xa15AZt4S2E
	6ZAwAda2UJ3lsHbtm8mQsUiAMM2Z
X-Google-Smtp-Source: AGHT+IGdWaGhxvTRb6GutdDIuLG/aiIZCV4CCAGWlaD0KDkW+nhzZtqNPgORxU7ENnJYG2P45T9aiQ==
X-Received: by 2002:a05:600c:1c93:b0:43c:fded:9654 with SMTP id 5b1f17b1804b1-4409bd32458mr16398415e9.19.1745492791956;
        Thu, 24 Apr 2025 04:06:31 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::f716])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2a13bdsm16546245e9.9.2025.04.24.04.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 04:06:31 -0700 (PDT)
Date: Thu, 24 Apr 2025 13:06:30 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH v5 04/13] riscv: sbi: add SBI FWFT extension calls
Message-ID: <20250424-c0700f89bcd29438d6d8d65c@orel>
References: <20250417122337.547969-1-cleger@rivosinc.com>
 <20250417122337.547969-5-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250417122337.547969-5-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_040633_827573_8D6C888B 
X-CRM114-Status: GOOD (  22.41  )
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

On Thu, Apr 17, 2025 at 02:19:51PM +0200, Cl=E9ment L=E9ger wrote:
> Add FWFT extension calls. This will be ratified in SBI V3.0 hence, it is
> provided as a separate commit that can be left out if needed.
> =

> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> ---
>  arch/riscv/kernel/sbi.c | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
> =

> diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
> index 379981c2bb21..7b062189b184 100644
> --- a/arch/riscv/kernel/sbi.c
> +++ b/arch/riscv/kernel/sbi.c
> @@ -299,6 +299,8 @@ static int __sbi_rfence_v02(int fid, const struct cpu=
mask *cpu_mask,
>  	return 0;
>  }
>  =

> +static bool sbi_fwft_supported;

At some point we may want an SBI extension bitmap, but this is only the
second SBI extension supported boolean that I'm aware of, so I guess we're
still OK for now.

> +
>  /**
>   * sbi_fwft_set() - Set a feature on the local hart
>   * @feature: The feature ID to be set
> @@ -309,7 +311,15 @@ static int __sbi_rfence_v02(int fid, const struct cp=
umask *cpu_mask,
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
> @@ -348,6 +358,9 @@ int sbi_fwft_local_set_cpumask(const cpumask_t *mask,=
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

> @@ -679,6 +692,11 @@ void __init sbi_init(void)
>  			pr_info("SBI DBCN extension detected\n");
>  			sbi_debug_console_available =3D true;
>  		}
> +		if ((sbi_spec_version >=3D sbi_mk_version(3, 0)) &&
> +		    (sbi_probe_extension(SBI_EXT_FWFT) > 0)) {

Unnecessary (), but I see it's consistent with the expressions above.

> +			pr_info("SBI FWFT extension detected\n");
> +			sbi_fwft_supported =3D true;
> +		}
>  	} else {
>  		__sbi_set_timer =3D __sbi_set_timer_v01;
>  		__sbi_send_ipi	=3D __sbi_send_ipi_v01;
> -- =

> 2.49.0
>

Besides the () nit

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
