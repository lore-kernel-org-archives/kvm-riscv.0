Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 716CCC369C2
	for <kvm-riscv@archiver.kernel.org>; Fri, 25 Apr 2025 13:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LHYjhqY9nNRAz4kkMEaWwtsaugzqS5TNhhomLlpG4wU=; b=yCXrIjzYYg289Q
	vNgeBgROHmxxLvaCDZPsNqX1zvwWWFl/7Uo0aDsiOq3YooR7Jy17emcuTKKYh/feqmKgRKfHzTP1j
	9WauFfleJHqRyJR3OH+zTYGzGaRrI16BPwUicqKzXT21jYRCLdlxJIbZc5XSqykb76p7RM9FADZXJ
	d5oIdvLNOcjuULvguplIMtx1Zf0v++ceTHsaEK00e2u3yEDkcu7+1BcGdvQFsD15Z67kf/xemDB1L
	aWdp9rgfjJNrtomPnx9DOgXxsdLO6hOsEKmiJn2k0XXyQOCfXjL1QNWFnHYQhVwW3Xum6sMU0D4vs
	3l1e+vIgra5yz8gS5Zgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8JBC-0000000HIRA-0rfQ;
	Fri, 25 Apr 2025 13:33:22 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8IOd-0000000H9ip-44dd
	for kvm-riscv@lists.infradead.org;
	Fri, 25 Apr 2025 12:43:13 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3913b539aabso1206904f8f.2
        for <kvm-riscv@lists.infradead.org>; Fri, 25 Apr 2025 05:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745584990; x=1746189790; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Cf3d2/UTjuBhFnPBgj+LsDiH4ilx2WtXI91CDZT02q8=;
        b=pNzw0iletNudS8fcK3FmhlI2aK2LslhB2FvdQ0xF5LFXM/Fh8crWDAKrtaaID8RzWm
         4dSklyucdofFDzZo0r1+VcdNwkusF41Y+uysNlSaxERrZQgfs0xgWwqMUhOzmnFSKr50
         tSbTUIBZvLjt0KR+3nRxBkXogK8AWa6F4eSpsSuMkQFxUs7UNjUq7KznIYfuproRrM/q
         WqcS4K+64lfs6Chv/+nNz9Pt/gnq3qGxyL10XwIr1ooi2+1mtgZ39GQHuzapYzZEht7w
         gw1Y0DVOxmvJr+lGa6Z9KSgiIrUYBIyJkMFs+IoIZPVYwb9rHEoWgVBCOU9A8tiJesiF
         11MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745584990; x=1746189790;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cf3d2/UTjuBhFnPBgj+LsDiH4ilx2WtXI91CDZT02q8=;
        b=s5yIjoGowFnHe6w2yhlCGt2kyEhGLV8iZicncIivMTuFdyfbvEOsxYr8g1px3CUTsi
         UU6FXJehz5KKqvdTkbhesthngoFsIeZ3hhQzG8J1LpVUG+x05MSRDmZvJXV6pBpXreys
         lKBRuuhCFwxX6ObOa9jACPlGTQR10kaM+D6rSZCk2IyYXlJYitRgR8xiBlv8qgUZdmHg
         E2r9IvMclUsmUFmfJ3oKBCPwfM/ZzhL4W7quhG1KTKv5Q4Afdk4e3KymHgqhkwscz4WP
         hHOdw6Ob4eyRS0PVxtjEtQNZfYQvilOdN/10yP1Fiwj4O/5lHSmT13vAwvRS3hmEWdRj
         8VnA==
X-Forwarded-Encrypted: i=1; AJvYcCUPbRn88CVggswHPQQvD0BsWiQlrLnB+cROIVLdChvf8+HiBwqwIJa0qOSaYQI1/xQz7+mDLx2z7Jk=@lists.infradead.org
X-Gm-Message-State: AOJu0YytBiYxD0MeCFxGUFedW6jXqlvFa6ObERuv3CtQ+8q1SMnJR/2q
	2sKqZb27LaeTes0Q5vQHNNrTTn4wu0m3OtdatWjNIBu4xsTMvQoewUGG85AST40=
X-Gm-Gg: ASbGnctQcXChvCLX7bscPmQKbkJ1n6ZqI+E6lGRSW2sKoxt8JLd+fTvJDFf7qp13WNh
	fKhZR6wsM4T8eXnm3bwBr7kkW6H0wM6yYHYzYYwQzZugLXzIOaHu3dIQ36D0V6RA3L3c5FRELga
	sj79efZ/xh212vPuQhYNmwx4WDr3DaFrQiSQkaFyPIGZlIMePNxfdyPvDt5fOobU7kUcYnA3eF0
	ArZ/0kneQondEyUEl+a9DL837aAc4OwdPAYRueMmj/9wBO2Isk2A7MWUL7kWL7/mmhpgKGdyQnk
	UFT9hdkemo2sWXNQzVcDjXk9tpIM
X-Google-Smtp-Source: AGHT+IFA1AA7xPcXMcnBbdezLvvwEkVdUlNYNFgLV6mE5BuEB/JqAab31HMxgk/sqPZatMB0xTSnSg==
X-Received: by 2002:a05:6000:402c:b0:39e:f89b:85dc with SMTP id ffacd0b85a97d-3a074e1eda0mr1619995f8f.17.1745584990421;
        Fri, 25 Apr 2025 05:43:10 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::f716])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073ca543bsm2312071f8f.34.2025.04.25.05.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 05:43:09 -0700 (PDT)
Date: Fri, 25 Apr 2025 14:43:09 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Will Deacon <will@kernel.org>, julien.thierry.kdev@gmail.com, 
	maz@kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
Subject: Re: [kvmtool PATCH v2 10/10] riscv: Allow including extensions in
 the min CPU type using command-line
Message-ID: <20250425-c0a3a93239d39b73ff176697@orel>
References: <20250424153159.289441-1-apatel@ventanamicro.com>
 <20250424153159.289441-11-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250424153159.289441-11-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_054312_014722_8C3E0BC6 
X-CRM114-Status: GOOD (  24.59  )
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

On Thu, Apr 24, 2025 at 09:01:59PM +0530, Anup Patel wrote:
> It is useful to allow including extensions in the min CPU type on need
> basis via command-line. To achieve this, parse extension names as comma
> separated values appended to the "min" CPU type using command-line.
> 
> For example, to include Sstc and Ssaia in the min CPU type use
> "--cpu-type min,sstc,ssaia" command-line option.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  riscv/fdt.c | 43 ++++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 40 insertions(+), 3 deletions(-)
> 
> diff --git a/riscv/fdt.c b/riscv/fdt.c
> index 5d9b9bf..722493a 100644
> --- a/riscv/fdt.c
> +++ b/riscv/fdt.c
> @@ -108,6 +108,20 @@ static bool __isa_ext_warn_disable_failure(struct kvm *kvm, struct isa_ext_info
>  	return true;
>  }
>  
> +static void __min_enable(const char *ext, size_t ext_len)
> +{
> +	struct isa_ext_info *info;
> +	unsigned long i;
> +
> +	for (i = 0; i < ARRAY_SIZE(isa_info_arr); i++) {
> +		info = &isa_info_arr[i];
> +		if (strlen(info->name) != ext_len)
> +			continue;
> +		if (!strncmp(ext, info->name, ext_len))

Just strcmp since we already checked the length and wouldn't want
something like info->name = mmmmnnnn to match ext = mmmm anyway.

> +			info->min_enabled = true;
> +	}
> +}
> +
>  bool riscv__isa_extension_disabled(struct kvm *kvm, unsigned long isa_ext_id)
>  {
>  	struct isa_ext_info *info = NULL;
> @@ -128,15 +142,38 @@ bool riscv__isa_extension_disabled(struct kvm *kvm, unsigned long isa_ext_id)
>  int riscv__cpu_type_parser(const struct option *opt, const char *arg, int unset)
>  {
>  	struct kvm *kvm = opt->ptr;
> +	const char *str, *nstr;
> +	int len;
>  
> -	if ((strncmp(arg, "min", 3) && strncmp(arg, "max", 3)) || strlen(arg) != 3)
> +	if ((strncmp(arg, "min", 3) || strlen(arg) < 3) &&

The strlen(arg) < 3 will never be true because if strncmp(arg, "min", 3)
returns 0 (false), then that means arg starts with 'min', and therefore
can't have a length less than 3. And, if strncmp(arg, "min", 3) returns
nonzero, then the '|| expression' will be short-circuited.

> +	    (strncmp(arg, "max", 3) || strlen(arg) != 3))

So

 if (strncmp(arg, "min", 3) && (strncmp(arg, "max", 3) || strlen(arg) != 3))

should do it.

>  		die("Invalid CPU type %s\n", arg);
>  
> -	if (!strcmp(arg, "max"))
> +	if (!strcmp(arg, "max")) {
>  		kvm->cfg.arch.cpu_type = RISCV__CPU_TYPE_MAX;
> -	else
> +	} else {
>  		kvm->cfg.arch.cpu_type = RISCV__CPU_TYPE_MIN;
>  
> +		str = arg;
> +		str += 3;
> +		while (*str) {
> +			if (*str == ',') {
> +				str++;
> +				continue;
> +			}
> +
> +			nstr = strchr(str, ',');
> +			if (!nstr)
> +				nstr = str + strlen(str);
> +
> +			len = nstr - str;
> +			if (len) {
> +				__min_enable(str, len);
> +				str += len;
> +			}
> +		}
> +	}
> +
>  	return 0;
>  }
>  
> -- 
> 2.43.0
>

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
