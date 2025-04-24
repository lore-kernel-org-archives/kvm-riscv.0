Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08FC4C369D7
	for <kvm-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 12:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IiyMzPelskdT5ha8Af3E63d4bE81M7eoNGmoDKnjthI=; b=OwKxeRuDmysg4u
	tYJEnWjtr2rgXjZYANapZS0Zkw05Ai55EIoH9yc7p9Q3Of3p6vjhxXuLjm38RPTHItdFIth26M65k
	v3PuFe2ZY1aNbBY4z5yy5tY2wPrOuK3oRp4VKFt7gZCcctJv7iXTecfrLyTZEcf95rKbPV3Gp9yeJ
	x2ab+9neXOMqv4I2zZH3rXcHhMfPLpAnmiBwaT3p9xcJ5Z246EJ28z3pnRSyhDYlRIY7G38P8g2QL
	GC153urctG35eIMPnsK4Pwyt4+xb8V9W8nDX3CUvUdfbyCpRURjrTzinKAi709q+lxJKQzqvlB3/v
	kDHypsmNqDsaxrzv73zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7vQM-0000000Dykc-2laM;
	Thu, 24 Apr 2025 12:11:26 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7tvk-0000000DhcK-1yOH
	for kvm-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 10:35:45 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-39ee623fe64so800402f8f.1
        for <kvm-riscv@lists.infradead.org>; Thu, 24 Apr 2025 03:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745490943; x=1746095743; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IUR+h4PX+3NwGH8BQZC0fWxB3CoxerSbNXDHvlU8Qy0=;
        b=ar4zz4Nq6PtwLJYcRR4iX2G7GNnhekTCDiia0loCzS4GdL72cVOYqD6IQzG/2O5hG/
         bn2Ut163Jn7udqPkg9zQD+zsWsIFBzNfeNhXMQlb0HPrnGoUygOBvMapLF9eIMlvT4ws
         kx+sBTbdKSRWqyn2okXkGM1gklIu6DnGYTpIiER/XxEuqxmd6XYSP3sQnAsU3+dph/ek
         gTUEMe8xuOSioVFJ5MSUeQw9j8/YpaPt+vIkTU88RxrF4iHr/ZO802o6JJguxsKtrE+z
         un9/IBFqbUJBYqFF2sRApHOBqt+FI8z6NdYMoD6K2t0Oiy8JEdE8uinXzW7a10fTYph0
         5Q5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745490943; x=1746095743;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IUR+h4PX+3NwGH8BQZC0fWxB3CoxerSbNXDHvlU8Qy0=;
        b=i0ffnXTF45UqxEyMJiH3nI3bsVLIzs0nb2h/1WFuiGkGc6mjPhiwaK7zWD9bkxv+u0
         ymsDPN9o4T62BuymCX+TNtvejMxLvt9oqNmMWVdWKq+xCyDdWtS5Ex53UD/OvwGGnKIp
         VAZIiV6x1+k2nOY87ilrk/pCialFsiDPY2qOBvWGCxPLjaIr3xT5lduaSOEUZYupQwli
         zAyHjWsPpWm19n796Gty2ZyjmKL7m26GHUrhEBM9BVgyatZ4rxm7VkGXmdHex8d3xMI4
         1H8Ipl8UnANZFvYqvSImGGc801FbC/i0NKES0M/EkglnL3vgAeJWAwj5oTiwADbP6o/t
         8dZg==
X-Forwarded-Encrypted: i=1; AJvYcCUo6S1XKfr6pOqN6mRlwRxfySVycVkyl9G7igGnqRdm54EABBCPjQegdSUOvlmB85yvFvrJDcGXGnA=@lists.infradead.org
X-Gm-Message-State: AOJu0YxjUa9ApbMLxjP8ThI+r4WNO+qVqo6JlLVdgwp+XNeaKI+yc43i
	hYCBmUwVYJa6nY0hM3KH1TKIeoVbQg1cbY9Wyx8JePdTLn3IG63QfPoHgW0hbt8=
X-Gm-Gg: ASbGncvgLLUrIMtkX8eCMyU7fXAwtl28vjTxCaHrNjptvjgKp1swBS/aMfudprXOhsd
	o6VhNS8gKkD6EVmjJQB/kGd/yc4YdCADwRRkM/04+nmT3hLik5JXl/4eSZF98XVNC1VZh3AklJF
	V8c96huLZT7AT9qVQR4FRfKkhJ367ySyQRdD9mVBfXol2zdD15NAB330qlqErb+N+dwy95fFes9
	aJNdkdurjoo4Hjark9KQBB3TpITdrFnt8dbPadRrz9+IHAy2JoTbO+CI/DxqM64PTUSeWXWEFI6
	Ok+I64gu6Ysaz6ySZrw+LAmCI0Zt
X-Google-Smtp-Source: AGHT+IEMMNUAVFSZJW72EDWo3VFnQwnHK3P23aJgYipjy3Fyv7YBKouXm/RCEBGe7MUaHxg7wn5VXw==
X-Received: by 2002:a05:6000:4022:b0:39c:1f11:bb2 with SMTP id ffacd0b85a97d-3a06cf5ee5amr1527452f8f.22.1745490942932;
        Thu, 24 Apr 2025 03:35:42 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::f716])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4c30ccsm1653633f8f.49.2025.04.24.03.35.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 03:35:42 -0700 (PDT)
Date: Thu, 24 Apr 2025 12:35:41 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
Subject: Re: [PATCH 1/3] riscv: Fix typo EXRACT -> EXTRACT
Message-ID: <20250424-93c64fdbb15c142ee458d857@orel>
References: <20250422082545.450453-1-alexghiti@rivosinc.com>
 <20250422082545.450453-2-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250422082545.450453-2-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_033544_511091_86119A44 
X-CRM114-Status: GOOD (  14.13  )
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

On Tue, Apr 22, 2025 at 10:25:43AM +0200, Alexandre Ghiti wrote:
> Simply fix a typo.
> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/include/asm/insn.h | 2 +-
>  arch/riscv/kernel/vector.c    | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
> index 09fde95a5e8f..2a589a58b291 100644
> --- a/arch/riscv/include/asm/insn.h
> +++ b/arch/riscv/include/asm/insn.h
> @@ -352,7 +352,7 @@ static __always_inline bool riscv_insn_is_c_jalr(u32 code)
>  	({typeof(x) x_ = (x); RV_X(x_, RVFDQ_FL_FS_WIDTH_OFF, \
>  				   RVFDQ_FL_FS_WIDTH_MASK); })
>  
> -#define RVV_EXRACT_VL_VS_WIDTH(x) RVFDQ_EXTRACT_FL_FS_WIDTH(x)
> +#define RVV_EXTRACT_VL_VS_WIDTH(x) RVFDQ_EXTRACT_FL_FS_WIDTH(x)
>  
>  /*
>   * Get the immediate from a J-type instruction.
> diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
> index 184f780c932d..901e67adf576 100644
> --- a/arch/riscv/kernel/vector.c
> +++ b/arch/riscv/kernel/vector.c
> @@ -93,7 +93,7 @@ bool insn_is_vector(u32 insn_buf)
>  		return true;
>  	case RVV_OPCODE_VL:
>  	case RVV_OPCODE_VS:
> -		width = RVV_EXRACT_VL_VS_WIDTH(insn_buf);
> +		width = RVV_EXTRACT_VL_VS_WIDTH(insn_buf);
>  		if (width == RVV_VL_VS_WIDTH_8 || width == RVV_VL_VS_WIDTH_16 ||
>  		    width == RVV_VL_VS_WIDTH_32 || width == RVV_VL_VS_WIDTH_64)
>  			return true;
> -- 
> 2.39.2
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
