Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EE8DC7EE30
	for <kvm-riscv@archiver.kernel.org>; Tue, 24 Jun 2025 14:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GkVz8DEx0pxlb7oTVDuhgrv3TqqmTKgvOOsfnoVPHc0=; b=itIy2YzKb3geG8
	MrxZGnS4iP/opXmRecumR9dBMUt9ezdF0c31MR96n6ixEkFGTNeeV2r1ScOyvq/npjfiGj7ZjAg8o
	ytIlKHwI69kaOWNPPjo/83Q0qEonA7kJeqm7qRtwRVehUaXRLfzy6sHq2vULqaUdcq4rtgOKqff/0
	TwpXeuzPrLFFFRB2aAwZBcEz76G7kL8ch8uXuj2Yz3YKb4pnlzgC784YKEDtQHYH7rkLCO1G7ZYTa
	cPIUDL0FZ5ugO4LEn7OdQdBwAfrJqJ9laAMw8JdSI9PxQkX1VUNR3kM4qmR394iM4HqAv63EeGw4+
	pRPZmEjleQt2fkg+3taA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU4Pc-00000005r3h-3KkQ;
	Tue, 24 Jun 2025 14:14:12 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU3yV-00000005lK2-3DtL
	for kvm-riscv@lists.infradead.org;
	Tue, 24 Jun 2025 13:46:12 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3a54700a463so3050923f8f.1
        for <kvm-riscv@lists.infradead.org>; Tue, 24 Jun 2025 06:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750772770; x=1751377570; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Eoo0fa0GCv1oBnTiujtR7cKFf/6yNPbDr+2avmoEsNU=;
        b=G7MVtxqRuCtXtejQBF3gxCo9UByfiVThJPnIE6VOaBsIZsYngHetjpdzIN1jkn0cp6
         MU2fk2TFR4pRbQJaKVtLqfLs4dAKNpJFwMQVG5knNzrddQgL6+5CISwL/XN5r6g7eMZs
         dOUlAyH+CK1Kwb75feAHxc/PDE8XboQsOuiXEHFKgK8nHiT5tfbT/mN6W42zUWMILVmQ
         0HwjsYhULGP4StYTIBJxKTp5hMR2VNBk3AqAfgt2XN48WsFx2qo0g0WNMmkAtkLsB1YV
         Lj2OaVhGDHnnzIYkyL7DBYAYlY0r/hcHo7r1PHoMbMMXHlkJSZ/EHdWqJfeu2QNggV1t
         pfkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750772770; x=1751377570;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eoo0fa0GCv1oBnTiujtR7cKFf/6yNPbDr+2avmoEsNU=;
        b=nkKjOh5skWiAoVezHhcI37c4H1xJhoq8vpC28BoI+M6LXtFuDDmauGuwwNIhhTJAad
         Un+YJCXHUx/CTG3zdkuw/Jp0EHc1TveZTGLhShaoDjwMPqGoJ8o2KU1fAp9hM3Pp3kYU
         AYZl+hR32mk00YZwnyHgDhpQguHFITH9sySXGIpVO+XM6UW/f2Sm3CIspVevRYpCWCPq
         JPd7e3ZfmVliDO3Rt4AlBAWNGdrXANclsn1MRdHr06YKjVZacN/IfOrRSKuN1x3yNNq4
         UqybxML/cH9+nd0KoA4WtfyM7bUqWvrq+I8D6iuUuQY4fg12FFp8+4Y5s0j8eTjveJAL
         0MHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnuG8UkuwPLPT4vI18BrgkZ55L/n6Tvta40fneJLpMN7b47v0AgVz/sA6ZpwyjWCqv884eHpwXPnc=@lists.infradead.org
X-Gm-Message-State: AOJu0YytqtQyV7IBCmBAqg4naWIbXLPS+nSt4wSq80TaCjBLYrDB3fg9
	kOrxFncHanA7pCHrClAdDnoCemo47eVDRQeMKciXJ4fRqmzbyrK9RaQ4S+Q3CA8CVaA=
X-Gm-Gg: ASbGncunB9NNthGChbQjVcoBCAi10jAANV9xO9J9MuzwGAKtUI+Eu8MrBtEt+vyHP/r
	1pFJbUum3QLaMhW26mKyU/8boODYO+KfkiI+M4X8yE8zl7agHDclZcmmPJ1o6tbjnoc7sohItk5
	Z2BKFWfluPaqp26zfF51xgep+7BfT5PWbKovAjzcnRMsS6MN1YCoV0wmuNWoSMgUyrlYtsPhyCG
	qcOtvQ1DW2smQlV3qTNNogWJgQKx/B1C9Tjhuk914VLV8tz47Z0fffILehTe/gQ9HkMTcfTHaN7
	pnW2o4Ey+IY/9x4dDIBnEYoJvWV7qmn4bKi2mavGyE6kL5j2Mg==
X-Google-Smtp-Source: AGHT+IFEAC1W+Y170mCC2sU03t16kmaicwlOVBXCKZyNDj9U1iBSb9Gp5uGrQiBVTIpsYnn7B2iLdA==
X-Received: by 2002:a05:6000:2583:b0:3a4:dfbe:2b14 with SMTP id ffacd0b85a97d-3a6e71d4cf3mr2905989f8f.16.1750772770139;
        Tue, 24 Jun 2025 06:46:10 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::5485])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e8068fd0sm2066068f8f.38.2025.06.24.06.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:46:09 -0700 (PDT)
Date: Tue, 24 Jun 2025 15:46:08 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: zhouquan@iscas.ac.cn
Cc: anup@brainfault.org, atishp@atishpatra.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH 2/5] RISC-V: KVM: Allow Zicbop extension for Guest/VM
Message-ID: <20250624-fd191a60c31c732c0d401f46@orel>
References: <cover.1750164414.git.zhouquan@iscas.ac.cn>
 <e2a040c161f17c1717b64750e774474d8ee8f0d6.1750164414.git.zhouquan@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e2a040c161f17c1717b64750e774474d8ee8f0d6.1750164414.git.zhouquan@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_064611_798957_D12CE7E0 
X-CRM114-Status: GOOD (  14.60  )
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

On Tue, Jun 17, 2025 at 09:10:30PM +0800, zhouquan@iscas.ac.cn wrote:
> From: Quan Zhou <zhouquan@iscas.ac.cn>
> 
> Extend the KVM ISA extension ONE_REG interface to allow KVM user space
> to detect and enable Zicbop extension for Guest/VM.
> 
> Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
> ---
>  arch/riscv/include/uapi/asm/kvm.h | 1 +
>  arch/riscv/kvm/vcpu_onereg.c      | 2 ++
>  2 files changed, 3 insertions(+)
> 
> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> index 0863ca178066..56959d277e86 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -185,6 +185,7 @@ enum KVM_RISCV_ISA_EXT_ID {
>  	KVM_RISCV_ISA_EXT_ZICCRSE,
>  	KVM_RISCV_ISA_EXT_ZAAMO,
>  	KVM_RISCV_ISA_EXT_ZALRSC,
> +	KVM_RISCV_ISA_EXT_ZICBOP,
>  	KVM_RISCV_ISA_EXT_MAX,
>  };
>  
> diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
> index b08a22eaa7a7..d444ec9e9e8e 100644
> --- a/arch/riscv/kvm/vcpu_onereg.c
> +++ b/arch/riscv/kvm/vcpu_onereg.c
> @@ -68,6 +68,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
>  	KVM_ISA_EXT_ARR(ZFH),
>  	KVM_ISA_EXT_ARR(ZFHMIN),
>  	KVM_ISA_EXT_ARR(ZICBOM),
> +	KVM_ISA_EXT_ARR(ZICBOP),
>  	KVM_ISA_EXT_ARR(ZICBOZ),
>  	KVM_ISA_EXT_ARR(ZICCRSE),
>  	KVM_ISA_EXT_ARR(ZICNTR),
> @@ -171,6 +172,7 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
>  	case KVM_RISCV_ISA_EXT_ZFA:
>  	case KVM_RISCV_ISA_EXT_ZFH:
>  	case KVM_RISCV_ISA_EXT_ZFHMIN:
> +	case KVM_RISCV_ISA_EXT_ZICBOP:
>  	case KVM_RISCV_ISA_EXT_ZICCRSE:
>  	case KVM_RISCV_ISA_EXT_ZICNTR:
>  	case KVM_RISCV_ISA_EXT_ZICOND:
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
