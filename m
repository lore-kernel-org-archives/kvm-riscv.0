Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC02DC282DE
	for <kvm-riscv@archiver.kernel.org>; Thu, 13 Mar 2025 13:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SPL0loj1hWeWwoxO9perGqniSu8upg3H089o37y3Jt4=; b=VA5kAypKVsLaKx
	06dBqs+Pqt3GH+4T3vWwUoJr3oaSyS/Twz46kCpdI8QifAjHiXYwNg0EK4nanEmi2tNjbddp/8EMW
	hhZPeU6ED7wbt85VGpKzuDo99rNGYB7pXmmEVTj2e4d6yJx61eUqtZCi2Tk0Rzsmlge+9jPckca8K
	dDAcsoCa4rM6Y5pi27sWiHatS7nX5h1rrxjOzdakZ7ePN0qE3VlUcP+ecnqZ5UYNLN27ASg9Cs8Cw
	i77sp3scabDQu/wqZ98tM8afHVcQeZccR/pIGjJROIuOwC8ylkbN51XwULdJaq0thuIfD82w+Qomb
	NTSZTyM3XGXROfnttH6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsiJt-0000000BL0W-2Wwm;
	Thu, 13 Mar 2025 13:09:53 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsiHR-0000000BKW6-0Nog
	for kvm-riscv@lists.infradead.org;
	Thu, 13 Mar 2025 13:07:22 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-39133f709f5so579875f8f.0
        for <kvm-riscv@lists.infradead.org>; Thu, 13 Mar 2025 06:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1741871239; x=1742476039; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kL64DFiTXok1q71S+zi/kYHeS1QK7/sbz4oMoXWMASU=;
        b=epTd4ycYsd3WfAjc3ZXG0a5A2fPwJUZl9+EiiRsFvCAWIpu0+OqbWR3RO6HbG4Ck1q
         C8UWE/8qF4+Em1cz58RLK03QDn0oIK1ZT2cf5iK+MK2Hf9puSvLpVaJ+KTcGPst6mHjI
         qHGSeoS2OHTvfIBXqG3togFWhXBQ3hrU7f5VHOpWuee9LAM3/eIDDuNHiy5NxLTIjMQ2
         sez7VucSSKQsKlRqrvvo1NHMcHuOei0pnqEwnRpK1sfrRZ0yI0P5Dt+G8EGnOxIg6vMv
         joI7MzsKPP6KtgitZCf+d1aKS0/1hAoL8LW5dI6mCEYSsxyh87+Bhe/FRjvn5FtetB9T
         H6+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741871239; x=1742476039;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kL64DFiTXok1q71S+zi/kYHeS1QK7/sbz4oMoXWMASU=;
        b=MfIpcmfGay6fX+57NWU+oisnKhbjS1EeeakBXzan+2Smbd/af4vbvyyih8Liwei2An
         wSBCWk4adLno0Rb/+wA4dx38qFP6hOVb9sljEBKjFg774DHJzHxzQi1OfGoGk8BFKRCl
         diZEZaWJOmOH2k7gdOM2BcRMim4VSJcfDCs0bqUYkyPNoTj4HTHuU1bIpyvwbohgMD/d
         3ODTROxB5jMeMN6ghd2RsKnTYBeCocUSLpz2SLoJ/rhq16NV0qd8Fhyr764FkN3//YHu
         syM2RiaC9UURSYVokGx90T3P3RKq/4bnZRiiSGYXsLEIa4s9AeoQtLuI05KCjwrGtlE9
         2tiA==
X-Forwarded-Encrypted: i=1; AJvYcCUj3OzZjhGijMbPP2MjOW7Xn2mKQi/KxDf5o/Ed9CW77wlDfPLTPS6l0aa0q30cHRSe7s/p1CdajDE=@lists.infradead.org
X-Gm-Message-State: AOJu0YxwqbJIynjGzO+8splMrMEb1ObQDRk1Z8iQEUtdxVhC6fkTMKZl
	QHYxB14QUneZ9MPeYlsJyHu6DvRYxAaw8gWcI2lCM+B3ff/ysW+Q6vUCBWnlHs8=
X-Gm-Gg: ASbGncuh42mpECB7FPLc3cYzFUlSE7DLmz4Kw3pkyPNh5bEl3vuGrgssHsH1psX8RQu
	LraGZuJ8Y9ZreoidlQznYw7oE33MuP5m22MMeZvansmrNNXXtRMkrwirARtb9slLFUj5c5uqX24
	JmW1riw8MhUQqAXZNvHP+V+/edlVP38bBh5HynDw9sIXnLeVcs0AozUpkA76hahta0U80BUTPqG
	HIoyJKvZeRJ9uIXC4jvONQXX1tJinZIRKvBuUlreyDRtEQaiR2+Am//2gG81URmBaebt+tTFNLt
	m1n6KJdGRPlJMIq+frFe571uI5thMI8P
X-Google-Smtp-Source: AGHT+IFa3kUJDoicJ8fhht/dP0MNLzwH7jshhQs0/MiP3cN1RHdBOvdNu6RA1GEeL6KH0hkbmig8fQ==
X-Received: by 2002:a05:6000:18a3:b0:390:e7c1:59d3 with SMTP id ffacd0b85a97d-39132d16de1mr20255337f8f.2.1741871239342;
        Thu, 13 Mar 2025 06:07:19 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::59a5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cb7ebbc3sm2013164f8f.88.2025.03.13.06.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 06:07:18 -0700 (PDT)
Date: Thu, 13 Mar 2025 14:07:18 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH v3 07/17] riscv: misaligned: move emulated access
 uniformity check in a function
Message-ID: <20250313-89b46bd06fbea0072ac4932f@orel>
References: <20250310151229.2365992-1-cleger@rivosinc.com>
 <20250310151229.2365992-8-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250310151229.2365992-8-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_060721_134244_F2864238 
X-CRM114-Status: GOOD (  17.95  )
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

On Mon, Mar 10, 2025 at 04:12:14PM +0100, Cl=E9ment L=E9ger wrote:
> Split the code that check for the uniformity of misaligned accesses
> performance on all cpus from check_unaligned_access_emulated_all_cpus()
> to its own function which will be used for delegation check. No
> functional changes intended.
> =

> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> ---
>  arch/riscv/kernel/traps_misaligned.c | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
> =

> diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/tra=
ps_misaligned.c
> index 7fe25adf2539..db31966a834e 100644
> --- a/arch/riscv/kernel/traps_misaligned.c
> +++ b/arch/riscv/kernel/traps_misaligned.c
> @@ -673,10 +673,20 @@ static int cpu_online_check_unaligned_access_emulat=
ed(unsigned int cpu)
>  	return 0;
>  }
>  =

> -bool check_unaligned_access_emulated_all_cpus(void)
> +static bool all_cpus_unaligned_scalar_access_emulated(void)
>  {
>  	int cpu;
>  =

> +	for_each_online_cpu(cpu)
> +		if (per_cpu(misaligned_access_speed, cpu) !=3D
> +		    RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED)
> +			return false;
> +
> +	return true;
> +}
> +
> +bool check_unaligned_access_emulated_all_cpus(void)
> +{
>  	/*
>  	 * We can only support PR_UNALIGN controls if all CPUs have misaligned
>  	 * accesses emulated since tasks requesting such control can run on any
> @@ -684,10 +694,8 @@ bool check_unaligned_access_emulated_all_cpus(void)
>  	 */
>  	on_each_cpu(check_unaligned_access_emulated, NULL, 1);
>  =

> -	for_each_online_cpu(cpu)
> -		if (per_cpu(misaligned_access_speed, cpu)
> -		    !=3D RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED)
> -			return false;
> +	if (!all_cpus_unaligned_scalar_access_emulated())
> +		return false;
>  =

>  	unaligned_ctl =3D true;
>  	return true;
> -- =

> 2.47.2
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
