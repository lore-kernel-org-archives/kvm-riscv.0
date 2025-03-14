Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C90AC282EC
	for <kvm-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 12:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dpoGnqOR1k+LJR6KIFd1mlAcMxUTbedhpd1Rt+Ah1UY=; b=zNIIG4mDo1uRnI
	n69xo9jwTSl9bHnwXvNSOA+Eo4ttBywOcPUdbC5yDzfJZQbYYvYDqCnUIZaB7EkZll8902nqR1ehP
	n5XIlgxzsNxxD/q4Kt7vCAEDn3+J5+MpRBxVd+JuKmKwFvh4SpHHQ07NBBJtxZA1kSzjBDA652jrQ
	OdGErPRVw3w3tmlDuCZHrJnUnHOZche+0u7rXnwgln5uLFU1CO54VRt5sP6wWdklqsnXu22QqC6SI
	m0/26w16YjOqJ7EE38YI1DzmMqdNXEMmQrWbE5Ew+4bbfZTz0V1TjgHdU8Zq5A9Dtn24Jmc1ArKiO
	i+B2NuLUxl8itZBfDhYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt3ny-0000000E6XV-3r07;
	Fri, 14 Mar 2025 12:06:22 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt3k2-0000000E5mZ-17X5
	for kvm-riscv@lists.infradead.org;
	Fri, 14 Mar 2025 12:02:19 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3912e96c8e8so1313287f8f.2
        for <kvm-riscv@lists.infradead.org>; Fri, 14 Mar 2025 05:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1741953737; x=1742558537; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KiKvhRrb/Taq72fdOcKbw7HOX5fTF1yEq4aGHxD5ojg=;
        b=ZXRCxI9QfY417TIZGlq6Fvkmof5cRxIPpRJl1TdJgWZH9eEqZyfd764XKG2mwlhTpf
         srYQKJypUvn4rpZglM0/zFOTTT6s9ev8PtSxCAf8G4yoHvDFjbAL5+Y3QSB3q7X1P1LV
         AKqNQJAOsfNTUPBTRfpNjYGUAcjcZuLyBTK4Ou67KXda+i4yc6cl9sQ1RXRFr3bGGK1Q
         ITAjn8kRMF3LJ2BCgURy/2XHxkMas/NneowSDsYGf+kbdafqOiqaCGD64Hum7IiRalvP
         8/PSIS+21ezaTw8z3Uca+8h/5Vc0T0rs4YVJhehaF80X6B/2s3nU/vzxTxTh13hsoCyX
         HlAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741953737; x=1742558537;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KiKvhRrb/Taq72fdOcKbw7HOX5fTF1yEq4aGHxD5ojg=;
        b=dUm6O6b1j+GanO9PgPQSzBmRCsNmoNTykfKWFI4gtCXyqhDQgrj6isfBSLEkurXmys
         ulI14Y+Epbl/cHPiJgD96TOXDMTEqkx4YMqy44HByedtuauszMu+E1qWyfZZOG6v94Ik
         d/wZrtvGiAkLucm//SY3tLcYsxISnOx3+Q4KvrmhhktSc/JZSp+HW8ZVNbgBY0YvtzUD
         u3XriLkV0++byTh0OU0BcaPMfynnFVFsxryvujji/gkFk6O2q56+SOXRYggGxUibMv03
         vuz0crFoIKoBpvjWMJ+1/h5YzurzEhB9uQqz6sir5l+y4yXDm+rvaSqtZ2c7zilRa7nJ
         pxPw==
X-Forwarded-Encrypted: i=1; AJvYcCWUMKVemJZXdNQijwBDXG7NYycSPKkWq5GcamIPqYvYu4fpSRYlZPwCOKxjDHQA9YycaX5640R1OMY=@lists.infradead.org
X-Gm-Message-State: AOJu0YwM9noZgliv8EjeRhIKJTJtlNtIv/qqKgXNN+ihUUSDrzw4qMFb
	a79zvBYt4P4ynNDwgHG055PeIE9fYGpc/kuwF95qwkNmMEKDKxEyfsOVI9or5RU=
X-Gm-Gg: ASbGncurJ57jwPO89aNyOlPPbtFHENl4XL9ufRpvvbhE1uVLllOuVB3fLOoHM2xqBZl
	yhwu5qNwv6apQIIZYqaBhk4+mtrE/mlD9mZH6qdKjUxgh+M2wktI/tjZGeb/ENiwz2zr2DXPKRY
	yQm5yEVqe4WOtqqsgz/2WMR9PoS37udX9dztZXqraGMhWc0cPcoQMP7GNxG8aN0lIEKuiuy2fvq
	GjPqQd560NBRgxQN22RRk4ELx9zQY/lyTSDqW54pKzKSJEAcy2k/qF3uIdVwsMEUeHqVroEEHrX
	0xy2NlUpX1gsDqD+86od00SmIfS4IW7g
X-Google-Smtp-Source: AGHT+IGDT22UVNAcE40RgfSq2VmR6JimLpd4/ZEJSqqFul3nbrXtD+Up4CuV3WGzrZnYVB9JFFtoWA==
X-Received: by 2002:a05:6000:2ac:b0:390:e853:85bd with SMTP id ffacd0b85a97d-3971ffb22c0mr3063778f8f.48.1741953736471;
        Fri, 14 Mar 2025 05:02:16 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::59a5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cb7ec14bsm5302335f8f.100.2025.03.14.05.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 05:02:16 -0700 (PDT)
Date: Fri, 14 Mar 2025 13:02:15 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH v3 02/17] riscv: sbi: add FWFT extension interface
Message-ID: <20250314-10d8d58329aceac21e727ebe@orel>
References: <20250310151229.2365992-1-cleger@rivosinc.com>
 <20250310151229.2365992-3-cleger@rivosinc.com>
 <20250313-5c22df0c08337905367fa125@orel>
 <dad465de-e5da-4ebb-8395-ea9e181a6f57@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dad465de-e5da-4ebb-8395-ea9e181a6f57@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_050218_310154_EAA42DEC 
X-CRM114-Status: GOOD (  38.99  )
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

On Fri, Mar 14, 2025 at 12:33:55PM +0100, Cl=E9ment L=E9ger wrote:
> =

> =

> On 13/03/2025 13:39, Andrew Jones wrote:
> > On Mon, Mar 10, 2025 at 04:12:09PM +0100, Cl=E9ment L=E9ger wrote:
> >> This SBI extensions enables supervisor mode to control feature that are
> >> under M-mode control (For instance, Svadu menvcfg ADUE bit, Ssdbltrp
> >> DTE, etc).
> >>
> >> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> >> ---
> >>  arch/riscv/include/asm/sbi.h |  5 ++
> >>  arch/riscv/kernel/sbi.c      | 97 ++++++++++++++++++++++++++++++++++++
> >>  2 files changed, 102 insertions(+)
> >>
> >> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi=
.h
> >> index bb077d0c912f..fc87c609c11a 100644
> >> --- a/arch/riscv/include/asm/sbi.h
> >> +++ b/arch/riscv/include/asm/sbi.h
> >> @@ -503,6 +503,11 @@ int sbi_remote_hfence_vvma_asid(const struct cpum=
ask *cpu_mask,
> >>  				unsigned long asid);
> >>  long sbi_probe_extension(int ext);
> >>  =

> >> +int sbi_fwft_all_cpus_set(u32 feature, unsigned long value, unsigned =
long flags,
> >> +			  bool revert_on_failure);
> >> +int sbi_fwft_get(u32 feature, unsigned long *value);
> >> +int sbi_fwft_set(u32 feature, unsigned long value, unsigned long flag=
s);
> >> +
> >>  /* Check if current SBI specification version is 0.1 or not */
> >>  static inline int sbi_spec_is_0_1(void)
> >>  {
> >> diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
> >> index 1989b8cade1b..256910db1307 100644
> >> --- a/arch/riscv/kernel/sbi.c
> >> +++ b/arch/riscv/kernel/sbi.c
> >> @@ -299,6 +299,103 @@ static int __sbi_rfence_v02(int fid, const struc=
t cpumask *cpu_mask,
> >>  	return 0;
> >>  }
> >>  =

> >> +int sbi_fwft_get(u32 feature, unsigned long *value)
> >> +{
> >> +	return -EOPNOTSUPP;
> >> +}
> >> +
> >> +/**
> >> + * sbi_fwft_set() - Set a feature on all online cpus
> > =

> > copy+paste of description from sbi_fwft_all_cpus_set(). This function
> > only sets the feature on the calling hart.
> > =

> >> + * @feature: The feature to be set
> >> + * @value: The feature value to be set
> >> + * @flags: FWFT feature set flags
> >> + *
> >> + * Return: 0 on success, appropriate linux error code otherwise.
> >> + */
> >> +int sbi_fwft_set(u32 feature, unsigned long value, unsigned long flag=
s)
> >> +{
> >> +	return -EOPNOTSUPP;
> >> +}
> >> +
> >> +struct fwft_set_req {
> >> +	u32 feature;
> >> +	unsigned long value;
> >> +	unsigned long flags;
> >> +	cpumask_t mask;
> >> +};
> >> +
> >> +static void cpu_sbi_fwft_set(void *arg)
> >> +{
> >> +	struct fwft_set_req *req =3D arg;
> >> +
> >> +	if (sbi_fwft_set(req->feature, req->value, req->flags))
> >> +		cpumask_clear_cpu(smp_processor_id(), &req->mask);
> >> +}
> >> +
> >> +static int sbi_fwft_feature_local_set(u32 feature, unsigned long valu=
e,
> >> +				      unsigned long flags,
> >> +				      bool revert_on_fail)
> >> +{
> >> +	int ret;
> >> +	unsigned long prev_value;
> >> +	cpumask_t tmp;
> >> +	struct fwft_set_req req =3D {
> >> +		.feature =3D feature,
> >> +		.value =3D value,
> >> +		.flags =3D flags,
> >> +	};
> >> +
> >> +	cpumask_copy(&req.mask, cpu_online_mask);
> >> +
> >> +	/* We can not revert if features are locked */
> >> +	if (revert_on_fail && flags & SBI_FWFT_SET_FLAG_LOCK)
> > =

> > Should use () around the flags &. I thought checkpatch complained about
> > that?
> > =

> >> +		return -EINVAL;
> >> +
> >> +	/* Reset value is the same for all cpus, read it once. */
> > =

> > How do we know we're reading the reset value? sbi_fwft_all_cpus_set() m=
ay
> > be called multiple times on the same feature. And harts may have had
> > sbi_fwft_set() called on them independently. I think we should drop the
> > whole prev_value optimization.
> =

> That's actually used for revert_on_failure as well not only the
> optimization.

At least the comment should drop the word 'Reset' and if there's a chance
that not all harts having the same value then we should call get on all
of them. (We'll probably want SBI FWFT functions which operate on
hartmasks eventually.)

> =

> > =

> >> +	ret =3D sbi_fwft_get(feature, &prev_value);
> >> +	if (ret)
> >> +		return ret;
> >> +
> >> +	/* Feature might already be set to the value we want */
> >> +	if (prev_value =3D=3D value)
> >> +		return 0;
> >> +
> >> +	on_each_cpu_mask(&req.mask, cpu_sbi_fwft_set, &req, 1);
> >> +	if (cpumask_equal(&req.mask, cpu_online_mask))
> >> +		return 0;
> >> +
> >> +	pr_err("Failed to set feature %x for all online cpus, reverting\n",
> >> +	       feature);
> > =

> > nit: I'd let the above line stick out. We have 100 chars.
> > =

> >> +
> >> +	req.value =3D prev_value;
> >> +	cpumask_copy(&tmp, &req.mask);
> >> +	on_each_cpu_mask(&req.mask, cpu_sbi_fwft_set, &req, 1);
> >> +	if (cpumask_equal(&req.mask, &tmp))
> >> +		return 0;
> > =

> > I'm not sure we want the revert_on_fail support either. What happens wh=
en
> > the revert fails and we return -EINVAL below? Also returning zero when
> > revert succeeds means the caller won't know if we successfully set what
> > we wanted or just successfully reverted.
> =

> So that might actually be needed for features that needs to be enabled
> on all hart or not enabled at all. If we fail to enable all of them,
> them the hart will be in some non coherent state between the harts.
> The returned error code though is wrong and I'm not sure we would have a
> way to gracefully handle revertion failure (except maybe panicking ?).

How about offlining all harts which don't have the desired state, along
with complaining loudly to the boot log.

Thanks,
drew

-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
