Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6970CC021B1
	for <kvm-riscv@archiver.kernel.org>; Thu, 20 Feb 2025 16:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2AjGoBCx4KUUm6FffWinJ+OwBr8iu5g6oSdaKxsP2Nk=; b=YbbZ2DaTXHjCCK
	cnY0A/0hdtlfuAC+mF+k/Qtf5GOs1SIADEpxYAa36EUhZ44yB8HiTX5LfY/WWXtqI2sqqlvwUApmt
	bwSUh2FAQ6OK7kcCky3MI80U8MhqTZiMrz/N1w5J6u1aU7jmRiZKp1x72eT5vNqVpT88kq+uQDHna
	hmlt1/FHIECfVnwndcYIE5cvs3ToimE3sO6MzgOwjQ7nrg4iXHfZ+dCSazd4qi6xCc5/a9Ss29YVs
	tQWY+gmbQz0R6QH7A69EpupVx/9w/3H6Wl3SKgkXJbjuWfMDQ90VhG2cI36KM8uta/RHNbgMv4BD1
	ZUVXDo/jEvn5ltCu7LUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl8z3-00000001jHz-3t0v;
	Thu, 20 Feb 2025 16:01:05 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl8sb-00000001gxH-138q
	for kvm-riscv@lists.infradead.org;
	Thu, 20 Feb 2025 15:54:26 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-439a331d981so9544065e9.3
        for <kvm-riscv@lists.infradead.org>; Thu, 20 Feb 2025 07:54:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1740066863; x=1740671663; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NGNRf0ReiaPdK/EevU1+7Jg4AAbm107WpQnKn2mTvz0=;
        b=NqVQyJAZ80//fr75QczpQ3pQB3LB1TXdoJTfHgdZJSQhOLKbaUdDoI+khXctBBnhAm
         3jLllj1pj37HWAdNSRI4a5rCvDH2cr5HMOm28GyFIYI4iuuvRl0FwxYT2gfAzxUFBXI7
         xz3EROmWA0ml8b0XI0qaDuFP5J9P0LotHRlgouOS4kBAxW32QKyDc9KOyne0GsFa9qdG
         WygYSnrRFWTKl7CTyqOAPBYwmMEfnpLe6O1KKNzYrKRDbP/3JLskF7mzBBDO7UqnuOQI
         +HR7Fls3/BHPDUeQirqV2U3RSKwgMK36Fxq0g6tnAa/fotk5aC3S8aHCDtNIF6JeyQNY
         EWUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740066863; x=1740671663;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NGNRf0ReiaPdK/EevU1+7Jg4AAbm107WpQnKn2mTvz0=;
        b=mwOfjcO5bRvkGxGd+Tt2R7CtI7CfhiUw62m5rjJ7V2CS1iy0H+zbM6NNdCz2De74r4
         sSbkjNDzZLnlgg+nNtJhvmLZfJj7DF1Z47NqCtXRUieOw0r4eqn6nbq7NDKHPrSn+jjG
         4JxB+vKeaTzNPClxJYk+dRJKi3aKeAKK8UXZAefWRtU+04oJ0L6IchCPX4TinnyqXv+l
         357F4raMgFu+DUdEPLMCyi9dGY1E0mzvZMy4/qtTHtZR/gP6BBEjhOkJHXfBolIjZora
         2MM1AqhOZJKUmkqVgNbUm2WdTpgz0ikp21E6gO9XyI52+ImefNCyRy8tXlBl5Cgex2iP
         lnWQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/qU8AI4lLtmea/BioHYZ5nRr2CRs/LC6aYyF5b0txS0LpoUBrCoy28M1+BBI9tDcJjrCqFqaRDN0=@lists.infradead.org
X-Gm-Message-State: AOJu0YwwTX5l9eHc7/K2jcX9kq2qN6piUXIgAEpfkEo1ahNcz0T8dk3a
	ITDphMt+Qjbr1U93SwJZBbkVPaaEQQLsd0/49pDjolHNx1FJ/MqCRxDIyk/IC2Q=
X-Gm-Gg: ASbGnct0jOoSfsDBE+YvxTNVp+UlP6ZhKFfFm8NrUyOGjx87sdNnX1ycJVTjo2hYYwT
	WGNJlfzUKkI5N9BbwahxYPhSOPuVy6T4cZxLQLbXzpz5tWpFkx/lQeXVyykc/ISR+Jg23ygd96m
	p0Ed9gQNsMNSMb8Q5cOQguJw6KOcGn73rBgJhuJjeYSq9gS1IdWWLvk3YiFlxwTJde0V9+SKTu/
	4e7+7wc7a2KfY7uRx0KLHXBAbksgojau74He3Tg/5a6dK4OIemhtbra7H1dVOhEWxQSVE209JGm
	M/U=
X-Google-Smtp-Source: AGHT+IH4fqTjkvhr0HHpOydyGRkDW++RxVC/fTe8tk+RbOSjRT8wGHnhH2c8wiUThy0+JlbRpY5IRQ==
X-Received: by 2002:a05:600c:4691:b0:439:88bb:d02f with SMTP id 5b1f17b1804b1-43999d7563emr94560285e9.5.1740066863484;
        Thu, 20 Feb 2025 07:54:23 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::766e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d5e9esm21338889f8f.61.2025.02.20.07.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 07:54:22 -0800 (PST)
Date: Thu, 20 Feb 2025 16:54:22 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Chao Du <duchao@eswincomputing.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	anup@brainfault.org, atishp@atishpatra.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu
Subject: Re: [PATCH] RISC-V: KVM: Fix comments in
 kvm_riscv_vcpu_isa_disable_allowed
Message-ID: <20250220-69956156f8489f179d3ed97d@orel>
References: <20250220074905.29014-1-duchao@eswincomputing.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250220074905.29014-1-duchao@eswincomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_075425_291205_C5A62923 
X-CRM114-Status: GOOD (  18.85  )
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

On Thu, Feb 20, 2025 at 07:49:05AM +0000, Chao Du wrote:
> The comments for EXT_SVADE are opposite with the codes. Fix it to avoid
> confusion.
> 
> Signed-off-by: Chao Du <duchao@eswincomputing.com>
> ---
>  arch/riscv/kvm/vcpu_onereg.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
> index f6d27b59c641..6df41794e346 100644
> --- a/arch/riscv/kvm/vcpu_onereg.c
> +++ b/arch/riscv/kvm/vcpu_onereg.c
> @@ -203,7 +203,7 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
>  	case KVM_RISCV_ISA_EXT_SVADE:
>  		/*
>  		 * The henvcfg.ADUE is read-only zero if menvcfg.ADUE is zero.
> -		 * Svade is not allowed to disable when the platform use Svade.
> +		 * Svade is allowed to disable when the platform use Svade.
>  		 */

It was correct (but confusing) before this change. When
arch_has_hw_pte_young() returns true, that means we can use
SVADU (which is !SVADE). If we don't have SVADU, then we must
be using SVADE, and therefore can't disable it.

How about

/*
 * The henvcfg.ADUE is read-only zero if menvcfg.ADUE is zero.
 * Svade can't be disabled unless we support Svadu.
 */

Thanks,
drew

>  		return arch_has_hw_pte_young();
>  	default:
> -- 
> 2.34.1
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
