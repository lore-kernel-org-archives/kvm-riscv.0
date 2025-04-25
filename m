Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EFE5C369D3
	for <kvm-riscv@archiver.kernel.org>; Fri, 25 Apr 2025 15:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZjBiyMn6Ffx4wyuZXtdXiNBefe8IH2GM40iwKHYdjek=; b=h6hgFBOv0cuCg4
	CikGo//IKneHBzavEc7ZdpSIKnPbcyjk5/4/K4hvjtyoy0NMZiCyd8Q4oVgAI58tCVnFNKi7EKZO2
	JaBVTfUHnhiR0cjN+P4HLqxG5Mv7eKuGbDHymHlSrSJevv1WrSKJWBwmgu4CtNzWqUczCpquoGsJb
	Pb3JX8i8v2gPDKY6ssEAjWbfogqJOPS8Y4RHra3nJwctp75zrW9j1WHnkXjCoLyJ4RzpU6KBvwbmp
	MnkZjkIWO7OWrBbBVU7iA56YKQ3glZW9OF7McuIGdBFoAMXiGnxvKMplzAqF9KR4+snovysV3ZdYL
	t9qdCYkXDvVZgoQp7jXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8L5C-0000000041e-1QO0;
	Fri, 25 Apr 2025 15:35:18 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8JRm-0000000HLWg-38Fn
	for kvm-riscv@lists.infradead.org;
	Fri, 25 Apr 2025 13:50:32 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so15201255e9.0
        for <kvm-riscv@lists.infradead.org>; Fri, 25 Apr 2025 06:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745589029; x=1746193829; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZUA/m6gOa249NNOmchovOHq5LELqOzlt/ubdwJUo+cU=;
        b=lUE+QO8QdSAbs0YucSWpoLu0Bn8qprjYgZx2jQjEFok/s/DkWnjr4OjAYUMY6cXNp9
         LFkD8PhyyshWuwsBgd96k39K4mBNPGWLKsoFSiDzUPnKVqBVANwbOcOO4G69T3Cd+xBF
         AlPKJph8CpxDkw/55HSiWF9yCPOZVExNvGfoxSxl7U/8zvb9EfP5uZ4n7vFR4GTrxfeO
         NSxw7kt92NiykhrGeEYdUM2OwSQXLqKLvlXyZ8pd433q+RFQ050RRozTJhlSH/pGMmAi
         yb0w2UezlErmQNzkEEFUnZeD8kMWLgiCH9xSgSHj0Rl4tHq+Jz68Zt6eCZW0rfDxFvTL
         R1bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745589029; x=1746193829;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZUA/m6gOa249NNOmchovOHq5LELqOzlt/ubdwJUo+cU=;
        b=S0QSsOyIUyRriirQhwEEFTCiI2RT6Rtld2zp07o60lZ0rPavP3+z0HX0riKYg7iyRt
         aoZRJHysfWlWeVRSk4I+5Era3Lk+ImyP4F46ZXCZVoa/QPLD2yUJZkRAz3NVJYClFVxl
         2eWNwV9ZqQl9jW/kYSY4kiSOitqxTQWalXjCnfnzywgx18FsfhR/oL4uM2toldr1d6bC
         jKOMS5FMlNnyvUl+LHmYVYq5qhkR0xiiZUVgUhnPkcuCFT9MhUXozuyz+XPKXkz02AgK
         ThXT9e6wzuBF1eLyWMee2sSSOr7fWQU/9glELooM1pHLGB3VXncYp5M50UOKyz6dbzOm
         HhfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmh8UG7iwMAxvgXG8Bn6irCViZSsKtj5voeB3abPtg9KJT8t1sowrgg22LgiLE8BdTMOh7he1mIe0=@lists.infradead.org
X-Gm-Message-State: AOJu0YwlTbeK6On8amuegI98fd2vCeLbY6vPBQX+ZiIlVzMPGAdH8naM
	ozidG54jziKFuJsHDjsyikTDUSgvLPwiNP2vDyOof8KWjNnG8yFNSgN0Zd48tVs=
X-Gm-Gg: ASbGncutq/LcFCs7kpcaKtuqSCvQnK7QPJxaPZLnm/kDF8mbegHX2zadl6Y9sbEGhLD
	rV+O3f81tN/uQPxGXKO6VRP/gLle4xP2nrQA/unOfsQcazVWD4BHlUtNyqhU/D+NyWx6JBc0Af1
	/yTWm0pFivqoOzanH0bXpOh6PhSeTI2mZsrhkDGnRup8qIbjDtRcm8UFs/FT66L8QuvXCkDU9Wa
	ucXyX/PqmMIM3NMk/R75xSrrksI+alnwqgdQKrg4T59nbY+3YzjdgdWtyq/lg+BCJS9KUGz+DxU
	AXipYI+DkTs5Ldws1Z67WxxC4B8V
X-Google-Smtp-Source: AGHT+IF/LMdkzYLBWPyT5ztxJyzb+GPhFh3GxsY5b8ixWQQMljvmNbliBGV7ZjWkl9GsiErnAoI9/g==
X-Received: by 2002:a05:600c:1f82:b0:43d:934:ea97 with SMTP id 5b1f17b1804b1-440a66ab23bmr18288315e9.27.1745589028834;
        Fri, 25 Apr 2025 06:50:28 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::f716])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073c8cab5sm2480265f8f.10.2025.04.25.06.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 06:50:28 -0700 (PDT)
Date: Fri, 25 Apr 2025 15:50:27 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] KVM: riscv: selftests: Add stval to exception
 handling
Message-ID: <20250425-dc44cb547ab5e2f994c94e80@orel>
References: <20250324-kvm_selftest_improve-v1-0-583620219d4f@rivosinc.com>
 <20250324-kvm_selftest_improve-v1-1-583620219d4f@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250324-kvm_selftest_improve-v1-1-583620219d4f@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_065030_785233_39C4C637 
X-CRM114-Status: GOOD (  17.34  )
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

On Mon, Mar 24, 2025 at 05:40:29PM -0700, Atish Patra wrote:
> Save stval during exception handling so that it can be decoded to
> figure out the details of exception type.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  tools/testing/selftests/kvm/include/riscv/processor.h | 1 +
>  tools/testing/selftests/kvm/lib/riscv/handlers.S      | 2 ++
>  2 files changed, 3 insertions(+)
> 
> diff --git a/tools/testing/selftests/kvm/include/riscv/processor.h b/tools/testing/selftests/kvm/include/riscv/processor.h
> index 5f389166338c..f4a7d64fbe9a 100644
> --- a/tools/testing/selftests/kvm/include/riscv/processor.h
> +++ b/tools/testing/selftests/kvm/include/riscv/processor.h
> @@ -95,6 +95,7 @@ struct ex_regs {
>  	unsigned long epc;
>  	unsigned long status;
>  	unsigned long cause;
> +	unsigned long stval;
>  };
>  
>  #define NR_VECTORS  2
> diff --git a/tools/testing/selftests/kvm/lib/riscv/handlers.S b/tools/testing/selftests/kvm/lib/riscv/handlers.S
> index aa0abd3f35bb..2884c1e8939b 100644
> --- a/tools/testing/selftests/kvm/lib/riscv/handlers.S
> +++ b/tools/testing/selftests/kvm/lib/riscv/handlers.S
> @@ -45,9 +45,11 @@
>  	csrr  s0, CSR_SEPC
>  	csrr  s1, CSR_SSTATUS
>  	csrr  s2, CSR_SCAUSE
> +	csrr  s3, CSR_STVAL
>  	sd    s0, 248(sp)
>  	sd    s1, 256(sp)
>  	sd    s2, 264(sp)
> +	sd    s3, 272(sp)

We can't add stval without also changing how much stack we allocate at the
top of this macro, but since we need to keep sp 16-byte aligned in order
to call C code (route_exception()) we'll need to decrement -8*36, not
-8*35. Or, we could just switch struct ex_regs to be the kernel's struct
pt_regs which has 36 unsigned longs. The 'badaddr' member is for stval and
the additional long is orig_a0.

>  .endm
>  
>  .macro restore_context

I guess we should restore stval too.

Thanks,
drew

> 
> -- 
> 2.43.0
> 
> 
> -- 
> kvm-riscv mailing list
> kvm-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
