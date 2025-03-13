Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6037C282DE
	for <kvm-riscv@archiver.kernel.org>; Thu, 13 Mar 2025 12:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KhO7d6Fzj23DFBBiDc4yH0e1+0UFkOqggIwXABkMYD0=; b=0riNbK8cfnrJxx
	BXSUESapy3vdGKAtucqjTCPWUDyQnvNhKwt14dbUo5OMBrw6lTOc33P7ljylk+fUWN9dg/xgv+YGG
	hWZyyqD3id0EOMxPjHbgBbcAtVh4mViR0Kg2IB5abXcEzvW9wpfjY7R0/UPl0tGWUwJU6RTEuWnkk
	ZSNJ/2AR/vUhVOnMrKGV1FFY3UgS/EcMm4JzCG44MeJZo7g12zMrKHLAcWiHCRcMdzGGShsFg0S3K
	6ZAvNEEmgEfyUIG9wlgBrueQOCg64Eln8umESpJIPiSSj4sotihKHPegHjoPu3RSIzWUt36qwex6L
	1fAkt+25VVtUzIAZIK/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tshqK-0000000BGkZ-0xm0;
	Thu, 13 Mar 2025 12:39:20 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tshqH-0000000BGk7-2RKk
	for kvm-riscv@lists.infradead.org;
	Thu, 13 Mar 2025 12:39:18 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3913cf69784so774823f8f.1
        for <kvm-riscv@lists.infradead.org>; Thu, 13 Mar 2025 05:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1741869556; x=1742474356; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xSlQ1L6rFi2oeV1zF6QF9pposhG4AHSuAju9zq00g0c=;
        b=ZEPtcLvvkkCazDpeVE61XriJyd/X0S3e8RyJnTQBt98pIXn9c4o8FrAXQdIn0pbEGf
         tPhACQUxMLGaNijxzZe8M+Pyh7fx2yMS3uBNXcVQIG01f6vX/Sj1FZ4+pc0d2FsXkUOQ
         +pV8aMefFYx9ouwWxuqEl4Il6V7lyjj5cY7bmCHOPXXBDknEvPHj6L9wuyOXRvK710+T
         Ir0EX0dVmlCCZIv2C6CN/jeNvbIfSiyAu2+XhM+xqE2BzjVbJB7cgsbCN7H6b9BI9Qx1
         ZoC0iXYGPIU3+PGGJDPchQmxyGEM0sJ6E2/whgF4XQNyW26eTaVLtbAvupWGI2h1uOS6
         /Ihw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741869556; x=1742474356;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xSlQ1L6rFi2oeV1zF6QF9pposhG4AHSuAju9zq00g0c=;
        b=frKRV+LDU4PJ+rSnr4yWvZlVmrg8CiJCsh/fU0cphEvFLpE6tel8OMuN0c6JNXQ4f0
         Li7LfKWpHCGJzpj/qTkRKSNMIZG5MZNOsvcR2+S3RN0ApsBfoQU3rYXroK5T3/ruTHwv
         h7iWi2j9VleOUgAYJKD5TXMZB8IEvz7A27w8KhbyVWt00A+Jz+EwFxwt+sNTr7zIF5Cx
         c1c8CZreMUswaGtlFw+UR1vAa7K3fwGXq7SrZvXdacm0uJIwLDVtTheWg39oGFupt2Jc
         sMMyrEiTwutA8BfXiSRMqg+ih0vxEl+DVDQnG2aG60O39Doaldd5ZTp4xASmFR8vnqW2
         J7Ng==
X-Forwarded-Encrypted: i=1; AJvYcCXztNyzItzCmKySBMuTRB7rIyqw4WqZM+LfT4s0egyX2cnw2i0PmrqNO8gCZ6oW9pBcq0lsw23qSSM=@lists.infradead.org
X-Gm-Message-State: AOJu0YwSuAIzFJUmfgvWN1cZD+GTR8NElQJ03gdZisxogDoRdNuCpZWA
	O2cQm4u68rEVBq4X6pFKhK2ByDm4pWN5VQpUTUQzmT25Ee4xDj2yp5vPuWCeYEc=
X-Gm-Gg: ASbGncsjUgXYioURWtZCd7LZKFTux83yTkslsGr/kOMrXt/v05Vm1WfqBkGTM/GEoKn
	1Iq+e4JDwcmZ02zRclojp18h/vdTsGTRvUszOEJQ7+Ut40DRAsIOAnsxDCGzHbEzLp9TX17oyNi
	aRzXoz/jXqIaCJg4Aikd5vSHXzsQylemfYZO5L0kkzJrHr2/ZOcO0kGXM8h6igvV7Wa/t0XB1C4
	iAW8fpHidy0l5sYXyPkVcEOHMd6R/B7ArW3lTPDWZHly9eu0UHSMBjT7z4dWYOerKA8THlkJ+8Q
	jMTDuyhZk6dG4aVgZwceLBKHN5dDuf2eXw/Y/5/E+NA=
X-Google-Smtp-Source: AGHT+IHljsBKLiMSwe9a9spi/guXRSlSUeFAziwYEZ2f83TIkAwW439SP28/QrmHbhabYpknI9/fAQ==
X-Received: by 2002:a5d:64ac:0:b0:38d:dfb8:3679 with SMTP id ffacd0b85a97d-39132d228c5mr22022486f8f.17.1741869556082;
        Thu, 13 Mar 2025 05:39:16 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::59a5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c7df33aasm1978419f8f.2.2025.03.13.05.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 05:39:15 -0700 (PDT)
Date: Thu, 13 Mar 2025 13:39:14 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH v3 02/17] riscv: sbi: add FWFT extension interface
Message-ID: <20250313-5c22df0c08337905367fa125@orel>
References: <20250310151229.2365992-1-cleger@rivosinc.com>
 <20250310151229.2365992-3-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250310151229.2365992-3-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_053917_620262_2981DD5C 
X-CRM114-Status: GOOD (  27.72  )
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

On Mon, Mar 10, 2025 at 04:12:09PM +0100, Cl=E9ment L=E9ger wrote:
> This SBI extensions enables supervisor mode to control feature that are
> under M-mode control (For instance, Svadu menvcfg ADUE bit, Ssdbltrp
> DTE, etc).
> =

> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> ---
>  arch/riscv/include/asm/sbi.h |  5 ++
>  arch/riscv/kernel/sbi.c      | 97 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 102 insertions(+)
> =

> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> index bb077d0c912f..fc87c609c11a 100644
> --- a/arch/riscv/include/asm/sbi.h
> +++ b/arch/riscv/include/asm/sbi.h
> @@ -503,6 +503,11 @@ int sbi_remote_hfence_vvma_asid(const struct cpumask=
 *cpu_mask,
>  				unsigned long asid);
>  long sbi_probe_extension(int ext);
>  =

> +int sbi_fwft_all_cpus_set(u32 feature, unsigned long value, unsigned lon=
g flags,
> +			  bool revert_on_failure);
> +int sbi_fwft_get(u32 feature, unsigned long *value);
> +int sbi_fwft_set(u32 feature, unsigned long value, unsigned long flags);
> +
>  /* Check if current SBI specification version is 0.1 or not */
>  static inline int sbi_spec_is_0_1(void)
>  {
> diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
> index 1989b8cade1b..256910db1307 100644
> --- a/arch/riscv/kernel/sbi.c
> +++ b/arch/riscv/kernel/sbi.c
> @@ -299,6 +299,103 @@ static int __sbi_rfence_v02(int fid, const struct c=
pumask *cpu_mask,
>  	return 0;
>  }
>  =

> +int sbi_fwft_get(u32 feature, unsigned long *value)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +/**
> + * sbi_fwft_set() - Set a feature on all online cpus

copy+paste of description from sbi_fwft_all_cpus_set(). This function
only sets the feature on the calling hart.

> + * @feature: The feature to be set
> + * @value: The feature value to be set
> + * @flags: FWFT feature set flags
> + *
> + * Return: 0 on success, appropriate linux error code otherwise.
> + */
> +int sbi_fwft_set(u32 feature, unsigned long value, unsigned long flags)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +struct fwft_set_req {
> +	u32 feature;
> +	unsigned long value;
> +	unsigned long flags;
> +	cpumask_t mask;
> +};
> +
> +static void cpu_sbi_fwft_set(void *arg)
> +{
> +	struct fwft_set_req *req =3D arg;
> +
> +	if (sbi_fwft_set(req->feature, req->value, req->flags))
> +		cpumask_clear_cpu(smp_processor_id(), &req->mask);
> +}
> +
> +static int sbi_fwft_feature_local_set(u32 feature, unsigned long value,
> +				      unsigned long flags,
> +				      bool revert_on_fail)
> +{
> +	int ret;
> +	unsigned long prev_value;
> +	cpumask_t tmp;
> +	struct fwft_set_req req =3D {
> +		.feature =3D feature,
> +		.value =3D value,
> +		.flags =3D flags,
> +	};
> +
> +	cpumask_copy(&req.mask, cpu_online_mask);
> +
> +	/* We can not revert if features are locked */
> +	if (revert_on_fail && flags & SBI_FWFT_SET_FLAG_LOCK)

Should use () around the flags &. I thought checkpatch complained about
that?

> +		return -EINVAL;
> +
> +	/* Reset value is the same for all cpus, read it once. */

How do we know we're reading the reset value? sbi_fwft_all_cpus_set() may
be called multiple times on the same feature. And harts may have had
sbi_fwft_set() called on them independently. I think we should drop the
whole prev_value optimization.

> +	ret =3D sbi_fwft_get(feature, &prev_value);
> +	if (ret)
> +		return ret;
> +
> +	/* Feature might already be set to the value we want */
> +	if (prev_value =3D=3D value)
> +		return 0;
> +
> +	on_each_cpu_mask(&req.mask, cpu_sbi_fwft_set, &req, 1);
> +	if (cpumask_equal(&req.mask, cpu_online_mask))
> +		return 0;
> +
> +	pr_err("Failed to set feature %x for all online cpus, reverting\n",
> +	       feature);

nit: I'd let the above line stick out. We have 100 chars.

> +
> +	req.value =3D prev_value;
> +	cpumask_copy(&tmp, &req.mask);
> +	on_each_cpu_mask(&req.mask, cpu_sbi_fwft_set, &req, 1);
> +	if (cpumask_equal(&req.mask, &tmp))
> +		return 0;

I'm not sure we want the revert_on_fail support either. What happens when
the revert fails and we return -EINVAL below? Also returning zero when
revert succeeds means the caller won't know if we successfully set what
we wanted or just successfully reverted.

> +
> +	return -EINVAL;
> +}
> +
> +/**
> + * sbi_fwft_all_cpus_set() - Set a feature on all online cpus
> + * @feature: The feature to be set
> + * @value: The feature value to be set
> + * @flags: FWFT feature set flags
> + * @revert_on_fail: true if feature value should be restored to it's ori=
gnal

its original

> + * 		    value on failure.

Line 'value' up under 'true'

> + *
> + * Return: 0 on success, appropriate linux error code otherwise.
> + */
> +int sbi_fwft_all_cpus_set(u32 feature, unsigned long value, unsigned lon=
g flags,
> +			  bool revert_on_fail)
> +{
> +	if (feature & SBI_FWFT_GLOBAL_FEATURE_BIT)
> +		return sbi_fwft_set(feature, value, flags);
> +
> +	return sbi_fwft_feature_local_set(feature, value, flags,
> +					  revert_on_fail);
> +}
> +
>  /**
>   * sbi_set_timer() - Program the timer for next timer event.
>   * @stime_value: The value after which next timer event should fire.
> -- =

> 2.47.2

Thanks,
drew

-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
