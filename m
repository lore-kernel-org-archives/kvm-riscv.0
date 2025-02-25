Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 098D1C021BB
	for <kvm-riscv@archiver.kernel.org>; Tue, 25 Feb 2025 10:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JTq82V5fdRr/iQcRTg1otvW/V4/oJOX5e8RmGSPIDhQ=; b=bA46pEe1p93yCN
	Zh5zGEjOT24+DO312ltj9qoAAA35puwvkit0f+sDGL7PUhl3giCYkpQqsV0zcBz/24iy+N0bjdKmk
	/Ajiq1Y8QDypv/XhPZcSzPn0zr84wUtjq61CZQ/PHlaXwYDwHup6FOgEosxSrgwq+pK0eVgzknEd2
	0XUk56i8PN9XcLtp7THR6JusSpzU6udOBACJEojk8dkUBlFqv/LeaWS7Zd2DSZMyVptExgbkapfZt
	lizocMP6r+xOtjh6ObLA7hJstMPWcanifoc5Rg+GS2nbhADGD16lE9ij/foqUAe2HNVKmI6JajfZn
	w1KEr/flD4GSyaItHwIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmseL-0000000Gvdk-3Fje;
	Tue, 25 Feb 2025 10:58:53 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tms7o-0000000GohO-3ER5
	for kvm-riscv@lists.infradead.org;
	Tue, 25 Feb 2025 10:25:17 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-439a1e8ba83so51092015e9.3
        for <kvm-riscv@lists.infradead.org>; Tue, 25 Feb 2025 02:25:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1740479115; x=1741083915; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fL1utdGcf1YtA95f8hT56+IP4cv4xhFtEjnPmOAPn/4=;
        b=fxQyha4ynWRjA5BgZZ+IldO7619+PQ1ub02Qg1tH/DxxjYOhCO1d0eDannH+kOmrmN
         BsJzrBG9/PvQNdngl3Eg1bAuTarqMeyiMMPu86NlmRP8Znkw67rg2QPEoBxb3ahTfjVL
         Luc4uBk5zMV9eenfqEI0CQfRsM+DSbhWe35XJhg2XIIeUuBMPZGZg7gvNoIGnlM6BA+s
         ADq8PvPZ6bwgHG19J4A4lgvEXoKpikEJVAp8g6PDXi3T0LHSIhfxnrhbaazMffhIPJFh
         +1C33+pf5qADm3GKiJ9a0dDoOAkOyhl8N+8d/FE6TDXKq1nslRkgRvNIrvxhy85e3sMz
         vu5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740479115; x=1741083915;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fL1utdGcf1YtA95f8hT56+IP4cv4xhFtEjnPmOAPn/4=;
        b=qfFabkdHVxn5txfZOQ/3gA5lyF3nrll1/DQGXZE2Ioms9dyrXlVK+ueKZag871Uwls
         aDqJe70n5XNT1sRmoVH+X1236ksBLYUdwQgTl9s9vdjtZ/T1u0DoccqmPc6+GDlBTekH
         rQl5bex7SysOum2vtA8Iy6Mdn0mWuOohYmjISxKHTrvOnDeNMpvW1MnzHbxKyrt7hgwg
         yyW4VxSAm3ISDFl/DuR2DIagixK0KdiJW1k3fEwbahCn5Axan2LQv5bqOmSnT2w+qGy0
         50yrVPubEUvHGhvDUeHzYrvklw2GYewBx4+8X/sIlruduY+SwPhUoOao5Qv+sIh5LtAa
         DqgA==
X-Forwarded-Encrypted: i=1; AJvYcCUwcKON7XBRoO5ybRJQbIfl6MrYKiuh0+0W01KVBgdgS4MxhYRncu6T5ZVVJ7fRgalveYXe750baPw=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywdx7rpCrj2gBogJZop7r4mVaDRsty8xTlFaVpiZVJ7dMlPIExT
	7wCmzQR4vzL/BlUUQ/nSDptwbpXU5he1lAkwLECOMt3F6r7Mn1fv3qibPZs+2jc=
X-Gm-Gg: ASbGncvgcvMUJP8pOcAPA7SIwNyIRPzXe5CDm7U9fVoAVxJ0IhyOej37/uDW2cfwDVe
	veVnWimHl758oB+0MLcyLovXOoARxCjsfb0b+SNiA5F6997bia6Hr4qb1pfxpzlCq7vYKNja8iI
	9CUzjjepvXxHuuGDC0PSdADt/OLpazvUkcv5dPuYPcyGI/xJhElg7pOrWG4v07vR1K9xIczoDxg
	4yotH6981mnF7PBIgsfYU42xRV88tJolsJ6pkf78ytdYun8OvvZ2SARC2RXVKrOJnZf9SF9XVuY
	buKa6CxGgMiQ/vaB4Vfs3ojn4aw/P2ppbuDqKjU1ZheKWhthm8LXERU=
X-Google-Smtp-Source: AGHT+IErMe6m3KpS+bd9ATkr0LAKvrSAsFwWu1TrtsVyNtZVZP0CkVjhpXAHkOf3YaM0aC4noPAjLw==
X-Received: by 2002:a05:600c:5117:b0:439:8829:aa69 with SMTP id 5b1f17b1804b1-439aeb3556cmr143761965e9.17.1740479114445;
        Tue, 25 Feb 2025 02:25:14 -0800 (PST)
Received: from localhost (cst2-173-28.cust.vodafone.cz. [31.30.173.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd8e7108sm1810318f8f.69.2025.02.25.02.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 02:25:14 -0800 (PST)
Date: Tue, 25 Feb 2025 11:25:13 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Andrew Jones <andrew.jones@linux.dev>, kvm-riscv@lists.infradead.org, 
	atishp@rivosinc.com, jamestiotio@gmail.com
Subject: Re: [kvm-unit-tests PATCH 01/10] riscv: sbi: Mark known fwft
 failures as kfails
Message-ID: <20250225-e46d015c86d53c9a2dfc35ad@orel>
References: <20250221155533.123418-12-andrew.jones@linux.dev>
 <20250221155533.123418-13-andrew.jones@linux.dev>
 <1bc65c8e-4d36-4ed4-8f9e-b7a14c09c08a@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1bc65c8e-4d36-4ed4-8f9e-b7a14c09c08a@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_022516_819182_834BB79E 
X-CRM114-Status: GOOD (  22.80  )
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

On Tue, Feb 25, 2025 at 11:14:13AM +0100, Cl=E9ment L=E9ger wrote:
> =

> =

> On 21/02/2025 16:55, Andrew Jones wrote:
> > Until we fix opensbi mark these known failures as kfails so we can
> > pass CI.
> > =

> > Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
> > ---
> >  riscv/sbi-fwft.c | 15 ++++++++++++---
> >  1 file changed, 12 insertions(+), 3 deletions(-)
> > =

> > diff --git a/riscv/sbi-fwft.c b/riscv/sbi-fwft.c
> > index b10c147f22dd..19340d6bb48c 100644
> > --- a/riscv/sbi-fwft.c
> > +++ b/riscv/sbi-fwft.c
> > @@ -63,11 +63,17 @@ static void fwft_check_base(void)
> >  		struct sbiret ret;
> >  =

> >  		ret =3D fwft_get_raw(BIT(32));
> > -		sbiret_report_error(&ret, SBI_ERR_INVALID_PARAM,
> > +		if (ret.error =3D=3D 0)
> > +			report_kfail(true, false, "get feature with bit 32 set error: SBI_E=
RR_INVALID_PARAM");
> > +		else
> > +			sbiret_report_error(&ret, SBI_ERR_INVALID_PARAM,
> >  				    "get feature with bit 32 set error");
> =

> =

> Hey Andrew,
> =

> I'm actually a bit confused here. As raised by Anup, the spec states that:
> =

> "Every SBI function should prefer unsigned long as the data type. It
> keeps the specification simple and easily adaptable for all RISC-V ISA
> types. In case the data is defined as 32bit wide, higher privilege
> software must ensure that it only uses 32 bit data."
> =

> Does this means 64 bits value are truncated to 32 bits ?

Ah, yes. I had noticed that required truncation while doing some KVM fixes
and patch 9 of this series is even adding a test for it for SUSP. I just
didn't look closely enough at why this FWFT test was failing. The test
should get SBI_SUCCESS, as it does, but it should also check that
feature =3D BIT(32) behaves the same as features =3D 1.

Thanks,
drew

> =

> Thanks,
> =

> Cl=E9ment
> =

> >  =

> >  		ret =3D fwft_set_raw(BIT(32), 0, 0);
> > -		sbiret_report_error(&ret, SBI_ERR_INVALID_PARAM,
> > +		if (ret.error =3D=3D 0)
> > +			report_kfail(true, false, "set feature with bit 32 set error: SBI_E=
RR_INVALID_PARAM");
> > +		else
> > +			sbiret_report_error(&ret, SBI_ERR_INVALID_PARAM,
> >  				    "set feature with bit 32 set error");
> >  	}
> >  #endif
> > @@ -167,7 +173,10 @@ static void fwft_check_misaligned_exc_deleg(void)
> >  	ret =3D fwft_misaligned_exc_set(0, SBI_FWFT_SET_FLAG_LOCK);
> >  	sbiret_report_error(&ret, SBI_SUCCESS, "Set misaligned deleg feature =
value 0 and lock");
> >  	ret =3D fwft_misaligned_exc_set(1, 0);
> > -	sbiret_report_error(&ret, SBI_ERR_LOCKED,
> > +	if (ret.error =3D=3D SBI_ERR_DENIED)
> > +		report_kfail(true, false, "Set locked misaligned deleg feature to ne=
w value: SBI_ERR_LOCKED");
> > +	else
> > +		sbiret_report_error(&ret, SBI_ERR_LOCKED,
> >  			    "Set locked misaligned deleg feature to new value");
> >  	ret =3D fwft_misaligned_exc_get();
> >  	sbiret_report(&ret, SBI_SUCCESS, 0, "Get misaligned deleg locked valu=
e 0");
> =


-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
