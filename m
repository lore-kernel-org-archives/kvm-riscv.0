Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 463D9C54ED0
	for <kvm-riscv@archiver.kernel.org>; Fri, 23 May 2025 18:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=04Ox7l+NsHgjHAP8f3vEgXBhHmmmv1vy2TIguN+pCpY=; b=Qra6Q4pADS9QEe
	9lpZt3e0l+sSSx0x6fQRM95tSUAmlm7TF/kW9PUakhdh/GywSIxoJWvGWSpFOVs6HAQkiUtWuAnjO
	hdDKryR34vvy4r3yCtJFi5wO61LCniFbOwgCbgSNyYmWEsPbpEgUpo5BSr+K7ynVt5j5SUuSwQN6a
	x1wwYNtqEsCeg9S2t4SyUYJeFUERDFFUXT5mvH3NilhnPrwIuT9VSXijJ4g/wjnNCcsO5S3kBYieC
	+WR6Gmap1px5/2OpntN70uc7unK1NoEgll5BAvoqH7xJiclGiRUVqp7rxdYnXBztOSZ+Jo/wjAS1W
	iWYOoSs+BjZ0jAiJNaMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIXAS-00000004hEu-3pQ7;
	Fri, 23 May 2025 18:30:52 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIXAN-00000004hCA-2Awr
	for kvm-riscv@lists.infradead.org;
	Fri, 23 May 2025 18:30:52 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-30e8feb1830so217478a91.0
        for <kvm-riscv@lists.infradead.org>; Fri, 23 May 2025 11:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1748025047; x=1748629847; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gWbUHPNgvAgT5G9XCmvjzlBHTlpN3kX1yERm+5eFQko=;
        b=GTpJmXgJEbv9LdtBuprM9A8n5lv4iU7RIedopP4jQe+6mYlBqYWqwuUrSrvtPx2fau
         QgN8HTd/2pll76IwzxBRmtLV7VR4rAZoTsChZKd8SRdqSRHl24oKSJ1+jxibX82zxjLe
         mZ4HoWjGIjKbFyWviJMvPaOkjw7wS8BHdqyGJErOzgY96Ve/S7woa2DjnAUKfVscxWSa
         CDwvYdhkM5hGlrkBz34MJYaFxQPZJxXoQXFbgzKzPlR/d3UIPd3EsfeCoG5H54Av408w
         GhAVKtLG7h9VEedozIora4LDg1xxCRQE4/pRdGAey041uxZ3t6N53dC2DXyaFzBUcj23
         D8ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748025047; x=1748629847;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gWbUHPNgvAgT5G9XCmvjzlBHTlpN3kX1yERm+5eFQko=;
        b=HdNLGTiHRC5cLtZWVZXn4zi/D4c24yZL0AKn178kbxiMl98xcgQIAGGC16LEs0yrVb
         sv2IeE/gHkANncjgZCpQ44r0fzoPWHSKnE71qrJ55sN+Oc7Ch/gg9rnCGMe0oRuSc0My
         J8oUfXcwkJ1s+004MC+//0lZfTceiiaC+CdBfviKaTAHUWwsPSq3S1nu9F2aUaYJ6PcJ
         hXGR9pc8xMBCQy5x2VDckL30jIxTc7dj52SmnHsyIRRjXSOSgRVPZg0QZAHF0pC6Me+s
         Tza0EiXjCmTo9DPTVtWr3fgvWbY21ocSZmrA1S4pbV1yatzddfzdGdoy3uUVmJkcW1L8
         SP4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUhwqDxswQB6hRj+YBnUdcxDC6fhT8NvloNwYmWGgsZ8QKyTLjKccD7unCym+3CKNuF5+rRrX/8Caw=@lists.infradead.org
X-Gm-Message-State: AOJu0YwStW559fiuKsWsg48Ig+jY6zPMK/bvtdJs38O49QxkSfL4m57S
	vTiMgo6tEkr24FT07yErSR7Uu13xidyMkC4GhLVtrj9PQ/kag8MuYhL8YU3W7ixByoE=
X-Gm-Gg: ASbGncupLhPtnhdv85xVl2cjknf/NKyzb8uqJCaWIuJVxWtjyV12259nkSMFLttwCqI
	AOEutHQCM/6yksuN2ZHjFv7lkChuS+mCaEt0GYvm3hFj+39OVFLEKMs3l3wrDQNwl4NpWj232DQ
	dex5DjA5zvL9odbaQUdcVAMQTy1Pg+Hm8E4OrpWT6Hakg3/vm6U9gHnvTlP9lCKqrT+e9KdCDVe
	HNBLW0orbBRpDNTDuuwA2Ob9+R/Zz3fRf287FOjyhaKwZ/ZjFeUBtfFMDiz7rdLffuxUY+n5i6I
	YjLxbnwQZ6Ryr8JQSadWDmAwKDsn+GHUJeff9dIb849EFNM=
X-Google-Smtp-Source: AGHT+IF6EgWK2eUC5Xu5iRop7pXN3/Fhxf1IfDgAGTEelKq535OUbR+gaTA3ptsvLBrT9R7jy18zfQ==
X-Received: by 2002:a17:90b:17c1:b0:310:c46c:ee6b with SMTP id 98e67ed59e1d1-31111a4c866mr121461a91.33.1748025046448;
        Fri, 23 May 2025 11:30:46 -0700 (PDT)
Received: from ghost ([2601:647:6700:64d0:bb2c:c7d9:9014:13ab])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-310f7eb53a9sm1014559a91.12.2025.05.23.11.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 11:30:45 -0700 (PDT)
Date: Fri, 23 May 2025 11:30:42 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Deepak Gupta <debug@rivosinc.com>
Subject: Re: [PATCH v8 09/14] riscv: misaligned: move emulated access
 uniformity check in a function
Message-ID: <aDC-0qe5STR7ow4m@ghost>
References: <20250523101932.1594077-1-cleger@rivosinc.com>
 <20250523101932.1594077-10-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250523101932.1594077-10-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_113047_553946_63B95D3A 
X-CRM114-Status: GOOD (  22.30  )
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

On Fri, May 23, 2025 at 12:19:26PM +0200, Cl=E9ment L=E9ger wrote:
> Split the code that check for the uniformity of misaligned accesses
> performance on all cpus from check_unaligned_access_emulated_all_cpus()
> to its own function which will be used for delegation check. No
> functional changes intended.
> =

> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/kernel/traps_misaligned.c | 20 ++++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)
> =

> diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/tra=
ps_misaligned.c
> index f1b2af515592..7ecaa8103fe7 100644
> --- a/arch/riscv/kernel/traps_misaligned.c
> +++ b/arch/riscv/kernel/traps_misaligned.c
> @@ -645,6 +645,18 @@ bool __init check_vector_unaligned_access_emulated_a=
ll_cpus(void)
>  }
>  #endif
>  =

> +static bool all_cpus_unaligned_scalar_access_emulated(void)
> +{
> +	int cpu;
> +
> +	for_each_online_cpu(cpu)
> +		if (per_cpu(misaligned_access_speed, cpu) !=3D
> +		    RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED)
> +			return false;
> +
> +	return true;
> +}

This ends up wasting time when !CONFIG_RISCV_SCALAR_MISALIGNED since it
will always return false in that case. Maybe there is a way to simplify
the ifdefs and still have performant code, but I don't think this is a
big enough problem to prevent this patch from merging.

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
Tested-by: Charlie Jenkins <charlie@rivosinc.com>

> +
>  #ifdef CONFIG_RISCV_SCALAR_MISALIGNED
>  =

>  static bool unaligned_ctl __read_mostly;
> @@ -683,8 +695,6 @@ static int cpu_online_check_unaligned_access_emulated=
(unsigned int cpu)
>  =

>  bool __init check_unaligned_access_emulated_all_cpus(void)
>  {
> -	int cpu;
> -
>  	/*
>  	 * We can only support PR_UNALIGN controls if all CPUs have misaligned
>  	 * accesses emulated since tasks requesting such control can run on any
> @@ -692,10 +702,8 @@ bool __init check_unaligned_access_emulated_all_cpus=
(void)
>  	 */
>  	on_each_cpu(check_unaligned_access_emulated, NULL, 1);
>  =

> -	for_each_online_cpu(cpu)
> -		if (per_cpu(misaligned_access_speed, cpu)
> -		    !=3D RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED)
> -			return false;
> +	if (!all_cpus_unaligned_scalar_access_emulated())
> +		return false;
>  =

>  	unaligned_ctl =3D true;
>  	return true;
> -- =

> 2.49.0
> =


-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
