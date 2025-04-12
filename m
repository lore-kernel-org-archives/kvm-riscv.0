Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47E58C369A1
	for <kvm-riscv@archiver.kernel.org>; Sat, 12 Apr 2025 12:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U92y3i7ErsONm8oqNWmJNOgqaXRtUaHXmSJbMQnfMc4=; b=bekzUWprt2LkSq
	DvlPdeE8alkWYYnr5Sbo6FJEomw+JA47sCxt706TqKuI+wLffKpzpMYGmTmF1wchTB1HS5kTzfK8v
	wUwg/8LGlML+VPI0w+3UU7KVjWXY/qU3GGtNbdJEKvb3xL2gS8WiBSjjlpQDU/8Vqf1VHf040nADK
	5Uo94iI1mxi/yOKmaJlXYnIqhqiQa3Sm97fBLsVZrYSWQgUEledmHReNs2KlGCV3I+xlIa+NCxBOQ
	Wy77UF2aQ/sDASFJcy4fXYSB6KRvhIKop3VslwvqmAOoyWjO18pohGJx/jSJzoRVu6N6+BB795KwF
	8YhKzGPE0K/MZB0crY7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3a6X-0000000Fsk8-29vB;
	Sat, 12 Apr 2025 12:37:01 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3a6V-0000000Fsjn-40nO
	for kvm-riscv@lists.infradead.org;
	Sat, 12 Apr 2025 12:37:01 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-43cef035a3bso19940265e9.1
        for <kvm-riscv@lists.infradead.org>; Sat, 12 Apr 2025 05:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1744461418; x=1745066218; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/1tdUSTul8z3uG62hCB/hUKnbhFABs23IMaLfOAkzGc=;
        b=OOI2XqLCs+HsVaOJTvr+vL1nj9xseTjcczKOnaDxmQb7W+BAvcUdVAZEqbYn8qOL6d
         WPFZ0IK7MoIiuwel2F+o8ag9JXeYWMLw6blecyQuUwBsdKh2DnfKGXfOnD8iGC4jyvyv
         I2bNdxZ4PVCI5z860LHCs2nUwkb25VM/QvKtxJdOZasPEsL/AAZ6/w3SmfSG58MeROpE
         vxLuehuu/vmYfjdMIPbHjDWReiV77vtdZY7bDCBzhPcJNYzZqoQjCfsO+MLYMSNM/cmb
         Hhy5X6Pdl6L2wtRjCQx4da9JqaTGZpN8xjeYPshMe4NhRe1DvXNW62FuXiMThqAn7Bd8
         TRtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744461418; x=1745066218;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/1tdUSTul8z3uG62hCB/hUKnbhFABs23IMaLfOAkzGc=;
        b=Nm4EammBpJX7vUeSFZhwyH4a0cbCn4YrE0vOHoGVT2Zmm97reF1iWTFvGcm9owksTe
         ktXYxsrG2wt5hJza1E/j1Buo1FO6iPVLLZkA2KMqYnOzrLAn7xhQtO6jp8hUo+6Vjksm
         MLR6ubxnRuiTshhcn48Bk1ZZWPT4bNaG83zsRrdAlIWA5OzSW0VzfmoHjqoAg7wMZkvU
         iU7jO6q7x8gGFEdILvgfF5LQeUeboEX5GM+HBJQXmjiDGUYH0TYeKF+epr5xpnGLLX85
         jyNuGAgarlYJtAbtqJeSauKMsYWIZk8xm9+E/EQWA1PhPU0QdDgJMezaggnqmf3xZMOC
         dyiw==
X-Forwarded-Encrypted: i=1; AJvYcCWBCZjyJ/JJIcpnXMmcee9qKLqK0b/8btqSrUQcdTR/PKo+GN7jH3bTFIbEBe8F5Mtfu6DiZkOk66c=@lists.infradead.org
X-Gm-Message-State: AOJu0YxOKPEctIKWyTSiecvWcZzxSbJTvMcUbkRs1YdIXQ1IgMBEAMIj
	U3UdHS7D9NhSuOTrUt7OnaTYc7Xzfft5j3ZlzHb5bwGazec983rgPIDSk6kgHXM=
X-Gm-Gg: ASbGncs1ESWii+caRxWoFeiTyPJiyAw+Di3AhyW3YVUeGNXyjIkrzoviICp/M3lGpV/
	fdo0Y+d9scdW8+66LtsQFbuWSfXix1fI5atdiIPPMjK1tHd8ywVk8rzeyr70VuNE3qFIEtzU0OU
	H4qYdVisGfMsocsV+bpgS63vJrKa6MUFJE+3IfTpAVLreuYaV5Ju0tcBrq15qVgzfgn/UvxOT0n
	SgTgZeOkjSEZoBtqEEy+nT3UrT8YROnW8uGlam3zwx85VHLJsXUy6en/eqF3pl4N/Y9SzUlqza3
	sQzb+tmpZjgPcjqR2QQ4E4j/PR1NNrzn266vCnsPJmQSgJIPN4cxEv93IpEND/b6+aehRQ==
X-Google-Smtp-Source: AGHT+IFWJhMIxLAuhZFAH4iIc1JQxXlXQ42GIrirxlIB2AWxuYEwvVobTKAyVC9cwelW41i1/PuHVA==
X-Received: by 2002:a05:600c:4f90:b0:43c:f689:dd with SMTP id 5b1f17b1804b1-43f3a95aeb3mr16009775e9.19.1744461417526;
        Sat, 12 Apr 2025 05:36:57 -0700 (PDT)
Received: from localhost (cst2-173-28.cust.vodafone.cz. [31.30.173.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2338d6ebsm119063895e9.2.2025.04.12.05.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 05:36:57 -0700 (PDT)
Date: Sat, 12 Apr 2025 14:36:56 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Will Deacon <will@kernel.org>, julien.thierry.kdev@gmail.com, 
	maz@kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
Subject: Re: [kvmtool PATCH 08/10] riscv: Include single-letter extensions in
 isa_info_arr[]
Message-ID: <20250412-bafd9ea6c4e3314f8da06a26@orel>
References: <20250326065644.73765-1-apatel@ventanamicro.com>
 <20250326065644.73765-9-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250326065644.73765-9-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250412_053700_006770_A3EE5806 
X-CRM114-Status: GOOD (  19.72  )
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

On Wed, Mar 26, 2025 at 12:26:42PM +0530, Anup Patel wrote:
> Currently, the isa_info_arr[] only include multi-letter extensions but
> the KVM ONE_REG interface covers both single-letter and multi-letter
> extensions so extend isa_info_arr[] to include single-letter extensions.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  riscv/fdt.c | 138 +++++++++++++++++++++++++++++-----------------------
>  1 file changed, 76 insertions(+), 62 deletions(-)
> 
> diff --git a/riscv/fdt.c b/riscv/fdt.c
> index 251821e..46efb47 100644
> --- a/riscv/fdt.c
> +++ b/riscv/fdt.c
> @@ -12,71 +12,81 @@
>  struct isa_ext_info {
>  	const char *name;
>  	unsigned long ext_id;
> +	bool multi_letter;
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
> +	/* single-letter */
> +	{"a", KVM_RISCV_ISA_EXT_A, false},
> +	{"c", KVM_RISCV_ISA_EXT_C, false},
> +	{"d", KVM_RISCV_ISA_EXT_D, false},
> +	{"f", KVM_RISCV_ISA_EXT_F, false},
> +	{"h", KVM_RISCV_ISA_EXT_H, false},
> +	{"i", KVM_RISCV_ISA_EXT_I, false},
> +	{"m", KVM_RISCV_ISA_EXT_M, false},
> +	{"v", KVM_RISCV_ISA_EXT_V, false},
> +	/* multi-letter sorted alphabetically */
> +	{"smnpm", KVM_RISCV_ISA_EXT_SMNPM, true},
> +	{"smstateen", KVM_RISCV_ISA_EXT_SMSTATEEN, true},
> +	{"ssaia", KVM_RISCV_ISA_EXT_SSAIA, true},
> +	{"sscofpmf", KVM_RISCV_ISA_EXT_SSCOFPMF, true},
> +	{"ssnpm", KVM_RISCV_ISA_EXT_SSNPM, true},
> +	{"sstc", KVM_RISCV_ISA_EXT_SSTC, true},
> +	{"svade", KVM_RISCV_ISA_EXT_SVADE, true},
> +	{"svadu", KVM_RISCV_ISA_EXT_SVADU, true},
> +	{"svinval", KVM_RISCV_ISA_EXT_SVINVAL, true},
> +	{"svnapot", KVM_RISCV_ISA_EXT_SVNAPOT, true},
> +	{"svpbmt", KVM_RISCV_ISA_EXT_SVPBMT, true},
> +	{"svvptc", KVM_RISCV_ISA_EXT_SVVPTC, true},
> +	{"zabha", KVM_RISCV_ISA_EXT_ZABHA, true},
> +	{"zacas", KVM_RISCV_ISA_EXT_ZACAS, true},
> +	{"zawrs", KVM_RISCV_ISA_EXT_ZAWRS, true},
> +	{"zba", KVM_RISCV_ISA_EXT_ZBA, true},
> +	{"zbb", KVM_RISCV_ISA_EXT_ZBB, true},
> +	{"zbc", KVM_RISCV_ISA_EXT_ZBC, true},
> +	{"zbkb", KVM_RISCV_ISA_EXT_ZBKB, true},
> +	{"zbkc", KVM_RISCV_ISA_EXT_ZBKC, true},
> +	{"zbkx", KVM_RISCV_ISA_EXT_ZBKX, true},
> +	{"zbs", KVM_RISCV_ISA_EXT_ZBS, true},
> +	{"zca", KVM_RISCV_ISA_EXT_ZCA, true},
> +	{"zcb", KVM_RISCV_ISA_EXT_ZCB, true},
> +	{"zcd", KVM_RISCV_ISA_EXT_ZCD, true},
> +	{"zcf", KVM_RISCV_ISA_EXT_ZCF, true},
> +	{"zcmop", KVM_RISCV_ISA_EXT_ZCMOP, true},
> +	{"zfa", KVM_RISCV_ISA_EXT_ZFA, true},
> +	{"zfh", KVM_RISCV_ISA_EXT_ZFH, true},
> +	{"zfhmin", KVM_RISCV_ISA_EXT_ZFHMIN, true},
> +	{"zicbom", KVM_RISCV_ISA_EXT_ZICBOM, true},
> +	{"zicboz", KVM_RISCV_ISA_EXT_ZICBOZ, true},
> +	{"ziccrse", KVM_RISCV_ISA_EXT_ZICCRSE, true},
> +	{"zicntr", KVM_RISCV_ISA_EXT_ZICNTR, true},
> +	{"zicond", KVM_RISCV_ISA_EXT_ZICOND, true},
> +	{"zicsr", KVM_RISCV_ISA_EXT_ZICSR, true},
> +	{"zifencei", KVM_RISCV_ISA_EXT_ZIFENCEI, true},
> +	{"zihintntl", KVM_RISCV_ISA_EXT_ZIHINTNTL, true},
> +	{"zihintpause", KVM_RISCV_ISA_EXT_ZIHINTPAUSE, true},
> +	{"zihpm", KVM_RISCV_ISA_EXT_ZIHPM, true},
> +	{"zimop", KVM_RISCV_ISA_EXT_ZIMOP, true},
> +	{"zknd", KVM_RISCV_ISA_EXT_ZKND, true},
> +	{"zkne", KVM_RISCV_ISA_EXT_ZKNE, true},
> +	{"zknh", KVM_RISCV_ISA_EXT_ZKNH, true},
> +	{"zkr", KVM_RISCV_ISA_EXT_ZKR, true},
> +	{"zksed", KVM_RISCV_ISA_EXT_ZKSED, true},
> +	{"zksh", KVM_RISCV_ISA_EXT_ZKSH, true},
> +	{"zkt", KVM_RISCV_ISA_EXT_ZKT, true},
> +	{"ztso", KVM_RISCV_ISA_EXT_ZTSO, true},
> +	{"zvbb", KVM_RISCV_ISA_EXT_ZVBB, true},
> +	{"zvbc", KVM_RISCV_ISA_EXT_ZVBC, true},
> +	{"zvfh", KVM_RISCV_ISA_EXT_ZVFH, true},
> +	{"zvfhmin", KVM_RISCV_ISA_EXT_ZVFHMIN, true},
> +	{"zvkb", KVM_RISCV_ISA_EXT_ZVKB, true},
> +	{"zvkg", KVM_RISCV_ISA_EXT_ZVKG, true},
> +	{"zvkned", KVM_RISCV_ISA_EXT_ZVKNED, true},
> +	{"zvknha", KVM_RISCV_ISA_EXT_ZVKNHA, true},
> +	{"zvknhb", KVM_RISCV_ISA_EXT_ZVKNHB, true},
> +	{"zvksed", KVM_RISCV_ISA_EXT_ZVKSED, true},
> +	{"zvksh", KVM_RISCV_ISA_EXT_ZVKSH, true},
> +	{"zvkt", KVM_RISCV_ISA_EXT_ZVKT, true},

nit: I think I would add a 'misa' boolean member instead of 'multi_letter'
and then rework this table to look like this

	{"a",		KVM_RISCV_ISA_EXT_A, .misa = true	},
	{"c",		KVM_RISCV_ISA_EXT_C, .misa = true	},
	{"d",		KVM_RISCV_ISA_EXT_D, .misa = true	},
	{"f",		KVM_RISCV_ISA_EXT_F, .misa = true	},
	{"h",		KVM_RISCV_ISA_EXT_H, .misa = true	},
	{"i",		KVM_RISCV_ISA_EXT_I, .misa = true	},
	{"m",		KVM_RISCV_ISA_EXT_M, .misa = true	},
	{"v",		KVM_RISCV_ISA_EXT_V, .misa = true	},

	/* multi-letter sorted alphabetically */
	{"smnpm",	KVM_RISCV_ISA_EXT_SMNPM,		},
	{"smstateen",	KVM_RISCV_ISA_EXT_SMSTATEEN,		},
	...

The benefit is that only the misa extensions need another field.

>  };
>  
>  static void dump_fdt(const char *dtb_file, void *fdt)
> @@ -129,6 +139,10 @@ static void generate_cpu_nodes(void *fdt, struct kvm *kvm)
>  		}
>  
>  		for (i = 0; i < arr_sz; i++) {
> +			/* Skip single-letter extensions since these are taken care */

We should finish the comment with 'of by "whatever takes care of them"'

> +			if (!isa_info_arr[i].multi_letter)
> +				continue;
> +
>  			reg.id = RISCV_ISA_EXT_REG(isa_info_arr[i].ext_id);
>  			reg.addr = (unsigned long)&isa_ext_out;
>  			if (ioctl(vcpu->vcpu_fd, KVM_GET_ONE_REG, &reg) < 0)
> -- 
> 2.43.0
>

Thanks,
drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
