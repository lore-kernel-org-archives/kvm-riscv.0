Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F303E77188
	for <kvm-riscv@archiver.kernel.org>; Mon,  6 Jan 2025 13:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3qwbIrzRgXGjaTdvB509PZV5FWXyVKN6Uz/nDG916dM=; b=YINYA7igOncIGp
	3z/2AvscuZgUdPW2pjsAsz6oCn8sss0e8o/SCcZPbCJRZ3umdbGq8taeTZwg6DRLsNmEfCzIxW0p6
	l1k67ikEGJjOOk1hgmmY4urHLvZB2tVGJlcPfjKs9N11mUbqQSZ4fsljHoGfbt73JaMeuWQzIL9b3
	nqAmfnc/uq8ueG/xNlYZZrqQZpY9YAhCbRcBHC2rtWfBwAGvRmkLY0tp7aCBQNJyVJjArTZHSgb5I
	7ufpG2aH4szZ/rJEzxE5RiLxkwa/N3zLtiKJ4QlHST/LX0YCLaDc8EzTyYzUZw7QvTyZhGhktlmk9
	Dg/Q4GyQNfKBMiKzSsaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUnZe-00000001TAm-1AMM;
	Mon, 06 Jan 2025 13:55:18 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUnZc-00000001TAG-0fjL
	for kvm-riscv@lists.infradead.org;
	Mon, 06 Jan 2025 13:55:17 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3862ca8e0bbso10998226f8f.0
        for <kvm-riscv@lists.infradead.org>; Mon, 06 Jan 2025 05:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1736171714; x=1736776514; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+PtiW3OqUvs8CS+s0qiIMYN9i+4vbOFKlpELD3NbBK0=;
        b=C7Y9VG3chrOlW387uieoeKdEVV5TeMBxsY/GygwneDCgeqtCeLVxR7kl+0ordDsHAF
         beg4taquvdc5AoKUwus/5t1vFtB58r9byuv2lyz3/H5pFy5WQgFPGsidtcgiLrlY/k+K
         Z6rWv/f2a6Sz1k2gFp0GX8V5LCsixOG0mDwVWoaO12mkzVpoELRF6U3kwqyOOCxu2jK2
         78ew8cBOHbazzxxktY19Mjj0ysEl9qXJ6UDVzSPxN41rnuEyONux+wPfPdr2acXPjuay
         rTFUT6CoFACN05AocLUy6ZPfxucAnGyD0oNDQ+CsrfXm9jufB8Olx9f45TyoDe0FmCib
         /YQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736171714; x=1736776514;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+PtiW3OqUvs8CS+s0qiIMYN9i+4vbOFKlpELD3NbBK0=;
        b=Rgs+BE0pXKSarIpeFkc6iIvnNnERXMHfi2MFMu8YpHOTioGBmtu5tjhA/En6jiuUbS
         Ie3IsaKoF5uiapsWOQq9nxfOeTaID5gEMP8Mw1TIMntSbfGyD7EwD2Uu/0pniRvi86BF
         s6Yh17QezIMnQPxNReBz5Fa/fMTJFoTO9mX5Y135UUpStadvfAh5WArvA3CUfR8WEKZm
         JUh8DAzu1XE4K311diJ76WUi0r0CiWWEIwEWc+usRYnboCPDEQxHmkkYJU4n1J554V+g
         iBpwpCSb/Cyw8XQ49N0rJwlrnbu1X6AEB4LNn/Or/34AzAgtgZjz5LmY+8u7ok7YpfGN
         IyxA==
X-Forwarded-Encrypted: i=1; AJvYcCUq17hC3GXPDSuX5bYkBHJ4qPqqkDsNZjfSYZrs4cuktLviepIpiHmc8zrHXbrn5sB5i3NYF8WL8mg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7kh8MsKOqM+Mc6N8EeLD+Ps5cJC2IKaTCh71FEDjEroI74HRS
	4pbZ6iO9n1Cwh4ZT0qXKh9gGABgioHV6rIhoe1TKxyH4rGo/U1F50Fmjeo0/Y+4=
X-Gm-Gg: ASbGnctqL2Q1Oifdn4PhlaPOHUXagxn/+oTI7aYNpWEKiqVGxet59gMZVbJSedM/59p
	L5LLY0rl9iZrOSxWUCz+JCBEyE40v+yVyfLLwRyZjoYJMW/+Q32MR3n/zT0S0S/xf2yhbHwz2Qx
	LeeVwXkfCNAnIKYPmSlh8v47GgRSwhCgviXwOplxWVKXVss9nHpXvlWaz7t14SbJ6YEvfcSoP5s
	eU/FaSodlXu7H9R3DCCyjEQrZRzu2B7R2iqxWK66snHQVuC5YHpLamqiUZ6DRyojeGAJS0q3szD
	lYqyHuGeADpFjKr2LmVJPGibG4doWfzHVlKe+JKAvw==
X-Google-Smtp-Source: AGHT+IFQZoFcZKpFUlkMbtP7vcuqEf3/c5Y2lSqVd0PkAXjcMdYLjO4gBwMH3anWvN0fYtFvBl8CtQ==
X-Received: by 2002:adf:a445:0:b0:38a:2b39:9205 with SMTP id ffacd0b85a97d-38a2b3993dfmr38095742f8f.33.1736171713973;
        Mon, 06 Jan 2025 05:55:13 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c832a90sm47386140f8f.28.2025.01.06.05.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 05:55:13 -0800 (PST)
Date: Mon, 6 Jan 2025 14:55:12 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	Anup Patel <apatel@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>
Subject: Re: [kvm-unit-tests PATCH v4 0/5] riscv: add SBI SSE extension tests
Message-ID: <20250106-daa8e0da7de4e560f17b4d38@orel>
References: <20241125162200.1630845-1-cleger@rivosinc.com>
 <ada1c6da-d91c-4177-9173-9a7cdb0af2fb@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ada1c6da-d91c-4177-9173-9a7cdb0af2fb@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_055516_210385_77198BBA 
X-CRM114-Status: GOOD (  19.05  )
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

On Mon, Jan 06, 2025 at 11:11:42AM +0100, Cl=E9ment L=E9ger wrote:
> Gentle ping ?

Thanks for the reminder. I'll try to get to it this week.

drew

> =

> Thanks,
> =

> Cl=E9ment
> =

> On 25/11/2024 17:21, Cl=E9ment L=E9ger wrote:
> > This series adds an individual test for SBI SSE extension as well as
> > needed infrastructure for SSE support. It also adds test specific
> > asm-offsets generation to use custom OFFSET and DEFINE from the test
> > directory.
> > =

> > ---
> > =

> > V4:
> >  - Fix typo sbi_ext_ss_fid -> sbi_ext_sse_fid
> >  - Add proper asm-offset generation for tests
> >  - Move SSE specific file from lib/riscv to riscv/
> > =

> > V3:
> >  - Add -deps variable for test specific dependencies
> >  - Fix formatting errors/typo in sbi.h
> >  - Add missing double trap event
> >  - Alphabetize sbi-sse.c includes
> >  - Fix a6 content after unmasking event
> >  - Add SSE HART_MASK/UNMASK test
> >  - Use mv instead of move
> >  - move sbi_check_sse() definition in sbi.c
> >  - Remove sbi_sse test from unitests.cfg
> > =

> > V2:
> >  - Rebased on origin/master and integrate it into sbi.c tests
> > =

> > Cl=E9ment L=E9ger (5):
> >   kbuild: allow multiple asm-offsets file to be generated
> >   riscv: use asm-offsets to generate SBI_EXT_HSM values
> >   riscv: Add "-deps" handling for tests
> >   riscv: lib: Add SBI SSE extension definitions
> >   riscv: sbi: Add SSE extension tests
> > =

> >  scripts/asm-offsets.mak  |   22 +-
> >  riscv/Makefile           |   10 +-
> >  lib/riscv/asm/csr.h      |    2 +
> >  lib/riscv/asm/sbi.h      |   83 +++
> >  riscv/sbi-tests.h        |   12 +
> >  riscv/sbi-asm.S          |   96 +++-
> >  riscv/asm-offsets-test.c |   19 +
> >  riscv/sbi-sse.c          | 1043 ++++++++++++++++++++++++++++++++++++++
> >  riscv/sbi.c              |    3 +
> >  riscv/.gitignore         |    1 +
> >  10 files changed, 1278 insertions(+), 13 deletions(-)
> >  create mode 100644 riscv/asm-offsets-test.c
> >  create mode 100644 riscv/sbi-sse.c
> >  create mode 100644 riscv/.gitignore
> > =

> =


-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
