Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57DE3C7EE32
	for <kvm-riscv@archiver.kernel.org>; Tue, 24 Jun 2025 14:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qxRM9W1/+VLV9FGyqBvx8R/gTSgT2pryWLfv5kKBIos=; b=ZU3hVuYw3USEgV
	k9f7sPc2Q2k1IjEOm18IN2q1ea4GOZY35bzYRSgKaw0IAcb87MEo6xK22nNopGyJoaYW4qY7SpNMd
	HfaHECEkaq5EavHgT6aHoveMMT0U97BJUzVCalheHY/GzVe/rfGAdyGqxUMOC9xQRxCxWXJjErb/4
	2wWrQXtmFnCzPx2Obrp4E/W82tWzTsEouHE3+B4t6OipkCGG4Y2/42fUKEloxKqtBzicGbuOI0qkU
	2Dk2bYUPwAsnFbF7V44z5pGWIU61+oKO47h1WwIvwXI7uaGZkW18nQq0/QX325GTBdmdtUZEoFTPM
	k+mj4x3TXRUngy2e+nPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU4Pd-00000005r3x-0RpH;
	Tue, 24 Jun 2025 14:14:13 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU3yu-00000005lRA-3ySt
	for kvm-riscv@lists.infradead.org;
	Tue, 24 Jun 2025 13:46:38 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3a4fb9c2436so364510f8f.1
        for <kvm-riscv@lists.infradead.org>; Tue, 24 Jun 2025 06:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750772795; x=1751377595; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ohkRZnrz54pdAWpLhDbJvMYBolnW2mbJhdCUdnmMbJk=;
        b=QTLKqYWcmeuKxJPqMrF/4fN1SNIJ8MNHMxRipOpl2IFmO+j6VI2DaRi/9y2JLUXIfc
         a9Ph2vhoTrBlQUv3YVuwIfcffnrWsV9djjXSzPEOkiYcEqLkeHepAIquNx2MgiUUZOWy
         qAthUCGk34iSUOP0hczgh7StsMm8PGp0/sjxH+YT4Z6hZL+mj7AZ0LC/PgW9CW4TbOSm
         rwa3X10QNPvKTKq1JV80NBhZl6hEEFC0N30SePzfNfpVDZCYyOwMh+AB3VhuVOyUiJRi
         hnBXIX5nT9vq9TRAFyGjRAB3sAzTyk6YM51aFvFCX0Sb4LYebxmLNpuAIRrzJqrp1gXu
         g3rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750772795; x=1751377595;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ohkRZnrz54pdAWpLhDbJvMYBolnW2mbJhdCUdnmMbJk=;
        b=VhEVJJWIeoJxb7Ffj7J7qnodRmfna29P6aQULjcEMwhU+HRbV6/zcqa/dopTkDFYrV
         uYMFgOPrixzLvcibwT7TBip0wwhg45Pg0pfbtKLdktKyfEmGor9OTZspvXE93xWgW2kr
         LILKRYzEMqPboDKgqAcTfO/zuAwejV1tcw4jsCWqioAIC9neJRy6MNXH/PilEnVxiXiA
         grE3n5afjTETELsZT7LFl2IK7u1kihRvtDzVwSN6w96jN9VIOYnfXVbZDr2VslUxNtaW
         BwZ//HNNjJ1ei8RipVtYp0mJbp667WXvEaajFIpAD3Y8jT4bPtlPbF0YkTiZaSDWwgNo
         RsOA==
X-Forwarded-Encrypted: i=1; AJvYcCXMHV0KQX9lQDGbTd2YkVI+ktUvijQgpnnJCJGrjMlXIbrgHmUJdB2Gt3wsKkDuHyKiDY2Zek1MaOM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzw1RQo2ewFxF+PnmqaA6b4qf1jqBcEiV6WYKTbzajQBXur9dti
	PPmyzOgga9b/tNJNLWHaj4RW8KwqUumPDRsRPkiDPkMMsVsemSzti95x4Nrv7AbUm1U=
X-Gm-Gg: ASbGncthuIsg57nVXtzuC49Bs50lPTw1oNoSwWAdUm8HH3k3VxgiVgM/1KUWo4sXr18
	gYBlRo4thV47aJAHj9BmPBi5zk2nx30566g8rSmB0H7ToAK5hMQx5dQBCoxnbQqU4D/NuSgMMPT
	RWqjdy3q8o0gu2/nzAceB5lOMAR8bgYodR5tTdid/Z49lW3y/cDTNtvqmvQK0t+PaorZFxVc99H
	qK8HE0E1ktmb/Q5Ookp588jVfYUAEojIliu23oLvW7Xy01Cjm8Xr034HaxJh+swdTkwkQPlYJY0
	DpBEdF42lzkqidW11N0SuGI9gWyyfUo6rBr+Bvyip2WTsCI4pg==
X-Google-Smtp-Source: AGHT+IEt7t69RQwxRY3eEXaaUWMwhnlyw5hwc/9b4j97KSvQHGz9sdCKF+wVdRShxiN6h2dbaEha3A==
X-Received: by 2002:a05:6000:491d:b0:3a1:f564:cd9d with SMTP id ffacd0b85a97d-3a6d12d92e1mr13250210f8f.36.1750772795336;
        Tue, 24 Jun 2025 06:46:35 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::5485])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e80f279dsm2047840f8f.64.2025.06.24.06.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:46:34 -0700 (PDT)
Date: Tue, 24 Jun 2025 15:46:33 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: zhouquan@iscas.ac.cn
Cc: anup@brainfault.org, atishp@atishpatra.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH 3/5] RISC-V: KVM: Allow bfloat16 extension for Guest/VM
Message-ID: <20250624-08753b120b1b5b7b88416057@orel>
References: <cover.1750164414.git.zhouquan@iscas.ac.cn>
 <effe218d368a37e397b6526f876b33322dbb6e20.1750164414.git.zhouquan@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <effe218d368a37e397b6526f876b33322dbb6e20.1750164414.git.zhouquan@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_064636_989154_7F2EDE25 
X-CRM114-Status: GOOD (  14.74  )
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

On Tue, Jun 17, 2025 at 09:10:35PM +0800, zhouquan@iscas.ac.cn wrote:
> From: Quan Zhou <zhouquan@iscas.ac.cn>
> 
> Extend the KVM ISA extension ONE_REG interface to allow KVM user space
> to detect and enable Zfbmin/Zvfbfmin/Zvfbfwma extension for Guest/VM.
> 
> Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
> ---
>  arch/riscv/include/uapi/asm/kvm.h | 3 +++
>  arch/riscv/kvm/vcpu_onereg.c      | 6 ++++++
>  2 files changed, 9 insertions(+)
> 
> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> index 56959d277e86..79a5ac86597c 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -186,6 +186,9 @@ enum KVM_RISCV_ISA_EXT_ID {
>  	KVM_RISCV_ISA_EXT_ZAAMO,
>  	KVM_RISCV_ISA_EXT_ZALRSC,
>  	KVM_RISCV_ISA_EXT_ZICBOP,
> +	KVM_RISCV_ISA_EXT_ZFBFMIN,
> +	KVM_RISCV_ISA_EXT_ZVFBFMIN,
> +	KVM_RISCV_ISA_EXT_ZVFBFWMA,
>  	KVM_RISCV_ISA_EXT_MAX,
>  };
>  
> diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
> index d444ec9e9e8e..2ba3f2c942ee 100644
> --- a/arch/riscv/kvm/vcpu_onereg.c
> +++ b/arch/riscv/kvm/vcpu_onereg.c
> @@ -65,6 +65,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
>  	KVM_ISA_EXT_ARR(ZCF),
>  	KVM_ISA_EXT_ARR(ZCMOP),
>  	KVM_ISA_EXT_ARR(ZFA),
> +	KVM_ISA_EXT_ARR(ZFBFMIN),
>  	KVM_ISA_EXT_ARR(ZFH),
>  	KVM_ISA_EXT_ARR(ZFHMIN),
>  	KVM_ISA_EXT_ARR(ZICBOM),
> @@ -89,6 +90,8 @@ static const unsigned long kvm_isa_ext_arr[] = {
>  	KVM_ISA_EXT_ARR(ZTSO),
>  	KVM_ISA_EXT_ARR(ZVBB),
>  	KVM_ISA_EXT_ARR(ZVBC),
> +	KVM_ISA_EXT_ARR(ZVFBFMIN),
> +	KVM_ISA_EXT_ARR(ZVFBFWMA),
>  	KVM_ISA_EXT_ARR(ZVFH),
>  	KVM_ISA_EXT_ARR(ZVFHMIN),
>  	KVM_ISA_EXT_ARR(ZVKB),
> @@ -170,6 +173,7 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
>  	case KVM_RISCV_ISA_EXT_ZCF:
>  	case KVM_RISCV_ISA_EXT_ZCMOP:
>  	case KVM_RISCV_ISA_EXT_ZFA:
> +	case KVM_RISCV_ISA_EXT_ZFBFMIN:
>  	case KVM_RISCV_ISA_EXT_ZFH:
>  	case KVM_RISCV_ISA_EXT_ZFHMIN:
>  	case KVM_RISCV_ISA_EXT_ZICBOP:
> @@ -192,6 +196,8 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
>  	case KVM_RISCV_ISA_EXT_ZTSO:
>  	case KVM_RISCV_ISA_EXT_ZVBB:
>  	case KVM_RISCV_ISA_EXT_ZVBC:
> +	case KVM_RISCV_ISA_EXT_ZVFBFMIN:
> +	case KVM_RISCV_ISA_EXT_ZVFBFWMA:
>  	case KVM_RISCV_ISA_EXT_ZVFH:
>  	case KVM_RISCV_ISA_EXT_ZVFHMIN:
>  	case KVM_RISCV_ISA_EXT_ZVKB:
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
