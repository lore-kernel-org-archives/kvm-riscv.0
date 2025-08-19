Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32374CA0EF7
	for <kvm-riscv@archiver.kernel.org>; Tue, 19 Aug 2025 00:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/qJ4ip7rgXg0arg+TiCFDrmfu4SZMd5tEMUbt1ifl7I=; b=0E2y2BFomMHN58
	l8BRwsw7OEFAELQObOZB1mMWgWkRKNX9hVkx5LtHZsCOkv2f2f5yoLXRqbVJb9aaCt50ypifb9ABm
	7WQYANX0CK+UhC8rPu8ICGMbnpzGNkHArlUQ0k/c4QV06dN7tHmVcoxxZ5K7d3VF7sQfMuOhUewC/
	knu0Dyg2F6y60p+7H09idbfN11pG+Oq/Yb/0oAUNeJPpZgKYLZTjtWZusUwK8QVd7767NQOhwE5Sf
	ysSpjcNkt1PaK/SLthsJtB7yHWrVOngIwQIRZn+HVoJysjU0KyOiRCrr+24SAYYcBFmlwbv5JueXS
	PtwIjvTClnC1A08qsuuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoA9q-00000008zsj-43Am;
	Tue, 19 Aug 2025 00:24:58 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoA5u-00000008zco-39te
	for kvm-riscv@lists.infradead.org;
	Tue, 19 Aug 2025 00:20:55 +0000
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-70a9f5d4d97so50603836d6.3
        for <kvm-riscv@lists.infradead.org>; Mon, 18 Aug 2025 17:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755562853; x=1756167653; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wwm+TVO3IE31QnUKkVxKkaPevhmZdZk1VLFBsWnyn6o=;
        b=O4e2Ynrex0LzKJXL4E8hUDBw4bJRW4bjlKSmph9fKZXbHl+2WNrTVg2Na0BSAxm339
         gSQuvZVYCMFbVcE+cUCorRxzd+5P5tAX9ASN/ST01cbaJOGeSNG+pFoVOUt/4c1YNW+i
         rtTOO1D+GoPBcLCXaZf9Fp07IIFG6UfzX3QKC/MFqtguUOphnyx/FQqE+jdMfscwASlr
         /DfOZAsRYYcEo5DCincwQ2d0xWTbhLaGDheRZYWlxJ5Y7PU7NUzPEP/Yqc/uTFVLQMNV
         ACXaI09Owjl96ptO/1dy007g7XPu1/R9tQcuPbso7hqW2TmWU0bJV2qJdh+Jb2xM1VAt
         ulJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755562853; x=1756167653;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wwm+TVO3IE31QnUKkVxKkaPevhmZdZk1VLFBsWnyn6o=;
        b=oWSkMv3XpbnWGfFYkJDQk8fXd2h58gZ5MZTV3v3vxZuCdIOCz/uCiDySJZ/NlTucSK
         IlYk52pSXLLxpoN+K1zRg+fA/ZbpdkHdBxRwASaRH2dDUqgT4sSd6jSVk4g6nyDDlAdV
         Pza/CFX7DY84rvmVYBt6cf1cR7m69dUYCm7af/3jouKBaPjTQLjTZrkQuOlYsXyuDOU4
         Dbhgf6PhPgpFCL4YL6LBbiOLWBfpQXXLl5D3RE2MILf30OpxzTLgYIGnsdDjuL3grOGL
         65x7kt6mMmNKkqCsUzmLcqjSHfpZl4HV/uq+wu7O7rw/ZkuD1+/w6U9aTc88iIuA1Mdx
         x6PA==
X-Forwarded-Encrypted: i=1; AJvYcCXTPCapDBQDt/0STjkSRKr/hlC7RhBmDWWhp3b+4z17pugnCnypDOA9uGq1tCAit7dzurWh4yryOc4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzhv4NLHDbc+qS5vWtgmn1jV6cFxvpVOuDrjarETLNeg1zgbUgO
	BejM6Zh8yeYtfXjU6dpoYDfEWQxwzrHmYsbgZ+OtY/eES9XS/r2TawN2U9F/Wg4O0XA=
X-Gm-Gg: ASbGncsmGY9HDd0vjKsOb2GhK+yFxGhtYXGfPDhXs1+ZAmFvP5a9kXi74rk6fZ1H9gi
	x9PETN9eBartRJy63+zM9v1B7QnSa+GK9dFepJ7sYGNfSFAXJ+FYFO9KhOCkPhVdVBVK7S4QmSY
	AXuPAu63/Uhe1i1PxkR/O9m/eikjUKUDCedwFNcziWT5wXZuU/kSxTtiru4/i58i0afpvc7Y8Iv
	CYajIDReGdXYSAKJk9l//DcONXHSMF7NgAwQoUbt6pSb5kduH4UeSEiJeIQO+riu/t83/skEybW
	xi0XCTNzTfIe4Jj7nGkODZlIY942XH616mdzhFcbEyJe5NteSutXiJB7ntAah8H4J8u2F2C7iqB
	WKD4cHQ0rnql4BzDASkyOsQs=
X-Google-Smtp-Source: AGHT+IGUgrllTL7Y8fMaxyBiG7OjFs5eQq62OO4Qg66bHPzC0RUUqBKv3WgzNhUUD2BQ4eiTpGJ75A==
X-Received: by 2002:a05:6214:2b0f:b0:707:7694:4604 with SMTP id 6a1803df08f44-70c2b6f4f67mr8160386d6.30.1755562853487;
        Mon, 18 Aug 2025 17:20:53 -0700 (PDT)
Received: from localhost ([173.23.183.85])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70ba92f89e7sm60632856d6.45.2025.08.18.17.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 17:20:53 -0700 (PDT)
Date: Mon, 18 Aug 2025 19:20:52 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: dayss1224@gmail.com
Cc: kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atish.patra@linux.dev>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Peter Zijlstra <peterz@infradead.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>
Subject: Re: [PATCH v2 0/3] KVM: riscv: selftests: Enable supported test cases
Message-ID: <20250818-be8ccd84eebf62dafa95caa3@orel>
References: <cover.1754308799.git.dayss1224@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1754308799.git.dayss1224@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_172054_798302_F0990036 
X-CRM114-Status: GOOD (  15.58  )
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

On Thu, Aug 07, 2025 at 10:59:27PM +0800, dayss1224@gmail.com wrote:
> From: Dong Yang <dayss1224@gmail.com>
> 
> Add supported KVM test cases and fix the compilation dependencies.
> ---
> Changes in v2:
> - Delete some repeat KVM test cases on riscv
> - Add missing headers to fix the build for new RISC-V KVM selftests
> 
> Dong Yang (1):
>   KVM: riscv: selftests: Add missing headers for new testcases
> 
> Quan Zhou (2):
>   KVM: riscv: selftests: Add common supported test cases
>   KVM: riscv: selftests: Use the existing RISCV_FENCE macro in
>     `rseq-riscv.h`
> 
>  tools/testing/selftests/kvm/Makefile.kvm              | 6 ++++++
>  tools/testing/selftests/kvm/include/riscv/processor.h | 2 ++
>  tools/testing/selftests/rseq/rseq-riscv.h             | 3 +--
>  3 files changed, 9 insertions(+), 2 deletions(-)
>

The two fix patches need to come before the Makefile patch in order to
avoid breaking the build.

Thanks,
drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
