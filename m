Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B769AC3ABBF
	for <kvm-riscv@archiver.kernel.org>; Tue,  6 May 2025 10:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e9XyiG5QYOMM7JWkRTH51NDAyITG5um1V0uaG7tzYBk=; b=ZwJVonNy8k+x6O
	Yletm1Y3x2iw0VEpvY+cu/m8yrdqwn84SQeEVx78vaiYoj09lG5UUiqlabRfVNMK4q1PUeomaHkef
	iv8jwuilb8qe5h7aFPPuld3shFYPdxuiSZlydP0wVVvELdSNQz5HfOk8IUqaBEY6Ozu73vCeiguFS
	ILUJWZGecZI7QHblnOcko6G2D24hYvgPjZMBNtH4nqu+EkfgRkG7EMk4fZmWfvcNuxcTvBAGZbYV/
	LC9zreCk+JHxzBH+AlI05Izvw2iIhAFZFwXEYwZUcf5fEGdhd3rEJw18P1whlFefCuKA+b7IIKX5E
	gMb+f1lKmCaEXbDR44Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCFvo-0000000BdN7-14BT;
	Tue, 06 May 2025 10:53:48 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCEXV-0000000BMGK-01F5
	for kvm-riscv@lists.infradead.org;
	Tue, 06 May 2025 09:24:41 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43f106a3591so5115115e9.3
        for <kvm-riscv@lists.infradead.org>; Tue, 06 May 2025 02:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746523475; x=1747128275; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mtrK30WSclX8+CsTIEESOGs2XijMelv6Z+mtcK6WgL8=;
        b=aBOABMHc5n6vbUniRIziOBj6PgRh+K56RI5HC9VgLamVNPTHW1mMa8sWPJaK9g8Lvt
         swQLGvPQTnpozdXi97jcS0NOngR4mHDr3vnYBP6HoJwe3sW1X65lqFDIG7g2nWjyfx8b
         p0uZkFPq7HhueIGQ0Vi4JvoSYzNDILU20gbKGrXEVT9wWsNTWwK3vMyswgHfnXOyrau3
         +8qQy0vFAQ9nuzM4ybfhIuKdJtbQt+35nIEqsX97DwF7jDL8x0gI84sp8SfePxPHsuHa
         nMcdeoKO95ydZIDJMulSLTY1Js9Nea2ntFOSZUyrFUZHEc6NI1lh4GX9Y68ob751e1ec
         A1BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746523475; x=1747128275;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mtrK30WSclX8+CsTIEESOGs2XijMelv6Z+mtcK6WgL8=;
        b=O+eeNoxbzReKCgwfXXPPp5jWv5pG8Uflf7w0LJjKdsa5XI+bzqN74eq78KkunrdiVQ
         hxgBh77RTmllKDkcbqTLst7tOVHTZcWUYYo6/OvBbq+Xwr51Zt7+3Nt8u5/jUgh+47TL
         TH/e4Ql/ETnxHYMc14LjwLClmEVI/7DIHd66ME1ra6gp7oTGcqffnA9M1I4cycRe3dYN
         hr3JkALesho6GaEBeKesjX+esCdM4RN8XasHyg4Ky0FhiBTcbG1tAofgkeis1GlZbsBO
         FS82JElT5aSjkCmCknMGcS8VCcE+/AQ6NU+KzaP0DSdnBodfIffrIKDE2CABJsh3W2Dj
         2/mg==
X-Forwarded-Encrypted: i=1; AJvYcCXb/GRtEG9ORZJSofKxOXd8egb2daROu2kOzcs1qoB6wVD5woU1UJK2Ql3Zp9ufPtPe0Y/r0BBHUe8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxt4pLUrLfpSXufQVMWlyMXe/KHN8J9MciTE8jhmMcMdVdqBMsj
	yYfAjVSIuVxdZ8hPOETi4TkUAJs0Lx9usMITv+2+a26VWNYtjC9L40Nb5zVi63c=
X-Gm-Gg: ASbGncsZvssUiO6SgfXxJDzh51JRnF00AqFWrgu7agyCVFkRGvL0QvdO4/VZPJsKbSN
	+lQr4yFZB+eb9aQ+7VTzWyu3+45pSoGs8FuZnwGNjz98cW7SFvoGpnJk8AKRC+jtCleRfgKRVwd
	6ng4QK6WopwXFPj3PZ8obnbB6TDQjXUBglXBaG7Y9/75nnkZc+vb/8Kt903q2PL2Hpc2q2MiEZ4
	LVjTU6mRtBVZLvo68xXClXx/VISH2F9Us5tRs1bDbzsk0vTvtCz2QlTzZr0H4z5gpNz50s2mhwT
	zLC0WorrxShKLoToupnMwF/CkjbhiOmomrnA3tHckKd8+5M+
X-Google-Smtp-Source: AGHT+IHZgaRK6ml9AWyse65POBkzHsZ8Ut+BjX7oVJ10RpUOC/PC4jjz2MMApvtA5diNrjCKmwAdmg==
X-Received: by 2002:a7b:ca59:0:b0:441:d244:1463 with SMTP id 5b1f17b1804b1-441d2441701mr2017735e9.0.1746523474923;
        Tue, 06 May 2025 02:24:34 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:d5f0:7802:c94b:10f6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b8992b4csm165890855e9.0.2025.05.06.02.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 02:24:34 -0700 (PDT)
Mime-Version: 1.0
Date: Tue, 06 May 2025 11:24:33 +0200
Message-Id: <D9OYWFEXSA55.OUUXFPIGGBZV@ventanamicro.com>
Subject: Re: [PATCH 0/5] Enable hstateen bits lazily for the KVM RISC-V
 Guests
Cc: <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
To: "Atish Patra" <atishp@rivosinc.com>, "Anup Patel" <anup@brainfault.org>,
 "Atish Patra" <atishp@atishpatra.org>, "Paul Walmsley"
 <paul.walmsley@sifive.com>, "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Alexandre Ghiti" <alex@ghiti.fr>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250505-kvm_lazy_enable_stateen-v1-0-3bfc4008373c@rivosinc.com>
In-Reply-To: <20250505-kvm_lazy_enable_stateen-v1-0-3bfc4008373c@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_022437_076232_5D425715 
X-CRM114-Status: GOOD (  14.71  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

2025-05-05T14:39:25-07:00, Atish Patra <atishp@rivosinc.com>:
> This series adds support for enabling hstateen bits lazily at runtime
> instead of statically at bootime. The boot time enabling happens for
> all the guests if the required extensions are present in the host and/or
> guest. That may not be necessary if the guest never exercise that
> feature. We can enable the hstateen bits that controls the access lazily
> upon first access. This providers KVM more granular control of which
> feature is enabled in the guest at runtime.
>
> Currently, the following hstateen bits are supported to control the access
> from VS mode.
>
> 1. BIT(58): IMSIC     : STOPEI and IMSIC guest interrupt file
> 2. BIT(59): AIA       : SIPH/SIEH/STOPI
> 3. BIT(60): AIA_ISEL  : Indirect csr access via siselect/sireg
> 4. BIT(62): HSENVCFG  : SENVCFG access
> 5. BIT(63): SSTATEEN0 : SSTATEEN0 access
>
> KVM already support trap/enabling of BIT(58) and BIT(60) in order
> to support sw version of the guest interrupt file.

I don't think KVM toggles the hstateen bits at runtime, because that
would mean there is a bug even in current KVM.

>                                                    This series extends
> those to enable to correpsonding hstateen bits in PATCH1. The remaining
> patches adds lazy enabling support of the other bits.

The ISA has a peculiar design for hstateen/sstateen interaction:

  For every bit in an hstateen CSR that is zero (whether read-only zero
  or set to zero), the same bit appears as read-only zero in sstateen
  when accessed in VS-mode.

This means we must clear bit 63 in hstateen and trap on sstateen
accesses if any of the sstateen bits are not supposed to be read-only 0
to the guest while the hypervisor wants to have them as 0.

Thanks.

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
