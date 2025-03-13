Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10D38C282DE
	for <kvm-riscv@archiver.kernel.org>; Thu, 13 Mar 2025 12:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SPxT+KdkSFsKpqmnMJ0GYBFq/GUEwaBUfG27d/bTcy8=; b=RYeaqC66xHRPif
	3y9249lIQ6bIv5bXyzn6z3ara2N8tqsZONNDsQECcKrQfePugBT6E1PbeZlhLnd0H6gotNb+hjx9r
	GxWzUMdrYReXXnU/k3ym4szHOSPZleVEcmmyZOF01N4YUIS5Ge/ZkEl6h68o6CDJRQRpwSq5kKwh0
	jnoE/LEauDJ+TUCqXGKHDRw8V2zR2csd0yaryUmRI0gm2Xun+U515LlgZ6tmm063g8ZT90EJmgatt
	HMWGh3yaQIBEJ6YjPIxu6CmBq+CZBE1R5BkMTl6c1NSim1QexxIrEUCqrDoxa3NzraxcSb7tVpKtO
	TlnTWcHr8TOGHva0jqcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsi6Q-0000000BIgX-2ajj;
	Thu, 13 Mar 2025 12:55:58 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsi3b-0000000BIM8-0VUy
	for kvm-riscv@lists.infradead.org;
	Thu, 13 Mar 2025 12:53:04 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43d0618746bso5914575e9.2
        for <kvm-riscv@lists.infradead.org>; Thu, 13 Mar 2025 05:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1741870380; x=1742475180; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=whJ5WLOnqJqIdekbdowFNyLodSkqgwLzZprjEG6v7KA=;
        b=EWuENBj3o5dVKSEUokdSaXScK9rItYu+XIV1s9tDyH42Ca+BPcG9q7vSdyp9cgw2tT
         0oKgX2+1WmCgklpvRMO4vw2MNccfjzv7Wf4Emq2eQSCsv7kjWWTTtHtwL8HN4Rb87BoY
         VcI5dyKEZ7VTwP0uemDuF7Rpy4fKmapBgLadlBCILOexBhIQmy4QWrq1Gyfbo8sM/NhP
         cQC+wdJtzFFb31th6YoDLi050lcmZMrlwySeYGjJTda7lKvs0Sc7ZSjuvZsIjNFaW7LL
         PjbSVwBjLG2AWegw+ciut4k/Cs9XyYa9l7LY6lWxYICSqpkviy08eMSlrIuqaxQRk12J
         neBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741870380; x=1742475180;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=whJ5WLOnqJqIdekbdowFNyLodSkqgwLzZprjEG6v7KA=;
        b=OJyg9QRcCX1Izim4SY7sTce+ctDprqOTxuFJgxnhfsgY0bXq3G7G2Sae5QoZ7bOI9i
         UnSZ+X16I0k8cqzwWxnVvaqvgggRzFRfmzlCmtYnSFjUrpli+WijyKu8x4qUsz8JSobS
         wtrurEaY+dyIkdkaCEr7Cnex6gKJEQj++U/41IyGhvN7nHVYPCIUMLQWP65sf4/KAY09
         rhxfgo4zTrOrkthRbwJmFZFtC3zgLNM/wynzyijRsfLg1XkDrZaz9KFJO32BJe9037Si
         Tq+s3vYLdRxAGM9QxmZ8qObGPNwAI9hcHMsdFOkVY9RN9gDVtew1DgoFaGzCLEkLQXgY
         jEJg==
X-Forwarded-Encrypted: i=1; AJvYcCU7T4fFgD6SeNKx7bw4dPEseu8rbzXFDHCwoIoZrBKeajwCtg/JDBUH0UTcMpUm9QEbxhpEZQXJVVc=@lists.infradead.org
X-Gm-Message-State: AOJu0YwCOWQfXnHR5cNOGuXox5cl/+OCxG6/a27dvOcB8wHwFG58M0sl
	+vCJu3K6vVRarS7aEhLALoAwY2Dp0h2gtMlGhTRfhtZw46RI1NT3tEUSypqyPPs=
X-Gm-Gg: ASbGncsn+0GvyR08sesQVCV7AUxWk8QPVRCMXrLd9dl3Z0u1PZBpKmtwwWL19NpVa1M
	bYkLW5NHKz1KPPxofPqh+XLwgHvCzUIrN4nuYmpew47LAJSyvuexWPrnLjtXBKpwXcZ+AVbVRf0
	fVLJZoItK0wmwsB5ZxZy+08rinlMnRPSHy11ENdABekwhYYzLqn428OF3DvSyAzkhLk8mQ8omfL
	TiGcaHMs2YfXFVejgJtZEn5C3+tiXD/sWxXZ4FeL1T806kWqtKl3b3Ar3optO2TRCBoN+L1ZjKd
	nlijyCB4BZczicefwFGLgZhs7pU7JzkZ
X-Google-Smtp-Source: AGHT+IG41qlHvVlMBTz+EBNgOBL90SoyA5MRu9vVFfQYuH5YBZLTfvMhSZKO57zcnXjrEIFxRRHKsw==
X-Received: by 2002:a05:600c:3ba4:b0:43c:fabf:9146 with SMTP id 5b1f17b1804b1-43cfabf940emr138350995e9.17.1741870380371;
        Thu, 13 Mar 2025 05:53:00 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::59a5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d186e9639sm20720865e9.0.2025.03.13.05.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 05:52:59 -0700 (PDT)
Date: Thu, 13 Mar 2025 13:52:58 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH v3 04/17] riscv: misaligned: request misaligned exception
 from SBI
Message-ID: <20250313-28a56381a2c44ebeff100f91@orel>
References: <20250310151229.2365992-1-cleger@rivosinc.com>
 <20250310151229.2365992-5-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250310151229.2365992-5-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_055303_169431_203E4C8A 
X-CRM114-Status: GOOD (  25.66  )
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

On Mon, Mar 10, 2025 at 04:12:11PM +0100, Cl=E9ment L=E9ger wrote:
> Now that the kernel can handle misaligned accesses in S-mode, request
> misaligned access exception delegation from SBI. This uses the FWFT SBI
> extension defined in SBI version 3.0.
> =

> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> ---
>  arch/riscv/include/asm/cpufeature.h        |  3 +-
>  arch/riscv/kernel/traps_misaligned.c       | 77 +++++++++++++++++++++-
>  arch/riscv/kernel/unaligned_access_speed.c | 11 +++-
>  3 files changed, 86 insertions(+), 5 deletions(-)
> =

> diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm=
/cpufeature.h
> index 569140d6e639..ad7d26788e6a 100644
> --- a/arch/riscv/include/asm/cpufeature.h
> +++ b/arch/riscv/include/asm/cpufeature.h
> @@ -64,8 +64,9 @@ void __init riscv_user_isa_enable(void);
>  	_RISCV_ISA_EXT_DATA(_name, _id, _sub_exts, ARRAY_SIZE(_sub_exts), _vali=
date)
>  =

>  bool check_unaligned_access_emulated_all_cpus(void);
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
> index 7cc108aed74e..90ac74191357 100644
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
> @@ -635,7 +636,7 @@ bool check_vector_unaligned_access_emulated_all_cpus(=
void)
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
> @@ -646,6 +647,13 @@ void check_unaligned_access_emulated(struct work_str=
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
> @@ -654,9 +662,10 @@ void check_unaligned_access_emulated(struct work_str=
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

>  bool check_unaligned_access_emulated_all_cpus(void)
> @@ -688,4 +697,66 @@ bool check_unaligned_access_emulated_all_cpus(void)
>  {
>  	return false;
>  }
> +static int cpu_online_check_unaligned_access_emulated(unsigned int cpu)
> +{
> +	return 0;
> +}
>  #endif
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
> +static void unaligned_sbi_request_delegation(void)
> +{
> +	int ret;
> +
> +	ret =3D sbi_fwft_all_cpus_set(SBI_FWFT_MISALIGNED_EXC_DELEG, 1, 0, 0);
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
> +
> +void unaligned_access_init(void)
> +{
> +	if (sbi_probe_extension(SBI_EXT_FWFT) > 0)
> +		unaligned_sbi_request_delegation();
> +}
> +#else
> +void unaligned_access_init(void) {}
> +
> +static int cpu_online_sbi_unaligned_setup(unsigned int cpu __always_unus=
ed)
> +{
> +	return 0;
> +}
> +#endif
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
> index 91f189cf1611..2f3aba073297 100644
> --- a/arch/riscv/kernel/unaligned_access_speed.c
> +++ b/arch/riscv/kernel/unaligned_access_speed.c
> @@ -188,13 +188,20 @@ arch_initcall_sync(lock_and_set_unaligned_access_st=
atic_branch);
>  =

>  static int riscv_online_cpu(unsigned int cpu)
>  {
> +	int ret;
>  	static struct page *buf;
>  =

>  	/* We are already set since the last check */
>  	if (per_cpu(misaligned_access_speed, cpu) !=3D RISCV_HWPROBE_MISALIGNED=
_SCALAR_UNKNOWN)
>  		goto exit;
>  =

> -	check_unaligned_access_emulated(NULL);
> +	ret =3D cpu_online_unaligned_access_init(cpu);
> +	if (ret)
> +		return ret;
> +
> +	if (per_cpu(misaligned_access_speed, cpu) =3D=3D RISCV_HWPROBE_MISALIGN=
ED_SCALAR_EMULATED)
> +		goto exit;
> +
>  	buf =3D alloc_pages(GFP_KERNEL, MISALIGNED_BUFFER_ORDER);
>  	if (!buf) {
>  		pr_warn("Allocation failure, not measuring misaligned performance\n");
> @@ -403,6 +410,8 @@ static int check_unaligned_access_all_cpus(void)
>  {
>  	bool all_cpus_emulated, all_cpus_vec_unsupported;
>  =

> +	unaligned_access_init();
> +
>  	all_cpus_emulated =3D check_unaligned_access_emulated_all_cpus();
>  	all_cpus_vec_unsupported =3D check_vector_unaligned_access_emulated_all=
_cpus();
>  =

> -- =

> 2.47.2
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
