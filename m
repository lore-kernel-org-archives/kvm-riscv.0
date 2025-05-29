Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 749CFC5AD49
	for <kvm-riscv@archiver.kernel.org>; Thu, 29 May 2025 13:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LvIsNPps01XL3WXlVe9PyLliBkHurvnlVZH6rSOX5kI=; b=xRa0oCQXwt3YHO
	XqQ4gi8NAGz/gPL6oaL3sfWrPM5jmO+PvJp3sQRWfCo5GpdqvXf6IcC1gy8/i9F15dprp3Yg9iPs1
	yzEDav6S7bRaNKbMQFGK2AL03/X/AXlvCXzo4HjBJ6GPMyVu2AzIYAA5u0RL2AGr0f/UUkz8TiIsf
	1jCEDTE2N0z8OVUkJrkwIimpFKNN96wgphP8jwvbtws94FrnTToLlrZwEcU13rl6CCSAqg8LNRZiu
	gODmTr3nbjRznPXrIbyAs6HofDqrsYaRvmu9sHNdGbyvseZv+yxiUhnO0vlaGEEMq7JujTBQFVU3Q
	Jiun/fooV7a3CJlfQ/lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKdLE-0000000FrPU-0LJt;
	Thu, 29 May 2025 13:30:40 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKcbE-0000000Fksw-1zN3
	for kvm-riscv@lists.infradead.org;
	Thu, 29 May 2025 12:43:09 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3a3798794d3so748872f8f.1
        for <kvm-riscv@lists.infradead.org>; Thu, 29 May 2025 05:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1748522587; x=1749127387; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mJYtTflbkn898/BLxpK7QKxJtXnTWVg7vYFavAXp8EE=;
        b=Un3Ymnw6SpDElpxDg6B29slap3Jx560+Fk1FjeIrXfC08HjyaV3An8PRJVG3bAjEEG
         z2aFu4igFyA9KG1hiKlCkTnwtKUQLLJ9LoIzC4yKjFfc2QPVJmGbZFyp6Fq8y5UcNKtC
         hLNcOzxua+noJFSL1KdNJuKhL8tJJh51ohRwV0iFuKRMjInj4men9OjENrO+rUgfyUm3
         U83HN8AMIvtGIs5Lnkkk3/ysMB8kqmleAO6iHu/izegrI7RhWD7Lo1wo+EVTmByijnwP
         l1/lLblyahzeay07T26RV2KEUcHlXFtqwlFI9Thpk2E2BbqnyjC6sm2eQUIh+s0TPdLs
         nDxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748522587; x=1749127387;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mJYtTflbkn898/BLxpK7QKxJtXnTWVg7vYFavAXp8EE=;
        b=Yqt/my9zlwUGZjT7bmA/k3ktiO9jxv54n7jZtUKcOt/sCalcOi1wzgROezWRG7foO7
         wgqMh8fDTpw1chrFwJze8+zk+uuvOJIqVc+ItrTgf1i5vvTIYw6/nOBoZfojXcpC0MGh
         3ydnIOYO5F+XxPm11q5YrA7MrA6ClJyVS26njqJppA3pxekqwPEhiyotRohKeQWYiKnB
         jLjiy7ZcRXczeNTkJgHPXTPiKq5TCA3a7mamL4aJSbtEjWyvKvN5oglKoh9CPW/jNSev
         OpBYuvZB7/BNTdJLkqzwuecXwccycDazG9f2AgBeA8N19l2sypE7L3FLmbpJ1IJapIsY
         2bmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgTOQzJeVXaHkDw9IMQJctXi/WpXiOtCj6NuCI7F4QUacmA1YGlkim1JN3l8W/wPJzB1lQ24kV+oI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6ZbrUQ5DBWKks0ywkM8sjploPXSXd+a9y4Oznf6GCQ+6A8zJF
	mB5lIAIrx9bEhHxKT55fItlQPAZS0NqZr3k6/VYCCYF9lDy4W8X32l+1GZZ6yvh5Z0M=
X-Gm-Gg: ASbGncvC6c9NJ8FRxH+ATbfvtEC6cGDGox8aT95NYaTei5MdRC6MhItuLOHLR7HRDJc
	O7DRaGpLaRnZXEjzcSm3QvnqdP+l6mJmpE3I2yXXtd2hiUaJQn5m60vc+zV9XCMVfNcAHvDUH/G
	VFCCdTLI83qmqU4kjkWdIUi7mc2/WPs5uLCMMyguw4/nnT0GWv4AleBFQU/f22zwywNR3WoFgsh
	WoRC4uLzLNvzRzgjG+hjOcxW+rk/RSauM384KEojmwb1c8shPS1LEOL25HOP4TqM0OOmEdzkdMa
	CmmddGxJZih+NjLNN1LbWztP1O41O1fZkJgfX8M=
X-Google-Smtp-Source: AGHT+IH1qVc7QxmWdlIwYswNWc2JM2wrCY/fhXTQ9RO7aSAjTmjiWe3//9USHzfv3DqUERGinpMtXg==
X-Received: by 2002:a05:6000:26c8:b0:3a4:ef70:e0e1 with SMTP id ffacd0b85a97d-3a4ef70e20dmr1890290f8f.55.1748522586703;
        Thu, 29 May 2025 05:43:06 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::ce80])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe7415asm1948902f8f.57.2025.05.29.05.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 05:43:06 -0700 (PDT)
Date: Thu, 29 May 2025 14:43:05 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	Samuel Holland <samuel.holland@sifive.com>, Deepak Gupta <debug@rivosinc.com>, 
	Charlie Jenkins <charlie@rivosinc.com>
Subject: Re: [PATCH v8 08/14] riscv: misaligned: declare
 misaligned_access_speed under CONFIG_RISCV_MISALIGNED
Message-ID: <20250529-84d9bececfab561dfc68b723@orel>
References: <20250523101932.1594077-1-cleger@rivosinc.com>
 <20250523101932.1594077-9-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250523101932.1594077-9-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_054308_515461_79E56786 
X-CRM114-Status: GOOD (  18.43  )
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

On Fri, May 23, 2025 at 12:19:25PM +0200, Cl=E9ment L=E9ger wrote:
> While misaligned_access_speed was defined in a file compile with
> CONFIG_RISCV_MISALIGNED, its definition was under
> CONFIG_RISCV_SCALAR_MISALIGNED. This resulted in compilation problems
> when using it in a file compiled with CONFIG_RISCV_MISALIGNED.
> =

> Move the declaration under CONFIG_RISCV_MISALIGNED so that it can be
> used unconditionnally when compiled with that config and remove the check
> for that variable in traps_misaligned.c.
> =

> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> ---
>  arch/riscv/include/asm/cpufeature.h  | 5 ++++-
>  arch/riscv/kernel/traps_misaligned.c | 2 --
>  2 files changed, 4 insertions(+), 3 deletions(-)
> =

> diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm=
/cpufeature.h
> index dbe5970d4fe6..2bfa4ef383ed 100644
> --- a/arch/riscv/include/asm/cpufeature.h
> +++ b/arch/riscv/include/asm/cpufeature.h
> @@ -72,7 +72,6 @@ int cpu_online_unaligned_access_init(unsigned int cpu);
>  #if defined(CONFIG_RISCV_SCALAR_MISALIGNED)
>  void unaligned_emulation_finish(void);
>  bool unaligned_ctl_available(void);
> -DECLARE_PER_CPU(long, misaligned_access_speed);
>  #else
>  static inline bool unaligned_ctl_available(void)
>  {
> @@ -80,6 +79,10 @@ static inline bool unaligned_ctl_available(void)
>  }
>  #endif
>  =

> +#if defined(CONFIG_RISCV_MISALIGNED)
> +DECLARE_PER_CPU(long, misaligned_access_speed);
> +#endif
> +
>  bool __init check_vector_unaligned_access_emulated_all_cpus(void);
>  #if defined(CONFIG_RISCV_VECTOR_MISALIGNED)
>  void check_vector_unaligned_access_emulated(struct work_struct *work __a=
lways_unused);
> diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/tra=
ps_misaligned.c
> index 34b4a4e9dfca..f1b2af515592 100644
> --- a/arch/riscv/kernel/traps_misaligned.c
> +++ b/arch/riscv/kernel/traps_misaligned.c
> @@ -369,9 +369,7 @@ static int handle_scalar_misaligned_load(struct pt_re=
gs *regs)
>  =

>  	perf_sw_event(PERF_COUNT_SW_ALIGNMENT_FAULTS, 1, regs, addr);
>  =

> -#ifdef CONFIG_RISCV_PROBE_UNALIGNED_ACCESS
>  	*this_cpu_ptr(&misaligned_access_speed) =3D RISCV_HWPROBE_MISALIGNED_SC=
ALAR_EMULATED;
> -#endif
>  =

>  	if (!unaligned_enabled)
>  		return -1;
> -- =

> 2.49.0
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
