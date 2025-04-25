Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E4D1C369D1
	for <kvm-riscv@archiver.kernel.org>; Fri, 25 Apr 2025 07:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s1ilp2W+YfFxCVsGz0k/LWqrhtOFF8xyQOlU+8PH+Ng=; b=nKPnpBue3fh9nF
	RPcsx/Z2djuMgIYn70/GmepBNjlWz5Y61lUOKy31BPYeZGTl1oOggxxFOMCPkqWU6LxyJTqCf+Llj
	Cx+bqGHUuLE3RWA78TBkN2boY6wKXmwl/jMwUQOKCmiQN+++dVIIWCk/0TPO2cmk981r8cbcsAY42
	EDjmMujT4dX/+UW3d8ZdQoT1UxoyYiUBBc8alhofLv1AkXRUeUUAjuWhXER9g6oBx/POhwuo2LQC7
	kJQFCRqDor9Qqy9dQLaj30WBmkKC5HO/STEKDn5CKpgOXdy4uIIuTzBLZgPfbvktMiCvcGEcF4+EF
	8W/0UveVliOHCZgMbAUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8DSJ-0000000GBO5-0zfb;
	Fri, 25 Apr 2025 07:26:39 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8DSG-0000000GBNF-2Ruq
	for kvm-riscv@lists.infradead.org;
	Fri, 25 Apr 2025 07:26:37 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so17593985e9.1
        for <kvm-riscv@lists.infradead.org>; Fri, 25 Apr 2025 00:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745565995; x=1746170795; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8rOWai1sdUbgwofhh5Gm/RhS+Xf+8kuHnQc4bFrAWfA=;
        b=OX4sXbMuFYTmCrfPAOalYL1h2Qj5o8c2MJM0CMB2WNRq2u1+tdObqUHU0H3OB6v+C0
         RwFhNN1qAkl2YU3r7kJwTWSL+4Ar2zL5a/v7jyHx6x+v1u28AoWGoIprS6J1jERW614M
         xYT0rPqSOxS0wvR3t8xeuF4++weHA9RiN840QqyBAdwYice4jJPMhFKlOMLrM7MU90+n
         Q3sRhhpFgx2QY+Q4bcHVjeyRDZWuBYwKxAGeN/CMm8aDY2Z+e5YhN6QCUYllMdzKHxNw
         COreDrWjpja+eCuYpOM1SfNRSRkqN53RyFWnGYxZWqcQmepfiu3QJyKj7TYyeYCl4AvH
         X0fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745565995; x=1746170795;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8rOWai1sdUbgwofhh5Gm/RhS+Xf+8kuHnQc4bFrAWfA=;
        b=EyDmHaqd+lBOkHXRRB41+CYWGAJ6K9Ns9Pb9u179eHz5VCXsZpLVCK0Qqg1FS1QS8t
         lrBGnu0Wg6dPigcO3xsCnDKITpkpQ1ONZP2UH0E0MWd77PTjbk9J0VqHgZL/Z/HknMMm
         fZgJGWhL3UzeFtigyrkTYdVtCyrhMBmE8pFW9ZQptqWerJR9M9B3fdr7QsHxMIvTSXg2
         uv0Ovgb4mTUQSYltaOgLNikjAYxnOtNhfDCWEafxKnLZHVR5adEyf3ikhc6j45bvFaAO
         0o0IxkDDwNiq9yLv2BDukI6uO/q4evzwQV2NgBx3CRbR2RlnaVlSN8dnCT5pZdTysNj2
         0vJw==
X-Forwarded-Encrypted: i=1; AJvYcCWfPa/jGspOY1/cu9cpkKfEG09IiVpuBQCtT45kSTWKWaw/76/EwyjHuAqW+ehtR03wvaHH0RwSL6w=@lists.infradead.org
X-Gm-Message-State: AOJu0YzovXGAcIitT0ENQV4tJDmCWDWPw5EGueEXoRah+Ni+h1veJQ6L
	xDshLD95nUB94kAquS8FiTeR6ygBHB6GF/VflYABnCkgs7jaN+ofahMKoXg7KrI=
X-Gm-Gg: ASbGnctHG8iXNm4EZGnQwYSHPj3GhJ/jxZRUrM0VOe8gBiYc9oHr7AkK5/F0FfO5zGs
	fygvS92oOw1yJG98cBWNtATW8FY0DF4IvC3qY0OFb13lErS108oa2aL8IdTuQ/z1p9723Y58Oma
	UwcD//QHPH2nqSrTcY5uXdASjCDkb8kDf19mMXJkaGtjeoNFUb3CvOuIABaeh7BJu3JoXVvVdgz
	3y1KDOw1uZZeeEwr/nlMrswKOn08YtPCx7jlGI7ylZqrIdvsqxt2HPCT+og33zaQVUHDPZnz59T
	aDRPy4YR5k79VqeiYkD5X6QTYEhc
X-Google-Smtp-Source: AGHT+IHyL/iAGxsNCgxot5kbeyyZgpCwkYAozWtkwnyndNThNfSseLduEbxfeuXjaZvP1Jxj6O0QvQ==
X-Received: by 2002:a05:600c:34ca:b0:43e:a7c9:8d2b with SMTP id 5b1f17b1804b1-440a66aaf1bmr8945465e9.24.1745565994713;
        Fri, 25 Apr 2025 00:26:34 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::f716])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2aab65sm46521075e9.17.2025.04.25.00.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 00:26:34 -0700 (PDT)
Date: Fri, 25 Apr 2025 09:26:33 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
Subject: Re: [PATCH 2/3] riscv: Strengthen duplicate and inconsistent
 definition of RV_X()
Message-ID: <20250425-93c9f462a1980ebd7bbc515d@orel>
References: <20250422082545.450453-1-alexghiti@rivosinc.com>
 <20250422082545.450453-3-alexghiti@rivosinc.com>
 <20250424-f322adab22126ae97dd7c5b4@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250424-f322adab22126ae97dd7c5b4@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_002636_623112_093640EB 
X-CRM114-Status: GOOD (  15.07  )
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

On Thu, Apr 24, 2025 at 10:45:46AM +0200, Andrew Jones wrote:
> On Tue, Apr 22, 2025 at 10:25:44AM +0200, Alexandre Ghiti wrote:
> > RV_X() macro is defined in two different ways which is error prone.
> > 
> > So harmonize its first definition and add another macro RV_X_mask() for
> > the second one.
> > 
> > Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> > ---
> >  arch/riscv/include/asm/insn.h        | 39 ++++++++++++++--------------
> >  arch/riscv/kernel/elf_kexec.c        |  1 -
> >  arch/riscv/kernel/traps_misaligned.c |  1 -
> >  arch/riscv/kvm/vcpu_insn.c           |  1 -
> >  4 files changed, 20 insertions(+), 22 deletions(-)
> > 
> > diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
> > index 2a589a58b291..4063ca35be9b 100644
> > --- a/arch/riscv/include/asm/insn.h
> > +++ b/arch/riscv/include/asm/insn.h
> > @@ -288,43 +288,44 @@ static __always_inline bool riscv_insn_is_c_jalr(u32 code)
> >  
> >  #define RV_IMM_SIGN(x) (-(((x) >> 31) & 1))
> >  #define RVC_IMM_SIGN(x) (-(((x) >> 12) & 1))
> > -#define RV_X(X, s, mask)  (((X) >> (s)) & (mask))
> > -#define RVC_X(X, s, mask) RV_X(X, s, mask)
> > +#define RV_X(X, s, n) (((X) >> (s)) & ((1 << (n)) - 1))
> 
> Assuming n is arbitrary then we should be using BIT_ULL.
>

Eh, scratch this. We know n has to be 31 or less since these macros are
for instruction encodings.

Thanks,
drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
