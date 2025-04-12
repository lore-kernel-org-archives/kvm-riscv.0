Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73786C369AE
	for <kvm-riscv@archiver.kernel.org>; Sat, 12 Apr 2025 13:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=23YxUVJxcgZiQQU/J6RRcaspepbftCtmstuuPMQZ2gg=; b=QwVXrSOAg5zaJF
	0JXgXmrpVnnIYaWaCnY4GIuzJYVprp7Yu7AScrvDWTTOVH0+uDMq7p7AldUOFjnTt6PY6wk5beIhM
	rXo+0pIHNFslJRJy/4ELApQLxhEh3fQOYVG+ac4B6Uc9INbh2bFG/PBdQrFNpfj3pHR6fXHDZJw0K
	PV+dmq/jrSlccK83rFXr0x7tjvxZzQYQv/yPVwt1rJAWBnGJk1MVvk6GvDvkE1kmVHNlp31n19vj1
	+Qcr+MLiLRC1EXBdfYIaQAoNb6r7LhAUrEchlqpB7JDlZQ/jOxAVVuycmDjaswRNHPNy/XoNBVQ4F
	2K8u3qPqPAKYtthctXdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3ahZ-0000000Fupe-09TR;
	Sat, 12 Apr 2025 13:15:17 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3ahW-0000000FupB-0ILW
	for kvm-riscv@lists.infradead.org;
	Sat, 12 Apr 2025 13:15:15 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4394a823036so29103575e9.0
        for <kvm-riscv@lists.infradead.org>; Sat, 12 Apr 2025 06:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1744463712; x=1745068512; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vk9M9cv/yZtQ1Q/cI8rdvJlhirTLHRA9AIIrEpRwkgA=;
        b=WmY141S3jdXTfKZvIv/mG2H0rYDwyyiaiyFeamRyM7KVTWCCnokI+oYL2Ney6L1jLc
         SSOtakHNOuos0NmfHnAEH1wa8R2Si3bYrN0MvvlrwV6Bq+akxxprU27xQ5cXjTJro2vA
         t9/8i2T951sOUEjGu7Fz755i7Jvan6jxz+ZzMFNdDXhmJOiAPiiIv32LxAI873+utqUX
         h8U7oZ06uKdOBhgz4p6iwd8sokGviVp8hYnck4+x79h+u8XJrI0Mkb6rSVzKZ7xONd+2
         KmTcqbjPqqUu5BJxmv1ujM7mGWFvmB2ffu8FC7q/r4sG8q8KXCCcz8KqzafV6d3dJqDI
         da6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744463712; x=1745068512;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vk9M9cv/yZtQ1Q/cI8rdvJlhirTLHRA9AIIrEpRwkgA=;
        b=nDYJ0223GJy7n0dFgenAM4qUd+9GrNZNER2ln7M+S26XPHMDIGRg/MrQ0+lad1aByt
         F5p6AJC+SSjTvnMg1mOeZjLOlbv/c4kkiKP+FtX2+IGd1DgF2l+JLkz3mDy16aVAlsb3
         5cgHvLAmM17DMnesMD1IoEP0Rei2bPO3tCu2DXK20CJDcDGyyPr8Uv1n8zhGjuKjnent
         M77YkBN71j/icT+Ch5tUDMyJzf2KFomlJa5VqcyQ/8LlUCcUPhm9qOKsuOvALDKIA+KR
         UYOM+ikvaYU8nF6F83wxXKdXlo5oOjhz2A8LNTwJTGOLUGFF0jan3Gdh4cSQ2Qa6gV67
         Mcig==
X-Forwarded-Encrypted: i=1; AJvYcCXTM+QKV2F7uQSdVJg4sUtZsgvP/ApM0Hwu3ZeKS0mSzztPbcZUNkA0YlXZyyxSl+uS1w5o4abhT78=@lists.infradead.org
X-Gm-Message-State: AOJu0YzgVCiSNfxvFGgeOMb/TAPsnVoKA0fIrxkIlXKCD3TG9+EUk9ji
	4XqarBJPSHTpVLA4jOveYW+DItNjuSCLcQD2ZT1CBmVywYOB9o474h3XDs2Y/T0=
X-Gm-Gg: ASbGncscUlNwwUPfVhUyNaVdEAVaJMyNirsdqooMgw/LBgJ2LCEsxnLX2ItT2rxd5bx
	OCLL07lUhoScQNQVJmMq8atLHzK3ikSPijt1jU5CDjQHNTzqgdlPfDfuw1ghYnexXu5sRwHlVFR
	lKIjT7YksPmn8EN+IZYGdyClaV4girQr1bncs260Km///uANX8Ii7zmtqj97FHv848vie6++E3Y
	+3M+193tWe3x+050wP6MKGbq8Ige2HsKXSNGlHmSDvP8WzcRNN2RpkJJ/0dMUDX+7GavPZasG7s
	gcqctPhx/46O5qlQGJMXebvETbbcJrbdM7dRHneYxEmN8OHdY2qyRyC2MPNajg5B1IOS8Q==
X-Google-Smtp-Source: AGHT+IE9OkevdIYrGwJunEmMap5IGHkQ2yzwRVq7OO6cwa+zFIHDZ9wb3Q5aKAqPtVNGxVyInCUcUg==
X-Received: by 2002:a05:6000:4305:b0:385:fd07:8616 with SMTP id ffacd0b85a97d-39e9f3c933amr4770129f8f.0.1744463711955;
        Sat, 12 Apr 2025 06:15:11 -0700 (PDT)
Received: from localhost (cst2-173-28.cust.vodafone.cz. [31.30.173.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96bf97sm4968707f8f.25.2025.04.12.06.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 06:15:11 -0700 (PDT)
Date: Sat, 12 Apr 2025 15:15:10 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Will Deacon <will@kernel.org>, julien.thierry.kdev@gmail.com, 
	maz@kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
Subject: Re: [kvmtool PATCH 09/10] riscv: Add cpu-type command-line option
Message-ID: <20250412-6eb18b693df1bd8959bcdfc6@orel>
References: <20250326065644.73765-1-apatel@ventanamicro.com>
 <20250326065644.73765-10-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250326065644.73765-10-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250412_061514_119668_4363E306 
X-CRM114-Status: GOOD (  37.90  )
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

On Wed, Mar 26, 2025 at 12:26:43PM +0530, Anup Patel wrote:
> Currently, the KVMTOOL always creates a VM with all available
> ISA extensions virtualized by the in-kernel KVM module.
> 
> For better flexibility, add cpu-type command-line option using
> which users can select one of the available CPU types for VM.
> 
> There are two CPU types supported at the moment namely "min"
> and "max". The "min" CPU type implies VCPU with rv[64|32]imafdc
> ISA whereas the "max" CPU type implies VCPU with all available
> ISA extensions.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  riscv/aia.c                         |   2 +-
>  riscv/fdt.c                         | 220 +++++++++++++++++-----------
>  riscv/include/kvm/kvm-arch.h        |   2 +
>  riscv/include/kvm/kvm-config-arch.h |   5 +
>  riscv/kvm.c                         |   2 +
>  5 files changed, 143 insertions(+), 88 deletions(-)
> 
> diff --git a/riscv/aia.c b/riscv/aia.c
> index 21d9704..cad53d4 100644
> --- a/riscv/aia.c
> +++ b/riscv/aia.c
> @@ -209,7 +209,7 @@ void aia__create(struct kvm *kvm)
>  		.flags = 0,
>  	};
>  
> -	if (kvm->cfg.arch.ext_disabled[KVM_RISCV_ISA_EXT_SSAIA])
> +	if (riscv__isa_extension_disabled(kvm, KVM_RISCV_ISA_EXT_SSAIA))
>  		return;
>  
>  	err = ioctl(kvm->vm_fd, KVM_CREATE_DEVICE, &aia_device);
> diff --git a/riscv/fdt.c b/riscv/fdt.c
> index 46efb47..4c018c8 100644
> --- a/riscv/fdt.c
> +++ b/riscv/fdt.c
> @@ -13,82 +13,134 @@ struct isa_ext_info {
>  	const char *name;
>  	unsigned long ext_id;
>  	bool multi_letter;
> +	bool min_cpu_included;
>  };
>  
>  struct isa_ext_info isa_info_arr[] = {
> -	/* single-letter */
> -	{"a", KVM_RISCV_ISA_EXT_A, false},
> -	{"c", KVM_RISCV_ISA_EXT_C, false},
> -	{"d", KVM_RISCV_ISA_EXT_D, false},
> -	{"f", KVM_RISCV_ISA_EXT_F, false},
> -	{"h", KVM_RISCV_ISA_EXT_H, false},
> -	{"i", KVM_RISCV_ISA_EXT_I, false},
> -	{"m", KVM_RISCV_ISA_EXT_M, false},
> -	{"v", KVM_RISCV_ISA_EXT_V, false},
> +	/* single-letter ordered canonically as "IEMAFDQCLBJTPVNSUHKORWXYZG" */

The comment change and the tabulation should go in the previous patch.

> +	{"i",		KVM_RISCV_ISA_EXT_I,		false, true},
> +	{"m",		KVM_RISCV_ISA_EXT_M,		false, true},
> +	{"a",		KVM_RISCV_ISA_EXT_A,		false, true},
> +	{"f",		KVM_RISCV_ISA_EXT_F,		false, true},
> +	{"d",		KVM_RISCV_ISA_EXT_D,		false, true},
> +	{"c",		KVM_RISCV_ISA_EXT_C,		false, true},
> +	{"v",		KVM_RISCV_ISA_EXT_V,		false, false},
> +	{"h",		KVM_RISCV_ISA_EXT_H,		false, false},

To avoid keeping track of which boolean means what (and taking my .misa
suggestion from the last patch), we can write these as, e.g.

  {"c",		KVM_RISCV_ISA_EXT_C, .misa = true, .min_enabled = true	},
  {"v",		KVM_RISCV_ISA_EXT_V, .misa = true,			},

(Also renamed min_cpu_included to min_enabled since it better matches
 the enabled/disabled concept we use everywhere else.)

And we don't need to change any of the multi-letter extension entries
since we're adding something false for them.

>  	/* multi-letter sorted alphabetically */
> -	{"smnpm", KVM_RISCV_ISA_EXT_SMNPM, true},
...
>  };
>  
> +static bool __isa_ext_disabled(struct kvm *kvm, struct isa_ext_info *info)
> +{
> +	if (!strncmp(kvm->cfg.arch.cpu_type, "min", 3) &&

kvm->cfg.arch.cpu_type can never be anything other than NULL, "min",
"max", so we can just use strcmp.

> +	    !info->min_cpu_included)
> +		return true;

If 'min_cpu_included' (or 'min_enabled') is all we plan to check for
whether or not an extension is enabled for the 'min' cpu type, then
we should write this as

 if (!strcmp(kvm->cfg.arch.cpu_type, "min"))
    return !info->min_enabled;

Otherwise when min_enabled is true we'd still check
kvm->cfg.arch.ext_disabled[info->ext_id].

> +
> +	return kvm->cfg.arch.ext_disabled[info->ext_id];
> +}
> +
> +static bool __isa_ext_warn_disable_failure(struct kvm *kvm, struct isa_ext_info *info)
> +{
> +	if (!strncmp(kvm->cfg.arch.cpu_type, "min", 3) &&

same strcmp comment

> +	    !info->min_cpu_included)
> +		return false;
> +
> +	return true;
> +}
> +
> +bool riscv__isa_extension_disabled(struct kvm *kvm, unsigned long isa_ext_id)
> +{
> +	struct isa_ext_info *info = NULL;
> +	unsigned long i;
> +
> +	for (i = 0; i < ARRAY_SIZE(isa_info_arr); i++) {
> +		if (isa_info_arr[i].ext_id == isa_ext_id) {
> +			info = &isa_info_arr[i];
> +			break;
> +		}
> +	}
> +	if (!info)
> +		return true;
> +
> +	return __isa_ext_disabled(kvm, info);
> +}
> +
> +int riscv__cpu_type_parser(const struct option *opt, const char *arg, int unset)
> +{
> +	struct kvm *kvm = opt->ptr;
> +
> +	if ((strncmp(arg, "min", 3) && strncmp(arg, "max", 3)) || strlen(arg) != 3)
> +		die("Invalid CPU type %s\n", arg);
> +
> +	if (!strncmp(arg, "max", 3))
> +		kvm->cfg.arch.cpu_type = "max";
> +
> +	if (!strncmp(arg, "min", 3))

We can use strcmp for these two checks since we already checked strlen
above. We also already know it's either 'min' or 'max' so we can just
check one and default to the other.

> +		kvm->cfg.arch.cpu_type = "min";
> +
> +	return 0;
> +}
> +
>  static void dump_fdt(const char *dtb_file, void *fdt)
>  {
>  	int count, fd;
> @@ -108,10 +160,8 @@ static void dump_fdt(const char *dtb_file, void *fdt)
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
> @@ -131,18 +181,8 @@ static void generate_cpu_nodes(void *fdt, struct kvm *kvm)
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
> -			/* Skip single-letter extensions since these are taken care */
> -			if (!isa_info_arr[i].multi_letter)
> -				continue;
> -
>  			reg.id = RISCV_ISA_EXT_REG(isa_info_arr[i].ext_id);
>  			reg.addr = (unsigned long)&isa_ext_out;
>  			if (ioctl(vcpu->vcpu_fd, KVM_GET_ONE_REG, &reg) < 0)
> @@ -151,9 +191,10 @@ static void generate_cpu_nodes(void *fdt, struct kvm *kvm)
>  				/* This extension is not available in hardware */
>  				continue;
>  
> -			if (kvm->cfg.arch.ext_disabled[isa_info_arr[i].ext_id]) {
> +			if (__isa_ext_disabled(kvm, &isa_info_arr[i])) {
>  				isa_ext_out = 0;
> -				if (ioctl(vcpu->vcpu_fd, KVM_SET_ONE_REG, &reg) < 0)
> +				if ((ioctl(vcpu->vcpu_fd, KVM_SET_ONE_REG, &reg) < 0) &&

Unnecessary () around the first expression.

> +				     __isa_ext_warn_disable_failure(kvm, &isa_info_arr[i]))
>  					pr_warning("Failed to disable %s ISA exension\n",
>  						   isa_info_arr[i].name);
>  				continue;
> @@ -178,8 +219,13 @@ static void generate_cpu_nodes(void *fdt, struct kvm *kvm)
>  					   isa_info_arr[i].name);
>  				break;
>  			}
> -			pos += snprintf(cpu_isa + pos, CPU_ISA_MAX_LEN - pos, "_%s",
> -					isa_info_arr[i].name);
> +
> +			if (isa_info_arr[i].multi_letter)
> +				pos += snprintf(cpu_isa + pos, CPU_ISA_MAX_LEN - pos, "_%s",
> +						isa_info_arr[i].name);
> +			else
> +				pos += snprintf(cpu_isa + pos, CPU_ISA_MAX_LEN - pos, "%s",
> +						isa_info_arr[i].name);

Can write this as

                        pos += snprintf(cpu_isa + pos, CPU_ISA_MAX_LEN - pos, "%s%s",
                                        isa_info_arr[i].misa ? "" : "_",
					isa_info_arr[i].name);

>  		}
>  		cpu_isa[pos] = '\0';
>  
> diff --git a/riscv/include/kvm/kvm-arch.h b/riscv/include/kvm/kvm-arch.h
> index f0f469f..1bb2d32 100644
> --- a/riscv/include/kvm/kvm-arch.h
> +++ b/riscv/include/kvm/kvm-arch.h
> @@ -90,6 +90,8 @@ enum irqchip_type {
>  	IRQCHIP_AIA
>  };
>  
> +bool riscv__isa_extension_disabled(struct kvm *kvm, unsigned long ext_id);
> +
>  extern enum irqchip_type riscv_irqchip;
>  extern bool riscv_irqchip_inkernel;
>  extern void (*riscv_irqchip_trigger)(struct kvm *kvm, int irq,
> diff --git a/riscv/include/kvm/kvm-config-arch.h b/riscv/include/kvm/kvm-config-arch.h
> index 7e54d8a..26b1b50 100644
> --- a/riscv/include/kvm/kvm-config-arch.h
> +++ b/riscv/include/kvm/kvm-config-arch.h
> @@ -4,6 +4,7 @@
>  #include "kvm/parse-options.h"
>  
>  struct kvm_config_arch {
> +	const char	*cpu_type;
>  	const char	*dump_dtb_filename;
>  	u64		suspend_seconds;
>  	u64		custom_mvendorid;
> @@ -13,8 +14,12 @@ struct kvm_config_arch {
>  	bool		sbi_ext_disabled[KVM_RISCV_SBI_EXT_MAX];
>  };
>  
> +int riscv__cpu_type_parser(const struct option *opt, const char *arg, int unset);
> +
>  #define OPT_ARCH_RUN(pfx, cfg)						\
>  	pfx,								\
> +	OPT_CALLBACK('\0', "cpu-type", kvm, "min or max",		\
> +		     "Choose the cpu type (default is max).", riscv__cpu_type_parser, kvm),\

I had to look ahead at the next patch to understand why we're setting kvm
as the opt pointer here. I think it should be added in the next patch
where it's used. Also, we don't use opt->value so we cna set that to NULL.

>  	OPT_STRING('\0', "dump-dtb", &(cfg)->dump_dtb_filename,		\
>  		   ".dtb file", "Dump generated .dtb to specified file"),\
>  	OPT_U64('\0', "suspend-seconds",				\
> diff --git a/riscv/kvm.c b/riscv/kvm.c
> index 1d49479..6a1b154 100644
> --- a/riscv/kvm.c
> +++ b/riscv/kvm.c
> @@ -20,6 +20,8 @@ u64 kvm__arch_default_ram_address(void)
>  
>  void kvm__arch_validate_cfg(struct kvm *kvm)
>  {
> +	if (!kvm->cfg.arch.cpu_type)
> +		kvm->cfg.arch.cpu_type = "max";
>  }

Hmm, seems like we're missing the right place for this. A validate
function shouln't be setting defaults. I think we should rename
kvm__arch_default_ram_address() to

  void kvm__arch_set_defaults(struct kvm_config *cfg)

and set cfg->ram_addr inside it. Then add the cpu_type default
setting to riscv's impl.

Thanks,
drew

>  
>  bool kvm__arch_cpu_supports_vm(void)
> -- 
> 2.43.0
> 

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
