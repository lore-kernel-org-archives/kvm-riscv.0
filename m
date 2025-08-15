Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB33FCA0EE4
	for <kvm-riscv@archiver.kernel.org>; Fri, 15 Aug 2025 21:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h0GwV4+9NV/6QwKWYGOD9WxHILeSfN2Y4qJ4AUcI1Zk=; b=hIdfTIGuU3GJaV
	9xjAIYFZbG+OqLLFkA8SyuD7BGjNEjwfb614f1by1Vxp2WU9kyoq82PwbqJhAQUbmsjfv//c/7aJf
	l0bAV8d1re6BhIROtOpY7OnsXrYyP3N7xSVtKwA/S9sk4gczv2+c40q4wBc0AsVUk03a54oAFrZeS
	11TLHO3qpocseJN1trPgi/IMSQV4HhIp5HtIiWznS2GKez6RnKn/s/FPGfS70e2Dq34biuwijzQaE
	fnSz/BrCb9MImuXdtLeCtGCRbaIgx4zCYZ2ccAaVeieLqISsNYrBS+ShYfGYCtahQPYfIAt61wUAE
	YanoWLh1/9IC1iPi9nOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1un1ap-00000003W1K-2NWd;
	Fri, 15 Aug 2025 21:04:07 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1un1am-00000003W0f-1WHK
	for kvm-riscv@lists.infradead.org;
	Fri, 15 Aug 2025 21:04:05 +0000
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-3e5700448fbso17728005ab.2
        for <kvm-riscv@lists.infradead.org>; Fri, 15 Aug 2025 14:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755291843; x=1755896643; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ft04JZ672lT2q0D5QFWz6789EtIMwIQ1qPNZYM3WBFM=;
        b=K7e72X4wqcySqYEIFdBzOkNEZAEHqbw50Oc/I4NF2vaB7QIntjj9wZOI7LqE8AMY7Q
         9g1ZR3ojLGJq3B6qssHQn4YbeXhHUvABXgGD7s3HoEPcBcLs6NS5Q+Y+0V/8HBfME3ep
         KpMubpxliuwjpkzkwKEC9hjhOO63rbQT1AcY5Hs2BgltAZYjMupPJEA+iTATDL85Pczp
         ptlbEe4+m26KZ2gJX86IzW5+tFZJAkMwf5WeTleQouyvXpiIPSKcWGNAR9QQvLDKCfAx
         2eLL/47jU5GOHffQHuPGo3kmVUtswlbOm4Y0qXd5BonOmwX4Y/5QLCkLRmmAte63AHMx
         uFKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755291843; x=1755896643;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ft04JZ672lT2q0D5QFWz6789EtIMwIQ1qPNZYM3WBFM=;
        b=P92qtMzFRAgErOEZiHerAMx1KaSTAV79M5fgr9ppUykAJ+e/bq3JG9b2kN9mvMdr8Q
         21GWS2/p9Qpogq1w7b8qnTXktCK/I9ujXgm+lVW3bXs2w8j9UENWlZEnJexp1FFwnBNJ
         +hvU93wOxluydvs3Z+vOTGlgq/+OkEoISl+HtVHgyk8USkCu0yV6mDiQ1tBF2RhDDSUc
         Q2OCbNZ3+Znq8gRIRt440gzr5/jzG+yQmaK167nJ+YlO1rfCiV3Dt8s6JnBFRhtuwxV8
         i3nIr197hnWyTup5fPGjHfOT6hmqso6V7cHhPJO4Du51AO9fnwiDoGrczLzMY33YQn+2
         CvWw==
X-Forwarded-Encrypted: i=1; AJvYcCVnogUkDPsX1jcd3hc7srcwJyyfFwJWZO++jRpgnyqW4W22ruPhp/zSSqV9gcahVvCtRyGqk3ud+L0=@lists.infradead.org
X-Gm-Message-State: AOJu0YwqUGQXdq/Tv2uaCSqDE0s19gWnVUyNYKhXm7HzdND8xQZ+oXiC
	CMl8nYvfPpuO00+8HOseWTbnoofyse6FYOv20+G4bui/3O3BB3pzIhpBe1SIH5Ku+vI=
X-Gm-Gg: ASbGnctel4CjiAI0oX+Ucs7BdAxXF/SaKBP0rBNUFHksrAUHNC3ZBaW11/4m+Bu+MRy
	Q81xqChYxdocpnulpLzNcxCzGwW4nwHx8mfWT+EeW3/CR9QXauG6/wSQbXeEGQb1ulK4t3xVq6y
	nNaroQcD1f46of6+BZ0oQ1GvdlNjXyZMHUErh2ufGBVT9+CZ3EuvsNdbibSO5OAjtss1cKM+tlr
	sjS2vdLsWogE/cnFtpSwhTCWasr7/w4Sk4WfZedVNqZ4s/c59H2nRXO6R3+qDlEtjkV1suMg0VR
	KqTzsuqPx6BWE0jumoTMfuWkHrE6cuJFDrNksBx3oHStnUeBxC07GQefx++S8BhjCuuwtt+gd1e
	Wp6K/AayhYRGGuB5X4PNJ+iBA
X-Google-Smtp-Source: AGHT+IEZ228tEu96gQYjWXKJgevodnNBi1s4R3eESGEOgX3ctS1gUzzAVoE7y2cbjS0nf97wxrlKjw==
X-Received: by 2002:a05:6e02:2583:b0:3e5:66a8:3ebf with SMTP id e9e14a558f8ab-3e57e825485mr67051065ab.5.1755291843294;
        Fri, 15 Aug 2025 14:04:03 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50c949a0167sm643861173.53.2025.08.15.14.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 14:04:02 -0700 (PDT)
Date: Fri, 15 Aug 2025 16:04:02 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Atish Patra <atish.patra@linux.dev>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 4/6] RISC-V: KVM: Move copy_sbi_ext_reg_indices() to SBI
 implementation
Message-ID: <20250815-ba0f0a816fc5281383a2b988@orel>
References: <20250814155548.457172-1-apatel@ventanamicro.com>
 <20250814155548.457172-5-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250814155548.457172-5-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_140404_399093_A8F631C9 
X-CRM114-Status: GOOD (  21.21  )
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

On Thu, Aug 14, 2025 at 09:25:46PM +0530, Anup Patel wrote:
> The ONE_REG handling of SBI extension enable/disable registers and
> SBI extension state registers is already under SBI implementation.
> On similar lines, let's move copy_sbi_ext_reg_indices() under SBI
> implementation.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/asm/kvm_vcpu_sbi.h |  2 +-
>  arch/riscv/kvm/vcpu_onereg.c          | 29 ++-------------------------
>  arch/riscv/kvm/vcpu_sbi.c             | 27 ++++++++++++++++++++++++-
>  3 files changed, 29 insertions(+), 29 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> index 144c3f6d5eb9..212c31629bc8 100644
> --- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
> +++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> @@ -78,6 +78,7 @@ void kvm_riscv_vcpu_sbi_request_reset(struct kvm_vcpu *vcpu,
>  				      unsigned long pc, unsigned long a1);
>  void kvm_riscv_vcpu_sbi_load_reset_state(struct kvm_vcpu *vcpu);
>  int kvm_riscv_vcpu_sbi_return(struct kvm_vcpu *vcpu, struct kvm_run *run);
> +int kvm_riscv_vcpu_reg_indices_sbi_ext(struct kvm_vcpu *vcpu, u64 __user *uindices);
>  int kvm_riscv_vcpu_set_reg_sbi_ext(struct kvm_vcpu *vcpu,
>  				   const struct kvm_one_reg *reg);
>  int kvm_riscv_vcpu_get_reg_sbi_ext(struct kvm_vcpu *vcpu,
> @@ -87,7 +88,6 @@ int kvm_riscv_vcpu_set_reg_sbi(struct kvm_vcpu *vcpu, const struct kvm_one_reg *
>  int kvm_riscv_vcpu_get_reg_sbi(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg);
>  const struct kvm_vcpu_sbi_extension *kvm_vcpu_sbi_find_ext(
>  				struct kvm_vcpu *vcpu, unsigned long extid);
> -bool riscv_vcpu_supports_sbi_ext(struct kvm_vcpu *vcpu, int idx);
>  int kvm_riscv_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *run);
>  void kvm_riscv_vcpu_sbi_init(struct kvm_vcpu *vcpu);
>  void kvm_riscv_vcpu_sbi_deinit(struct kvm_vcpu *vcpu);
> diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
> index 5843b0519224..0894ab517525 100644
> --- a/arch/riscv/kvm/vcpu_onereg.c
> +++ b/arch/riscv/kvm/vcpu_onereg.c
> @@ -1060,34 +1060,9 @@ static inline unsigned long num_isa_ext_regs(const struct kvm_vcpu *vcpu)
>  	return copy_isa_ext_reg_indices(vcpu, NULL);
>  }
>  
> -static int copy_sbi_ext_reg_indices(struct kvm_vcpu *vcpu, u64 __user *uindices)
> -{
> -	unsigned int n = 0;
> -
> -	for (int i = 0; i < KVM_RISCV_SBI_EXT_MAX; i++) {
> -		u64 size = IS_ENABLED(CONFIG_32BIT) ?
> -			   KVM_REG_SIZE_U32 : KVM_REG_SIZE_U64;
> -		u64 reg = KVM_REG_RISCV | size | KVM_REG_RISCV_SBI_EXT |
> -			  KVM_REG_RISCV_SBI_SINGLE | i;
> -
> -		if (!riscv_vcpu_supports_sbi_ext(vcpu, i))
> -			continue;
> -
> -		if (uindices) {
> -			if (put_user(reg, uindices))
> -				return -EFAULT;
> -			uindices++;
> -		}
> -
> -		n++;
> -	}
> -
> -	return n;
> -}
> -
>  static unsigned long num_sbi_ext_regs(struct kvm_vcpu *vcpu)
>  {
> -	return copy_sbi_ext_reg_indices(vcpu, NULL);
> +	return kvm_riscv_vcpu_reg_indices_sbi_ext(vcpu, NULL);
>  }
>  
>  static inline unsigned long num_sbi_regs(struct kvm_vcpu *vcpu)
> @@ -1215,7 +1190,7 @@ int kvm_riscv_vcpu_copy_reg_indices(struct kvm_vcpu *vcpu,
>  		return ret;
>  	uindices += ret;
>  
> -	ret = copy_sbi_ext_reg_indices(vcpu, uindices);
> +	ret = kvm_riscv_vcpu_reg_indices_sbi_ext(vcpu, uindices);
>  	if (ret < 0)
>  		return ret;
>  	uindices += ret;
> diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
> index 8b3c393e0c83..19e0e3d7b598 100644
> --- a/arch/riscv/kvm/vcpu_sbi.c
> +++ b/arch/riscv/kvm/vcpu_sbi.c
> @@ -110,7 +110,7 @@ riscv_vcpu_get_sbi_ext(struct kvm_vcpu *vcpu, unsigned long idx)
>  	return sext;
>  }
>  
> -bool riscv_vcpu_supports_sbi_ext(struct kvm_vcpu *vcpu, int idx)
> +static bool riscv_vcpu_supports_sbi_ext(struct kvm_vcpu *vcpu, int idx)
>  {
>  	struct kvm_vcpu_sbi_context *scontext = &vcpu->arch.sbi_context;
>  	const struct kvm_riscv_sbi_extension_entry *sext;
> @@ -288,6 +288,31 @@ static int riscv_vcpu_get_sbi_ext_multi(struct kvm_vcpu *vcpu,
>  	return 0;
>  }
>  
> +int kvm_riscv_vcpu_reg_indices_sbi_ext(struct kvm_vcpu *vcpu, u64 __user *uindices)
> +{
> +	unsigned int n = 0;
> +
> +	for (int i = 0; i < KVM_RISCV_SBI_EXT_MAX; i++) {
> +		u64 size = IS_ENABLED(CONFIG_32BIT) ?
> +			   KVM_REG_SIZE_U32 : KVM_REG_SIZE_U64;
> +		u64 reg = KVM_REG_RISCV | size | KVM_REG_RISCV_SBI_EXT |
> +			  KVM_REG_RISCV_SBI_SINGLE | i;
> +
> +		if (!riscv_vcpu_supports_sbi_ext(vcpu, i))
> +			continue;
> +
> +		if (uindices) {
> +			if (put_user(reg, uindices))
> +				return -EFAULT;
> +			uindices++;
> +		}
> +
> +		n++;
> +	}
> +
> +	return n;
> +}
> +
>  int kvm_riscv_vcpu_set_reg_sbi_ext(struct kvm_vcpu *vcpu,
>  				   const struct kvm_one_reg *reg)
>  {
> -- 
> 2.43.0
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
