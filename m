Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CC6AC369AE
	for <kvm-riscv@archiver.kernel.org>; Sat, 12 Apr 2025 13:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XWGhT/GjWIH2Z8t02tQFVefDc8QcLL4+UpEMHewBPNI=; b=BYD7sCO/Szjf9u
	pH1pqGzPbb4WkNjd1Fa8jZgW+8K9cI9NgA4KbkbsXYFBGipxje9UpzBDNIFlw566YlC42f1WkDHN9
	XTl0yqV1WwJGcd6nUmjR31nr4MxyMRA7N27SFUuKwwP4Na6LE/E2HFyag+BKlZCoDfj6chqwLfL0f
	jyAJGn0g5TY4OOzKdEZi3oPu+Z2KlyBUiRYnlbECH5OdOdEqEh1gNcIrumvm5F8G20bc/NmC/IhXF
	w9WvQjBPWyU5Yv1AtY4tZH8tAMazPk2WjC/1KIekvbjppg1o1LTljfT14svxm45YLjk9QjZYww2aD
	KJ8pUujtP4kRQ5h2PhQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3bBj-0000000FxZM-0vMQ;
	Sat, 12 Apr 2025 13:46:27 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3bBg-0000000FxY2-265B
	for kvm-riscv@lists.infradead.org;
	Sat, 12 Apr 2025 13:46:25 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso30975285e9.0
        for <kvm-riscv@lists.infradead.org>; Sat, 12 Apr 2025 06:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1744465583; x=1745070383; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3ItMj6JnKUsr/qeQhHS3wPbqAcg3n4FcqCoPgQhbG4k=;
        b=khUy/JTWf4JW+z43tm/jl9QwckHYrw4mQonur9/k10JDDSW4t6kho0h/ZcalX8n+tb
         +4mTTzsdBp7yVS+xz65OpbGKHvG1XZ7gtEg895J9LrrgELuRrC4VkdQqEFzZe+lvOOzm
         bYf9WDF/t9tuaymHdu53Yzlqi9FrOf+PYeIWKv6UtDM2i9wW9Z7kH7lBMQJ4gMNAh3/7
         ZbC5JLEsostcvn/lOphdp4BReTtP+4jDDgYJqJbuxQkSNX0filtF7qBgL5RMRAnyDEH+
         U0+AdLj1Mw9QxSKB7OpeRfyda98FlS46ZRvnVpn+e6MvJ7e0ZCVzIQmKb/IqegzanoBW
         WDnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744465583; x=1745070383;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ItMj6JnKUsr/qeQhHS3wPbqAcg3n4FcqCoPgQhbG4k=;
        b=PE/UX8YnXZsoLQjDwie8yPZ6R3dsm3hrY4a8/kLEXGlpmhtmAxSO8zfwk3pdH5oyRb
         ajhgZeBZtbfqGneKYFeW49YOlDQaRY23M/xKz2gLd4MdhWSP0XS2yLx3NTFUp70QtLph
         fveGmUPLY9bc7K+iPDMQQStk8dfLvdstQXKEJ2EIxBof/sl8jblG51c02WKSGhyUgES/
         gwH9zO7uIZGFH80JsneTCIUXhnUZdpIKDvtV1eyEx1bhb7HebZJm8mYZj/oDuh7+k5Zp
         OhAnNvd1e7Gp9ym3ZWeaVxZAEDXlKLYhRa0w4eDmJcP+7iKnuINmPHZgzHd/oUnMvpLz
         jq4w==
X-Forwarded-Encrypted: i=1; AJvYcCVwBifYfe/28q86MKk+yZ420njjHYP3m4XH0EZotgNDQb8biPnVLXvWiG0iIbK2SmGQe35/uYu3/Qo=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxj4D/GM+4zWIjgdjQlImfVqQjeVnx9g0LF8slNgrNEQribXNuA
	lPEe5G9rT2PYe3nHEBjHND5MvisdLbbHPS95BgKwifPXThNtazp83alsHwvKIHo=
X-Gm-Gg: ASbGncv2GM7lMDUUQ5MScsgBAjLB3OIbrAcxndF2Wdgjxr1mWBpNDMrb32UkM+dxlsB
	/VKswJjJu554YTzf6qTtkAbvXXKiKm9q6AknP/Cmzv02OKb4VeH1adTwhSZw2RPAems4ZCdlm1k
	iddnk68TtKYyGBATVVj+pZM2OB9y26J+zfAujIv5gD+12ilXd2idv4XAxc7gSHZOH9FSsIRRkKc
	J5Kn06d4fhawlv0beKrNcn+eLfCLyMMrIp5hZV9DJXfv6BlCVhPcnMhivILn2WR61ZdtHqR/Ckw
	tOXTnDTZtsFr/GX/9SpWfmoJ995kVM/QeY5kOoOukf2eyvILbF38kFsao3FRRjsA5XAXIA==
X-Google-Smtp-Source: AGHT+IGhIj51K0rBZGmzAELools4onnOSFFF+wLV9YmwrbiQoYSzdN6+y8+uscQg379NDDj7DXmFoQ==
X-Received: by 2002:a05:600c:354f:b0:43d:2230:300f with SMTP id 5b1f17b1804b1-43f3a7db98bmr54874755e9.0.1744465582816;
        Sat, 12 Apr 2025 06:46:22 -0700 (PDT)
Received: from localhost (cst2-173-28.cust.vodafone.cz. [31.30.173.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf447777sm5016740f8f.100.2025.04.12.06.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 06:46:22 -0700 (PDT)
Date: Sat, 12 Apr 2025 15:46:21 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Will Deacon <will@kernel.org>, julien.thierry.kdev@gmail.com, 
	maz@kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
Subject: Re: [kvmtool PATCH 04/10] riscv: Add Ziccrse extension support
Message-ID: <20250412-85ac68d1bc912d739c511ccf@orel>
References: <20250326065644.73765-1-apatel@ventanamicro.com>
 <20250326065644.73765-5-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250326065644.73765-5-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250412_064624_549848_DE2BE9AF 
X-CRM114-Status: GOOD (  14.59  )
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

On Wed, Mar 26, 2025 at 12:26:38PM +0530, Anup Patel wrote:
> When the Ziccrse extension is available expose it to the guest
> via device tree so that guest can use it.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  riscv/fdt.c                         | 1 +
>  riscv/include/kvm/kvm-config-arch.h | 3 +++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/riscv/fdt.c b/riscv/fdt.c
> index ddd0b28..3ee20a9 100644
> --- a/riscv/fdt.c
> +++ b/riscv/fdt.c
> @@ -48,6 +48,7 @@ struct isa_ext_info isa_info_arr[] = {
>  	{"zfhmin", KVM_RISCV_ISA_EXT_ZFHMIN},
>  	{"zicbom", KVM_RISCV_ISA_EXT_ZICBOM},
>  	{"zicboz", KVM_RISCV_ISA_EXT_ZICBOZ},
> +	{"ziccrse", KVM_RISCV_ISA_EXT_ZICCRSE},
>  	{"zicntr", KVM_RISCV_ISA_EXT_ZICNTR},
>  	{"zicond", KVM_RISCV_ISA_EXT_ZICOND},
>  	{"zicsr", KVM_RISCV_ISA_EXT_ZICSR},
> diff --git a/riscv/include/kvm/kvm-config-arch.h b/riscv/include/kvm/kvm-config-arch.h
> index d86158d..5badb74 100644
> --- a/riscv/include/kvm/kvm-config-arch.h
> +++ b/riscv/include/kvm/kvm-config-arch.h
> @@ -121,6 +121,9 @@ struct kvm_config_arch {
>  	OPT_BOOLEAN('\0', "disable-zicboz",				\
>  		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZICBOZ],	\
>  		    "Disable Zicboz Extension"),			\
> +	OPT_BOOLEAN('\0', "disable-ziccrse",				\
> +		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZICCRSE],	\
> +		    "Disable Ziccrse Extension"),			\
>  	OPT_BOOLEAN('\0', "disable-zicntr",				\
>  		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZICNTR],	\
>  		    "Disable Zicntr Extension"),			\
> -- 
> 2.43.0
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
