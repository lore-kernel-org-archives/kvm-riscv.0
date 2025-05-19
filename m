Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65565C54754
	for <kvm-riscv@archiver.kernel.org>; Mon, 19 May 2025 23:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6c0yT5WEO2+yWAXXiscFWGoO10LCmV7NzvounR2sYhw=; b=v2teI7CpNzhvZM
	ynWGVruRjiyKG0o3ZLiAgCkUhXlyjFiWnppWAT5DQ2Tr+5citSiN8VNZT6+fOe9ej4HSzAw77eLzs
	MNE4pRraILL5uFLCffOZXXDAiG3nMNNdVN6OC2rTTN+phPndhDydHtdS9dOEegrcYC2kfeNc2MjBQ
	TtoqlrN7Jek2ydQmipiQfvsDuq5Zsxhd4VKusTMPfcrfFSvZDLHNDjB0D0rjTX78BHOe5cTO9MY0k
	ofKMx+/EFxuf2F2hG84f0SLSo28w1iNFZjhhHYe4gAcdMCjpsBZvH+8UCQeoSQQXh1hnTNWivgTho
	qdgFBs+IkEp/0kEu/ASg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH9xp-0000000Aurp-4Aqw;
	Mon, 19 May 2025 23:32:09 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH9xl-0000000Aund-3Qmt
	for kvm-riscv@lists.infradead.org;
	Mon, 19 May 2025 23:32:08 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-7399a2dc13fso6408316b3a.2
        for <kvm-riscv@lists.infradead.org>; Mon, 19 May 2025 16:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747697525; x=1748302325; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QOyUGS8X8xHimjiVikyyoBlw5XuU3QFPDBQZu8PO5T8=;
        b=NPAHNZ80gUofffPUUvb7NCRCo4LBy4Ff9/y2hKbSZfrPyW33pcL/hesrkrUTrYOt59
         UPOCbmTPlkF5TkNlvGcoIxQUMfi46IEdbGNqvwI9a+imEy52Ne+j+ziiz6uRI4rTWRhH
         bKTbWJL9i+Ia8hfDT+UJKM6+lVMHP6Gmj66y8KZozRI+tXqbHvhN5e68uwTcS6YVViBO
         fHwzIlWbdmOrdYDPE/w+hAMII0T+u1sYNo35NhtVEosDKbO9rhpP2+sqxwWrCp7libz/
         6EmjuRVZol7T2BnqOY34CLj37d86ZuNyMHOaHD/zqUNGgKakaPtrXrDCz5enu9eddKGk
         Sxmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747697525; x=1748302325;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QOyUGS8X8xHimjiVikyyoBlw5XuU3QFPDBQZu8PO5T8=;
        b=kh2MjlcdiZdcrdbdiL+hrmIAiLYydInXTZ2zbp/4X3DjmbpeRVgnAYbEKTxn8wSewj
         tM86iPT85+maXwdjHDr8GQOStESxgmrU1C1xlYoP4rdadrcg6e88h9J87HeSmi0FehO5
         t/WuOUn5UJt8XU0EjUOQwmB0NmR8o9Nno0vEcY/OKdj494zFU2MBcCJgwF4+1zjQAFnH
         LJHDomTaNUfjdpMmQP1rUeo3kJpBiKz8rKJK1kTpOenJCi195C19hB0qB+gpjYX4aIEv
         K24l1G4CVQX231V82KgPtSa5LkVfo+TmFQo14qDp0IyTmZ8dsHoDfMJ/UCTvayjbuf2h
         Oq2w==
X-Forwarded-Encrypted: i=1; AJvYcCVjPuVAKtD+aU7Eqet8P4k5QL/2x5Tiw+FTFJEiI+hgy4231R/ZdLkUCjeFojTcLRwI7/unI2nOjgU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9OofK1v5+V76rO9MBXGJoWCnfCATJAHmPhi8nZ8HOOyjhfxkT
	6JfC7BPxw3c1xgFRlk/rnimPwcWTwrBIXp82iUcGwG8DHp1L1HreI4C7c6Fjjbn8mHU=
X-Gm-Gg: ASbGncsl34qo95FVRXa9xhkVXWM2MLIqceWiX26ngpP9b1g4KMvjHDsG1DLctvz/XRo
	cF8uKX4yc75M/bTxWLT2HNoYUoTszg56izuycl3zkIDWC6AtbhEpqoIqgyC0YMDjKexR74e+S3d
	4na75ssMwT7FrwwFsB9SZYFNdNfGKXq2NG8f0B1X7seC5mYs2FnUWO7n3n0cIZrejSmNTbYN6rb
	8VISOTcEWyjhNxR00VqXRTxH2RU9Zz/kEchQBHA+DJLL/X5O+DU5pphCwJoX+D+FFbOYxrWI6Xa
	K2SaqQpDAy/j7Rb8gWj3ogKYHWfsRxtD/c/Qp2LQdxXTwGA=
X-Google-Smtp-Source: AGHT+IF/UpnfYd87Wg38QzExFJepdbUZBdK8n48P10QCBwcJgibQDw+FN+/Y6470diBydPdUYMEijg==
X-Received: by 2002:a05:6a20:3d1c:b0:1ee:d418:f764 with SMTP id adf61e73a8af0-2170ce33ad3mr22022427637.38.1747697524568;
        Mon, 19 May 2025 16:32:04 -0700 (PDT)
Received: from ghost ([2601:647:6700:64d0:5f9c:a71e:a2da:158d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eb0a9893sm6875885a12.72.2025.05.19.16.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 16:32:03 -0700 (PDT)
Date: Mon, 19 May 2025 16:32:01 -0700
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
Subject: Re: [PATCH v7 09/14] riscv: misaligned: move emulated access
 uniformity check in a function
Message-ID: <aCu_ce-kVQsyjrh5@ghost>
References: <20250515082217.433227-1-cleger@rivosinc.com>
 <20250515082217.433227-10-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250515082217.433227-10-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_163206_064884_BCA4967F 
X-CRM114-Status: GOOD (  21.32  )
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

On Thu, May 15, 2025 at 10:22:10AM +0200, Cl=E9ment L=E9ger wrote:
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
> index e551ba17f557..287ec37021c8 100644
> --- a/arch/riscv/kernel/traps_misaligned.c
> +++ b/arch/riscv/kernel/traps_misaligned.c
> @@ -647,6 +647,18 @@ bool __init check_vector_unaligned_access_emulated_a=
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

misaligned_access_speed is only defined when
CONFIG_RISCV_SCALAR_MISALIGNED. This function should return false when
!CONFIG_RISCV_SCALAR_MISALIGNED and only use this logic otherwise.

- Charlie

> +		    RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED)
> +			return false;
> +
> +	return true;
> +}
> +
>  #ifdef CONFIG_RISCV_SCALAR_MISALIGNED
>  =

>  static bool unaligned_ctl __read_mostly;
> @@ -685,8 +697,6 @@ static int cpu_online_check_unaligned_access_emulated=
(unsigned int cpu)
>  =

>  bool __init check_unaligned_access_emulated_all_cpus(void)
>  {
> -	int cpu;
> -
>  	/*
>  	 * We can only support PR_UNALIGN controls if all CPUs have misaligned
>  	 * accesses emulated since tasks requesting such control can run on any
> @@ -694,10 +704,8 @@ bool __init check_unaligned_access_emulated_all_cpus=
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

> =

> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
