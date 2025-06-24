Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45C63C77B7C
	for <kvm-riscv@archiver.kernel.org>; Tue, 24 Jun 2025 14:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EeSpwWRa6FuY6iKFja79tGGSHcisrvzBtQznqsGVNWM=; b=pco++JRas/FtE3
	TemvDvqtsZbIL73IJt6qX/AYbXAxGmPNysuyN2COr9e/TqAYkQScMv3HCdMc/CZBTGdra2zn/UAr4
	mN5E4idgW414w42l+MFZBChnt5uQowAVMQasvnQaUi2UnP/1iw41/Bcu3WstexHi+0LOapLz+/HON
	ggJHjni5DEXgjeOVXI6IOqJWCTmJO1Z3cRrqHTe0utP7GU5JJIBy/6qpt+WgawmFOQb66FDh4Kx3y
	vj4lGyCybI+ViMMtQBXvmJ19nR/COvGOpFDYKIyqYTIcX55zO81qmCRw4aq4vvHt/TVTU4Gqa5C8O
	0zmdIYaVJqpLa0lxUevg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU4Pe-00000005r70-497t;
	Tue, 24 Jun 2025 14:14:14 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU3zR-00000005lYW-1iEp
	for kvm-riscv@lists.infradead.org;
	Tue, 24 Jun 2025 13:47:10 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3a588da60dfso3240686f8f.1
        for <kvm-riscv@lists.infradead.org>; Tue, 24 Jun 2025 06:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750772828; x=1751377628; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J8PCCubQNcr7nCZVM93eZuCGNtXLAAyFhXBC4cgzvqo=;
        b=ZSO6ntTqnGvdEG0AJ5AVBvHbMEF8fY7qlTlriLyCyf7vYKcbyNLO+Xs9aV0vjp2x+d
         te2NzR2kJk4qw0TYKQyt/AvO9/ufES2bhoYCDsMyoLad9lhPyLwuP/XuPonl275oqJn8
         KenEmBwOCj+axUZ4ECAtTDEd5LaEf3FiZYNCe2v/7njs8LrxLfyiCGqUgEJK+8JQ4DfB
         EhhQ+/exFK+B12SyyfG5ewiXRPRDHASPt4NuMhNM9irAG/O+5xnk8gLDR5Eo6nNbUIr4
         bAfTpg2zBoLi7eJmVpxoYEJT7/Z5Jqx72swMYN/YY2CZXOe0Fjb2Gb8ggpiVqi/9ndFJ
         dTVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750772828; x=1751377628;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J8PCCubQNcr7nCZVM93eZuCGNtXLAAyFhXBC4cgzvqo=;
        b=gM5qsK3ul7I478lyxdNRZI3D192V8u/KpEoMijK333CXe3t4wuW5gssGxhTUtXNrGG
         qYl6rITPfV92pQUv01IV2Nr5od+kw21kBF0xhz+ePILHfsHUDhEv7Gv1KeFaNO/I1gsX
         fprWm7LpbOaenjo3+CZwXCaito9+6pbvDxwcr3wDN3XiqB9qOuNgAKhvpZ/K9ICQw+da
         AsrBwdTOsth799ymjasecGSzZcgnTE7qX2QUI2rfZTlyUcjQYGSeJ5Q0/ynajlUx6A03
         HkYIniMthLr61ILsgpYr+WTPCBlkbOmxSUymJia9ryChptUhXqbhkK2V09kOFdsPXS71
         MeUw==
X-Forwarded-Encrypted: i=1; AJvYcCWQr82/2caRwv8dkXI3cuv0OwV60KyD7jSJtOh27hLUXAiZ2K/Il+QwoVo+Kw5BgUP2sv8A1oUvyng=@lists.infradead.org
X-Gm-Message-State: AOJu0YwbfMftfaktA6g9mRsoqAzQuTRdxNstxEcoZgjUrNtzGxnWo8Z7
	7sxN89a1G1tcjjdGqEqYjwOkTJRd4RZSnNuC4CSeBASgoEkXiWUfSdXD7L07zaJ948I=
X-Gm-Gg: ASbGnctMDL42r2+efN040pq2BQzVNILn4E9n/2sJnAP9LHho3wSOjS2OP7iQfX/PKsp
	qGjhkaFl2Ywui8AWjiS83M6m/8pk06630+DTZBJXuC6DEM4MLfiEOZ/N73P33nKMAcacG2Ok9Dn
	aCxw6jiyt4Y1QZqGRsOdbGtNeAznPrJvdTc8BbJi0EhHOefkT1GJ/dvio/bZlUNQmPnDvBEkRwC
	XkrImsvQ0NMspT5mFZSlZRj9vwMaCnUjhBTXd+WOBQf79kNbNOZfECeulcW2nluYZ+Bcq1JC0+j
	Xumb78X3r43QlulmGquhdK7pRIQRrxUXiiQX1fBZzi5k6NzKJw==
X-Google-Smtp-Source: AGHT+IHpMvNqukUYWx9oydnYOB85GNC6fRs2uW/m2DCi770l/WC1aWkrfcHX78PHUx/VK0Unvrw5XA==
X-Received: by 2002:a05:6000:310f:b0:3a4:e8bc:594 with SMTP id ffacd0b85a97d-3a6d1191de3mr11186332f8f.8.1750772827749;
        Tue, 24 Jun 2025 06:47:07 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::5485])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45361461375sm160230815e9.14.2025.06.24.06.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:47:07 -0700 (PDT)
Date: Tue, 24 Jun 2025 15:47:06 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: zhouquan@iscas.ac.cn
Cc: anup@brainfault.org, atishp@atishpatra.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH 4/5] KVM: riscv: selftests: Add Zicbop extension to
 get-reg-list test
Message-ID: <20250624-1960ad3d8a1108b04ea85d9d@orel>
References: <cover.1750164414.git.zhouquan@iscas.ac.cn>
 <3591f5aed544f9026d8375651936e006b57defdb.1750164414.git.zhouquan@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3591f5aed544f9026d8375651936e006b57defdb.1750164414.git.zhouquan@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_064709_442926_9768B697 
X-CRM114-Status: GOOD (  16.20  )
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

On Tue, Jun 17, 2025 at 09:10:42PM +0800, zhouquan@iscas.ac.cn wrote:
> From: Quan Zhou <zhouquan@iscas.ac.cn>
> 
> The KVM RISC-V allows Zicbop extension for Guest/VM
> so add them to get-reg-list test.
> 
> Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
> ---
>  tools/testing/selftests/kvm/riscv/get-reg-list.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> index a0b7dabb5040..ebdc34b58bad 100644
> --- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
> +++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> @@ -83,6 +83,7 @@ bool filter_reg(__u64 reg)
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZFH:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZFHMIN:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICBOM:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICBOP:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICBOZ:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICCRSE:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICNTR:
> @@ -253,6 +254,8 @@ static const char *config_id_to_str(const char *prefix, __u64 id)
>  		return "KVM_REG_RISCV_CONFIG_REG(isa)";
>  	case KVM_REG_RISCV_CONFIG_REG(zicbom_block_size):
>  		return "KVM_REG_RISCV_CONFIG_REG(zicbom_block_size)";
> +	case KVM_REG_RISCV_CONFIG_REG(zicbop_block_size):
> +		return "KVM_REG_RISCV_CONFIG_REG(zicbop_block_size)";
>  	case KVM_REG_RISCV_CONFIG_REG(zicboz_block_size):
>  		return "KVM_REG_RISCV_CONFIG_REG(zicboz_block_size)";
>  	case KVM_REG_RISCV_CONFIG_REG(mvendorid):
> @@ -535,6 +538,7 @@ static const char *isa_ext_single_id_to_str(__u64 reg_off)
>  		KVM_ISA_EXT_ARR(ZFH),
>  		KVM_ISA_EXT_ARR(ZFHMIN),
>  		KVM_ISA_EXT_ARR(ZICBOM),
> +		KVM_ISA_EXT_ARR(ZICBOP),
>  		KVM_ISA_EXT_ARR(ZICBOZ),
>  		KVM_ISA_EXT_ARR(ZICCRSE),
>  		KVM_ISA_EXT_ARR(ZICNTR),
> @@ -864,6 +868,11 @@ static __u64 zicbom_regs[] = {
>  	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICBOM,
>  };
>  
> +static __u64 zicbop_regs[] = {
> +	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_CONFIG | KVM_REG_RISCV_CONFIG_REG(zicbop_block_size),
> +	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICBOP,
> +};
> +
>  static __u64 zicboz_regs[] = {
>  	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_CONFIG | KVM_REG_RISCV_CONFIG_REG(zicboz_block_size),
>  	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICBOZ,
> @@ -1012,6 +1021,8 @@ static __u64 vector_regs[] = {
>  	 .regs = sbi_sta_regs, .regs_n = ARRAY_SIZE(sbi_sta_regs),}
>  #define SUBLIST_ZICBOM \
>  	{"zicbom", .feature = KVM_RISCV_ISA_EXT_ZICBOM, .regs = zicbom_regs, .regs_n = ARRAY_SIZE(zicbom_regs),}
> +#define SUBLIST_ZICBOP \
> +	{"zicbop", .feature = KVM_RISCV_ISA_EXT_ZICBOP, .regs = zicbop_regs, .regs_n = ARRAY_SIZE(zicbop_regs),}
>  #define SUBLIST_ZICBOZ \
>  	{"zicboz", .feature = KVM_RISCV_ISA_EXT_ZICBOZ, .regs = zicboz_regs, .regs_n = ARRAY_SIZE(zicboz_regs),}
>  #define SUBLIST_AIA \
> @@ -1130,6 +1141,7 @@ KVM_ISA_EXT_SIMPLE_CONFIG(zfa, ZFA);
>  KVM_ISA_EXT_SIMPLE_CONFIG(zfh, ZFH);
>  KVM_ISA_EXT_SIMPLE_CONFIG(zfhmin, ZFHMIN);
>  KVM_ISA_EXT_SUBLIST_CONFIG(zicbom, ZICBOM);
> +KVM_ISA_EXT_SUBLIST_CONFIG(zicbop, ZICBOP);
>  KVM_ISA_EXT_SUBLIST_CONFIG(zicboz, ZICBOZ);
>  KVM_ISA_EXT_SIMPLE_CONFIG(ziccrse, ZICCRSE);
>  KVM_ISA_EXT_SIMPLE_CONFIG(zicntr, ZICNTR);
> @@ -1204,6 +1216,7 @@ struct vcpu_reg_list *vcpu_configs[] = {
>  	&config_zfh,
>  	&config_zfhmin,
>  	&config_zicbom,
> +	&config_zicbop,
>  	&config_zicboz,
>  	&config_ziccrse,
>  	&config_zicntr,
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
