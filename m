Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81272C369C2
	for <kvm-riscv@archiver.kernel.org>; Fri, 25 Apr 2025 13:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s91TSYrPoMcRv2dI2OTwofUI7JT0qeH5fFv93PNtJq8=; b=zB9Pn8+ctSSgxO
	ThCqN8546NcgRfxzx+a+P250ZlzPhTn4A9ql6pfzetMZz4j4ukkdOFFozso6HproBFHRdJAw8g31x
	OrS5oV3r0MHOXUffz/RBYkI3sbxWN4CebMT0C/J78Bp6yYWL7o9fdxy+/IrkiPOUAI9CjS8CqrQGB
	P74S19wKAwZEHzasf/IiO0gNeKHnwy6ISNFOXAwJc/FoxG0L2X684LSKQxCSXDzwp6vzYOCkAJPWE
	WV8pkAo/gjbQZYN4/EBhEH+bbA5FS3EwCg2yh1e/tANy5NIaoAQNkq+iiQIsYOJI5NpJSvK9f3z1N
	rd6ci7nNVkh4GTgZRqVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Isa-0000000HEn1-1Aqa;
	Fri, 25 Apr 2025 13:14:08 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Hzh-0000000H64q-1Qhf
	for kvm-riscv@lists.infradead.org;
	Fri, 25 Apr 2025 12:17:26 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3914bc3e01aso1295352f8f.2
        for <kvm-riscv@lists.infradead.org>; Fri, 25 Apr 2025 05:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745583443; x=1746188243; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WibkZrDKzvfi3G7rZmSKeApBqtFqeCyWCbDIwQfILyE=;
        b=hWE23BfOyBWVj/6iNfEMkOGUd96rwmnH0Wn+PdoOxsh8Hw60xj8ymG0YDrrJHK70Je
         o35N3q2vXVPccgb03BlvHjGGUtCi7UDlAI+ufFettl+uDU4HUWGv65ZOxTg+dAIuiOPL
         jn6pdGMYB+3daVZZ8k3IUVANbNSj9/lAnePsJzUCegtf6F1PMgZXLoKrnUHd7rntb7fa
         xTAjbDT42t1W5ADhXpTbalOO7oLk8T1IJS8mcpdECGol5w7PXZaRzsKx+q26/FQjWSMe
         Fgl5FMcNz9DIqzvJeIKiPHjRyeuYtuRLb6tT7xeO3eP/Z/wz3u/TZaaLmNWY0UyzgQy6
         tYcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745583443; x=1746188243;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WibkZrDKzvfi3G7rZmSKeApBqtFqeCyWCbDIwQfILyE=;
        b=cuR5w+WGXrABsxNWHhEfrTkD62nSoplvKpiNRHhMxMjLeFNmgKvqSZg/1QwQk++9TE
         8flfJgm/F7u47C1YO1cCAScb20M9+jMdVc0wLH8nEVJkPUS64G/3OnoPcH/9tGfAshqw
         q6izCPKePDn9kNMkVBaO91R1fpxxzMLjyIvyUhJOFNHS4vSULi/N/sPtVXHRRJGhVGJ1
         cagU0AG2hZkL/H+fh9wUkOQX40XSx4mraIHquXfPkK6jcCWlOLGpukdpxGrlMzcOvAjo
         Npcmaqd34yyss6AP4v0MlkoJ354WRGptBrhpUiLITTDMgzDCLK/js9JH/dSK7T8GjGzj
         iTYg==
X-Forwarded-Encrypted: i=1; AJvYcCXwWBQaY1j8PvuRocopIDL1lNORlyQNnReIqzwGysl9h/2nJwddLN3zSt2KWF7mASxfzI2hyX2Rycg=@lists.infradead.org
X-Gm-Message-State: AOJu0YzUmalK13FPQaNSgXK2ugWfB6gtNfgxVUphcTEeEbMryiCkAibk
	RxqZxIOPs7m9GSt7PiwZlxbHOcMKng8C01MzMXGrSnCuISlNP8OLsyByZ3S9iRQ=
X-Gm-Gg: ASbGncvEfRPu3mxrGgHs1ijpr+YjxnhYpDBDn7SX50MHQWYXR+55A/1fu9xHaidwJPU
	n+tRgxyFla3aQOAG7xzykqk3RnZInDpi+Xzm3Rbcnv/S3u2FSsRcHtT1tsYAbTFz0URQUErw5P6
	Zt/ESuK29BvjddrKTpITey4wVdm3DSL1kU82OA+KzjnYgKSR1nbtnN320PwbDJGjLPGjj5bCwaj
	IoV3ftId3eiyXZSe2fKfYKWM+mutMQd656ot9OIDW9ph/2T0hJ5R/1s4WVN1EGRVPuv2grU4ep3
	zBTlNz+Z7D++1J7h8dfu5o/uDHtq
X-Google-Smtp-Source: AGHT+IGvbfIuxK82iG0u5rSodKLy4DsPmTIfxgB3o7veQffz0NDPCYY7ygbsNtXK7AFFdp2eEixL7Q==
X-Received: by 2002:a05:6000:1b8e:b0:39c:1159:fe1f with SMTP id ffacd0b85a97d-3a074e3cf41mr1192720f8f.32.1745583443213;
        Fri, 25 Apr 2025 05:17:23 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::f716])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e46981sm2194623f8f.66.2025.04.25.05.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 05:17:22 -0700 (PDT)
Date: Fri, 25 Apr 2025 14:17:21 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Will Deacon <will@kernel.org>, julien.thierry.kdev@gmail.com, 
	maz@kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
Subject: Re: [kvmtool PATCH v2 08/10] riscv: Include single-letter extensions
 in isa_info_arr[]
Message-ID: <20250425-0f39ec38672654751a973614@orel>
References: <20250424153159.289441-1-apatel@ventanamicro.com>
 <20250424153159.289441-9-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250424153159.289441-9-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_051725_380729_5E3E1064 
X-CRM114-Status: GOOD (  20.41  )
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

On Thu, Apr 24, 2025 at 09:01:57PM +0530, Anup Patel wrote:
> Currently, the isa_info_arr[] only include multi-letter extensions but
> the KVM ONE_REG interface covers both single-letter and multi-letter
> extensions so extend isa_info_arr[] to include single-letter extensions.
> 
> This also allows combining two loops in the generate_cpu_nodes()
> function into one loop.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  riscv/fdt.c | 148 +++++++++++++++++++++++++++-------------------------
>  1 file changed, 76 insertions(+), 72 deletions(-)
> 
> diff --git a/riscv/fdt.c b/riscv/fdt.c
> index 251821e..c741fd8 100644
> --- a/riscv/fdt.c
> +++ b/riscv/fdt.c
> @@ -12,71 +12,81 @@
>  struct isa_ext_info {
>  	const char *name;
>  	unsigned long ext_id;
> +	bool single_letter;
>  };
>  
>  struct isa_ext_info isa_info_arr[] = {
> -	/* sorted alphabetically */
> -	{"smnpm", KVM_RISCV_ISA_EXT_SMNPM},
> -	{"smstateen", KVM_RISCV_ISA_EXT_SMSTATEEN},
> -	{"ssaia", KVM_RISCV_ISA_EXT_SSAIA},
> -	{"sscofpmf", KVM_RISCV_ISA_EXT_SSCOFPMF},
> -	{"ssnpm", KVM_RISCV_ISA_EXT_SSNPM},
> -	{"sstc", KVM_RISCV_ISA_EXT_SSTC},
> -	{"svade", KVM_RISCV_ISA_EXT_SVADE},
> -	{"svadu", KVM_RISCV_ISA_EXT_SVADU},
> -	{"svinval", KVM_RISCV_ISA_EXT_SVINVAL},
> -	{"svnapot", KVM_RISCV_ISA_EXT_SVNAPOT},
> -	{"svpbmt", KVM_RISCV_ISA_EXT_SVPBMT},
> -	{"svvptc", KVM_RISCV_ISA_EXT_SVVPTC},
> -	{"zabha", KVM_RISCV_ISA_EXT_ZABHA},
> -	{"zacas", KVM_RISCV_ISA_EXT_ZACAS},
> -	{"zawrs", KVM_RISCV_ISA_EXT_ZAWRS},
> -	{"zba", KVM_RISCV_ISA_EXT_ZBA},
> -	{"zbb", KVM_RISCV_ISA_EXT_ZBB},
> -	{"zbc", KVM_RISCV_ISA_EXT_ZBC},
> -	{"zbkb", KVM_RISCV_ISA_EXT_ZBKB},
> -	{"zbkc", KVM_RISCV_ISA_EXT_ZBKC},
> -	{"zbkx", KVM_RISCV_ISA_EXT_ZBKX},
> -	{"zbs", KVM_RISCV_ISA_EXT_ZBS},
> -	{"zca", KVM_RISCV_ISA_EXT_ZCA},
> -	{"zcb", KVM_RISCV_ISA_EXT_ZCB},
> -	{"zcd", KVM_RISCV_ISA_EXT_ZCD},
> -	{"zcf", KVM_RISCV_ISA_EXT_ZCF},
> -	{"zcmop", KVM_RISCV_ISA_EXT_ZCMOP},
> -	{"zfa", KVM_RISCV_ISA_EXT_ZFA},
> -	{"zfh", KVM_RISCV_ISA_EXT_ZFH},
> -	{"zfhmin", KVM_RISCV_ISA_EXT_ZFHMIN},
> -	{"zicbom", KVM_RISCV_ISA_EXT_ZICBOM},
> -	{"zicboz", KVM_RISCV_ISA_EXT_ZICBOZ},
> -	{"ziccrse", KVM_RISCV_ISA_EXT_ZICCRSE},
> -	{"zicntr", KVM_RISCV_ISA_EXT_ZICNTR},
> -	{"zicond", KVM_RISCV_ISA_EXT_ZICOND},
> -	{"zicsr", KVM_RISCV_ISA_EXT_ZICSR},
> -	{"zifencei", KVM_RISCV_ISA_EXT_ZIFENCEI},
> -	{"zihintntl", KVM_RISCV_ISA_EXT_ZIHINTNTL},
> -	{"zihintpause", KVM_RISCV_ISA_EXT_ZIHINTPAUSE},
> -	{"zihpm", KVM_RISCV_ISA_EXT_ZIHPM},
> -	{"zimop", KVM_RISCV_ISA_EXT_ZIMOP},
> -	{"zknd", KVM_RISCV_ISA_EXT_ZKND},
> -	{"zkne", KVM_RISCV_ISA_EXT_ZKNE},
> -	{"zknh", KVM_RISCV_ISA_EXT_ZKNH},
> -	{"zkr", KVM_RISCV_ISA_EXT_ZKR},
> -	{"zksed", KVM_RISCV_ISA_EXT_ZKSED},
> -	{"zksh", KVM_RISCV_ISA_EXT_ZKSH},
> -	{"zkt", KVM_RISCV_ISA_EXT_ZKT},
> -	{"ztso", KVM_RISCV_ISA_EXT_ZTSO},
> -	{"zvbb", KVM_RISCV_ISA_EXT_ZVBB},
> -	{"zvbc", KVM_RISCV_ISA_EXT_ZVBC},
> -	{"zvfh", KVM_RISCV_ISA_EXT_ZVFH},
> -	{"zvfhmin", KVM_RISCV_ISA_EXT_ZVFHMIN},
> -	{"zvkb", KVM_RISCV_ISA_EXT_ZVKB},
> -	{"zvkg", KVM_RISCV_ISA_EXT_ZVKG},
> -	{"zvkned", KVM_RISCV_ISA_EXT_ZVKNED},
> -	{"zvknha", KVM_RISCV_ISA_EXT_ZVKNHA},
> -	{"zvknhb", KVM_RISCV_ISA_EXT_ZVKNHB},
> -	{"zvksed", KVM_RISCV_ISA_EXT_ZVKSED},
> -	{"zvksh", KVM_RISCV_ISA_EXT_ZVKSH},
> -	{"zvkt", KVM_RISCV_ISA_EXT_ZVKT},
> +	/* single-letter ordered canonically as "IEMAFDQCLBJTPVNSUHKORWXYZG" */
> +	{"i",		KVM_RISCV_ISA_EXT_I,	.single_letter = true},
> +	{"m",		KVM_RISCV_ISA_EXT_M,	.single_letter = true},
> +	{"a",		KVM_RISCV_ISA_EXT_A,	.single_letter = true},
> +	{"f",		KVM_RISCV_ISA_EXT_F,	.single_letter = true},
> +	{"d",		KVM_RISCV_ISA_EXT_D,	.single_letter = true},
> +	{"c",		KVM_RISCV_ISA_EXT_C,	.single_letter = true},
> +	{"v",		KVM_RISCV_ISA_EXT_V,	.single_letter = true},
> +	{"h",		KVM_RISCV_ISA_EXT_H,	.single_letter = true},
> +	/* multi-letter sorted alphabetically */
> +	{"smnpm",	KVM_RISCV_ISA_EXT_SMNPM},
> +	{"smstateen",	KVM_RISCV_ISA_EXT_SMSTATEEN},
> +	{"ssaia",	KVM_RISCV_ISA_EXT_SSAIA},
> +	{"sscofpmf",	KVM_RISCV_ISA_EXT_SSCOFPMF},
> +	{"ssnpm",	KVM_RISCV_ISA_EXT_SSNPM},
> +	{"sstc",	KVM_RISCV_ISA_EXT_SSTC},
> +	{"svade",	KVM_RISCV_ISA_EXT_SVADE},
> +	{"svadu",	KVM_RISCV_ISA_EXT_SVADU},
> +	{"svinval",	KVM_RISCV_ISA_EXT_SVINVAL},
> +	{"svnapot",	KVM_RISCV_ISA_EXT_SVNAPOT},
> +	{"svpbmt",	KVM_RISCV_ISA_EXT_SVPBMT},
> +	{"svvptc",	KVM_RISCV_ISA_EXT_SVVPTC},
> +	{"zabha",	KVM_RISCV_ISA_EXT_ZABHA},
> +	{"zacas",	KVM_RISCV_ISA_EXT_ZACAS},
> +	{"zawrs",	KVM_RISCV_ISA_EXT_ZAWRS},
> +	{"zba",		KVM_RISCV_ISA_EXT_ZBA},
> +	{"zbb",		KVM_RISCV_ISA_EXT_ZBB},
> +	{"zbc",		KVM_RISCV_ISA_EXT_ZBC},
> +	{"zbkb",	KVM_RISCV_ISA_EXT_ZBKB},
> +	{"zbkc",	KVM_RISCV_ISA_EXT_ZBKC},
> +	{"zbkx",	KVM_RISCV_ISA_EXT_ZBKX},
> +	{"zbs",		KVM_RISCV_ISA_EXT_ZBS},
> +	{"zca",		KVM_RISCV_ISA_EXT_ZCA},
> +	{"zcb",		KVM_RISCV_ISA_EXT_ZCB},
> +	{"zcd",		KVM_RISCV_ISA_EXT_ZCD},
> +	{"zcf",		KVM_RISCV_ISA_EXT_ZCF},
> +	{"zcmop",	KVM_RISCV_ISA_EXT_ZCMOP},
> +	{"zfa",		KVM_RISCV_ISA_EXT_ZFA},
> +	{"zfh",		KVM_RISCV_ISA_EXT_ZFH},
> +	{"zfhmin",	KVM_RISCV_ISA_EXT_ZFHMIN},
> +	{"zicbom",	KVM_RISCV_ISA_EXT_ZICBOM},
> +	{"zicboz",	KVM_RISCV_ISA_EXT_ZICBOZ},
> +	{"ziccrse",	KVM_RISCV_ISA_EXT_ZICCRSE},
> +	{"zicntr",	KVM_RISCV_ISA_EXT_ZICNTR},
> +	{"zicond",	KVM_RISCV_ISA_EXT_ZICOND},
> +	{"zicsr",	KVM_RISCV_ISA_EXT_ZICSR},
> +	{"zifencei",	KVM_RISCV_ISA_EXT_ZIFENCEI},
> +	{"zihintntl",	KVM_RISCV_ISA_EXT_ZIHINTNTL},
> +	{"zihintpause",	KVM_RISCV_ISA_EXT_ZIHINTPAUSE},
> +	{"zihpm",	KVM_RISCV_ISA_EXT_ZIHPM},
> +	{"zimop",	KVM_RISCV_ISA_EXT_ZIMOP},
> +	{"zknd",	KVM_RISCV_ISA_EXT_ZKND},
> +	{"zkne",	KVM_RISCV_ISA_EXT_ZKNE},
> +	{"zknh",	KVM_RISCV_ISA_EXT_ZKNH},
> +	{"zkr",		KVM_RISCV_ISA_EXT_ZKR},
> +	{"zksed",	KVM_RISCV_ISA_EXT_ZKSED},
> +	{"zksh",	KVM_RISCV_ISA_EXT_ZKSH},
> +	{"zkt",		KVM_RISCV_ISA_EXT_ZKT},
> +	{"ztso",	KVM_RISCV_ISA_EXT_ZTSO},
> +	{"zvbb",	KVM_RISCV_ISA_EXT_ZVBB},
> +	{"zvbc",	KVM_RISCV_ISA_EXT_ZVBC},
> +	{"zvfh",	KVM_RISCV_ISA_EXT_ZVFH},
> +	{"zvfhmin",	KVM_RISCV_ISA_EXT_ZVFHMIN},
> +	{"zvkb",	KVM_RISCV_ISA_EXT_ZVKB},
> +	{"zvkg",	KVM_RISCV_ISA_EXT_ZVKG},
> +	{"zvkned",	KVM_RISCV_ISA_EXT_ZVKNED},
> +	{"zvknha",	KVM_RISCV_ISA_EXT_ZVKNHA},
> +	{"zvknhb",	KVM_RISCV_ISA_EXT_ZVKNHB},
> +	{"zvksed",	KVM_RISCV_ISA_EXT_ZVKSED},
> +	{"zvksh",	KVM_RISCV_ISA_EXT_ZVKSH},
> +	{"zvkt",	KVM_RISCV_ISA_EXT_ZVKT},
>  };
>  
>  static void dump_fdt(const char *dtb_file, void *fdt)
> @@ -98,10 +108,8 @@ static void dump_fdt(const char *dtb_file, void *fdt)
>  #define CPU_NAME_MAX_LEN 15
>  static void generate_cpu_nodes(void *fdt, struct kvm *kvm)
>  {
> -	int cpu, pos, i, index, valid_isa_len;
> -	const char *valid_isa_order = "IEMAFDQCLBJTPVNSUHKORWXYZG";
> -	int arr_sz = ARRAY_SIZE(isa_info_arr);
>  	unsigned long cbom_blksz = 0, cboz_blksz = 0, satp_mode = 0;
> +	int i, cpu, pos, arr_sz = ARRAY_SIZE(isa_info_arr);
>  
>  	_FDT(fdt_begin_node(fdt, "cpus"));
>  	_FDT(fdt_property_cell(fdt, "#address-cells", 0x1));
> @@ -121,12 +129,6 @@ static void generate_cpu_nodes(void *fdt, struct kvm *kvm)
>  
>  		snprintf(cpu_isa, CPU_ISA_MAX_LEN, "rv%ld", vcpu->riscv_xlen);
>  		pos = strlen(cpu_isa);
> -		valid_isa_len = strlen(valid_isa_order);
> -		for (i = 0; i < valid_isa_len; i++) {
> -			index = valid_isa_order[i] - 'A';
> -			if (vcpu->riscv_isa & (1 << (index)))
> -				cpu_isa[pos++] = 'a' + index;
> -		}
>  
>  		for (i = 0; i < arr_sz; i++) {
>  			reg.id = RISCV_ISA_EXT_REG(isa_info_arr[i].ext_id);
> @@ -164,7 +166,9 @@ static void generate_cpu_nodes(void *fdt, struct kvm *kvm)
>  					   isa_info_arr[i].name);
>  				break;
>  			}
> -			pos += snprintf(cpu_isa + pos, CPU_ISA_MAX_LEN - pos, "_%s",
> +
> +			pos += snprintf(cpu_isa + pos, CPU_ISA_MAX_LEN - pos, "%s%s",
> +					isa_info_arr[i].single_letter ? "" : "_",
>  					isa_info_arr[i].name);
>  		}
>  		cpu_isa[pos] = '\0';
> -- 
> 2.43.0
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
