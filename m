Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66712C54ED1
	for <kvm-riscv@archiver.kernel.org>; Fri, 23 May 2025 18:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JPG73la/nBDHusicwDDMTmhcOPYqZpEI0lUFdJKHtkk=; b=bUp0EDsGfodHmo
	GF1PKuFwgix5LWieMGRWP6CixhjsyrhLdWLt0NkSvRNPcH997xagOLrCWh37ObSMDDLuFDgbM1ajU
	0U9Lm43IZPBa+5RYaLrf6UQ26+z4rgwzGOjPxxianR99vrluxLGOK+ywhH4760K5/li1mNq2Z9H1e
	UdXMbWfBkshShEktOYmxjyiInQ95SHGt9DY5AgsMOxyGIyUJ1k/AK1gOc2uY3jDvIr5Kjgau32HiS
	lUGy2izav7ui1HNhvuss6vWJyQFJoFjYME4/HnAZ2OqoL7HIqNgj4+M2ROJPkd86zt1vA+2KvTz1G
	INodY4vyAcMoDBGGoj7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIXGj-00000004huN-0gDg;
	Fri, 23 May 2025 18:37:21 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIXGg-00000004ht7-0GsS
	for kvm-riscv@lists.infradead.org;
	Fri, 23 May 2025 18:37:19 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-742c27df0daso281889b3a.1
        for <kvm-riscv@lists.infradead.org>; Fri, 23 May 2025 11:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1748025437; x=1748630237; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+jN5GB4ngQwEolzoVEKYGux1P77VDkeV8jyjKjQj7pI=;
        b=QLmTBOo9XAXP0/vz0KeI3ZtLQeniA1V0lPUBPVIQqv3ZAoKmZFoaoHDtxvC90zq7QA
         tPZ4qg5P1rGTZYQ3Wdf93iZZPXmUgOT2tKKNRQD6X+3DAoYWjiHiWarEV/eA3GIW0+OD
         vzZR73RwFRKlqEQlk76KX4ERdFi/wlDA0zp7wt1LmUg//MWJ+WYYJxaGzI1K1rpqPLMe
         2PvesQ35vmzm5bHXGAE9qUfSbEl5h96EhaNcqaxz4oH0Bup6o73je5L2FbqaM4OV8Ptf
         gITR47/6DJaYfGWMTQUDyTPKF9Z5ozIP6nobpbMnYs0rYgoJt8+IVVsiNu73pjTr/493
         YkMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748025437; x=1748630237;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+jN5GB4ngQwEolzoVEKYGux1P77VDkeV8jyjKjQj7pI=;
        b=TS8ymkozsrXnZhEwULAb7R24zIEJmQKKgvJfhfAAhAZkZ8L8dgsDD3+ZvmsSbmyjtx
         8zWOeHoZ0JsLBgATAkJ+VeAlLyQBX4HIVeAuzAVI/Lz1AlvqWJLO1w4bcbCMIStmA1J5
         sOyoSN1uKN8L9Z8XwWtnLVm2skbmyhl9PqkN1hrgaeqfKEr8aOM5XcGKukXJx1MXCQ6h
         aY2XiAG2hqBrJWCgxI+d9dhceIhqpFylr0tnsUuXkt7UO0KbtEo2dMc+/h345WP2vz8v
         n4w3VcFu9uWj0U0PuI/edpW6BLcC662I+5zyt1h35HLcmzbWfb9mR2GN1uYCfY9surPe
         A7xQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCLU+9sx/64/av0297GjdlGT1gZuH1OuXB7HojgX+2lazY26uzyWIHGrfdHjKPV4nEZHv5C4Ytvqk=@lists.infradead.org
X-Gm-Message-State: AOJu0YyKgKAiU+jG9GuZFlpNOWgxTta55lqTeaA9wroYB5f0QfF/Gu2W
	EIgSmujg8VW3Kyju09r007vmXpWTv1GUcGq2o3lhw9enzdt83gW+AL375u7YttEMmBI=
X-Gm-Gg: ASbGncuhVIflWeD0rd7BkgdtI2bjswGQ4i1P6qGxY1P10L/nbEvCwWXoWBUvKn5YyWF
	so9Nzx8En8bbdxf5/WJQPIF3gkx30JfKrSZljyLimLNxk4DnnN626qSr90rjUBbJCuZqRwGTAeg
	5nYO4Cxxx2MbaKJCmNZA0PqVbIbjFnDKoM1r6HOJK2+Xkw6KrLM/adbqsn5Ow30hujaCUPJa4ND
	gQ/Qf3evzGvHGPeEYqnmtK98u29LqsYswAyulXSE+jel7EXdqZjA9FlwzEDrdZSjIRSy2xSyw9J
	TFCOYX79HCV5PXJ4l6Cj3gMYbtEFlENyUfq/QkVfZXm6ltw=
X-Google-Smtp-Source: AGHT+IG8tomY7/3cAclRkVBgo4GdCG/oz04LT8S0Un+srTCw4pvpQpH3EIf/46AHjipa24+aocSy/g==
X-Received: by 2002:a17:902:fc44:b0:22c:35c5:e30e with SMTP id d9443c01a7336-23414f69078mr5977735ad.13.1748025437265;
        Fri, 23 May 2025 11:37:17 -0700 (PDT)
Received: from ghost ([2601:647:6700:64d0:bb2c:c7d9:9014:13ab])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e9736esm127127745ad.149.2025.05.23.11.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 11:37:16 -0700 (PDT)
Date: Fri, 23 May 2025 11:37:14 -0700
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
Subject: Re: [PATCH v8 07/14] riscv: misaligned: use on_each_cpu() for scalar
 misaligned access probing
Message-ID: <aDDAWmNlr_mzrdLm@ghost>
References: <20250523101932.1594077-1-cleger@rivosinc.com>
 <20250523101932.1594077-8-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250523101932.1594077-8-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_113718_107265_1842020F 
X-CRM114-Status: GOOD (  18.73  )
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

On Fri, May 23, 2025 at 12:19:24PM +0200, Cl=E9ment L=E9ger wrote:
> schedule_on_each_cpu() was used without any good reason while documented
> as very slow. This call was in the boot path, so better use
> on_each_cpu() for scalar misaligned checking. Vector misaligned check
> still needs to use schedule_on_each_cpu() since it requires irqs to be
> enabled but that's less of a problem since this code is ran in a kthread.
> Add a comment to explicit that.
> =

> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
Tested-by: Charlie Jenkins <charlie@rivosinc.com>

> ---
>  arch/riscv/kernel/traps_misaligned.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> =

> diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/tra=
ps_misaligned.c
> index 592b1a28e897..34b4a4e9dfca 100644
> --- a/arch/riscv/kernel/traps_misaligned.c
> +++ b/arch/riscv/kernel/traps_misaligned.c
> @@ -627,6 +627,10 @@ bool __init check_vector_unaligned_access_emulated_a=
ll_cpus(void)
>  {
>  	int cpu;
>  =

> +	/*
> +	 * While being documented as very slow, schedule_on_each_cpu() is used =
since
> +	 * kernel_vector_begin() expects irqs to be enabled or it will panic()
> +	 */
>  	schedule_on_each_cpu(check_vector_unaligned_access_emulated);
>  =

>  	for_each_online_cpu(cpu)
> @@ -647,7 +651,7 @@ bool __init check_vector_unaligned_access_emulated_al=
l_cpus(void)
>  =

>  static bool unaligned_ctl __read_mostly;
>  =

> -static void check_unaligned_access_emulated(struct work_struct *work __a=
lways_unused)
> +static void check_unaligned_access_emulated(void *arg __always_unused)
>  {
>  	int cpu =3D smp_processor_id();
>  	long *mas_ptr =3D per_cpu_ptr(&misaligned_access_speed, cpu);
> @@ -688,7 +692,7 @@ bool __init check_unaligned_access_emulated_all_cpus(=
void)
>  	 * accesses emulated since tasks requesting such control can run on any
>  	 * CPU.
>  	 */
> -	schedule_on_each_cpu(check_unaligned_access_emulated);
> +	on_each_cpu(check_unaligned_access_emulated, NULL, 1);
>  =

>  	for_each_online_cpu(cpu)
>  		if (per_cpu(misaligned_access_speed, cpu)
> -- =

> 2.49.0
> =


-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
