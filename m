Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A378C369AB
	for <kvm-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 13:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AvgjMaOBvRTasdmAWQd3xxSIVy9FBWN232YAmjALrhw=; b=lPdzxcrW0gWLF8
	MHne1Cwb188XugFjxkdT0+91O2QbEOR06A7WGq/kbbyb26GUTVXtqbOghb5L7YtMP6F8PWwowLPWB
	iYAYdHXGdn7pwZr//aiJ4gsFegdPX994veWrsD+C39qTqHCvdDfs5RCtjfTQpedqlMfWHXbe3JHck
	2p8l4OHMMLzA0ajXQQngJNFoILAWzEu3c0eSsfEH6ii20LOpxrl/3fJMxTEppr4a3senztaRKZ00m
	WpU+qCfOlXdjqusHx5L6CQioM3Choj3kv3WDVKt915pY/rE8OQo27CEHHj4KDt1f8nTZlhK0sjDlt
	PyL8o0lOPXLm8hwrSM1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7wxn-0000000EFr8-349i;
	Thu, 24 Apr 2025 13:50:03 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7w99-0000000E730-0PpZ
	for kvm-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 12:57:45 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3914bc3e01aso604967f8f.2
        for <kvm-riscv@lists.infradead.org>; Thu, 24 Apr 2025 05:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745499461; x=1746104261; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oPQSBVtSMsvYsAl+gZRdiR2fvyhUD5u3wJ4ZqhPNu8A=;
        b=Ppf+BWCDbwCltei5tLeZlJEtKcWqDaFbb17B8VdIqkGO6XzdmKtgXSNQqOtDrXTObJ
         XpPKZs5ZQD1Z6NhbbFjogMhPIXHm5dCPB/hJbaHOCK53CuJmbSTJAa9apMmEfLea9PpF
         75apwmRavbZAEOH3ngI0jYLc8glJjhuyD4IRoGIPVJrtIt19K978fV6coSCxCK/h0PIo
         U4191qW+3iUewNQABE3RuqKzdsLHSBqtg+RMJXe78Qzi3qRiJdkLOeADXF0IljnmFhV2
         ZJkCvBlcire9BPosSDQ/fXcS6XKEWwmq44NuCw7qBhjrW718Sg+gNpPzK4mSYbXBI6OD
         3q5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745499461; x=1746104261;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oPQSBVtSMsvYsAl+gZRdiR2fvyhUD5u3wJ4ZqhPNu8A=;
        b=pBA9JQjYtD55l+bBFewFxFfcy6AcJjqcwt3WxrsYwCZfRkR/oZD1j685Q0r4N7MLLJ
         aeZyx5/rWmUQooBdGLqydqTZ5h/K/jyZyT0V4GuQC1lXygE3Pj57vDiYEPneCPHMTbQH
         H/n7McJjY8Ug8k41uEx91pVIvb/eC2QDCjidUL0K2t8gZrb41SIo/tCpnMtrq1XMQB91
         OetHneRiY+jtsqM8JTpe8b4CCNonKh1iH3EsTRelynzw+diqt2ZzZErgKpvAUGzKoeXe
         c7h3sL37mxsIwbIJffylwp6ogkUdNmbE9mqRaNP/v3pnkKicPvOcup95W/69zapvgukQ
         Jczg==
X-Forwarded-Encrypted: i=1; AJvYcCU4HwYNVkzOMFOREq9F/4nYjMILoR1zr30Mxll2TO7u4/BnbDpZFx+tnYC8vqORr9xsYztLzGKhD9M=@lists.infradead.org
X-Gm-Message-State: AOJu0YyrzpOC1cwYCjfA5xron1sPoIdvCxukzcPgvdu4fKSlIgP/Brwt
	NgGuA5Y1GjC+zQD8k3EcmusXz1vZk64l6kcS4x8VQkJ3hF36X4R1HdlsRiM1skg=
X-Gm-Gg: ASbGncu/t7T+hzAqhWIcCZnpS1ck8eOPhY1TjceJYrZ43NHXj4qFkaNuzEHArhapkYJ
	NpDBO4vb//leO6yFm0OqBmIV6Ht0vKfalee4H9t1j7nicjJC67+ofTU8sv9ZjExIxL5F9l0UFcZ
	ebpJ5IDWgjnZJTIk0jpqvNIL5SuruB4NRGQXMwLZt9LLm9PPpzs9h6vqUHrLZkFpJpk6hdldArA
	9n5PGDxmfr4tHMbJJ1/xaTU1V6a4ZYPJWhF2UvCqvxpd6/WQahF7L3cZEGa9uy1jYjQTVRNta3d
	ZzLLA3dqVOehjAAWZcu9+gkVejGQ
X-Google-Smtp-Source: AGHT+IGWv3/WPoD+1AaHzmJVHKE9pYWAl7MImqfR1l23ycVK/8svQHojX4uoV4n0a06YqpUIKi6wnQ==
X-Received: by 2002:a05:6000:1e48:b0:391:3cb7:d441 with SMTP id ffacd0b85a97d-3a06cf5f657mr1695750f8f.25.1745499461227;
        Thu, 24 Apr 2025 05:57:41 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::f716])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d54f019sm2068909f8f.96.2025.04.24.05.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 05:57:40 -0700 (PDT)
Date: Thu, 24 Apr 2025 14:57:39 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH v5 03/13] riscv: sbi: add FWFT extension interface
Message-ID: <20250424-dc96e54988e25abfc2bb9cf8@orel>
References: <20250417122337.547969-1-cleger@rivosinc.com>
 <20250417122337.547969-4-cleger@rivosinc.com>
 <20250424-c85c9d2f189fe4470038b519@orel>
 <67e81f13-5e5e-4630-9a3f-73856b952e6e@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <67e81f13-5e5e-4630-9a3f-73856b952e6e@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_055743_144772_8D108196 
X-CRM114-Status: GOOD (  20.12  )
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

On Thu, Apr 24, 2025 at 02:32:01PM +0200, Cl=E9ment L=E9ger wrote:
> =

> =

> On 24/04/2025 13:00, Andrew Jones wrote:
> > On Thu, Apr 17, 2025 at 02:19:50PM +0200, Cl=E9ment L=E9ger wrote:
> >> This SBI extensions enables supervisor mode to control feature that are
> >> under M-mode control (For instance, Svadu menvcfg ADUE bit, Ssdbltrp
> >> DTE, etc). Add an interface to set local features for a specific cpu
> >> mask as well as for the online cpu mask.
> >>
> >> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> >> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> >> ---
> >>  arch/riscv/include/asm/sbi.h | 17 +++++++++++
> >>  arch/riscv/kernel/sbi.c      | 57 ++++++++++++++++++++++++++++++++++++
> >>  2 files changed, 74 insertions(+)
> >>
> >> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi=
.h
> >> index 7ec249fea880..c8eab315c80e 100644
> >> --- a/arch/riscv/include/asm/sbi.h
> >> +++ b/arch/riscv/include/asm/sbi.h
> >> @@ -503,6 +503,23 @@ int sbi_remote_hfence_vvma_asid(const struct cpum=
ask *cpu_mask,
> >>  				unsigned long asid);
> >>  long sbi_probe_extension(int ext);
> >>  =

> >> +int sbi_fwft_set(u32 feature, unsigned long value, unsigned long flag=
s);
> >> +int sbi_fwft_local_set_cpumask(const cpumask_t *mask, u32 feature,
> >> +			       unsigned long value, unsigned long flags);
> > =

> > I'm confused by the naming that includes 'local' and 'cpumask' together
> > and...
> > =

> >> +/**
> >> + * sbi_fwft_local_set() - Set a feature on all online cpus
> >> + * @feature: The feature to be set
> >> + * @value: The feature value to be set
> >> + * @flags: FWFT feature set flags
> >> + *
> >> + * Return: 0 on success, appropriate linux error code otherwise.
> >> + */
> >> +static inline int sbi_fwft_local_set(u32 feature, unsigned long value,
> >> +				     unsigned long flags)
> >> +{
> >> +	return sbi_fwft_local_set_cpumask(cpu_online_mask, feature, value, f=
lags);
> > =

> > ...that something named with just 'local' is applied to all online cpus.
> > I've always considered 'local' functions to only affect the calling cpu.
> =

> Yeah I thought of that as well, local here refers to the fact that this
> function applies for a local feature (as described in the SBI
> documentation) but agreed that it's really missleading. Any idea for a
> better naming ?

I'd drop 'local' from these names and when we deal with global features we
can add 'global' to their function names. If we really must have something
now, then maybe 'per_cpu' instead of 'local'.

Thanks,
drew

-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
