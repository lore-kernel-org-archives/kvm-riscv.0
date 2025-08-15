Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3649ECA0EEB
	for <kvm-riscv@archiver.kernel.org>; Fri, 15 Aug 2025 20:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uE14HyKMAugxwL8jfu31MxQu9GwmGvjRVaCq5r+Qz+w=; b=x55BtetRoWIRRn
	ZOyV9TBT0gSlXhTqHbrWOt+pnZDCE8gNWYR+s+IDMKvnQBYqXgfm/mCIhwxBDp+hsthpPKOP4cHKD
	J3iuYaHxTGA2ToKF8YPj2QmnlJgC9buNgf2ukax8FCB370HvD99tHCADOPa9VtEgINvQhfG0NyOFu
	BLR6RPQIsUzlwVL1tPrQ0jAN1c+6jux794dgT5+vZvIb+h98cLQBsJsqK8KTYhd2ZzsradxoOil9L
	U6bXnBDhzcq0vUsdk3FRMrapB4gjZnbZyyeVCOM/P5RFqC7TsK+lxr3LFPSucZWaPVRRP2ZBAcpqI
	6xnZ0Rr15xmA6HG+Sa4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1un0up-00000003RrL-2mYY;
	Fri, 15 Aug 2025 20:20:43 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1un0fJ-00000003Oy2-0kOe
	for kvm-riscv@lists.infradead.org;
	Fri, 15 Aug 2025 20:04:42 +0000
Received: by mail-io1-xd36.google.com with SMTP id ca18e2360f4ac-88432ccadeaso164823239f.0
        for <kvm-riscv@lists.infradead.org>; Fri, 15 Aug 2025 13:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755288280; x=1755893080; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YjJzR6BitUGV64diaMvb3KSO/e3Gi7ex2M4rjIRjOr4=;
        b=S1IOtdKM3BInORhq/Z+lCMllyeUEYll3/NnMWQweZrgPCLslDdf6ptpL4BEzE6GwT/
         2meg4RnHtFCzNV6Xt6bZotquKnMyxr5PMiEgK8cYClMxOs+0ozuENTNqCBgtw4m0bezF
         qLI3lAzf6O8kMdkFhxsad8TuPJBizpeyNNXDA4IJ6swYYv7r+vWzlzC0TW4gExwD3lhI
         PXMhJ/bnktvZ5xrT2LYlXBmHyh5ZU87HpJevU0s/FscqXhgFQHeq4nr3njMwTQp8cGCW
         ftnfeJx11zujCyhfgCRp+10N8A7VLZGsI5rBh7rBwUVqpbj+V/gqCsCTr2V3qn0dinWC
         twvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755288280; x=1755893080;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YjJzR6BitUGV64diaMvb3KSO/e3Gi7ex2M4rjIRjOr4=;
        b=oPZWvFB1h+0vMHLkXXTSz0YHTyaywEXTOTi89rgBEdYdYz3npZAaPcbcfPsn6XGZoQ
         uwxHboeebX5Y33c1PXu6/F5v+WF0ul+E9FMK0ZA4HSQUcg/9kHuFbG8HEGDshj8Yw+s7
         JEwANoeInGJS8hqhGZ1RRYbt6rDNBnFJmSIMGRH5fzKA+7cLgqO3Gmz/+GX5LuBjRgp0
         +afxriIwEemF68208uqmmENy06g/kvNlbRLouAgGeHaPdRbimlKsz3Us5003DPg8KXx5
         gcJNiXWNsGecDHkwJqaT8SZ+LWrQOtnb5djc6v3r3EiYJVYB0NElzAxUZV1XRIiEqpLX
         SJZw==
X-Forwarded-Encrypted: i=1; AJvYcCVbJSF9ng9g5ixgwuvl+sUwCjIC0hxQzrLdzwiumv+6LSPGpkD4Do0qTmEFkqC9753aXiyCWBSpAr4=@lists.infradead.org
X-Gm-Message-State: AOJu0YwXIYieb/a/Owr86TPFxQVUbQGPygkM8rd8shT7+AnYyq6br1NI
	vjwgMFseqjs/ShpTb2VioG9dBtmwzKO1zAHeudwGwHGdryY10FEcy0APrZ/jJDHERFY=
X-Gm-Gg: ASbGnctThZ51Ooi1c4XKFjx5w8qGyzowrXJxnMMnpNwPzAgUsRKoTXmhvfsIwnqtFck
	UzwdUbz9XZnGK6RIk3Wv0Kq6qZxG1q2o5lkCiSJNY+5PuWHjMaQRWGKOhy4fFzP0mN02pT7vkPj
	/tQmG5oZUe9IFzRwZDDbwuZyNEgCPUnA4Uwj/DP6UgHre70BroKAuwZG+fA03g4L0ziXRpqXZTm
	UcI+L3+twftkFqp1nkWYH9ootMg3sqUwNW7Ah/d/PD4TuqJjFLctODLX8Zc6LDDSRWqPMFsECTK
	dlpCNDRKBWVbCqW9RRWRbRC/c9pVgouNuCjE/G+isPH3smlXYrWga3HGIa4r5GWViqCipCDYG4S
	XlGiyoUb5Vo/EIPDQbID4LIb6
X-Google-Smtp-Source: AGHT+IFVAKt30ibqWuDesYE4Rq4i7q7q9OchtpkO5B6rE/MAYha/hplJL5lUKwJN5zK9vnb+lDVkPA==
X-Received: by 2002:a05:6602:3410:b0:86c:e686:ca29 with SMTP id ca18e2360f4ac-8843e34cd35mr730781139f.2.1755288280204;
        Fri, 15 Aug 2025 13:04:40 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-8843f9f6d8dsm77814839f.24.2025.08.15.13.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 13:04:39 -0700 (PDT)
Date: Fri, 15 Aug 2025 15:04:38 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Atish Patra <atish.patra@linux.dev>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 1/6] RISC-V: KVM: Set initial value of hedeleg in
 kvm_arch_vcpu_create()
Message-ID: <20250815-5b8056af445fb30be7c387a7@orel>
References: <20250814155548.457172-1-apatel@ventanamicro.com>
 <20250814155548.457172-2-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250814155548.457172-2-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_130441_219693_1C10F5B9 
X-CRM114-Status: GOOD (  16.35  )
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

On Thu, Aug 14, 2025 at 09:25:43PM +0530, Anup Patel wrote:
> The hedeleg may be updated by ONE_REG interface before the VCPU
> is run at least once hence set the initial value of hedeleg in
> kvm_arch_vcpu_create() instead of kvm_riscv_vcpu_setup_config().
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/kvm/vcpu.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index f001e56403f9..86025f68c374 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -133,6 +133,8 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
>  
>  	/* Mark this VCPU never ran */
>  	vcpu->arch.ran_atleast_once = false;
> +
> +	vcpu->arch.cfg.hedeleg = KVM_HEDELEG_DEFAULT;
>  	vcpu->arch.mmu_page_cache.gfp_zero = __GFP_ZERO;
>  	bitmap_zero(vcpu->arch.isa, RISCV_ISA_EXT_MAX);
>  
> @@ -570,7 +572,6 @@ static void kvm_riscv_vcpu_setup_config(struct kvm_vcpu *vcpu)
>  			cfg->hstateen0 |= SMSTATEEN0_SSTATEEN0;
>  	}
>  
> -	cfg->hedeleg = KVM_HEDELEG_DEFAULT;
>  	if (vcpu->guest_debug)
>  		cfg->hedeleg &= ~BIT(EXC_BREAKPOINT);
>  }
> -- 
> 2.43.0
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
