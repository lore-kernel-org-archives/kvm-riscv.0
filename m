Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9745AC36002
	for <kvm-riscv@archiver.kernel.org>; Mon, 24 Mar 2025 08:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iG05Gj9BH/N8Fywji2/phRN07rnsVGtu5N15How4S90=; b=z1hoWGv6okDIvu
	QFvfL+EQJolO87Dv08UbFSsQHfcdre+Lf2y0BKMv9KxFY0FBoicoVZsODcKSqz3FT3ECZ6uCOQ3wd
	YSaBcNxCgOBSXkJN67mtjMXkFymhsNuQp8btcsG97ZO5Jfn8d9EF2b9DMPJjHCbnGxM/2nQo4cfaI
	H0Ysm5dKCuTH2IYiCvoPCOgeV2k7LX9l360t70S2Rm9P4FHLZIgWcXGfXdyfoe4ORbE/q7xjnqGH5
	RZ287z6FrJnYHOpGHgv1BIpJjPVNWwGGm6Fnt3+MeuP1LH13wjK/9vs9Wj8JAH5iyehh2xZUAWd8U
	sY5Cc0bWSdZgelxCahYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twdKM-00000002bts-1Ysm;
	Mon, 24 Mar 2025 08:38:34 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twdKK-00000002bt6-0py9
	for kvm-riscv@lists.infradead.org;
	Mon, 24 Mar 2025 08:38:33 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43cf06eabdaso38023955e9.2
        for <kvm-riscv@lists.infradead.org>; Mon, 24 Mar 2025 01:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1742805510; x=1743410310; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZduTWk6Q/NfGLId+77FETKnLFu0VMYUFIa4ad6z5VWI=;
        b=WPvx+ol4adMFm/OqRXuNBKoy33y23z3whOSWKllKMG77GDQ75PAraI6Kp3h7t94CcD
         9k72S5I7LOXa78NZtrnvnLrRdhFfl48GOrzF6BOCXo11pSzf+hi4C/9TgO+uP25D5b7t
         sQi1kkaCV0oJ5nKcGZxExWlQ7e+Soi317njz0TAIZHcY1HcQs096+gI2XIj8mkalzG47
         WYReR4Y7CemvmDMobSq2qrIFOrofARVEw4DsPwGXeA34SgMTrAqrkm/JWQLjcd41DPMJ
         cfLWdSEEOk/xzzDPIuaPrUMtPlgFNm4zU8VSEOx4KGxdrb/qo5H07NqDhe79tuZlFFx3
         8rBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742805510; x=1743410310;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZduTWk6Q/NfGLId+77FETKnLFu0VMYUFIa4ad6z5VWI=;
        b=vGz3wy5srBIJX2owc0OrxdcHWb9ZDZHhTDPXI/4RuaOH0S6yb+WTBQsNus4lF3sU+Y
         sYD2Oh752709EqHCCWB+nG3GmvEXWXTgPrEBJUq1vHpaebiGXKm1oPQw3zU/w7aHytMA
         huwuDcXXMRbEBEcK3APB2VzVAZ2SCV1fZ+EquEtPZB9bcN8f5QOC6rVdbKUuI4Ji66qD
         tk9Rxzq/x7A52iToECxCDrS0DxnKVtr3WevTqg7GyCNKm6ZJX/OMgken3FM11DmWJo2H
         nnUdQt9p5D1e7q2p5DGP16DhUNF+jqGUbpnnc/eHCOXuDYeYnGVCONSMZRjC2qbG4X6T
         lfiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcfCmPz/kjTG96t09+iJYo9AeLHBung/019Xd6y3vvDHei8/9S+x63nYWR3NFCgTJTLqWk4jNNpRQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YwTqkEOHlrd6d2BCrjCISXkwJj54ck8eNT56NHIh34Te+BoR2b/
	tAEDFIYZ17N1zmoaPnLFynYNUogEoFLJBGSKeAmPVG6L6PsLLddKZVWbVWLPd2iHAtf25nm/Q0y
	D
X-Gm-Gg: ASbGncugHC790yDxNu5GlIN7hmiBwu9I6ZyIi/pLJilj34ENfkyKm7qlrJ+kDacLunS
	phw6gRtuKnYZSctbGNlInE5hVt5HS2KTOSvQK9pdDtOVDSDib31mltbUcMv6iwY7uAZrr9gcdPG
	ZreHUmEib3PClvqJ6YetFXxK8CTzeIY9Glyy0WdzBkfj1RnOrJOYIhT4CtAoHYhb/2aaBtTwH/5
	Sf4ktr5rvcJCtO1fzgG/+LBNaYpLDdr1oevxzp3U3ZQQ+snuWj9HbXWc4miHxdcszDWD693GH6V
	6c9cjwMTDOM7u1sdxFU8fqvf7YSYGcu819k4QtPQ22+EzQ2PDNc=
X-Google-Smtp-Source: AGHT+IFfByT9kX5BtGIwa/tzkqtkM/NyfD6bNVjUzK/mR93IFLpzCJaTWVkJNz1ak36WHMSNC7s0NA==
X-Received: by 2002:a05:600c:3d8c:b0:43c:f3e4:d6f7 with SMTP id 5b1f17b1804b1-43d50a58731mr108138165e9.31.1742805510206;
        Mon, 24 Mar 2025 01:38:30 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:8c7e:e8c0:8299:1c31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fd9e96bsm114934995e9.25.2025.03.24.01.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 01:38:29 -0700 (PDT)
Date: Mon, 24 Mar 2025 09:38:29 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH v4 02/18] riscv: sbi: add new SBI error mappings
Message-ID: <20250324-5d1d09fc9e50d2276ba56b6f@orel>
References: <20250317170625.1142870-1-cleger@rivosinc.com>
 <20250317170625.1142870-3-cleger@rivosinc.com>
 <20250322-cce038c88db88dd119a49846@orel>
 <779c137d-5030-4212-b957-3d2620448ea9@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <779c137d-5030-4212-b957-3d2620448ea9@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_013832_239700_6890584F 
X-CRM114-Status: GOOD (  22.48  )
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

On Mon, Mar 24, 2025 at 09:29:33AM +0100, Cl=E9ment L=E9ger wrote:
> =

> =

> On 22/03/2025 13:06, Andrew Jones wrote:
> > On Mon, Mar 17, 2025 at 06:06:08PM +0100, Cl=E9ment L=E9ger wrote:
> >> A few new errors have been added with SBI V3.0, maps them as close as
> >> possible to errno values.
> >>
> >> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> >> ---
> >>  arch/riscv/include/asm/sbi.h | 9 +++++++++
> >>  1 file changed, 9 insertions(+)
> >>
> >> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi=
.h
> >> index bb077d0c912f..d11d22717b49 100644
> >> --- a/arch/riscv/include/asm/sbi.h
> >> +++ b/arch/riscv/include/asm/sbi.h
> >> @@ -536,11 +536,20 @@ static inline int sbi_err_map_linux_errno(int er=
r)
> >>  	case SBI_SUCCESS:
> >>  		return 0;
> >>  	case SBI_ERR_DENIED:
> >> +	case SBI_ERR_DENIED_LOCKED:
> >>  		return -EPERM;
> >>  	case SBI_ERR_INVALID_PARAM:
> >> +	case SBI_ERR_INVALID_STATE:
> >> +	case SBI_ERR_BAD_RANGE:
> >>  		return -EINVAL;
> >>  	case SBI_ERR_INVALID_ADDRESS:
> >>  		return -EFAULT;
> >> +	case SBI_ERR_NO_SHMEM:
> >> +		return -ENOMEM;
> >> +	case SBI_ERR_TIMEOUT:
> >> +		return -ETIME;
> >> +	case SBI_ERR_IO:
> >> +		return -EIO;
> >>  	case SBI_ERR_NOT_SUPPORTED:
> >>  	case SBI_ERR_FAILURE:
> >>  	default:
> >> -- =

> >> 2.47.2
> >>
> > =

> > I'm not a huge fan sbi_err_map_linux_errno() since the mappings seem a =
bit
> > arbitrary, but if we're going to do it, then these look pretty good to =
me.
> > Only other thought I had was E2BIG for bad-range, but nah...

Actually, I just recalled that there is an ERANGE, which would probably be
a better match for bad-range than EINVAL, but I'm not sure it matters much
anyway since this function doesn't promise 1-to-1 mappings.

Thanks,
drew

> =

> Yeah I also think some mappings are a bit odd even though I skimmed
> through the whole errno list to find the best possible mappings. I'd be
> happy to find something better though.
> =

> Thanks,
> =

> Cl=E9ment
> =

> > =

> > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> > =

> > Thanks,
> > drew
> =


-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
