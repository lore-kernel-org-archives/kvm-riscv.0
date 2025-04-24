Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84C7BC369AB
	for <kvm-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 16:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3XQtuyyliNXqX6lQz1fHBJto8c5T5FdafFNJKna8ejE=; b=jhGi0lh4hyFY0F
	8Mfhz5vUr8d+zFuM1ZuxW7ZDvEEaPbI6KpPK21nRe05CGjTDq3QfoyBVJKtrrgqrSGAOufUI5pH97
	aUnyJr1a3ekAZp5dOYPJRzyDi98QF5DDMbSawJHW2kxj0CNpuSG3QWr6WnTSN3vCN7Lj/5qbZuaAb
	vq67JEFAb7wY2+FdhTzzw7T9Rhz6b5EpRD2+/MkYZDoJEC+itJBKhafpdxMjEJQkvbc0cch5W7JBJ
	Od0b8f4xA5jnfL71itCSF43f1ajr1cFTCqlm5KZDE6hulOMddcJ369lVGszFEpoYJteef6tcCbuZA
	EWKRS91RjK1IrmpaNYug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7z35-0000000EZlE-0X0w;
	Thu, 24 Apr 2025 16:03:39 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7uqV-0000000DsDv-2GbS
	for kvm-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 11:34:24 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-39c0dfba946so633244f8f.3
        for <kvm-riscv@lists.infradead.org>; Thu, 24 Apr 2025 04:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745494462; x=1746099262; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8kNEaxbnoW9g1fYmJXQwSNKTdFbvmREbcFtvdLnT5Xc=;
        b=kGhMW8bMceVwn9qNFIHJx+ZF/haiNVUFMArZSaUms1tlosRW85PPePQ6nADZzAUaet
         +GNbmB7JQicrGnNd1TxdHQn7yk/XVr4Lu6lhNq/XxA0GCZXS4JbmOBYLAxHQSk+H/x7y
         R095JJJvs1N4m/f9C7ECEcxFRO1D1D+/fy7WgmnNlSlgDxAZnHvi+21cYeOjS3GTEIG/
         qfgWhfiQrDjAyxw2Lfff8uzgUqQ+SLQo9CzVuS4TGHMsZDNLVY0RqFAkfri2GCf7guEZ
         rWBNqbctqSB/Wrh3HAksDrqE5UwJ6Emj+8QtnsTMhD+R1zk7HRFHq00jKY3R3n3w0ge1
         xrlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745494462; x=1746099262;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8kNEaxbnoW9g1fYmJXQwSNKTdFbvmREbcFtvdLnT5Xc=;
        b=IKk+zidSUPo0OXTCDjdNJ4RONkODPTpBpzBEBJzplLrdP7KnOOpTiFtSK5CQPWVHEU
         eNtmgQDWGfh9dub+tvqkkH+f2tk0BIuiDynHqN6qePmvS2Ob56Tyq5Ir4WejRBvN5BgH
         sC+SB5u0NukL+xDUvyYtOPnPjzXvBriUBiFCU1xoh+1dxMT0Maez8eTMkbKUL5aLE20K
         wXMUzs1kFcqmw9WEMm1whLi7xysnRoeXcp60gg5RM0caS2VZyfeLnZnZa6yKM6Ic7Phq
         SDuM5keZf6tEBu+QnhTKtv5+YnzsroqGOiy4S8utGS9wRvN40I9c2x+r3cM6fFgLob7f
         lF8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUtoopw1W7MH6EB39znj0M3ByQIMc2Zqv7YJTchtPjItxV8G9w+flMK/USbzz01twC8/E7lSEmAxyE=@lists.infradead.org
X-Gm-Message-State: AOJu0YxTWmIEhFFbnXMFhOVIQTfrc2/hvNgZwBcmg1o6KjikLpYQR/tg
	cGu/jFVqCJMjILBjMef2UkU1XZ2AkcjJRw/3ENekvJDFKMNZ11dUxB72a7jc+ck=
X-Gm-Gg: ASbGnctHD460vfE8xrPF/MsGGmT+Fb1UacpXp8G9eYSibA4atgQdBVcBggMw7jY/XiS
	2YZwiK4KoETD4lJDeP6qVBoL4bkQAwQNcmKtXc2+O7pxFYm/UkHLkiCl76Ueef/duP4CFgDTbzi
	13WP3ugIjZra4wjXqZ6dGUGba7INWypw9+mHmK27PTSJHQDu2UEL8fnoj+t5uWU4U4HqSvR4kSx
	HuP3QamsMM6VKKg6FcAZ2BCn9mNXTQl9vwaUwDhWzNWZl6Z0FCw72qLCt/8V2Mg9agxymkxWmSP
	FTpRxwwzEMHjfwENCFqEO80GWovf
X-Google-Smtp-Source: AGHT+IH+Hg3/PqfVx4rNvlrTeNa+fBCY/aumfjJWzS9tER7WilSZAHlxfjRytvmLaoteiiEk+m6uJg==
X-Received: by 2002:a5d:4a8e:0:b0:39a:c9d9:877b with SMTP id ffacd0b85a97d-3a06cf5f4fcmr1401332f8f.27.1745494461931;
        Thu, 24 Apr 2025 04:34:21 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::f716])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4bf781sm1830579f8f.37.2025.04.24.04.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 04:34:21 -0700 (PDT)
Date: Thu, 24 Apr 2025 13:34:20 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	Samuel Holland <samuel.holland@sifive.com>, Deepak Gupta <debug@rivosinc.com>
Subject: Re: [PATCH v5 13/13] RISC-V: KVM: add support for
 SBI_FWFT_MISALIGNED_DELEG
Message-ID: <20250424-ae24464169f7143c509cbab5@orel>
References: <20250417122337.547969-1-cleger@rivosinc.com>
 <20250417122337.547969-14-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250417122337.547969-14-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_043423_577331_362BEFA1 
X-CRM114-Status: GOOD (  19.57  )
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

On Thu, Apr 17, 2025 at 02:20:00PM +0200, Cl=E9ment L=E9ger wrote:
> SBI_FWFT_MISALIGNED_DELEG needs hedeleg to be modified to delegate
> misaligned load/store exceptions. Save and restore it during CPU
> load/put.
> =

> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> Reviewed-by: Deepak Gupta <debug@rivosinc.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/kvm/vcpu.c          |  3 +++
>  arch/riscv/kvm/vcpu_sbi_fwft.c | 36 ++++++++++++++++++++++++++++++++++
>  2 files changed, 39 insertions(+)
> =

> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index 542747e2c7f5..d98e379945c3 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -646,6 +646,7 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
>  {
>  	void *nsh;
>  	struct kvm_vcpu_csr *csr =3D &vcpu->arch.guest_csr;
> +	struct kvm_vcpu_config *cfg =3D &vcpu->arch.cfg;
>  =

>  	vcpu->cpu =3D -1;
>  =

> @@ -671,6 +672,7 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
>  		csr->vstval =3D nacl_csr_read(nsh, CSR_VSTVAL);
>  		csr->hvip =3D nacl_csr_read(nsh, CSR_HVIP);
>  		csr->vsatp =3D nacl_csr_read(nsh, CSR_VSATP);
> +		cfg->hedeleg =3D nacl_csr_read(nsh, CSR_HEDELEG);
>  	} else {
>  		csr->vsstatus =3D csr_read(CSR_VSSTATUS);
>  		csr->vsie =3D csr_read(CSR_VSIE);
> @@ -681,6 +683,7 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
>  		csr->vstval =3D csr_read(CSR_VSTVAL);
>  		csr->hvip =3D csr_read(CSR_HVIP);
>  		csr->vsatp =3D csr_read(CSR_VSATP);
> +		cfg->hedeleg =3D csr_read(CSR_HEDELEG);
>  	}
>  }
>  =

> diff --git a/arch/riscv/kvm/vcpu_sbi_fwft.c b/arch/riscv/kvm/vcpu_sbi_fwf=
t.c
> index b0f66c7bf010..237edaefa267 100644
> --- a/arch/riscv/kvm/vcpu_sbi_fwft.c
> +++ b/arch/riscv/kvm/vcpu_sbi_fwft.c
> @@ -14,6 +14,8 @@
>  #include <asm/kvm_vcpu_sbi.h>
>  #include <asm/kvm_vcpu_sbi_fwft.h>
>  =

> +#define MIS_DELEG (BIT_ULL(EXC_LOAD_MISALIGNED) | BIT_ULL(EXC_STORE_MISA=
LIGNED))
> +
>  struct kvm_sbi_fwft_feature {
>  	/**
>  	 * @id: Feature ID
> @@ -68,7 +70,41 @@ static bool kvm_fwft_is_defined_feature(enum sbi_fwft_=
feature_t feature)
>  	return false;
>  }
>  =

> +static bool kvm_sbi_fwft_misaligned_delegation_supported(struct kvm_vcpu=
 *vcpu)
> +{
> +	return misaligned_traps_can_delegate();
> +}
> +
> +static long kvm_sbi_fwft_set_misaligned_delegation(struct kvm_vcpu *vcpu,
> +					struct kvm_sbi_fwft_config *conf,
> +					unsigned long value)
> +{
> +	if (value =3D=3D 1)
> +		csr_set(CSR_HEDELEG, MIS_DELEG);
> +	else if (value =3D=3D 0)
> +		csr_clear(CSR_HEDELEG, MIS_DELEG);
> +	else
> +		return SBI_ERR_INVALID_PARAM;
> +
> +	return SBI_SUCCESS;
> +}
> +
> +static long kvm_sbi_fwft_get_misaligned_delegation(struct kvm_vcpu *vcpu,
> +					struct kvm_sbi_fwft_config *conf,
> +					unsigned long *value)
> +{
> +	*value =3D (csr_read(CSR_HEDELEG) & MIS_DELEG) !=3D 0;

This should be

  (csr_read(CSR_HEDELEG) & MIS_DELEG) =3D=3D MIS_DELEG;

> +
> +	return SBI_SUCCESS;
> +}
> +
>  static const struct kvm_sbi_fwft_feature features[] =3D {
> +	{
> +		.id =3D SBI_FWFT_MISALIGNED_EXC_DELEG,
> +		.supported =3D kvm_sbi_fwft_misaligned_delegation_supported,
> +		.set =3D kvm_sbi_fwft_set_misaligned_delegation,
> +		.get =3D kvm_sbi_fwft_get_misaligned_delegation,
> +	},
>  };
>  =

>  static struct kvm_sbi_fwft_config *
> -- =

> 2.49.0
>

Thanks,
drew

-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
