Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1369C369AB
	for <kvm-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 12:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mJ8yjOhPPPsuf4ru7D8OT+o6R6b1RLaeRLh77KfL1V4=; b=LpT1fcrA9FqPrO
	EI1+oBOf2JA9iq9L9l2KgMJZsE23we/zxRKDn6bz9Xh5mK1HgY/Ev18ZGHTAqfUEsf6ZxA/DRMqQp
	AF3NK0rsD0Id9q4zuNiyUA+P1V7WmGDQJYGAgsCkWBCXXbhULwwEdkDKD0aDZYTyADDIg4BFjh+cI
	I/OZe0mF9NYWv3OuwAeV8n2qBvKGbI5+1+JaIoQ/ZtGFsmVr5BMrKPjp7wd1Ttp6mOQSCohv7Z4nw
	Ly1y42wLYgpJwg1qAcKEx+JjhLnmttDY5pdcx/blKiO41QoDjBGSlsj+gc5HyJz8RfTTeU29Fkfcp
	Q9cN1BcoGJzpmXlvrf0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7w2T-0000000E5X9-12Is;
	Thu, 24 Apr 2025 12:50:49 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7uK5-0000000DmU3-0NDW
	for kvm-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 11:00:54 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-440685d6afcso8512215e9.0
        for <kvm-riscv@lists.infradead.org>; Thu, 24 Apr 2025 04:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745492452; x=1746097252; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zHHJnHHyOrnNtHHA6vr6DrZ0IO7tPD+NYSLx8YKZu70=;
        b=kk/skuzWTlOWSD7hfv5ifVf4lgZXkIljeHz1gt73450FmA+qdBhLXVEYgj1UT8RRG7
         TnLKdIJhU9i1ftuYto6Jo/Y0pCCWW0LYor0uTwhO9pxCoK9PkLEULz6Ndpoy886ua1bZ
         Q08bIV7uAaHcIM1QSEVCuMyMu42+l8vOfE3wtBEoZcwGzbhrcCI59Yh3FCGxinxN3rug
         5lUenimu6Ba4vU9IYz2dA2Ncpby/B1L6nqWNGgn4CMgnwF+oy/+l3L8qid+MeIwvSnAf
         RYShDIUKpCj8qzFNgj7q0D3Bu6l2fkvt8hUvtK0Lp/PzkCy2qtrl+Braw4ZA2ALO3Ado
         pwDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745492452; x=1746097252;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zHHJnHHyOrnNtHHA6vr6DrZ0IO7tPD+NYSLx8YKZu70=;
        b=GaMWXH3LGVKkHGmXFYud6xJyKmLTjz5NXPsuBonvrCQJpRJOyFsqmi17oUiDZDKN3+
         ASHlq5w7/3TLI6kx7IdRoffHPEOtiAyt/vFy378zUmKS6jDyAAH2L6rd7/2bdmdLs8+z
         we7JoYtmqOi1v16twPxrBhQMNazhWfkyYtS0JltV/riqJFLlNGP/ogOX/GrJz8chlL27
         pGhEzua7tXc7D6EXKOfF76SNas15F1VihUTUmmW5lEFwfrnvR1CitLlsObhHqvSovgcO
         +6l6ncHw9K9Po2cln5+0Nb9+imfZngrAgfc1cpDRgj03aG7DynYMu/ZsOt56+AAh+0PO
         0ejQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAIwkDsy47+4cPAV0zMhm2MjzqhaOCXC/O9yNDKw+T6t5dErevYeEU93dOvewRSrdXjBrxmUknb7E=@lists.infradead.org
X-Gm-Message-State: AOJu0YwjuaowEMjExUzzpe5+Pmmq9JIywxnVv542RgpqOP/lhorEYU6i
	8kspcxg3YWcs3st5gJ4wrgBvwtF72Q42Rr1iFVsPRI4ljuzjrzJ5XIAGotWLbOU=
X-Gm-Gg: ASbGnctUZJj2AEwsNieVC/WXc0jKzK8xBl5JnkuctmsVx6KwXvQW4pw/oP0+ERE7d+z
	ax6XIIUIzZOea+JRG5ttaizUOCjJSIBKw7mLN6wd9NKAfAjs7McYPHEZgmoUH4rYNeG1iv5jQjF
	JYqnMJm7RQz/mSppJewxBMtCiqbRLiMAs68Ef/kNrhh05QO8l+iH9cruLW/AFwkfGInpszinDHr
	HCzhVUb2mo6xe/tnZ3jl1joZTGBD1GpxMVjgQMIhN+6quQex+vh5X8BpMKEGYXzvL55Tx3sFmHC
	LcxsWtCYUXM4vQCrl/I1imQgVefIkNPBmtloT1Y=
X-Google-Smtp-Source: AGHT+IGP6Ut82q/OqGuYzCaYu8ri2NvYSY5EYxmJ9hg0Kbk3eysivoE/mXbwZrGhC5aaW7QaraDYhg==
X-Received: by 2002:a05:600c:3b9a:b0:439:9424:1b70 with SMTP id 5b1f17b1804b1-4409bd8a761mr17964535e9.30.1745492451468;
        Thu, 24 Apr 2025 04:00:51 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::f716])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2d8479sm16884645e9.29.2025.04.24.04.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 04:00:51 -0700 (PDT)
Date: Thu, 24 Apr 2025 13:00:50 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH v5 03/13] riscv: sbi: add FWFT extension interface
Message-ID: <20250424-c85c9d2f189fe4470038b519@orel>
References: <20250417122337.547969-1-cleger@rivosinc.com>
 <20250417122337.547969-4-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250417122337.547969-4-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_040053_129716_6EA369FE 
X-CRM114-Status: GOOD (  15.53  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Apr 17, 2025 at 02:19:50PM +0200, Cl=E9ment L=E9ger wrote:
> This SBI extensions enables supervisor mode to control feature that are
> under M-mode control (For instance, Svadu menvcfg ADUE bit, Ssdbltrp
> DTE, etc). Add an interface to set local features for a specific cpu
> mask as well as for the online cpu mask.
> =

> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/include/asm/sbi.h | 17 +++++++++++
>  arch/riscv/kernel/sbi.c      | 57 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 74 insertions(+)
> =

> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> index 7ec249fea880..c8eab315c80e 100644
> --- a/arch/riscv/include/asm/sbi.h
> +++ b/arch/riscv/include/asm/sbi.h
> @@ -503,6 +503,23 @@ int sbi_remote_hfence_vvma_asid(const struct cpumask=
 *cpu_mask,
>  				unsigned long asid);
>  long sbi_probe_extension(int ext);
>  =

> +int sbi_fwft_set(u32 feature, unsigned long value, unsigned long flags);
> +int sbi_fwft_local_set_cpumask(const cpumask_t *mask, u32 feature,
> +			       unsigned long value, unsigned long flags);

I'm confused by the naming that includes 'local' and 'cpumask' together
and...

> +/**
> + * sbi_fwft_local_set() - Set a feature on all online cpus
> + * @feature: The feature to be set
> + * @value: The feature value to be set
> + * @flags: FWFT feature set flags
> + *
> + * Return: 0 on success, appropriate linux error code otherwise.
> + */
> +static inline int sbi_fwft_local_set(u32 feature, unsigned long value,
> +				     unsigned long flags)
> +{
> +	return sbi_fwft_local_set_cpumask(cpu_online_mask, feature, value, flag=
s);

...that something named with just 'local' is applied to all online cpus.
I've always considered 'local' functions to only affect the calling cpu.

Thanks,
drew

-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
