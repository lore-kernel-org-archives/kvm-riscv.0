Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B52CC021BE
	for <kvm-riscv@archiver.kernel.org>; Thu, 27 Feb 2025 08:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lVjdlyl841nQC0Ia2e3rYBd4VW4h/dMqkT1L06YjbQg=; b=vOX0pr9p/pPUrW
	AvJAQASmq21ZAr+4sXxUsGgGWkMSjQ23ZEcJYD1g3JNTJf3RKhN3Y6pYYL8hifdUybFnaVWxB4+7R
	53PmuMYkD44E+lPpsV1tipaewrIFv3adg3PqIMar0+QF9NnCvjxhpqoyzW6p9MKdWjtXvdjazAooU
	aNIttDXJJCTIPyxjvppWfeWwP+RnLrflDYI6nQKymM8vyFFxXryhYuLtAy2FHHtoPFvyf6cUVIw/3
	NbPts9xrRuiNJB++5cC8fB7xVv8NtmQ2hCqPdRBORya9EjuuxOzspp4p+uXSWZqY8s0BwLuODbakL
	KnCRGOHMxDbtJXMAxPNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnZW6-00000006kUk-1WzV;
	Thu, 27 Feb 2025 08:45:14 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnZVD-00000006kEC-1O2d
	for kvm-riscv@lists.infradead.org;
	Thu, 27 Feb 2025 08:44:20 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-439946a49e1so4156295e9.0
        for <kvm-riscv@lists.infradead.org>; Thu, 27 Feb 2025 00:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1740645858; x=1741250658; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0eD4WdY2Ar0Qpt9c3iLvWQtqo0+f9AP00jRPqQ8lu4I=;
        b=OKT6GhxdWfPDuOXDV1TN7i351aXz77WEsvwcWksK2W5k2S2/XppnhiloYuWwPxUk6f
         Q7se1dHHgP9JajrfEFn9uOLc8SFL80hGUseyk6CFAOTPyEdgHgcSdfAR19REjaLNBmfD
         WGO8sSXVpkgy2nN6Pu/kSvpxOnscmR7LL5pIAFyaoSXH9gvrfJOOTOrXlotRK5l3PMfr
         I3xqvWEAGYuTnkhh00IPeMWlAjgry0GkHwHocG+g0MayY2aJVgnkaPTowHSNUa5ZTHjy
         viZv//gaN0Or8ZWLfzqVybbQsbZaTEFmcbr4rzwBbeKHfkn4f8eR5ikSPR5po1XYmpyw
         kfXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740645858; x=1741250658;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0eD4WdY2Ar0Qpt9c3iLvWQtqo0+f9AP00jRPqQ8lu4I=;
        b=vP5S7U3eWH7RUDLJZCQQG76VNsDxwXfJ/f3KWXw9nCseRCjf2+PT7YymMiB6UfKH3y
         O7JEru6VOTkH6HF9LnZ+MYL3eqF8QHexgeJ1bT7yeXNcVvkjTkebk1V55hEdwFyiDXgU
         qtpKULvkpj2RyRzFDtsRjnmqtD5ehWH2zGxypKylsJc3oRekBMaHTXIw7GIAdtfxFQUj
         QHURXw+UgyX7JYjQFZuDEcMhiGLBVcmdyx1pIEny6oInBXXmLbxB5YleHtR6wRHIsVjj
         5NuxTghCfxYzUwyWwbwfcfZ9by9bMNfXXfN8Lneo6UABgjqdbm78zGCqCZTF7q5ED5lr
         9t6Q==
X-Forwarded-Encrypted: i=1; AJvYcCX1X684v0wvYF1EFgh+t9LNWI4m9jQhpHs2HeDyVNEy2NVG4N5TTCDG7HXsKV5KbrgfGXlYBJNNbJQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7wiMCsQY6+talLoYyQFLDnMXQ8j8rh//iAdLaQsuKAsolr8YD
	GATV0ExTg90Z5ecF2FP7wSCNlPBj5MhVkZYEHzgmIf4Nqqb6aXjg+frOj+C000c=
X-Gm-Gg: ASbGncsJVQRsPHOYicrEVV9jmnyoW5auDK8NFYlMtRgqDvmpaLc8HUS6SOzOLmQyjtK
	e92SUw1p7uBSCPvmbKaNXfdI16ybSPkGup2btCss5DMpTLS5p+L6HK04nV9QbVqe8m9Pmnfg8WJ
	IomlGlQxMPcf1K6aFUbW3S0GrObWJIXxsxCfF12Qvpq7hW0VIvqRt+ZvDZxz3bkfhnj3v+2jCnK
	E+YepW4SCaHhAFpEOr1MZgOEoZSy33qEy2aySsFjoc7PGtnV2vXgRM8aQ9VMMFx5HQIjf/iwAqp
	gjnYkmGMrwrGIg==
X-Google-Smtp-Source: AGHT+IG7ml0QUrxxm1q148UuaevZWwyImW/BG/iHf4sSOi4FAdGUGP1loq2o5+xFJijpyPDy5kgSvA==
X-Received: by 2002:a05:600c:3c86:b0:439:9377:fa29 with SMTP id 5b1f17b1804b1-43ab903fe5bmr54754285e9.31.1740645857622;
        Thu, 27 Feb 2025 00:44:17 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::8cf0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43b736f990esm15612155e9.5.2025.02.27.00.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 00:44:16 -0800 (PST)
Date: Thu, 27 Feb 2025 09:44:15 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 2/4] KVM: riscv: selftests: Do not start the counter in
 the overflow handler
Message-ID: <20250227-3799414d0651c86f6a815046@orel>
References: <20250226-kvm_pmu_improve-v1-0-74c058c2bf6d@rivosinc.com>
 <20250226-kvm_pmu_improve-v1-2-74c058c2bf6d@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250226-kvm_pmu_improve-v1-2-74c058c2bf6d@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_004419_374421_3E415C46 
X-CRM114-Status: GOOD (  19.17  )
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

On Wed, Feb 26, 2025 at 12:25:04PM -0800, Atish Patra wrote:
> There is no need to start the counter in the overflow handler as we
> intend to trigger precise number of LCOFI interrupts through these
> tests. The overflow irq handler has already stopped the counter. As
> a result, the stop call from the test function may return already
> supported error which is fine as well.
  ^ stopped

> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  tools/testing/selftests/kvm/riscv/sbi_pmu_test.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
> index f45c0ecc902d..284bc80193bd 100644
> --- a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
> +++ b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
> @@ -118,8 +118,8 @@ static void stop_counter(unsigned long counter, unsigned long stop_flags)
>  
>  	ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_STOP, counter, 1, stop_flags,
>  			0, 0, 0);
> -	__GUEST_ASSERT(ret.error == 0, "Unable to stop counter %ld error %ld\n",
> -			       counter, ret.error);
> +	__GUEST_ASSERT(ret.error == 0 || ret.error == SBI_ERR_ALREADY_STOPPED,
> +		       "Unable to stop counter %ld error %ld\n", counter, ret.error);
>  }
>  
>  static void guest_illegal_exception_handler(struct ex_regs *regs)
> @@ -137,7 +137,6 @@ static void guest_irq_handler(struct ex_regs *regs)
>  	unsigned int irq_num = regs->cause & ~CAUSE_IRQ_FLAG;
>  	struct riscv_pmu_snapshot_data *snapshot_data = snapshot_gva;
>  	unsigned long overflown_mask;
> -	unsigned long counter_val = 0;
>  
>  	/* Validate that we are in the correct irq handler */
>  	GUEST_ASSERT_EQ(irq_num, IRQ_PMU_OVF);
> @@ -151,10 +150,6 @@ static void guest_irq_handler(struct ex_regs *regs)
>  	GUEST_ASSERT(overflown_mask & 0x01);
>  
>  	WRITE_ONCE(vcpu_shared_irq_count, vcpu_shared_irq_count+1);
> -
> -	counter_val = READ_ONCE(snapshot_data->ctr_values[0]);
> -	/* Now start the counter to mimick the real driver behavior */
> -	start_counter(counter_in_use, SBI_PMU_START_FLAG_SET_INIT_VALUE, counter_val);
>  }
>  
>  static unsigned long get_counter_index(unsigned long cbase, unsigned long cmask,
> 
> -- 
> 2.43.0
>

Other than the commit message,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
