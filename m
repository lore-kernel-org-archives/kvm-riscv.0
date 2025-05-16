Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E01CBC3ABD8
	for <kvm-riscv@archiver.kernel.org>; Fri, 16 May 2025 09:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z3Gcdao2uXiXt/5/8RGWVJppjw0BN1l3Z6DfxSgaFGc=; b=3xypt8iVeVSRdG
	6c/92xzwMu18awkQH/CoPCZfNCtzCaVh5aPFuZHikg5i7+GTBwn/fASx8kPPcwe2atVCovZMJC2xo
	BO6VNLoM/DG30CFAE4W3lvaP0EhtS7mwTXnGMgezeX65W+Ve1lKh76rSEX7lya/P0vCW92MRyA1H4
	WGUm7y5rTkWxpxgvYHjw5n7yJ3hdVdBV3sGPy5EwBr2ltoQzPGOFAJ4w58p2Icz/8FfUGWYEwkInQ
	nX0NhwXfw0fzKk/x/r4DbEdi0NRKQlmuMIB8z1pVYAsAq+fcAl3B0LR+TrLf29++csGN6jKQI3bIO
	ur8g/M5LOVdGY25703pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFrpr-000000034Hf-2Fg6;
	Fri, 16 May 2025 09:58:35 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFrny-000000033w4-370h
	for kvm-riscv@lists.infradead.org;
	Fri, 16 May 2025 09:56:40 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-acbb85ce788so379971466b.3
        for <kvm-riscv@lists.infradead.org>; Fri, 16 May 2025 02:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1747389397; x=1747994197; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ti4ZqP+Hl0JDcB2DFZd59wj7uwh2SBcukM1irTJ/QT8=;
        b=YIRQEk3OKTMn5R1eGEIYEm69RGCQ1/mpFnAUupyclnLffIa0hCeDgbEKtR7/5WuoyA
         EPUqS/xpNeZWtnv33cD3Sm9wnc6fAQqvwM6/7j8YXl73mvvQXc0NCUIkjF8yzvz4VHvO
         TsEUEgNiRNHEVuiJz9mtL0mdGZGKmoD1dl5jRTyqJQH86+ZojFclY+3wlyCAjj1i65iZ
         lbIjCcKHkUBDDBb1t21CvDtjNvlWp4qR0c8s7xUAxfXY5A6BmYiaBYzi3VHcBWK8ggEv
         f+Ow4LOrZFEsliq5Dc6iuHREeV7tHHufUPRp44pwA2luQo+5CimUM0OLRoZ/igzmymnq
         r+Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747389397; x=1747994197;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ti4ZqP+Hl0JDcB2DFZd59wj7uwh2SBcukM1irTJ/QT8=;
        b=Bl3C7H+kYiG2ozskXZEn265YzY8ZsHSQVWxsjWfkItOM0z2JaoCvJMZlA2owkeHUTA
         KTzvFq+2k7W0oOCvsG8/JnQYhwsfl8WtZk+zVm3eGaYCMfyIi28qOLCtnnnUCVHR0K25
         knHuq36lbaXsPMS9ItmAIzZSEq1dUT53Hvg6uv9VPIzj1V+3j4u9oVF1A4rGwh9z3iaX
         MeupmTixrUEAtqsVJQuSeIAzEGzqdsqZRrqPyV9AmTqzmcx/3TnFS+j8Jq6eYowsvFW7
         yG2KkmDqy6YFIubCtCzhXFZNGxKJemf1efNSpDRYNs0D/ONRu31VYwJeSUelJBWPOzvo
         PSSw==
X-Gm-Message-State: AOJu0YykrSFOQ48RkE0tDBb/FUe/HDnyOjbFWUd6vP8LY+G2MxT7Mz+T
	0N6S9MydCExSNsonJwhHsohwCdeNSBBtQL8P9AfjRnDZauTbeI0fAjIpYNAKHxrK9XLTT+aeHc6
	F80ray6eo8A==
X-Gm-Gg: ASbGncu1tNkKTBHylQsbZEzcMb6WHSPQ5/SkaN4ZtLyN1HaR4GytW2jYWb4oHNMWv86
	CB9E3AaXMtnu+rBFtO8hqGkBdq55BGKCgU6cCikv2KEn+yjWwmZT+L3c1vjs6w7/CushLlu8iwr
	w83ASz7+itPsPs8wxOtl5Vj7OV3X/H1oyR02MBs1WcV/qKs8TtOWPJ9WEGR9qFp6VQya+qqCse6
	JNws5tnAjBTYYruLb3hq1AYR9HbtBA7w/IsSojG6NiqVFXZYiLxwnGf3SxSHLdBwHYxMchib563
	U5waQSUmQ00tz77IloYW+JSoVNXpM7iLae+DQ3Hn7Ly+hF36nKdrK4cxd5GFleZnC8lh
X-Google-Smtp-Source: AGHT+IFh2zAJl1Uj5Dr32GIK/RqZ9T0owi1RiR8KLA1E0llsHrNCCqszm3h/QZEbyvFvfkdXsmjKfg==
X-Received: by 2002:a17:907:9624:b0:ad2:4da6:f573 with SMTP id a640c23a62f3a-ad52d5ba810mr300923366b.41.1747389396719;
        Fri, 16 May 2025 02:56:36 -0700 (PDT)
Received: from ?IPv6:::1? ([2a00:11b1:101e:447e:2959:9e3d:ac05:c19d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d490789sm127955866b.130.2025.05.16.02.56.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 02:56:36 -0700 (PDT)
Date: Fri, 16 May 2025 11:56:31 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm-riscv@lists.infradead.org, Atish Patra <atishp@rivosinc.com>,
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>
CC: kvm@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] RISC-V: KVM: Remove scounteren initialization
In-Reply-To: <20250515-fix_scounteren_vs-v3-1-729dc088943e@rivosinc.com>
References: <20250515-fix_scounteren_vs-v3-1-729dc088943e@rivosinc.com>
Message-ID: <C74B29B0-FB1F-4E67-AFDF-FAD7C86FB329@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_025638_782407_C7495B85 
X-CRM114-Status: UNSURE (   9.79  )
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

On May 16, 2025 1:11:18 AM GMT+02:00, Atish Patra <atishp@rivosinc.com> wrote:
>Scounteren CSR controls the direct access the hpmcounters and cycle/
>instret/time from the userspace. It's the supervisor's responsibility
>to set it up correctly for it's user space. They hypervisor doesn't
>need to decide the policy on behalf of the supervisor.
>
>Signed-off-by: Atish Patra <atishp@rivosinc.com>
>---
>Changes in v3:
>- Removed the redundant declaration 
>- Link to v2: https://lore.kernel.org/r/20250515-fix_scounteren_vs-v2-1-1fd8dc0693e8@rivosinc.com
>
>Changes in v2:
>- Remove the scounteren initialization instead of just setting the TM bit. 
>- Link to v1: https://lore.kernel.org/r/20250513-fix_scounteren_vs-v1-1-c1f52af93c79@rivosinc.com
>---
> arch/riscv/kvm/vcpu.c | 4 ----
> 1 file changed, 4 deletions(-)
>
>diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
>index 60d684c76c58..9bfaae9a11ea 100644
>--- a/arch/riscv/kvm/vcpu.c
>+++ b/arch/riscv/kvm/vcpu.c
>@@ -111,7 +111,6 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
> {
> 	int rc;
> 	struct kvm_cpu_context *cntx;
>-	struct kvm_vcpu_csr *reset_csr = &vcpu->arch.guest_reset_csr;
> 
> 	spin_lock_init(&vcpu->arch.mp_state_lock);
> 
>@@ -146,9 +145,6 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
> 	if (kvm_riscv_vcpu_alloc_vector_context(vcpu, cntx))
> 		return -ENOMEM;
> 
>-	/* By default, make CY, TM, and IR counters accessible in VU mode */
>-	reset_csr->scounteren = 0x7;
>-
> 	/* Setup VCPU timer */
> 	kvm_riscv_vcpu_timer_init(vcpu);
> 
>
>---
>base-commit: 01f95500a162fca88cefab9ed64ceded5afabc12
>change-id: 20250513-fix_scounteren_vs-fdd86255c7b7
>--
>Regards,
>Atish patra
>
>

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
