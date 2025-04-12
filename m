Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5334C369AE
	for <kvm-riscv@archiver.kernel.org>; Sat, 12 Apr 2025 13:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NmcsDV7Mc4RFqsGpTOAmino9opWeTnXMrz3Ua8B3fLs=; b=pNelYpw1KHPfep
	aULU7Kt4jkNpHOjA4bT963Vt6SPCEBGng/ZeWJRKHyNYMQYSpdpUADkhLnM/Y/DSD5WLhCL1k5cYn
	uUNllzaP2O+MQe6uPFrzjprflQKbgDhuerF+UYfBx9MLkb3zqwL/DjChq3QYHdYwdHgQ8n3Cw6QEW
	JP01Sk6kJy84M1dmQpNvw/y8+d9abxFtRTLTeb8YFi+ME28qkoGNornSl2zlCu6gxUD/F+STQAYPh
	ITkKh66BIOqu6nY1XVZtv+CFTLj8tX7A0F9M0mCoJ9bRJmaP/ICjukBvxuJnk1xxPh1FR7rrGFjWu
	18b6yEi7iQx5rdmPj+oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3bBP-0000000FxTp-2cUz;
	Sat, 12 Apr 2025 13:46:07 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3bBN-0000000FxTO-2gMx
	for kvm-riscv@lists.infradead.org;
	Sat, 12 Apr 2025 13:46:06 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-39c266c1389so1940623f8f.1
        for <kvm-riscv@lists.infradead.org>; Sat, 12 Apr 2025 06:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1744465564; x=1745070364; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jtwttZvLwlshHSUwBqfCayCIzyCXwqtOPkrJdw9L1s8=;
        b=jO89Ur17/FeGfa7h+bsXisTGXL4WHlTuyzS0OUf1V+H7AfZceMJ0j90pHcWdn+Y8vR
         yvay3xS7KCLjwYFD/A3+grnaZ3DVJ/weRX76kAsLLd7HTvZnA/CfxHzfEODDYzV6le6S
         jx51ts4YFLTl5t/mmciVQKvNn9GqVKCho2IrPjaKSGQNN1oF6A08SIjE34Mct3ZM8+xK
         MDCPWyNDzMaw+kWogEHeKUCHkSURq7ZWNJ4TOmFheDC9kSEGTG2rRxWmD9Y+9f7617LE
         tI8yKBac3u8VhDB/hsSrjx6XnXY+AlYNRq/Sar5W2f3dfUr/c3y5mMgjekPXjAhwPr/u
         +JYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744465564; x=1745070364;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jtwttZvLwlshHSUwBqfCayCIzyCXwqtOPkrJdw9L1s8=;
        b=dUxFyYn4nOwhXgraY+6V/wF6ffgScDuVrwktqOqrAVa69/WDixFTd6On4wfr89gKYU
         u7avo6qfBFcwoQ/s/h91pRT8v5ABdAp3fZifdnvmGju/4Ptvait3j28/fJEaX4+H/EN1
         qn97SdAhRH+iReFZJDZ1yvJtswo68tFVYlYCP2ZbUzZ7PWhyOJne9H01w3LUAU1E2MVS
         34b/mXx9SA/hxET/mUw3IdCLFNDzKkk3I6Gi0JFJ08tcJeYgmnCEevnQln76K/VdYJ8V
         atsBANJq0SUnKqtDHpQ/qvYVDjGJGjy93f3zxJnrOsF8uaa/4Y2GBuzciYMaWFojSqAp
         l1rg==
X-Forwarded-Encrypted: i=1; AJvYcCV+ab243oO+CgxUz0PzWjLXt8I13Gjk6vYv9d5awOD35F0za4L68QrnJD3mQ3K4TRNnxLIWhLRFCRc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3JGF33NQIEBySU0Sd6Zfias7zGInlUWS/inUcoAURp4m4dNo8
	zl7G6bF7/f5yWXpWD+j5MdqLKNmj6lzpz95zc4AQ37mRDXf9jbeYSa+241MfJBY=
X-Gm-Gg: ASbGncvG/wDiuf3gYHh58bN7EJksWtzdJl6U9j7hslc2UGl9Nw0SGUZkjpfuc8tvu16
	x3sTOT6/MoWpp8xeFJcKCbzz/vVTUexhaQgupu3LkTmtWa0b9THlZgGQbpRvkHgnlfBMIkkzT5k
	F7tLHgeZOLYUI/9MdJq25/GhT7roTLuvq0Pe9PMmpXw8WBWGXKvM05ZB719O7/P53Rc2+V1qpPh
	Bs3Z+2gLKMG+otNwt7gLWE6RhLHEn/BDgoQIZfTO4uK8HMtZLBWhijkZpEfdQxST/Clx32RzdD3
	0IBkKvywV/Q3d0RBPA63F9udYR7gqxGJ9/MohBf/W+ycVXzsJ3UG7gfbZh9Y6cmRzC96Uw==
X-Google-Smtp-Source: AGHT+IE+rwHw9nHa6ryoPIEo6O1nhK+baQh0ytegKnWQccKarq/0NciKVPWcuHHHwpI6NIKVm1J1CQ==
X-Received: by 2002:a5d:64ae:0:b0:39c:2688:6904 with SMTP id ffacd0b85a97d-39eaaec7e3dmr4590367f8f.39.1744465563746;
        Sat, 12 Apr 2025 06:46:03 -0700 (PDT)
Received: from localhost (cst2-173-28.cust.vodafone.cz. [31.30.173.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96407esm5152330f8f.17.2025.04.12.06.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 06:46:03 -0700 (PDT)
Date: Sat, 12 Apr 2025 15:46:02 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Will Deacon <will@kernel.org>, julien.thierry.kdev@gmail.com, 
	maz@kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
Subject: Re: [kvmtool PATCH 02/10] riscv: Add Svvptc extension support
Message-ID: <20250412-4a9f672931bca5890a720923@orel>
References: <20250326065644.73765-1-apatel@ventanamicro.com>
 <20250326065644.73765-3-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250326065644.73765-3-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250412_064605_678573_F25A69A8 
X-CRM114-Status: GOOD (  14.37  )
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

On Wed, Mar 26, 2025 at 12:26:36PM +0530, Anup Patel wrote:
> When the Svvptc extension is available expose it to the guest
> via device tree so that guest can use it.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  riscv/fdt.c                         | 1 +
>  riscv/include/kvm/kvm-config-arch.h | 3 +++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/riscv/fdt.c b/riscv/fdt.c
> index 03113cc..c1e688d 100644
> --- a/riscv/fdt.c
> +++ b/riscv/fdt.c
> @@ -27,6 +27,7 @@ struct isa_ext_info isa_info_arr[] = {
>  	{"svinval", KVM_RISCV_ISA_EXT_SVINVAL},
>  	{"svnapot", KVM_RISCV_ISA_EXT_SVNAPOT},
>  	{"svpbmt", KVM_RISCV_ISA_EXT_SVPBMT},
> +	{"svvptc", KVM_RISCV_ISA_EXT_SVVPTC},
>  	{"zacas", KVM_RISCV_ISA_EXT_ZACAS},
>  	{"zawrs", KVM_RISCV_ISA_EXT_ZAWRS},
>  	{"zba", KVM_RISCV_ISA_EXT_ZBA},
> diff --git a/riscv/include/kvm/kvm-config-arch.h b/riscv/include/kvm/kvm-config-arch.h
> index e56610b..ae01e14 100644
> --- a/riscv/include/kvm/kvm-config-arch.h
> +++ b/riscv/include/kvm/kvm-config-arch.h
> @@ -58,6 +58,9 @@ struct kvm_config_arch {
>  	OPT_BOOLEAN('\0', "disable-svpbmt",				\
>  		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_SVPBMT],	\
>  		    "Disable Svpbmt Extension"),			\
> +	OPT_BOOLEAN('\0', "disable-svvptc",				\
> +		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_SVVPTC],	\
> +		    "Disable Svvptc Extension"),			\
>  	OPT_BOOLEAN('\0', "disable-zacas",				\
>  		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZACAS],	\
>  		    "Disable Zacas Extension"),				\
> -- 
> 2.43.0
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
