Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43692CAC597
	for <kvm-riscv@archiver.kernel.org>; Mon, 15 Sep 2025 15:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NRzcXap/087pLc8/Bq/nZuyc+PeWlaqHJg4JuX/7x2A=; b=OMghsVGCi3P9yw
	I+vJsLu0O/14zruwYVEjaiOTq7zQXKrtOtS2EskzBMILmOWHXGhu8B1HzjvAbdE0Bv1kUmfYNL0No
	F/i3zEgMMfSoDdF/9noPea6pF6MkP4htFbjuW3uQGf/fFxlEYbUx0SG/8yWrgBFNe7KQv8UUcGiYt
	+SiLWumP7b0WXU6F7HOLZBv03aurWxZOlSyNQa+TJRGNqtqpKVH+8Z2Z6eSCUOCUT0w7Av2NXnHHE
	1zoBFWifrgOSn8x7qcJP2Fy/cmCwm5jeyjAX6MreAWkh2uk29HJMGBLW7IdhKga5vFZT9l+GgB35m
	X9UKmDwI/4sigt3X3pKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyB6S-00000004wOY-3iIW;
	Mon, 15 Sep 2025 15:26:52 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyB6Q-00000004wNg-1B5Y
	for kvm-riscv@lists.infradead.org;
	Mon, 15 Sep 2025 15:26:51 +0000
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-4240111d446so17149155ab.3
        for <kvm-riscv@lists.infradead.org>; Mon, 15 Sep 2025 08:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1757950009; x=1758554809; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lgIK+urtilm1qOsjSmDUUjKbzrkdpZTbpLIEbKtk/E8=;
        b=CSa1YaI82JYaeZTHdzAsMWGNla4LbHY7/2QkPnMwKy/Agp2WHrBo6o6dPL1ODmjrwc
         fUhbFmBWhzXbYreyv9F+5lMq4dXkF2G7Nk8blPRYvvgOhgzbCF0Gtj3nHowavkvH1k9G
         mBmE+SBjq+EjzVhCx0dCJWAvdFxZKUvshA2+nvEBl2p2LoJS4cMMPobEhRprxVRsPe3L
         mUOSAZtSDZPTA1YK9Huyuyw2mJDDwlHRVp9Cn7X9/iY+4RQDdFr18FZALLmErtZamOJM
         8DNwF8PX6XlM6lNyCOUmE5pm2k/OIcAVIKNdnIOeZcpeiS5vseXDWEgzWphD8Ytnh4fm
         tpPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757950009; x=1758554809;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lgIK+urtilm1qOsjSmDUUjKbzrkdpZTbpLIEbKtk/E8=;
        b=Xs8i4mzCgOOcV1TShyZeCU/9nhvhnCbag4Qyx1QIJaZhaHGwciGgrMhO3ximBVQJN4
         uerkuLlzGTnKVFppEVSq43wzAiLonc9qM5JEgL4jyG/cIPA7H4OehWyWsMT+Q0zjfo30
         4Bz5on/zsyw3lD6WIE8YhA6aYe6drtJPxSjo0VookConPjMHK1MEHinxB0hGEbPKPAX2
         Sbt2AFzkqnaBvz9m/RBz+Tqy96gbqkvuPMxWmWjf6zqsMyn7ZJDYtv2bBxXK09qHv6T3
         H7IjqVuLMm1staNnwGGzCU3X7XvYN6AnlMOoz78HgGCR/HFBjQ/cBs1iPkJpqWhU1knv
         gNlw==
X-Forwarded-Encrypted: i=1; AJvYcCXekJX60inNYOnc9cgPm5vYoIK4jTyw4SyPMkbc0ayHWJLV/bEBAH/YjyUwb87oeUiwpa45jpDKWbY=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywckb7Cpc25Od8+SLtsI9dA2BNA8qrtA/yz4e4epBg2K8iWutUF
	1nTX2RcyJ5Sw0+Rjnl4f6KkV+oo3laJO+GA2RMYfs88uDxQojPcFguU5jnZk8JiJY8s=
X-Gm-Gg: ASbGncvyopTIv71Hxqefu7Y/E1bTNlo7SrCraWzWf1zZxf0fTU4FzHEUYz5P2a5IeRc
	QCpX5/vtIEMiGySSnznoD5yr2g37nFsK6iROpnWQKZV2mbyi0bl2eDV9tbcw9AeO05w1NcVV4Sf
	tVOdT6x+8U3PP61qhP3TvIzrjNyHTVseB9Sv+A7OMqFzih4HBtzjsBPd8CavR/2CnEjHsXjFDII
	cqGyoDgqMZY9fu+l7uBhLIGB4T+h3IwjpWaG5LFSjX1rH0vmuzxFuUkyGyonjPmgRo+JgHI03la
	YeWj2n9It1ct1Mvb4qH0V6XAdgwccdz+okpQotMfsGTDKx/YT1lOos9NnfDeT7RWRTt/g339QUJ
	IxwUgT5Bm1vSvoRd1SzFVh8KDBh3m3dBpQfw=
X-Google-Smtp-Source: AGHT+IGp645TMnXX5YrOG2zVq4VnjBtkYnO7RTUiSqJt6Cj1uUCLMRmiK6QUARht6yH+1otNnwE4xA==
X-Received: by 2002:a05:6e02:1805:b0:415:fe45:3dfe with SMTP id e9e14a558f8ab-4209d7e0f1bmr156060435ab.3.1757950008836;
        Mon, 15 Sep 2025 08:26:48 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-511f3067b89sm4770679173.38.2025.09.15.08.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 08:26:48 -0700 (PDT)
Date: Mon, 15 Sep 2025 10:26:47 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
	kvm-riscv@lists.infradead.org, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH] RISC-V: KVM: Fix SBI_FWFT_POINTER_MASKING_PMLEN algorithm
Message-ID: <20250915-ed7932a34b8d58c2f9bdc4ab@orel>
References: <20250915053431.1910941-1-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250915053431.1910941-1-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_082650_324943_2ABB14CF 
X-CRM114-Status: GOOD (  22.66  )
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

On Sun, Sep 14, 2025 at 10:34:20PM -0700, Samuel Holland wrote:
> The implementation of SBI_FWFT_POINTER_MASKING_PMLEN from commit
> aa04d131b88b ("RISC-V: KVM: Add support for SBI_FWFT_POINTER_MASKING_PMLEN")
> was based on a draft of the SBI 3.0 specification, and is not compliant
> with the ratified version.
> 
> Update the algorithm to be compliant. Specifically, do not fall back to
> a pointer masking mode with a larger PMLEN if the mode with the
> requested PMLEN is unsupported by the hardware.
> 
> Fixes: aa04d131b88b ("RISC-V: KVM: Add support for SBI_FWFT_POINTER_MASKING_PMLEN")
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
> I saw that the RFC version of this patch already made it into
> riscv_kvm_queue, but it needs an update for ratified SBI 3.0. Feel free
> to squash this into the original commit, or I can send a replacement v2
> patch if you prefer.
> 
>  arch/riscv/kvm/vcpu_sbi_fwft.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/riscv/kvm/vcpu_sbi_fwft.c b/arch/riscv/kvm/vcpu_sbi_fwft.c
> index cacb3d4410a54..62cc9c3d57599 100644
> --- a/arch/riscv/kvm/vcpu_sbi_fwft.c
> +++ b/arch/riscv/kvm/vcpu_sbi_fwft.c
> @@ -160,14 +160,23 @@ static long kvm_sbi_fwft_set_pointer_masking_pmlen(struct kvm_vcpu *vcpu,
>  	struct kvm_sbi_fwft *fwft = vcpu_to_fwft(vcpu);
>  	unsigned long pmm;
>  
> -	if (value == 0)
> +	switch (value) {
> +	case 0:
>  		pmm = ENVCFG_PMM_PMLEN_0;
> -	else if (value <= 7 && fwft->have_vs_pmlen_7)
> +		break;
> +	case 7:
> +		if (!fwft->have_vs_pmlen_7)
> +			return SBI_ERR_INVALID_PARAM;
>  		pmm = ENVCFG_PMM_PMLEN_7;
> -	else if (value <= 16 && fwft->have_vs_pmlen_16)
> +		break;
> +	case 16:
> +		if (!fwft->have_vs_pmlen_16)
> +			return SBI_ERR_INVALID_PARAM;
>  		pmm = ENVCFG_PMM_PMLEN_16;
> -	else
> +		break;
> +	default:
>  		return SBI_ERR_INVALID_PARAM;
> +	}
>  
>  	vcpu->arch.cfg.henvcfg &= ~ENVCFG_PMM;
>  	vcpu->arch.cfg.henvcfg |= pmm;
> -- 
> 2.47.2
> 
> base-commit: 7835b892d1d9f52fb61537757aa446fb44984215
> branch: up/kvm-fwft-pmlen
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
