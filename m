Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2C93C54ED1
	for <kvm-riscv@archiver.kernel.org>; Fri, 23 May 2025 18:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C/pfyzDMeTtOhzxyUvnEwSwrOTfzgoImt4A5r7fPTdA=; b=ga6EIHmat5s/B8
	3RGi7FUZ/TIEuP4wO519lJezbCaYxtIWJQ38LkzD36AjRFdEB9UmxYWsHRdBJwyPxQew/70bV+Eom
	0Z0pMswIc2uvN40QgSyYIAy1ngS/SPVSpIElIZMW3lg/XKx2ine6hUECcOA2FF7+RihvHCgVAWD0M
	/yy+iyypTrKmd7/b922PA7k8lHaQgG66PK5rEsX1iSXyvCS6zR7KY5ve8rsqJXNaXv7TwNfBDkdwZ
	MrmlOXbW0brbamp//7cEpN56TUZHQwb/lA3u2ALaTe4U8pqvtTz0r9n19mgdD5JD6hZwCfZFUXd1o
	GMU5XzUpgO2lx21Toauw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIXFx-00000004hje-1UhL;
	Fri, 23 May 2025 18:36:33 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIXFv-00000004hj4-3Lh2
	for kvm-riscv@lists.infradead.org;
	Fri, 23 May 2025 18:36:33 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-231c86bffc1so2131965ad.0
        for <kvm-riscv@lists.infradead.org>; Fri, 23 May 2025 11:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1748025391; x=1748630191; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XnO8ioDanheZvAb9A+PQvS64cAnXAyms8SMalyfchF4=;
        b=10b+CDtnVlm5D3Od74zIwqSPnBHxb8tIjIfKZWI6kovXh30PcK0Rm92tVLpnChizcC
         khbnifiTy7wGG6u7OSaL6gFdHdzMPzTfjU0oXzVyGYMgaAvZ7DbU6vCliTi6/OFqIkyM
         +z26alAndOQ27PNIhkzDTrCNbizhC+oggs2PlZEccCVWajhb8HvgNUFjezCeay3JAtj2
         q4/dr8maCQJv/+CFtIKrxWUFlM+v889k86S9xb1D0X5iDBXAb8opnPilLaRq+k/hQTDh
         FcGzyq53Q360JKF45h5wP/jd6KxF0FM8T7ryR63t1mTqkQdyo+T7vOjAzstAUfs5AwYm
         QsOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748025391; x=1748630191;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XnO8ioDanheZvAb9A+PQvS64cAnXAyms8SMalyfchF4=;
        b=mPe1wIfw0eiSh0Fli1Tt0f7bHW9VkyixVF6Alysz/koVYNvqifKIuaURSxCf308gkc
         T3xpnQh5d1OMwvtZOr6ptN0KtEtpCN4I5PkRKUSnv0QBLQfoItcHOdn/5HwRpLwBboBD
         9YsWcAZFtP6S9LbFsGugZ+Mbt4M0VLhzpyo3fuVh0JCa76j1ZBMJRD43C6xnd+9qDFYF
         bEtH1/6wghh6kuft82Dwswu/MJXcs7rtnJtI+FBesSZXrU6j9qd8djyB3QTc1TzMF62L
         c+UW+k9Jeoe4t56w3EQ4AQmOPSIodS5UotFw8uYIdseKpZPITXnSp77L9i6DOjV+IKHr
         IWvA==
X-Forwarded-Encrypted: i=1; AJvYcCX3euZa838JDiuU1nL5b0UPp0t7xUlejERn8HdtSeHLoxlYE7Tm5HJ8lf22+ykgQ49/9wh6JnE/ZCQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YwIbtQacMOB0VsT3OpdoQBLHWxI0f8E5ZHIFKhOTgibASkv4h7F
	pfEtICfzcDdk8X80u3R3libPeUsBIXiU8IXaufr0LVhvvd5zJLFdhGUlurGKztshUzU=
X-Gm-Gg: ASbGncsexUkf2GsK84wSznTPg1po5X+qHHo+jUpVXUEI7TGNhgapbkk59JuVlkmmPD1
	xzp27ox9hyJNG1bkKHDoegvcybRvuSvEHozvzP1c7IVQ7sko3YjRiy+4nO0VEstKAPANL1sSMaE
	U+5goCdwfkmqSNp7NxWIqsnmRfbeIeEmil4h8xGvkX+cZlaTN9HZtyRtJSiwxMLr5q+FJznzxHO
	et4I/no9M8aHEn6gG+JxCA44pgGdBVrS+N85PdLUrDx+n6w5KlhCR7s1Xuv+mgL+Vx7W28KR+I7
	vb2jukZBsQPh+aw8R8q161KmvkoVDRumlJ1vrCkUIXiXfJwk1Qq+myD65g==
X-Google-Smtp-Source: AGHT+IEwnYCpZ451OQ3B+iw4XNmTax9n7nwuUqC+o2uJAltQvhC5r0FNuL4BvGINCHYUs7gwuPUCJg==
X-Received: by 2002:a17:902:da8b:b0:224:c46:d166 with SMTP id d9443c01a7336-23414fafe1emr6331075ad.40.1748025390826;
        Fri, 23 May 2025 11:36:30 -0700 (PDT)
Received: from ghost ([2601:647:6700:64d0:bb2c:c7d9:9014:13ab])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ed897asm127271765ad.250.2025.05.23.11.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 11:36:30 -0700 (PDT)
Date: Fri, 23 May 2025 11:36:28 -0700
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
Subject: Re: [PATCH v8 08/14] riscv: misaligned: declare
 misaligned_access_speed under CONFIG_RISCV_MISALIGNED
Message-ID: <aDDALDt_k1ZoID1H@ghost>
References: <20250523101932.1594077-1-cleger@rivosinc.com>
 <20250523101932.1594077-9-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250523101932.1594077-9-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_113631_842658_2AF91638 
X-CRM114-Status: GOOD (  17.60  )
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

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
Tested-by: Charlie Jenkins <charlie@rivosinc.com>

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
> =


-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
