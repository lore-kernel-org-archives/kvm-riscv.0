Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF79FC35FFC
	for <kvm-riscv@archiver.kernel.org>; Sat, 22 Mar 2025 12:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jmL5A4ISP1eVjroSYM+bLfLxCHvfE/LISGxCL3rCLgg=; b=wLxktRcYpaVGMR
	DvidnGDNTPjeBml+elOBo939IPCSbikTIjjKyLQGk+77yYY0sZ+8Q+isGdeJdrq9PV47xV3hzQBTc
	L39zLmSdX6xSr9KhVxKBypnYtsNBuiOGBwziruS/cqS2OgwK+262FCADr+AZpnD1Qt4TGkhFyEQgN
	zVOlzhoM6JWMjgDwwnJYgBni1djUusAnH5rIkXBBaIRlCSnyaGaAgEpqR6wJNJyy8O3I/fnUrIHA4
	02Z56rPAuHzBUkIR1i9SJxTTQDh+QfIKHg4YEe8QfqLpeYDiBOpM/1xqVQAq6OqA3+2z/3qBdJDJg
	Ln5uS+Lvh+6CSLWaXHgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvxcC-0000000HN8P-1NYs;
	Sat, 22 Mar 2025 12:06:12 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvxc7-0000000HN7M-3zPV
	for kvm-riscv@lists.infradead.org;
	Sat, 22 Mar 2025 12:06:11 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso20777155e9.2
        for <kvm-riscv@lists.infradead.org>; Sat, 22 Mar 2025 05:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1742645166; x=1743249966; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZKCRWgSlF1v0cutxAi8x3LCFESHSHWoNhfvIYKSJItY=;
        b=B5y0DZ4YRRNUp2glqxMiBxYI1VKaQ23xpCuvZ5Ai7BE9kn4IEr3hwe8LQSsRj6rXmT
         ScSEWtNdAsnSAc7ApnhY412/7oJE07X+ce7Y2wWTN26C0ML590cu0G33McBqHfUrjGdh
         o7GtO8H+kZTxWSG56JEWI9S8rFonbMUqmAANoD1bAfaKOIfcDpmKNLB0jb3qHg8+RPH4
         LRHht21Ke4RkdWAbm9AGdY7jeKyA0Doh+tRBml1GgDL16ODimaNv/f/DRfl9P7g8XIGc
         3ssCXfeWd6wd7EK3+LmbZNBbztCAdciFN1H9JbFr1n4YKQP6tY44jg1Zga+0kJlibZgC
         G8DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742645166; x=1743249966;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZKCRWgSlF1v0cutxAi8x3LCFESHSHWoNhfvIYKSJItY=;
        b=oinX8f38+MHo6SSybRqZQMzcSk1CCeJR7X6Q2M2bqyZM9hZ2zSXIEEUgnAUDSC8QNN
         xxpayBCC7/WpEXoFEpTbx4xy67/Ojn3ta12Lnv7hPZUYwBwpu5NgrDCKrN4g+Z9U7y7+
         cUNBG3Gk+yR1DuDTowlPPGYrVz/NBETPvQjKXNgC0qxQqHLqEv3NEs/mI0JOAFlm1PF2
         1G3uD8c7xVb2o0j4Pgrudj1L4GG/Ln8nPEWhtuO0NXxVtjUdhaHMZfGpwno1/qsySKlP
         7aEVKe5r2NOm+sVt534MgvAOEApO+ZA/36X7340Jj7M0YUsPF74kDFvNl/obnRlMxSy7
         jYhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqmL5to2HTjMvV/FIEBf2ZbYIJvJovSGlvrazQk3gFRbk6dKBA9G2c7awne6k0x6gi2VA6JOB72Xk=@lists.infradead.org
X-Gm-Message-State: AOJu0YyGHBXORvpmVl6G3E3iS4sUtxObsKdhBOFgvPbAyCAdmHQXHcME
	p4YpueFkBVV27GPf5InfCVkGQKWtzi9/51ZvIHoa0XCPpUpWx6HsxCH/1iyyZEc=
X-Gm-Gg: ASbGnctRMQ07TZBLVW7ps6wQ3P5z38tIsIgQHZ9Co5q+oySbyjpW7UOfyp7HguYbsEQ
	MTQgdbyt+435R1lQFJsx5dshUaY4t5tnwA1Mi6Hle/SEu3KOls+AtsF6kAO98OZrVSut+WDW0EX
	yZObU+vGjHAwcoPYNqjDMNky9Zbb/tXWpfcXIxnz0FglGsDhfgM+iZrYsB4VHv2yBrxiR3w9Lpr
	XvRYgimGv0Qv6rGk6/EsqejB+plQdmLwC2QC3LKXyZ9FNvnAQuIgNX672kXyQjozuJW0AJYHqUc
	6EIvAlP046UrVVC3sTVADVs09MWCAjqR61e6UtE0FGouAHuq79rY+5F8X2T4x1h+Km395/FHcA=
	=
X-Google-Smtp-Source: AGHT+IFTfC3V3Y+aXvtwsAGDzN2r/TELBK33hItKDRr/I6qX4Pf8OQOcC8wMhwn6dPn+tHwLQGn1PA==
X-Received: by 2002:a05:600c:470f:b0:43c:fe15:41e1 with SMTP id 5b1f17b1804b1-43d509e190fmr61771675e9.4.1742645165642;
        Sat, 22 Mar 2025 05:06:05 -0700 (PDT)
Received: from localhost (cst2-173-28.cust.vodafone.cz. [31.30.173.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9ef23esm4932401f8f.81.2025.03.22.05.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Mar 2025 05:06:05 -0700 (PDT)
Date: Sat, 22 Mar 2025 13:06:04 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH v4 02/18] riscv: sbi: add new SBI error mappings
Message-ID: <20250322-cce038c88db88dd119a49846@orel>
References: <20250317170625.1142870-1-cleger@rivosinc.com>
 <20250317170625.1142870-3-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250317170625.1142870-3-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250322_050607_989053_E9E150C2 
X-CRM114-Status: GOOD (  14.02  )
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

On Mon, Mar 17, 2025 at 06:06:08PM +0100, Cl=E9ment L=E9ger wrote:
> A few new errors have been added with SBI V3.0, maps them as close as
> possible to errno values.
> =

> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> ---
>  arch/riscv/include/asm/sbi.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
> =

> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> index bb077d0c912f..d11d22717b49 100644
> --- a/arch/riscv/include/asm/sbi.h
> +++ b/arch/riscv/include/asm/sbi.h
> @@ -536,11 +536,20 @@ static inline int sbi_err_map_linux_errno(int err)
>  	case SBI_SUCCESS:
>  		return 0;
>  	case SBI_ERR_DENIED:
> +	case SBI_ERR_DENIED_LOCKED:
>  		return -EPERM;
>  	case SBI_ERR_INVALID_PARAM:
> +	case SBI_ERR_INVALID_STATE:
> +	case SBI_ERR_BAD_RANGE:
>  		return -EINVAL;
>  	case SBI_ERR_INVALID_ADDRESS:
>  		return -EFAULT;
> +	case SBI_ERR_NO_SHMEM:
> +		return -ENOMEM;
> +	case SBI_ERR_TIMEOUT:
> +		return -ETIME;
> +	case SBI_ERR_IO:
> +		return -EIO;
>  	case SBI_ERR_NOT_SUPPORTED:
>  	case SBI_ERR_FAILURE:
>  	default:
> -- =

> 2.47.2
>

I'm not a huge fan sbi_err_map_linux_errno() since the mappings seem a bit
arbitrary, but if we're going to do it, then these look pretty good to me.
Only other thought I had was E2BIG for bad-range, but nah...

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
