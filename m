Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C5E8C28B28
	for <kvm-riscv@archiver.kernel.org>; Wed, 12 Mar 2025 16:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D2cxsTWNV0UysRmFPcnUNAnJ8CaKme0WkOmGzv6vkHY=; b=oJuj+FEdRYrvzO
	FlKmkNtgqww2uJbTIwReHTL+ZVNdPAGI8dxL4ReC5OCj9JDLCMiX5TdqvPAy/6y23DOgDylba73U2
	9N0gCvVDtjW7CMLPTy3ceMMJI4SoSH4gXJ5uou8NZGTF9W1tjefdBGLHmAs+H8FtFqyLCW/ePvwV0
	TeGMC1bS/lncit6ukV5vXMTWk5OxPGZq0PlRV8XhbvBMb+JUx8ikXurilg166/+3DCd/DkQp3VWGf
	4UoTR6Vpn+DtLSCGLgYEAxDzDb3XQBVzBcz12rhsEma2qrWRSXbzx0jJJTCkFuIxU+MywHmVpJ/q+
	Pg0/JcWJQQSqV5D19j/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsOyG-0000000927X-0Tzc;
	Wed, 12 Mar 2025 16:30:16 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsOyC-0000000925l-1otO
	for kvm-riscv@lists.infradead.org;
	Wed, 12 Mar 2025 16:30:14 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43cf257158fso25294915e9.2
        for <kvm-riscv@lists.infradead.org>; Wed, 12 Mar 2025 09:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1741797011; x=1742401811; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hHCzMkM4V0FCA5GSaas6IUmfm95bagI0oFQC8KFA3X8=;
        b=Oa8CQNoVYIHVJgQzwOOcq9YpGkf6I3oNJgVkiLAEswlJ29aRhE6wNkJoDr2CQz8fQt
         F9DTBP8F3RdUqTPa/StO0j64c04m9Zy9xuS6S0EVd2pFrOESgZpS02j7mhSfcDron+SW
         IEvoWa/72Yv1ca8lISSAMDLSVKwGKmmbApYUIU622btcjKt/whNvwFhyfXwIUkzYDiPV
         DimXEVUdEC8eEmLcCEG5FfBkj1/r4nLWBtqzC6U3H7nPa1kcbRnEMeCg1Sqfoxhw1cdz
         b0SRLXAqrLKjdHz9/O7n713Z8H8zMJx+84pHHecF1aXf3sZANYIfXfWLpLWn+gyS+whf
         GkYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741797011; x=1742401811;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hHCzMkM4V0FCA5GSaas6IUmfm95bagI0oFQC8KFA3X8=;
        b=QSuQigR3ciwvi6NrRYBQyCa279znB6KaIbQMpoJHe7I9qbUAIJstNfTiuyD1Eka+tE
         EcrLswR6gKeKwj6z5Pt6FXyRGpJ+Lunme3Rkav9C93fiYQAdtDqfjszr9WNJrOchtYK4
         1xzFhHoRwJ4DcnibNhFlhHiWmYH7XoQgVhLyzQ/9EeXsP2mia1g3Xoli96QdAd0lJHn4
         s9zyRrTmiAsTS9TnKehT7OEbyJdC1DeUqmMxhaOSsutk8z7+0Pn5vv1P0hHEHQtWCwXa
         h/4QlMc8V6AL0EbeTTxMDafUQ37kMMzs7SyRVG8EPl4a0uFkBKgnzBNuXl3/M/fZKzXc
         NRTw==
X-Forwarded-Encrypted: i=1; AJvYcCUUjZwQC8efh8KWUxozqZDFKEHWgi9BP1zUrsUlnsxIKk9cBx3zEmw7OhH9rgg586kqxQZKSBLoDds=@lists.infradead.org
X-Gm-Message-State: AOJu0YyiXW0FS1tAkVsYW6PVShr3u0hFIB9BTkmkD64JOvRYqRzcWWK+
	xT+Lg4ECvLwZSs7mGcAdhU/oyeRrBhjGAvauOrMUHwxX7dWs+uyaqE8AR4q0DCg=
X-Gm-Gg: ASbGnctGzLPXXvZnRfjGQqi9E8hrWwy83PyLeImTYIM503t3m1Iw4fzGiWqWqJ7YJD4
	4kaQOwA6WtQwVvyfPANqAD6hae/nUFchpQGn7slyj1s+f3nkU1OaEB7hnEuMf2pik+0Mm9+qD6C
	2ohG7L5y89gkQQqtKnn3dKZFvpBr4RalRqpthaSQqqpN2ZiGJ/jrL7XfywHdvNW+I6glBSiYB+x
	Ux43eWnkKsIFRL4He81rXV5cpSEgoe98XDBWRdHwvOnwE8/RJshnKwq31cjJwEzLbjMuP3JSppf
	RBmIJSVdXgx5SxnajyzgpeiT5NQyYbnp
X-Google-Smtp-Source: AGHT+IFzWLdauN8zxlIPaoiRwIyIsZo3yE31HiFbBGGM34rXQs6Ax0qxux5QNa2xvRElBttvBczaJg==
X-Received: by 2002:a5d:648f:0:b0:390:fe13:e0ba with SMTP id ffacd0b85a97d-39132d70bc4mr16934734f8f.27.1741797010642;
        Wed, 12 Mar 2025 09:30:10 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::59a5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfdfba9sm21891752f8f.39.2025.03.12.09.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 09:30:10 -0700 (PDT)
Date: Wed, 12 Mar 2025 17:30:09 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	Anup Patel <apatel@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>
Subject: Re: [kvm-unit-tests PATCH v8 2/6] riscv: Set .aux.o files as
 .PRECIOUS
Message-ID: <20250312-c9b8ee98ed38271ed7422550@orel>
References: <20250307161549.1873770-1-cleger@rivosinc.com>
 <20250307161549.1873770-3-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250307161549.1873770-3-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_093012_469691_E1A41489 
X-CRM114-Status: GOOD (  12.96  )
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

On Fri, Mar 07, 2025 at 05:15:44PM +0100, Cl=E9ment L=E9ger wrote:
> When compiling, we need to keep .aux.o file or they will be removed
> after the compilation which leads to dependent files to be recompiled.
> Set these files as .PRECIOUS to keep them.
> =

> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> ---
>  riscv/Makefile | 1 +
>  1 file changed, 1 insertion(+)
> =

> diff --git a/riscv/Makefile b/riscv/Makefile
> index 52718f3f..ae9cf02a 100644
> --- a/riscv/Makefile
> +++ b/riscv/Makefile
> @@ -90,6 +90,7 @@ CFLAGS +=3D -I $(SRCDIR)/lib -I $(SRCDIR)/lib/libfdt -I=
 lib -I $(SRCDIR)/riscv
>  asm-offsets =3D lib/riscv/asm-offsets.h
>  include $(SRCDIR)/scripts/asm-offsets.mak
>  =

> +.PRECIOUS: %.aux.o
>  %.aux.o: $(SRCDIR)/lib/auxinfo.c
>  	$(CC) $(CFLAGS) -c -o $@ $< \
>  		-DPROGNAME=3D\"$(notdir $(@:.aux.o=3D.$(exe)))\" -DAUXFLAGS=3D$(AUXFLA=
GS)
> -- =

> 2.47.2
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
