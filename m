Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D36FCC369AB
	for <kvm-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 13:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ONlr+BlHbB8/fPmGbrrFPlVzLR6BXD6cMzqPrCWwxrU=; b=DbR+PqPgEvdaqO
	b7xqbcJdoV8RMiwcnWX7g6JABaenRk0HHE0v2iK7lFv4eYjduJ03n6a3iE3e7Exjcw/cHuLYNjxec
	k0DiadOCasO5OMatKPvoJvfd3zvHEpbFB5Ye35IBeFplscGOqGFe0ij70e1oCpn3BHqYj6mKR6AkV
	NdAwcE8vCuxiRGTpfxnozD16YEf1Yj3KIK+rqiGT30zpyZ7NRbUgCd6b05rcT/MVVmZRCfufBtTs9
	UFeANEjBFDNtYDkAn6Mjs1NQBMOS3ztPPOpyTNkOThRcrHixAfziwKD+Hwzeu5+gBTNhpMDnEvn85
	K6WB0s3iEjzEAfCF5xHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7wBb-0000000E7be-1rYI;
	Thu, 24 Apr 2025 13:00:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7uX5-0000000DouW-3Ol3
	for kvm-riscv@bombadil.infradead.org;
	Thu, 24 Apr 2025 11:14:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=D4mU1T1rDk6z4pxFiDA5HYk4vYtaLPU9FhiecEK1MtY=; b=KhzmnTu5eQEGY5mhALJICSLzbz
	AeahUzPU8PgKfwmtoML/gUiQrfD8trx3mw2KZdVmaZfhqSdjyurAa3q6Lq8K5HIlUIA1FQhNn+a3t
	nV4XLrbWr9Bswq7FeMVGUC0HJ3iQPcw/Pcu9XRe/G9tq0l4rmFTgvw6fYvpAH4k+jg4K8aja1Fp65
	KZLz6kfLoU5MExAkt7B8GCune9dyAzxYGsCh4Jrtf11XVABI0mKn0UFxI1RqEhbXztd1H3yAXB+NN
	8OEvmBDDrFLdxjVxLXvYdqGwimcgdTXJSkCt+1wID5uB/ldzPEKIABfJFlmOmSvOY+fRedc7DFz1C
	AtV0ZPWQ==;
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7uX2-0000000BlM6-3gD0
	for kvm-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 11:14:18 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-39c1efbefc6so606968f8f.1
        for <kvm-riscv@lists.infradead.org>; Thu, 24 Apr 2025 04:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745493255; x=1746098055; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=D4mU1T1rDk6z4pxFiDA5HYk4vYtaLPU9FhiecEK1MtY=;
        b=HAEHRqdBHTvpftR7VzPYpx+CZGkZKd8Euh8heu2EUuHXmN26E3H/iAIKs3T/UJ6SRM
         BtWxDAKzTNP1y8bFabnVj4R07vGrE7VbJVmlMUbaYvuZyuu/aCf2vJYEevuritdxSgPq
         D+UtrfwFz8rMFna3+l6s20mvkCTU7g/6arWagwJOqbN1LsUNE+HZhLtC2eGzoUHEmwlt
         OQ5RZBrDH4mooX24mkBCWg0Kf9VwguEqmVaD5Yx7JxII9EyYmhWdDTW1ikBDduXOD50g
         1TAE+ENbYUfVUrY8NSt9ZI686kXpuULxiIzTee24YYXU3aEt/EQV9b0fTbCrP3A6pnxU
         jIVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745493255; x=1746098055;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D4mU1T1rDk6z4pxFiDA5HYk4vYtaLPU9FhiecEK1MtY=;
        b=QqtJJGoxGd//cTFaXdiUv2rQE0HY6fgIbBIz9o/YfkwNcTYBc6bqVAogWZQNkqYuS0
         s2MmP7y4tiPZbtFdl1frdB8N1pP7Inre9CGQglVDD897oaKVfEm/c9oeY37tY4q++Els
         4syEt7b5+R7RTp2jxt1k6AoGTgtgDBZmRazPNUmMYfGzuqRVb4rikgr51E9oGsJc/O6H
         +pJd+MGksAIvaf3AWPpz8jS8Kx4VYZ5Cnux2yh4M1nT16FFtkc5LxuRSfYPyJnwd7XiZ
         4vBF86NAJB8y9BpvJMrMYwoiubG2gTJCYpmmQoTQyNC0+3YkoEU8ZvsDP/KmLtOQKlMV
         lCBg==
X-Forwarded-Encrypted: i=1; AJvYcCUKsLCifB59aL4Mzlq+bkQ9BOxEH5+wvTq72M1Q6EHoT8aSrUjiNJDUdxiivIb8qeYH6hTXMX40ilU=@lists.infradead.org
X-Gm-Message-State: AOJu0YwZ2n5bL1HYWRY3MStnKWs0n/JE3r10pS+cT3qwdf9cMXB1adhH
	N9RZvbZRbSUj8LhtvnpJP+osnpwW+GGMlsB330HPcBuzRKefXV8dlcMf9Fuwo+Sv9JG2HKC4Z4W
	FTAA=
X-Gm-Gg: ASbGnctnz71MKMVLwhuccGKlrLgttNh/EyO09dz7f0DYZZjI1gZYMKqqdPkioYe6kdf
	7EGuA/l84sjlVolIXuwCXt7xRG3HYjquqQE+DngqBv/ARc1dQkiGT70M6NQd5t7/nCZTHOqTeXe
	B5OTSeHECzovS3cA7WCjUB29/d3SHv5bb1bfcERIktEMVYyhqA5cjyO/AjszciezOi97yWDjTmP
	GirdxDde7j2vl9Xfo2JMefu2mHukqb84y358K07Km34petDB5JRPV4vGB52GQFPHpHw3YjYj184
	OHRAhjokQGsKGFX8iClo9D07RhIL
X-Google-Smtp-Source: AGHT+IHbSyOOi5/yit6BfiuuY0FmW2s/FlFU8x3sL1VvFlP3l8fAUyFn4SseT8fosFzbmlvobKvRQA==
X-Received: by 2002:a05:6000:438a:b0:39e:e3fa:a66b with SMTP id ffacd0b85a97d-3a06cf6bc1cmr1687080f8f.34.1745493255239;
        Thu, 24 Apr 2025 04:14:15 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::f716])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2b87b1sm17134325e9.28.2025.04.24.04.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 04:14:14 -0700 (PDT)
Date: Thu, 24 Apr 2025 13:14:14 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH v5 05/13] riscv: misaligned: request misaligned exception
 from SBI
Message-ID: <20250424-763a7a1d90537ecee5bfa717@orel>
References: <20250417122337.547969-1-cleger@rivosinc.com>
 <20250417122337.547969-6-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250417122337.547969-6-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_121417_110522_1DA60BE1 
X-CRM114-Status: GOOD (  26.06  )
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

On Thu, Apr 17, 2025 at 02:19:52PM +0200, Cl=E9ment L=E9ger wrote:
> Now that the kernel can handle misaligned accesses in S-mode, request
> misaligned access exception delegation from SBI. This uses the FWFT SBI
> extension defined in SBI version 3.0.
> =

> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/include/asm/cpufeature.h        |  3 +-
>  arch/riscv/kernel/traps_misaligned.c       | 71 +++++++++++++++++++++-
>  arch/riscv/kernel/unaligned_access_speed.c |  8 ++-
>  3 files changed, 77 insertions(+), 5 deletions(-)
> =

> diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm=
/cpufeature.h
> index f56b409361fb..dbe5970d4fe6 100644
> --- a/arch/riscv/include/asm/cpufeature.h
> +++ b/arch/riscv/include/asm/cpufeature.h
> @@ -67,8 +67,9 @@ void __init riscv_user_isa_enable(void);
>  	_RISCV_ISA_EXT_DATA(_name, _id, _sub_exts, ARRAY_SIZE(_sub_exts), _vali=
date)
>  =

>  bool __init check_unaligned_access_emulated_all_cpus(void);
> +void unaligned_access_init(void);
> +int cpu_online_unaligned_access_init(unsigned int cpu);
>  #if defined(CONFIG_RISCV_SCALAR_MISALIGNED)
> -void check_unaligned_access_emulated(struct work_struct *work __always_u=
nused);
>  void unaligned_emulation_finish(void);
>  bool unaligned_ctl_available(void);
>  DECLARE_PER_CPU(long, misaligned_access_speed);
> diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/tra=
ps_misaligned.c
> index 97c674d7d34f..058a69c30181 100644
> --- a/arch/riscv/kernel/traps_misaligned.c
> +++ b/arch/riscv/kernel/traps_misaligned.c
> @@ -16,6 +16,7 @@
>  #include <asm/entry-common.h>
>  #include <asm/hwprobe.h>
>  #include <asm/cpufeature.h>
> +#include <asm/sbi.h>
>  #include <asm/vector.h>
>  =

>  #define INSN_MATCH_LB			0x3
> @@ -629,7 +630,7 @@ bool __init check_vector_unaligned_access_emulated_al=
l_cpus(void)
>  =

>  static bool unaligned_ctl __read_mostly;
>  =

> -void check_unaligned_access_emulated(struct work_struct *work __always_u=
nused)
> +static void check_unaligned_access_emulated(struct work_struct *work __a=
lways_unused)
>  {
>  	int cpu =3D smp_processor_id();
>  	long *mas_ptr =3D per_cpu_ptr(&misaligned_access_speed, cpu);
> @@ -640,6 +641,13 @@ void check_unaligned_access_emulated(struct work_str=
uct *work __always_unused)
>  	__asm__ __volatile__ (
>  		"       "REG_L" %[tmp], 1(%[ptr])\n"
>  		: [tmp] "=3Dr" (tmp_val) : [ptr] "r" (&tmp_var) : "memory");
> +}
> +
> +static int cpu_online_check_unaligned_access_emulated(unsigned int cpu)
> +{
> +	long *mas_ptr =3D per_cpu_ptr(&misaligned_access_speed, cpu);
> +
> +	check_unaligned_access_emulated(NULL);
>  =

>  	/*
>  	 * If unaligned_ctl is already set, this means that we detected that all
> @@ -648,9 +656,10 @@ void check_unaligned_access_emulated(struct work_str=
uct *work __always_unused)
>  	 */
>  	if (unlikely(unaligned_ctl && (*mas_ptr !=3D RISCV_HWPROBE_MISALIGNED_S=
CALAR_EMULATED))) {
>  		pr_crit("CPU misaligned accesses non homogeneous (expected all emulate=
d)\n");
> -		while (true)
> -			cpu_relax();
> +		return -EINVAL;
>  	}
> +
> +	return 0;
>  }
>  =

>  bool __init check_unaligned_access_emulated_all_cpus(void)
> @@ -682,4 +691,60 @@ bool __init check_unaligned_access_emulated_all_cpus=
(void)
>  {
>  	return false;
>  }
> +static int cpu_online_check_unaligned_access_emulated(unsigned int cpu)
> +{
> +	return 0;
> +}
> +#endif
> +
> +#ifdef CONFIG_RISCV_SBI
> +
> +static bool misaligned_traps_delegated;
> +
> +static int cpu_online_sbi_unaligned_setup(unsigned int cpu)
> +{
> +	if (sbi_fwft_set(SBI_FWFT_MISALIGNED_EXC_DELEG, 1, 0) &&
> +	    misaligned_traps_delegated) {
> +		pr_crit("Misaligned trap delegation non homogeneous (expected delegate=
d)");
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +void unaligned_access_init(void)

__init

> +{
> +	int ret;
> +
> +	ret =3D sbi_fwft_local_set(SBI_FWFT_MISALIGNED_EXC_DELEG, 1, 0);
> +	if (ret)
> +		return;
> +
> +	misaligned_traps_delegated =3D true;
> +	pr_info("SBI misaligned access exception delegation ok\n");
> +	/*
> +	 * Note that we don't have to take any specific action here, if
> +	 * the delegation is successful, then
> +	 * check_unaligned_access_emulated() will verify that indeed the
> +	 * platform traps on misaligned accesses.
> +	 */
> +}
> +#else
> +void unaligned_access_init(void) {}

__init

> +
> +static int cpu_online_sbi_unaligned_setup(unsigned int cpu __always_unus=
ed)
> +{
> +	return 0;
> +}
>  #endif
> +
> +int cpu_online_unaligned_access_init(unsigned int cpu)
> +{
> +	int ret;
> +
> +	ret =3D cpu_online_sbi_unaligned_setup(cpu);
> +	if (ret)
> +		return ret;
> +
> +	return cpu_online_check_unaligned_access_emulated(cpu);
> +}
> diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kern=
el/unaligned_access_speed.c
> index 585d2dcf2dab..a64d51a8da47 100644
> --- a/arch/riscv/kernel/unaligned_access_speed.c
> +++ b/arch/riscv/kernel/unaligned_access_speed.c
> @@ -236,6 +236,11 @@ arch_initcall_sync(lock_and_set_unaligned_access_sta=
tic_branch);
>  =

>  static int riscv_online_cpu(unsigned int cpu)
>  {
> +	int ret =3D cpu_online_unaligned_access_init(cpu);
> +
> +	if (ret)
> +		return ret;
> +
>  	/* We are already set since the last check */
>  	if (per_cpu(misaligned_access_speed, cpu) !=3D RISCV_HWPROBE_MISALIGNED=
_SCALAR_UNKNOWN) {
>  		goto exit;
> @@ -248,7 +253,6 @@ static int riscv_online_cpu(unsigned int cpu)
>  	{
>  		static struct page *buf;
>  =

> -		check_unaligned_access_emulated(NULL);
>  		buf =3D alloc_pages(GFP_KERNEL, MISALIGNED_BUFFER_ORDER);
>  		if (!buf) {
>  			pr_warn("Allocation failure, not measuring misaligned performance\n");
> @@ -439,6 +443,8 @@ static int __init check_unaligned_access_all_cpus(voi=
d)
>  {
>  	int cpu;
>  =

> +	unaligned_access_init();
> +
>  	if (unaligned_scalar_speed_param =3D=3D RISCV_HWPROBE_MISALIGNED_SCALAR=
_UNKNOWN &&
>  	    !check_unaligned_access_emulated_all_cpus()) {
>  		check_unaligned_access_speed_all_cpus();
> -- =

> 2.49.0
>

Thanks,
drew

-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
