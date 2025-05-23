Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31F4BC54F2E
	for <kvm-riscv@archiver.kernel.org>; Fri, 23 May 2025 13:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ReOgdmCWjw9Efw1pAOTeQpepFZWIDJH9Akw9K18Q71I=; b=ckS3N4b2OMOjwU
	6pLCUPTBbftU94UW7fE3+9NQvvf8GYd++c840VhrMQ2YXAumzJN/H9qycAqCwZ2PhlU29VcwalpJ9
	517W8LKqT8yjXKMMZbokXLe/uzoXScr8H45F+vcKKurDpK7zNBNrbj2WKzCc8NUNVCtLpomHUStM1
	ImbL6eFjgJ3wLjohfHvSGRu0D2D1hm8CoKwJjrRmPi7eTQmtZyN3ubpNj4BRKJn97OTIC5U7xS5z+
	ORD/+IPDP4bdH0VMYHqFJXZUXu3J0md11Sy3opO2JdkvcpXxEl+nEa4Q/ULZKBxXZLRue2gqf73Hn
	STFpVEwWjhRJezBUFDCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uISYc-00000003yTt-3o6w;
	Fri, 23 May 2025 13:35:30 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uISUp-00000003xjW-31sa
	for kvm-riscv@lists.infradead.org;
	Fri, 23 May 2025 13:31:36 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3a361c8a830so1182308f8f.0
        for <kvm-riscv@lists.infradead.org>; Fri, 23 May 2025 06:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1748007094; x=1748611894; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sE7NSB29qsmfs0sI4wgf6B6ZQGe4IKQtX92E6yxep1o=;
        b=aWuxvYiguhPiVqddRe9ITBvF8r4rjy64XUYWh1yWPa+pKQKY99eSWcqPmH+DkM6bp6
         1wD21+cLj//1lQX/BZja0p0otlO+efKw3GfhEM5qvuTykBJanixNzRhXs97+doqV9buN
         rvlVvggYiDbnOrY7I9Xl7saxs8CvPvJkwOsyIgv3R0XZM5MpdUEU8sBpHNUfl4Y609wK
         SW3PFa9NqU6h9iCspWnQi4xQ+5qyr//+A8NuLMuZT0vfXcdR6jCUGNWyoleH/u1UWF1+
         iQORVQDYJkXzKJriJOHlxaDiew/xd+eFjln9kng8+9BpPvnYnFqC5cFtRP2Iw5wvN76o
         9FFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748007094; x=1748611894;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sE7NSB29qsmfs0sI4wgf6B6ZQGe4IKQtX92E6yxep1o=;
        b=aeGNu1yP0zWQWds7KEo/gf00NrL6FsAo3kL3vFJOcgAsBpeXcqEBaYDSlHPg9lnYUG
         M4GAcW5RpB+SuibznmwGiCrAsXf6zUFMHgSzR+xxY62J9vGZ9tlexwH1b216Nnea175I
         NR/AGf+jVEkPQuvAZRE6at10OkJAfbUo6qlz8vlAG6uxwAEfHUfYAcmeYhEk6ApXrMhk
         uVNlv1jE1gBj7x+k0NKs6+spMJXlenPCRKQdQyR28ESllGkRP+l31+KiRGIkuV270XU4
         vnin/dr90Zh102qo8frMlF1fM1ofL9Ik2iEelXv3xw+Yvq+kmstckjMbGkUHEdBEsz6S
         nGcw==
X-Forwarded-Encrypted: i=1; AJvYcCXi2rCzL+jKQvhUe8oOnoAqG9LKVtrtBsmpdbvV492vFghBLzqbsDaJpK1BalFuXwp+kgOHnteL/es=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8tb0ae2D+hHauQBZR/OHwrg91MZaFpGAjmKYAtOUfKNmRTicX
	b/xkaqWTo4H2vxk02BU/aPCCUCnfNulwcomaMmOFQUvzaeEtmiGlKQsEdOzlpHz4xjE=
X-Gm-Gg: ASbGncthZ4bkuZMaJkWdUj/eEoxq6YXS8oY+/Ph1Ay/xz95qYKxhX8ICI9yqlaQ/n13
	3e7GdlTh+Q5OPrf90XsbSc5IJLHmU0CFqDmum8URt7PWwyUDbVzSvmG3cAm5/jNu16ZElbdTv6O
	pwtMwuKPlM8CK58E0CaJIYhUcvF7rAc66Xbt7gWhn0Fz4CS6MU2GUR9hZzwSYxHqRi/+Psnerd4
	vMLd84nphuZH5sUJRbhXrwaXC/qUslsjxATdbkY4hoEGim9GZJFLuO2XToDpEZf5T/8sX/1TyIG
	iTqZA46TNRqWdZ7mKGjsjQ4sIXK505mFD9jETF2nWDilKBvtZy6Bu0dQJH8=
X-Google-Smtp-Source: AGHT+IH4B5YjATsLpzFQConVuBPC8YzXe6dS/7DO0gd92eFJugpX4BslSSwZcD/zqo2WMw5EUo7NzA==
X-Received: by 2002:a05:6000:400f:b0:39c:1401:6ede with SMTP id ffacd0b85a97d-3a4c2b3a659mr992493f8f.3.1748007094151;
        Fri, 23 May 2025 06:31:34 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:be84:d9ad:e5e6:f60b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca8d005sm27248141f8f.90.2025.05.23.06.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 06:31:33 -0700 (PDT)
Mime-Version: 1.0
Date: Fri, 23 May 2025 15:31:32 +0200
Message-Id: <DA3KSSN3MJW5.2CM40VEWBWDHQ@ventanamicro.com>
Subject: Re: [PATCH v3 9/9] RISC-V: KVM: Upgrade the supported SBI version
 to 3.0
Cc: <linux-riscv@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "Palmer Dabbelt" <palmer@rivosinc.com>, <kvm@vger.kernel.org>,
 <kvm-riscv@lists.infradead.org>, "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>
To: "Atish Patra" <atishp@rivosinc.com>, "Anup Patel" <anup@brainfault.org>,
 "Will Deacon" <will@kernel.org>, "Mark Rutland" <mark.rutland@arm.com>,
 "Paul Walmsley" <paul.walmsley@sifive.com>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Mayuresh Chitale" <mchitale@ventanamicro.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com>
 <20250522-pmu_event_info-v3-9-f7bba7fd9cfe@rivosinc.com>
In-Reply-To: <20250522-pmu_event_info-v3-9-f7bba7fd9cfe@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_063135_752550_DEE8D8A8 
X-CRM114-Status: UNSURE (   9.48  )
X-CRM114-Notice: Please train this message.
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

2025-05-22T12:03:43-07:00, Atish Patra <atishp@rivosinc.com>:
> Upgrade the SBI version to v3.0 so that corresponding features
> can be enabled in the guest.
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
> diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> -#define KVM_SBI_VERSION_MAJOR 2
> +#define KVM_SBI_VERSION_MAJOR 3

I think it's time to add versioning to KVM SBI implementation.
Userspace should be able to select the desired SBI version and KVM would
tell the guest that newer features are not supported.

We could somewhat get away with the userspace_sbi patch I posted,
because userspace would at least be in control of the SBI version, but
it would still be incorrect without a KVM enforcement, because a
misbehaving guest could use features that should not be supported.

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
