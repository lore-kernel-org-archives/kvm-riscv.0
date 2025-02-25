Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75BDFC021B2
	for <kvm-riscv@archiver.kernel.org>; Tue, 25 Feb 2025 16:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8PyW78ggyanwO6xg3Oc3pMsa3jRTYqumZf1Uu8+qwkM=; b=UQTsCAVTq34vbl
	QQrhrpzY9jAIE4DnXbjhlesX7G+s+DQFKN0TZcVwo48Pm4Lin7QeMO+IGsPtMDvHBd1FZU1yroxDD
	h/QiZYSUX6xXQqQ7vOKRb4CRIsUx8lT/5xZenbLe+y2lEjESoP2wbaxOjxOyrIclZHKPe4kbU/ybh
	B5eR3+MUFXk+esGTaE1hgv+1QCpb9yyb7cOi/vU41iAp4E+T6APgOlWidtSYNHxsAmh7LeL9DT7Rt
	9PMlUWR5M6uegYoiIFyq69MEosjye9elkV65EsJ97NvzzfwsYgrU5jMnrEH/ZhLSLpYCacpuAqY/P
	CQX/XM6+ISv5LSUZDr7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmy2C-00000000NRw-3sy6;
	Tue, 25 Feb 2025 16:43:52 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmwvV-000000005Cq-26Qy
	for kvm-riscv@lists.infradead.org;
	Tue, 25 Feb 2025 15:32:54 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4397dff185fso50424745e9.2
        for <kvm-riscv@lists.infradead.org>; Tue, 25 Feb 2025 07:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1740497572; x=1741102372; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gnH5e9Lma+Kmpu0f2X9COQpkiyn0hR0X1KyRrynBxqw=;
        b=H7NIv5fJj6RflPS2d5OeHhag9Tyv5xNj57QTS24lN5nvt2YG3D09N6d3LcThpCh6t/
         9ejEHAlwkLpPs5SXubzULXQsvzEKgXBc0TBB2GlNie7xvOcoWXXEKQzV5V4QyRMimwCa
         TdGD7ZyKMDg7MxD5/yKZRjBsIurR/Ppr/WzACzwnE1UdgpcsI8BCAEFLvwEpb4PAPwJe
         aC+xEMobfjrrrPsESsrcbPeoGwYx2nLueWx0WGLNQhSJkDqlpECVwL4mlQH4LfeVaYZ9
         HaZBss5QHUc0541xEQZuX/uYgOpSOcBiuqEJZ1PH2zsCkmMTybnvk8mIQXmztcgcQw7D
         pUUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740497572; x=1741102372;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gnH5e9Lma+Kmpu0f2X9COQpkiyn0hR0X1KyRrynBxqw=;
        b=Zu+lR2a4jI+tE4HEBA4u8ufxdrLjx4rkMCQvS8mfItmDNsgDwrtrYby+Zac+9BdTwt
         PB0gjOp4GvK/QLEc1Q/2Jr9CDahGfLmWc0AY6Iji5zy60LEbrLQPUtrglSohbWGNjrRB
         mtb/Fv/ozmVWAKdDe986/N6vsxYXGCnBhnoWr8F6fJjKkyGX8cUQ8wk6uI9BpwIHrRGE
         9vYCPtGp1+bRRBKlp5tiQIBQCpm/q3vXxK+dk0VgFnZEbMNsn0Zou61v3nad56/htYCN
         HDqqerWg6yZCrWMyDmWuKpvzGSiJuU3U0yaV9s8Uzh6pbQIniCXoYCQnVBBrRnf7jJra
         fEqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHcdUU21mHWO33lcSBiIsNfQluptZSqozb4OybGZsuH8z8OiO0VhtKUmK3Dr6iZjcp3IE0Ty1sXzM=@lists.infradead.org
X-Gm-Message-State: AOJu0YyKd492RZCtXOQFNGyLGGE57hwkhirEqatuKjfKFkjAii92HP66
	WGBB3Mfi+oMfHMZZ8riaQUPb7g+dwP2fPKodDJ0ZM6E573rS3WUprBkhoWt/vj0=
X-Gm-Gg: ASbGncv4X18MQ5czv+8EfK6+2g0mgxCPMppSb32/3ywWdS1gGYSiqUjAmqhavGk8oi5
	Ez4LZJB6tEP2Pux2dqvjmV84mLYdsHpLbGG9xoOMdgXVUAjgXyOCvZmZmYCt0NdmbJgDNh9KxiN
	tv0LhCX6nneZzRVrcMjBFP3JyfA20uczQjHHfuL7nR1nS3+JyUWt6Yvl05qfCWFdqN6TxYetA/Z
	U0sbjgQeVGvoAlNl5IkOHS5s8jZHeZo6hw/5iZYfXsRMPiglP4zvZXm2NKap/ThJCHkXX3zDSak
	fvNABEpKe7VOvA==
X-Google-Smtp-Source: AGHT+IE/10UNiDPWwtBBMEDEZV7Gh//geUwWPo2SV1VAb7jdOIPm2ysV0VQ74HMs2qTKqO6a/d5jbg==
X-Received: by 2002:a05:600c:3c9f:b0:439:34dd:c3cc with SMTP id 5b1f17b1804b1-439ae2197d1mr127217955e9.22.1740497571656;
        Tue, 25 Feb 2025 07:32:51 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::766e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd8829cesm2645507f8f.49.2025.02.25.07.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 07:32:51 -0800 (PST)
Date: Tue, 25 Feb 2025 16:32:50 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Andrew Jones <andrew.jones@linux.dev>, kvm-riscv@lists.infradead.org, 
	atishp@rivosinc.com, jamestiotio@gmail.com
Subject: Re: [kvm-unit-tests PATCH 01/10] riscv: sbi: Mark known fwft
 failures as kfails
Message-ID: <20250225-e2ac6882b637786a5712e24e@orel>
References: <20250221155533.123418-12-andrew.jones@linux.dev>
 <20250221155533.123418-13-andrew.jones@linux.dev>
 <1bc65c8e-4d36-4ed4-8f9e-b7a14c09c08a@rivosinc.com>
 <20250225-e46d015c86d53c9a2dfc35ad@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250225-e46d015c86d53c9a2dfc35ad@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_073253_544994_9C29B47B 
X-CRM114-Status: GOOD (  26.44  )
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

On Tue, Feb 25, 2025 at 11:25:13AM +0100, Andrew Jones wrote:
> On Tue, Feb 25, 2025 at 11:14:13AM +0100, Cl=E9ment L=E9ger wrote:
> > =

> > =

> > On 21/02/2025 16:55, Andrew Jones wrote:
> > > Until we fix opensbi mark these known failures as kfails so we can
> > > pass CI.
> > > =

> > > Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
> > > ---
> > >  riscv/sbi-fwft.c | 15 ++++++++++++---
> > >  1 file changed, 12 insertions(+), 3 deletions(-)
> > > =

> > > diff --git a/riscv/sbi-fwft.c b/riscv/sbi-fwft.c
> > > index b10c147f22dd..19340d6bb48c 100644
> > > --- a/riscv/sbi-fwft.c
> > > +++ b/riscv/sbi-fwft.c
> > > @@ -63,11 +63,17 @@ static void fwft_check_base(void)
> > >  		struct sbiret ret;
> > >  =

> > >  		ret =3D fwft_get_raw(BIT(32));
> > > -		sbiret_report_error(&ret, SBI_ERR_INVALID_PARAM,
> > > +		if (ret.error =3D=3D 0)
> > > +			report_kfail(true, false, "get feature with bit 32 set error: SBI=
_ERR_INVALID_PARAM");
> > > +		else
> > > +			sbiret_report_error(&ret, SBI_ERR_INVALID_PARAM,
> > >  				    "get feature with bit 32 set error");
> > =

> > =

> > Hey Andrew,
> > =

> > I'm actually a bit confused here. As raised by Anup, the spec states th=
at:
> > =

> > "Every SBI function should prefer unsigned long as the data type. It
> > keeps the specification simple and easily adaptable for all RISC-V ISA
> > types. In case the data is defined as 32bit wide, higher privilege
> > software must ensure that it only uses 32 bit data."
> > =

> > Does this means 64 bits value are truncated to 32 bits ?
> =

> Ah, yes. I had noticed that required truncation while doing some KVM fixes
> and patch 9 of this series is even adding a test for it for SUSP. I just
> didn't look closely enough at why this FWFT test was failing. The test
> should get SBI_SUCCESS, as it does, but it should also check that
> feature =3D BIT(32) behaves the same as features =3D 1.

Eh, '...as feature =3D 0 (MISALIGNED_EXC_DELEG)'. For now, I think we should
just drop the test, though, because we need a feature that, when present,
always allows enable/disable in order to test for a change in behavior.
While we may be able to toggle 0/1 for MISALIGNED_EXC_DELEG, we can't
count on traps getting enabled. I'll add ADUE tests and do a truncated
feature ID test for it.

Thanks,
drew

-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
