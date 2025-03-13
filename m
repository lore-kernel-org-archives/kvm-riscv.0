Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03DCBC282DE
	for <kvm-riscv@archiver.kernel.org>; Thu, 13 Mar 2025 15:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W6uBo3MOU6fkpq8CrcbXC+lPRfYAdP9l5ReYRoGxWUM=; b=Pu0Hj/N4snb4Uq
	8UVjD6VVf6nrGqA8TuU5I66+h1VZIV45NxFy23f/5mWlFvTQlhBsXNmCCpfY/7OfVl/b5y4Jg/CtA
	wd12wc8v4nKR/JrSdLy2gZsNlfeuzftro2gYqzXDInRPlurMlfzyHiQ5zxETrLByK9MeH0DJ/yKNm
	qSZi07TUQ47fhSFAvcMduxmHhY64Qji9ireIIE2GGuGvKEIQXDIg3aZNfFXksOkWXfcghDTPMW+dv
	dJtnS9msfdx8VLoaK/VuRMRjXeMR4WrgbEr7At+/6M2W8eRAp0cdn6Uz88FqrqIwDi6oJNXqtVSxp
	fwKdzpMwouCJFLy9IJAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tskbF-0000000Bfo7-1sNa;
	Thu, 13 Mar 2025 15:35:57 +0000
Received: from mail-wr1-f47.google.com ([209.85.221.47])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsjWr-0000000BWuc-0d42
	for kvm-riscv@lists.infradead.org;
	Thu, 13 Mar 2025 14:27:22 +0000
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3912c09be7dso680344f8f.1
        for <kvm-riscv@lists.infradead.org>; Thu, 13 Mar 2025 07:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1741876039; x=1742480839; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XLr2/Str8PUdULF1c2O3jE557wb7uOe7x8v7FUGx02s=;
        b=mjkgFKPqSQJzU0TLULmP9zvtY1jLw9HWjmJqtJbqQgrdnR006uBSNqqotVxYXPNr1i
         uplGLle2AgDZUgSLBFSIXVGgtlKJNsMDrU0HPLoIYH4ka4fguGZBuKfbIdyjOaPB3c+G
         KbdyvmjKd4eFRsjA8lLqXmxh74Qlgy/shQdo88u7hTRS3eAR1YdxIyWQ/h7t/DgwrmEf
         Bxob/xyoM2+BBWbEncgaTiGi1jKPczpy9xnO2GxANckMVFrIqwno05fevQMx/9goIHEN
         uyQ4T1X0X+MJ/nuvScbbsRKW1tyH8SmE5gn4PXSnk5yLqYypTQLTvq57rB1UjWhs/WIq
         oWRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741876039; x=1742480839;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XLr2/Str8PUdULF1c2O3jE557wb7uOe7x8v7FUGx02s=;
        b=oP+uno9NJGoscnTuyiSWFBQWpOYfbVIpEvhwf6Ok5HQUVLy+oos1Pniyovp2BSSVle
         qIMAXGe8znx32lc8xFmnvf5LbPn8tq1M4/gWAkrxulcY63wuB5256qrqPk17EKp2BwMH
         k8+i1RjqBTE5OWi7asydRzNFs3HrcjYVD+oPgGgvgs8diNiA2ed2c9TNmsh2sw0wsOVz
         JDkr/uuBTPLDjvEwbQO8wpx9X/uCWRoxQweJFUcfHOIJTl9eAVQdGLk1jUSQPvStikdJ
         bLzuXDSMeOD35DRyi3qKhuiSVT+fKFYYC+dKTU/hPv91877V4SJSWfiDp5D/UroGNQSQ
         WcbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYpmzgiAMeRxZmVtoat3BZ4ATA8QyXhkAPoGOrno3edk/P1GNIsHn+6yazJq3MXvmCD6ZiWJpb608=@lists.infradead.org
X-Gm-Message-State: AOJu0YwngsgYI2qyA42tx5C9/vy6TzzCuu2YWlUThGkw3O9PJedEbAbX
	a1eolP+1k1O8rFdOdusFG1opm76/caBRh2nss2asfaZgLlNPUNA6afe59afn0lQ=
X-Gm-Gg: ASbGncvDapu+jX+BXZMEqyXgxa1neFUe+4tiGZEJcVxROEYPbFIkdlAJv4Ad8RDIt6l
	12OWduBJVP+B080Wfi4YuVCg5L5C/JzMAovp6cbmlpngK5logssn2G4AOV5WokXtRxh1uUNN4/r
	Bv7fNrtJlY3oJz1F1AGMjt3tUkOWOaMJX21U8ff1Zpyo6qPIDS5hCequlymFFg9iCGQX0VuVBSg
	DgXpzchhuYA+jXDQvfiORO4mWiq4Ox8ccmpU2BkeUszCBN6e5rckSTGW/dP2qpsKDX8yLVKPwel
	8FfH8tibgUbfloueKzxkRwIIFX5K+ztL0MbIVHvCvQo=
X-Google-Smtp-Source: AGHT+IGx3Sab5SDKogjK4G9G6vPewBpr2VjhUbGJwcX+nwTAiQQruD0qs0HuNiII4DaXFL2TeXeVoQ==
X-Received: by 2002:a5d:64cb:0:b0:391:40b8:e890 with SMTP id ffacd0b85a97d-39140b8e9f4mr17833900f8f.22.1741876038933;
        Thu, 13 Mar 2025 07:27:18 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::59a5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c8975b34sm2303314f8f.55.2025.03.13.07.27.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 07:27:18 -0700 (PDT)
Date: Thu, 13 Mar 2025 15:27:17 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH v3 14/17] RISC-V: KVM: add SBI extension init()/deinit()
 functions
Message-ID: <20250313-f08cee46c912f729d1829d37@orel>
References: <20250310151229.2365992-1-cleger@rivosinc.com>
 <20250310151229.2365992-15-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250310151229.2365992-15-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_072721_190836_122E618F 
X-CRM114-Status: GOOD (  24.15  )
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

On Mon, Mar 10, 2025 at 04:12:21PM +0100, Cl=E9ment L=E9ger wrote:
> The FWFT SBI extension will need to dynamically allocate memory and do
> init time specific initialization. Add an init/deinit callbacks that
> allows to do so.
> =

> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> ---
>  arch/riscv/include/asm/kvm_vcpu_sbi.h |  9 +++++++++
>  arch/riscv/kvm/vcpu.c                 |  2 ++
>  arch/riscv/kvm/vcpu_sbi.c             | 29 +++++++++++++++++++++++++++
>  3 files changed, 40 insertions(+)
> =

> diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/a=
sm/kvm_vcpu_sbi.h
> index 4ed6203cdd30..bcb90757b149 100644
> --- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
> +++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> @@ -49,6 +49,14 @@ struct kvm_vcpu_sbi_extension {
>  =

>  	/* Extension specific probe function */
>  	unsigned long (*probe)(struct kvm_vcpu *vcpu);
> +
> +	/*
> +	 * Init/deinit function called once during VCPU init/destroy. These
> +	 * might be use if the SBI extensions need to allocate or do specific
> +	 * init time only configuration.
> +	 */
> +	int (*init)(struct kvm_vcpu *vcpu);
> +	void (*deinit)(struct kvm_vcpu *vcpu);
>  };
>  =

>  void kvm_riscv_vcpu_sbi_forward(struct kvm_vcpu *vcpu, struct kvm_run *r=
un);
> @@ -69,6 +77,7 @@ const struct kvm_vcpu_sbi_extension *kvm_vcpu_sbi_find_=
ext(
>  bool riscv_vcpu_supports_sbi_ext(struct kvm_vcpu *vcpu, int idx);
>  int kvm_riscv_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *run);
>  void kvm_riscv_vcpu_sbi_init(struct kvm_vcpu *vcpu);
> +void kvm_riscv_vcpu_sbi_deinit(struct kvm_vcpu *vcpu);
>  =

>  int kvm_riscv_vcpu_get_reg_sbi_sta(struct kvm_vcpu *vcpu, unsigned long =
reg_num,
>  				   unsigned long *reg_val);
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index 60d684c76c58..877bcc85c067 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -185,6 +185,8 @@ void kvm_arch_vcpu_postcreate(struct kvm_vcpu *vcpu)
>  =

>  void kvm_arch_vcpu_destroy(struct kvm_vcpu *vcpu)
>  {
> +	kvm_riscv_vcpu_sbi_deinit(vcpu);
> +
>  	/* Cleanup VCPU AIA context */
>  	kvm_riscv_vcpu_aia_deinit(vcpu);
>  =

> diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
> index d1c83a77735e..858ddefd7e7f 100644
> --- a/arch/riscv/kvm/vcpu_sbi.c
> +++ b/arch/riscv/kvm/vcpu_sbi.c
> @@ -505,8 +505,37 @@ void kvm_riscv_vcpu_sbi_init(struct kvm_vcpu *vcpu)
>  			continue;
>  		}
>  =

> +		if (!ext->default_disabled && ext->init &&
> +		    ext->init(vcpu) !=3D 0) {
> +			scontext->ext_status[idx] =3D KVM_RISCV_SBI_EXT_STATUS_UNAVAILABLE;
> +			continue;
> +		}

I think this new block should be below the assignment below (and it can
drop the continue) and it shouldn't check default_disabled (as I've done
below). IOW, we should always run ext->init when there is one to run here.
Otherwise, I how will it get run later?

> +
>  		scontext->ext_status[idx] =3D ext->default_disabled ?
>  					KVM_RISCV_SBI_EXT_STATUS_DISABLED :
>  					KVM_RISCV_SBI_EXT_STATUS_ENABLED;

                if (ext->init && ext->init(vcpu))
                    scontext->ext_status[idx] =3D KVM_RISCV_SBI_EXT_STATUS_=
UNAVAILABLE;

>  	}
>  }
> +
> +void kvm_riscv_vcpu_sbi_deinit(struct kvm_vcpu *vcpu)
> +{
> +	struct kvm_vcpu_sbi_context *scontext =3D &vcpu->arch.sbi_context;
> +	const struct kvm_riscv_sbi_extension_entry *entry;
> +	const struct kvm_vcpu_sbi_extension *ext;
> +	int idx, i;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(sbi_ext); i++) {
> +		entry =3D &sbi_ext[i];
> +		ext =3D entry->ext_ptr;
> +		idx =3D entry->ext_idx;
> +
> +		if (idx < 0 || idx >=3D ARRAY_SIZE(scontext->ext_status))
> +			continue;
> +
> +		if (scontext->ext_status[idx] =3D=3D KVM_RISCV_SBI_EXT_STATUS_UNAVAILA=
BLE ||
> +		    !ext->deinit)
> +			continue;
> +
> +		ext->deinit(vcpu);
> +	}
> +}
> -- =

> 2.47.2
>

Thanks,
drew

-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
