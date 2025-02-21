Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C1C1C021AA
	for <kvm-riscv@archiver.kernel.org>; Fri, 21 Feb 2025 11:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yW1dp+kpHTPPdJnl+CdnCyhD4L1OXbE1GrJTJ90P5f8=; b=lNrgKHbAJRw/bd
	bexAl/jmuGjX2aTDqWY6jcS0NXm+GGKhC8UWv6X2GqWvJxXv3WS81eJXwcAdZFOhjCafofzoPLFJF
	w1KcMMgBYMl5rnkTwjY3qN8J2sj+Kx7VOsJlI+nU2R2513At3f8G+dhN6JKwh6sUXHAuV7onQz0XH
	MY4IJgOsmKA6Bv0iqnBMEnrXCZnVNdWelDuTi4D9CqDU/pwoYg1SPfTHBHzvLEY9nNa2YhB1RDekc
	XCMAPEyZ4MF8i3F+rsp4gAzDtXGGsK1gbUsNDdnkHdy08tSljPEgByIPvXNzKxTpCzhKb0+aH+Mq8
	/dcp9MwE6/yMkJJSKdgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlR23-00000005JCB-3rJd;
	Fri, 21 Feb 2025 11:17:23 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlQwL-00000005I7R-0wiQ
	for kvm-riscv@lists.infradead.org;
	Fri, 21 Feb 2025 11:11:30 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43948021a45so17147335e9.1
        for <kvm-riscv@lists.infradead.org>; Fri, 21 Feb 2025 03:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1740136287; x=1740741087; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jSsWiZSoq00eYWyXg0OJO1m3DP0gspy/2ZFYEnCczbE=;
        b=Zdfq0b/A6UfZOxKZfXgkXNA2qKDf2lAWWw4NmaB/5kv2vYEzVnixXSx9Jbwk2Y5w5H
         wIIxlKIrHJKVe50u8AuTOoP4ot+YicnH3TpCmYFljsEjZqWqTNCByQIURsrq/ElafAZW
         vEgrp3vnoy9+8NaF3gKAQnjdBC2qru6isQLgKP6L7cNZ8uyvJPV43jAFfppayrbVT5sE
         xHcF84ozQ/WMNfVWEW5HD9EylNpc+xTDcya53xnQSdIoSmiywQLvVH3eoSF6jIrT6xkd
         K2lCDfPkwx5pUDjx6gwioB6N+heDYrPyIXe5RhACVMpgH4iiWh6fUREaw3KSscn34Q8G
         WxxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740136287; x=1740741087;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jSsWiZSoq00eYWyXg0OJO1m3DP0gspy/2ZFYEnCczbE=;
        b=Spiu57nK9EwXGAWYgE5z/1Xqh8PduTVZht0MjHFN/DV2oEkA7TBVIqKxCqWGTOgusU
         suWI0TTi9eYKrnJohoRR5qld4PGVVrgGPUtm8jtKUTeZ1fbqoDW51VD16b9hHgEvhVPo
         4OZuCmXztQQPJ29hYnXJGhtG79f0xsH1c+lmCOLUxuylFaDMqbiEb3ZwZVleP8YaTs3A
         8YvRd+92XLwMiaOYqZd4M+dbxyx1fAR8I+0BR7dTUB1wEEE3Rm83J93x3QL4R+q6hFqL
         8+kEb+oNQufjIK6hfB8G2nQcB7jBofWqRS6VmFY5AMLjXJqZIqYPGyCLMn3Wsqk3GMOR
         4Wsg==
X-Forwarded-Encrypted: i=1; AJvYcCXJywHc8q5wWCLOvMoD0gOOpOVYh93eHD7tMjfhSpoR/wcqKXAeKnObH0NoJU1V6K6vtdw6JTKp3Ls=@lists.infradead.org
X-Gm-Message-State: AOJu0YxdGWKKlrlxu34hur4SYvBnnFPH5XAaFlCm7X6C0ACh+9RzvgSI
	PQIHTWVyhnwV2cJCIc1MetSScHmkACdH/GLiNpjRRJEPkTJSN+BjaFMtpf8cw6k=
X-Gm-Gg: ASbGncvqlVJVPik4Ef0UYABnrC6b/NNaclTrQnsyi/8UDzsUMZTPJIDUuB1t3Fopp1K
	4l8OY+iPgDFQvbgQuKpMdnh14qV5cdfdYeBFGklI24dS+zBAgUDEBOSyoQktoEE1HA7k6XlfQkH
	9UWMO5zabThFfwlqUSRelleqtoGjAGTS1QbMFQpD6QLjLHh7M/Nb9ca1/4SEFyN/9O805yi4u3o
	zSLFq4g1ThhPOsP7DgYW+jNPrI9aTzw94RPSTDSQcW45woGNHBRK5SKzsoQPCHjkL+r07zjdxIh
	qPDYD4X2g9arDA==
X-Google-Smtp-Source: AGHT+IF0uAlwa6gBu1gPr2dqwSyuIZZV/tSdbeIren4YqG3M6YP4kMXrRqTqSrM5G5BkGMJt/vM5Cw==
X-Received: by 2002:a05:600c:1396:b0:439:6d7c:48fd with SMTP id 5b1f17b1804b1-439ae1d877dmr24012595e9.4.1740136287415;
        Fri, 21 Feb 2025 03:11:27 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::766e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258b439dsm22921657f8f.8.2025.02.21.03.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 03:11:27 -0800 (PST)
Date: Fri, 21 Feb 2025 12:11:26 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: BillXiang <xiangwencheng@lanxincomputing.com>
Cc: anup@brainfault.org, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	atishp@atishpatra.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, rkrcmar@ventanamicro.com
Subject: Re: [PATCH v2] riscv: KVM: Remove unnecessary vcpu kick
Message-ID: <20250221-11926c4f2ca3fab3b565bc92@orel>
References: <20250221104538.2147-1-xiangwencheng@lanxincomputing.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250221104538.2147-1-xiangwencheng@lanxincomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_031129_283500_964017C5 
X-CRM114-Status: GOOD (  19.29  )
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

On Fri, Feb 21, 2025 at 06:45:38PM +0800, BillXiang wrote:
> Remove the unnecessary kick to the vCPU after writing to the vs_file
> of IMSIC in kvm_riscv_vcpu_aia_imsic_inject.
> 
> For vCPUs that are running, writing to the vs_file directly forwards
> the interrupt as an MSI to them and does not need an extra kick.
> 
> For vCPUs that are descheduled after emulating WFI, KVM will enable
> the guest external interrupt for that vCPU in
> kvm_riscv_aia_wakeon_hgei. This means that writing to the vs_file
> will cause a guest external interrupt, which will cause KVM to wake
> up the vCPU in hgei_interrupt to handle the interrupt properly.
> 
> Signed-off-by: BillXiang <xiangwencheng@lanxincomputing.com>
> ---
> v2: Revise the commit message to ensure it meets the required 
>     standards for acceptance
> 
>  arch/riscv/kvm/aia_imsic.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/riscv/kvm/aia_imsic.c b/arch/riscv/kvm/aia_imsic.c
> index a8085cd8215e..29ef9c2133a9 100644
> --- a/arch/riscv/kvm/aia_imsic.c
> +++ b/arch/riscv/kvm/aia_imsic.c
> @@ -974,7 +974,6 @@ int kvm_riscv_vcpu_aia_imsic_inject(struct kvm_vcpu *vcpu,
>  
>  	if (imsic->vsfile_cpu >= 0) {
>  		writel(iid, imsic->vsfile_va + IMSIC_MMIO_SETIPNUM_LE);
> -		kvm_vcpu_kick(vcpu);
>  	} else {
>  		eix = &imsic->swfile->eix[iid / BITS_PER_TYPE(u64)];
>  		set_bit(iid & (BITS_PER_TYPE(u64) - 1), eix->eip);
> -- 
> 2.46.2

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
