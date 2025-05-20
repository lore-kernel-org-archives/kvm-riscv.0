Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EAE6C3ABDD
	for <kvm-riscv@archiver.kernel.org>; Tue, 20 May 2025 17:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G4BpxkuT88+zmuE+dvpeZZ57joIbvPqfL6Wwy6+9WNg=; b=hgWdeDSlELaFov
	CGUQYlnSSrLBBfHsUet65nRdE6TVFIM0KDCRMKgWWIoMJcr2oFtHjMoHo/tMeX43vk2KpAzC7R98/
	Pwv4Bhaos9JDxAS3frQwhjHEFqV9ona0S6edhoXg5mBLMAn4HqqBArHLKaW/4OOSbnHtjXtNGUYwC
	9ILLxAU+1Vt0/FPCssXUkY4DZM0xQdMc5f3Qk6avqcG7P+eYcV0NdbszytwAqlk3Yor2hsLV1Y0Gp
	bsm5zq0WkvLYCGZgpw5E84TjNHL1hb17m/aAVv8tHIqIOvVmTYwzwIYkn3e+I0FdbksGYc00ZjtDz
	zs2OFCfrLC7o5C3gWWyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHQU2-0000000DeNe-2grK;
	Tue, 20 May 2025 17:10:30 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHQRz-0000000DdwK-1ZY7
	for kvm-riscv@lists.infradead.org;
	Tue, 20 May 2025 17:08:24 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-742c9563fafso2579169b3a.0
        for <kvm-riscv@lists.infradead.org>; Tue, 20 May 2025 10:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747760902; x=1748365702; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DDjRFmO/FlIqGEtWUGUmfdfKllur189aWobDQoyjRQs=;
        b=YPcLxDXJYQwckavrHXEShc6253VEbwlRtz5hz5mIbZvuKWckpe7Ma+3RtSJVvulE0t
         g8tyUM2WYEhxy3LWK9woZAV3+NfVPOAw4uFOzJ2b9lRuu5hrPj2De6AejHCwpJXkF1zs
         Ui2BNjr+8m8KXlcAITGt9ARC1zlKJpWEIYwa3U5kJBr4TIr9u2DV/Q0sJF7bPOFB5/eP
         rXm7fdH5o97QRlQX1KF9FGlYOPjVAvw1kJR6d84Qm/y4n6AfiYOEgGvYNNzD1Bq2gNUv
         rciXkuC6F0M5u5xw/PXhb8GG09lPe1D7vSIVORuCMv7g94xUziV7dkPvd03nHtP/KdT0
         Z5NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747760902; x=1748365702;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DDjRFmO/FlIqGEtWUGUmfdfKllur189aWobDQoyjRQs=;
        b=tzWV2USSno5HwQFTnGSKB0bFB4aJ8lH1u/pV7MujI+YRs+s9/meMv64u0UPGBqZwD7
         R6I1pgRmJfDLo/Y8qFJT1BVEcCLnrxDX5aC5ZM+zOzVWgOl0UiF9iTi32QfdDSi4k8Qs
         BkOP13XdA59SAwngzqVwXMzq8ch+c72acSiDOo+osnz/V4QXfitjy3uzs68/lM4Z/Lnn
         i8RRWAoCMHCCcRM79AC8iO8sWwIhBHN/tYyoNYikw8HdCOpeCuy0+jxYDLI8AsasbF+Q
         d41Zk7fjWSjP2jqj1gFPV2ZVI2rL1LrOMRZTgXw8PBLo5t1DLF8aODX+Irl8USD3QJa+
         KkFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVreFv/pG7fckhqPD4bmRI4Rxu+Xqozmh1OyL79hlZuuremK6grXo2nrA5qT8b/q/eG2Ga+L/Tgz4s=@lists.infradead.org
X-Gm-Message-State: AOJu0YzBz3xKlzpKgoQjuY7tHOwXBxXUSr81PG4Wg5Xkl4LhmjBMDW+v
	eL3UeHkKEW8ZuzzxvTZy1I0xkDWu1vdNlDiqJrT/0jrrHicPWL8IRvOEWfxmCKsDvM8=
X-Gm-Gg: ASbGnctc6BCgCXz4ozfnPnolG75n9ZhuCpNSsKf9IUbhAInuw/U8VHLjdMwqo55AHCf
	u6muy+n6vDABkHOnnIocFYsj+lHO6VItrNkcyk4rgDY+pjz1ghoysLz9MEmSPKjAJ8V7DzsqxNr
	0WH62txc5zy8d1RFbdfCDRLsFeO//X7ZvBhLQvHEprBR3zS7EIypp9Pau7oCqfcSu+T7xE+aMYG
	enzbg+ln6h6L4Ii+H/FXigdU+a45YGPPrV5RLmZUKJc0WCN4/BsT8FhW01TQ2i3KvmnUJd4F/Eg
	LgG8uqmD1FIA2nNTklEgL2XW1YbelROiqewGwbCEwVH/LFM=
X-Google-Smtp-Source: AGHT+IHuT79L0+UrgKSwtY58fOb+r5axNp9Bh0rhvhNRM5zmWiTrh0ZXIgCZQR8QM+4Pdq9KGT4FDg==
X-Received: by 2002:a05:6a20:2d07:b0:1ee:a914:1d64 with SMTP id adf61e73a8af0-216219bd3a5mr27575586637.28.1747760902322;
        Tue, 20 May 2025 10:08:22 -0700 (PDT)
Received: from ghost ([2601:647:6700:64d0:17b4:8663:3229:f2dd])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf96573sm8189882a12.43.2025.05.20.10.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 10:08:21 -0700 (PDT)
Date: Tue, 20 May 2025 10:08:19 -0700
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
Message-ID: <aCy3A6uUbnWoO9uC@ghost>
References: <20250515082217.433227-1-cleger@rivosinc.com>
 <20250515082217.433227-10-cleger@rivosinc.com>
 <aCu_ce-kVQsyjrh5@ghost>
 <126762fc-17ca-4e9d-94d0-3aed1ae321ff@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <126762fc-17ca-4e9d-94d0-3aed1ae321ff@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_100823_426126_7C3AFE75 
X-CRM114-Status: GOOD (  36.36  )
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

On Tue, May 20, 2025 at 10:19:47AM +0200, Cl=E9ment L=E9ger wrote:
> =

> =

> On 20/05/2025 01:32, Charlie Jenkins wrote:
> > On Thu, May 15, 2025 at 10:22:10AM +0200, Cl=E9ment L=E9ger wrote:
> >> Split the code that check for the uniformity of misaligned accesses
> >> performance on all cpus from check_unaligned_access_emulated_all_cpus()
> >> to its own function which will be used for delegation check. No
> >> functional changes intended.
> >>
> >> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> >> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> >> ---
> >>  arch/riscv/kernel/traps_misaligned.c | 20 ++++++++++++++------
> >>  1 file changed, 14 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/=
traps_misaligned.c
> >> index e551ba17f557..287ec37021c8 100644
> >> --- a/arch/riscv/kernel/traps_misaligned.c
> >> +++ b/arch/riscv/kernel/traps_misaligned.c
> >> @@ -647,6 +647,18 @@ bool __init check_vector_unaligned_access_emulate=
d_all_cpus(void)
> >>  }
> >>  #endif
> >>  =

> >> +static bool all_cpus_unaligned_scalar_access_emulated(void)
> >> +{
> >> +	int cpu;
> >> +
> >> +	for_each_online_cpu(cpu)
> >> +		if (per_cpu(misaligned_access_speed, cpu) !=3D
> > =

> > misaligned_access_speed is only defined when
> > CONFIG_RISCV_SCALAR_MISALIGNED. This function should return false when
> > !CONFIG_RISCV_SCALAR_MISALIGNED and only use this logic otherwise.
> =

> Hi Charlie,
> =

> misaligned_access_speed is defined in unaligned_access_speed.c which is
> compiled based on CONFIG_RISCV_MISALIGNED (ditto for trap_misaligned.c)
> =

> obj-$(CONFIG_RISCV_MISALIGNED)	+=3D unaligned_access_speed.o
> =

> However, the declaration for it in the header cpu-feature.h however is
> under a CONFIG_RISCV_SCALAR_MISALIGNED ifdef. So either the declaration
> or the definition is wrong but the ifdefery soup makes it quite
> difficult to understand what's going on.
> =

> I would suggest to move the DECLARE_PER_CPU under
> CONFIG_RISCV_MISALIGNED so that it reduces ifdef in traps_misaligned as
> well.

Here is the patch I am using locally for testing purposes, but if there
is a way to reduce the number of ifdefs that is probably the better way to =
go:

From 18f9a056d3b597934c931abdf72fb6e775ccb714 Mon Sep 17 00:00:00 2001
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 19 May 2025 16:35:51 -0700
Subject: [PATCH] fixup! riscv: misaligned: move emulated access uniformity
 check in a function

---
 arch/riscv/kernel/traps_misaligned.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps=
_misaligned.c
index f3ab84bc4632..1449c6a4ac21 100644
--- a/arch/riscv/kernel/traps_misaligned.c
+++ b/arch/riscv/kernel/traps_misaligned.c
@@ -647,6 +647,10 @@ bool __init check_vector_unaligned_access_emulated_all=
_cpus(void)
 }
 #endif
 =

+#ifdef CONFIG_RISCV_SCALAR_MISALIGNED
+
+static bool unaligned_ctl __read_mostly;
+
 static bool all_cpus_unaligned_scalar_access_emulated(void)
 {
 	int cpu;
@@ -659,10 +663,6 @@ static bool all_cpus_unaligned_scalar_access_emulated(=
void)
 	return true;
 }
 =

-#ifdef CONFIG_RISCV_SCALAR_MISALIGNED
-
-static bool unaligned_ctl __read_mostly;
-
 static void check_unaligned_access_emulated(void *arg __always_unused)
 {
 	int cpu =3D smp_processor_id();
@@ -716,6 +716,10 @@ bool unaligned_ctl_available(void)
 	return unaligned_ctl;
 }
 #else
+static bool all_cpus_unaligned_scalar_access_emulated(void)
+{
+	return false;
+}
 bool __init check_unaligned_access_emulated_all_cpus(void)
 {
 	return false;
-- =

2.43.0


- Charlie

> =

> Thanks,
>
> Cl=E9ment
> =

> > =

> > - Charlie
> > =

> >> +		    RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED)
> >> +			return false;
> >> +
> >> +	return true;
> >> +}
> >> +
> >>  #ifdef CONFIG_RISCV_SCALAR_MISALIGNED
> >>  =

> >>  static bool unaligned_ctl __read_mostly;
> >> @@ -685,8 +697,6 @@ static int cpu_online_check_unaligned_access_emula=
ted(unsigned int cpu)
> >>  =

> >>  bool __init check_unaligned_access_emulated_all_cpus(void)
> >>  {
> >> -	int cpu;
> >> -
> >>  	/*
> >>  	 * We can only support PR_UNALIGN controls if all CPUs have misalign=
ed
> >>  	 * accesses emulated since tasks requesting such control can run on =
any
> >> @@ -694,10 +704,8 @@ bool __init check_unaligned_access_emulated_all_c=
pus(void)
> >>  	 */
> >>  	on_each_cpu(check_unaligned_access_emulated, NULL, 1);
> >>  =

> >> -	for_each_online_cpu(cpu)
> >> -		if (per_cpu(misaligned_access_speed, cpu)
> >> -		    !=3D RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED)
> >> -			return false;
> >> +	if (!all_cpus_unaligned_scalar_access_emulated())
> >> +		return false;
> >>  =

> >>  	unaligned_ctl =3D true;
> >>  	return true;
> >> -- =

> >> 2.49.0
> >>
> >>
> >> _______________________________________________
> >> linux-riscv mailing list
> >> linux-riscv@lists.infradead.org
> >> http://lists.infradead.org/mailman/listinfo/linux-riscv
> =


-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
