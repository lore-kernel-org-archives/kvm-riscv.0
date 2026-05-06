Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 448A1FF8855
	for <kvm-riscv@archiver.kernel.org>; Wed,  6 May 2026 13:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j6ZaggEDdSoyeUX+YGS3/ZMHsHKiccmSkf0Y9TLuXAw=; b=mbLIQgYAxQh1P7
	qhlaiBkm2Xkd2KQR5hutezQ/V1RRqObOuvlgPTs19JMkDHtAKMJ3Q7k+D12bD36w+PqaW9/guV/Wt
	Cxe3svsRHLCCXgQ6yTl6M9acVTSRxJHTHAELtngbYwnFqb+uuxTxtfxmavwdDynk/7nKQxChi9OkF
	XIW8E+nvKNvo2x2SqwqMTSVJpAGRY6kTYvKnf0Gy1BAi86UHoNFNDrJZlmXZTlCSItB3XDUznnhKk
	C2joJatOkgDjD6hDgkwULkDfap8iH8r5Hk/vYSxhfkj7VYjCPz3BjAoFR+08OuY9L6qTbepHG+tn7
	f2f8yQjzHSb0QvxZtiWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKcCB-00000000sav-3nmp;
	Wed, 06 May 2026 13:21:47 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKcCB-00000000saD-1pt2
	for kvm-riscv@lists.infradead.org;
	Wed, 06 May 2026 13:21:47 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-48a3e9862f0so6778675e9.1
        for <kvm-riscv@lists.infradead.org>; Wed, 06 May 2026 06:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778073706; x=1778678506; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=L7rCjUTJQsAQHnwXFtsx6ks2Ud7GiaEkWHxltyMvS7k=;
        b=rHP/cQpc5afXG9SCgEDdCRLZ2aapPo0Z8t5wTH2DWa9Fru02vpoIqHTYtB5gImgVKh
         rha6pZOSnIwDm1A0wVJ0C7g/5xxB1K3snS146cVUcEwjbc73TeU+N6W27bozzlKg52zd
         9aj6pZgNlCa7v4frKfWEooiqV2xo0KXl08jWj/pKgR3PDGhas3vLphjfabZinrTyqZC4
         b9WFjo4ywHEx2ydV0HX/n1DZiK4NgWaOy1j/YZp+5WCWbLdDPCwD3M21vsaaWmp9WRhy
         AcTHvJI7eP4neGo657mWMOfIC2kLVoFOTynV2gtjFzadkb/o49BfI8GrIj5TsiCs80Nc
         t1dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778073706; x=1778678506;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=L7rCjUTJQsAQHnwXFtsx6ks2Ud7GiaEkWHxltyMvS7k=;
        b=AFKPWP5HAcV3PlQgVBZMyjfmq/cSZwyDo1klJnVuc51PlLnpKoQ461S12pJ/7DDQGI
         /mdij1/BQ91zWOwSLh03brYPHLqojApMz+AStAeLlXfQTxS8Gtz8id4cxmD22hlyvYFc
         A7Qtvn0OYpy/l0GQHaRKwQf1GBb1P/zAU65VxWkGlUvmW0kOBnfBGUsuMwNVrsiDOn2P
         EogDv3MVIEU7DgeLP3tKChntcEyHEF/wZR/JIHaTZ/RnXMGvn14cP53VzAqxGy3cGH1J
         u8VshjLRqDwosdmGdjJJpz2bq/r8VtryJ2Oyg/P4NR2U4V6RFhAQ5tkesvT8tVi+xubK
         bCBw==
X-Forwarded-Encrypted: i=1; AFNElJ9unDS3sM5Emfggt+D5ILkUDWfi1qMLV+4bcy7LQ3zjDFFlthRiTMXzyDlWZKPKmNCEosTp2iae6pk=@lists.infradead.org
X-Gm-Message-State: AOJu0YzZaFz/X0bVEyHmsvp6eFQX2YCiyhn7TBxS3K7ssS/vPfCiF6+m
	kdpS5JD1keW7UhyAgX3UZfrxThVhn13/ESMqPboV9dDkZXVp6Dvtx9/F
X-Gm-Gg: AeBDievGb1OgcNW6K39qwzlgfAmQ/6bLFMegdB7DR9UvfNeIPAlnEzMaJe1at1MbQzk
	wOcMwTBN6aCZcLbFgitGtJQm2ybcLncXBRIbJUGv+bOtpFs2akXSyqhyGdEnwwYpih/58mzMZTQ
	wzJ+LzynHyA+N50sS3tGQ9qBP580VY0T47wDpnglmEDH8l0FI3qyZMb3urObSiHZl1iygdoKxAc
	AMJ6D+rYJywsrYDSJXD1Eoa51Vl44GhFWEIie0FrsWFfTlciNx8FXTbB7IAaU2sBYUVFDKYjS/0
	p1WPfC9GBSvHLEgNlDIgs4goWo9Eahr8lpvbaMm9xOds4/ZtbuL2yIBTs56/bdMstTuos34tG4L
	Qe/G/sSQP3GVKbDiWFNJE4v4U3ycIvULT1sknXhRzcjufw0jziHOphZEwLJAAMqEnAAaBSRksIR
	5PUQYjduy2ZyU3QvDeOLcn1uo1EU+nanogiowwQ5cyjIbN51iMlZxDO3vNA45tPofEpcXN
X-Received: by 2002:a05:600c:6612:b0:486:f893:56c6 with SMTP id 5b1f17b1804b1-48e522b71f2mr50112055e9.10.1778073705537;
        Wed, 06 May 2026 06:21:45 -0700 (PDT)
Received: from osama ([2a02:908:1b6:8980:89b3:e462:e9ca:df27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e53895f0asm52221165e9.2.2026.05.06.06.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 06:21:45 -0700 (PDT)
Date: Wed, 6 May 2026 15:21:43 +0200
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] riscv: kvm: return SBI_ERR_FAILURE for PMU shmem OOM
Message-ID: <aftAZ6U93qCXLcSc@osama>
References: <20260415220930.287592-1-osama.abdelkader@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260415220930.287592-1-osama.abdelkader@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_062147_498216_AD2F364E 
X-CRM114-Status: GOOD (  16.82  )
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

On Thu, Apr 16, 2026 at 12:09:30AM +0200, Osama Abdelkader wrote:
> kvm_riscv_vcpu_pmu_snapshot_set_shmem() and kvm_riscv_vcpu_pmu_event_info()
> returned -ENOMEM from the SBI extension handler, which caused 
> kvm_riscv_vcpu_sbi_ecall() to abort KVM_RUN and surface the error to 
> userspace instead of completing the ECALL with a negative SBI error in a0.
> Use SBI_ERR_FAILURE and the normal retdata path, matching other PMU
> handlers and kvm_sbi_ext_pmu_handler comment.
> 
> Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
> ---
>  arch/riscv/kvm/vcpu_pmu.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
> index e873430e596b..f36b099f447c 100644
> --- a/arch/riscv/kvm/vcpu_pmu.c
> +++ b/arch/riscv/kvm/vcpu_pmu.c
> @@ -435,8 +435,10 @@ int kvm_riscv_vcpu_pmu_snapshot_set_shmem(struct kvm_vcpu *vcpu, unsigned long s
>  	}
>  
>  	kvpmu->sdata = kzalloc(snapshot_area_size, GFP_ATOMIC);
> -	if (!kvpmu->sdata)
> -		return -ENOMEM;
> +	if (!kvpmu->sdata) {
> +		sbiret = SBI_ERR_FAILURE;
> +		goto out;
> +	}
>  
>  	/* No need to check writable slot explicitly as kvm_vcpu_write_guest does it internally */
>  	if (kvm_vcpu_write_guest(vcpu, saddr, kvpmu->sdata, snapshot_area_size)) {
> @@ -480,8 +482,10 @@ int kvm_riscv_vcpu_pmu_event_info(struct kvm_vcpu *vcpu, unsigned long saddr_low
>  	}
>  
>  	einfo = kzalloc(shmem_size, GFP_KERNEL);
> -	if (!einfo)
> -		return -ENOMEM;
> +	if (!einfo) {
> +		ret = SBI_ERR_FAILURE;
> +		goto out;
> +	}
>  
>  	ret = kvm_vcpu_read_guest(vcpu, shmem, einfo, shmem_size);
>  	if (ret) {
> -- 
> 2.43.0
> 
ping.

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
