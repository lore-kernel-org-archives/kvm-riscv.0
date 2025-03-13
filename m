Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95848C282EC
	for <kvm-riscv@archiver.kernel.org>; Thu, 13 Mar 2025 14:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9bE/v+e1e9YhXlixS19ecU0953G8eo2/gi7RqJVmhL0=; b=hhcg4OdAPWaFd1
	FVheHkN/iSr6kUQXgggPA9arDu6icfyJlrnz314+dh5Wf5kc6eAZ85z1ysEU+lkGs9HL35dx1Db/O
	r63MHKkjYpJG/ZcuQl9oi1UW1dsbXDY1cbyU9qcywsGDi9T1A3ytOwEmrAeqjsw6g3xVgmtA7yuw9
	rjywK9WAZdWmouna11hnAgYL2x/P3YFPqMoVpMMn2M4ggDjYN3mC+kURgkwbIaV1lSwaSqBKbzNG+
	VZ78OlEDlhY9/ZqbINmYmO5jsd9iRmjOpQ5LciBCqSurW2AkgdDb9WOe4Pf8nJHCzl2c/3VTTsmEm
	uQ7mgrrlRWfy2d5/h/kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsjQg-0000000BVdX-0mbN;
	Thu, 13 Mar 2025 14:20:58 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsiGK-0000000BKI6-3Zzr
	for kvm-riscv@lists.infradead.org;
	Thu, 13 Mar 2025 13:06:14 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso5626825e9.2
        for <kvm-riscv@lists.infradead.org>; Thu, 13 Mar 2025 06:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1741871171; x=1742475971; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JykEzm+QtlDREfjY9aCf97M8p4eU9HkNtWKu9+Cs/cE=;
        b=jk2ddD3DI3oTlmqBDrsBrTUcWvJTQMYf1zIZ1cpiPs0D/HNzDBE7bf0pdFNJkE50Dj
         qm9Ho5RC1hv59kq1ia0iayblR5WHVhepPejwJ6vuZ9vxCn3O/IG9dxmEv2axd4xQ99i6
         2QJ3mKJOy1vW52jN+tbHW7y2qZcNDQzcYtvNfHK4Ta4mNEHzsE3+r1mSs5k1UYj38Na7
         it4Syk3kVbOPtDXM3XNGmeeQ8vrkiaipqUBGqswIozG19d3kpfSW0vgQc27z6DmwzyTw
         QEhkAQrivNPEoJQXGT0VRUzVbQfo9iMh5HJlukPC+RgrdAVLs/SrDdATIipKUvi7BHuw
         FZEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741871171; x=1742475971;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JykEzm+QtlDREfjY9aCf97M8p4eU9HkNtWKu9+Cs/cE=;
        b=QE7ryi+0OijkNHWtjpG7jkgiKefBiByzDmEloc7pHrix/xEqhvrhyd/g4JhKLDkusv
         hslx2LxX3xb+UuBATnNcajFK0nkxuE0tCEOPy7Oja0rG3DGn9tRXP1A86npDO2vcGpgb
         mlAaK9tDDRejigY2vLOv0Qtj3M9ZLT8sH6ODo7W/JS94MCVHrdsI9uwyD7X9LE4sgPS2
         Z5O188TwdRZMzwUvGSII88A+J2zcaUia0jgHE5GXiY8XtQ9+eXMULSD1srbPN6dtQOzy
         ksZuF/WwkljOBlPtdb8jJh2HNqYPm8gAV6i1FLtKwrqh7erM7xsZ6RzaPJiY1k1TrUMz
         ctWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUALW1Y4Nkz08cGSyGjm1Lt7SI6rDI0NhsjmbO43lUkei4B5KWbHERcHCAc2+KDL8cBcOwi2wE0m14=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6kIGJWcHWToAFtd4yxKEJA4i/4Fa27/7VkqPdXiOh52xPZXSZ
	ohC+M00L2j9SmfBHxrO+b0dpfNL2UHDmcizf0tBp8JbCdQqvZxhC07rXX9sscVI=
X-Gm-Gg: ASbGnctZRpLjndon/wTaGT82wumt/a5BckPf1bFgz7CLJMEvq7t7Vz6mOhOxpM+26X4
	IdWmGjTYgNkve2QCCYp5pvJEUG/sFxmpDrRt5Xiufx5xnaGUFSoVCw+QYW+F5wr/msivaxYJWPZ
	1BccnSPwW+snapy3vcM3hmw0gtD4YuAahj+/UlN5WaCGMmfxqzeaSvpfIQ6LNzRVG/xyU2BicCX
	9uYBnG189oHbK+PPgjjJfMF/KWu220ABlycVZPYQGO1UOo+45kJSkHjS9Oe3MSHZwuc+nKWC0n0
	u9fHbWuaFDoCSYyPDxnCAraYnV6iS258
X-Google-Smtp-Source: AGHT+IHbHWsyXLkkKJFKW9xqRqjCmH9M6Hc04X13GIMAwv1uQuG0cXmClbOatlbE9Co87YMRA/AdwA==
X-Received: by 2002:a05:600c:3b13:b0:43c:e9f7:d6a3 with SMTP id 5b1f17b1804b1-43d01be652fmr113577215e9.13.1741871171136;
        Thu, 13 Mar 2025 06:06:11 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::59a5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c7df413esm2048987f8f.20.2025.03.13.06.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 06:06:10 -0700 (PDT)
Date: Thu, 13 Mar 2025 14:06:09 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH v3 06/17] riscv: misaligned: use correct CONFIG_ ifdef
 for misaligned_access_speed
Message-ID: <20250313-a437330d8e1c638a9aa61e0a@orel>
References: <20250310151229.2365992-1-cleger@rivosinc.com>
 <20250310151229.2365992-7-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250310151229.2365992-7-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_060612_898537_6A4609AE 
X-CRM114-Status: GOOD (  14.89  )
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

On Mon, Mar 10, 2025 at 04:12:13PM +0100, Cl=E9ment L=E9ger wrote:
> misaligned_access_speed is defined under CONFIG_RISCV_SCALAR_MISALIGNED
> but was used under CONFIG_RISCV_PROBE_UNALIGNED_ACCESS. Fix that by
> using the correct config option.
> =

> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> ---
>  arch/riscv/kernel/traps_misaligned.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/tra=
ps_misaligned.c
> index ffac424faa88..7fe25adf2539 100644
> --- a/arch/riscv/kernel/traps_misaligned.c
> +++ b/arch/riscv/kernel/traps_misaligned.c
> @@ -362,7 +362,7 @@ static int handle_scalar_misaligned_load(struct pt_re=
gs *regs)
>  =

>  	perf_sw_event(PERF_COUNT_SW_ALIGNMENT_FAULTS, 1, regs, addr);
>  =

> -#ifdef CONFIG_RISCV_PROBE_UNALIGNED_ACCESS
> +#ifdef CONFIG_RISCV_SCALAR_MISALIGNED
>  	*this_cpu_ptr(&misaligned_access_speed) =3D RISCV_HWPROBE_MISALIGNED_SC=
ALAR_EMULATED;
>  #endif

Sure, but CONFIG_RISCV_PROBE_UNALIGNED_ACCESS selects
CONFIG_RISCV_SCALAR_MISALIGNED, so this isn't fixing anything. Changing it
does make sense though since this line in handle_scalar_misaligned_load()
"belongs" to check_unaligned_access_emulated() which is also under
CONFIG_RISCV_SCALAR_MISALIGNED. Anyway, all this unaligned configs need a
major cleanup.


Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

>  =

> -- =

> 2.47.2
> =

> =

> -- =

> kvm-riscv mailing list
> kvm-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
