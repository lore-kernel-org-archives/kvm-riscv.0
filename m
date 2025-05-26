Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F267DC5AD49
	for <kvm-riscv@archiver.kernel.org>; Mon, 26 May 2025 08:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oZ5BGD3L7URdD3Dnqez8ZQuzBp7ZdUq+R6QqNJbTHrs=; b=BzULszHJl4h+KK
	GCNy/KHWKzQW4u8at8tC0xV+Xr17Ek2ceweP5nYBq0DWujeEACbgKn/uTg/O3ZZjmpayxiULZNGx5
	sxoCVIOMD4+I1rC5sKFpPKStQ8fB/wLo2+3CgcanL6WUSR8inosK08C9rbA8VyIGeH5TfYC+lViP8
	uobbKpbanPPCWPowiwQGwjcyh8KF9+Bq1ydAX46T0E3b1c1v751REfdncIcTImY/21CXCZDSynu57
	o0SZgs8wxLCAaKVFCwm00i9vDO798GixjDTXjgNpCDCDYLOZAsQ8lJw+6/j48uGNnLuwU6j4ON6aK
	JC/VOLdwMPcz4nNbWs3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJTOu-00000008PeJ-2Fz7;
	Mon, 26 May 2025 08:41:40 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJTOr-00000008Pcm-16Ko
	for kvm-riscv@lists.infradead.org;
	Mon, 26 May 2025 08:41:39 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-6045e69c9a8so2006673a12.3
        for <kvm-riscv@lists.infradead.org>; Mon, 26 May 2025 01:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1748248895; x=1748853695; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lgi+BI+UxQxxje7YEG6nl3Jn6VhfFhFL9BZoJyhkgXs=;
        b=mPYrVOXK9HtkBdOjLT+5lR86OVvN2ZNTRm7jIfFYFVxt3CMIatMXupb7d0Iey5FJc7
         t2/hhonGLsVprnmxolc0Zl9CkGhQALaZDTcu0wENlhalSF3qRTeSfMGhJu/j6tUkvUSd
         gHsGTeXyI30WlN4K7+qMKl64kLJaHh5ENmQraF4pETaVipdEbUVFiC1V+NdoLqMt3FYZ
         jOsgTYN8vQkyffHE6UH4h1D4B9GV81gEtrFFe/ezbIERcdpg0p+KaqRw/xhBbgaHC4Bl
         mYum7UzC6TbUPfNix5qGSJMuIdHi2C9fNbQiNFm4eaXD9UiXpxbWbKsKZhxOBhSohjpW
         /1fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748248895; x=1748853695;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lgi+BI+UxQxxje7YEG6nl3Jn6VhfFhFL9BZoJyhkgXs=;
        b=gSCrmiGWCzO76Qyfep6KTBvOC9IU+ou0ZEjwij3pCwV/lFIHEG8OYxM5CW9sdJKEzw
         FpCA6E9C/+l6rwoVH6yb3a4TLF7Hht3ET8uLn/v1GIM0NsBz8qP7hZdggwmpR+7rVwgi
         RaTyZIs6F3PHntDaUPbD6FWPSC1kfWzqet2Bf3xGZypZTmj5CrI2DexTaS7fIDdg3vzo
         FAsAIxPkEDlAOY4P5JAjRyZD2uh9OaUO3EklGMN2Sj8H+bJURw0Y7H4q6uRD5cquCMeL
         3gqmdR9aOEit19krsJ0GyWvxcMfV59cqpggX6hxL585nWwONecJzqNytGyWnZxfoPq1S
         XRiA==
X-Forwarded-Encrypted: i=1; AJvYcCW7SfZrnGGqEYSzTOIkGju20ZXkBxZ6eELGsImJVCr5SrUYRzrOYt1w22pMCTCPxiz/RA4+sps4TCc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/jqs2BhK28F1uSv608tE2bCIdO0mn0bRby1EbyQNtcJ19yz4l
	UktgPDXrBlxjz7PWJOTwI6ekj0o84NFIYICX0bwEVQLNatypbpMA+JuuGHH0MCZKsi8=
X-Gm-Gg: ASbGncvSW4JJ++9xsq5rivsx9TSHQzfjFqKH/+Vhaze53exbTNUtnjrhzA5ZIcRnQEr
	A6t6zcYOhPx8dp8CCZBI3KZdCmRgft9/U7zoS4WoVwVAz4gCMUOE3ywrkEFY+DistB7vO5bK45z
	cPf2i+PIPgh/43ot8Pxng8FN07+s1YFrO53UDhKtcEKFvdHOAGUE4U8B87rxu3Jzrj42U0qYP1K
	QpwQpQzu/0JCcdaPwb7okMHCkUIj7zyloKXypQHgjWsV1VCobmcA8wYx2wHa+M+3mCk3P51VWsy
	R3wJa5XrMxD1UhAB/m5BBYSk/I9LWC+v7+xgBAUvrX0LlNspp92dq9mSetxRZo+XZZyfTcjAdC6
	vGhy3
X-Google-Smtp-Source: AGHT+IG8/VYDbfxt/MCOP+EaLwsXzbrnjfrXlbSUZYq06meSDTM4WfgPl2nsylybH23Wd9Lf5xvIZg==
X-Received: by 2002:a05:6402:4404:b0:602:1b8b:2902 with SMTP id 4fb4d7f45d1cf-602d9bf086amr6150523a12.15.1748248894652;
        Mon, 26 May 2025 01:41:34 -0700 (PDT)
Received: from localhost (cst2-173-28.cust.vodafone.cz. [31.30.173.28])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-604b79dc22fsm1148466a12.14.2025.05.26.01.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 01:41:34 -0700 (PDT)
Date: Mon, 26 May 2025 10:41:33 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Charlie Jenkins <charlie@rivosinc.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	Samuel Holland <samuel.holland@sifive.com>, Deepak Gupta <debug@rivosinc.com>
Subject: Re: [PATCH v8 09/14] riscv: misaligned: move emulated access
 uniformity check in a function
Message-ID: <20250526-baaca3f03adcac2b6488f040@orel>
References: <20250523101932.1594077-1-cleger@rivosinc.com>
 <20250523101932.1594077-10-cleger@rivosinc.com>
 <aDC-0qe5STR7ow4m@ghost>
 <b2afb9c7-a3d2-4bf6-bfaa-d804358ccd88@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b2afb9c7-a3d2-4bf6-bfaa-d804358ccd88@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_014137_305126_B05100F3 
X-CRM114-Status: GOOD (  31.91  )
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

On Fri, May 23, 2025 at 09:21:51PM +0200, Cl=E9ment L=E9ger wrote:
> =

> =

> On 23/05/2025 20:30, Charlie Jenkins wrote:
> > On Fri, May 23, 2025 at 12:19:26PM +0200, Cl=E9ment L=E9ger wrote:
> >> Split the code that check for the uniformity of misaligned accesses
> >> performance on all cpus from check_unaligned_access_emulated_all_cpus()
> >> to its own function which will be used for delegation check. No
> >> functional changes intended.
> >>
> >> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> >> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> >> ---
> >>  arch/riscv/kernel/traps_misaligned.c | 20 ++++++++++++++------
> >>  1 file changed, 14 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/=
traps_misaligned.c
> >> index f1b2af515592..7ecaa8103fe7 100644
> >> --- a/arch/riscv/kernel/traps_misaligned.c
> >> +++ b/arch/riscv/kernel/traps_misaligned.c
> >> @@ -645,6 +645,18 @@ bool __init check_vector_unaligned_access_emulate=
d_all_cpus(void)
> >>  }
> >>  #endif
> >>  =

> >> +static bool all_cpus_unaligned_scalar_access_emulated(void)
> >> +{
> >> +	int cpu;
> >> +
> >> +	for_each_online_cpu(cpu)
> >> +		if (per_cpu(misaligned_access_speed, cpu) !=3D
> >> +		    RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED)
> >> +			return false;
> >> +
> >> +	return true;
> >> +}
> > =

> > This ends up wasting time when !CONFIG_RISCV_SCALAR_MISALIGNED since it
> > will always return false in that case. Maybe there is a way to simplify
> > the ifdefs and still have performant code, but I don't think this is a
> > big enough problem to prevent this patch from merging.
> =

> Yeah I though of that as well but the amount of call to this function is
> probably well below 10 times so I guess it does not really matters in
> that case to justify yet another ifdef ?

Would it need an ifdef? Or can we just do

 if (!IS_ENABLED(CONFIG_RISCV_SCALAR_MISALIGNED))
    return false;

at the top of the function?

While the function wouldn't waste much time since it's not called much and
would return false on the first check done in the loop, since it's a
static function, adding the IS_ENABLED() check would likely allow the
compiler to completely remove it and all the branches depending on it.

Thanks,
drew

> =

> > =

> > Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
> > Tested-by: Charlie Jenkins <charlie@rivosinc.com>
> =

> Thanks,
> =

> Cl=E9ment
> =

> > =

> >> +
> >>  #ifdef CONFIG_RISCV_SCALAR_MISALIGNED
> >>  =

> >>  static bool unaligned_ctl __read_mostly;
> >> @@ -683,8 +695,6 @@ static int cpu_online_check_unaligned_access_emula=
ted(unsigned int cpu)
> >>  =

> >>  bool __init check_unaligned_access_emulated_all_cpus(void)
> >>  {
> >> -	int cpu;
> >> -
> >>  	/*
> >>  	 * We can only support PR_UNALIGN controls if all CPUs have misalign=
ed
> >>  	 * accesses emulated since tasks requesting such control can run on =
any
> >> @@ -692,10 +702,8 @@ bool __init check_unaligned_access_emulated_all_c=
pus(void)
> >>  	 */
> >>  	on_each_cpu(check_unaligned_access_emulated, NULL, 1);
> >>  =

> >> -	for_each_online_cpu(cpu)
> >> -		if (per_cpu(misaligned_access_speed, cpu)
> >> -		    !=3D RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED)
> >> -			return false;
> >> +	if (!all_cpus_unaligned_scalar_access_emulated())
> >> +		return false;
> >>  =

> >>  	unaligned_ctl =3D true;
> >>  	return true;
> >> -- =

> >> 2.49.0
> >>
> =


-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
