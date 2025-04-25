Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E729C369C2
	for <kvm-riscv@archiver.kernel.org>; Fri, 25 Apr 2025 13:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9kP6K8pcruUWFeCObMWZvkYYCLCy5PAaqr+5sp5dbIY=; b=pfGD3DSlyPnw/6
	iy4d3bKm602G41nw8qNGe+7+C08/f/NZ+Oq/CdmJBzy4ooQ7xYzhIob+gteyXKf9kWX2AyI59ttja
	UClHTeyLk5qLqaF5NXQ+Gl8rYI4D7vnw7k6Ffuq5NZQBPoAr9iHPfCerdW1W0Xq+KgvNnzwQxdApt
	gyW68eegnKxwm51D81M14TDHXU05xLUP7moDyY4/vb8fq8C8ATcC0GyvTv1yYZweOZ5kaTC3pURe5
	nUugftDFOTxAEymJGdIRQMABxyDcfsb55pngHY9TMAxyfRLDY/KNyPAOL+Jmu1eD6OrP6MiIINZL2
	aVTcn0v06k+2q/5mUDSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8IwT-0000000HFW0-1huc;
	Fri, 25 Apr 2025 13:18:09 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8I7t-0000000H7UU-1xhs
	for kvm-riscv@lists.infradead.org;
	Fri, 25 Apr 2025 12:25:54 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-39c14016868so2055131f8f.1
        for <kvm-riscv@lists.infradead.org>; Fri, 25 Apr 2025 05:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745583952; x=1746188752; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=E30j/Ju/tL1nRGU7lbNX0XTt8cr938jN8P3lGRQEHzc=;
        b=hWjSe2w62zUrtpc4oljB7UaTeOMeb53K+tr3adncuGZmle82I6SOSLZiBkgxXmFnzA
         1isF6nP/XHnfn4CWcmlkBDjcHMdE2fdC6OMlCBttpRhD9V1cvdwFsMUgEacj0KeK0FvG
         MlZfsLYQPPB+VjxlkAQO1qahRR9tm0TMPGHxndFx3zbw9CNFmWJIc9BXB7S8XTqracN6
         utqQPCxSV7SPbUElqwQAPvgOQobiDFY2c4Fr2h7fgrpR3t/0lPlAwac/hcsb28anWaxs
         XoRaNl9GnRykboEzbNlS/z2NmwbD+ro6I2EcSCoImQmF4GFT2OBQwBb8aTq5yTPOE1OH
         Tr5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745583952; x=1746188752;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E30j/Ju/tL1nRGU7lbNX0XTt8cr938jN8P3lGRQEHzc=;
        b=V/KlrFbFkycqSeSf1meZZhk8XSsr62YZPxrrdxAzQMHiYwsiUpbmLI9hLlSOt85XY/
         1trOf5fr+d4LLZ4D2AGkvuyedFymuHlsbfaWEv7M6C0WAryPSXEu/q/pNwh1cdKXRONu
         jK83N8v0TI9LBB11WlfhtTkO/6ae+MqTSRa3Nv0mIpHEGwvxhfIHn47ii57Ivojq+6hg
         9c0iRhEsEI3XpvcyJ0LjlXBQ7f4nlMdOcmHP8qDqPWp4mjOaXyUgxAKPi0giMfjDpPtf
         snbI3AJjXYpPuklXwEb88/ePqyeNNVipt2YvLH6QXtnMAkNbd/sl4llD+JDFE59ObKRk
         nnqQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/bqRN8X3NIhYqGycz77yAh/5IhxL90WGl9Axlp6rD+/B/Kpa16Ooumxynct6r0BqIAnxfNpuXyu8=@lists.infradead.org
X-Gm-Message-State: AOJu0YzoLeW/z+tqHhkiCmFPO686ox3uhXB7gizHtz+Hu3abiJYP0Apf
	h78taD5eWchYvA9pYqp366OpDFK6CbvSIvljsS4mA13GDRF78NLrTxvL/MXdF5I=
X-Gm-Gg: ASbGnctE8CAqS8EF7RYxd4Kni80kLgRbZzokFp1AdnmKCycOwt4oG2DePPHFZmPRlnk
	AWnmYSFcxBKqVv+JP5zy1BcQBUb+Said+IAOBeS+s7N2LXJmfLnml2GJ5R4Q4AakeuDcgTrqNb7
	SgmtFSJpftIDemxmGJcJo8FRViO5zF/pCV/Oa/okl7UxbOUxIG+cqvJFoDCBztbqDmIdukBSMlV
	+BCnI9OaCPz4O/jqMdvNW+d7OraumT5meN3SAnQ7A5y+PCTyz+oIfahof7C2+8TY9M+2aUs2pa1
	duxqUU7OiqpaVoWefpDnom7W0cQC
X-Google-Smtp-Source: AGHT+IGPKvkSQpqyUSmbPo9ZQDeLn7h8rGnb1gxwXGGZ5wV+kUMjXkxVSFOwVN9p+4UzxmM5ReoiEw==
X-Received: by 2002:a05:6000:1a8a:b0:39c:268e:ae04 with SMTP id ffacd0b85a97d-3a074d901cbmr1567706f8f.0.1745583951687;
        Fri, 25 Apr 2025 05:25:51 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::f716])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d29b9cfsm55882455e9.1.2025.04.25.05.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 05:25:51 -0700 (PDT)
Date: Fri, 25 Apr 2025 14:25:50 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Will Deacon <will@kernel.org>, julien.thierry.kdev@gmail.com, 
	maz@kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
Subject: Re: [kvmtool PATCH v2 09/10] riscv: Add cpu-type command-line option
Message-ID: <20250425-790f8e451d35a989332ab3ad@orel>
References: <20250424153159.289441-1-apatel@ventanamicro.com>
 <20250424153159.289441-10-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250424153159.289441-10-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_052553_510770_65A1A7F9 
X-CRM114-Status: GOOD (  29.31  )
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

On Thu, Apr 24, 2025 at 09:01:58PM +0530, Anup Patel wrote:
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
>  riscv/aia.c                         |  2 +-
>  riscv/fdt.c                         | 68 +++++++++++++++++++++++++----
>  riscv/include/kvm/kvm-arch.h        |  2 +
>  riscv/include/kvm/kvm-config-arch.h | 10 +++++
>  4 files changed, 73 insertions(+), 9 deletions(-)
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
> index c741fd8..5d9b9bf 100644
> --- a/riscv/fdt.c
> +++ b/riscv/fdt.c
> @@ -13,16 +13,17 @@ struct isa_ext_info {
>  	const char *name;
>  	unsigned long ext_id;
>  	bool single_letter;
> +	bool min_enabled;
>  };
>  
>  struct isa_ext_info isa_info_arr[] = {
>  	/* single-letter ordered canonically as "IEMAFDQCLBJTPVNSUHKORWXYZG" */
> -	{"i",		KVM_RISCV_ISA_EXT_I,	.single_letter = true},
> -	{"m",		KVM_RISCV_ISA_EXT_M,	.single_letter = true},
> -	{"a",		KVM_RISCV_ISA_EXT_A,	.single_letter = true},
> -	{"f",		KVM_RISCV_ISA_EXT_F,	.single_letter = true},
> -	{"d",		KVM_RISCV_ISA_EXT_D,	.single_letter = true},
> -	{"c",		KVM_RISCV_ISA_EXT_C,	.single_letter = true},
> +	{"i",		KVM_RISCV_ISA_EXT_I,	.single_letter = true, .min_enabled = true},
> +	{"m",		KVM_RISCV_ISA_EXT_M,	.single_letter = true, .min_enabled = true},
> +	{"a",		KVM_RISCV_ISA_EXT_A,	.single_letter = true, .min_enabled = true},
> +	{"f",		KVM_RISCV_ISA_EXT_F,	.single_letter = true, .min_enabled = true},
> +	{"d",		KVM_RISCV_ISA_EXT_D,	.single_letter = true, .min_enabled = true},
> +	{"c",		KVM_RISCV_ISA_EXT_C,	.single_letter = true, .min_enabled = true},
>  	{"v",		KVM_RISCV_ISA_EXT_V,	.single_letter = true},
>  	{"h",		KVM_RISCV_ISA_EXT_H,	.single_letter = true},
>  	/* multi-letter sorted alphabetically */
> @@ -89,6 +90,56 @@ struct isa_ext_info isa_info_arr[] = {
>  	{"zvkt",	KVM_RISCV_ISA_EXT_ZVKT},
>  };
>  
> +static bool __isa_ext_disabled(struct kvm *kvm, struct isa_ext_info *info)
> +{
> +	if (kvm->cfg.arch.cpu_type == RISCV__CPU_TYPE_MIN &&
> +	    !info->min_enabled)
> +		return true;
> +
> +	return kvm->cfg.arch.ext_disabled[info->ext_id];
> +}
> +
> +static bool __isa_ext_warn_disable_failure(struct kvm *kvm, struct isa_ext_info *info)
> +{
> +	if (kvm->cfg.arch.cpu_type == RISCV__CPU_TYPE_MIN &&
> +	    !info->min_enabled)
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
> +		break;

indentation is off here

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
> +	if (!strcmp(arg, "max"))
> +		kvm->cfg.arch.cpu_type = RISCV__CPU_TYPE_MAX;
> +	else
> +		kvm->cfg.arch.cpu_type = RISCV__CPU_TYPE_MIN;
> +
> +	return 0;
> +}
> +
>  static void dump_fdt(const char *dtb_file, void *fdt)
>  {
>  	int count, fd;
> @@ -139,9 +190,10 @@ static void generate_cpu_nodes(void *fdt, struct kvm *kvm)
>  				/* This extension is not available in hardware */
>  				continue;
>  
> -			if (kvm->cfg.arch.ext_disabled[isa_info_arr[i].ext_id]) {
> +			if (__isa_ext_disabled(kvm, &isa_info_arr[i])) {
>  				isa_ext_out = 0;
> -				if (ioctl(vcpu->vcpu_fd, KVM_SET_ONE_REG, &reg) < 0)
> +				if (ioctl(vcpu->vcpu_fd, KVM_SET_ONE_REG, &reg) < 0 &&
> +				    __isa_ext_warn_disable_failure(kvm, &isa_info_arr[i]))
>  					pr_warning("Failed to disable %s ISA exension\n",
>  						   isa_info_arr[i].name);
>  				continue;
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
> index 7e54d8a..6d9a29a 100644
> --- a/riscv/include/kvm/kvm-config-arch.h
> +++ b/riscv/include/kvm/kvm-config-arch.h
> @@ -3,7 +3,13 @@
>  
>  #include "kvm/parse-options.h"
>  
> +enum riscv__cpu_type {
> +	RISCV__CPU_TYPE_MAX = 0,
> +	RISCV__CPU_TYPE_MIN
> +};
> +
>  struct kvm_config_arch {
> +	enum riscv__cpu_type cpu_type;
>  	const char	*dump_dtb_filename;
>  	u64		suspend_seconds;
>  	u64		custom_mvendorid;
> @@ -13,8 +19,12 @@ struct kvm_config_arch {
>  	bool		sbi_ext_disabled[KVM_RISCV_SBI_EXT_MAX];
>  };
>  
> +int riscv__cpu_type_parser(const struct option *opt, const char *arg, int unset);
> +
>  #define OPT_ARCH_RUN(pfx, cfg)						\
>  	pfx,								\
> +	OPT_CALLBACK('\0', "cpu-type", NULL, "min or max",		\
> +		     "Choose the cpu type (default is max).", riscv__cpu_type_parser, kvm),\
>  	OPT_STRING('\0', "dump-dtb", &(cfg)->dump_dtb_filename,		\
>  		   ".dtb file", "Dump generated .dtb to specified file"),\
>  	OPT_U64('\0', "suspend-seconds",				\
> -- 
> 2.43.0
>

Other than the indentation issue,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
