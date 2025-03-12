Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56CAFC28B2E
	for <kvm-riscv@archiver.kernel.org>; Wed, 12 Mar 2025 17:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gSxoJ49Shg8ambXo2Xy2ExAKHE2Rrl3rx0CIwVSEw8Q=; b=m2/CT0ZZu9iblp
	BT6kmjqwXNdlCa+WcNex7EjPkS/N0iE5pYvmFvIugqa0rbT645cd6vfDo+gk37UH0I1zE+TPaxz9u
	xs4jj1998Av/6oZZFxJ80ysp1vEPlFEuNG1AbiaeB7J7mmo2TlLWCz1YwiVtW7SUcIiYvGjzK5eao
	hRHFlfkHPJHqC9bLnn13IC2yG6cOaxBZz4c8wXcf/sj/XybnIaljwbPM83f2fFtJp81ilG7WMT6mg
	+fyD2p03/NNCEYBuDofiOGnH3i4AKcY210NWekaSlt8dm85kLOHa1Ip+GB94LZ20cilXzXewISc7m
	qosU2HFXuUrS6l44JbFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsQGs-00000009BS3-0RIs;
	Wed, 12 Mar 2025 17:53:34 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsQGp-00000009BRS-2AUQ
	for kvm-riscv@lists.infradead.org;
	Wed, 12 Mar 2025 17:53:32 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-38f403edb4eso68604f8f.3
        for <kvm-riscv@lists.infradead.org>; Wed, 12 Mar 2025 10:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1741802010; x=1742406810; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2GVnA/UnZGLh6c1UKOgcldWecF4fsN0zEAZXlhhR3U8=;
        b=J8BXdeMyw74vH9lHVQcVyQmnQGgYssN1eaLmDJZZar8MxMQoZXNvQLhMJwH0DT6KkX
         YXC/Vm8bm6OkPLnEmKJ4CI8v1/BGfHVderK6PaaUBn5a4LZXhV7rEJRxtrFD1+1r3EqQ
         wkrrbwjY4q/lRMNMAhv4IiVbp9vYYKkRyqjma25UZ/NBWSNZREanbQ6V9STpc8J267X/
         qHGVWknm/QZyxoqFTNoigd7nUR39axBuWkrSswXtg3+06ZGJmE64CRdDaqsD5MLfUPB3
         0bh9v2EmCpqp+lJJq6lVPKTFdRuQhgS+UWOX4u3FAdK7xOpHULYA5uUTwFwPSu3pekTy
         47ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741802010; x=1742406810;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2GVnA/UnZGLh6c1UKOgcldWecF4fsN0zEAZXlhhR3U8=;
        b=hJQs/7w+F2HazSFzrc7A7EpNpDPrRcDW9xEu0NZ2zL/aUCMbW1YZbE7l/Uv/mnzQ24
         eHIT1ZcCf2dwmZY+JeNqD57ARnp3rrzDt8DuVy/03YjUU8wkk8KdXzQKv33wL6VAENta
         R1ZCYvkmyk0TtTiT5Lo2LDKG5k/J2WcAxV8VJr5Ge7nmdWXsqz8YOv4cdsm19ZgW7ewH
         UbZkHSEWYqtWBGltQe34zr1SrFlZqiaA1NIIXFmybs9im+ttYWOm2mO4vkSDV/WzS+7Z
         5f3Qv+y2dEXCIay+Xw7C96WaIjVXdqez1DMGBoKkjZzDEACCfXavVNkHhlmVsyAuOUWZ
         vHXA==
X-Forwarded-Encrypted: i=1; AJvYcCXCqOcpeh7lAuwhEN8H7YmQQxVbligxX9zY9r8MYAOGc0d0bad74c4WyTxIrFO1i1k284Un5r/2Akw=@lists.infradead.org
X-Gm-Message-State: AOJu0YyHAle/EBwpyOpdhXy9/9EuPyptjvfQkyx+gmOKVkD46fORdr+3
	d+V/wdCepAxvKkK7vfQfivZweDHNxKcuzrvbIguoVXHXWG6ULcdMMhJBtlDTzu4=
X-Gm-Gg: ASbGnctBhORtBm0+xA5SAqzb0zbEKl7neDxzdI3jAoFtE3D72/LdqmR1A9RGUTuQ41E
	pvjcysukKOFoft8w353ZqfmZnXvLDNmnLMX8JGTAPyAe4bUNIh8UlImXRWsTdf1B+wSNL2mnYFa
	ae0JlErxLfkma4RUjAr2yvTtRv0DdMLhAyFwnF0vcrgpvkUOaF9WTfF+46lJOMUsRO6dwWv2BeE
	sEEtY9JSeTj9KcNHa6/8v/iOhwfx0M3XJc7QBgqRti91mo6JnV96Lo+tTP6OVgKcBdlwMe4FhbM
	bz2MsjeUN9Yk00AiY32rswLND7EF0swa
X-Google-Smtp-Source: AGHT+IGJD54WmeJhWmLuIg6K2eLaR6Nu3KOFJvfRzzPSdn1jrQ2yHrF7W3nXWrIi6nSfDAAnfx+3aQ==
X-Received: by 2002:a5d:6d8c:0:b0:38f:3224:65ff with SMTP id ffacd0b85a97d-39132d16d69mr16559838f8f.5.1741802009907;
        Wed, 12 Mar 2025 10:53:29 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::59a5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfdfde7sm22153857f8f.32.2025.03.12.10.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 10:53:29 -0700 (PDT)
Date: Wed, 12 Mar 2025 18:53:28 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	Anup Patel <apatel@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>
Subject: Re: [kvm-unit-tests PATCH v8 2/6] riscv: Set .aux.o files as
 .PRECIOUS
Message-ID: <20250312-70978d5a25e382c2b36935f4@orel>
References: <20250307161549.1873770-1-cleger@rivosinc.com>
 <20250307161549.1873770-3-cleger@rivosinc.com>
 <20250312-c9b8ee98ed38271ed7422550@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250312-c9b8ee98ed38271ed7422550@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_105331_558743_CF957399 
X-CRM114-Status: GOOD (  15.18  )
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

On Wed, Mar 12, 2025 at 05:30:09PM +0100, Andrew Jones wrote:
> On Fri, Mar 07, 2025 at 05:15:44PM +0100, Cl=E9ment L=E9ger wrote:
> > When compiling, we need to keep .aux.o file or they will be removed
> > after the compilation which leads to dependent files to be recompiled.
> > Set these files as .PRECIOUS to keep them.
> > =

> > Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> > ---
> >  riscv/Makefile | 1 +
> >  1 file changed, 1 insertion(+)
> > =

> > diff --git a/riscv/Makefile b/riscv/Makefile
> > index 52718f3f..ae9cf02a 100644
> > --- a/riscv/Makefile
> > +++ b/riscv/Makefile
> > @@ -90,6 +90,7 @@ CFLAGS +=3D -I $(SRCDIR)/lib -I $(SRCDIR)/lib/libfdt =
-I lib -I $(SRCDIR)/riscv
> >  asm-offsets =3D lib/riscv/asm-offsets.h
> >  include $(SRCDIR)/scripts/asm-offsets.mak
> >  =

> > +.PRECIOUS: %.aux.o
> >  %.aux.o: $(SRCDIR)/lib/auxinfo.c
> >  	$(CC) $(CFLAGS) -c -o $@ $< \
> >  		-DPROGNAME=3D\"$(notdir $(@:.aux.o=3D.$(exe)))\" -DAUXFLAGS=3D$(AUXF=
LAGS)
> > -- =

> > 2.47.2
> >
> =

> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

I meant to give this a

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>

but I'm using the wrong mutt config right now...

drew

-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
