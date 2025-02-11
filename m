Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81BE7C0219E
	for <kvm-riscv@archiver.kernel.org>; Tue, 11 Feb 2025 04:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WyVS/MPrHUMoeEpjhEWldKMIaThu/PsI9g+cmtQDuNE=; b=zu121EAgaYNGeFy9ber45DHMHD
	GAkQ3rj7vjIPs0BjCo+OwZtcXtAh8KSDHWY7dpT6J5CBbws2Pmc6yoMSjqDf+2CAW87akxGA/qlHm
	RNKAKgHwFzMFwJFlJZQI1kYFiORCMoSHfExDjOJB3H/WiPWohYPdm0PRJ5tsZXF9YJbK8uylajqBl
	F6pqXnfRspCtVGLgDbgEeOQDwUcHcIm+4asxgRu8eMGMtPB4k9w6iR0LLzRDvHbQznv+YB8WXRyM7
	9cMcA3GGgiWydxnISUVDqp1W/aMBuxRwZ+3HtFWMKq7SLuDRGHRosAdaZkNtiT59Vs/6nL7c2fSyt
	iDh3HhJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thhXP-00000002Sl4-0AQi;
	Tue, 11 Feb 2025 04:06:19 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thhXM-00000002SkQ-2P9c
	for kvm-riscv@lists.infradead.org;
	Tue, 11 Feb 2025 04:06:17 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-21f6022c2c3so47442775ad.0
        for <kvm-riscv@lists.infradead.org>; Mon, 10 Feb 2025 20:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739246776; x=1739851576; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zyKn8f6FlNrtiJWD+T1fk3XzsKPAFPZ0BSNq2D6GOdI=;
        b=AlY8hkkb/DHn7tazsgeOwhbtXQfuJORJ/bPYO7Phg0HxraFnR3HGTccuDZBVBh/VIA
         dBvpEvDBZr/jvQaRQwO/50bcEHW/JOrwGlc1OIUK1k5oPVKi06qttqcDNji+KGNj9toi
         2CtLIirVBsOxJRGAXriGqCN/qdwy01N8ku3Wr4mUVcSkz+3KzJG0ALffX7lEVfK5zCk2
         rUcFGJgvxU8mnY6VumD8YHRAOGi4w54acRRDizGVCrTeYdf05Zl8n5KIoYyrkHMAGBab
         fsh2qRR7cl+cEYqq6FcA5dr9Vg1E1Vm97Hp7TAkw4WxYQhPSDM/2DIRBcq37D9kuPOc7
         oiIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739246776; x=1739851576;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zyKn8f6FlNrtiJWD+T1fk3XzsKPAFPZ0BSNq2D6GOdI=;
        b=tH8DV2u2IlUqv/luhIhi0EYXBsCGh3qrjaVuXmZ1gD9JmPLGkT+Cxvn6giFdBRrnle
         la7E2xDwSv54fk4NLp5KKGzB5rQe9UPyY7YSoy8Zd0TLl89ePFtY6e59+sxSfbd3j9LL
         YNnwr3MI1yL/G4NnlXxu101MgLPLyw9+0rB5rw1c8o1zCdzqMiNJhy/4dLKeadi4oGYf
         SUGOmR1apkTiPo3OVeBIvX1gc2JkD9WHr1UnkwH6DM4rA6BprOl31fWa8PrVpxw0uTSU
         evKCjmA51vgSKxXakLpXDhURSdjBCco1SzgFU5WtqIxaRMX/NVEBc2IsXIg8oWVmxbXi
         qKAg==
X-Forwarded-Encrypted: i=1; AJvYcCVxIGsQZybv6chwxlShjR6uQKWe4KiaTR+V8nZ2OnVNj1vuA1Mj/3BOBqKDtVJfWqQeiVmzvjx6EHM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzslh0bgD5fYRYv5+iXN62OBlyCKx52FkCGXngur4ih73NXfRs0
	1PEHqYB360MJ3txa+7Hn7NKCsR1p7fRduXB9DvV2gRt79koXWw8yV2otGNqR3vI=
X-Gm-Gg: ASbGncva4tcSAke8XmPPkpLJUVmD4rJjGtPcePOzr+aLcAgxZMKHyn/G44+m7TX/cje
	LI1KBNMmkskDKmDw9KU/xY6jVN8FYdEJweIrM1773ecLGm8RG1HG48mSnEuYCKkb0Tk5S2i1xAB
	LiZJOKtUrCBmMVjQVPz1McfYbypMxvD9QBxx5Iafi9NSDwfGXzngyMyVXnBJ3Xyj6LYCD7/Q3Gi
	99g6Ud1NfmpRWGDd9HWixy+RmR299wUWcRvXaOgaAdNymZWh+qvU1mzUV0Ipin2fhuUxnF8qhOT
	xw7vqHuuzATC1MaMmPzELRh9Tw==
X-Google-Smtp-Source: AGHT+IGlh9j8ErK64T4ScD+I1yhp+hSLhhu8tQ8C1OBgFV46tBgTiWjpNTOBq5c7bhEw0dyoInj7tg==
X-Received: by 2002:a05:6a20:1591:b0:1ed:a4b1:9124 with SMTP id adf61e73a8af0-1ee4b5bfde2mr2966111637.8.1739246775980;
        Mon, 10 Feb 2025 20:06:15 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73085c8360asm3653872b3a.132.2025.02.10.20.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 20:06:15 -0800 (PST)
Date: Mon, 10 Feb 2025 20:06:12 -0800
From: Deepak Gupta <debug@rivosinc.com>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH v2 01/15] riscv: add Firmware Feature (FWFT) SBI
 extensions definitions
Message-ID: <Z6rMtBud/hsKYYIw@debug.ba.rivosinc.com>
References: <20250210213549.1867704-1-cleger@rivosinc.com>
 <20250210213549.1867704-2-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250210213549.1867704-2-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_200616_613501_E8DC09F4 
X-CRM114-Status: UNSURE (   9.68  )
X-CRM114-Notice: Please train this message.
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Feb 10, 2025 at 10:35:34PM +0100, Cl=E9ment L=E9ger wrote:
>The Firmware Features extension (FWFT) was added as part of the SBI 3.0
>specification. Add SBI definitions to use this extension.
>
>Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
>Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
>Tested-by: Samuel Holland <samuel.holland@sifive.com>
>---
> arch/riscv/include/asm/sbi.h | 33 +++++++++++++++++++++++++++++++++
> 1 file changed, 33 insertions(+)
>
>diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
>index 3d250824178b..d373b5c08039 100644
>--- a/arch/riscv/include/asm/sbi.h
>+++ b/arch/riscv/include/asm/sbi.h
>@@ -35,6 +35,7 @@ enum sbi_ext_id {
> 	SBI_EXT_DBCN =3D 0x4442434E,
> 	SBI_EXT_STA =3D 0x535441,
> 	SBI_EXT_NACL =3D 0x4E41434C,
>+	SBI_EXT_FWFT =3D 0x46574654,
>
> 	/* Experimentals extensions must lie within this range */
> 	SBI_EXT_EXPERIMENTAL_START =3D 0x08000000,
>@@ -402,6 +403,33 @@ enum sbi_ext_nacl_feature {
> #define SBI_NACL_SHMEM_SRET_X(__i)		((__riscv_xlen / 8) * (__i))
> #define SBI_NACL_SHMEM_SRET_X_LAST		31
>
>+/* SBI function IDs for FW feature extension */
>+#define SBI_EXT_FWFT_SET		0x0
>+#define SBI_EXT_FWFT_GET		0x1
>+
>+enum sbi_fwft_feature_t {
>+	SBI_FWFT_MISALIGNED_EXC_DELEG		=3D 0x0,
>+	SBI_FWFT_LANDING_PAD			=3D 0x1,
>+	SBI_FWFT_SHADOW_STACK			=3D 0x2,
>+	SBI_FWFT_DOUBLE_TRAP			=3D 0x3,
>+	SBI_FWFT_PTE_AD_HW_UPDATING		=3D 0x4,
>+	SBI_FWFT_POINTER_MASKING_PMLEN		=3D 0x5,
>+	SBI_FWFT_LOCAL_RESERVED_START		=3D 0x6,
>+	SBI_FWFT_LOCAL_RESERVED_END		=3D 0x3fffffff,
>+	SBI_FWFT_LOCAL_PLATFORM_START		=3D 0x40000000,
>+	SBI_FWFT_LOCAL_PLATFORM_END		=3D 0x7fffffff,
>+
>+	SBI_FWFT_GLOBAL_RESERVED_START		=3D 0x80000000,
>+	SBI_FWFT_GLOBAL_RESERVED_END		=3D 0xbfffffff,
>+	SBI_FWFT_GLOBAL_PLATFORM_START		=3D 0xc0000000,
>+	SBI_FWFT_GLOBAL_PLATFORM_END		=3D 0xffffffff,
>+};
>+
>+#define SBI_FWFT_PLATFORM_FEATURE_BIT		(1 << 30)
>+#define SBI_FWFT_GLOBAL_FEATURE_BIT		(1 << 31)
>+
>+#define SBI_FWFT_SET_FLAG_LOCK			(1 << 0)
>+
> /* SBI spec version fields */
> #define SBI_SPEC_VERSION_DEFAULT	0x1
> #define SBI_SPEC_VERSION_MAJOR_SHIFT	24
>@@ -419,6 +447,11 @@ enum sbi_ext_nacl_feature {
> #define SBI_ERR_ALREADY_STARTED -7
> #define SBI_ERR_ALREADY_STOPPED -8
> #define SBI_ERR_NO_SHMEM	-9
>+#define SBI_ERR_INVALID_STATE	-10
>+#define SBI_ERR_BAD_RANGE	-11
>+#define SBI_ERR_TIMEOUT		-12

nit: Space mis-aligned(^)	^

otherwise
Reviewed-by: Deepak Gupta <debug@rivosinc.com>

>+#define SBI_ERR_IO		-13
>+#define SBI_ERR_DENIED_LOCKED	-14
>
> extern unsigned long sbi_spec_version;
> struct sbiret {
>-- =

>2.47.2
>
>

-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
