Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30143C369B2
	for <kvm-riscv@archiver.kernel.org>; Sat, 12 Apr 2025 13:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YzENl/+r7xEQAuaokZj+HInUQiaTgApJeSZuuhyuN5Q=; b=yQ7/7kgNFQYX2p
	4x/6kTaQA3gAZsheeBZANT6Si5x6p1WTCLdWprX42ak2KXB4LJfKFiIyDQYeJbwmi0PdNvuzTLSLe
	jQjHHcbcle12K3xDp5VbLjCOY0DDtP23VKLiA2GkJHlFOWJqLSPUVwn4qq0BImUT5lMS+Z6H0W8qG
	1mZbLjnbv0hnve+QNbqR6AMveJOGFH7H2SSCIy2z3OkknHGkgkEZkcyuCYeWES2WVvULjkT9FBahc
	B1ZehDYGcZt6rslXOAaSsRyf89kOVbZSkIx/ZagHOR2o1NrVTXVG3Fr2j1HgGn8nWablfE1NJ1U2e
	9/0SYvXf43FbKuVvSasA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3bBX-0000000FxVo-3rZE;
	Sat, 12 Apr 2025 13:46:15 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3bBV-0000000FxUr-2Lun
	for kvm-riscv@lists.infradead.org;
	Sat, 12 Apr 2025 13:46:14 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so30481875e9.1
        for <kvm-riscv@lists.infradead.org>; Sat, 12 Apr 2025 06:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1744465572; x=1745070372; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pitnifmNf4kMzEs+q5r7fxhBWT8usl06IrcAwntd8FM=;
        b=ZFiQHed/Wv88thsUfIjE6psn5OsG50Ob1eBaw0a6XYGaITBhX96kIUAk/YT6ULB/2b
         gwc5scdYzHu18HhFYH+D3VFP3yl+YLDtiqCUDzcZMPX71NNeh1PcocQzm0droS6ZsurP
         8lmM4Coqq+JfGaIMRepFtvBRdpqF4mjtFIyx2uaY7d4zdqWrpQNgm6qdONoYizdHnPuu
         mIYXS30WbaBNu6uvOC2lNbtdiOZbDHCXd9nS/apadIengi9vKcUGNl0uduj6wpSclIIc
         X+DS2r14rgFSUZojIzwwPwyO6l1VZpype2fMK1019j7js01PG+rUifyJYIKVJMO49YFR
         PcXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744465572; x=1745070372;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pitnifmNf4kMzEs+q5r7fxhBWT8usl06IrcAwntd8FM=;
        b=rlVo6n4zdMef8RiYqMACViEholmHVIijKBIpDlphQCEMIu1VoaDJ1y6UNMBo1fC1y3
         5O1faIwYfPDbusL96WCVC31diPGRie14EoE9gRu7aW2LMgFmUDj9K7itzFxXfbajoyTK
         K0YKsNaqfn6+1XRRqL9hqxtN5JQX7PaC6VNQBnPZFtDm1eJaDaPHrrUqmeW0CIqOw8g+
         IifMfZKBODQbs5QDzVINnTnMUYmAB4aTblj2A3P+djkZ1mJvLBNQVKh16YUVjinzUdqC
         KJN/VGBtNISgTeAjldYE5fPvDGbl1jlAe/+SstKV5MPY6EPpkaqIfz76RaBrhZpwyvVM
         b4Fw==
X-Forwarded-Encrypted: i=1; AJvYcCUeq6vlMDw+Wep7UjK+25mb5n8xYhsGCZLHXGcN7JLs+iw70XGPjH9BVr6vXwPCWTCU83UWbsd/Gfc=@lists.infradead.org
X-Gm-Message-State: AOJu0YzWmgC2gi4imhiCx/1jNxMkHHYIPA2cykB6DfNEcuQYW84t+URk
	BnhaTkRE+YYjzgHWSSxNcfItlFJ/4Zhlr8901eCUI7fheHBbWUl00hskCU1IaEw=
X-Gm-Gg: ASbGncvzzFydOGjaCkUTolwJexN4KF/KkunIZapsnB9bbjo39Tgci30p5FgOSuAdi4l
	E+hPsHa/4VIgELdjXWQ6hTN4EEbQEV2xWd2xJH7dazrn+js4BKatLcFCCuPqYZL/Y0oEYI6TVXp
	/+QJTQh9kX0thhqCY5VgfIphI7LypnUTyUz+JpEH0BmOeIaHhA3tLGogfALbJaCtseakACzYrm/
	KU+g4afy509cDus7h6f+OC3mNI0SB214W1NoFnHwZggFVk3FOX1S/p9JjcmDJS9fgFcIBTCM81E
	pAIp1RcIxx4GAsdojmuKwTSod9KRObD5M86MwzBC58hv5jMzoiMpVfPHXsWuIueoOpwtlA==
X-Google-Smtp-Source: AGHT+IEEfKZXQzF5xxNDAExHM/RckYjiaix54vXqc46g8bDQqlznMi+1kxTn/hVnb2+QbKsuB71RaQ==
X-Received: by 2002:a5d:6d82:0:b0:39c:141a:6c67 with SMTP id ffacd0b85a97d-39eaaed2101mr5690530f8f.45.1744465571790;
        Sat, 12 Apr 2025 06:46:11 -0700 (PDT)
Received: from localhost (cst2-173-28.cust.vodafone.cz. [31.30.173.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae979637sm5176021f8f.53.2025.04.12.06.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 06:46:11 -0700 (PDT)
Date: Sat, 12 Apr 2025 15:46:10 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Will Deacon <will@kernel.org>, julien.thierry.kdev@gmail.com, 
	maz@kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
Subject: Re: [kvmtool PATCH 03/10] riscv: Add Zabha extension support
Message-ID: <20250412-23464c54bfc11b04c8f4cefd@orel>
References: <20250326065644.73765-1-apatel@ventanamicro.com>
 <20250326065644.73765-4-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250326065644.73765-4-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250412_064613_600367_8C573A88 
X-CRM114-Status: GOOD (  14.58  )
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

On Wed, Mar 26, 2025 at 12:26:37PM +0530, Anup Patel wrote:
> When the Zabha extension is available expose it to the guest
> via device tree so that guest can use it.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  riscv/fdt.c                         | 1 +
>  riscv/include/kvm/kvm-config-arch.h | 3 +++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/riscv/fdt.c b/riscv/fdt.c
> index c1e688d..ddd0b28 100644
> --- a/riscv/fdt.c
> +++ b/riscv/fdt.c
> @@ -28,6 +28,7 @@ struct isa_ext_info isa_info_arr[] = {
>  	{"svnapot", KVM_RISCV_ISA_EXT_SVNAPOT},
>  	{"svpbmt", KVM_RISCV_ISA_EXT_SVPBMT},
>  	{"svvptc", KVM_RISCV_ISA_EXT_SVVPTC},
> +	{"zabha", KVM_RISCV_ISA_EXT_ZABHA},
>  	{"zacas", KVM_RISCV_ISA_EXT_ZACAS},
>  	{"zawrs", KVM_RISCV_ISA_EXT_ZAWRS},
>  	{"zba", KVM_RISCV_ISA_EXT_ZBA},
> diff --git a/riscv/include/kvm/kvm-config-arch.h b/riscv/include/kvm/kvm-config-arch.h
> index ae01e14..d86158d 100644
> --- a/riscv/include/kvm/kvm-config-arch.h
> +++ b/riscv/include/kvm/kvm-config-arch.h
> @@ -61,6 +61,9 @@ struct kvm_config_arch {
>  	OPT_BOOLEAN('\0', "disable-svvptc",				\
>  		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_SVVPTC],	\
>  		    "Disable Svvptc Extension"),			\
> +	OPT_BOOLEAN('\0', "disable-zabha",				\
> +		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZABHA],	\
> +		    "Disable Zabha Extension"),				\
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
